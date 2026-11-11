Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430896;
	b=mNzJp+8EXR2vGpGj21yDrPQDPLZ2inQyjygTUH+yH0B2ViU4RkEsTUkkodUievwpBw+A
	 gRm0yguMQeSxCRjeoQrP06Me/0dfdxdKfqmTjlb3irrk83ISaj2KGO8bT7FgDE10l6pAy
	 PLAna0UkA0cvxZoHeNV/cSFidcSYGVqyzvsSccH7A7j+BV3UrumcJaXgxgSx1Kaiclfc+
	 4ltPIqrTUBXEnhR2THFF8iIrQBPDVCcA9JcOC9f7WTW/S9hC+bIKe06qQiMEXHp5x8FY9
	 KmIN/RY6c+gQyeuUgkP50ZxYgbc6hLo+dfDf3V3Iv16JTrnZH0qYFXfe6Ha0zKHaXlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430896;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=tlP7YiAB0ndxc1g1Kyrgds/y0lfbIBXihc8MyOXgpx0=;
	b=xn3EoXjh7EMmuj7sWQbR9A6ZZH1JgZOYkq6y68+DB+ChwWASp4oIZ+8NbWfdIwz1Np8U
	 RWucYIFiEHnRlfD1rYRl6RMBBtGq4oTFv7v6/mADGcTvsvpwVCQ2fP8GWK0N/icT9iHeI
	 RlBS2eeZZDlgmXHM0mvyrA66Ycf88MMCPnLUCTSVNjzjHS6uon76unf4FoQrW4+PMx2AH
	 KgCnxQXsHwcYOPb67TmFQWagB/qHs3qGyWdzfP8vkb2jp/H32cnTQbpFkhhK4TbhnL46H
	 96gbEybZTi74VF2v+XyIXTYNw11+BihDHCXOCujMEqkAc0un13sUhQqfiGeu6IwRVeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timsurber.de;
	spf=pass smtp.mailfrom=timsurber.de;
	dkim=pass header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=KzcpJxT2;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514F606A324;
	Wed, 11 Nov 2026 21:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3514F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=KzcpJxT2
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jPwtF2LtbzMlj3;
	Wed, 11 Nov 2026 22:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1794430885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tlP7YiAB0ndxc1g1Kyrgds/y0lfbIBXihc8MyOXgpx0=;
	b=KzcpJxT2REm1FzABc0qyuOqma9BV8isWmnUjjZiP817FKuTNsoSxyhOYsgbL+nsjDU9Vw/
	vRUgw5aXQHu2DkZNAoF1bMmxUfCiDDSTaMLt5RfK+XuQj6gRolYLM2WtP44h4LkySKnMHn
	MvH20E4Z5O72iRod0fAQrNAPTvJvJCYnggoh6xWL5qZRMJeCE7n664apWlUv/zXQQN6KIX
	a66Z8vrtrDoT8JwCzd/OxJr7o6tW7dAqj+qI+UB5PCVSo5B35ZicBg482VCd1pVe89KkAJ
	CxpNQFHtrNXNuWQl5mbNe7bDYg5qi8EVLlkVJXyhBvjmBvN9gu+W61WcKUylXA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Tim Surber <me@timsurber.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] arm64: dts: rockchip: fix HDMI RX HPD on CM3588 NAS
Date: Wed, 11 Nov 2026 22:00:26 +0100
Message-ID: <20261111210059.3489502-1-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
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
X-Rspamd-Queue-Id: 4jPwtF2LtbzMlj3

The upstream CM3588 NAS device tree uses GPIO3_D4 both as the HDMI
receiver's HPD output and as its 5V detection input. The GPIO setting
wins, so the receiver can never drive HPD. Sources then read the EDID
while the driver is still writing it and keep the damaged copy. This
patch moves the 5V detection to GPIO1_D5, the pin that FriendlyElec's
vendor kernel uses for the CM3588 (rk3588-nanopi6-rev09.dts is the
CM3588 board file there):

  hdmirx-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
  https://github.com/friendlyarm/kernel-rockchip/blob/30d3e1c2470a7282f37b96fdd4354314dda69aa3/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev09.dts#L299-L309

  hdmirx_det: rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_up>;
  https://github.com/friendlyarm/kernel-rockchip/blob/30d3e1c2470a7282f37b96fdd4354314dda69aa3/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev09.dts#L584-L586

Testing was done on a CM3588 NAS with HDMI0 looped back into HDMI RX.
Both runs used the same kernel, built from linux-rockchip for-next
(c3baae5f1a15) with nothing else applied, and only the DTB was
swapped:

                                    for-next DTB    with this patch
  boots with a good EDID on HDMI0   7/10            10/10
  pin 124 (GPIO3_D4) function       hdmirx GPIO     hdmi (HPD)
  EDID change via VIDIOC_S_EDID     never seen      seen in ~0.48 s,
  reaching the source                               2 HPD IRQs each
  pinctrl "not freeing pin 124"     6/6 unbinds     0/6 unbinds
  warning on unbind
  5V detected (power_present),      yes             yes
  receiver locks to 3840x2160

dtbs_check gives no new warnings.

Tim Surber (1):
  arm64: dts: rockchip: fix HDMI RX 5V detection pin on CM3588 NAS

 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
-- 
2.55.0

