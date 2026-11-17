Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908585;
	b=sMIEbaRdWvaA84mvbFKx99Bqy7ueHDNrdws93HvRvbB0F52wssyuaSlpw7lFIBf4rfZz
	 E80yjjpIosBtOmQwkGt4+BLN3Pq8uVQQYPiDwSdf0Mkzsz6EmYhwxlilf68oF4Lc2hdDY
	 4sPsLKdCosL+VrgZyVHevI+fYTLm82XzsSlkSfbs7Hs8n4Bksr12Dv45Ix0pgCWfSImza
	 qGG6kyvNdnBveMZib6vCKOsgvYQM1bUY+XtrweLe6sZyH3z1i1gCjQbHrX8KeW/CEsw+j
	 SNXaKxMUC4r1OF4rF5bJXlpxJ9mnnn0BGKIWxXT5ASHPt9HHewJWRdOXyF+Pt3sfPMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908585;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=9bROS7YScWFWT1lXmNk8zlz/KPcQQq21H6/COyZpVRQ=;
	b=zo4FIhlU2VVCAKJhHoRush9XqZ0fHxvFvdcue8O0tKo/HxZHPfOUuBxRVoOcEStp089S
	 GGCiEvyAFMXlEUr7NuIt+KTF3HCNXD1vLzR8PxxuVQYqArZ/a9UkS8bUsvylWQJ+YjAaD
	 IoLzl/EI+DLLPDoItar5oz5Vx3l3kYCs9ECWzEtIDkONiYTjzcq0tSQW8bdPk+IKKnMq2
	 rsbxwpptI+A0vJnaynDmONQVvwYPmifc8en6hOnFzSPn38ceViTtwsoTZhCAQGa0UVY/b
	 Vn5xkRyY1bp4ZKqPBb8mR7/mZEDan5ZHFFyFtB2VFgin1HP1P/VWp0X4ZpQMumIUWDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Tn0WSDRr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A59606A31C;
	Tue, 17 Nov 2026 09:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Tn0WSDRr
ARC-Seal: i=1; a=rsa-sha256; t=1794908501; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CayzRRxtc5u7i/tuNDydk5G/gtcU+/zglt0NFS26Xlc3Ugzx7JEkUqJpA3tfGTwnMuVLBZpWHb0KnXd8t797PGxzOo9l3z4Eye+6S9MUYZjLsVjZ0S7Ix0XmB/QHyXtYSMYXR3CzB7dh5ERCQDnDCStPJAKOgdwkSlLpYqo3snU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908501; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9bROS7YScWFWT1lXmNk8zlz/KPcQQq21H6/COyZpVRQ=; 
	b=cB2uRAt05m161Mf/FhJXr0VVzm/HwypGe3IjI2NZTUPPaVz0X/FzziABBq6YOPw/H0oPbdXNoS1bz67/AnRFNxStyxR4ECrzPFl1JvP7sAlvA4ipHWQgLTD7Sy3RdPHK1Ij8vZpX+SfqRHKu9PfMC74gjlx9RiqpxRYaZJV5mUQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=Tn0WSDRrhPNTKVQVE4vyxPAn00CfwqRhj0mIbu/laYTAg4j/agq1xZkzfjwsGT2Ga4DKBtM38CUSsCLAN+yBMFS7bj5aqI2JHBUHJd87FvzKEr34VdVejkgJ2xhPKsX+FoceMCxnLl279ErGYiVWH/0g/sXOIxHhWLrRuUxMrMDFjMgYCj1N6rjkHgfbqIV5fPkD2VBrewVfM5tlsXXprQmf/fSi5Q7VmgSCXtWU77J6LJXp2PoA9RFgo6YFU1Ec4ybdG7f868X7pMc8HQ+SgKmyfvcd0o84GMYHDAh3TY2Vp8uGx2lECFXGEeNreVRo0aTmBKXPEmXXsT8nTO+BLg==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=9bROS7YScWFWT1lXmNk8zlz/KPcQQq21H6/COyZpVRQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908498830141.4624517149673;
	Tue, 17 Nov 2026 01:41:38 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v6 0/5] wifi: rtw89: monitor mode and raw frame injection fixes
Date: Tue, 17 Nov 2026 14:41:30 +0500
Message-ID: <20261117094135.1772-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
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
X-ZohoMailClient: External

This series fixes a NULL vif dereference and a negative radiotap rate
index bug on the TX path, restores the operating channel after monitor
down/up on non-chanctx devices, and fixes control-frame seq_ctrl reads,
sequence preservation, NO_ACK, and retry limits for raw 802.11 frame
injection.

Tested on RTL8852AE (10ec:8852, firmware 0.13.36.2) across 2.4 GHz and
5 GHz.

Changes in v6:
- Focus the series strictly on the standalone monitor interface case
  (plus the concurrent NULL-vif crash guard in patch 1), dropping former
  patches 3, 4, 5, 6, and 8 (RX filter changes, RCU pure_monitor_mode_vif,
  AP self role, NL80211_FEATURE_ACTIVE_MONITOR, and host TX hook skips).
- Rewrite all commit messages concisely without function-level flow.
- Patch 1: use vif_to_rtwvif_safe().
- Patch 2: clamp negative rate indices to 0 with max_t().
- Patch 3 (was 10): move before injection changes, add
  rtwdev->support_chanctx, and reuse IEEE80211_CONF_CHANGE_CHANNEL in
  rtw89_ops_config().
- Patch 4 (was 7): keep control frames on the AC queue and only set
  seq = 0 for control frames.
- Patch 5 (was 9): simplify ASSIGN_SEQ handling and drop dead RTS/CTS,
  rate-index clamping, upd_wlan_hdr, and pci.c counter changes.
- Rebase onto latest rtw-next and wrap all lines to <= 80 columns.

Changes in v5:
- Split the NULL vif fix and negative rate index fix out as standalone
  patches 1-2 with Fixes: and Cc: stable tags.
- Split monitor injection into focused patches.
- Honor ASSIGN_SEQ, retries, and NO_ACK for injected frames.
- Restore channel on leaving idle for non-chanctx devices.

Changes in v3:
- Split into a patch series and use driver abstractions instead of
  direct register writes.

v5: https://lore.kernel.org/linux-wireless/20261113235211.1911-1-owner@ph4ntom-rev.uz/
v3: https://lore.kernel.org/linux-wireless/20261104203051.564-1-owner@ph4ntom-rev.uz/
v2: https://lore.kernel.org/linux-wireless/179371849554.20972.16232816164394690660@ph4ntom-rev.uz/
v1 (RFC): https://lore.kernel.org/linux-wireless/1a196d6dfbc.35537d221913104450.3720060455831933789@zoho.com/

Enver Ikromov (5):
  wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
  wifi: rtw89: handle negative rate index for injected frames
  wifi: rtw89: restore channel when leaving idle on non-chanctx devices
  wifi: rtw89: avoid reading seq_ctrl on control frames
  wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames

 drivers/net/wireless/realtek/rtw89/core.c     | 27 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw89/core.h     |  3 +++
 drivers/net/wireless/realtek/rtw89/mac.h      |  2 ++
 drivers/net/wireless/realtek/rtw89/mac80211.c | 16 ++++++++++-
 4 files changed, 44 insertions(+), 4 deletions(-)


base-commit: badf4c3c7679871a50cff1150f66e63187201757
-- 
2.56.0.windows.4

