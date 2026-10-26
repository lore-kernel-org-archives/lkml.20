Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032833;
	b=tLhCOkMwVf5hehxNmwhbSYukqrrBVDKe7xHyLdV4BeSFPB0/GG6dBjVS7as9m8QlITgg
	 nPUCrZBlARkXh9bTPZw9Ajh3W5q+oEf7H6BzZ84vUyjMYnZElQyY5Io6nhG0Yipy0t8/a
	 ZYBcxJe8oUHviL2RoE3+sJqcgkkM1w9EHfr/DCZQEChwlzIC2ypKCy3ciwtpYK+xtS0Wy
	 R14Yxw/olnOue2gwo8T4Qqb6lZ/08mzg3UssFMORUCk0mMWIVSY14yMal2h2Y+Dqu+RWV
	 mu8IL88YldeRSHHsFWmj1IToAAs1WXUhlKAp5vgRGro5Z8C2dSrLgXA3oNBeiTEB1NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sAOWa8x25rACNbacVKQZnJMMCRBQGzMNA9iEryT5ck0=;
	b=RIiepENqDMHDYTJpMnAjnQHq8vzAhYtvB2cbfTVc8bYuBpUQG9N0INvPiNdc6FN3CMVq
	 vYVxr2n/opvxmhsZxNzv2O+h2Wx4d/UBBpbPIXaXDYP46QU7LDL3147zm6hzCNIZjfOv+
	 E12lHOWPNBSJZa8am8bgpucKLsFgd153vkkTNAwVJc5UOzfedHTdsJCM7IAcNi/lpfzH+
	 dWtdXhl/j/ZIrLF4+072lhslwy2dPqjPpvYdZ1gQfr/ayCwDCG5zkL1ywT0hs8n/aKzk3
	 XtAYiweAYK1HvMo3dDqFEWq5xTzIdDLHP+yQcOE+GpUrqmxTYqLbgMVDmVIpgmqnL4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=eSpvdBxz;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5457606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5457606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=eSpvdBxz
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32633985e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1793032831; x=1793637631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAOWa8x25rACNbacVKQZnJMMCRBQGzMNA9iEryT5ck0=;
        b=eSpvdBxzzt6vjPjvk22FuHAe6u+tQDe+vQAYxRSIIrIcbeHkEsiEzPdFKiKCaD73jF
         vZAhM5I014nd347aqocCAgR0/qq9Pc4X5fbeEjNGx4oW3fPWs4hnCuaEoB4jVc2jyrKd
         +CtCqMNEIP8ZpgB0iRwJRnsUyw/cOPrdGqSfiuKPOQAygbAiM4Cwbu5Wyke69kKdk7eB
         2f8LVlKFTha4hXhWIgU6a47XoZSL37gBcfFHa48y4yybotZGbRfPiySbFG2JUMHoT9r6
         BCkmIdx4356FfamexokVY/wPKxFl2kjaPTfgc74Kr3U49nJEoLJkznxWShRyh7S0ovmg
         d86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032831; x=1793637631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAOWa8x25rACNbacVKQZnJMMCRBQGzMNA9iEryT5ck0=;
        b=lKx4/Ys5NAv72rxhs3gn00mzoBHjvkKpjOZb61Ab4XCmncR/POEchDVpOOquC5ZV8Z
         RDkxOF+top1HizSTbvXJ9HWf8dJieaF15/jTfxWofphoy2fj0nQ0qFpm1DTQTyN92Qdz
         OBlXqk1tyItBpubnNea7OmyjMfKMqJsZJqdnyG1gSLEKC0YnzlH3Wdy5rpyiicREiZuJ
         GwBfQoR/FdVatjhU2fMw0ONtGwCNCY3b7qRonCn3NVcs559Nv19dBtg3kjpmUKsZxOGM
         D6qPJSi4ekomyls74rUYW08cNOfLhr0UX/44J9sOIfYX9tM+Y9M9TPT+QUKdTe+AKGCo
         zpAw==
X-Forwarded-Encrypted: i=1; AKwUvByDGUzuedbziHSuWKS79nHwAop7opSBmaDyYFhJpjD3ns68LUVhLUxCloaiqFYRiA9j3wkoismgddsMyCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7OGvDxgufgChNLBt050hhBUt3saAZHFWXX4ztJRqVTppmxWlO
	EcOgg18mmDwL850psmYQVoI49bh7Br0NEDScsfQKxJ2d/BAvDp5EPxN36Vk4TKqgYG6t9QwM/O3
	Xc+KqJo9fDiB4hiac+/Mevt/uAxYkcCjaNzADV6w9x2LVe1JBtWWfXqiPqLJjUO7of8Fo0W5IGv
	exLfEDnwC3ypzN31EEhBid1QClTcBw4M0R5zf4If1amiFdsL6aaHkaZJkowdYGLTiL/3zuSYT+V
	70OcdFqrO2Yv7Wl1xw=
X-Gm-Gg: AYBFou0KxiztQdEGkodtIqTqsq3Fm5K1eYl9FCtD07CuiZRdLpuThQ9OuBDrUF7O7Ss
	dvre+Tm2JrDcrATygT1aSnLuop4V6ucgf/pYv7YtD9lG/2/6oMcOBpM1QfFFL9RM9SnDmady6Et
	ZQ60mYaZx1zcN6wFiqyiKSMfkikUGuyx8CwBAAVLBDnqAPFPuoMKt5axQlT9eudLrF6q1FvPyzK
	/maNmOdChBXkaROXt7IvCAH3Edr+ozwewJD9bXQ5RLMGluqkKPiE/ngCDRbSYWLEV+ZH6NMmvbC
	YOuKR8ekKBnU5TZY9gYCZg89jux92iBTDE8lSv6V3F0k4T1FAqbNglirbTe+eBKGR1vK+egaqHG
	z/0DACk/xX6/YjN6zOng0Sl4hmJlNHiickvB65k405cIEbhluom/shzoUzOj0NlvJg3GGKCig3c
	eKpJgNmN8ZX44WQfw8c/Z7ap4w+3Z5xfs6pMxTW1UQqlkXttPPLikPE9dQhME6Wgf8MMgUksQzL
	wWAxYncIOifDrO0X9Pc6dNvFh0ko5F+JFF/aYLGg4oZ7EzX8EAnyimPR+rD3F7BoyG/ZdWDwvTS
	plj/J8MDcw==
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a35acbd3b3mr141129035e9.15.1793032830719;
        Mon, 26 Oct 2026 09:40:30 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm205961655e9.2.2026.10.26.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:40:30 -0700 (PDT)
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
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drm/vc4: hdmi: power down the BCM2712 PHY when the output is disabled
Date: Mon, 26 Oct 2026 16:40:26 +0000
Message-ID: <20261026164028.78792-2-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026164028.78792-1-lucas.tanure@neat.no>
References: <20261026164028.78792-1-lucas.tanure@neat.no>
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

vc6_hdmi_phy_disable() is empty, so on BCM2712 the PHY keeps its PLL
and TMDS drivers running after the HDMI output is disabled, until the
next vc6_hdmi_phy_init(). The TMDS clock is therefore not stopped
between two mode sets, which the SCDC clock ratio change requires, and
the idle PHY wastes power.

Reset and power down the PHY on disable, as the BCM2711 variant does.

Fixes: 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI controllers")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
[lucas.tanure: Rewrote commit message to clarify the issue and fix]
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

