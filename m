Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304896;
	b=bFNm3OQ/Heo1ZCKzC1/1JJ0Vd+uxwfqDvyXR5g4l8reuca1dlqfh6ETKpzjbG794mzZ2
	 INQuF92DkHMF/xrwjf87iZiLjEa8xdaSBE2tfP4BicpA0EnWtPfndS9w7Agee0SqIvZ/V
	 eeuERj5BTv6XN8BttBPQM192jsd3CR6+scYnCWh7Y8UJOIXPP4KLLKeQSLommpl/uSa5F
	 bEFxoDKkUttxpGgGeM1BKYiwjU+YE/xb/yFFkrBxrHaP4bbMxrKFZHUt/KaWa8b3mdTYK
	 GJ1pN64fA03Inmpjlvtd6rs02GM6t27hSWb89fmqDpYjaWyT4xMPAVhn5kPunYcJ9Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UjCTRKy+7U4JN1Jcu/EJZJuoaK4wFbRJ3ehthWXUHa4=;
	b=GUQdNqnfEFb+9pHv20J6VowG+Ov76stpw5526ZmkMoCpem6kgVsUKAvLB85fNWJmb1/J
	 TZUzvxFvjVosmQNEToCsxNvV5jo3Ns1SZjrTebcmB/E6D3BXv4ez3OaVyGzUwF3IL+JCk
	 neet/eV45e4eUdZOzjlXB0x4tHVFnnDAddpcS/7K5/iijmXMKoYLPUm49Jz2/tKVH6K4W
	 eFP6SpNYD6OryxpaWJm1/kq054dXLgGYoXi0IPeonijUOalHaVR/9TAFsmKgVUgWIKXrr
	 Cf3FSYv5AOyF9ypPx7ZjNuF8XymdImqGqg94Jze94GdKTQH7ezNFy/MOC4fwHlXsP2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yS2QlVfc;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033360A6F59
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5033360A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yS2QlVfc
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-372bdb942dbso2454049eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304895; x=1794909695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UjCTRKy+7U4JN1Jcu/EJZJuoaK4wFbRJ3ehthWXUHa4=;
        b=yS2QlVfcg8XffR0lAArLohLP4PMpR/PsKBqAdWN1aFV9frY8bq7evJVYSwZ3OsNVgu
         dEqTHSEeccXWLD4RKXCKgGnDMGvrVCmYmLjd1yTIbdnsqRiaT09YXIaqhTXhbb6OE222
         jSBUuMOw64x9d3TUsjZnWhkiChSCEP7SGSF4/ep0s7qcZSmPZFMupGmbgSOZOdb2Jkgv
         y/ELExShueM+fSv/QoEmkRIMC7Wv38bOsSyMtoc9gOdORFeZ9S4i1+gM6bHOSuoHzMQv
         u2hDMGVGaBIH/mZ3jdIYYn5BQza0xjb10XiHKP1cyZLob1Jy56I0Gi5UaDsO6RYWbfUs
         WKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304895; x=1794909695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjCTRKy+7U4JN1Jcu/EJZJuoaK4wFbRJ3ehthWXUHa4=;
        b=DkKfw1sEvatyATqiNCOWvFInlCyS25dNXHjj8zdZQPccOGEm4Lm1CGZaMRmAUpDHDh
         3rK1AC7HTERCkfVTX7A8HRrln+l3/3xGfPKHwgdj68jkBgi0BgUZFBlqd7Xaez/h4OrY
         lKzb7mkrMUYpgDpE1xf+ItK57cxn1Px3HJLX/0txI+rfLVzwECJsZRAR8DuZzujJPzKy
         pCagBw7Xo/ZxsSMiOKSmdDQkA+E78J/6O0roGqCTTIjgHBvcztgyGpew8bc5DPRrXxLu
         7TPv5IGAAJ9+BAvRxupSLmp/+HcZBx5Zx8/A0Ogjk+Vg6Cza2t2t0ro8jtMpbO2xG/Yz
         gLuQ==
X-Gm-Message-State: APuU4Z84HROgz4y038EMS7rXifqYw9RXYes57NU0qWDjrNp9G0xVvKJr
	u+/xs5VH0e/J52KhheZTs7Z87OV4uJ4ln/6z5aXO+82lXWtbdD3ZJ9yk
X-Gm-Gg: AYBFou3kVYlCAR2GoRBlIduKBPF+9398LqGj8TiiicelT5wBguhxipvTiggUq7vGMIF
	+nQIXslZpOrRnCvwwvRT8xXlTlGEUAGyE9qalU50PCLbQxhXpjUbWO1kfNt7Pp8MwXA1+r+20cT
	t2lY83VYnDZj7yjNQS35PPPC59wOVbqSRXSABcscLZ2D4GtS7zx0kgKkDsKqgsjNo7g+vSQx7tR
	Pxq2BLCy2AtCwTIaUNelvAW1s13pJeHwMaK5n/cwoNnInLauW7N1p4UEaAGcbFqtsCK46KkFvnp
	xpqu/tF9quDN0e/KdoNvpnBCtTiWdcF7s1h8n12Wr/iYC7ckv+CROEdWvhWdVaLcTYKjwz1dhl6
	WyBOpJnJ0qj7m55gKkRD0EQzdgpPBr8XXTRz2FgeWhCyH75Yv41I0iabJta7LnuRRVvRJd3u+Ga
	yse2MHOu8GIzX1SQivV///1IVJS40MMBlB9w7/QR+8JJt4+uJlnOf0itlfR6DDjXp1vTZaPaETW
	h+T+FayAeuwNv9QVN3SiRsnrNXhbsxjW3FimXKyT4wmCwiIBv7+EEoCJ7p8qm0iZzPfXrVzvOdQ
	NQ5Oi0pKQzA4oe4WP5X79L/zKZ5P1EOCmwlxD3siJ0KQ3AM9PixLhw==
X-Received: by 2002:a05:7301:420c:b0:375:35b4:1dc8 with SMTP id 5a478bee46e88-37535b423cemr2135969eec.32.1794304895316;
        Tue, 10 Nov 2026 02:01:35 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm6237197eec.7.2026.11.10.02.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:01:34 -0800 (PST)
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
Subject: [PATCH v3] nvmet: clean up DH group state on initialization failure
Date: Tue, 10 Nov 2026 10:00:58 +0000
Message-ID: <20261110100058.4652-1-sreekuttan2156239@gmail.com>
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

nvmet_setup_dhgroup() leaves the DH transform and group ID
initialized when private-key generation, public-key allocation,
or public-key generation fails.

A subsequent invocation with the same DH group incorrectly
returns success because the existing transform and group ID
are treated as proof of successful initialization.

Release the transform and reset the group state on initialization
failures so that subsequent attempts can properly retry setup.

Fixes: 7a277c37d352 ("nvmet-auth: Diffie-Hellman key exchange support")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Clear stale DH key state when crypto_alloc_kpp() fails during
   re-authentication.
 - Fix the error path when crypto_alloc_kpp() fails by returning
   the allocation error instead of incorrectly reporting success.
v2:
 - Consolidate error handling in "nvmet_setup_dhgroup()" using
   a shared cleanup label to avoid duplicated teardown code.
 - Add Fixes trailer.

 drivers/nvme/target/auth.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index ccba84b1344e..33f2584973ec 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -97,6 +97,10 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 		ret = PTR_ERR(ctrl->dh_tfm);
 		ctrl->dh_tfm = NULL;
 		ctrl->dh_gid = 0;
+		kfree_sensitive(ctrl->dh_key);
+		ctrl->dh_key = NULL;
+		ctrl->dh_keysize = 0;
+		return ret;
 	} else {
 		ctrl->dh_gid = dhgroup_id;
 		pr_debug("%s: ctrl %d setup DH group %d\n",
@@ -105,9 +109,7 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 		if (ret < 0) {
 			pr_debug("%s: ctrl %d failed to generate private key, err %d\n",
 				 __func__, ctrl->cntlid, ret);
-			kfree_sensitive(ctrl->dh_key);
-			ctrl->dh_key = NULL;
-			return ret;
+			goto err;
 		}
 		ctrl->dh_keysize = crypto_kpp_maxsize(ctrl->dh_tfm);
 		kfree_sensitive(ctrl->dh_key);
@@ -115,18 +117,26 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 		if (!ctrl->dh_key) {
 			pr_warn("ctrl %d failed to allocate public key\n",
 				ctrl->cntlid);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err;
 		}
 		ret = nvme_auth_gen_pubkey(ctrl->dh_tfm, ctrl->dh_key,
 					   ctrl->dh_keysize);
 		if (ret < 0) {
 			pr_warn("ctrl %d failed to generate public key\n",
 				ctrl->cntlid);
-			kfree(ctrl->dh_key);
-			ctrl->dh_key = NULL;
+			goto err;
 		}
 	}
 
+	return 0;
+err:
+	kfree_sensitive(ctrl->dh_key);
+	ctrl->dh_key = NULL;
+	crypto_free_kpp(ctrl->dh_tfm);
+	ctrl->dh_tfm = NULL;
+	ctrl->dh_gid = 0;
+	ctrl->dh_keysize = 0;
 	return ret;
 }
 
-- 
2.55.0

