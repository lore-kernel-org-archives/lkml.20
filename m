Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A633ADBAC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545121; cv=none; b=m6QaLdmWG7YrgstRePcStgOCZ/lKRrSAChM/j/3L0NgG3sbbdpQEiLQw8jWPvUhu1hX/23hzHTCSHlRsUPuo6Rpu4GJXfFsWkMHED4ibwbdYU93/xaq7RjMcoRcNBGAW1CQcJQU2yeHQ8AuOnNYDrS1QvII5lyvSEuyEQIzcmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545121; c=relaxed/simple;
	bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Skb9Prq39M72JG9xoEZdHdbuEpXRAVH8rni2svLMwGflzxYGb+t2KdmM9UKG5XACG7MkwJefv/z0zGy7RPgd8jnUK7b9Z/j6r4lI6nyEvsPMcWQ/iqyrScNOMIGql1r2IO0vceJZLp8BJXYp2K8KQ8IEW3vELdcUgQGb7xr7G0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uQDmbYME; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uQDmbYME"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5372255a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545109; x=1792149909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=uQDmbYMEU7KJd5um3qYuideomb4P60KzbzDnJfX4B594Co19Jj9F5nsokp9I5JoRHC
         MDKHBHRtKS9801fG+wEC6jZAVRUL4J6PyJEocYRgel76iCtY1Htp4d4yREGsj1KIv5sH
         rs6E5Ke1f0Xefw7x0Y1traXYA5uCVkyPQVMUTQlWZ7H/BkFBpeK3kjL4FRQGzmFMjPQn
         LmQs09cx7Uoeph5nZhTLPgCCxzgZ+ji30+1a55KcWKJRR3qVXWinku7JfySUzsykl+na
         8Jqmtx+r1zacazmfTtfBnzJ/SeYL+6JtIYpGtFxkFOHMv1onDHAKp7D+yK2NLB9ExHhI
         pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545109; x=1792149909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=NOE2DZo4eTP76HXTLRw5wN37w+S+gAXvtao2hBDHK7MSwjMrcX0ww0PE/FBfZnXwPC
         xYmawhCP3IAPhOdYQmOH0ueb77+1EFR+c/TuSsvafq9LkgQUc2o47vTkJdxOmvkWUsGX
         7x8+c8yHwxwrQPywXS5ETlq4ww+NdmwmhACdx3BrT8m6qD+whMpnnu7+SnTD3FSFt3jd
         HSXqoOvXvIKNfq9lu9fqB/tlb1F/6fW53s+GJ3opmtt0eUgRXmJSOTuBBicKnMjJ7kx1
         TO3qEj0sCsh7xUCgyvh7z3jzGo2HBf2cmOo80Rkz7yO7wOV+qrHFmyeRIDxauoV9TrcP
         GMSA==
X-Forwarded-Encrypted: i=1; AKwUvBy5TVsOK8cwdr0jkTRWc4MX0/TLPYlGHccKbyxvkXpk/YgeP6D44kmbfUx78aCsbX3DU7XgwOyYBoCuLKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCrYfxJwIaW0z1ZqKRuRcvcS4KZI+Zyu7TL95v2dNZQmQvdcEF
	rE2MfMVis74e8CLThHLkoGq+znfdgdAMCXw9ziZ74dPislgDZReD9Zjfia4ejKZbthc=
X-Gm-Gg: AYBFou2J57ftNHqec7OP5QBOTN+f1cBu74SdJOUN1TSqwJW25L6fe3K3bJhc201MGhy
	cdvnzMvYjK/2U44T+9ZQQoQeRDT+acYxO8ifAwmYV50WB3NLluxDfdRg4b3Xhahg3gzMhnFaXnp
	BEEY5oZmL0Wlk7WXpOBIFDlKEvEBsr7QKTVkI50LYiLFHKa7hDrje9RuS9UsVHueCe6yOvtsjP1
	lvn6D4NSgXLierkTr/eObbSOVOxZBT5wIW6+XLYe4x6bienLTDJKvPfQcrgYqQ75tKRJjJGDF3J
	tT3wL/Rck55+b4meMphmabxikiRHeuUAdz3cUoKN3tDJOyl4E/11ddhue+sAXjLsHmYJRfEyZba
	qeBOscIUpvhUCnAWPjDb5er1M/l5s2YPZmlUH5+c3Y/mAsXiTwHVz/3UQ2QgRYKrN/8FxxQwMXp
	2pxjJ+OFFT+UJd+Tuh0qWXBB2SWnZvR8dm/aBnvg1JuEO4a04q3uw70Wy2A0tzZcF6iqXyfQTkt
	nNqPvpaWJ/FW7tq9xFLOeOzqXYJuBT6aVmG+zBNAF2XFFnFUkXo
X-Received: by 2002:a05:6402:274c:b0:6aa:e3f3:c9df with SMTP id 4fb4d7f45d1cf-6b17c252c9amr1447419a12.20.1791545108898;
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:02 +0200
Subject: [PATCH v4 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-3-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
 b=zcZTLYpESs6HkFuhiJJO4ex7iS3OKoMwbYeYOixjFkTwhHKF6/mXLg00Wm2n2nZuJbFx10Srw
 hzYG+p/eC5fClyEBuI4SYS1ZuYA1CMxxotWYaEVsc48KMcsuoKB/Vpe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.56.0

