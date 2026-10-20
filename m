Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509592;
	b=k3Xos24z2rh76OXW5OGKg9Aakm4p9S24ml8Wgr81U3wq3yGT8Hm9lWkRC5XGJbIXTl3x
	 r4yzwxdRAjnrjHWo2KGWMGktRvu4csRpxTaaReBqVnsHpSKLbLWJbo1ppK9HUwITaAs/Y
	 z3+Wf2KJMg6xo1hX6Kwz7o6BYSiNocRaV8WzQ3FT4Czf/RQUtw5UTvx1/fTI0PWSGItRN
	 OKx1mAqlQ7HHJEMaa50HOOQw/UzgzMk3BnboYINaoLqwAOenrXjugeBg+b3Ujhg2tK56F
	 46Rs4/7/4PqMm3mTHqzzCVk3G4RWCPgrfWRQiA8bLyGLaI70HTvqBHxAFNoNCVaeDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4+dMbq4L94+2qmZ/kkxC5lVbK6QouDyt/ZY60T+Sqjo=;
	b=A79s+LzaQI9iu7CvP1dOFvgZyyU0HocskTWm5LqDq6aiP0ysQgnwq15DHlqRPZtbcQKW
	 GTd7mCSQBnyQxySsyxqBFyJ8BOMDVyDsL8SrgRvk2acjynmdqagYKHq5FNaeDzUfOjPWv
	 pimrDha4v0R4g/4mEk8uCa6PztznJZtOEDB4tuawyohXIUYG1TCCTxDafjtcNvd9hkof8
	 Ki/GO3lwV8O7CEL+xotQ3HBw7T6slHkalkAv6Yeew8vKuBBMKuzakomrkF6XApS1x0uiV
	 IoDr/PWHR25VwEyvx0Ii+T2eIsnfsp1qvJZ+KUiTMas13lojfm4JQT4PrHEFQBhviYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=CS+wb4Af;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAF9606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAAF9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=CS+wb4Af
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso605717f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1792509590; x=1793114390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+dMbq4L94+2qmZ/kkxC5lVbK6QouDyt/ZY60T+Sqjo=;
        b=CS+wb4AfUEQzlE534ZwDUGreFKS43Qh4tOe19fXUA0poLpw9DxPEras0eNq9v+pZ/5
         jTXa/2+fOrInPuQo6RiXrL8dCbLhZ8fmdvZAdjpm6PRVNftJ9VDRXPLvcmTYbvK0N0Ro
         GA9H2U/sWHntd2l+lBkFKJCVmR0ynMPKtMN2XtQWySyFGCZQE/Oy8LdQgrOiYe2ZE+lr
         gZ5l3OrtvYEURsVs9BuqSokV/4vj9OXU4Zv4SmWTYBkCyH8hEM7C4wDWyAp9HNSiFuoJ
         wwUDP4SSfr/S01XEtnSHbENd1/Xjo1Vib7VMIVFlHMIulRF3yJfZ8re7zIC2chO/IelL
         O1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509590; x=1793114390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4+dMbq4L94+2qmZ/kkxC5lVbK6QouDyt/ZY60T+Sqjo=;
        b=TQ4tpP1Sm3ow0WrmNveRkW2xiVgUwnPSYOzsrLSUrwkaMtkLFKKX0/mPfBAHCQQ87Y
         jUkOs4O/bIC0jwoFEn5hffKqVEPv338wIkkO2hhE4BF6NK9CCvfQzZbOkOr8G7qfAM1E
         tViyCsC8RtU/PkrGQhYV9LMnYfFTvuhPcVZRKd7536G4hnT6at/I8uXMEhBLYtN2hRGg
         1jb6VZgwhQrNXhmmo7/XXYsCwIpZyoG4vTD/VYnpA5ik9USM6aKlMQwHBUGBFf+zXpA1
         uwOBSwSdgzuS9ypUZ2OyRmSbkP37yw3qsKMSfL/+8lU8NgCbsIBelcBvbdtPNw6P3GOt
         /hBw==
X-Forwarded-Encrypted: i=1; AKwUvBwGXUICoLdGnFVq4LtqUFF7uXiRP/I23X/oBXpFLgXKS8XEheKnQJyEvrMftmI9aaoDCE+I3Y9+oL//Osw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRH6NmK7eZ/tzmHc5dCBVFsaRgWHjb4rSMaYT4olQ5PNNofpYb
	EBFhOYwZoKLX34NIXF8ZdR4++G0u2K07/QINXunFdWafAZyL446GPF/Wjhh6oRnBeuZPa/2Mc9s
	cOCAQfrEVS19/RiO5zQ7eVwKED0VPmcLMi5cdAAYoEC1dh+KybwYp/4qPYePcAKR4Eysu0wqq2b
	9FhhYDbibwVBMBq6LCAWzXPLR+XIQ5froiwA1EIes9nJTEFlnu147NW1ssauUSGsEl9MZTjKgYD
	Jj0Q7560ZD93uLOrSM=
X-Gm-Gg: AYBFou3Q9qeWtxQZ+aybHDS/Um34XrKYd0kuSguQ2WtiFpPf6UiNXZ1oMrTMpW6CCcO
	ROM72otmL+fq/pnX26vrYeVoE4zwGkYvC/YA3e/HiSXR8z02q0ow2uGInJ+n3xYXb2d6i63cQvD
	briyLSxaeKgzUVos/bGy78SHovSERObEQBhZWB6TpZUtM06v6NUggaaNWrg+6j6rop0RIidWd8G
	tv6/OurVGBg0he9fOSviOfrSWL0s/pFRJH6hJnTZMRYpTTOKrDS7MGROKF564LaoRPhfKWXaRLs
	0GtK0JST/hqOWeI+8E7NUGZ1U/soIXEoTNVXWxMOmIJw5e2ULsHZiFZu3uek7G5O5zEzZJmiP1z
	6Lus0hGaZwQj2/EFNuh60CPBrk1UGK5wp45a2GtUReHxS25ckR6qNf77GFtbjVkJkvoT2XBhtgZ
	XzgwxcJNiHvIxEz0tj1QE6EPSpW28B7hVgJ7cAeeqJLXvgABxL1in2uanqKfoKo0L67DIFysFfB
	4NMiR0=
X-Received: by 2002:a5d:5d86:0:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-48e1e7cc307mr6188979f8f.16.1792509590285;
        Tue, 20 Oct 2026 08:19:50 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d80sm7410663f8f.26.2026.10.20.08.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:19:49 -0700 (PDT)
From: Lucas Tanure <lucas.tanure@neat.no>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/vc4: Implement vc6_hdmi_phy_disable
Date: Tue, 20 Oct 2026 16:19:46 +0100
Message-ID: <20261020151948.83459-2-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020151948.83459-1-lucas.tanure@neat.no>
References: <20261020151948.83459-1-lucas.tanure@neat.no>
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

From: Dom Cobley <popcornmix@gmail.com>

The body of this function was missing so we don't reset the phy
when disabling it.

Fixes: 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI controllers")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>
---
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index 56e6a35da357..5040f014bf7e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -1197,4 +1197,9 @@ void vc6_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 
 void vc6_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+	vc6_hdmi_reset_phy(vc4_hdmi);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
-- 
2.56.0

