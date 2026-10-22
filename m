Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659231;
	b=ERgAvUVxedTzVKpmy3yuTqPFQQUttXmY8Ze7ln0Vh6XUS/MREE4PU+lU+ArCHT+H0wnW
	 qqrESd3pOyDPixT0gMlGZRgQ1yQd/LjsDMqEvkVBnjSzmoPjGQtq4h9USvVYXledhnzrU
	 8pa5ksSH2o9UCTzD0gmMzkopwtrC0cXMz+8lphQjeZtAiGComYvuD961fWL3/YzPThwIV
	 BggA7WTjxu6mjxcLfyXk/XHo2MEtcD8n7Ii0hSMDKFQue7pydV9jcMZCeYIIUz5ncetgI
	 nPNq9B4p5ManqLqVBlg/BdMVOSXIaF+U8bnUXdmafvpCS3nswCKbGY9oN9lDnoUo+PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659231;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=E63uSBy+rrZHGWfaoHHE5jbH6TiYBdUdn0QA3wYVyl8=;
	b=zfvIgJ7eji4ZLWVZeyi5+YBGDA3g2qSwA4Wflgyi3KbDgo6JsBAGWPKmJZBpQ1S3dq1c
	 IqiuuT6DujXF5saPKGj8Qtb9nCDFdqZOH5Ays+rF2+JntlYz6qEiEyqVUGo6cZf13mMWC
	 M7cLzTJLHR6V4O/GbedHroWLjYpluIpnQcslLJWBxJHOONp7HhjIaZCqL8k1GUHPTv9aL
	 0ZJsCHy1+reeRwNkl35SoTrSf24cuxjDEV0FAAgf4nKfjpnjgEEyXrCc2frmOYGRlQnJm
	 q2tw86bTClOJYR9+bHcJ6c9b77frIMdUZV4IshjqTF5Iw2z2jNCkhTvyVVcCFnLlQyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ghNIdN4m;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ijQ6U6XO;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A880606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A880606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ghNIdN4m;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ijQ6U6XO
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3690514001E0
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:53:50 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 22 Oct 2026 04:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792659228;
	 x=1792745628; bh=E63uSBy+rrZHGWfaoHHE5jbH6TiYBdUdn0QA3wYVyl8=; b=
	ghNIdN4mv1oj3VfTHXeFapGWkVOMLtzil9aSPKWHBFzBoXhjBzFyeTR3EpCjniKC
	3n4Cp0pVbDdNO3WPovoFymPjEDNQyMxUxNTD7dh7yThihrQSu8OYFysO3/FjRMuo
	CRSOedzlZLjkt+eCNW15L50urHJz2nQhfVL7aEUzj9+ovDzhcXLLNSxe5MDNT8Jy
	AkByiIcPI/+MyYvAX03UDZkihOdFiiK1MzSYpYfSn0RYWz8csujTrxgxx4LTy75a
	u2FqmBBQoD6Mbz7t/A6fgkd+DUa+HcbaeeXLY2nB/muxbmlHrdM61/M/mrgdxIox
	oRNvqJVv07o/vpGiQXaTGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792659228; x=
	1792745628; bh=E63uSBy+rrZHGWfaoHHE5jbH6TiYBdUdn0QA3wYVyl8=; b=i
	jQ6U6XOde2xKFhyHSW3e8LVdN6xJ5QXsg6hQVaTd+6SWyF990IvIb0p1z8JkrDXk
	75+N0lT8UXZEzQvsRSA+monQWUv5Ad1yU3oF3fpGjwqINFYjUTLvwMg0yMDB9jV7
	TEUO/PM6sJ6lN/W9Eck4onb2sFd/0hwsNc75hhtinfeBMt8GlZLQK6dMLb0Gdx0t
	ppgzWDu5B4uPG2vUC6FPItJkrX9KTqQmNlZubKb7Ey1T/SMeBXD4gommmuuFVfjo
	040YuiGj0BRIgopCt/lS5jjTyapBNzIP4vWUuuL6r1T0mJBRPU4wWrLNnUd+ILCe
	Purtb2ooupaI4c9wR9QvA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792659228; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:k3vihxn3wD9on0Kciz76L0MWcxcaiPgilobD0M9vJQpsmNt
	EyywWgp6Eq+LisCfjdfS4fX23YXvTSPtb6NdnzDWMgumr47coUxVIY8oq0LCujgu
	ig++7cIb4oUPeYFy0m5Fal06dMzhFbODkZaGOHu/FJE5qmMT/RYgm0DsBucDfmjn
	f5FhKVAMnWN49xaDQgqJakZfYkOeBdRVNYWV1JGH9lrSFPmQF6U/T0hrsIaIaJjS
	F4uUEu365k6SOMaCc5vqfwNNNm57vvdCd4XK9CEuwT9UImJ2+7rdf6jPgxaOplgP
	HEA5YP37XoH4EOZiAu08HgYKeMGOE/Ma3eT8Nwg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VdvleR4OnY0nM2uyxhMPy57tYev5ABwW4FpKLlHaz/k=:bN217+7kpRwB6Qa0M1yj34uK5dMFIju2TsfpNKDlmoI=;
X-ME-Sender: <xms:Gc_ZauQR5rufmvyM17GbH2t1W63zGwCeZkgYlO6OH46CSOJsae-srg>
    <xme:Gc_ZaulJx8aUvk-LQ2zAddg_TZ0HTdRbsVFXcEcYHTcQED7MSWrHYXVYvZiOp8w2G
    3m0-X4ozl5TMe-n413y7wIBZQhl7bt1DAPr5jlhA1nmDK6_kr-xzCY>
X-ME-Proxy-Cause: dmFkZTE5P8LREIKrBsPwPUasG4xSROejQwAWTc0fL913Rrwk7N9358/0evvy3mthDKN5Rv
    g3HMHx0ZWBbM+OySbW7WBPoTza1+FSOmkRqLhmhzRCyGlrJfrKqrYqlm/GoFEILfpEUlW8
    qprp4LX36uzTEBJFYUdP2gdmxeButstMDY4meeP6gU4kbC/v8UyjRjEL8F09gBvcOkKNlC
    ICYhHgFSVkzPLbSG7V/zB2anzg1Z3lmjFl47dsQOhO/oYh9BeFmv4ghbTc98aMaioj8BOq
    V+XSQQcx8XRLEzHWpAQ8C7YFkq8O8ybCf2lBCWfs46EwKKv10XmsIMxYGaHOEOT/iF8oso
    2f9TqxUw5wu9nw1uYuBqSDmpdX4/AyfivKKzQIA7m3ZXtPOXUUYTfOUWZegqXvz8wk9EE1
    ZlyUIQiXatpcvQDLnhe7xlW7ATRmpNXzyLo2ybZXfCazBeqXs3rsTlLo1zbCRshvbLayUL
    SN6LQDR3buiGV3gPrnIgDictMfTJ7YqjKkBesyt9H43q1ih0X39PIq7xiAZK0LK0Ce0zct
    DKDi1q+yLdS302ui6LjYBmsdKyPhW/ceSvyM4P+p7F2hc92bfVWX4kn2n5AhVmM8+F2yqH
    POFln2zz08kQfhVpRMn9d/jYdLS4MsijDuhj0QPEro5D2XmlGtCpaQqvn6Mg
X-ME-Proxy: <xmx:Gs_Zan_usB9OcMb7VPoS9IAZ0GkOQHFLf2aVaHSDsi4YYpof4jR5aQ>
    <xmx:Gs_ZaqmM3I6lInRF4e7ux5dIEFh-zWak9qYskHobVXImUEOTcsaXJg>
    <xmx:Gs_ZatVMJtcTpNphou9gDvB-5Q1nKB_iFUqWXzLw_FJ3LMxY8aJC4Q>
    <xmx:Gs_ZavE-UxTk8sVUqJouqRCp9cdWZi5rMzB3CoJZMr2Hz9U8mVjkWw>
    <xmx:HM_Zav03zQ1yByrkqrg3voN1EM7jlqKKnwKWEJfNDoMIA-N7jT1jfkLU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 40FCB32A0093; Thu, 22 Oct 2026 04:53:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 10:52:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <b5df3f05-41ba-4d46-818b-776067467f14@app.fastmail.com>
In-Reply-To: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com>
Subject: [GIT PULL 4/4] soc: arm board file changes for 7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.4

for you to fetch changes up to cfe69169c03e71e2a22870317ef4cffb51f6f06d:

  Merge tag 'ti-k3-maintainer-for-v7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/arm (2026-10-16 18:54:22 +0200)

----------------------------------------------------------------
soc: arm board file changes for 7.4

These are mostly smaller cleanups for the remaining platform code in
arch/arm/, the most notable one being the conversion of the s3c/crag6410
board to use software nodes for GPIO references in place of plain GPIO
numbers.

The earlier plan was to drop the deprecated (since 7.3) board files
here, which would have been a much larger set of changes, but that
is now deferred to 7.5.

----------------------------------------------------------------
Arnd Bergmann (10):
      Merge tag 'omap-for-v7.4/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm
      Merge tag 'imx-soc-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/arm
      Merge tag 'visconti-soc-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti into soc/arm
      Merge tag 'tegra-for-7.4-arm-core' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/arm
      Merge tag 'mvebu-arm-7.4-1' of git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into soc/arm
      Merge tag 'samsung-soc-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/arm
      Merge tag 'vexpress-fixes-7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/arm
      Merge tag 'socfpga_maintainer_update_for_v7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into soc/arm
      Merge tag 'at91-soc-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm
      Merge tag 'ti-k3-maintainer-for-v7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/arm

Chiam, Evon (1):
      MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE

Dmitry Torokhov (6):
      dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
      Input: samsung-keypad - handle compact binding
      ARM: s3c: register and attach software nodes for Samsung gpio_chips
      ARM: s3c: crag6410: switch keypad device to software properties
      Input: samsung-keypad - remove support for platform data
      ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys

Ethan Nelson-Moore (1):
      ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header

Francesco Dolcini (1):
      MAINTAINERS: Add git tree for TI K3 ARCHITECTURE

Geert Uytterhoeven (1):
      soc: atmel: Convert to of_machine_device_match()

Heiner Kallweit (1):
      ARM: imx6q: remove KSZ9021 PHY fixup

Nobuhiro Iwamatsu (1):
      MAINTAINERS: Change ARM Visconti5 architecture maintenance status to Odd Fixes

Qingfang Deng (1):
      ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x

Thierry Reding (1):
      ARM: tegra: Fix Trun -> Turn typo

Thomas Huth (5):
      ARM: imx: Replace __ASSEMBLY__ with __ASSEMBLER__
      soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in header file
      ARM: OMAP2+: Replace __ASSEMBLY__ with __ASSEMBLER__
      ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__
      ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__

Weigang He (2):
      ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
      ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus()

Yo'av Moshe (1):
      ARM: imx: Fix suspend/resume crash with Clang CFI

 .../bindings/input/samsung,s3c6410-keypad.yaml     |  53 +++++-
 MAINTAINERS                                        |   4 +-
 arch/arm/include/asm/linkage.h                     |  29 +++
 arch/arm/mach-at91/pm.h                            |   2 +-
 arch/arm/mach-exynos/smc.h                         |   4 +-
 arch/arm/mach-imx/hardware.h                       |   2 +-
 arch/arm/mach-imx/mach-imx6q.c                     |  30 ----
 arch/arm/mach-imx/mxc.h                            |   2 +-
 arch/arm/mach-imx/pm-imx6.c                        |  26 ++-
 arch/arm/mach-imx/suspend-imx6.S                   |   6 +-
 arch/arm/mach-mvebu/Kconfig                        |   4 +-
 arch/arm/mach-omap2/control.h                      |   8 +-
 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h        |  89 ---------
 arch/arm/mach-omap2/soc.h                          |   4 +-
 arch/arm/mach-omap2/sram.h                         |   4 +-
 arch/arm/mach-s3c/Kconfig                          |   5 -
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |   7 -
 arch/arm/mach-s3c/Makefile.s3c64xx                 |   1 -
 arch/arm/mach-s3c/devs.c                           |  27 ---
 arch/arm/mach-s3c/devs.h                           |   1 -
 arch/arm/mach-s3c/gpio-core.h                      |   3 +
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h           |   5 +
 arch/arm/mach-s3c/gpio-samsung.c                   |  72 ++++++--
 arch/arm/mach-s3c/keypad.h                         |  27 ---
 arch/arm/mach-s3c/mach-crag6410.c                  | 135 ++++++++++----
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c           |  20 ---
 arch/arm/mach-tegra/sleep.S                        |   2 +-
 arch/arm/mach-versatile/platsmp-vexpress.c         |   4 +-
 arch/arm/mach-versatile/v2m.c                      |   4 +-
 drivers/input/keyboard/samsung-keypad.c            | 200 +++++++++------------
 drivers/soc/atmel/soc.c                            |   4 +-
 include/linux/input/samsung-keypad.h               |  39 ----
 include/linux/micrel_phy.h                         |   5 -
 include/soc/imx/cpu.h                              |   2 +-
 34 files changed, 378 insertions(+), 452 deletions(-)
 delete mode 100644 arch/arm/mach-omap2/ctrl_module_wkup_44xx.h
 delete mode 100644 arch/arm/mach-s3c/keypad.h
 delete mode 100644 arch/arm/mach-s3c/setup-keypad-s3c64xx.c
 delete mode 100644 include/linux/input/samsung-keypad.h
