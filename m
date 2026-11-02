Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626854;
	b=fho4wfkkvUEHA6NRE5KrKUPBsgmycBGMIYGdmEV1JxuQiq55U3H+sO8pk3tTMfQxno7e
	 ueCabGkb9vkkbmkGOecRvmO9dNjFK/rctGLe9FajEFaJnGVKfuIWdfZIk3TA+Sbdlt2Zg
	 iKdnCjA6REBL4fucQr6cdgDgKRC1jsi+RpHnGId8aYghvQUdysgAbSk0Rrrw9aQlEqulz
	 Dg2+l8KJcqaBRQgCz177ezkhNfM5paN2ffPDDjsB64oRVMRW+h+O6AkLGHcuqdfps7k6a
	 izuXpcgP8flnuEUC7N8C7IsQp2FBFWg7k8EbEt0sU9lu8nlzSyfN5MqUnod6+kS8trw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=up8MQ9r1m3V+JH2R7D4OF66kNdk3l8gmYgfzB1Td7Q0=;
	b=iPIgfG82NamOBvcv+7QhHcwV64qospgOG7oFBs9O+7+CuPTSMRxEgx5tF4e/1LT49EhY
	 hqE5Ebz/Vk2dJN4CBoPQkZwhSyhGHvHRvE6kw+t8MnUWqDe13VyqF02jkp+ARFcdkCsXj
	 xNIuAPA4kBAmHyL3bSGIhNDt0d88nxY58ocR12gxMxCrAwA6Fjd+Ta3bowhG3VHJFfFPS
	 htP6Z2zyYZvG3pyVnynys/vbMqg1659ssp9x0cNYqqluiUTimllAVzgpnmVkHPU8yD5b1
	 V4U0as/OEJqDvhaPhUA0bEJllXyM+TeuEDcOc8gD/hmRlh3g7ozu5h1kmMcLnofvpBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q6xD7XvN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C0606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 349C0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q6xD7XvN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34651105e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626853; x=1794231653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=up8MQ9r1m3V+JH2R7D4OF66kNdk3l8gmYgfzB1Td7Q0=;
        b=Q6xD7XvNzytBM4qyaicTSBR3zr8Da07RvUOzEBSs8b7PMXvjsoIaIlXo6uFJmLxSLd
         UXWMtnBboWfnX8lAsjRwK3Oa5yNUTQpnjp9kDekhun38Xd2M3zBGm7DHrde64fyX/66G
         FqwpCTtmsRe0T51nVojK2VMbu+Kv+7Ta2nEH+Y8WUCndRyUrCZ49hUB6DvvH3axKlYTp
         qvdAjalxITyK+X51gtof1gJbXiRDTB7fUz3pqhLDUBLOncsVd4xbqSuSlf4cO8nhIT5J
         v1XR46LqPkcAwuEW3Ss9VVzZkfMkg3Yd2MNKb8iNA2C3iy/MmwoxAE4e7Zx9vId24dbW
         gShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626853; x=1794231653;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=up8MQ9r1m3V+JH2R7D4OF66kNdk3l8gmYgfzB1Td7Q0=;
        b=TNVGBCuAwg0qiSEqNbZHIaG6S39cOhXGGuA4ukNzwF80Ex+PQNkNZhdraxfwMA6DxO
         OUuPcAg5/dT6YOoO5IMy3uOtAWWnktLANT3OsRIgp9MglzGfBBfRFu1TplobDda5F/R8
         /XV5u8Or5j7MDUU/qVtfpH6B4c3Jonu/oGwKlWxCj8CMPw/ikD9JFDmPx+KRXKggRb3o
         otu7cSTVT1X2znB8OCEn+LbHOzD3eMZhkk5m3K6HprOOTEWefAEmf/4xhqt2AWVRgJbi
         6+Qf5Sz+7W4BIk7j+XQJzyxpwH9XDdrEng2RF0HJZOYDqQmW7iShqkHePySQN06O+pNf
         Cvew==
X-Forwarded-Encrypted: i=1; AKwUvBzTuhMHejTuo1rk3SNzjXUjghTXQfjn9Ui2D3XRKeneVmFv5VBXXPsCnlDMmWwVMMF1So8fsU5jayYXg5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPtVUm6XffxNcLJv5r3Sx2l9C79XHaCDwRn6u9E8u+2X0QZghq
	QqIQy3CP+gpaRUoYhPMEsC07JqYoetv8ra4ahZFHNjg7BROtHy/qjoHVO28bqolzdZA=
X-Gm-Gg: AYBFou2veaMZa5tf6XX9PHqhx+HaGeH4xMO1tqwLKLX4ris6zTzXIwNQaBRoikudS5O
	nle5rnRDA0RIdXZsfXOEzI3+e+eXrpZjBHGg/apEpM3L70PhJwYwrrho8ODXom0kxtjX56d1IHb
	upUrM2Ei6BdNpmEVU12rnEwOEDZMGhYmzrbVTmO5X7WuEdF+CBz810gb6suhzB6AgK42FXeEzZd
	L3J9q6B0vZgcyL0P/jfOz2iGPhwcdw+sJhx+M0fHL8REwSdjZtbAoMDCuHCWEOO6ygTZdOx1veI
	ua8fqK6A+/DLCdDuWfwobIdOkKhxcgI3G5p+HUGJCQqN32h60AFJueYvMAREztJxAYZ+/aGeur/
	v6fykngith8PLaP9kg2ZS3WfSfKBIQpSbfQUVxtQS9fyo0mopnXS9CsUN/BmTSfVkeZ2g9uHLYT
	YL6wgSqSmuCkNEaYEmN8JY5ij9wu9bSa61A9xA44VgJmWt4LI9ZeY456vLsJyWtwb/XPKqgk4mk
	EoAj6RCSfkGHbStAUNtQuRs4Phe338NjGJHDSYmXaIJ0GWlmfQrj9SMOBSuuht7q2RhuJwH59RE
	C0wf0r5g1mnTUqD/LL6NXk8nYc9yI84cXA2OLD4yuMovRRFxjLHuriOLxUL/JP6I+Chauq4=
X-Received: by 2002:a05:600c:8b01:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4ac1737c682mr237096875e9.8.1793626852420;
        Mon, 02 Nov 2026 05:40:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>, 
 Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
Subject: Re: [PATCH 0/4] drm/panel: ili9881c: add support for Mingjun
 MJ070BI30IA2
Message-Id: <179362684913.3310106.12917918779608270334.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:49 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Fri, 30 Oct 2026 13:44:11 +0800, Icenowy Zheng wrote:
> Mingjun MJ070BI30IA2 is a LCD panel used by the Lichee Console 4A
> device, with a initialization sequence matching other ILI9881C
> sequences.
> 
> In addition to the normal binding + sequence panel adding part, this
> patchset contains one extra patch trying to address a hardware quirk of
> Lichee Console 4A -- the panel could never be really powered off /
> reseted in hardware (the reset pin isn't wired to the mainboard, and the
> panel is powered with a always-on regulator).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: add Shenzhen Mingjun Optoelectronics
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f423a211f99ca820c2c99a84a3418aa505d6dd02
[2/4] dt-bindings: ili9881c: add compatible string for Mingjun MJ070BI30IA2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ea74b623855291e60835c0f7fa7a29673332ad41
[3/4] drm/panel: ilitek-ili9881c: add Mingjun MJ070BI30IA2
      (no commit info)
[4/4] drm/panel: ilitek-ili9881c: do a soft reset in unprepare callback
      (no commit info)

-- 
Neil

