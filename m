Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701000;
	b=yIdRzRdPj+mDsSfbPfdV50YHMxTFS7MAyehC6L8tCVzN0JuNe+XWRwa5glsAdpL3gATX
	 Ni+t4qn/y+UlW+XCM5Vvx583m6LRXW7YahPqbC96zd8BPSv5lfJlZMlX3Vy9ZOClBtt1m
	 KGtC3R47dwa8GdUct065LZTpgmrUuhoDMIoKv/7W1lxalaCXTlwPMaQIHBPHjrqZqqDT7
	 Vllj1+l7wDwc5OVDbbEnzVyvIRgOluOrWbU9GtV7GnVPNqQsZQjDwVhnLd5nnXNFseuLk
	 U5WCLY17cJs+VOYwoPknZfa8w37mM5P7aXB8kixkF1CsfmYbVEt7t0IwneDrkU+KvTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4OMETinIJovlu+xPrTCy4U2UZUC0fxwIa7F6Gp6I97A=;
	b=TD76rta6UHmUbGATVgeBDGSZ1M+WbGOuUPV9KIjGWgcPI5egkJvc4zKP+TYTHfmYWGam
	 LSIqTSSaM4aHrD7OzdjTDVenzqVdZxZec6pLZYeGmwj55GqQNnuXyBlugSEO/3VQjykle
	 UDfNe71lTubeALy+mT+g5WDIGwiRzb8qigi1jyH2eUGdDuefpMcQie5ygyjC04y6OYwFj
	 iusmLzm/pkBXK3hbZuwhfFOGCitxzPVm8Ge0/7mBuDYz4OdhC9EmVYA8QkduqwiPxCLWb
	 KHS1+yiD62WDYu+jbTMbiOXOl52l70AwGkJW5+qa+TIdRCJ/ymOMSWnjxTW4Ooe0nzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YJUjGNb8;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6672C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YJUjGNb8
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35b2c599f43so473753eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792700999; x=1793305799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4OMETinIJovlu+xPrTCy4U2UZUC0fxwIa7F6Gp6I97A=;
        b=YJUjGNb8Yl8mGPCvs89vOVrh3nTSSFqGjw0MJ3lTwQxhMeQoLkz4swbdVDBxLqCcZD
         9Y8YKAiMRtIyrXdOezbGdWQgh5Lz2ZUKrZrCRNNg016N2Vkl+XLC/vjEm+scY1SRl48J
         Lz0g0QW9yqDmEhu9BsHbrhb3sJeZ1yAKDLBPNaH/3VJ8lUayqwbQVeR/hWMzC0sSs+Bi
         9tetxkY9oy2sZbNmfbSgTX3tfXe9ocSTTphOap7cxIfiitCGKk/Xt7Q4Qu9uxmlCc9ss
         NxMZINguawe9KdwWUzt0Yy0TTJPKOL31TvCuoMktQNqORVHEgXgDw1Vv6+lMfID9OmEy
         0mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700999; x=1793305799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4OMETinIJovlu+xPrTCy4U2UZUC0fxwIa7F6Gp6I97A=;
        b=wEDX2eJUw6kiFT8BU3Y2Z3Cak0k2qkUjopz7fWgnjUceqlRBeKWW9SWhV3b2TQ1+mz
         YCVYNWeFvZYpe0StPSTHQIJmAVQW+8G0FgK2Aqogt5GPVaC5ej/M53EqsSbBZPoj/grx
         vX2epofwUE/z2PZCl0GoiEw33LqXhgzSWZIn++ermwMQPqiD6YdtTdSUUba8AOa122na
         tLVselyvehPMtvGrrnaa890tq3vqvb1GK0uX7uieO6tvIN1m4c3UXfQ1uDzgZu12aG3/
         iNMknLo7kBv2qSh5aQfRDjzV79vNBlAnBI8bl4G4L01QHl5+LTncWkKxKz4rq7XQP0zb
         1g1w==
X-Forwarded-Encrypted: i=1; AKwUvByBuYrgQFHslo31C7RNOpPfm1fjdTC8kQ8OkHt+MAB2sHyQ28NtAkQp8kX08VjFGqH1N60WfsSbzBoSwBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPVUZ4w0l829fTqaRZDHzDKB+7mHAy52Zpthj44mcVh3HynRCj
	QbMNmzJ/fDEPgRqIK2KspfgUDZdZwL/0cUe/F9ol+3IOuxsuy3q4FDKv
X-Gm-Gg: AYBFou2Vul0be8Oj9W/ncX1KRWzWF/jGW+4ovB+sp6X+AmdFm17WuONa4XJ40LYCnLW
	n9Gv4elrWwBxJVU0wYgZT2XnwgBFGKhoIjkV2j2oZFZoW7cwD+8w6PAnjTMnFl4agfobabPKIrK
	X1V7COqIokoVKSphFuYwd32Nd8iB0Jvv8Uh9YOa0pLC65y+oTFR8p1+4TeJRNjK9sCzSgUlab6m
	G+rVK1ov6MV+npu5B0DH1kd7SVF4OYPRyucVxBRUn8BoOtqKTguJRjqTiJ90Uit3HWevCsUgsy0
	bujyaYYYjaclGShed7e4eMfZWe/E3Mrpp9pEY0rPgqJMGif0ZxBwrBD2VFjXgwUcaE6X5Po5Pmd
	nbzL332+RxBj5a/q4EzkNzdU4r/k3HNt19OKTCtsTvuGYAq3VBMsZW/vnLiBOvy7o8RUA82mTsw
	41Rd30kj/lnJF2BRXKdxbnyXxHR+uBFG9NcSdD6HqOY215/ssjTpACxGz3fuzVyEaDqhxNyc0ub
	3HDqectVD55hW7SRdQtKPgQXYqbd/coThoR4BFrG19pUnJXhfDqHQseEFLgcRHLYaW7Mm5AChIN
	T1fJqmLsxbIBKH2huw3FYpwf9GYOYOPs2qSSe10lvgCr
X-Received: by 2002:a05:693c:88c5:20b0:366:bcf9:1807 with SMTP id 5a478bee46e88-369d983d38amr310690eec.36.1792700999195;
        Thu, 22 Oct 2026 13:29:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm283894eec.17.2026.10.22.13.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:29:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/2] ASoC: codecs: twl4030: external mute GPIO lookup fix
 and binding update
Date: Thu, 22 Oct 2026 13:29:45 -0700
Message-Id: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIADly2moC/yXMSw6CMBRG4a2QO6bJbaFNZCuGAY8fvUbB9AEkh
 L1bdfgNzjkowAsCNcVBHqsEWeYMXRY03Lv5BiVjNhk2TrMxKm7PmitW2OMrRSh7gdVuYrB1lKu
 3xyT773ht/w6pf2CI3w2d5werLGA/cwAAAA==
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

[1] https://lore.kernel.org/r/20260724051822.3545532-3-dmitry.torokhov@gmail.com

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      ASoC: codecs: twl4030: fix external mute GPIO lookup
      dt-bindings: mfd: twl4030-audio: document preferred name for external mute

 .../bindings/sound/ti,twl4030-audio.yaml           |   8 +-
 sound/soc/codecs/twl4030.c                         | 108 +++++++++++----------
 2 files changed, 62 insertions(+), 54 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261022-twl4030-extmute-59e516f0e056

Thanks.

-- 
Dmitry

