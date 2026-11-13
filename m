Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580726;
	b=YfoHXLNH2ff3HOzVxMnZJW2UGMVAYplLjCuZXBaRvpRJdqsCUV8BdN1QEEAsqf9gvdej
	 a5gOeK5eEo5IvHS0kW+Kqvtz3dkfBBQEv77v9GhQljRf8OstD679rZ9YT2g1/24yZ1DnA
	 RRDs8KLkhiWLK4hkAeMJep93Xip43MDyXVD8ZnLCEUKADUpZvod4QDR+RZztsnuT8T1j1
	 QsVLu/W32KegteHfIJixlxM+OnU1hvZccMO2vhXp9/CNUOeaDT7Ka26ieA7CqIl9pcUjK
	 deiS/KI3drx+a18SlhlBpehcJwkL9jjuyr+x7hMI6rMzCLH2LYM8wBWDR8I6UXN6hXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IRWBGtqrZPXx8x92wU4vc4uRLqmLqWYndUt9UqAkaxw=;
	b=mSQnFkNfLV28ufu0d7U4oUnFa0MHZ6fbp7kCPwPj/Me4aVSvAi2FZz2LuvRuKbzedACD
	 FLUPkBP9aNls6Ga4aull9Z3q3MDqUjKRlTgeJSLHvpSO5hgAbX6PF6gVxhbCkqEKlCa+t
	 p8Y4LIFqs94y8K3k0EG4faKuwiO7vayv2E6hkqEseQXiF4xpcj5qZEjQWsBKLJTm/vVn7
	 /4CjTc9UNUxBMVNHTpWtq1Hg1KzdcB2n5ra5hfPhC+q2LfKPTP4BcfRD59Qd/Lt3dCSZ4
	 vBoRmfMW3OfUlYQae5IfRQS32Qfbd0Y376o+pi+3N7gypTVrKgOKr0lrNTqdLgz9hYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+bwO0Yw;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C38606A88F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C38606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+bwO0Yw
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso1510673a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580725; x=1795185525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRWBGtqrZPXx8x92wU4vc4uRLqmLqWYndUt9UqAkaxw=;
        b=i+bwO0YwHZSqJ/OWf2iNSXGIbyqr2rpBr/CULyfCzIOJnjMTIDzB5ToQY0j0CztL/2
         DdZg9Elp9IWS5Dp7dZpIC2Dc6S42UHUZRI6Hr+1HERjNC3YC3AA7/3ypHGnuY0WtTZwH
         Btl30lmFY+mOHVpm2Gi9T6rwSpUBt7Prf4KWapSWlJsspORZ0HYq/UQxRgq2U3mN9ESd
         GZ7b4c8onEagpGJYivd0serVF3MJCVfjTfa5Y8fX9OC9D7tesYGj4JACWIu8pjIUXBlG
         9LLRKeJ8u02+psgEao+Ash9ndndvC94ICGthRjHPgm+mcc2NTexbkR9t5zMG5OPfkpKn
         UMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580725; x=1795185525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRWBGtqrZPXx8x92wU4vc4uRLqmLqWYndUt9UqAkaxw=;
        b=f5K8P/FpSh315IRgqYRmPN2FLuy7HhJBUDPOqQVzzsjw3T5TBO1ckRnh5FXk56f+zZ
         PCy4T0ifOu9kWOqKspCdfvugGI5+1wbl5OixBnRw2dIJUlnguz0mWhWyMhYyy3p8gHGc
         BwxpuoxjmohQIjT91m2e72pSMpvFqSgfpvhiIw8gja+SX2Fc30eb6A/+uQ6bqdORMNFF
         d52+g6MCSZGROsahezR/KfndmKRMiN/b45vvQgZXs8rk+XOrB+PnpqTAwihTAjWLGO/G
         rBAcrCBxlTxQDzxvHEjRojGWbQ+KptCzIHx+pb6n9AZ1VlGoFDtFevjavnNI1L9BGX6+
         sw/g==
X-Forwarded-Encrypted: i=1; AL+hErFBDAoqFHY2NW1t97SjteJpGdz2ElN9Ls/8GZd4xCXmC70zI0mBrl0H1ZJP6sf3w6eN+ZR40BjzWC2u7WY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2+AGfpeJTrH6RCxpyTHQTuGfUG8rCs4TC562ofdp7vixwjhBT
	+CsOYBpGbuQdjgqiDz21HhMtL5dQvXNzKTj6dKrs749GFU04tfES/Ahe
X-Gm-Gg: AYBFou21b9zVM7A7ZWu5PCD8HzGsqhrAyMv54HUXvTRcms0/kLNtbKKhhz3CzYxCQbk
	WjerwYXsOC9iW0v1spVb0wsrr2ooU5ckvaeHeGw0aq9GSKE2+84k0vMyIeORDZ9fzGcK4aHWCSD
	IJ7poY2jvI2XIipTDXRW6c6Yvm6n4lZ+uinBRf/+g2Q41wUm30g6K/rF+jJ31+NmCOsqaeAcifK
	s3Aui1dAHJXNiRu7HHS+cFuayTD+HCJ/nE38JKjFJK+rHCW1Zd75ez2MJRkI5t1Ix/TILGesHcN
	CvDogywj/STXScqxFy+uzgcCJ+OUA3B4Nf8bszbUx6/wRqWNCeLl9nQeFDuM+9nQ660EFX03S10
	aIDcqOH5mMVjfQTT0RuAwFELRbKqXbU4wce3vJrloICqXUqwH+ghGGEfyQClFi6iG5TdamSiz/H
	EqNVcDnUBWcct7Gf5yf3ZELIlQtx/izWN88eE6KGiuewE/gqLeSR9AijAsm56SpwMYZIBc8S4ai
	BgVZDPFEkpuXBXHS0XzRXsSHjjCnSM2kzpgcsHSB8DqyPBWVZYf39f7QGuFGjizu+juMwGHKuJG
	pM1jug/yuEva8ezmOuJFQaL4mHv4juwRtfDXde2bIg==
X-Received: by 2002:a05:6402:2350:b0:6b5:76fb:98d6 with SMTP id 4fb4d7f45d1cf-6b7c0bad1e1mr2454194a12.21.1794580724343;
        Fri, 13 Nov 2026 06:38:44 -0800 (PST)
Received: from fedora ([194.36.27.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5cc4sm1091364a12.3.2026.11.13.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:38:43 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: eric.piel@tremplin-utc.net,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] hp_accel: add support for HP Pavilion Gaming Laptop
Date: Fri, 13 Nov 2026 17:38:35 +0300
Message-ID: <20261113143835.143209-1-paskripkin@gmail.com>
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

Accelerometer in that laptop uses inverted X axes.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/platform/x86/hp/hp_accel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
index 40e1b9fb1b6d..46ae98deb919 100644
--- a/drivers/platform/x86/hp/hp_accel.c
+++ b/drivers/platform/x86/hp/hp_accel.c
@@ -233,6 +233,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
 	AXIS_DMI_MATCH("HPZBook17G5", "HP ZBook 17 G5", x_inverted),
 	AXIS_DMI_MATCH("HPZBook17", "HP ZBook 17", xy_swap_yz_inverted),
+	AXIS_DMI_MATCH("HPPavilion15ec", "HP Pavilion Gaming Laptop 15-ec1xxx", x_inverted),
 	{ NULL, }
 /* Laptop models without axis info (yet):
  * "NC6910" "HP Compaq 6910"
-- 
2.56.0

