Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DC5427F1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924331; cv=none; b=C2fWXPR5tcRwPop48DW1sl6/oTZ1RyZn+jxvZhYONhTrCNo8KcMLszPTJBAvmHF2woYRcvvW8OCq1Tcy1xVi8XFkckcEVSFX5G/dkb4S9tnzgTCniksRjvmngxTri1Jnu63VhZ5RYTFQHoQUVrO/ioeCIiv1Sub7afpwO2tb1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924331; c=relaxed/simple;
	bh=zll7pBkaHbkXB7vZcTbnxv4YSU0M8g94JI5PwWIyRHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L8uYHaDJSMgu8oT2RlXZ4wwk25mtINReWS7heXszIZ99o+LgkziIi6a0hsFOMDC/IZOseyU3kYmgvOG2fOSFZv1Qp1GTTEpcw0I1tAkgg9YUlnyOtFb047SzfsY6mO8ZYJANdd7+LqTzSXjl+VrZn25HJWL5Sn/4qQH6IEAAuqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gCMFMCGG; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gCMFMCGG"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso2577062a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924327; x=1792529127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lHNLMEjBxGv/Csq/Jqd8d5F3GqpidKw5UhBJWGcIr6w=;
        b=Q6e7xnAWwBJ+hINEgPF7L4QPz7AgWt3+F2en9Wv55uybeN5lfOi3vl5CoakCIsi60r
         ZLjzt1gGCJx3415IZsN0qkBY+YZXw/m2M4Abl8g/8J/8grus446UIqnTfX6T7OBU+FEz
         KF68ZC41ZKm2SdpyhRm1EsD9lDOYbQ+9AwmX9Gt8O9YHovY6LwAckAfk8I9xUAtIx/tM
         U3Qdhl+cXyhIFu0NNEdeI3gIVkBtFbflJ9JCp0sG3IVUdTTba0rRHPrRmt4i+Hn0mQHl
         GGUaexcfQ5AFekgnuQ0tApU+TI+MT5c+XGanxAKvDWkx8trSyv7k7ElSA6Kiy3MDtYmI
         Ve1g==
X-Forwarded-Encrypted: i=1; AKwUvBwA3XfHnm5/+/igsy6vFoJiVWMGWA24W4OqRjXkcojQvNerpKRTUiuMdDxeTz8nyx+NmQYphF7xD0DGPJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9KDpPPpqXvnf5TC9WlaP1shJ38dXM8kekrioBoDfBC9TTcWV+
	8f7qAxEzXJ5ZROVmv5G8mIMkilVPD3C0aTVhgcXuQ4CZqSitZGTV9ZbUUnLar9Q3OqDtdYsIv3f
	+fNsMw4I/fX34JW82Uzn8PtUkJ26lhNYr/TC5udV0xxGyQcuFaKIZRtnTnMnbdla0LXJHja4le8
	4DMBCaNiwW0dDG5UrXWmQv1IyCnInifAIZyxPGJBe0SP5aBD06ubDBQuFHlCyqBfTCBLFDYJeyb
	haCNd92IL6jeISGwFWPH+bp
X-Gm-Gg: AYBFou1alXUpI2sgSOpNUYGc8b3ca526H9GbeyK6CSU/wEOxV2ZBf3BHkoN3RJkk3u2
	M9dvjnMycX3NQOlqBlSJeAtyIjfht7CrLhnUYJgcOkyCctxoDcu5DH1wiCQbxwPWsypbd37jSmo
	TRf0XcGFyTO8YYl3bA2m2JXLTA+47UFok0rROxEgMWOD6KaJv/mjnVcrWDVorRCQ/epyFg5FMbw
	ForPCa6gnKbPu2yXW8qhv8+dkbOae/Cybr/LW2S8vEScuMZeKh4KvkML1AFBLAtyNl532F5qZAk
	DPehJJAIsh/2MdwTI8iF+VyLgs97NbZjYL2RzqMei2AfunUoFtzEtMcNwEojrYd0m3sk39pS+Sa
	SGyiDqOZKkFQjQPrlq5Gk/FWvronEmQg82U8Filntjnpi7hOlPd5z8hoTd5l75BDpsufwmz7yus
	lEqWvtcBywxsyqecFx5Hce7vlq6TrMtycPsa/QbRSTl+E=
X-Received: by 2002:a17:90b:2ec3:b0:3a4:d5c0:f826 with SMTP id 98e67ed59e1d1-3ab3ae32be1mr11879045a91.65.1791924327517;
        Tue, 13 Oct 2026 13:45:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac632575b4sm125112a91.1.2026.10.13.13.45.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535f9dbae1fso12150061cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791924326; x=1792529126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHNLMEjBxGv/Csq/Jqd8d5F3GqpidKw5UhBJWGcIr6w=;
        b=gCMFMCGGY+hO/QJlkKPDI1lccyf56F4/Y6xl0SU3+ZrTJ2KZfgV9mTm+m3DKlNXTHW
         5ODjLYhMu6tgEXvZFlOx7k7/ZksXKq5yKah7vZgjfTUGVEy+jc7zwHNEkszont1x7gEe
         1w7gRDQ4sgCPFhTj4sS6q6y7xL58uoQfkBi+E=
X-Forwarded-Encrypted: i=1; AKwUvBxn/rGX1EO3BHDnVhoFsb6v/YRjaThhHHdg8TOcwES72Q3flQYOiWLtmmr4IjZbvry92PJbdQHtRK2FZZo=@vger.kernel.org
X-Received: by 2002:a05:622a:488d:b0:533:2139:9757 with SMTP id d75a77b69052e-5359fb8ef45mr224558171cf.58.1791924326160;
        Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
X-Received: by 2002:a05:622a:488d:b0:533:2139:9757 with SMTP id d75a77b69052e-5359fb8ef45mr224557741cf.58.1791924325569;
        Tue, 13 Oct 2026 13:45:25 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm15879231cf.30.2026.10.13.13.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:45:25 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zak Kemble <zakkemble@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net v3 RESEND 0/6] net: bcmasp: Collection of fixes
Date: Tue, 13 Oct 2026 13:44:33 -0700
Message-Id: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series is a collection of bug fixes accumulated during a LLM
coding session. Thanks to Justin for the internal review and helping
with the last patch.

Changes in v3:

- add Nicolai's and Justin's R-b tags where collected, except patch 6
  that did not make it to the mailing list somehow
- removed inline keyword from bcmasp_netfilt_is_companion per Nicolai's
  review

Changes in v2:

- address Sashiko's feedback and correct the commit messages and code
  accordingly
- add Nicolai's R-b tag where collected

Florian Fainelli (6):
  net: bcmasp: fix mib counters struct alignment with ethtool stats
  net: bcmasp: unmap previous DMA mappings on TX map failure
  net: bcmasp: validate minimum RX packet size in bcmasp_rx_poll()
  net: bcmasp: fix OF node reference leak for phy_dn
  net: bcmasp: account for offload header in TX short packet padding
  net: bcmasp: fix network filter lookup and wake filter pair allocation

 drivers/net/ethernet/broadcom/asp2/bcmasp.c   | 121 ++++++++++--------
 drivers/net/ethernet/broadcom/asp2/bcmasp.h   |   4 -
 .../net/ethernet/broadcom/asp2/bcmasp_intf.c  |  32 ++++-
 3 files changed, 95 insertions(+), 62 deletions(-)

-- 
2.34.1

