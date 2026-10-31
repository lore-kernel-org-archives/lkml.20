Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793433222;
	b=oTe0RWHcyZmLQrVoSzb6stPFX7/G/vRI5OPEPe98wf2vitjfWRipihmiuImmEgkdekBy
	 eHDK/AQ+2ETmQbztlQgAu9kNBF8Fw8TBO4x/2OCP2Tp7v/1KGcsT5ipaX0RtGxEQpXhuz
	 PDbHOuf3K2PjhNzb5Q5y8Gw4ow7lKxukSqiT23reB7jS0FD38zZh0bmDeA7IGjVT8f1YW
	 mzh4nDz8Qj92Qsz5LHZ9d/Xw3hJlcVeIGB6eYtgGd1E/+d9Qy5amfGwg4sod4wQ/Om3sl
	 mSKNaVVStCWU3Zakc7cyJ8XxIHxRyp7zb+DA3vKFVoVCEEvdO0g8rlaj+yZXQCpLl9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433222;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=MVniiJysOIFVs1zaeWA3DYdUuigiKHmMs2A8x+/ifcc=;
	b=yZstZg0Hzdk+fFqY5/Ssf/qDKkKMr3uFUgPMxKIitvtF03PSkqzj7rMySfz2dPD+M2eI
	 EvvEi/jaHPgZ87ntQggwqIIAhbHHhyK2Dx0oC77iNKyHcDXelPQYLxdRm1sNIGq+ivv+E
	 UscectV7u58CSzp2uBj6j9I5qxrkYWQIWzM+tS+4ZDLAqbYEUqbegmj+DYjegT4k+S03Y
	 xWq3z9jy334vEf4OPWvq77jTS+CwU9tddYkapM1NfH6it9FahENFi3mU0cDehJt2olUAV
	 9nr6J/gaFXXW34MtcWFZE72Dqa0XfwEbEtnlQRV6tLHR37JuHlLvXmlHcDDcEyDGPgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P57kzwwE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C5606A31A;
	Sat, 31 Oct 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P57kzwwE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793433221;
	b=AgvQ//6fYiDIpnyzWvL4DqGnaVhUt2H851adlvCGHKKDmUlaAcTiOgGDXabTphKVxP24
	 Ozy6n34izyb8CR1AB1cU5oAYRs0IYA/RhaQP6bq+VOQLmwtgxem5yOaSEm856y+SAOvJj
	 0XSr+gmjCLEyrcYnl5Ai4uXicn24XLbGkl5duDRfBpfp37clbxFZ6pLsCgLxaPzfD0+TJ
	 RDNCkNNUu09k2VkoMgzN7+qL7tNoszkewpu7nIYRrYN8VAKbLqSXz4fLT3Plm3rewm5G3
	 lxhRGB8q30AcNx7vd8kvSLZ1nCjnflra4+aMEiv6mEDX7IuVOjJYTWWz7MZlYQcQJQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793433221;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MVniiJysOIFVs1zaeWA3DYdUuigiKHmMs2A8x+/ifcc=;
	b=gY3QxzY+Dru2WfxvfoHSFoUQLwZ7kLu57g0k9j4QS70NLYo3jWQklNPLtR1PptoDNPuz
	 064n1Hxgea/AP3VncJcDb7Q57eYG1lJHdGA4IDPDsGnWL/e9Ua5DaxYH2wYGkUDi5lUb7
	 uuBOkgUAG9dogt0qW/e7JfLH6848oYJfrxUFRikUtbJ1tkf2QjE2irVsfnniDgL5zHG8P
	 IOcIuJOQwBzGBITIh/7Y1vMadTAVw5DqtzYRwNYNJXQzfOFgsUOppglWqNMzPSd9QRyEk
	 PJ0iLzNIQjblmReiXWaJgH5/Tat7b2UALIYsgIXWBarQQBhadqXLJAjQKvbQuCvW9Og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2015B1F000C1;
	Sat, 31 Oct 2026 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433221;
	bh=MVniiJysOIFVs1zaeWA3DYdUuigiKHmMs2A8x+/ifcc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=P57kzwwE0IVOXrFAnds8QvdmsdZOfuePt0EFrgbML9FJDz4c5WsD9PNka23qAOBhl
	 PuXtvcZffNblzeZak1BF9FgtWGZi7KQ17HEfv3hEz1ImsYnIJ/dzbv+6F+Sw+Hn6cX
	 Aw/W5stnDG4poMMmsYA6jC5ysxvef96/fxZT3bDgqYTbHFvISYznO31cauWJ4v8+eF
	 P62kyv5BzeN1Q/L2DOgbo5+0Ls81S0x21bKNM225bTesHucM1Nppd848IyD1oNzNIX
	 NpMYSEkbU0g0ld+BbPl0qzHfi1O5DFR/JUcpTMTU1/eUEOsjg3Un4bbnf7ifpmf+e7
	 t2fSk1Dm3Db3Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A34B2443AA;
	Sat, 31 Oct 2026 07:53:40 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH 0/5] drm/msm/dpu: Add SM7250 display support
Date: Sat, 31 Oct 2026 13:23:36 +0530
Message-Id: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqAMAxA0atI1hbaOoFXERfRRo3gQKMiiHe36
 vIt/r9AyDMJlNEFng4WXuYAE0fQDjj3pNgFg9U2N9omyq27kqmwmVaoDWLmyDhMIQSrp47Pb1b
 Vv2VvRmq39wD3/QD5iH8ObgAAAA==
X-Change-ID: 20261023-dpu-sm7250-a01aa5de1da4
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793433218; l=1402;
 i=patches@brar.si; h=from:subject:message-id;
 bh=lImhQg5lCjPx2m766k1nCRU11627wdRxlLCIAzvpVMA=;
 b=lQgVyB1vnmMuNuCV0/N5dynx72wt6JHJiLqq2+O7zd9XMMBeTd6sEzgP+h6ktTOI91k+9E8R5
 BvsyNfCt69xDF3skqFW8/RWvZuSEcXgt94xWVqfbAEcFTUdeEW3Pptm
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

Add display support for the SM7250 (Snapdragon 765/765G/768G), which
has a DPU 6.1. The DPU node matches the SM8150/SM8250 schema, so only
its compatible is added there; the MDSS gets its own binding, modeled
on the SM8250 one.

The MDSS driver needs the SM7250 UBWC entry from:
https://lore.kernel.org/all/20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si/

Tested on a OnePlus Nord (a 7.3 based tree).

---
Ishu Brar (5):
      dt-bindings: display/msm: dsi-controller-main: Add SM7250
      dt-bindings: display/msm: dpu: Document SM7250
      dt-bindings: display/msm: Add SM7250 MDSS
      drm/msm/dpu: Add SM7250 support
      drm/msm: mdss: Add SM7250 support

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,sm7250-mdss.yaml     | 351 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h | 311 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 8 files changed, 669 insertions(+)
---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20261023-dpu-sm7250-a01aa5de1da4

Best regards,
--  
Ishu Brar <patches@brar.si>


