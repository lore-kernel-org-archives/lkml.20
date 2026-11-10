Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297484;
	b=0yXnhL/J0TAaDesYsg//qX+iagQWf4zB53DxZta+NCZ/Or6/A6+/bSFEescZoWeEghXP
	 5ix4ARpYGO4Y1gflhkorhD2g6gmQyx9RaEyFCjXGpxOzgpkdZoujlOgAq6esFHv1m2ye7
	 zvRLfO9cGzRAswJcaVicIj3fgWYS/2QnGK0CWDTZia2xbenc9GExV27ryVDRGBUKPaLJt
	 NLb1j82KqrF+239oAlG528lx2H58bRTNUF4uBaGzCJh4W/e9FyJAUgWmhWESKfYwCN1g9
	 rtToc++ZATXaWkoVxTGNeLIpDYPm+gH19/tgQvI6nPXajMySaRidbAvOLb4Vd4jZ4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=b59TztVWp3GhBgQqkWL6K94kfiqvh6QYhx7OQRm8o3k=;
	b=i029VGlm7xqdlP/bEq422n18LCKhHAzBGysPNBt2OakGZDVgQfy+pqZV/HwLwAXjcyGN
	 Es4N7E9pSLW4xIV1ceMKE9BtkgOWF2/vRdeaM6UGxcOKDK8KwR+WZ1bPymw7NhkMHGBhY
	 J+ZT8m7hXRbARPvTwUX637z1K7TbeCgEUcEanHpR1Fj3itlY8XJLETdkYZPQNMsFa2Fvq
	 YajckAAqI5VLu3lA4PAi719h8yS6o1VfKp7jgZAQrfVNvuDn4LhOv9iRn6BXwTtSrw3QS
	 g7af7a+Qbr0E6pKpyWZIFktuSV/V6bIfNOB/m6zkjjoy1SXGhncqsCa/IZDgfSrYzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nx3iIFHs;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDC5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nx3iIFHs
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1931ff67a29so828107c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297483; x=1794902283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b59TztVWp3GhBgQqkWL6K94kfiqvh6QYhx7OQRm8o3k=;
        b=Nx3iIFHsvhSI4ccZFYR54jqk92ZsIVB+3qX4MtH+bTvTL6a7dI0ouTLwab+9oTGSHk
         /Y8RnhFZCACRK01XzY4aoErIHQtwand8i+Fe/0MrjCznDFH7RAukMv+iVdpw8g2cA40O
         W05q5wtvo3a+KoF+gox5g7rAZTan5KlRH3aHMA0PZCgA8LQatvvvKG9fGbcCi3iY9SAu
         DcxPp/jprI9TUX95AeFYVuz0JfwHHhUlpbwWj61Q6upOjl2knrkOYpnNVN3ShwjnooZb
         FQt6wdxxpVo51Nn09CGeiTap290itEpwUvg6pYyR6GmV1c0l6HkQpKYgwfV5HpA66ekW
         6PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297483; x=1794902283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b59TztVWp3GhBgQqkWL6K94kfiqvh6QYhx7OQRm8o3k=;
        b=PL82uCRDnT2sxNatvk3GxIgTEfLAA9lbosse0c3A1umAHFuLhol/BIIDCC7hiEj9lW
         pItBVC5zbRgkpPivtm1GO4LoYYjfSOF9KAOlP3Vh27E4rl6VDbNkpF8A3twscK6+9z5e
         PrydT7BvUINtTjaaegXDEGMRzkfkcLPN+7r8KrJro0nYPvGBPkTqUMbl/qacjJiF05E8
         OW7CXWMNQJA0WmYvEkulW6sJm3FeAaPxgbuJ0fQGzrx1MweTZr2GZJA5olNS1CmOnfQi
         nZJQCaYASApH0gr89zNkIhGp4JOG3hQFjD7Dfp/br0Qs6BkCOvzwA2PeRibHAZEEsgat
         izJw==
X-Gm-Message-State: APuU4Z9Zpoglif70CcTBB8AeLWw7QrTqxewtzp94fCJoiaT9sjCRSI5C
	jtx1KzQ09PEb+xWJfJuH3B9RKJucIK6ONu2N4mR6oim0XR8I6Hco0UvU
X-Gm-Gg: AYBFou060kyixFp22gs8E8+uT/qN89NyaoOQQZhIwTtL5p5HFd6Rq6z5Ff5XZv1Acx6
	H80ZKto3h8xM6qS3zzugAnwCJQ9LMYazi91rAf2KR9SUdBcH4DtYtc8SVUkbS4+l9aEwjVW5MY3
	zza326xFEgEx1m9H37AP7xN0bd1gHNpSksMIuu20C13qZIJf2bcvECVJwcOZwvOWHX/JBPG+mfK
	WZLDxUrw9opOuVX1RONMBTNoAvtu4eLDbsedXBbvqywUPPtcZ2M7u89XCtAHcQGJvweCN636P68
	q8MfM4RPKYWTJjRnPyDVnme+xU76Rdwk056QFHb3CrWPojKmHYO44PUI8J8C9vC7N8O36aSKMme
	uR6Imo7Be0CXRLSoJEoeqOzhPmtdR2ffCIil28XTB+c9lNzw1RFjITcv583tXSFOdPASL7ey4d9
	y9DphdKPpa8ca6OTO71bMpPzKZpWsrou2HqDHHAe4L4XuTF3xrv4o2Kj6svEOCzASKZV2cz1hYH
	ON2sy4gI3zZhVrqW15XeiveJF7kBPNkcAsbnJtEIn1Sc4whnVPi4skE+NEFX96NWTxOSvBLZd+u
	oRbKZbXIwVo4IfcI+4y9cA/tn8LoAHbMNgMbp/6pB0CDO0kBUxPE
X-Received: by 2002:a05:7022:3c08:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1b3b6057602mr2424972c88.8.1794297482931;
        Mon, 09 Nov 2026 23:58:02 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm4571441c88.8.2026.11.09.23.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:58:02 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kbusch@kernel.org,
	kch@nvidia.com,
	sagi@grimberg.me
Cc: linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] nvmet: synchronize DH-CHAP secret removal
Date: Tue, 10 Nov 2026 07:57:33 +0000
Message-ID: <20261110075733.2578-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The empty-secret path in nvmet_auth_set_key() modifies and frees
host authentication secrets without holding nvmet_config_sem.

nvmet_setup_auth() accesses these fields under the read lock,
allowing concurrent secret removal to cause a use-after-free.

Acquire nvmet_config_sem for writing while clearing the secrets
to synchronize with authentication setup.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/nvme/target/auth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index ccba84b1344e..8fe521690ccd 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -26,6 +26,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 	char *dhchap_secret;
 
 	if (!strlen(secret)) {
+		down_write(&nvmet_config_sem);
 		if (set_ctrl) {
 			kfree(host->dhchap_ctrl_secret);
 			host->dhchap_ctrl_secret = NULL;
@@ -35,6 +36,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 			host->dhchap_secret = NULL;
 			host->dhchap_key_hash = 0;
 		}
+		up_write(&nvmet_config_sem);
 		return 0;
 	}
 	if (sscanf(secret, "DHHC-1:%hhd:%*s", &key_hash) != 1)
-- 
2.55.0

