Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737582;
	b=NMWQzpFXL4xPZWrtz1GneKtPPIQds530r7wTSQ0tiOYrecam7ZGc/YXmooSoi4GIRCPv
	 QEB43GqaF+xtX5wAIsPMZLKuNRA65IOUh2NJH+uCOqAi1A+m5fXBHW4c9WI883xS9cZ4i
	 NUz7yR+ySwTEPJKxWa0V9ZcqzHSUrC2IhQAJkziJANQmljuQH82QmGdaExZ3eKJd6nkrg
	 jndtwYRrR2ig+Q2wYMpWSJkJXXmS9oMjGiDzuYq5X20pE0e+NwCNxIGwfUPcLoviZWACY
	 VQ5cf4tp6Ni4iOftuI3k8/iqx/kPc2VWyXKpGy5Wvge1jxqK8FyCN95xFoCR/+NuG7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
	b=hKdFED2fhPexXBfK8SWgeM7KdKucB+SKsALZcOEjmFstjX0dr9wZ7vhm1ycS84WiKeFw
	 JtR6iRXhrgd8SC6cIZZv+/YUyMgDb2j3I/AmpvBo4pmsXXX4yKVEpMrmwAAc5vDZScEmM
	 XChQGFRIlB5aZhpa1fcbrT0fxb8DMKhO+kjjHQtFhjsFa3EBYXYESz06lCDKb0t0fMdfz
	 xbgCVgYe30PXdJ34W+2ch6qZwnZ8UGrkVvVpQjQZ96Dg42SiulrMxf/79VKKqUpFWrMpl
	 byzKmUStmVmjIWQZeqd4SMgLJjpWNzT2KnU54OH3Y3y4liQShk5NT9rbfRRyZ9VEzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BC4606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BC4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so1902955e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737580; x=1793342380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=UQBmNYbYzunSxlqefzQwlfzStDGIZ+9O+P4YzFq567SYqEcPNcMq8eNnih7hPjpmBr
         L8WJT1AH4QjhoiQQMwDxZpUja1QV5Z9Ndg3UInkU3QqkE0YIp5iop6LEpyVEeZg4/YBl
         tXWfus1Qe7w0Sl4ZfuPeTnaMSaaqm+V6iO9niRnGMaxDhAClo/ysPfkoj5EZTd4LVDWa
         4gnW+muQvuA7dEkA0uG5vZtwvTfZqtrmbYW44dkV+3KdX/fyWsQlPG42WUq0sMmn6Zsn
         hDCsNHwA+T+Sd8M84FGeOgCphhp32Qe7uNCO/Tggh7L4eqFsqZvaJvekyhQhS0RrFsL6
         t3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737580; x=1793342380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=kNGSJMZUoRluzbHnR1d60MJM7yGYqdKcBvmPU60LwRGXBVbOSReZuH1me0kLX4kYcT
         9iDhKfx858OSEqBE7mqx7X/ZZA+etFf0sTPlt4y3S16DiitDDTdQKfjMASsyDsFeK5IF
         89A42nnIFrSeOktvDI4tDV+JpBJlLjkdNShTShsX2YJ40l6UP+aUDoYohrQ5p7tH3zOL
         +5GODxfEwIPBvoC++QbC9skKNkITEaB3rRCdPkPKUR4wcKE66kqiVulMI/qU/mtdC/9d
         Rjz8rhYJQ/3nTXBHtAgeT2yCglEW1dD22cqYAjzLSUigi/SKchKyfAeF08LknPfwpTh7
         Wo9w==
X-Forwarded-Encrypted: i=1; AKwUvBxUU+wweq4K+ND1mLNoVDU9xpruLRH0/rfO4f1GdsvGk2QYrNc5/oFSpHs+blxRKGFx6BIki4RrradQy98=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIGTGCL/sELrG2t5GBIZKwQSoUr3Hx7OFAcrTkACmn4PiEKuob
	Z/wwNb9v+ZgP8wJouLqnxKugsZfAa0+86Or2OEQI8DxeY1EFqezvhEEr
X-Gm-Gg: AYBFou0Jn63Y/+Jp0ws5Skys54RXrmX1A5TqTmtgC9ZRkJVtZxhqtfHowobd5Ur1TX8
	hFpCkt8zOgA1OHS4DPwWq+deSVSudva7iKNEoIZRl5Pi2HeeNjNs3bLY9rOpBU0Qs5yuq/WxD4N
	Qtm4gx2W6RfrPdvUcdcm7wUXantVbWABBSYxt0B990Ys1bu4IE27ijCutBXda/eYvo9aWcy0HhI
	87vWq7iT5xSn7QFmgnZNPqqyj4EN8lnive5w8tBWaEkwxWcWB4kcJQT3vajfaOS1N5dTFKMwzBV
	bBePycTCVjdeUSt4AFnqSGr3vVQy7nCkajoI+kpo6GT6vVZIjPuZDtuIfU/cVjMmdzjT6PaoScO
	sIZPURcpEEExpRY9DqYMfc+hXjfsYPw/T9Oei7FJdooaSGDM2xAKV4RTRtnY1CvwFW/04G6wxST
	zF/qhrLYieEDa9mg4FZfQawK3lu9ew+mQIzr93eZitkUN+/cjrOY9XUgrB+E0rLhYExGMYb4AkX
	d08NlXXKkdSR1+Y32BT/hiqPTx/SN8TIeFLoTg0i/suVZ2lOF/+8LDrcp9FBY1nQxezVUM0JdYE
	/q1nocXOTCPJ9TiFyN6c9KQvT2fIKBO1GPY1KUL4057G679VYWYrM5YruYZHycvEnufA3vbxDuq
	JioU=
X-Received: by 2002:a05:600c:a46:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a211c50e30mr19135615e9.2.1792737580211;
        Thu, 22 Oct 2026 23:39:40 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:26 +0200
Subject: [PATCH v3 01/16] dt-bindings: remoteproc: k3-dsp: Add the L2
 auxiliary and DRU regions
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
Message-Id: <20261023-thames-v3-1-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Besides the existing L2 SRAM region, at least some C7x DSPs in K3 SoCs
have an additional region called in the documentation "AUX L2 SRAM".
This is just some more SRAM that is accessed separately.

Also add the memory region for the control registers of the DRU (Data
Routing Unit), which allow starting DMA transactions and polling for
their completion.

The two entries are optional, so existing device trees still validate,
and are allowed only for the ti,am62a-c7xv-dsp compatible, the C7x
generation that has them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 8b1ed384ef22..278b88b7f906 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -122,11 +122,17 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 1
           items:
             - description: Address and Size of the L2 SRAM internal memory region
+            - description: Address and Size of the auxiliary L2 SRAM aperture
+            - description: Address and Size of the DRU real-time register page
         reg-names:
+          minItems: 1
           items:
             - const: l2sram
+            - const: l2aux
+            - const: dru
 
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
 

-- 
2.54.0

