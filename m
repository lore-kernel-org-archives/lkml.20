Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510885;
	b=hrS4PZzTswrmHT6voIDJC2yBZyxb72wyvED5WvBhWhqQl2Mjg6yIQ/5D9lYOBrZrpLJP
	 bXHr3MeR6n9TmmxqMyrs5bHhwx9xPt62m87XpwTjnFgMtdrVOW/tJNBQ0eI9gFf3lxYpL
	 +4hQHnzSYaVUHayIlt2Z3e8vmVWqosZblBCcA0C0vTRQROnS0tp8EFop15fxQo9XV9Wsx
	 /oGEr7j10nEBYe+829WIWEP571QrGg335KkhkDS552/5nXkBIuBqMq+jc1A5h3HmyL48I
	 tZGI4CK5E82rMUvr9ivGa+AnXUyNIiaJj9DiglKTgv4+qSG8OdWX4pK+WShYrMGBj7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ivM2a0ffySwRM4S5Ey5w/xRUKSjlg2d1AVy7Kzk1QBE=;
	b=Yycu5fOwraRP6BxKEsy9AGPdjyOeXhgrihDzMijbMdVcCmLPH+8kcJujDYbid0WX8FLg
	 VuYZ3UCOPX0IL6rMr96O++Dp6ZJBybt78GPAcsZYScfAG4JRQi2PVFt7nv36XSgWUaXxp
	 6ScMAiq+P0OT/amP1jOV9DqybXcTPLaxAZr8s2xogsPkV1g9LVE+MkQ+FmSagwvjBH5Zb
	 NjxFkNuqP4/v/ugkWd6NWK1UiyZQt7afaMTLZ9+mynBNxCE0YjqmOvjq4xj4E/whxOJ6a
	 YXiaCLRCf3lDDDPXePBA2/xCpJvjp551wGNFx7OYaOM9gHGFl69yVlOCa+E/uzolHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UT6dl+1U;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D52606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D52606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UT6dl+1U
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so5812045e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510883; x=1793115683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivM2a0ffySwRM4S5Ey5w/xRUKSjlg2d1AVy7Kzk1QBE=;
        b=UT6dl+1UKQIxCv+VgRp197jib9E4og5y0xRVppVAMtZt45kXyVtTVi3Cbsn4ohDWp/
         oRcwGMx4KEUFhkYh+MQKUl6vYIJpySvNp2bSW0BVeSSFL65MAJrELvfXYjaTPpBvCooZ
         7XxBXjIoVH68p2TK/bIShr4ySfe9CBfwwYHqi7+gFRDn2eXQnOleMzR85u0CyZRbOsdN
         yMerjxaTaJSJxRhTwMOj0EtkTLk/m09TpUfphSYGsYuKGR5/RArWLwDdiIh9OGk2YrzM
         iK/z0wDPZ0Ko0RpElpusIIQNVKuFXSh16Sgynaln74LUh8uBtduLGiqGfIcZXOvtr/mO
         j/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510883; x=1793115683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivM2a0ffySwRM4S5Ey5w/xRUKSjlg2d1AVy7Kzk1QBE=;
        b=AGB2pDBcgJOsLwZ9vk8vNe2Czp1nTd2kyTOtyoq4UQPHr/O2jx1VRc1+phZUSNGz0P
         K/n0WB8Yf3u6YCSlYpPemRIfaKpShCJrKaqrTSukLQSgNxXDYc7TFxzZ17gBbDrR+adf
         CZ0oi5BRb9gVdC4e2QZf+TrztD/mFxvW2tiOc9VgJLOf7x4Gv0KCMg6rwXA5lPkgfbrA
         yQvDoxEm6bufjagtbzIxwyVEoW8p7zr15yq9v8W5eERQziuLRLRaXvNuyyBu1Q43evI3
         Yrf0tFGZ/zugLmpw+lT59egfa6ofgcLpYnwtjVeB7EiRsu95L1i5DSptWV+/Iqoux/P/
         HfBA==
X-Forwarded-Encrypted: i=1; AKwUvBx6uykOeoCx0XEhr4OHCxVPKLIGHTm3UpGyoHrAc/WvIOTEaF2JAwAq1PtMqTiVqzlvwnytAd5wi8jX9iw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNlS47Y+VgFosdgM7LeMWX0DX+3TxzZReQSkBiyA9LE4wd628v
	Ii7ZmSL36PxjNV9rFxxVAFn5Bpay7ycEQH2lAXGEYksuIR5rwvf8ypc=
X-Gm-Gg: AYBFou3Q0Ueer4mKtMOm8xU9lpKH9RveJwwwSikA6+7oMbQmhmlBdQJSWqVRQFq9De9
	E1v8ZAhbCFWDpXa77yxCY1O/HwuV+MenjiefYMQMYO00yZNHKx3aFaA/OAD4jsqN+LT08Vln3vj
	78mQ/O7PwVgHCGmg4FJryBX+yk/zcJzxuAoQU4VK4z3AP16OTtt0oU/NLjwNU/j+M5mIvS5riwX
	uaK9UZqYlz1uyFRP2nbTsyVeugYwaiORxfvGnuMvuHeIeyZgipqy0l3g0ubxZ8HlY186b/Px84T
	Bs7qQixYHCZyE/ki2qmnd5t93I/jU5oGR0AxcvPN6ht48VeviTwHSYn2xfYJzNchbD00fwu411M
	WvnmDVnpjpGdyiX3wEnKVfJVXN4N236Evnz9YvNqCJ79ckClldjLNcqftanqSDEv7PxNsP/ra5k
	oNRBaDHGadGP7iBPTx/hfF5hJcHZ53p1aGFfxoqcs=
X-Received: by 2002:a05:600c:350e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a1f4e8ae6bmr55223815e9.11.1792510883070;
        Tue, 20 Oct 2026 08:41:23 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm256606155e9.4.2026.10.20.08.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:41:21 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 1/5] extcon: max14577: cancel wq_detcable on driver unbind
Date: Tue, 20 Oct 2026 15:41:15 +0000
Message-ID: <20261020154119.2568395-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020154119.2568395-1-tristmd@gmail.com>
References: <20261020154119.2568395-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The driver schedules wq_detcable as a delayed work during probe but
never cancels it.  If the device is unbound before the work fires, the
callback dereferences freed memory because the driver data is managed
by devm.

Use devm_delayed_work_autocancel() so the work is automatically
cancelled when the device is removed, matching the existing irq_work
conversion done in the same driver.

Fixes: 962e56bfcf0b ("extcon: max14577: Add extcon-max14577 driver to support MUIC device")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/extcon/extcon-max14577.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
index 5476f48ed74b9..905722ede7ab1 100644
--- a/drivers/extcon/extcon-max14577.c
+++ b/drivers/extcon/extcon-max14577.c
@@ -763,7 +763,10 @@ static int max14577_muic_probe(struct platform_device *pdev)
 	 * After completing the booting of platform, the extcon provider
 	 * driver should notify cable state to upper layer.
 	 */
-	INIT_DELAYED_WORK(&info->wq_detcable, max14577_muic_detect_cable_wq);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &info->wq_detcable,
+					   max14577_muic_detect_cable_wq);
+	if (ret)
+		return ret;
 	queue_delayed_work(system_power_efficient_wq, &info->wq_detcable,
 			delay_jiffies);
 
-- 
2.47.3

