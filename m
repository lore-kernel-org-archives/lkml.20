Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509595;
	b=FX2rmumVJfY2LjohJLb4W6lZW/3AW9GbRQAeoI1ZG6knG4Qvmk31qmA0qWu8PiOTeR2W
	 BBWdIjs3bn2tK7pSCywK49IsnrvULH1g6134mxsa1awMTc/LL6hilLO/i7XRJEtnaQDZv
	 dAifr4FerMlw3GTxlPdOGfVpFE8jv+rXGdx0y+J2AiV9KVXjFeqdSOkBeJ77XJi5yqseW
	 UhXhef5GxuOz+6yFRYkJUeIcGpNDPnSqjNPAeETCaCBhoPOyguvdEANMf+y9PVB6SUbdn
	 NI2eRNebmf/nyS73v3FMCqxwJ6/+tcnPHTHpWV+4I49+BFiiTSkAblbmcAmaYwszomA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5BjdKvBZdXi8e0VydYgvdPKEZPO1zw4zmgyGyLoROGY=;
	b=t9QpMWDxflekspadGfyTQameN8Jitupqd7gHm04FK2berPwXPa9tSQV336nK5bGhjcd3
	 7EGqvqMyECmJ2+TpF70mMupBHe8VMtbUQwx0SU0ewIQnQjb9UdvumHs5D/Qdapi69BBAS
	 T5H/1DIYKA+epF5wH1/2ss/5wXUf9PevI/xdq6rl5xwSfqpNZ8lvy1bRtlahGK2I14Mwn
	 DPZY13A0qk2/cgO8AIXLSrQpRmIvf6gjMmpf6/WJb7IuhBl2YQpme0kFDxHSRBCgpxk5E
	 2RQEXTtSku4dF/bq6WmlgMwKLTeD8gl5vuq3L84p0Va3zyXY4npq5ukRcco/91ukCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=Sy+nnfn3;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF260A260B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDF260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=Sy+nnfn3
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso605744f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1792509592; x=1793114392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BjdKvBZdXi8e0VydYgvdPKEZPO1zw4zmgyGyLoROGY=;
        b=Sy+nnfn3DBKv9HEK3AEpKlMCHAOoQ2+ce7NvjCXw0x07xLNxOUGbb5mroqEzwb84vU
         0p5mMcLkFGuoQwN+Jg+Jwop/uPNGfsmhGb9MNeVR1pyNBw5OkquSVsu6il97cTmuwLoa
         dJnerSIHAvoJicrsPF14fceJX3Ygf1Of1DAgzQynON42wbQiTwlySvgzz7EmKB58O4fo
         i+xiBXEjrgxWdI+lP3v6+4R3FHTjmy9rZMQsgOBnDBz/RwVyiOo8Fu5wI1TuEI2dN7nU
         9Xz8Sd5DgtrL9++d0kjpCmCoCqtIFaFZEsD8PGJQmkn56wBJJr9MjH4Gi57s5mYo7XFR
         URhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509592; x=1793114392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BjdKvBZdXi8e0VydYgvdPKEZPO1zw4zmgyGyLoROGY=;
        b=QcQnCCYOkvQhHSxcLOk9qePYJxEI92vPhmAlsqtKMwqJ7wVeBhg2wRDmQFnNLSRXgo
         jV1n9UIUUBUwtWiee+NrygVFnkZd0yN3X1I9TWbdqM0GYtTP8WL4/rg1OFvNh64lcNWj
         8LlMLl2BMwDErz/ykclPtdU114udW8S1WCLh1keqpGpF6vY977bxhXhISmqPXnPdVvM2
         WeNunEJztOkxwpzEfmqONO30BE3JZmMTazn15DkmTbeIuc3ZOK2TPX/41lOsvSjz3PAc
         TWrJH6vDTq8njTXX2x0O1HXbbcU0d5MpRJhTUOBStTWbbgH7MorA4J084ZA6MFnpBF3K
         lCeA==
X-Forwarded-Encrypted: i=1; AKwUvBzeTuLn6OTNDiOxCnUNkWvffbyQ8v2i+JdYWVynQrJStXP9df6b5Tfh/3eOYMVj78WgpugYLZvYKqvzaSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw+6ZC8F3YZOXVknI5RNpL9nRL5NjyFMuP5nJDe+z2L8Q3LBuz
	59jLc/PIAIEQzuaV5DouNwf1RewhQS/Ez7ktpTvu/MOHQh2NUCX1zso/abBiPv33NT6i8Uxnx0W
	br7QPv2mYnf4AEOTlTTOioCOKEfHiC9mWKj1PqCKAsd2tuJsJyCDpAcrdB4QlX5g/DFBpB5QJQx
	aBZXMaj+4R9qqkBIlrcIMTq7dxfEV9Zb+55ulKf8UeTDnf7rIpiBFZJD+xK+tefmdb0zTY+EzB8
	WSnFIv44kdkqn2dj2I=
X-Gm-Gg: AYBFou1KNOZFfDnr63c8ACQqCSWUtanglkKS1E5uy9ppp4TUgKtyoXRMx5SGMOKN8gR
	of1D0qhUa0pUI4e3W0yWsa63wKzHNg4o/K3UMnex5Yk8Olwq9x7DxCDsNHnPdk8fTq6yekh7gS6
	HcE8SvHLd9KuRC7jmylEbLeMrvX8V0Ei0HZJ9XfvZSRL+UKN+CzUxfwug7jchw0DMEhi9sluGNC
	58BuvFPPe7ATbPkZ+uGJqa9RAbSqqjkP9atNnHuwNqY7YwZCP6OLlAnSln0LTCji5oAK6jOBEef
	ffmQkiuu3pw9hU9MkkqIuDYIP3y8dtHXZGS9vA8DBhRUBcsCNY+s+B19sIQ1zd29foShedTc2vQ
	3SnhXNf/YiEyB0aZhpONCSma4yAMhtHOnUryR0QrhnuC9jIozdJaKw4PypHT1FAi7w0S+i4A+wB
	STSoZ21oxBNOMKFYRQ0qlQiMh6tnnxIkm0RMiwcfG72xBhIlXh60tXiBEFv0YK7Mi4oGamkwhW/
	xZgdizG
X-Received: by 2002:a05:6000:491a:b0:48d:deb0:f1a7 with SMTP id ffacd0b85a97d-48e1e7a833fmr5356424f8f.10.1792509592395;
        Tue, 20 Oct 2026 08:19:52 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d80sm7410663f8f.26.2026.10.20.08.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:19:52 -0700 (PDT)
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
Subject: [PATCH v2 3/3] drm/vc4: hdmi: enable scrambling before the TMDS clock starts
Date: Tue, 20 Oct 2026 16:19:48 +0100
Message-ID: <20261020151948.83459-4-lucas.tanure@neat.no>
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

HDMI 2.0 requires a source to suspend the TMDS clock, write the
TMDS_Bit_Clock_Ratio bit in the sink's SCDC registers, wait at least
1 ms and only then resume the clock. vc4 does the opposite: the PHY
starts at the new rate first, and the SCDC bits are written tens of
milliseconds later, at the very end of the enable sequence, together
with the source side scrambler. On disable the bits are cleared while
the clock is still running.

Some sinks sample the bit only when the clock appears. One HDMI 2.0
sink we tested then sets up its receiver for a 1/10 clock and never
recovers: a Raspberry Pi 5 at 3840x2160@60 shows no picture, while
1080p60 and 4K30 work and other sources work at 4K60 on the same sink.
Writing the bit by hand before enabling the output makes the same mode
lock every time.

Enable scrambling, on the sink and in the controller, before the PHY is
started, and disable it only after the PHY has been stopped. The SCDC
helper already waits the required time after writing the ratio bit.

Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
Link: https://github.com/raspberrypi/linux/issues/7693
Assisted-by: LLM
Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4a386e053d3f..e57fc33af6b3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -918,8 +918,6 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 	}
 
-	vc4_hdmi_disable_scrambling(encoder);
-
 	drm_dev_exit(idx);
 
 out:
@@ -947,6 +945,8 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
+	vc4_hdmi_disable_scrambling(encoder);
+
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
@@ -1554,6 +1554,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		goto err_disable_pixel_clock;
 	}
 
+	vc4_hdmi_enable_scrambling(encoder);
+
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, conn_state);
 
@@ -1688,7 +1690,6 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
-	vc4_hdmi_enable_scrambling(encoder);
 
 	drm_dev_exit(idx);
 
-- 
2.56.0

