Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738854;
	b=cI/xBOWLySq/6epspM7Kvlv2vxvR4+081AWZumTTrFS1hCP0U0Inl1usNDy/4sjUb3ge
	 8MVmjbnfZ8Tr2J8s9ovo5jL2iMFMFbzqnVoIHBKBrB7MWrM8tJ1xs7uHhJw9zIPiLX0Ip
	 POgZEIYHqwvHLSD/9hY+W3yBoFCiIhDjD1FxCldA/GlWW/dQEhAJpx6HjjRyPFTrXOlrp
	 /m/TM2oWJ9yBM+58IkaCcJshOcMHQjJ2Xr2J0lF8twuAFmDh/lIqmzKEYdgj1tmnnlL3v
	 lrErwo96xyOlAqDUHkVYw99RDmFK9WxI7cCKjMUkaUZOFifrBxSuyVulOP+IyVwV+/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
	b=eGO2fXII3hkkTSOZ13vbLMu1Zy6H+pY/IMbkksfEqHITYeXeemlIF6BME1omF8v0YeV0
	 3/x+GHIKm0+mOBIeTytEDQlCFji8uUcX5CB+itq/ygYYVaSczV2Se2ps4Um2knRocRkFc
	 cPqO19292MtdC7JQIDIWixuG6lCgW844VK+PEyZyzB0EWRUHG6PZPyN4MJu4Lt16YEwkr
	 PsJdu/3t6sO/Y/kQIbxCxaq8JeX5ouy/hGe5WqgfrDw349ZUyg9L1tEM+hUHoQ3klj6zD
	 pFXaIYXWeRgR3/JrE8AdcVoAv6VJZ9J5OsSiVuiBkvl6TP25aEvP2LIO7T790p8gF/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vr7uH2SD;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C67606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C67606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vr7uH2SD
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eafb65e204so1276228e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738852; x=1794343652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
        b=vr7uH2SDPp0m1ZV900ySJ/+0laHiUKGKf0+PFqOV2WzoKt+78TV9d2yp27Sm4/Gk1K
         lUy1Za1otIExD9/VpuTBjWCIWYV0Tr/WfmgY3oA340BewQCPgkaPRfKCU0mEmj3e712K
         QfTb7ciXQwMSgI9S7oFksCE+cMpSL9XH22l2kKK1g5AvcbmQgXV59cYKF1ZwQXFfTcFm
         CC/uNrTGXvcIpT4LQrNO4Lh2Zs9hadiS7krOnPxFkWrS8x5I8n64kJ9p/tXUARRSquxQ
         dg2KrWP0oFXhau9cHm4uQ478S7EWEXhoS3o37MZDlMWo2x9/ZhOWULLT1qwNTQHl9dcm
         4wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738852; x=1794343652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
        b=JaaQ2fGk56fF9849Wg38zEEypXfGbGohxyhxv2qpaTYrtQphig4XUhVRVQBsBVCJrc
         izDRkLLvUujZT4kA7SZ8g3cl1+t1X75vZYFVMV+tYx7V59IMTqoBJI14OxT3jqK0g0/N
         UNSn3QURElp7+cNR4TNFZi4tDjagwR2P4QuGgqY/sGZcRjwWcZO/ePDGkqUVx/VR2tOX
         joBULCcV1Nnb061ZiJ4zLNmni3H6qmg3t6cLKG/+ksjjR70/oWJnzW68pezGE7l2aPyb
         p7yBF2SVaeKjUzBSiygSzOUs39BMWxgkUzjIyP6cC1oY1cXA9TGdvpd0+bTjMNRvn46w
         SZKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdybe594yle3KdnntvlhYqBUcylA7z/Iu5CpVnW9TUH//7aI/8HS2lBQGYU4ZAMto44UkL0UrvXtTqcUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WvbUlXQZMQoC9Yec9pGtmrXKdy94ctIZ44L+mF9Ls854hnnb2
	JR9xVvLR5Sc3fr+6HWtTHJhojV45a+v1LUFOY1J1WVgMIIOnUekkvUI=
X-Gm-Gg: AYBFou1OuT9TAyAnUFHsV6/kjgFJ/Lu+ui6tacmrpf35RTGg3J2dNVL4Os55xACVRYg
	+PbyEJKCQ/uBXc3KK+FsPoKRVW7vfzlow2rj74I2xkSEm5wKBypnlNlYqbHRfecRop551qud4lU
	sdpt8QCW3b3KcLLoaK6UqbOZ02scfoxV8IWTQPX0MKOxBKzLaiRuzuAacqzDNb0X3RJxPrvexvB
	hEKrMh2At0RPJjRLtgWuCtnaXfheXBCsjS5CtT/a3rApT/BCJbYmLU8nrpDl0umA7aDcKLQsSPg
	uczuWWUGbgXubbSN5Nqf7VUN/quKj3elgUE/QbkSWi83FMAMWM5V05VqCIakulcmlQFCeKwxO1N
	qbk/y0ORQ2CmuDYbnDtZof76O1p/rfNncPJFD0CArr7A8b6K12tIc14Q7lVupGRMtR5QdE7FJoM
	AF7pTw9u4+4a+KX24ZCl7WRtrlzS55vx0d5eHdnQSceD9F0V4PxgGlhp/HvuAAx72OGI4TEUNdk
	Hq0bVGh4ZH/1asRGTrxcFQkFeVKnjCvqyto0VnAgtvDSLv3Z/rSBYrwNLn4Lcbjjefv4w2/jSp4
	PgnuHjL9Ityr5fnnKX3egN0ZSpOJRXyEx0H2KlSNpLGbHc/0/DFWT1vYtyiVwe4ZiStN2uy+Bw+
	s0inp
X-Received: by 2002:a05:6122:3c54:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec68971961mr6087782e0c.15.1793738847860;
        Tue, 03 Nov 2026 12:47:27 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:27 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Tue,  3 Nov 2026 17:46:53 -0300
Message-ID: <1deac1052da01f892b385f0061c24bfefd8d0594.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..ada64be352b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8285,6 +8285,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
 F:	drivers/gpu/drm/bridge/chipone-icn6211.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/tiny/ch1115-i2c.c
+
 DRM DRIVER FOR EBBG FT8719 PANEL
 M:	Joel Selvaraj <jo@jsfamily.in>
 S:	Maintained
--
2.47.3

