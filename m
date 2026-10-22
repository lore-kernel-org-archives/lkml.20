Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701003;
	b=ttQwm7eJAPq7bzPa/StqwoyJQscSW+/3vDmRDIMCyls4ipq12DpjzJe9p3WvYYnjt8oh
	 rvR1pM1utoa2ZWVPgCbf7yc9eZMxAeGBIIwBEITyTr90I4G+Hq0KQJ8dyo6M/QVPPRgMn
	 G+8+WDCu6jawk6h+BI/E3u7xzJcPJS+vxAKzN2aXNT1YXmDtaSIuksfP5wQvnsB9D/Qar
	 hg6Ef1d1ULuNbDxORjKwrtDaBowSXiF85XJnQP55Upzfmlez6TRPe+zFZDRGmKetpofEA
	 rVr/9J5CDQyIE4VMKJ8gRyOEU41AMaPhaG49xhouqsEEWbbwfbgXAumtnl+W2141i/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
	b=IKInjV+RrbZTiKZUmMPxQUzdNynV0FK0AqBGSo6z3S+iCzHZLRaCqUUtJRBp2nAF+3Nz
	 37kdaQGLkDjdm4DVFgHhQmXrb5wc6mkFBhbgx4eK/y8QESLH/DgE0nAMInEb0Cj/KEyGY
	 2XfWj562qXIJUFWilZnCQzGSMXHaO2+Yl8r20LPrc7owZSIZYLm6x6YwIDsGkt8LrwSby
	 1r1I58dhUYmT7K9IJamssMHBWpuWAZJAJHQ4v/Z9cABH/ANh4Cyo9kOKrWJB6qRX35UQ+
	 GM4Y4hSKG3ycOnrivOKUUtrDeZQP/4kilbg2aMywgZSMycGburEiJn4H0oUcyS9lk4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpC6z3Yg;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDA260A2603
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDA260A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpC6z3Yg
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35f1f76ea84so321734eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701002; x=1793305802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
        b=UpC6z3YgoFOp+e9UwyTUdWVzTO3KVRF6+aoI5mDP5mAk8QvN0MDrCfReNgke8yzN1X
         /ryB9pG9Ww14dsp5cXojQQnip+PAON29ABfumIkpQhQJEHEgnLoU1mQXhRsKoJ0NfOwv
         H0gS+G9LCnCDh2v3CTv2etn0uCX7nGDtEysgJrkOli1iw10N4wNJ/7y0zaAhE0Z0YPW1
         DbIpRe5CrGrIjz3kmH4sY8LMxQr/QVImqYc58JS62pu3rfAAZTKszIxJAt6Tz4Xc5qFt
         vqyubXGNLBCtjwI6hesqjlFq+nZWfNi/cwZMn+CrlxAi9bYCAIAV6t/Msc3y30y5VUAl
         jK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701002; x=1793305802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
        b=pWSIYI+HcPuuYhVYSRn/HUXtho12ePTXfk6wYBj/qw76QSQF5FnYZT+S4s3zFaKZ07
         F8Ai/Gm8DHcSNg1cEBSxjvjL9xMHmDWOQVaOdH3R4DF0cd/T+iWw7WgWWaMNG5VEe5UZ
         qlT0pQEud1rvahotVDjRvK8pu27mKwE3xzb/5BpQqb8fMpDWxle/BN9hIp+KaHnDpfvV
         bwjZgANJUs3t/e49fTfzVRo0nYrmpHrax79dbyh+EivrcsAK5Nh9iy+ipoy9B286Yfgl
         BCWP+G8Ft/O/hCREcm5AOKra1BnUbeZkMPT6JH7dUkqppAHJZxJGhkBpNTqOkBUnWgzQ
         FkSg==
X-Forwarded-Encrypted: i=1; AKwUvBzQAZMM/a/pk/PV/uEvt5B//ikrLXrAXVbV6qAdKx3WQUjRdiR2ZgZkP7BGCcoRwSynOvyqfKtg7NXe8Yg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh+vKfuIiFhp83FAmNuQJ3olbiC1S7H4spIhX5I97dMYDACixe
	6F+rWnzJ42Lg9tSUeNRGmQfl5cl7PiYICbntCmLIB13joXtmLt+bhLeR
X-Gm-Gg: AYBFou2S4Wh8dxjD2a/E6DRzxs7NsHeN/reHICUWTX9X2z4bSAsdqs55sbm9lBBitIb
	2OhoK/dToKFQFOB7n9tmgY7HpjCW3o3o7pviT91SPn5HEAoomPH6NtQIFSL9LPJ47YqhNgyId6E
	3i27uEcfCgCwu/UhKPiljGmEGXLufwmlfwB84n8NJeegWAxQbE9A7rwkv2QAHhCBXhtaErqxQU5
	M8az3C5HKqTtalz03UVXiqYWHW0s2rvmPOpjuKbvn5NMmg9aACq5BPi0AwgNxAMOBIa1WLVr4t1
	SbHJbLouAPCkSCHQQRLc+sx6O3OPnsPyh2i4q905Usg0pzvra+cuhCUfbh0P4SQgGVP8adtE7Wo
	IWbMmUoUEEK6Vmm9mP66JdTH9K+a0lGp3iEib9+pO/dbIZfafXeliYAwldo4YRAaRWy/Q4ydeei
	jXevB7Y125jR2/QVlT9Kg93GffW7sDq/yE3+D0/SBvfW614UASMq5mFrAWyREFsvZBC6+NuPtgg
	u+HmBOwQaQ7hwvzH/GwCKKuddw6ZM3Vau3/IK+lpDSu3FGs+01bi8ga1Er32xgNA0Dbw9obO/N+
	anHCMUHqwX+JGIsjUt5f4j/WvPjROTzPUtEWV21LZoyL
X-Received: by 2002:a05:7301:700b:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369d90e363bmr310924eec.2.1792701002252;
        Thu, 22 Oct 2026 13:30:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm283894eec.17.2026.10.22.13.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:30:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 13:29:47 -0700
Subject: [PATCH 2/2] dt-bindings: mfd: twl4030-audio: document preferred
 name for external mute
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com>
References: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
In-Reply-To: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Proper names for GPIOs should use "-gpios" suffix. Now that the
twl4030 codec driver has been converted to use GPIO descriptors in
commit 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO
descriptors"), update the binding documentation to list
"ti,hs_extmute-gpios" as the preferred property name and mark
"ti,hs_extmute_gpio" as deprecated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
index c9c3f7513ad4..1d41f582261d 100644
--- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
@@ -39,12 +39,18 @@ properties:
         description:
           Enable the use of an external mute for headset pop reduction.
 
-      ti,hs_extmute_gpio:
+      ti,hs_extmute-gpios:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
           The GPIO specifier for the external mute control.
         maxItems: 1
 
+      ti,hs_extmute_gpio:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          Deprecated legacy name for ti,hs_extmute-gpios.
+        maxItems: 1
+
       ti,offset_cncl_path:
         $ref: /schemas/types.yaml#/definitions/uint32
         description:

-- 
2.56.0.257.gf7497c7d27-goog

