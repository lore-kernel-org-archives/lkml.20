Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831837E5D0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787935495; cv=none; b=id0Dol/4j+E5z2LuH0LnpQmVUmmuiCbLU/rrBsUsrfZjgR2dAzHwZp66CPZTbRB6iVkNVr+p+JZCMkSLGr8XV8A10U6+3CfBq+FDbsLpjCMvLoqZxVDXp3i5QI0N7FviKyC+B0L6efjMdlTRZwjzKXAf/TBcUOQMlPqvJURmk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787935495; c=relaxed/simple;
	bh=MaAAHQxxeuQW7h5KWHAzOdXY9T2/4cCdUoKT/r2MLX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RMHYQHr2m7UGOoiC6SC+s/r1p/pcn5wF/Dwmqp6vGBJCTO71eBCrLboDPY61/4bl1npA/oCxUqgvh1GqsCVkbrEygO+ESJ91oEDiv+iXVPVnvjCx5YXk37CXeQOanrQhz+9f6MzLi35IwQRSGNtWwL64RYZNF8oby1xSL8+wsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=PUykPEag; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="PUykPEag"
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260828164448bb6d72ca1900020734
        for <linux-kernel@vger.kernel.org>;
        Fri, 28 Aug 2026 18:44:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kXLCFidKi6n6sOXueq9fqumGD6TSvCxnTaxk9VwuH28=;
 b=PUykPEag2AvzTBQzKTlowarLf2HLQCa9Ees8wFxZ/xKzUmlY5g1sbhamHWtzacwF0dI4Fb
 4jliY9/ptEHpTwoIdLfM8HojXvZbNokocFHkOsLGsOJ4PnuF5mrjj9cZ9bapYu7hQRZbuHeI
 Lr025xu0xEAirYyvrTxpcDJ9Fcz1MFl/ayI/QHCuzSAvncQ84MNn1Mp5vKsuU0NMzGQ5PVBI
 wDztRw9p+XnkY6o/6zcWVbpRvB6ngp1KdVm6+X8HjFQsJi01BmiSfqIFcS+wq3aGGKKmhT0G
 fF1ZNFKbbzQXKEIRkSgM8leujB0BtSZLN6PjK/OXOioDwpb6dl/s7/vQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] rtc: pcf85063: Update interrupt support
Date: Fri, 28 Aug 2026 18:44:38 +0200
Message-ID: <20260828164445.3907839-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add hardware-backed UIE (1 Hz update interrupt) support to the pcf85063
driver. The PCF85063A/RV8263 have no dedicated update-interrupt source,
so chrony and similar tools that rely on RTC_UIE_ON fall back to the
kernel's software polling emulation. This series repurposes the chip's
countdown timer (TCF = 1 Hz, T = 1) to generate a periodic interrupt on
the INT pin, serving UIE entirely in hardware.

Patches 2-3 are preparatory: they fix an AIE race in the interrupt
handler and a lost-alarm-flag race in the clkout helpers.

Patch 1 fixes a pre-existing use-after-free in the clkout clock provider
on unbind, found during review by Sashiko.

Changelog:
v3:
- split into 3 preparatory patches and the final new feature patch
- replaced racy regmap_write() with regmap_update_bits() in IRQ handler
- the timer flag (TF) is write-0-to-clear, so every read-modify-write of
  CTRL2 preserves it by writing it back as 1
v2:
- https://lore.kernel.org/all/20260820112437.3715237-1-alexander.sverdlin@siemens.com/

Alexander Sverdlin (4):
  rtc: pcf85063: use devm_of_clk_add_hw_provider() for clkout
  rtc: pcf85063: do not clear AIE in the interrupt handler
  rtc: pcf85063: preserve the alarm flag in clkout register updates
  rtc: pcf85063: add 1 Hz update interrupt (UIE) support

 drivers/rtc/rtc-pcf85063.c | 139 +++++++++++++++++++++++++++++++------
 1 file changed, 118 insertions(+), 21 deletions(-)

-- 
2.55.0

