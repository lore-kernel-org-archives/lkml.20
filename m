Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202148;
	b=GdqZOYpl9CHPxcp9Yz6PBepf5FJPEUlMyJ7VJ1X2yvNI7ms9ga2wVpfhBJxPXP6IF5ti
	 ND2BFyMxhGf/P4YLrsXmNeYt03/TpwHfWY4Z+kadwDC126pmaDjlvaiozQHrOHdMdvKg3
	 VDj/ruP4uHgngMKKS/DVTgaEPFmyWBbwvpnLHHnaKcj83Rn+Ojbg4lk3HKA9OZTPU3Nyj
	 8ta1GF2QDrxOiFYSl+zDEBenVAypSFukXVbejJgwA700KQq6TmuK5oPBpjeDM/Zj54Qkn
	 hRvV1PmI0en9CkHPl/qZ7+2dCo1JjLCI1XMeTKrty1gdiLy31vrOFEfY8N9L3Dw+bKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
	b=SCCcnTpZErRwBMxc6Od05XGoLbCfrN+pwO0hg39L81xRBV84902ee7tm3NYCHtMvZkko
	 EnVyn81VNC2J2kULtyV3nqbMcCLNVZBM0dzHpFkmTeE7t/OYOCSHC8/589mO6QT0RjyIB
	 0C3qgsRws4/2LTYXK6kVYnViZJVBmXte9CsDayXHCp+U5YEl2eD/y33RPnQ4bV/srImu1
	 WkuIFSbiAzF38U6zruJPvRgHv3ifWzKSkR7mn2mAPLNDvUp/lBhRGyJQ5dvox8OjsPcSW
	 LbO3xpYsUDIW57W+8/V2d9JrGg9ItTj8oUlauQAmnjE6iUScLcSIMY4633LDDu48+TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mAO8/BpX";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7073C606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7073C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAO8/BpX
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b1015a4259so311834a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202147; x=1794806947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=mAO8/BpXwOeqG2k5o2qTSWD87qR0fy8I2rHRO/KQL7ZsrY/kMN7Pa3BjGSLFr9pF5X
         nHF1LMETZjVkNH6LfnvUoOJ+lDKgSFkThlp4XrZgWj8vdoykCiCx58M4agfvf2kx2OBF
         MczxltN5kEnxYvkbsgMHeC3Cxd0JV8KBo/YOe1kFBVv1zXLoqT4GKQlbiBDcnRcdNsun
         ZNiCdw4je4YmffE/A1yUJEdeVTvmNJgMr7pqzoJkeUwfP7sxUZ0Sft5x6uZruQ9eE/aJ
         xM3flX4ZdsA3hVk0dAXD3HW82CrwQAEG/MZCcMg+/dxnwIfeIiYM+wWlSfPGDdqm+yzo
         8fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202147; x=1794806947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/+iqzE3D85GzraKFwMggPSN+1bOaRD1qrvalwGxknE=;
        b=o3sfoL5LX7P6oAW/jDtnBQIpqsmoOXRFig1tPzjBVXvHj3VxSsBz8mzcz0VVcCs9sO
         KJr+X9ARz0Io1yBaJVaMin2m77c4F9VwYFdI7bosbN/c9uVlEBSe52gko3tz7LyHlAdx
         kAMPs/uyoApT0EO5oOPxeijk1Yy8qE154D1N6DeAYnztnRGKfiLiyly8TSKcXesFN9DX
         mP2ErtK4zFKD1Vt8Bo3CwOs4O2vni3fCli5UwpvqJAe3i5mvdoJfRxXmyzKahS8NMLpz
         eFGB4bo1Wb9LIEEA9IoBPo8aoi5DM3s20leaAm/ozJuxtpsDuFWkMQuVGCdd/9M6nmo6
         N5Qw==
X-Forwarded-Encrypted: i=1; AL+hErGeEh/6KjSIQM2BK6bMFUI9UxPtzYTTZCy8ZCg23Pxlgenfvs15KY6apcoJtjibl9YzNGBqzck6Ybdt1Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XOSy6XgTfrr2FXh1Xb90+/ogJhY86L+IABblCHRz3p4vjkFe8
	xMkDXP/t22xUt4I+fyxsnCo9kudHfiVdc5oyznlRCaT0KKZEsPkmeY/J
X-Gm-Gg: AYBFou0Kv9ke4G+oZjSH03Z39xlmZfUWBb61+F2G0v+0fT+wNY0lWcJsyfSO+tgjjCK
	2tt8NLlxbSFUcEUQfC7HlTWjWF+pMf0K6vGre8WYw8nrkwW9rNWcHFa4zWOAO647MuTZELXH5+/
	f0GaMZ2lPZ/CB91+GVGSPT0CUlzmeHzY03rM2BwSPKc0O1STqRcIr11DzBxEXCfv0hgomXRVYnS
	KQn1WEpsj4LTi/GJP3sLvCQn7x+holiTuYGM5wOPvJVDtjJhWGlQ7YuSWFyqP9NCGcOcxM+9aSN
	VU9Z/fYImbFF0mUpmLL6FALE6tJ78RrKZXVqLoYXrBiGaBg9msXjK59zWsFWDb4eeUbEt50IgPB
	/UZ9J+Qm57hGBy/KYosHDPShBRT+ZZ+fFOYH+ZDS+3U0/vfXoyLGSZ7t3d1vnLey3L9bTDe+AYp
	ANB9jJ+6kYi/n5c8vTZBwElbDQM3wgXOZ4J5plCnLwCgn9VjquVacyLwehQA/rYXSeyaVRb4SyZ
	Wk6GlYOFkSHpz41/OPeatxsloKPi5DPtvmNGTSbZaJLVj8TK7i1fYTQ0hc6RlwhrdWfqF9UpRNi
	TXKuHgbdKpAiVNT++CyYhgAmj3Hr4n0u8xPg2WPf7//yCbcMr4dlUqdXdsxwc4xl+fXq+EmMwHj
	MtNw1S5CBSiwlBPmcnzKAlH7MUiQ2xwhvHUtw
X-Received: by 2002:a17:90b:4c88:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3b12d442907mr2821498a91.30.1794202146776;
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:06 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Mon,  9 Nov 2026 13:28:58 +0800
Message-Id: <20261109052900.2960473-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc1:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 672 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1

