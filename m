Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331182;
	b=BdZwUZOYCYIO07JV4Pt0ix7HPaZQJ0F1DF4kpu79XGDyS7EKwHbv8AAARVKnwQ4kULtd
	 vzGlv43j0/VNFy8HYbQijbVluvui4raa9wft9EJqb3gdgBAxStaNQmqb+IcnNsRaNj/kU
	 IbpCdus98LMtT74r6weDV4cuZyIYQkxvvwyfNHDgJ4KeIgAg6QSd0H2diersFQNhLCU6t
	 lUMMvkBfSd9Nph9Ivp8+o0BTouSK1T3Gn+fcFwgAYJejuTrzyNzLwQ+IPHohE1jpi0Fpq
	 0b7pDSap1F0J/HiHLg4TBdpniUmrNHEaJtPB9VKREyRmBVdqZ/Icae5KAnt+Civfotw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331182;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eniu4D6K6YKvNE/gDkqzAbCGGrcDWnEmgR3F4VwagUI=;
	b=tEDP1Iq/EWqQDkcqtKWb+dm2/HUYbDpHkqz83K5W9nDFYduxJTnRrnZuE6yq6ravUwcj
	 hV9ts9KsXp+3QCe83z4ohaNVgihykCRACwoA3uQSD8+fD1UVmyt8IJr8Hql3PJf3uP3g8
	 6RaHejyop09PX0v3x3MMYF1I9XHWv5S6Y14Dn6Qt44EbMRdrxiWyzIMWqBAdkz3EDVBn2
	 LBAFtsPRwNNaeXT6KT+Y6YoQPh/vOrNwnuhHDpQVXfh0+/2t5kpbGYfeKqa3MygOD+mJV
	 BVpToPOwLF8th4mmozHYtAdLq801ibVqe/Cd5ogsgHIzYKbdZ8IL3/KpBlC485xM1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="HOlW6/Cj";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AD606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7AD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HOlW6/Cj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=PSYSBnjHJTGSOsFMN80hFo0M6LiB3h7DxQOb+h1dEFI=;
	h=From:Subject:Date:To:Cc:From;
	b=HOlW6/Cj7qGg7vmOIKMFsCqLrybu59yyLcduV+G9N7XIMYUMo4YKlBHPAJCMxUQsC
	 RMYnqTFdJODx7SBnbYeAUJZZIm3BH1h2AA1OA6V9QMXLAvPhUkLSdpQ3Unn7LBLSI9
	 3KpZLaFCD6zkpQYN0baNIsTcyQhDX8YO/iHsmUUVeJVOpfIERaMHGX3MXKqPippIG0
	 6sAP+glG740OhRQG5+8EikJo7CDfrFx1V801bOzmvZAb7FBxQLrb/mOc/cj/VWzhq1
	 ri7DDbkV2tmgUzAEguZvHcrY5Dj8NgCmoM+cKGTSH9QQZQmrv+nsBa+WkgttQ+M9Bc
	 tv1F6sFVW5qug==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 559C617E0A6C;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 09FEC48002C; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 0/6] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Date: Tue, 10 Nov 2026 18:19:13 +0100
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOy07EMAwF0F8ZZY2RnUcfrPgPxKJxExooTZXMV
 IxG/XfSQQKEZlGW17LP9UVkl4LL4uFwEcktIYc4lWDuDoKHbnpxEPqShURZYYsNzMMZUuQ3HsI
 MYZoinLKVwGOZgQ8f4Pq+MtbUvmm0KMycXBlfK56ev3I+2VfHx83dNoaQjzGdrz8stO39o24hI
 PB1b1pWZMvJI8dx7GxM3T3Hd7FVLvIbJUTagUpAcEjWG2yVad0tVP2ghGYHqgpqJVbYMDa21bd
 Q/Qsl3IHqghrqmLGmSmn/F13X9RMcFKbj5QEAAA==
X-Change-ID: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4465;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PSYSBnjHJTGSOsFMN80hFo0M6LiB3h7DxQOb+h1dEFI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUiaAsRwffl1O/xPPm9cFSja+Xnq626vWE
 iNRZgVNTaZKcIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81ImAAoJENju1/PI
 O/qa56IP/3Sx3iJkPehsFus43aCVR94carRvjsg5BdyzY9o9/xYgEkgRfQckWXnzXpwLchi1vnr
 aYupt8ZhMCrdXDdT/sT2DummRb29CztDqNZ3gPEAGSOJnd5K/p1gtWiDvP2ESVO9ftoecoMy2pp
 AADCLvegSfRhL4h1yGSeGjUM5DbjRC8t5yGlUUP8TsLpiOfLT7jsOvlR6LNR+Bw5bzFq0OBp9H3
 bPrIZjwyTRye8FgH7UY1uugUgwKNkMylLAdvj4ZSLqN0kx86EqySOLkJVggqZ921oo/oGkaL58r
 fAcDshPsgkNyn9p/aHvEIZKs0g9+oBAc6ZcVMMXfYdiBSm62ImLTzL1WvfR7i8+AcezrDYgfpMr
 FIgrEbKGO2HvXB1UNBmX847/aXjwRgq3YHgmnPz5b+AgPtxHzAJsZ/bB0UACuHYL/OqeHacH388
 2W0ENMkj5RM65bar/JHlNDyDiQzjzrcFodGQaTbqGQTVDtSpLgOCa5qitnbIJSwiv8PJQcbtdYL
 BtvE+TPG+AHy3YmIZFlhJs/fD30xObju2RyF7QgsF8koA7hYwOhPALN+lXmQVUEFnBJ7hIRKGYy
 KGvjRX789ggekoOmw8kHHJmtqSheUNuDNS22tK43hxAHigCU0O1hthO9oziN6wNTuzY0A4/UF4g
 3crYvo4WNcbCJzvlPqUwhjA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This was noticed on RK3588 EVB1 when resuming from system suspend. This
is technically a fix, but its unclear when the bug was introduced and
system suspend is broken on RK3588 for quite a while and not just due
to this problem. So I think this fix can be merged the normal way via
linux-next.

Changes in v5:
- Link to v4: https://patch.msgid.link/20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com
- Add new patch converting 480MHz clock registration to device maanged
  clk_hw helpers instead of using legacy clock framework functions with
  open coded device managed release handlers. This is a cleanup, which
  also allows easy implementation of the next point.
- Restore clock registration back to the original place, so that internal
  users can access it early. The clock provider registration is kept at
  the new place (after initializing the ports) to ensure the clock can
  only be requested when either more than two ports are available or the
  port already being initialized. (Sashiko)

Changes in v4:
- Link to v3: https://patch.msgid.link/20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com
- Drop patch avoiding rport->suspended in rockchip_usb2phy_sm_work; it
  was meant as a simple cleanup and Sashiko suggested it is more tricky
- Add new patch removing error handling for regmap_write and
  regmap_write_bits
- Add new patch removing error handling for reset controller
  assert/deassert
- Simplify final two patches due to the dropped error handling
- In the final patch move the 480M clock registration after the
  port_cfg population to properly fix the race condition instead
  of relying on -EAGAIN and the NULL check
- In the final patch create a new helper function deciding between
  handling the PHY suspend in the clock (un)prepare functions; we
  keep the NULL check for port_cfg as this properly handles the
  case of the port sub-node being disabled in DT. From functional
  point of view this setup doesn't make sense (no need to enable
  the PHY if all ports are disabled), but one extra NULL check is
  cheap, so it's better to handle this gracefully.

Changes in v3:
- Link to v2: https://patch.msgid.link/20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com
- Fix do_suspend negation resulting in SError on RK3576 (Sashiko, CI testing)
- Ensure PHY ports array is initialized in clock enable path (Sashiko)
- Cleanup properly in clock enable error path (Sashiko)

Changes in v2:
- Link to v1: https://patch.msgid.link/20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com
- Move suspend exit code from rockchip_usb2phy_power_on into a
  separate patch and reuse it in the clock prepare function;
  move is done in a separate patch
- Updated commit messages with proper rationale
- Added one more patch dropping useless assignment
  of rport->suspended directly after calling
  rockchip_usb2phy_power_on/off
- Add one more patch unifying and simplifying the debug
  messages for phy init/power_on/power_off/exit

---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Igor Paunovic <royalnet026@gmail.com>
Cc: kernel@collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---
Sebastian Reichel (6):
      phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      phy: rockchip: inno-usb2: ignore regmap_write return codes
      phy: rockchip: inno-usb2: ignore reset_control return codes
      phy: rockchip: inno-usb2: use devm for 480m clock registration
      phy: rockchip: inno-usb2: move suspend handling into new function
      phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 284 ++++++++++----------------
 1 file changed, 103 insertions(+), 181 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

