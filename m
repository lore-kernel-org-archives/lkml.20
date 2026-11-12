Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794458197;
	b=oT3m9AAHKlOGJvrCjkm4dpMgUMDoUBwq2Dv+n62cO2hzLcSxTtaGa9Uci3ymzqDP7I1l
	 hrCTT6cPFni7lQg+1LSOaRl1KBiXP8UrpC/CUtUJogvPOpHoJxqWMy5V7a5iZF12GtJzj
	 Wyv4Oya6gLF0U0a9mz+55Vaq89zKSu7ApQ0GvfGJlywa3OjEAYvNb5ocUgyRbUT/74RdB
	 sy2mgTour2I12QuWGhHoBd0mJbyQ0H5USCodQs1/+p4vdWwGD/Wp+y1OXojBZ8btsH6MR
	 DBQjkfK/OX3cV2C0Lm8dk53GcryV4W76P00OZMXiFvSl6dfyH+UWiyaszsDZJmBH+8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458197;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=SRBQISyUypyQehHdYWPgwg4vKQ/1RefdZ6DEK2uejEE=;
	b=5Wb2eEBQRmEGngT9lMeFZ+Gr/WPHMGHu257KYnHtsNW2a3zU3hbhoNAcwHIUZQbsDxa4
	 1IbqAoJjC+KRroVf2gkjSbAnhRym8Xq7746DR7exiCV3Dl0HbvcNuFREVse2RJC1ldNYJ
	 P7swSpI9PHxAg83yV3CPdFnwrvQVS4Oivx4MvWOPsoy4L0uyK+GP6u2+XBT/Ba82B9hWA
	 hlrFMIt3Otrdb9eGSZWeddojukwmBqSKgX/dncHNS2JFqXmAiEpTM9mo1q8X2Go70f8id
	 U6+rQtg90PQRkfFoz3L/T/PRwsDci4VjZ+cG+er2UUyUaebolOa00GtQX/1a/pOTZng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7ueC6qm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816F60A262F;
	Thu, 12 Nov 2026 04:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7ueC6qm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794458197;
	b=io4TkkX2VCI+wnV8aJShXNWGaAnM1zUsoniOaB3cmsU+SJ8iRsUPx58XhuWmT8T5Skko
	 69IHdYV7T/+IgvsttpmbxCxwreT3fIih7IBArN0gxoHa9Nw3NkNgoCKh+0oEAfDNoAyU+
	 zi8ezUQnIK3N74GlIy9R9qpSEJo1h5EzxMYkXxOdep+7ljBSzgx6icY+isyuFRlnj/QjE
	 um8gQdgBDM3KubAayJfc2tOIhrQmrvXvttIyU2H/LAUiyw0nZEbpvBO8G2tEeMe/uUw3l
	 6hKO4HshGCv6yggp4QkPJSqkS8d7Ft8e85/D5kQNDxjUuvnzz8wZXikTL1b68PLsBQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794458197;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SRBQISyUypyQehHdYWPgwg4vKQ/1RefdZ6DEK2uejEE=;
	b=Sd49HIkUtAujI26z3KNoPujXVFScG1xzlbW+lldrd2CXxy7lFM53BNtIBBx8Oj+v2TfU
	 p0dfQtDSJna7P8TLWkChaHkfi5QA6/TRb3q+naCQl0CWH9WQ1UkxDOkUmRigKMdfhcIn5
	 XWvW8WdRpT61/7MpxQaIHJWKVm30tNfn/iMWbKSbqAyEFF/jN+LyI/nirvSFGs6ku4/j+
	 OcAu+jQ20ZRHvxs6VNTLbt7hzbJfCxnBP6Udru6jBVUQoSeHlfpx0D/WJBu4O0hZnRBlU
	 TEEZy3JGXXt0jno9ce6SRUbih8/Ol23C+i3/dxX/qDSFFwb6Bb4uCqxqrKOWJen2GgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57FC31F00A07;
	Thu, 12 Nov 2026 04:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458197;
	bh=SRBQISyUypyQehHdYWPgwg4vKQ/1RefdZ6DEK2uejEE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=V7ueC6qmIMogvJpPwiEaacMBmt9IMbdL6GiR4YhbJAuvjYzI5ANt50U0LlF7ylRWD
	 gpA6Ske5+HnSlHTD4itWSepYBajXWWCjrv6c02p8HKVNpprUo7gIAPQ6Ke8HZwqi3p
	 M9y1OKI5/iKwo71HHx2Hio2gtz7XfPk1xzqLBd23pnfY1s91GanxQM/T/aVbiIlVqj
	 JrspBmN5AhemnaLlPU/TO9Q8QuvDPL0VwPdLuVZQcaWhMsQss2UxNLVrclaPQQY1TA
	 Fx2/cgQAn9GEYPW71RV1Y3Styc5rLD1FMEUJ70aORuwHOB9sUBZPa5q7tOYKcK4aTd
	 eWHAaXmD6HCdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D9E85492A0;
	Thu, 12 Nov 2026 04:36:33 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH v2 0/6] drm/msm/dpu: Add SM7250 display support
Date: Thu, 12 Nov 2026 10:06:28 +0530
Message-Id: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CQAxFr0K6dkw7MBpdcQ/DYmCK1EQgUyAaw
 t0FdOHyJe+/P4NyFFa4JjNEnkSla1ewhwSqxrd3NhJWBov2RGhTE/rR6PNsHRqP5L0LTMFnsA7
 6yLW89tit+LKO5YOrYStsRiM6dPG9v020eb9wSv/hiQwacpc6w5SrDF1eRh+PKlAsy/IBxsLuv
 7QAAAA=
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
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794458192; l=3160;
 i=patches@brar.si; h=from:subject:message-id;
 bh=048jFxiMI7k+1fd8eRDyGOsTRUB4oqqepK6hCevhTJ0=;
 b=Tp8wnwliFkY7UtEQXW0T72bcA51cB5628CB+DZTSnQ206r+tfX9kalU7qfPG6c34zvZAMAGOU
 khYMziMNuB4AhKX0B65H2GCtv4/daktEayULlh0bIH5lljyWxfT6taZ
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

The MDSS driver needs the SM7250 UBWC entry, already applied to the
Qualcomm tree:
https://lore.kernel.org/all/20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si/

Tested on a OnePlus Nord (a 7.3 based tree).

---
Changes in v2:
- Use dpu_vig_sblk_qseed3_3_0 for the VIG SSPPs, as the other DPU 6.x
  catalogs do (Dmitry)
- Drop max_hdeci_exp and max_vdeci_exp from the caps, as the other DPU 6.x
  catalogs do (reported by sashiko-bot)
- New patch: add the SM7250 DP compatible to dp-controller.yaml, as the
  SoC has a single DisplayPort controller (Krzysztof, Konrad)
- MDSS binding: add the displayport-controller child, fix the
  description, drop blank lines (Krzysztof)
- Collect review tags
- v1 was sent three times by mistake, sorry for the noise; the reviews
  are on the last copy, linked below
- Link to v1: https://patch.msgid.link/20261031-dpu-sm7250-v1-0-159f403ec405@brar.si

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Krishna Manikandan <quic_mkrishn@quicinc.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Ishu Brar <patches@brar.si>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ishu Brar (6):
      dt-bindings: display/msm: dsi-controller-main: Add SM7250
      dt-bindings: display/msm: dpu: Document SM7250
      dt-bindings: display/msm: dp-controller: Add SM7250
      dt-bindings: display/msm: Add SM7250 MDSS
      drm/msm/dpu: Add SM7250 support
      drm/msm: mdss: Add SM7250 support

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,sm7250-mdss.yaml     | 357 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h | 309 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 9 files changed, 674 insertions(+)
---
base-commit: 198acaed3b84c91030a039ac5ab833432ec166ea
change-id: 20261023-dpu-sm7250-a01aa5de1da4

Best regards,
--  
Ishu Brar <patches@brar.si>


