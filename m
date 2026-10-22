Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675797;
	b=bYHEEhBhJDGyq/xyqYYqnT9k0UR16ATiVK7QUOXkuOXFhN9YjhZCNkoFR2icVypG2qNz
	 nkrrTxtD0rc75C3Vrxo6eAeCh0am3VSDTYdPINSz9gDuRBUybHMfWVn5phJa4CFiy5NkZ
	 sSMMLYxBzmVoCnqK5SulOKvMaPiuoPqgleuOuWnEwlHaqVe7/sFiTE93D8iznjUyQaRBl
	 aLDm9Wv80LY/b17MhddKLc5mwch9LiGmdnrW22u4LhZAEIDqjbybw1xlT1V29CyJjSzMm
	 7h6ZqNkjo/g2t0jjCsiNMNjoQiWcfVXdVi5qMTetc/JLgzdPJdqkHDHYYg7mFb1R7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bhcOKx3y9myNmTpXc9YX9Stk2q4QfYaHlPOapeiAi1c=;
	b=GLrLEW3Q+rHg5ffHwVohddux9dklfM7YH4DbPwIXGFpIBzc2+0c0E20ObEXMZHANKNWl
	 Kakpn1eRzbRgca4SVxxJZEHikUICo/UGZV8KNSgyjrlyWzazyNx7KTARRpKoxSaFWiwqY
	 vRBE4KsVi2h31PydbDEgBQKnY3fWEmeXLyk4yPXwCNNApZ/SOLnd35UIAvWYyUzFfDHpH
	 X5SOKr29FWhROZFdrZjY4w3XQdE3yYnY3lKxa8tWZzJ18FsJdCgY7ltAMWz4qfY3T16HK
	 bjkfGNyYG5TkVgpTNHmWgzKuigcFKQ5WwegytyCJEVhUXkYI52e4uk+9Rm0Ce8B+AmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V4OXBO7p;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093D606A339
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C093D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V4OXBO7p
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d885929so1442988f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675795; x=1793280595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhcOKx3y9myNmTpXc9YX9Stk2q4QfYaHlPOapeiAi1c=;
        b=V4OXBO7pad/WHmSUYZkbDd374omgJ+uy+HpdU4tytFK/4k5pNmgkn5lIBqOe9svsji
         +hP6G5NNwEydF34EhoOPeAKCNdXyQJCE/s5IsskM6TswBL0CXP8w+RL1fB2jrzF5MPdr
         KW/gyRFF7tlgiUbsStRjnfRhaD3TEOkbBvroLmk9lcWLv/NOl9TXjZHsogQC4cY6x+j2
         L8Rt2YrxZWpD/8hC8x4hWSnKtgqepqts9oSgT8U+DNTBRShni/J6UmUGmxeAx4nXNApI
         HYu8yF+keScZkMqFsQpBcZBjinR+EfIVi75Yca4TZ1Mst0FhFG2A16lPsMOL4iz0NnAq
         JeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675795; x=1793280595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhcOKx3y9myNmTpXc9YX9Stk2q4QfYaHlPOapeiAi1c=;
        b=sb+fuCJsmNvmPMtLCCT0n/NubFwDWxMVGQW9/3uuqncFHD5q9b53pMaLF33az5A7I4
         RP1NvjLZZoZw7YeNN2KayZslV8FDsFzRc7jM/RpaTmCGCXsZ6I2cE6wbFHVBHITtdx2O
         WaHEMXJo78rk7iXCEuStHK1bqCY7iLLxgl8nOmxoCREM558cJ2ZTTSPqdIuB0QZrRajo
         7gmR3G1GJ3uSoNSszTtxIH1i+pnck7tFBhCrZbSRYDDiMHkhtpKvLngyiWnnjq0rW3BP
         ac6AtjtMS7xavwBtSPAsb5Ua7djaZ7myCS06FIZnwZlHNLjIhwf+oRvOZTcCaqAe6Rtp
         0GFg==
X-Forwarded-Encrypted: i=1; AKwUvBxnTf46CKm2UVWt00wYQTIGAslcvoL2OUhATE8TXmXPsXbJssOIdJMn6SuPeW14hUiWNf3E60lPGkb4Bes=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSUu8kRT+ZPWaYZ9RnckiiNLtRjnBrMtfkyUDkZ5qmuaL3mf4Y
	uf2roBgxHW1qwyjrobDNtm02HIbFaU+anat8Ax42dzzjrmQjlifA4G4K
X-Gm-Gg: AYBFou3KucfHVnfQeUUMyVoap0/DuGOqsbn5bHc9klRKnumxWWIvi5qcGOegLfSUr0h
	TxdPWGn+qcV4uI9+ZSG1kODPQ2TyguyHiDRvCHkyqWe55Shc9o4PqqMruthMtSkjPlkWyQzjWur
	hN9cV87PAn4nuNoBnQlXFfyYfb+uLcvQYs7qVKSoHSvXR0C5PNzw4OW7rSYWtRqU6CRsjmT/S6E
	lv+pSytkqjPkA/RW5vQUVDSQlnPDzHE6i3KS89y3YHykYK+HUZY7TwwpxSUgeCYCnHK6tEdh8m7
	HCG1E2g9jy9u8QnW16GBmwV4MHLXocMXxeeeyMPUBBq0tKa24DDcqOyZpqtPDF5kj7yij1qzjT7
	HHTzA0z6uTOONVXTJOvXV028qT8IJa8g4gmtAVmlZPBsnCtZVEZ5tD4b7Muc1RGU+Oe08KuSrm0
	MUdsAuVStpX0Mro+LnnJbHKWrBRmTt7FC1jLRRd/vyHVi+IpWZfwAFQdE1NRWD6169MnqCecUvU
	Nlskq/M14p9/HQwyGTJQa0zSFSxoDh3bRlfk66mfKu371y1x4jqKpNtRy7XPKD2RqpSPGZGunUU
	gahp+kWijL2kEdPJf8KZA3b63rATLOsouT5PLnHU8F5HWA==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr113093645e9.16.1792675794933;
        Thu, 22 Oct 2026 06:29:54 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm108832715e9.5.2026.10.22.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:29:53 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] nvmet: pci-epf: report transport errors in command completions
Date: Thu, 22 Oct 2026 15:29:32 +0200
Message-ID: <20261022132934.3592924-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132934.3592924-1-parri.andrea@gmail.com>
References: <20261022132934.3592924-1-parri.andrea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the PCI endpoint target fails a command itself, the host receives a
successful completion. This happens for a data length above MDTS,
malformed PRPs or SGLs, a buffer allocation failure, an SQ that is not
live, and a failed DMA of the command data. A write whose data cannot be
fetched from the host is thus reported as written, though nothing was
executed.

Each of these paths sets iod->status and calls
nvmet_pci_epf_complete_iod(), which then reloads iod->status from
iod->cqe.status. The nvmet core only fills that field when it completes
the request, which these paths never do, so it is still zero and
nvmet_pci_epf_cq_work() posts a success status to the host.

Drop the reload. Every path already sets iod->status before completion:
nvmet_pci_epf_queue_response() copies it from the request's CQE, and
the transport error paths set it themselves.

Found by code inspection.

Fixes: 0faa0fe6f90e ("nvmet: New NVMe PCI endpoint function target driver")
Cc: stable@vger.kernel.org
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/nvme/target/pci-epf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
index 9c28367435a59..099e8766f6d40 100644
--- a/drivers/nvme/target/pci-epf.c
+++ b/drivers/nvme/target/pci-epf.c
@@ -1149,7 +1149,6 @@ static void nvmet_pci_epf_complete_iod(struct nvmet_pci_epf_iod *iod)
 	unsigned long flags;
 
 	/* Print an error message for failed commands, except AENs. */
-	iod->status = le16_to_cpu(iod->cqe.status) >> 1;
 	if (iod->status && iod->cmd.common.opcode != nvme_admin_async_event)
 		dev_err(iod->ctrl->dev,
 			"CQ[%d]: Command %s (0x%x) status 0x%0x\n",
-- 
2.53.0

