Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653509;
	b=m+w9GrxyZngBdMi8L+1nsjaUHqXbA6bXP9e1sbrb56Dd1i81UiMekZEEUelE+geXAqRj
	 syEOaZ36g8IKm32xJ6mQHtOW9D4gqdSX0tU1/5mo5O63BPwxAczZAnDOP3CA6GBzjacBX
	 PopccipY/XO9TAyDCF4xROPn7jjlv8IPMe9WNBYZup8q7hw/+oQcOngQkEUFp6+tubJEy
	 azaOSPDIiiyRi/dxyVB3P6ml47kqdg0PK3VEP9+UWzQmGHXm95DTnAZsLmqrSFNjTSw4v
	 TQcdnA08THbyW4q6jn70oa8DjL7r0N77ssZzUpDY6jdZHr2Zut3GzvbPNo3BAc3/L+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653509;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=QjUw+2kIgxNmIRZcsifp7nN5L+j7gN/V3v4KCZkaLmw=;
	b=X4YSkro8zt9lSjBa7uevZJ3IUHiq/a5nJl4OqXMZ4+hpyyl6IPmCpaStDNXhGWUPRKzm
	 qQYm9bVclO0dN9ZO4xIJz/1JFNGM69dD6vzB86jlzOPIHIiDsUFjV3/hDiJuEdR+axKtJ
	 XJjRHVwSsYFo4eOUq4aTBtnM6f87qhIWhyEM0CeXO+3U8FGTYEkcvuLbN2c8V7Z0Cfq4d
	 FQ/UF52BAuYkEt/+sZmE78vXfv8cjDfNWtR44Qv/ijUDdbteZsblO8OmLBHzcO/30DkH+
	 NGasQYqVyJuKWGMl3PPAzozuivaZAOJOxnVDZ8UBbHNk1AOgLkdTSchoON95aXKcKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=kA9Ww99e;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB42606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=kA9Ww99e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792653490;
	bh=QjUw+2kIgxNmIRZcsifp7nN5L+j7gN/V3v4KCZkaLmw=;
	h=From:To:Subject:Date:Message-Id;
	b=kA9Ww99edn7UHvbX8ux7P2OY/La+S1/yrwkrPdf92kXhL7lbkSgKX1SdiB15kHH3S
	 H54lhWj9FvSICazxIP1fRdstgcKJhMJkim1h/4USvMEZwk8pOuwE6m7f3NfPDmwgg1
	 RABFYVhwL6icb+Sz3NJAjoMFAL3QDhSMuhIG61t8=
X-QQ-mid: esmtpgz10t1792653486t4a2ab009
X-QQ-Originating-IP: h2yaRNFQb6Ei6q1nI4we5w8kZoco3AP8xkEaOsyViFc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 15:18:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6284087679707757170
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/3] drm/rockchip: vop2: Add 8K support for RK3588 vop2
Date: Thu, 22 Oct 2026 15:17:34 +0800
Message-Id: <20261022071737.508-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M4lPCacZ9YlexsUCtHLBYXAGlw/vDlvMQ5DgPHSQIJrgyk+lf+JRBIFz
	+RYGGkcemNJOu84OZy1UBcVKZONqcDJKarZXfPMOwNteecK95Dvy64cnKKIFQcXSdEreQkX
	qNwlvQR+yAbyCXWrdiN44HtPQtsBrOaCOT81d3I/BYKv/CVLZNqEPqSHDEd+q4TWZRQX8kw
	0Uu48eRotrhhQ89/Hi3BXswX7rD3LAMaVsitglfYPEjtGla1pDvCJEotRlg83eLXhBRP5uC
	Gkq+PCkSJ/DQyjY1JeWoX+WwmA9cN4zg1OPHxmecvXEcn/lqrIHlhLgNJg5825JQc/T08ay
	AsIXVeb+Hfd+Rrs9HExlCtEp/B2AciCOx4agDyC9ia9cVl5PyiBWkv3B8MjOxjgMN78ud7q
	RfowlAEGxGl2YEJoCtmIoBCo+FN46AbKETWBYkBgGPGM5eLehO2UjD1MoubEGsXZGTjS0Dt
	JTKebfQGHSD+/sy9ZFavh1N9dyjPvGHjbGj1OezQMubYvUGMdLLDccNmRyDdUwscRbCAphV
	s827cAcF7mC/qQTPt6M6UkIn153kmpppk+nOBihix0lbXSNzfFtgwz01CjAKUt8RfhGngE1
	PhZ2k8Vm7vhQqdiqp3CQ29ot3B/+yerIcmfaqEnvQL9EoyC6BkeX1KO5n5kldz8BrlwmWwD
	S0UM2smPVMZ6Kf7CY2UtN7ix6xKLO7KHboAXuIH00iebYnvFoj6QX2FlZYgeTUFf7Da+9Fl
	FnIFNsl8yJLkWIpEudzOTx17TFs7MwDEw5Xc2zVQGksdSw/94oNQKa6nOo13WI8crX5xZ/q
	z9+83wW4q0Vmu97D1Rkn7wssR3XgZ9iGeOkd0qhNUN0fSAx9wzeyHyVGRpy1esuRHAkd2QV
	i1/e35QFkWYLsaMe6C0q+hrQwK+XdFKrGOFOp2GRUBWaocb851jFfWS3OIUkRlgp0or/Knc
	BkCMTTjvoNiNdI2nRK26CcZhg1Ox6H1uimiDiP/0Kpiy7GvbAZ6gezvEGW4REBxsra3M=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

This series adds support for 8K output on the RK3588 VOP2. HDMI is not
ready yet, but I believe @Sebastian and @Cristian might be interested in
this?

8K output on the RK3588 is done by splicing two VPs together, with VP0
outputting the left half of the screen and VP1 the right half. In
addition, 8K planes have to be split in half as well to stay within the
width limit of a single plane. Similarly, there are a few post-processing
details that need to be handled.

Note that splice mode is not only usable for 8K output. This means the
mode can be tested at 4K and even lower resolutions, by simply changing 
this one line:

-#define VOP2_MAX_VP_OUTPUT_WIDTH    4096
+#define VOP2_MAX_VP_OUTPUT_WIDTH    (3840 / 2) /* for 4K test */

And yes, this has been tested at 4K over HDMI on the RK3588 EVB1 :)

Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>

Chaoyi Chen (3):
  drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
  drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
  drm/rockchip: vop2: Support 8K output by splicing two video ports

 drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |   5 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 410 +++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  63 +++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 193 +++++++--
 4 files changed, 595 insertions(+), 76 deletions(-)

-- 
2.53.0

