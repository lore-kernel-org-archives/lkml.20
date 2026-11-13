Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600449;
	b=VRT/TtMhuZNjFAmHVsuuCm1z7BI52keHV4hwD3PVQ1vR2pzOoO+4eNp/qxTww0eNtrQ3
	 I0PFN+NOXIHJu3oZbZf2H4wBn86p4OejXUeBrY4VYSZnAtGhLhwFXU8bHDXGfujuyIjDM
	 vg5pqA9WHu/eemAUbu2Zuzqd5vVqSDn9ZJhdSVxLwyE3zpnR25gQAH9pv6CMdbpWi9ycX
	 ZR3XIIXgUw/EREPDUU49zwNSXKbIo5gNRjABReTGEWlLVumXKlLzw1MJ7iPipoOoPPtr6
	 RLjxXnXb4XXIlKyJUzN32rM0K0gzb7yDSS/JfJfbMpEYbsaBNtWdcAu6pyKVoUHj3mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600449;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=htTqT5qQQsfinBqGAaK56jZv9LjJpTibZcwETh7D530=;
	b=GxrQ6/umRz9/TjkRxeSR0DgjtgCTdg3Pm5gLRYSDGEousJszpGa8can8/70PCPlW1BGn
	 P4OHq1PYR51Mbataf0XD6Wol5Dl+Ra6Hc5j/cP0/CqFeAvw3bRzRK8V2qbEwr7BP1YL/H
	 1US/o2kwxKJnxIcn4JsxrTcDGyeEP/DdB8kWL8T1fNyfq/7GPwpZ+I+aVg4W7hazPl2JF
	 pylZ4NzAn2CE2Gpy4Fk6hWLaYTJOiHbrmaRkv3LytMphB3xl5KOk6k0yE7rHzS9SUB0lu
	 SwcjQjcB2CuSbskG8jlnukNalo2fjaq10QnSRckGSJNIPtWDoYISJlL8lvidHwvPzPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="PqBD/5Tt";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30510606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30510606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PqBD/5Tt
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id RdnRxBfS5VK9URxYRxh5iy; Fri, 13 Nov 2026 20:07:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RxYPxLVJyxmi7RxYPxcUB1; Fri, 13 Nov 2026 20:07:22 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af76dfb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=ljjBMBC2e4o7sOCpvawA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=htTqT5qQQsfinBqGAaK56jZv9LjJpTibZcwETh7D530=; b=PqBD/5TtYxfmCDcFwra45BkCJ1
	m87KH9tpvW3/at0Kv0B2PeLY4f2dFC8mpnq6L9itcz0VnZm1KOxA5qs6lS/LS1faAgL0tpJGd1X9L
	MGmiEtHa1e7TazG3zKj+z4fXcCuP6bfjSmCLJX6voagmtqSWRybxzVRIGXr3s94q6M2WhboQqIzaa
	k/5U/rR87BE4t2NyVXIQNw7cM40E4aaaO76RZtfaUcWAn1Ko0h10/ylI6qQ9EX853wNp/FwrLlvP7
	+JG1DNYZJSUw/Wg5IpW4mVD+/9PaEMoydy0nQb6ChSWp7uH2R/5sDF3U+pL3YoPy+VgURbWjxWQR0
	D0aV/zeg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46982 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRxYO-00000003n5V-3ndb;
	Sat, 14 Nov 2026 01:37:20 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] watchdog fixes for v7.4-rc3
Date: Fri, 13 Nov 2026 12:07:20 -0800
Message-ID: <20261113200720.2752960-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xRxYO-00000003n5V-3ndb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46982
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH60k7xUhDk69W4N3mnMp07MR7inuV/K7FGb29jJeFFd0XlsOwLSig1gFZatjWOAhjnhQbTgtlPRL5eIa8SoIG42UT2qNnxKoqvpgdeJQ9f158oaVI1A
 ng2m+tmvALva9UkmPW142WahNNPokNOWTG3FGx969fJswcD4oUepzZ3IooC5SuLc/NLW1wd79qUpttBY2Eu/TRb7S2cAtzCvLIs0iB3Ey00PFV6YeSJvciuU

Hi Linus,

Please pull watchdog fixes for Linux v7.4-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-fixes-for-v7.4-rc3

Thanks,
Guenter
------

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/watchdog-fixes-for-v7.4-rc3

for you to fetch changes up to f00afd5d8d5dc03994cb67246543d5c70571ebbe:

  watchdog: rzv2h: Drop runtime PM handling from WDTDCR init (2026-11-09 15:22:40 -0800)

----------------------------------------------------------------
Watchdog fixes for v7.4-rc3

* gunyah_wdt: Re-enable the watchdog on resume

* mediatek: Register reset controller before watchdog device

* meson_gxbb_wdt: fix suspend/resume handling of HW_RUNNING watchdog

* mtk_wdt: Stop a running watchdog over system sleep even if not opened

* npcm: fix clock prepare leak when setting timeout on a running watchdog

* omap: Fix early_enable handling in omap_wdt_probe()

* orion_wdt: load the pretimeout counter on Armada 370/XP start

* rzv2h: Drop runtime PM handling from WDTDCR init, and use
  pm_runtime_put_sync()

* sbsa_gwdt: Limit the MediaTek WS0 race workaround to revision 0

* sc1200wdt: add missing MODULE_DEVICE_TABLE()

* sp5100_tco: Use release_mem_region() for EFCH MMIO resource

----------------------------------------------------------------
Guenter Roeck (3):
      watchdog: sp5100_tco: Use release_mem_region() for EFCH MMIO resource
      watchdog: mediatek: Register reset controller before watchdog device
      watchdog: omap: Fix early_enable handling in omap_wdt_probe()

Igor Velkov (2):
      watchdog: orion_wdt: load the pretimeout counter on Armada 370/XP start
      watchdog: meson_gxbb_wdt: fix suspend/resume handling of HW_RUNNING watchdog

Lad Prabhakar (2):
      watchdog: rzv2h: Use pm_runtime_put_sync()
      watchdog: rzv2h: Drop runtime PM handling from WDTDCR init

Qiwen Gong (1):
      watchdog: sc1200wdt: add missing MODULE_DEVICE_TABLE()

Stanislav Aleksandrov (1):
      watchdog: gunyah_wdt: Re-enable the watchdog on resume

Zexin Wang (1):
      watchdog: sbsa_gwdt: Limit the MediaTek WS0 race workaround to revision 0

Zhao Feng (1):
      watchdog: npcm: fix clock prepare leak when setting timeout on a running watchdog

zoan37 (1):
      watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened

 drivers/watchdog/gunyah_wdt.c     | 27 +++++++++++++++++----------
 drivers/watchdog/meson_gxbb_wdt.c |  6 ++++--
 drivers/watchdog/mtk_wdt.c        | 30 ++++++++++++++++--------------
 drivers/watchdog/npcm_wdt.c       | 15 +++++++++++----
 drivers/watchdog/omap_wdt.c       |  5 ++---
 drivers/watchdog/orion_wdt.c      |  3 +++
 drivers/watchdog/rzv2h_wdt.c      | 10 +---------
 drivers/watchdog/sbsa_gwdt.c      | 20 +++++++++++++-------
 drivers/watchdog/sc1200wdt.c      |  1 +
 drivers/watchdog/sp5100_tco.c     | 13 +++++--------
 10 files changed, 73 insertions(+), 57 deletions(-)
