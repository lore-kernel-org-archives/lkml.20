Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694863;
	b=4M5AU3JX633Qa355AQwjMVLlSVz5fqU5RDl1pJhug3rWzh4fu2LpAvMJmYO4QtAY5Tji
	 xoYmu0zeCB0sVdxxYz+R2WOa2JRL5yCvOlesYJHCtmO/Q7YhREqK4qBN4Z/8OfVoeVCSG
	 0j8GVnpYC1bZAioAo83OBf0ZxnA0vxXF/5+VLAE96Xt50dTWf1N4O+iVeXs++u5JlCq3x
	 cadauiAQIPVUaEztNU/T1k8eslcChoPYDRBIi0vN9u2LpRyDvVjeXRP3TFWYzGmsj5iFE
	 SXFyg5yisj1Jv63H4xpGdG757QvwYxQnmIrHMUdsEvUtic7dRK7L5lq6iL7Scib8Ekg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
	b=ROQWq7zVqPmP/RWAlrnZ7sm4A+O3m89bPCPAwTr57supvHhRny+F6K7MNGBsTrUkxVBk
	 yP0rRxxzxS3KMnnx8mVLKPawW/wmF09s3JkA/uAaVA7se1Tus84/+iiHLeE7olj5dcmRo
	 XdjM4gKWn53Au18sNLyrBJ9zweibdLoMT0iWONARBWt57gYzT7vEHKrSrIpH+PRgh4G5w
	 dF4dbqVQE9Snspmv4eiDODGtCJZSkyekmMZt2gCSD7+XgjydUftn6mlzAFk8e3lmufTTP
	 lFphLybKDrymqP1tIt3kisb/CgRTVhem4POykDCDG2Bb9r6jGZ6vBMTrSRDffLqkXHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hrUyFfUi;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30B606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E30B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hrUyFfUi
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso444864866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694861; x=1795299661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=hrUyFfUiHZIJfuaCs5+r9SLMZXsqRGlL1RUx4DAD+ET3JDh6rPTUqFK/6YrU+CRv1Y
         h1yLcdwf8enboao1bvfWeAX0zoRyF/MVc8XnJcTz2nzVCu2JsLw+iJfMauwq5agehDRo
         n0GvI6j0NQkO8aj6EnU5O9kT4T2k9QFArNuBOX5mUMyfQ/N4ypjim+6xLPZcDU+UvPzD
         qKxslKdnNkA6y4wHVoK7SqqW41RXqJrexMEqYLJY1JgK7QSsovh+FADgRc7xqAxgD5Gj
         esesVVeNu9T+pItTNOolrsakMLD0dzw83cZBsN6sI7gOftC/9CDPAtVvUOCtHIz8nVPs
         4Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694861; x=1795299661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=H16PbIwGJVXDDfuM8yqJGRsQHOWIt6hrlpkaGp/uF2IzmlVovVHl0vD6TCXIFa+awx
         /3DGx45Hyx6bpy/+Vmw61jLUm5sJuaD434U22pKORP0DOMVMXZsohky1LcB4DmQb3AR6
         CczekM9KkhfnXCv91Q+AweRN4JgzcXgiRdgE4VDCgQbbP+WgkGxDThRPuy3cn0IM7bWX
         ELdANMGw38RtF5dE1clTPVaHHodJVhgRjMI3AqFl1kwUJIIQScJsAbMxj0wG1yyGqLvI
         1GYhcQbea4iJOKjMLmMTrLdH4XmamHV3a/lOMrTT//bB+MNSpE2h2dMEvKpG7MeSPhzH
         ZHVw==
X-Forwarded-Encrypted: i=1; AL+hErH8rMnSQcKX+rKfM6V6f3vuk+5ScuG4UygDA2JwuHRpz/TXrHzlrkjPWM0dHOxODJ0/0Mm/w1uwmSqkzyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+angnqbobie5vaMeLQmC5OhViufEThlNWlCyuXjm6I0w/Smqa8
	gr8FsSVrgD2Ih1/fReyH0icQZ+1Q2x3T5b+A1ztalNFdSzrFpUMHJ+Mx1koUl8khL9GE/QsSWTl
	XPhFk5Q==
X-Gm-Gg: AYBFou3JOALeMlTOLpOWZGuCk1amVRHI4pbjhaYQYfQZDD0Y3M+tT8xzrk/9p7mvHbl
	GeWvGS9si1/nkICDA9YH4qQHa9Ut1m2ZOyIQypSYWMwMGMLiHw+U7FousQNiSRm1HAB0W/MGe2z
	USsAjRTQ+Gd4uernwGL4gcbAg1dIBE2beX0YxZmqa16KJPhgrheUNJnIC3n+/aeVioone+C9jx7
	UiRVs956A66KcKiQBGsxQd0jgTK+7iE0HtUobRR2fK2fSogQbsY9IrKGyQGXBamP4Ph3I2N/2DC
	iP8mo6HqyMfUs3sjiP/H6IdmmiswZgRn+xkeL8CiS+0nRls/lgcb2nWovW/KKuk/2bM2vUa+hUC
	noNBfDxD1I4hTVaitTI37qOJv9Rikr3zsuoOMP696k4W+0tW55gUrqOvwA4gNJqsp5zrZGSoZqs
	yvrVhGhKl7nzM3uW2apGDJo/eFZLpGqOJqm6CtjPc9uIK6IrYt41H07eO6pnTmzF+dPKt0BU8Hv
	e786Xvd6svB0K9kQXTUEi3c3sdVFFZe4zHnq6hzQnQ6knYpUTzOImsZHp/+v8sYKWbm025Y1nlK
	wqeNbGG7HCoBNbux7niw9K1wfQE+iOEGYLFi1uvWFWZGeEKEcSRyMDTdo3iC1iW7KEbu+8+STuB
	7Imzu5Ma0/GZwTVOnnuTDOE3DrlnAC/fjwBU+rKeQ3nZ8y99rS0Jz+/qL7rriBD2amGUCBvhlb/
	bfDnr1S7EGSFvcNz7Ad5NcdoyQvFRfkj1KQ/fgjbfRvKr+5mFxzQd9zJgEl2Fheu6V7IFCX4JJe
	GqHSuAcjfvDc40+UJwGj0byW7EkcQTg6+gimwyrVkvX7kUB9zv4I/witcqVZ94MBzEN2TH4mKjp
	y44Kf9AL7z73BzqYRU1l5tHeD1bXSVkTzxmImn3u63vT13a3gXbPu2CHqD+o9EU9
X-Received: by 2002:a17:906:5146:10b0:c46:645f:cedf with SMTP id a640c23a62f3a-c5096398ad5mr419322766b.15.1794694860698;
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/2] wifi: ath11k, ath12k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:56 +0100
Message-ID: <20261114222058.184034-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

ath11k and ath12k request the optional firmware-2.bin with
firmware_request_nowarn(), which silences the kernel's warning but still
lets a missing file fall back to sysfs when
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y. User space then gets a firmware
uevent and OpenWrt's procd hotplug handler logs "Could not find firmware
.../firmware-2.bin" each time ath11k loads on an IPQ8074 device that
ships no such file.

1/2 requests firmware-2.bin with request_firmware_direct() in ath11k,
2/2 does the same in ath12k.

Tested with W=1 builds of ath11k and ath12k. On an IPQ8074 AX3600 with
no firmware-2.bin, 3 reloads of the unpatched ath11k module logged 3
"Could not find firmware" lines. One reload with 1/2 applied logged
none, both radios came up on API 1 with WLAN.HK.2.12-01460 and dmesg
showed no warnings.

v2:
- add 2/2 for ath12k
- drop the Assisted-by trailer, target ath-next in the subject
- see the patches for the rest

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath11k: request firmware-2.bin directly
  wifi: ath12k: request firmware-2.bin directly

 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/fw.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0

