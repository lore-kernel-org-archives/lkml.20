Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737585;
	b=Cs+8LgGAG83T4aHQ1cAtd/4oX+wq9pj6ZOhC+EUcv7Ybh134q7aV31wzlUn/N6fqZalj
	 8326M3U6nCXQYa5x6AikNnwl6PA08GEGURU1cDvOh7kVlSVjOpmFq2dwvv3B0w4oxIR4L
	 KLpHbc5Yb/Uxr/AktHaTl+PagczsVQthGxLvraOmHmS2ClWHrlxbas0GQS0Dn12V3dJ28
	 IKYdgmyFPDrUoe+nUIJ6m8WFJUsBvZKh01MRHiWjqHZcH4dvwcbIYAtkprgsHI7VO3fvM
	 D/XER+h+4l0OSaJJ01iNtKmYIwJf2cIwLbpVc4eLA0R+NEXtInsHrjQlVIAjIMuRQAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
	b=DuNY8/SG/UNd/RpSYY9TwZyQ5tv9aO1EzKZ/Cm+MXUpXO81vUQm+mUUUTvWs0eApoEYH
	 EbLXNF7t8uoVsbXk2vhXv7ZReNj+/7DOuC6EZWChd6Z7gsXg7Rjfd0XWqm4p7i9Y15Oci
	 gQbZdImqzWWifwXnuufbPmLPyjPR3L2Tf9cibkIFWqcZ/encqKsnEOlRZruXItMXO36yr
	 FidZwyjomLZNtu67o3VKyn/aufySWPWhrGSitjCzXmGLQJ/gGSA9E2ZeGUGxT//oigw5U
	 4oubBFCzKTovTCb4SF4wcq0wsKYZZ6Nzb7wPAVWRnXt9sJSPjT+tSp5Dis2RS+qOGjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC1606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBC1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso252324f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737584; x=1793342384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=K5gmrOYj3tl5gpqCrSw9ozcnETPEC4k8tihxf6zDQDJzO6W1ugLAFbGbsv9Cz/MxUB
         quIUfAE6oCPFSLcX8P+JtzAwqC/EvVQVqVldkQtMgEtTOx+hyvg8NvWOS4XYCf7ud8/o
         Gzc0esoT6mvjMChNOgbAm9m7/Zm3rnihd7W0X1kADDuHzZZYih0caal6tQPHJOejfhVK
         K2BbjC/G+1p6cfFAnupiIBsCBTQOgMBNzgIf/8rwbqnvo+qua43tmcZ9lsB9uE0vJbXz
         TBLYu0YNtvQan1lTxqxqkmOEetHMR1uVhpgkfELL7ASKGJziVeEfwDGBOoqAdY7h9Fsl
         950g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737584; x=1793342384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=vr9FwAx6ho3FZSKpuYmgHK1VLp3j7Kuq6a7jYFshhuJ+siz9ArYa4rBtd1hhAsECHc
         rbw2WtzK1oHsatYji78bg62haDQnP0/Q+mBF6GmnAB1YbLF3kWLyEQ+kj8z1ZeiYXyxn
         00LwGVpzveqU+ARVn3Xvsf+vQhVvUXhFZLDT6b3zBtI6Q45BXh9a+T0JnISSXDqrohdu
         31XefUvisj+i7nMPCI7FOU8K0I/CBtX/sBvzdzmjOyCOylj3BvnjsIbHBtGFaYfXiNdF
         XF21weHx5FBWb6PVUppOTEomX7DlpRM1pucI+JN71RZsMtrzEGaWQbLcWL+KOHh8B6zU
         IMdA==
X-Forwarded-Encrypted: i=1; AKwUvBy3CvENLXhJEBWfTDL0dvJA0Y4CO/PslBCv2iDQ384mLC7r0Tt3X5WQTG9okyQ+ryfZLRbt4xhhqGH205Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD0845nMv8YGLp0hZSccDoKWvulmvEA5HVkEag1aEaC5vXpV9D
	+9H4hZ4pTENsbUxUbDEgmJbmsPia+pbWXkz/ju4NgpJXQxnL6H2HWCmW
X-Gm-Gg: AYBFou3R+KWGxwZD8Ay5eB0hh2JJxTC0myGUvG7VE0Vo0zsY5VD+G9CNy459/HVu2Nf
	ffNGB7gnLr/2FMfuT4zAD240VIkkrz9j3IrLTN+iFo8iWRDzzPSKH9B3OosGNoWznOcQSRLiavn
	/qL4Dlo5817FuKWAXJ+Np2UM8z+YdvxC3z38oc7iOglBJN8sYADYEogbsGJ4jqz0sWJKoZcBcip
	FVHM8150E91B9dgDvwly2A3Jb3M975WdtuF8R7sMJXO4Yu4yrTmewLxPdRLtdZEfdQAw8gwAoof
	lhXDCgGGRiPTc34/3jyY6fjIiZdo4+8BWodyhYXLy51xxxPQtOuwq6xB4nvY2jYfwvCwAekxXW4
	rnkza2tLRFTJugT8xOs17po8YozxBNP/7b5Su8gwZkrUQ7nryXQvGv3gbszPPBQApdNTRr/wyi6
	lDyZIMxb6E1Qgzn4oSqrnHm7Zk1/xwgpK9V2H/bQusDP6jn4jGRtenH2y3RidNNzuws0ngVxa0v
	kNyEOgXCUC/LQD159OJD5YLmyYBuWunZQIH3apVTwqNz2ql7sTB6Y2REHOYak9gHw2pdDpkIkUM
	Bx7/QGfMRLUMTlewIyDDfByqI2zIAlRxlWt/L/XgWB166QVJNUc9dCDfDWsHM5GGKwWL78jOw2k
	b9TM=
X-Received: by 2002:a05:6000:15d9:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e385b9322mr977703f8f.47.1792737583628;
        Thu, 22 Oct 2026 23:39:43 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:42 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:27 +0200
Subject: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
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
Message-Id: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
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

Allow specifying a second sub-mailbox that could be used by the firmware
in addition to the first one, which is taken by remoteproc.

This is required by firmware that doesn't use rpmsg for their
communication with the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 278b88b7f906..d6319c8e96f8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -51,10 +51,12 @@ properties:
 
   mboxes:
     description: |
-      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
-      communication with the remote processor. This property should match
-      with the sub-mailbox node used in the firmware image.
-    maxItems: 1
+      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
+      communication with the remote processor. The first is the one the
+      remoteproc core uses and should match the sub-mailbox node used in the
+      firmware image. The second is optional.
+    minItems: 1
+    maxItems: 2
 
   memory-region:
     minItems: 2

-- 
2.54.0

