Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136733;
	b=gBatbYpsNAYDPAHj95Ngk5EMJ23beKITUWJtyWVPXpBO0AEcixNWi/hkJ7umF/475r63
	 BwHXASpePE8N571ZQCe9lLwniYN7tAwvanyQvtXHT1cM+FROczQRwRIz1zoNYz/97gE5Q
	 fdmhZGOf9VR/dhMTXeGZLukR1TYuc0JpJxM9tFqcSGzJRE81N6egQs3Ilu6c9rBcX5h2Q
	 crU5VCJvfeS8jHmNd89/Cmm6bHKfxjqUaScBSYDJs4ipoGsyKaPFfbicxs5haBTuBiz1G
	 8rhyIdYEuYEdbVWpqdINmia4aArYjXSVrigDc5RfIia2XRIFTkRCX7jHrO/QMjdXkbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
	b=ddCJkF3n5KEBz5FL4JO40qQ204X99awlFLGV9o8pyUDCQELnZF/9LZyuVb4fSyefl9Vl
	 VLKFTngWdvK4YQK/qaLfwwBducBvREVjiT8vWxgGaHZwGbSjIwYwRGnLPzX2hvQhpvAbv
	 MPj2plz+d2uzyujUpZtyC0waEpd7VZuxRD5UkAS7G+ziQ/KJTQ2CS+kZ5G10PYRat3H/a
	 ixbVdP3kn2AJsQBUY1Td4vBeE/YL7c50ONxQ3oo9O8nOlyAuZKog02XH2SWDuYsu+HkjL
	 0I/8iFIdWOfwJB8MB+V6Hkiu/aTcMQ3AWyzXk8UF7yy5p6yu0SfIGsGichMmRE5Ez2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0IBx9JU;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F5606A333
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0IBx9JU
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35d0be18c71so1743396eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136732; x=1793741532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
        b=p0IBx9JUeqLNQKKLgrDYtI9hCHfsipOF+VRGSGZFhrAy0spjEU4EHRrZKKovrYz4Rc
         RcDEV8+9d3MQoV0Gf2/oUpywHi8OO+b/NjKIxbq902elA4BvzwXjzgU/Wrj4nuqhsiis
         9BfxNsq9c28+btj3j4fxeUQqeVFhTXffpY1WwwcIF8Uk2LXvmlyiOPqongxcvaUpgzoq
         CQ644GdTW2dZJOGWO53sPVN2LDYXpLogY59psQlgdpI86Eh5QFy7CR5bKwHshjLUCriO
         nGsnvHCjpJm3Fey03vtRohjfOrZqz36nI3fa5Lg/cQ5LqEAdMWdYiM6RgP42Fw3ZyyP+
         9coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136732; x=1793741532;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
        b=y/IyeN/600Ob/HV5bRgti1DihyU6BsMNLkfHsEpXM/RLXHOiAcsVYGiFf709pJpJ7o
         56lMhpMRkNkWZG1X35nAW06uC0kEvJDCvLTt0M2rbaPMARNC5C5tF1jvV6+vxkEEpN47
         NXi1gWg+D8ASQKhoCk5oB1pkBn0XBodNcSQ9tI7HfBsyuNCf8P2vGdsjoH5dLgmewb2l
         CAeUyUFgXWKBSrvIG6DA6fYuYqIz6fn3fiC+qsBJNfNpllzNVv9UPafijcBPIqMlpR18
         abse5233rC7RxV2aW22E4HnHGDGiEvhSmXSnxeS/UG0WPkLGE/tIjZ7HuGMmO/NFWEdr
         SAxQ==
X-Forwarded-Encrypted: i=1; AKwUvBya7OjEmcAN95ZKJclgeXHbAu9Evn03Ziw4AOA3Iy7S3dMd57hC4GoUo/P920QoVtQlNNXl4b9GCV5N4Bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPOHTen9Oto90D7liip9wKlO/igCl1p9CniLGy+At/LRarNQ70
	Xpr6dIOFKhQfgieFA8WDpt/f1LSIakJZPHR2ZJtCo6zyZcxJ+7l46uZB
X-Gm-Gg: AYBFou3sZ1BPPRYpVMZQ5GP3lLOgHE//6MLNOl8YfA/7+dX0iIH1xgmI407Jlde8PXx
	vHP14fbGy5b/lBYF3meFVPa6nnG/nCNasyZ6or8/1tbdnxBVfyOO2aFoulj9FZOxZZhbX9Ktm7v
	bGRPU4KE2iW/qzxjzpWU5gTHXnWUCxKCXNOF8fXK8e8KO+VNyPvruPE055NZbSZzA5SAHx7NbAc
	G92gvKZBmhbyZfs34Vidg2kIKRMNODxJ2HkU3eT5Zsqnp2v5aHyqx33l+GaBSPSHM+LaLBBeQH2
	2rJgY8dt4FBlR+xw1w5ZI1JpGxwk60Lngrf0jpHB8JVus2Pus9zyPBjg8aCZyeNirxjE4c1oJq9
	w4j+/m9RrC4htEvfWR75w8otAR6UK0n3+TP7G48ejBgikCsimdWRXA0JeejNe/nu11CucYveq+j
	DqF0oUOBWRBUKKHe9kQfkKH6iEthI8ny1gyJ+rdl7bbMi2FARpMJkfT+wcTF+m97JjLo9Vq79K5
	H6qP9EAo4wQjOgCuHxUck7oqLetvcWfzVNqYTrPHXBOWbk0qu135yRBB8as4roX15vatOSBK/hq
	K07qWwmtCiU79cTLI4Ffgfm4QoIgE0ofC8mlikIJFVcd
X-Received: by 2002:a05:7301:578c:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2253a951mr181484eec.8.1793136731987;
        Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm61693125eec.25.2026.10.27.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] ASoC: codecs: twl4030: external mute GPIO lookup
 fix and binding update
Date: Tue, 27 Oct 2026 14:32:07 -0700
Message-Id: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFcY4WoC/3WNyw6CMBBFf4XM2prpIE1w5X8YFkAHGMMrbUEM4
 d8FXLs8ybnnruDZCXu4Rys4nsXL0O9AlwjKJu9rVmJ3BkIyGolUeLc3jFHxEropsEpSTrSpkDE
 xsK9Gx5UsZ/GZ/dhPxYvLcGQOoxEfBvc5L2d9eP/rs1aoYku2YDJoq/RRd7m013LoINu27QvXg
 8U+wAAAAA==
X-Change-ID: 20261022-twl4030-extmute-59e516f0e056
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

This series fixes external mute GPIO lookup for the TWL4030 codec driver
and updates the corresponding device tree binding.

The twl4030-codec platform device created by the twl4030-audio MFD does
not have its own of_node or fwnode assigned, as its DT properties reside
in the "codec" child node of the parent MFD device. Consequently,
standard devm_gpiod_get_optional() calls on the codec device never
succeed. Fix this by looking up the GPIO descriptor directly from the
codec child firmware node. Also update the device tree binding to
document the standard "ti,hs_extmute-gpios" property name.

Note that to fully restore external mute GPIO lookup on existing device
trees that still use the legacy "ti,hs_extmute_gpio" property name (with
an underscore), the companion gpiolib OF quirk [1] is also needed at
runtime. There is no build-time dependency between the two changes, so
they can be merged independently via the ASoC and GPIO trees.

[1] https://lore.kernel.org/r/20261022-gpiolib-of-v3-3-42c3b6439fba@gmail.com

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Drop redundant $ref on ti,hs_extmute-gpios and add deprecated: true
  to ti,hs_extmute_gpio in DT binding schema.
- Link to v1: https://patch.msgid.link/20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com

---
Dmitry Torokhov (2):
      ASoC: codecs: twl4030: fix external mute GPIO lookup
      dt-bindings: mfd: twl4030-audio: document preferred name for external mute

 .../bindings/sound/ti,twl4030-audio.yaml           |   8 +-
 sound/soc/codecs/twl4030.c                         | 108 +++++++++++----------
 2 files changed, 62 insertions(+), 54 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261022-twl4030-extmute-59e516f0e056

Thanks.

-- 
Dmitry

