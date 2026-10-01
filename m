Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973A44F560
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834493; cv=none; b=i0UKLyW2b9pTltS9ENuEpbeivrVOsPiAtIxzHOHZmy1jrk9n+kA+ZyNVw217NRXAvTrtq8k+ttg32+1HRqIPtNQI67L2ZOQdth3AwxdKVlY3Jzd9Sv3Y5b5ZxpO44LNENIO1vlSWg3vYZ915EZlTBtS/G9H/EglJSov2xVaXeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834493; c=relaxed/simple;
	bh=s8QHmFfdYbxj6LfMi5s9V6AqzJvC4+y4v4UsIH3ShyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BerL25yUgHWFbjlP3w8V5LqNzaBSBTY43E65MKwzMKsrEE1w+cY+1nbA1X2nVsXc9luVKghGLIrOdGaTEWbwww5BY3+bp7C/pgbFsi80lA4xsjLaY++6gRA1roW8KARvCt1NM5OQr0q1IvJXA1xQmkCajlrnG9HspQuu22VxSKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=JqPrx0lY; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="JqPrx0lY"
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261001060116fb16c06f570002075b
        for <linux-kernel@vger.kernel.org>;
        Thu, 01 Oct 2026 08:01:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QRo8GBuRiwb3EQHOfAciTtVSfngLutrv6EYFrkZSa5E=;
 b=JqPrx0lY8R9IanCLnR1xelLAhlP4JRa8Y2bP784ejWYXKWALHvHbZXR68xaVU2dMtGHJYY
 wCRu/UVwc6zhsyp6cklLWlNr/mIHJ4DSr9UJR7nVOhGLM9m8uBpGmI1AKW5h1JGVMjOpA5r2
 kS3EmNJ1rxzUZk9bGUNrMxzcC37NzKA8dyQSSJpskBpemtjs6giVUSkA20o/e4HflM2PkXft
 MkijoZHfo0cfWICoWGhhnaEfUWwl48rAfoSqhij2MiMNbGrQv7Zi0DgVUvqvenQrHg6bILlj
 yZ73e130QkfEA7bf2CVbd/iVWzYNFhTtXEGGbUwrNzy2ZelVqoBEhXoA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-integrity@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jay Freyensee <why2jjj.linux@gmail.com>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Nayna Jain <nayna@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] tpm: tpm2_probe: propagate transport errors
Date: Thu,  1 Oct 2026 08:01:11 +0200
Message-ID: <20261001060114.1582092-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

tpm2_probe() reads the protocol version from the response tag and is
documented to return -errno on failure, but it always returns 0.  A
transport error (tpm_transmit_cmd() < 0) is thus swallowed together with
the intentionally ignored TPM response code, leaving TPM_CHIP_FLAG_TPM2
unset. A transient bus failure on the first command then misdetects a
TPM 2.0 as a 1.2 and the probe fails on the TPM 1.2 path:

  tpm_tis_i2c 0-002e: 1.2 TPM (device-id 0x1C, rev-id 22)
  tpm tpm0: A TPM error (-62) occurred attempting to determine the timeouts

Return the transport error instead; rc >= 0 still means a valid header was
received and the TPM's own response code is still ignored.

Fixes: 94e266ba1fa3 ("tpm: migrate tpm2_probe() to use struct tpm_buf")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/char/tpm/tpm2-cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
index a94f4395c198a..4b2bb2ddc321a 100644
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@ -483,8 +483,9 @@ int tpm2_probe(struct tpm_chip *chip)
 		out = (struct tpm_header *)buf->data;
 		if (be16_to_cpu(out->tag) == TPM2_ST_NO_SESSIONS)
 			chip->flags |= TPM_CHIP_FLAG_TPM2;
+		return 0;
 	}
-	return 0;
+	return rc;
 }
 EXPORT_SYMBOL_GPL(tpm2_probe);
 
-- 
2.55.0

