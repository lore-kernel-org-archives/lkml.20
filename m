Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140315;
	b=b68PtOvew1jtY0IWY5SsKgpZGn91QZYG6ZkoPZSBi/VGpSNIr6vqeQiYJ8R2EwiUEzcZ
	 gqJCAvnpeAC9zNWd65Nnx2GyQgcGOrB8Pv3u5864WLdKrdp8MUxAo2FrwiWfDGOIG2yI0
	 ZleLOodbxyp9i29qQryUUrzinjQX+cLnuUe1wb36oIE6rViEeN5NAdPUX+XY1e/VG0/1U
	 MQLrA9ILfPbCa8PTaXPqIShqZOKVr0kPoSY3hdWboviFv1fwAckzle6hN5zCjJbYXTRid
	 dxwe8XBU59XMNLSrgqBIbF7D0nVuA+mVzM5PYzvp6KWndSwbkUTqBZHLGgVcCMaP9Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QO+WEDDBqCXe3DR+7d+xZwsDicSuUOeENxwYEeiY46M=;
	b=CJBh/AHxN/hYdZJ/TjMYVqcPGI6+M927Olo2YvuB0mRkcAyq/R5ZXWh9fNwvTN7nm9As
	 F5HYZMeOFHNQBGZ6MfrnAIr75zAUhV+QfH0UFGLA1UETpPy+P/3suQkma2onuaaB0ynnN
	 jkc7OEXOYN+0CnKXABvU/U+t+FNLWKV2TaBuDYgM6cja24RtD37eGxlCwfS2HJVarRQ/p
	 FXW1QfIK0UvlLN40I5gChWO16tFsVYHGNef8PdVh0n9BN9er03ZXIY3phuASBZczpZ+m6
	 0Mtq7n8EKy7HS4el5aMv2fFWngT6WqG8MOeRVs/JmJurHsNp9SB/T3smQcrUWTYr9rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPhMfyJT;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709C9606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709C9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPhMfyJT
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1846bc43c28so435095c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140313; x=1793745113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QO+WEDDBqCXe3DR+7d+xZwsDicSuUOeENxwYEeiY46M=;
        b=FPhMfyJT2hGmNAt9dbopO31iGF+QwsdRG7tvNBck1Qsn+uF3MfdBTO1Qje0LSO0UCR
         wYsS4+gOP2qWkglZmWm1dfqVeHz6pR7X8i36xLXpSxDckVjNhPGzc4m9m71rV/DtsVF3
         jeVCyvM/87svUspGWyj15z6FBhEKUmSNcyarzHljR5Vvxki+hvgdu0/Z8ozE5AG2Y79v
         Iw2onlnEBwK030jaNhTPdUL0Mpjl90AhYqtnuz4BVf1+Jyji4L4JD5mZgvWpg5jWrBzb
         yP58bZ7c+la+TNmTI00KgpdgbTcsXa8tnYrAaMsdNYyY9lIUboCheTOdxibOzdx5iJUw
         /9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140313; x=1793745113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QO+WEDDBqCXe3DR+7d+xZwsDicSuUOeENxwYEeiY46M=;
        b=zNO9J2CT8SamJVgp5Cs+eVQOwW0hhzD5kDaQ/hAC96slnQ+zJeqW9whIje0oG+ShLj
         RoGnWMXwtrG2zjQM8VYpMfZl9Pv7pKSJ3WKip/3HPAoAdQR2dz7S1BzcnH9hlkR9m7Dx
         VXrblLLIEXDv/UaJYAPvQuvfuFJi1fbmLlgWB2+iQ57VN7f5yhEId953Q8Y3sdt07Vm5
         yXFPp97ql4Hzw+Tn+qAEM+yQB8xXPAbc7T5spA75NCSYOe+R3wW5ONUwgx14jCi4BS3j
         HvyIYVDj+Y0q0/UAyGulswRNmZ0UbpCj1QFVaoAKA8RUSdLItrgaUPxQsg0e6mkqSyMR
         q06Q==
X-Forwarded-Encrypted: i=1; AKwUvByK4gbxBtd/x83Pe0zF3q7didM4sK3i1nCEI+bvtCLHIhUCztZeX3y7VeDSJOITst27SAwmKC9/7XIjTVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsquKY4DICJIePK4tyiSrLlo8u7m+XbZ1DGCIIiO+0nm+qRlyA
	+Sg/Ay8DYa6XMpLsOPODr8rGs9lG4tqU+xwQCy0xJu/fD/ejFihvJzFV
X-Gm-Gg: AYBFou3JmRQHabX9PSGsADFJKbrS02gT+XZmVgYoWIyyXGoO+ROf/tXVyX+612OcmWe
	6PdhQCFHJUeXwZ5NyzlJI+phZBuD166yquYop8UNAvsrYmYnbRLf5SIc5MfQt1eXAxxA4uoMSBb
	WGCQyMk2Q6EfRFAaIbj187cwAa6PjdS70osnDTMg6u5/tR68k6FlpD9sy0wd9G6F35tzxpATWiU
	KgOJtEkvSYXzN36G8yjzrZ6n6ij89yviuKKDpDTA7GOxN1SxXuPo8Cp7+RFKCO900TRWJnoW2vx
	cyG/G3myFv91Budk59gfOQBccphAf3j0t/e8N83EyEl78zI/s1HHkseFT3NBIBeGh7UXd+bxLd4
	y/PtXIiOjdGsTt1goT5ge/ibKfFTW08G1RH1+5Ya5UIjiU0b9chLhpXF+n98Tr7anTJ2HZMldpG
	egLIfmRvleKe8ESgh26bye7xSA9+gZ26b+KO06ac545gia+9phpzX33+Gk30Iv/Rcx4o+XiDWO5
	XXy4vTB82eFwEPH0v4av391IMUIU/CnDdkxGoIV07w9dru/u+SK2TMJRXO7/cJ72XsQpICsjj+5
	fEwOHPNESF82GkI8gBPRgw3P6mM=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr764862c88.29.1793140313210;
        Tue, 27 Oct 2026 15:31:53 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:52 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 00/11] net: au1000: Bug fixes
Date: Tue, 27 Oct 2026 15:31:29 -0700
Message-ID: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

This patch series contains bug fixes that were found during code
inspection and also during fixing the open/close/open issue that was met
on the MTX-1 platform.

These patches were tested on a Meshcube MTX-1 board using targeted tests
to ensure the multicast and open/close/open bugs were fixed.

Florian Fainelli (11):
  net: au1000: recycle RX descriptors on allocation failure
  net: au1000: clear all-multicast mode when restoring hash filtering
  net: au1000: disconnect the PHY before freeing the MDIO bus
  net: au1000: report MDIO transaction timeouts
  net: au1000: serialize TX completion with packet submission
  net: au1000: assign a valid MAC address without platform data
  net: au1000: fix buffer descriptor free list insertion
  net: au1000: restore receive filtering after MAC initialization
  net: au1000: restore RX buffer addresses when restarting the MAC
  net: au1000: keep the MAC stopped until the PHY link is ready
  net: phy: smsc: wait for LAN83C183 power-down recovery

 drivers/net/ethernet/amd/au1000_eth.c | 74 ++++++++++++++++++++-------
 drivers/net/phy/Kconfig               |  2 +-
 drivers/net/phy/smsc.c                | 26 ++++++++++
 3 files changed, 83 insertions(+), 19 deletions(-)

-- 
2.53.0

