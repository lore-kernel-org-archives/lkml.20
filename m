Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867989;
	b=cNL6UrQBJ7HKsfkCOUheEPiXdIWAsoh35wNqB826Fa0jL6Y1yiT2FNy8gLqnave9hM36
	 UnttErP+xdiddk5LnDMMmdyf0eYKmj81VKxttD/6l6a9GsgTcUlx8ICwZhE7fW5p7oR9I
	 ND83Zlg78MvwgvGpMKcSNj49CT06hZw2lSk+hCAjl/BmDBmZQIoSdOa0hbXfLWu/kcgpf
	 epFcIfGYxk3A1XjrVxtuknS4M4RpTIJrBMuNr9inPsWsEIbjXXxd2et4zJVLDUUcQKgah
	 rPyOwpZrOMvipQ8YgW1sNsl4LnSIMSuPJpVNlIiVMOFNZm0bK5sZr0fGohectUA2+RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867989;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
	b=48u+Shb/vhvgZGSQby/PM5RpVQuAudbx+fJ+G0MnB4lpAwPQg465pPN1P5anse9qocAS
	 EJCB7o8Hss1YT4UUII5KFj9MBp12AywiLTmAKdHrERxlx97IhL7mIlaB9u8rV93+OoNkH
	 hWCGxC8oWep65R/UjXQqH/UKBxYp+UVS0QdFw2nEPr8WPK7wniipoXFK5h5F+9V1FazEM
	 sn9homava1Hq29i52KVWMo6jq3UA7DweOzTas0vVxS/SvPlDd+CAYGSzbr5umCWSpE5+s
	 m0e7Q1+F2/pKZ5X/fEPGR90u6D3VOhUQjuL0ScGW4WkfgNllENMua/oERtHSBmkY+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=amoT01zp;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7618F606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7618F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=amoT01zp
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b1535be329so2972351a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867988; x=1795472788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=dMqMs2Ucev1BWkv6x3jldaLrZ2BPQD7KHhjXZT78RGW0wvH/jBxYwfZ26Cy5b/sPaI
         XylfKwxn7IPa6g3raT6UPmq5KpyvJHIeJTZdDFn9WaYvPXjGrKK2JFKQz6S671F2yAuQ
         Z8i/6TDlL5wdsJbNOOxDN9Dg0pElvZjBwUKJyL/nuF2pA4CXduIjKWO8+SaDrz59OJuY
         B3ujDck0QVEGnv+9TcRw8lSwwdNXbkynbkX40mn5xjQoZrHUXqBTPQSHjPVP82uObb1d
         LE92l19ISUXupJ5x168Efl118UPayUHJBTDOCyeCpaoWOvhRkkv3Rs9N3JlkhYWG5CzL
         C55g==
X-Forwarded-Encrypted: i=1; AL+hErG9HkqqyEUHRVssRA1QHSZLyjqs1NgYNxbqI7K+/RNsc0Gs0/S5TXxM5z5atJ2eBqmn+61lxCu5BdYDIEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wa3eFaakiERaSVkb+eewEgMZ3Y1YF4+uqfaQDHRKVJDINdnqj
	mQgyxXxGGxQfPhqNgTvDhmFqniISE5SNxnFTa48NWCZCKNH0grmGBjZ0IDNqb8xZ60utWCvL7B5
	AgmE3r4fzAptYd8BwHhdTd4U/Axpo2VDj17ZXLjHTzO1V3Fbhp29/wGtEcfA65keH4Q/LR/AB5m
	PdC2b5y6vYvMixTdAZKlNIpN/QRg3FMZnAF46gdAWzECeW1k9IVxqgPt1WH2QZMtVWnbVdccdLu
	LdEYWxKmCmLu8EWGi2V8/XJ
X-Gm-Gg: AZFdTZeYMIirLHbwvFMIzXVzIMz5r2SNJ0337zpYRb6K+FZQg1xoAtTfLzP8onj5MUO
	bE8KoMftYz5OPBH1Lipzd5kr16xqNE+8B9vfqgYuf12Pnfg06lolFsVYfd/EHjvXCKjLvRDR5hQ
	Fjw6unZpfxGEQ+wUlr22HHLl8HgtWV61remk8HBjpY3SZiLqrhbZ6dYHGvjIQddzAb+peZ72YMZ
	fMYJWZWS6DyjgbOEbFgp4MVtgy3rAxqN58LeVHZe9WzEStGnmkZLpVfxAwQT7EFzf/m1vzdLJbv
	4m6nQNiigAPYgVN7JWY6OHZsjYrR/aDFyBbx4LYNyVNkI60fNfrL4e1SHy80kc7mjVkM6oXes08
	sLzVwSTW4NDihJOs14kqqmjVTbsRG1Oa6jLk9v4jQYT5zi6GPxQROQa3uKNlzFnliYEe7HxH8hg
	mTErZ5At3q/lBX+16NUXYPdl/EEsRud0R8CA0zqTeT
X-Received: by 2002:a17:90b:3d87:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b1b0a3956bmr11160272a91.40.1794867987444;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abceecbasm463188a91.3.2026.11.16.14.26.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so4050885eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867984; x=1795472784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=amoT01zpW1QiyWV7iomzHY4VI3soQ9GJqEyg0fwZrUGc+2SAmFe7WWlkbH2pUYrzJV
         S23qsAOVfZRSxhqClj8gXxMtFBxcClMDWLGRSEevbZyVVCXzHgv+YHrk+cifXiBbpOij
         Jmm5hZM5UwAnBukIUdjljQrf5Gsy2oa9e9fcg=
X-Forwarded-Encrypted: i=1; AL+hErEsNaSJlmg/lPyPbukIRDKcG0W+2HZcINGd+00P4cnPmrvgmzCq5nuZuxNV99pBSo+SBsbWpl3J0gU0gD0=@vger.kernel.org
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977692eec.41.1794867983579;
        Mon, 16 Nov 2026 14:26:23 -0800 (PST)
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977651eec.41.1794867982905;
        Mon, 16 Nov 2026 14:26:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 0/9] net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
Date: Mon, 16 Nov 2026 14:25:10 -0800
Message-ID: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

This patch series adds support for the Broadcom Northstar IPv4 TCP/UDP
NAT flowtable hardware called Flow Accelerator (FA). There is a second
generation called FA+/FA2 which will be added on top later on since it
builds upon the custom Broadcom tag.

Florian Fainelli (9):
  net: ethernet: bgmac: validate RX length against the DMA packet
    capacity
  netfilter: flowtable: reject non-host IPv4 packets before lookup
  netfilter: flowtable: retain offload ownership until deletion
    completes
  dt-bindings: net: describe the Northstar flow accelerator
  net: dsa: add Broadcom FA metadata and IPv4 exception paths
  net: flow_offload: allow drivers to validate and invalidate cached
    paths
  net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
  net: add KUnit coverage for FA and flowtable path validation
  docs: net: document Northstar FA setup and NAT qualification

 .../bindings/net/brcm,bcm4708-fa.yaml         |   45 +
 .../bindings/net/brcm,bcm5301x-gmac.yaml      |   27 +
 .../ethernet/broadcom/bcm-ns-fa.rst           |  507 +++++
 .../device_drivers/ethernet/index.rst         |    1 +
 Documentation/networking/nf_flowtable.rst     |   13 +
 MAINTAINERS                                   |    8 +
 drivers/net/dsa/b53/Kconfig                   |   12 +
 drivers/net/dsa/b53/b53_common.c              |  427 +++-
 drivers/net/dsa/b53/b53_fa_test.c             |  102 +
 drivers/net/dsa/b53/b53_priv.h                |    6 +
 drivers/net/dsa/b53/b53_regs.h                |   39 +
 drivers/net/ethernet/broadcom/.kunitconfig    |   21 +
 drivers/net/ethernet/broadcom/Kconfig         |   35 +
 drivers/net/ethernet/broadcom/Makefile        |    1 +
 .../net/ethernet/broadcom/bcm-ns-fa-test.c    |  661 ++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.c     | 1901 +++++++++++++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.h     |   30 +
 drivers/net/ethernet/broadcom/bgmac-bcma.c    |    5 +
 drivers/net/ethernet/broadcom/bgmac.c         |   41 +-
 drivers/net/ethernet/broadcom/bgmac.h         |    2 +
 include/linux/dsa/brcm.h                      |   19 +
 include/net/dsa.h                             |    2 +
 include/net/flow_offload.h                    |   12 +
 include/net/netfilter/nf_flow_table.h         |    8 +-
 net/dsa/Kconfig                               |   20 +
 net/dsa/tag_brcm.c                            |  120 +-
 net/dsa/tag_brcm_test.c                       |  199 ++
 net/netfilter/Kconfig                         |   10 +
 net/netfilter/nf_flow_table_core.c            |   21 +-
 net/netfilter/nf_flow_table_core_test.c       |  171 ++
 net/netfilter/nf_flow_table_ip.c              |    4 +
 net/netfilter/nf_flow_table_offload.c         |   62 +
 net/netfilter/nf_flow_table_offload_test.c    |  129 ++
 net/netfilter/nft_flow_offload.c              |    6 +-
 .../kunit/configs/nf_flow_table.config        |    9 +
 35 files changed, 4651 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 create mode 100644 Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-fa.rst
 create mode 100644 drivers/net/dsa/b53/b53_fa_test.c
 create mode 100644 drivers/net/ethernet/broadcom/.kunitconfig
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa-test.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.h
 create mode 100644 net/dsa/tag_brcm_test.c
 create mode 100644 net/netfilter/nf_flow_table_core_test.c
 create mode 100644 net/netfilter/nf_flow_table_offload_test.c
 create mode 100644 tools/testing/kunit/configs/nf_flow_table.config

-- 
2.53.0

