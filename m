Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303088;
	b=uUxNbAZwdqZaMhhshqzzfmnxyOCxHJCMd89+/BdVCf+WxEokOtGWy1EFCzQCiplGAXud
	 YpCjk91XYnuOBYB77hBmDJkbON72lmyK4QM4ibPw36rlFCFzE6kmogZ5M49NMEXMRqugr
	 1cxau4xwA9si6ZOotTp1QvEdUElwZqVvK42Or8ZcL14DHMe9Y9kxEV+iOGAirTwY4Ba4N
	 BVERXOoHfLT0FRezcGJ6zS6AN5QFAQYtefas9TUzkT+QxENeOF91OdGbgLCrroGBz+dwk
	 oKlWn6IptXxLBGQ8jpbXELQmUP7FZbw5o7mry75bOZTPQC7KNKqGWLL5rod0rmGIT1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YLlZuK32JaWyLywcZsk5CvR69cakJjXk6LbjdCED9YE=;
	b=r7eBcV9BImf1UXMkPCRe4T+ydJjM9a4bnKZ3x7O+F1MrNVpezXlsWbKdyPuHJWs3drR2
	 n5ek5jdJK/P14weUNP50RsVnqbD+Gqe392tYZjed1CN1Igf3647iQD/dVTVa1dbCUJl/V
	 /5VzSXDNRZpZsMN5AFYXp9QDeQRlAr3cNW7Xfu4eDgKO7yU7xugf74dfzMOE7w5fsbfP6
	 byxCP36emc5fveq7MPt9GjpXYzUBZIdbWcy4jC3A7S2A6TdreK97bZ8nGYsRkpNR0bik9
	 iNmvyvNPGCC0CjT8vsCBj8sZCXalrE04HpK0Y7SAENIKNwEQquBy6A++5ZlLwz+1NSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XiSvh/NK";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577460774E6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1577460774E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XiSvh/NK
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso2239885eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303087; x=1794907887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLlZuK32JaWyLywcZsk5CvR69cakJjXk6LbjdCED9YE=;
        b=XiSvh/NKqvjOdSVHWiygLlN2DwSz7zhe6HV2OJnaqgbWSmYa8G1rxt8M78TcL/auyL
         oIUA9OZ+WmWa3ZcUhvchkJseJShevm081ZVhWLiluBpEAeUEepxrxpkI7gnwlzEIurG1
         IDssfUiFv8ovo9O+/+qLDvfQjfrh48YlEjFAnoZaTWrye7TWUIVI7ED/zzeg4C2OK42V
         6e4RIpzgXb0A+e8xGXA5a95T2oLk0ly8qKNsP0LoikvhvHYhXWYRv7ugyGktPb21lkUJ
         Z5wquUFXZ+eb75R9ouNjsZ+Abd451+11+Dw8nk5FqDc255O6jaVkSWG4y0xCzECvO9A0
         5XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303087; x=1794907887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLlZuK32JaWyLywcZsk5CvR69cakJjXk6LbjdCED9YE=;
        b=IkGPYABef+BLQQ+QwegtiNvmR6Jpx05v6fiq59nZkUE3lNlhsSd4QzPz6ZZyS2OcNb
         9ZH/3TsV1sz6dccDSXxPAV5UD6IRo5Rjmf2TJiyDA1LBel490TY4/1SuTcRRpIzP46oW
         0USARX/6mCLTuDZj9qIpc45DbbeWUUiKFCSJth6cNL/uzNQLei5yIyMXoKzne36zSoWj
         8+1UYj1zmUV5yvDX6/U8C63+aND5Zr0OoHiwm1N0Eo4l+inMXe/8IewS2Rio9Zwus4Di
         NVqC41iXSgZozwL2wXCuGDahPCcbBHh3dpB5VppbDasoEegybo10PpwCeCQ9D6yn1I2i
         KWjw==
X-Gm-Message-State: APuU4Z/CYFvOKifkmJ8RAPPM1dAZoSTECQn1Y/vblkNR18oNkuximn8U
	pOIozVLiGlwBXCvJZ+uSLtdSJtyb2bg0Qdg6Arobibo1yikfgjf47I6l
X-Gm-Gg: AYBFou21kMWqc3ikd7PZbXiBDPVuioLtCngOLH1zWUs+nE7wlxqPN1vuxSa+vv5TDOG
	H2E5bSYC3X4G+dx/JQfvHdDt2u8Jk8pnc/L5TJ+U91TDjENv6VXMyBLkXclCUxekNS6UV0Cq8ZL
	mA7N6WySWofBnZhiliOiDYUuTTwkCcW5h8x0bD5bcg029yFZ+pYJZPcq41bEOgmT07kdNEYTJ4K
	aKo4mP55Culri+clvraqM8HHjAUo5Rxl/bCDNhNaVwoKm0A0hUblNGrxPRifxpZvtr0MzEG0tcX
	1wlqJ4625x2/S8cxCuhjv95s8ECBfQ10kz8HZrvkuzZokW3UJJHWgI83wGNvpYrnlNHlhbekUcO
	utrs22KdtKJoXw1h8LE1HW1sHKAA5DhqthzSW1c+KUE5MVzpZjP7af99dYQ6yJLc+fdgdsRvt9L
	TTXl8D5IR9Zhe9d3cYwGJyIm0cWo5neZwxixNCZrXxKltlQ9KZFQYx1nUIImk7rZHFEQrLR0mXd
	eLmMJvvSQG8/uzNpFuerK8iUSwEQLlH0AHE0E3YeDj/1HxcIDrU5M52vNwOhi+WWUCPQ4kAYGXX
	D2uaFOnZmlqiFxs9SrWLNgEh8cXTt/g9IJ1vdi0WOVpDFuqQyy/9
X-Received: by 2002:a05:7301:488e:b0:371:7ecc:b82a with SMTP id 5a478bee46e88-3751f659215mr2769649eec.21.1794303087065;
        Tue, 10 Nov 2026 01:31:27 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm6610193eec.14.2026.11.10.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:26 -0800 (PST)
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
Subject: [PATCH v2] nvmet: clean up DH group state on initialization failure
Date: Tue, 10 Nov 2026 09:30:47 +0000
Message-ID: <20261110093047.4290-1-sreekuttan2156239@gmail.com>
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
v2:
 - Consolidate error handling in "nvmet_setup_dhgroup()" using 
   a shared cleanup label to avoid duplicated teardown code.
 - Add Fixes trailer.

 drivers/nvme/target/auth.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index ccba84b1344e..20f8c84e8ced 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -105,9 +105,7 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
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
@@ -115,18 +113,26 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
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

