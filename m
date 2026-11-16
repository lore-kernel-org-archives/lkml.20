Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838037;
	b=SzU0svrxJO5lJJP+cA4bOIuyp6hPPMCG/1TtFl9g2UF7dyBFdYOy8wjINU+7vuxlNz1I
	 LeMgLHtZ67yDsbCMORTi55h6GNOb3sBqETLIbe5ak7/SqQQNff6BPcW0yZtmcy7F3fbg7
	 wSPtCFuL/BOGhEC/wVbvlCPxaFhi0Dv+hddtA8nPNH62xgF8ggAuw6Tg/eZoP6/UljaRH
	 HTZGwjPiw404ljVFuBLscPym3ylBzja10+ZGxTiL8ABbZzG8csKzy5Jzm9z3TKD8ereQI
	 uxduJWFaJ2XMniJm5hUlK8+4lCPFQIBHSDnCnWi9OPHoUOeVAeAajRFlnSxhQHPLnJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838037;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=VkhSOeU2iPSFm4yiqVr/PAV71Y3lGX2cZjUnVH0y7oQ=;
	b=UFheyRaKf4KakXxX9aFyuVsZ4umu/Jlju409lz3mN2klK0P1jfwWMmZaAeg5r2wvO+Tl
	 NgnQf10qZKY/T9Anudrk2o5tTEo65GfSeOMQKDq6rbcL7Lzg7nZqv/gziFgVBd/VcBD8O
	 X5UadH866O9Zz2BT8XHVIJWe7DaelR96d9+ALy8y1ZBD3MwQtgpdPkN5sx0jxQ/nGhxul
	 raDqMJQ0pmE4/Q8t4Ri/HHhlFyu50mavxG+94Bn+wEBra9QggAP6W76WQvhLSh2YOhrzj
	 6rR+hWgEs6u6S7DeC1slc7BNZvq/UgwWA9hVQUqJyP6hcOrbRbZI9Fhil2EDgHM5JZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cFox+Mh9;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AC606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57AC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cFox+Mh9
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so3031975a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838036; x=1795442836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VkhSOeU2iPSFm4yiqVr/PAV71Y3lGX2cZjUnVH0y7oQ=;
        b=mn3gtkzWxDv3CahAlRkSZmDw/YfvjXagiGZY/5GHVJdAd7ZrN0gG1YLOpqFEeNEuOu
         75HjV19PxooxekyHmZ7CORTG6//yOkWBER3RTPGPfpxWGMIOHA+3J8M4uKql+eJrcymW
         QXB5lXNefryVJ2m0sHImqxjiEhxqQvV+67XoBWru4ZfKIcycPk7J1LurfAzDme0mWTfk
         omL4iccJOITy0V7Vgf29sMn2KdFs1MCVLWOjPmRnbEMxgqnb3z32rWXNeOwV6z2FMprY
         uhnaE28by7z+GWF4zo8xJCyqt92/DhDvEV5436YfAy2F/0+QWiYOW9tECxIuIQIYNYY7
         fULg==
X-Forwarded-Encrypted: i=1; AL+hErEGTSziJ9A8Vriknc1seraJAQJ4MrpxxVUT2d6BgHbdyPzjjQrA+8h4Cm+21YoiB6u18T/0y6jMrJvLS64=@vger.kernel.org
X-Gm-Message-State: APuU4Z+elC/AQNDyUymSXohODZXtb39cx7s1tpaQLk5ZoTIWNAwobG7g
	YRGRmHeJGVusZMMT/Av62zri5Y4HqL3xIcVXkeQleinez/WyVr/lDs0oPcOmQFhqGXMb3Y9G6yG
	Q+eOTTYPA+AyECju992SFWTSPdnvpK2PzDXI18wVNARiPlzHRGmKrQWy8hddFunSrYVFVysMKj0
	bjV8cSVPmowq2pRm5VeGFxjmTPgE0bbBiocmKdZk1H2ivES0+eEw1yRhTzalKJwUJC4AAqk3qf8
	RiRMz9eqgy1VYYs/A==
X-Gm-Gg: AZFdTZd+yHcGgqVxqD7G49Nt7ooKLtqaSg/EH7v+ONGqARrqvW+RNKtyfKUj7bMnK+I
	ZElESO5LcKOxWSXdW1Fe5lsR9+O98S3SP7c5QThaLfkhbj5jQ+SuiIC0IDqWHNQPFrhWhVNbGhI
	tVTJwraUVefyKJL+du3gY6MvLPPLE7z6dXyPq/r82yhOYErqVjaLyA0ZxRdaStnGiRv8GP+kP1D
	rTxiTeTuAS8NLU5twLH0gUyy2I36klFHkT0KSWV+BlXTymJHzLN4VyB/e6JPRIZ6Rjk4hUBMMkp
	y80aLGLhs3Ofqj5qMSEdtiRRvp7WdP9UNd+xKxIiqM9aWIcV+D02BQjzQyFG8xQIO5zArGO+tnz
	ZqhQGlUQrjEdKeEkj4fTH1d5gXfcB2J0ue7kLP9777sxrkmOfFSjChQrLHsMlO9SAeUaHUyyWs1
	3k+zmNaTw/WWjz63Eb9Rq3sKQJrSl62IOV1g==
X-Received: by 2002:a17:90b:1812:b0:3b0:9a2e:b494 with SMTP id 98e67ed59e1d1-3b1b0d2281cmr11193589a91.54.1794838035895;
        Mon, 16 Nov 2026 06:07:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c3e09606sm3444447a91.3.2026.11.16.06.07.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:07:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso3047282c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838032; x=1795442832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkhSOeU2iPSFm4yiqVr/PAV71Y3lGX2cZjUnVH0y7oQ=;
        b=cFox+Mh9qA2gSwQ4yXA4iSN6RkvdhQImx53kAbWIm4iRWuY+xkBywOuznjMBjT1r5i
         vRBt5jKaAGWzsQ3FgWTd7uUw9P/e58Uykun96uiYqUtmgNrEznDUmfCdRHhP0Pl48t18
         4E1mARrfm7Vr/AKxWy316FybmO/odnlwiQ0T4=
X-Forwarded-Encrypted: i=1; AL+hErG6G7z/7MPTJNNBVllJHrnANmth/IvxL+tU3rgVf3CN05sG0u/qPgKnjp42eh6uwnm99IMJwZOIovvuErs=@vger.kernel.org
X-Received: by 2002:a05:7022:258f:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b503112636mr12241018c88.25.1794838031331;
        Mon, 16 Nov 2026 06:07:11 -0800 (PST)
X-Received: by 2002:a05:7022:258f:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b503112636mr12240886c88.25.1794838029111;
        Mon, 16 Nov 2026 06:07:09 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:07:08 -0800 (PST)
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
Subject: [PATCH net-next v8 00/10] add features to bnge
Date: Mon, 16 Nov 2026 19:36:43 +0530
Message-ID: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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

v7-v8:
    - Addressed valid comments from Sashiko
      https://sashiko.dev/#/patchset/20261114074742.1484603-1-vikas.gupta%40broadcom.com	

v6-v7:
    - Addressed valid comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com

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
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   28 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1145 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  838 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  137 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  192 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    9 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  556 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  163 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3282 insertions(+), 360 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

