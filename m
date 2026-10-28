Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173379;
	b=4mgzpDgtQNXNqbwYLTyyoVclVeH82p/Wwp7f9fD0ddolv4Wl52BN9TY0jGXeOWAnZrzl
	 r8weP1arfk63M687llTPsm13BE6eMvhM9G5iuLN6gy5uWRinU/pToAA3i7FGCgUEzcKPh
	 gB2/nrXmeaZOmgYbzBZYGxkcfRaJgrHQ1pxQb7I9Bo3fRbY7org6l1+mDy8mMQ3UG6BTk
	 i97x5sRbR1l1I+3q9S6muUWp3RGpdHmmXmH5lrqChRYwByJT0g3oZXdsdTWaLw4dfEBRw
	 Ut/v56+0TkZK8H5X51usiYsJJ3RY9FJ0Qz+shS7g/u6VM3iPPaQM0yTEtw0O8xhB4uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qR8KTb6qvAzIDMlPYHpTftZOot/Hoc7eU6G7Bmug9mE=;
	b=f3for0DOaf0DwCM9wUeL6OaR9qR9dHV+/H8vYN1OIbHDFwr6X0xPfxnn35Ifzh+R2uKw
	 sMCFeMta3uUS7FI71NKczwd2cV7yAcwLDfgy4mMZzfcXTD6APBKX9cm5eWbTYPVSk+GcZ
	 +A/cW96Ktr6Ho7Pd1xmevsoXhOZdXPkZZ5ODYIEkmzDB6r0ff2v5GkX/ExwiTRXE6d9aX
	 x4eM+RRsvSAj4Xs2Al8z9yh5QRCB8IqiO19FCeud42+ifPmxZvGDxJWxCAMS/g3Cvx7xf
	 VhIg2WCLlq05CXvD7acaRXrTM9AjLdZSuXtW7lzfMirj6/Jw/8I1iLmIi0nqln/8xzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FayvTxEz;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFB2606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BFB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FayvTxEz
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a595487d43so4860751fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793173377; x=1793778177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qR8KTb6qvAzIDMlPYHpTftZOot/Hoc7eU6G7Bmug9mE=;
        b=FayvTxEzoCGYI2JOhhcXfy6nUr0vXeCrkfwoRDtJGd2QJczLQGeStgmqiNOgmuk6SH
         nZVjgZFB5axjcUIDKnbKXCX/ha7kGMCXAosYY82t+3rDFMePkgLbW52o/kh+vsTLn89S
         ZvqGCv4JmYbM7ZG8E5SJLyIjO5dfSLkFpu2WpBFAiazbunNpejFhR9a98HJwinloZ2jP
         R8cWbjvSti+cChxb/XRNrTQsodlbd8vm7Siip4vfna6SyD7o6a4tOL3JwVahnhnfgkPV
         CAfEMuPibZ8jgIdgV8fSJVn8HkwBDhhKiUy/5rQrQ9nyK8Q3+rCUw+WEP6OIsKupZB4F
         u6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173377; x=1793778177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qR8KTb6qvAzIDMlPYHpTftZOot/Hoc7eU6G7Bmug9mE=;
        b=wDWzGlYPNeNXIbBMJUmwlA9ZO41vTy5uZ+eo/31etrDojhQf4xZ/3tOMmLfqtf4q4y
         F6MF+21qTDBbuLa8Gz7DzWD9KAXzhcGsBljw91imq6aAUWqmevZVbqOsDInrv/o1GEpq
         PeKU30ACJ65zqUdisZ5avTVXjWO9REhlckwG0MR56dpnFz/2FzrUWC+3NzyojSWr8HeM
         WvH1DUdwV7WX10RuuDsWy0E5EuMvObb34/1c7qmaTBdO5HS6Nv4JrF55b5QWuefo1YVt
         SDyxhkSCotE4g+qx/9TEWZOiC53Iwtq5CQ9kkZnIkfDsy/50M8HrMKm39B4RCxwUjQxT
         Puag==
X-Forwarded-Encrypted: i=1; AKwUvBzXIdgb1TZdD3QcBKe3XSEJs3zkBvdwuWvjmV4SJi1RhDNFgLuBypwTUMncevhbJkCRqQ71Hb4XgBCRD9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLK4Rx1E9NUSfzgRZzeCNatjCgnO3f7G/mudmqLUl3ak8FMTWm
	vLISNOcAnSyZ7BLddMXC99xhEFtd97zMTFUPSA9kW/jwzxVZgVM3Whst
X-Gm-Gg: AYBFou1qNOS/ZCCLmwJk4vBoJQkabee5hobXdKVSiyjSN4/LQYeGDZnnSJ90MX9QxQ0
	HHIgQ+0GUXNJbOQse/iJ4FSlgf9+EEg9hQpJkwD82JgzBggCo5MGNXAGEmnHUQu/ZUVVchwLodM
	C/ZCCf8atvcOIkFzMq6X8RFDXkypI49IcCQ6B/oo7vUc+iskVY8L4ws8zrJlWBYvYQcyK2RyMBW
	3IUNTxi/6fntnFHg6diF9mT+ExNbcZAGs5pkO/BkiYoVmSZFPYMGGqJGXjynW380O7DISCVfeBY
	23UhB+oHxIfpTAhJM5Mh0IrnDJXkooiy0XnHrzpgCtR+hpj99gNPsCeE61deB+RlZ0fG81nbiye
	ZKyXuiyytpALokcaWr7XI22OUqHTyXBIMs8aj0osTS2G/WdHfljpZ1Z+h8ypfNjvIrv1mAOQZup
	2QaxaTevd2wzIyrMt37q3WxHuhC7arCzo59JQ03sMZOXKSWSY87VEY5Vrm/dlXJuLQEGxUU7PhZ
	QnmP4bgmoPTU6SBTI+PWhb7NaG6o8xAJuLrsU5nZMMQVONm69Ixztu4kYQZgN+ZFyJwwYC8TgWo
	p2Bwlm3S83O0yk7rwKKT0h2dUX/02HzF4RZ20q9SqLVriSEZQGG+3yeRlHM=
X-Received: by 2002:a05:651c:4216:b0:3a3:7682:499a with SMTP id 38308e7fff4ca-3ac9cf7e931mr2804011fa.15.1793173376514;
        Wed, 28 Oct 2026 00:42:56 -0700 (PDT)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac708be4e6sm27980561fa.4.2026.10.28.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:42:55 -0700 (PDT)
From: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Wed, 28 Oct 2026 09:42:51 +0200
Message-ID: <20261028074251.12002-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Make g_fbmode array const as it is not modified after initialization.
This fixes a checkpatch.pl warning.

Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274..47d2917cc 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.56.0

