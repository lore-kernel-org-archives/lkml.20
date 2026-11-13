Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567783;
	b=4UmSiKJYkbHJDx1jsEcwRg36i4KfFYuYlNnVcKlPv2tRnhiySDYBL/fWSILvG1WhG/bP
	 vRrVodGJ/L/9vbdEyzFVsuC9Wb3rkiDiCz/g1yOf1ZprqOZ3V9rW9buau9vd6wdovNOl9
	 iLOBON1VUfmiWkmrZLXo6t9K1uHhpoIIHxaFlsmxnpG24L2BRyT/paAEkgJKnNB0Eyr6+
	 7891jOu6hkJGj3BqOXZMO2iQdnsEfrpBIE0PhoK3QoMf8cKsWavAkjwPCmFve7TrO/6Hk
	 GJd6nKca57uHJV5rd0PpN1/BScCkiAf6KmFS+PXIlLQc4t1PVKbpP6u5ZlogCSld1XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567783;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=0jtrBX8FtvSLkOBcHo3ilWdn8svmU2wZqpyXZecbL3A=;
	b=mERJYspBvi6Pf3qwbxz/2hZol8vILC1ZrdLtbEEnKVcRhbOezfWYJNILW6/aVxXMEHX/
	 gjGNcXXOau6yKZitXbvGN3+PPSZZbNrTmA3dmoCwpBukJili5cc0T4f2SoKxeoLCUH4dr
	 SiBu4ZbRCx+BYktAYrF2qh/9NvOCy0B6+81+gGPSVd9AX1BU9fPrLhSpqxqWHRXwVTdSf
	 mJbpZda3vuXCOlOmlqM3clNFW2lnrR1g8XZvMiTaQTn90PVPU/TZd5O1Z5QBoYDnJ2KIv
	 +m8Bs/dgf+Pqi+jgA+YwXzcBMOOPtCqejG+KC0Jhd4HPMG4IqP2HOIPyUeQLUYtpJRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=scst.dev;
	spf=pass smtp.mailfrom=scst.dev;
	dkim=pass header.d=scst.dev header.i=@scst.dev header.a=rsa-sha256 header.s=mail header.b=OTRA4icC;
	arc=none smtp.remote-ip=51.250.60.161
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [51.250.60.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108FE606B241
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108FE606B241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scst.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scst.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=scst.dev header.i=@scst.dev header.a=rsa-sha256 header.s=mail header.b=OTRA4icC
Received: from mail-nwsmtp-smtp-production-main-77 (mail-nwsmtp-smtp-production-main-77.yp-c.yandex.net)
	by forward101d.mail.yandex.net (postfix) with ESMTPS id 7441DC0056;
	Fri, 13 Nov 2026 14:02:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77 with ESMTPSA id m2T1LaofYiE0-Hlo0eWK1;
	Fri, 13 Nov 2026 14:02:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scst.dev; s=mail;
	t=1794567770; bh=0jtrBX8FtvSLkOBcHo3ilWdn8svmU2wZqpyXZecbL3A=;
	h=Subject:From:Cc:To:Date:Message-ID;
	b=OTRA4icC8TyQw7bedOfZ56n6WX2UnOYyEwLgWD6ztbrfp91c3Kdg0mHdDXmai9dr+
	 xxKMCwg1DQcwugQpnD4c4poUQW1ONjjV6ywhlFHtSHiQeSy1LyuakkveHvJLtmgID2
	 i8krOWdCKX33zX8Tzx1XDZHswlg9dcd7X4ZtgNMw=
Authentication-Results: mail-nwsmtp-smtp-production-main-77; dkim=pass header.i=@scst.dev
Message-ID: <0099f610-a48b-4557-8515-e4df444262e8@scst.dev>
Date: Fri, 13 Nov 2026 14:02:47 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-nvme@lists.infradead.org
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com, kbusch@kernel.org,
 linux-kernel@vger.kernel.org
From: Gleb Chesnokov <gleb.chesnokov@scst.dev>
Subject: [PATCH] nvmet: report backend transport errors as path errors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The block backend maps BLK_STS_TRANSPORT to NVME_SC_INTERNAL with DNR
set. This discards the backend's transport error classification. A Linux
native multipath host completes the request before considering path
failover, even if another controller can still access the namespace.

Map BLK_STS_TRANSPORT to NVME_SC_INTERNAL_PATH_ERROR without DNR instead.
The transport failure is behind the controller, so report an internal
path error rather than a host path error. Associate the error log entry
with the namespace, as for the existing access-denied status.

This allows otherwise retryable native multipath requests to reach path
error handling.

Signed-off-by: Gleb Chesnokov <gleb.chesnokov@scst.dev>
---
OpenAI Codex assisted with the code analysis, patch and changelog.

 drivers/nvme/target/io-cmd-bdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 72618dced191..da640b8e8241 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -167,6 +167,10 @@ u16 blk_to_nvme_status(struct nvmet_req *req, blk_status_t blk_sts)
 		status = NVME_SC_ACCESS_DENIED;
 		req->error_loc = offsetof(struct nvme_rw_command, nsid);
 		break;
+	case BLK_STS_TRANSPORT:
+		status = NVME_SC_INTERNAL_PATH_ERROR;
+		req->error_loc = offsetof(struct nvme_rw_command, nsid);
+		break;
 	case BLK_STS_IOERR:
 	default:
 		status = NVME_SC_INTERNAL | NVME_STATUS_DNR;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.0
