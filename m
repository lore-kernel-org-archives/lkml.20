Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957736;
	b=n1EDJtLVbCxiLLfC/qE//jGb8YWf0BnxHWCRJSPM6Z3zcwNhZxh82klu4T/HpZTAxn8z
	 ReGFmkRH+UpLwxaNiW4JO2oKkSgB9ReZUxcuGs0SpVN3nH70KbfNePghwigAnHar3D/QQ
	 f0vRhaxLEU4i/YsXX76Ct+f1Ex4TUglT9D6KQTbEwgb79fPBUlNKQYE7Syocat1e+Fj48
	 6jFbPOFBF7e9sal9UBfZHCy1JdrpYVsQ10WkmBRGZqHwF8N/ZFC7q7NKzk+ZPqBLhLbLo
	 3M63McaCxjkRo7XUlMRhnGQYfW6TbATvtaEEII3DDQFF03HEGI26eR5AZNaK317HloA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957736;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=fS5WVxr10GoJYly37C3EftIHoJWYXFeARnlJUOrJbDc=;
	b=btd/8BrDEVGD8w/EpG7ibuQLoaA0BUCAjD0f5BQhWwPWIM+gvzBib1eQATfiwQMZLfKd
	 XwZwiHAw2XOZpQUdBod/lmI1KBQOhvP8u/pjHvTdQMYG7FiaTsVXhwQ5Ym/exN+4QleMs
	 paTlQ6GMQcY+IZ16n6zcAagXpN4C/5aMAJmuHOFYYAO664cFco8D9mOKkRS13eUbeVGUz
	 /Pa7spfHXz0GRHz5K4vjclZvRg+pQdAA6tZnN7KMY/u+JMD+J8cXdWVINBmsnf06LSIYz
	 tQ2d+Uby8m21jaG4ztJpGAzi463ECXftmVl3M5ETfib0OPB3ji0nIrwYVCY6n26Mx0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OV78lg0I;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F416606EEB2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F416606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OV78lg0I
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-945ae2daa68so59283385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957735; x=1794562535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fS5WVxr10GoJYly37C3EftIHoJWYXFeARnlJUOrJbDc=;
        b=NzXj3aV3+huQaJyj1VnyeAVKIzvlZxlAhskgn4qJvj0Hn0WV1KdTk09TcnJiV3Tt2A
         QTok7OXJBbK1TqlnyKm0Lpag5/I9385NbcND2WmOcHDmz8hMdXxD1EX2MDNYElpXzVpe
         BvJPUJek/FLgI1dKtOnfLHZ724LGGsEny6VVuE1Xa6nVoJF/HYRWk5HLjsSqTNxcGUCR
         ZHYakygGibAXtrde+4hIafNtA7noFBGHGiCg77fsn1QZ2Kk+nr414nUsiqA0B1EVkKBm
         E3BJpwVod0qRSxtJOfTiFl5x5GgZlGKaW6OQ/VD/9BbGXEGN1nH14Yca4XaqpFXs6UF4
         x5Hw==
X-Forwarded-Encrypted: i=1; AKwUvByENzUZ6+zfWTO1RyC1asGXNZzUB/1h65cWW4e5FVECb9s8VEw963uosxbjRfPjQQnuQMGcnfwXhKz1h6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/4jUnrM0CLqzM4feg4m3sTwnoUZbOvN8QXP78VmqCxD/4ivNs
	NrCMzFbSWmFCSieDzgmXTts9c4fgZaOsNb6RaZHjcu59DlP71Ibs1bCaLSk1cXzY33RJLd3QXuK
	NmryDMzt2XQAnCGdKFwM9N5zRlEQvRr3E6G1YcuovxZoRvL2m+BqubjBDGONcostDH/ftbtL75A
	ZpujXZ7JxnghkfoUhxAzqSeQy/XpwNe8DOXVciXVumnCaL85ZFT6Zm8DWK6wJrXt7xHs8dZI+Zg
	Ii/HQNDwSfDJEKyfw==
X-Gm-Gg: AYBFou2EUGGfglz9Yp8HlXvHIxQ9u0yUVpDP8x+MAWanPObfox4ph1OrSn/ivu0XBVM
	wlrzhI+kwu6vn2LTNVcK4GshUcNp3UgM5y8K7xYs6Rp9zw3o7De+9okxAzFwtMN5TXZbXFI9dTk
	hkqQf+mIJFXsHgNIG6x6gh4n1TrCoebDkROq+2/jR1C1H0egZBwtb/XG2nOnuDI2kmMObA7CTQy
	fJxjW3AsKjACHqVbAnalgWrPvK/uEfor21i3B+QF4Uhr8SEklEiY2qt2PZNieDuapV2XUbxABJK
	nN4TCmHARR39zSH2SN39CgkdaJv7vpkqVeSrGXdTIu6tvwOgfNM//xiCYIj2b20oXcG4pyfP9O4
	Qlz5GrjB0dKyD3vfMnabb6WBF9STZoxJNT7mgNA0z0pxYwOwqIRxuiK04PLekks7P7gCt3oqYrW
	bI7PmCHJJf9ITeZ9BvDsX0gAnDLCUtx0tWYw==
X-Received: by 2002:a05:620a:701a:b0:945:d317:522f with SMTP id af79cd13be357-945e16fed17mr783471885a.19.1793957735127;
        Fri, 06 Nov 2026 01:35:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-945f5984eaesm18063485a.4.2026.11.06.01.35.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:35:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso660030eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793957734; x=1794562534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fS5WVxr10GoJYly37C3EftIHoJWYXFeARnlJUOrJbDc=;
        b=OV78lg0I19QDLHpkEvcTxmOkqEYNhIzMIAQwlC8IR+QTZrH3Q1okEY30CcUbAY+bNq
         O/Hg08Dbs4II68y6H+Awc7ERZQMfn83K8KCMA59xaYEV9mS7BMGarbCw4WMrB27OrrI3
         T/zxbLFTzImbI+RPpokkp++CWgRAr9/0J1Wi8=
X-Forwarded-Encrypted: i=1; AL+hErHVmfk0+vbHGpm2NRdEnHlmtSwIOZSAobQAFMSMyFQExqlu0DDjgYOxnME2Axb8kk7tcOOln/7kXTjsYn0=@vger.kernel.org
X-Received: by 2002:a05:7300:de02:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-36f76d162d5mr2639326eec.3.1793957733652;
        Fri, 06 Nov 2026 01:35:33 -0800 (PST)
X-Received: by 2002:a05:7300:de02:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-36f76d162d5mr2639270eec.3.1793957732982;
        Fri, 06 Nov 2026 01:35:32 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm6447726eec.19.2026.11.06.01.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:35:32 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v6 00/10] add features to bnge
Date: Fri,  6 Nov 2026 15:05:14 +0530
Message-ID: <20261106093524.838341-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series adds ntuple filter, RSS context, and flow steering
support to bnge driver.
Patch 1 is a pure refactor (no functional change) that relocates the
filter and VNIC related code into the appropriate files. Patch 7 drops
the refcount usage from L2 filters, also with no functional change.
The subsequent patches then add the ethtool commands for configuring 
ntuple flows and RSS contexts.

Thanks,
Vikas

v5->v6:
    - Addressed comments from Sashiko
      https://sashiko.dev/#/patchset/20261103123651.442893-1-vikas.gupta%40broadcom.com
    - Fix inline keyword use in C file.

v4->v5:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928061307.1172344-1-vikas.gupta%40broadcom.com

v3->v4:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
    - The patch count drops to 10 now that the HSI patches have been merged.

v2->v3:
   - Build fix.
   - Addressed comments from Sashiko
    https://sashiko.dev/#/patchset/20260908093053.2596020-1-vikas.gupta%40broadcom.com
    Below Sashiko comments are not valid:
     Patch-8: 
                Comment under bnge_toeplitz().
                 Explanation: bnge_toeplitz() is not used for aRFS.
     Patch-9:
                Comment regarding bnge_clear_usr_fltrs().
                 Explanation:
                  Both bnge_clear_usr_fltrs() (only invoked while the
                  interface is down) and bnge_grxclsrule() execute
                  under the netdev instance lock, so they are
                  serialized and never touch the filter list at the 
                  same time.
      Patch-10: 
                Comment "Does this direct dereference of the MAC
                header need a linearization ...".
                 Explanation: ndo_rx_flow_steer runs on the RX path
                after eth_type_trans(), which already accesses and
                pulls the Ethernet header.

                Comment Related to bnge_cfg_ntp_filters().
                 Explanation:
                   bnge_cfg_ntp_filters() runs from bnge_sp_task(),
                   which holds the netdev instance lock while executing.
v1->v2:
   - Build fixes.
   - Addressed comments from Sashiko
   https://sashiko.dev/#/patchset/20260814011435.194631-1-vikas.gupta%40broadcom.com


Vikas Gupta (10):
  bnge: restructure VNIC and filter code
  bnge: add NTUPLE/ARFS VNIC
  bnge: add helper functions for multi RSS contexts
  bnge: add RXFH ethtool support
  bnge: add ethtool support to manage RSS contexts
  bnge: remove refcount from L2 filter
  bnge: add NTUPLE filter infrastructure
  bnge: add NTUPLE filter support in ethtool
  bnge: add aRFS flow steering ndo support
  bnge: add cpu_rmap support for IRQ affinity

 drivers/net/ethernet/broadcom/bnge/Makefile   |    4 +-
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   13 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1140 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  790 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  130 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  170 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    8 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  534 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  151 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  378 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3188 insertions(+), 321 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

