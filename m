Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E9207E00
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457504; cv=none; b=FTVHOfMS28tuEgFES14/eKZfcESHqTYNXixuf9KU94Ci/8rbdQ33R5tEYIDfpe4uHcsZ14d0sF7gOK60Os6LiO1GU2hPZFMehMS2KHYjB7UBux6LyC31I2HCR2coaguXFjeFqlTHgBWzshfe7s2HBDnhsgIzwK/eKWcJvz7oX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457504; c=relaxed/simple;
	bh=EPQz16aiNKpOo91+395sQ00sd5tOenzFvice7v6Pt60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQV3FT/SEiORfGyOxA+wvYSKrZPtZW9wtUGFgu+wQcAVHtPdaX8C4EHZF345EVGSpb5m7kiEZA8ac1bepqrgH2O5yFcp2JLzIFqlFz/9xcgguk92mjQfUPguJ6VupqBYq4S4YKFDARHrExuVEnsIuCS/eK9fx9xoV0nSRV+PJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlNmy2g6; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlNmy2g6"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0abca97c0so1009227a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457503; x=1791062303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvkdeKhKKnkOoA8DkP08rCedPR76JZ3ITPggRNdUEk8=;
        b=YlNmy2g6fc/zxa92JmR2GN30PekaWeMSMoLutzWN+gtn248jL8NNX1OFSz9L7t69Ce
         xbltUJVZdfSXkJQZ83/2oWHz35HIjdK4AKPGj39Xn7KhZ0zpZ60AxTvDL+RDJIU1PnFd
         7VSQjCPAOo3a7iHa7MLT8IzapeTj+ED7AM20ONJc4FhJpbEMma0xUuTumxYC5U+OsdVa
         sBBs8Q/sZUwmSxMKaztlb6PvvbAYIaEKvxqOraE8B2wGyBcy4AFVE/BHrd7/52JufhPZ
         ST7u/evF+bYHiZkIo4ot0WXwhTDgn30yw5ypJgsQM7sWgij4YdGiQVUEere+OH3bYwFB
         8NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457503; x=1791062303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvkdeKhKKnkOoA8DkP08rCedPR76JZ3ITPggRNdUEk8=;
        b=fIoRWlVgeY8Gxr+hQm9uwWubPMJxLusT03sBC5kGCyk77wwBar3l/S8N4+u6jqFp55
         /O17eOSSCs1nGlWnWtwWP9bySgVJXN49bCipgcRBLz+IxLtZ6UQT6fyVq+3iFU/ebtZd
         knb4qLbmFxiDP1MOHVQa3WqDCUcpOaJKEIB5npW9+BTvRorxg40/kUb7kUf/YXsS89k6
         llDEpi47E6XwEE38F29ZBbKZta0kCIwxC9YaT5EbaXBE9KF7fU11dRbrO3FAvAHrBw3A
         npA7udu6B7wijVP4JSzRKhEkWGc+9ds6nZ8eylBLKakLC6q7iy6O+cv7ZK6pieuawQNa
         8dgA==
X-Forwarded-Encrypted: i=1; AKwUvBzvp+IOjlI8hropvhqKPkbKE5vR5HUIkMq3bFBlCjVt88nQdMeHy1Gs0bcNZguaIlTDcHG7+XAmCEUPjFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxsgr62BxFK3QNcF2Yr1urATJZbjqGi7IzRftCC03HwNhF4PN9
	vkc53mwBJ/GYKr3x7TXCgYT7UlwxMIWnFnnnNXDpXMVWRP7BHO8f8U2u
X-Gm-Gg: AYBFou1940t3vvsMSum6o3uK9gxqf7UbmaemqARYYRvPPNEO7CWlG7NvM2YcKbvyC9p
	zJvz0ovCH0++rCYVpdS6aUJcDVDFsYwrIIYy9T2vr01B0lIEdBkAnShUyFE0pNoV4moob5vayH1
	i8N67JmLgCNBMe788paFmeKdjjwEFW0UHNd0EmDVhqgIj4M3VnvZMRIFw0mLLfehD9+NEpNMxKy
	WhNChPu9h9z1HSt+w8bQ6KcUcLkC8Eeabl27po8j0Imi+nGlQuRERTg5eH49UnE8FAipdqUBtHf
	OuMcMDYCz5Ees9qD/EdWroBnKQCZ46alpSrpXlJUlsljarlhfpCCDKuVMUL/wKr777X6xmUQkkN
	bwC/MYk9Fnl495c/gL6q72X3KUXjLAgh2so2ClRktyVfA7YkpLPE9L8bR2CzwPIqS6PXFNGqB4g
	w4v3OX1QYWV1zoh5pBK/ub+aG0IdiORh0jG3yu5Fbh2s6Ar/LlKnyzbOF3SMBk1e/ZM+cRVIfhJ
	nLc+qhcT0wTSEKUyE4Dj5kA
X-Received: by 2002:a17:90b:1c89:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a0ace4d752mr5498023a91.23.1790457502614;
        Sat, 26 Sep 2026 14:18:22 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c3f74e5bsm9473204a91.5.2026.09.26.14.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:18:22 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/6] net: dsa: motorcomm: TC offload follow-ups
Date: Sun, 27 Sep 2026 05:17:29 +0800
Message-ID: <20260926211813.935723-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series continues the traffic control work on the Motorcomm YT9215S
DSA driver: it reorganizes the offload code and then adds ACL enablement
on demand, flower priority mapping, flow statistics, and
broadcast/multicast policers.

David Yang (6):
  net: dsa: motorcomm: Split TC module
  net: dsa: motorcomm: Use NSEC_PER_SEC
  net: dsa: motorcomm: Enable ACL on demand
  net: dsa: motorcomm: Add TC prio support
  net: dsa: motorcomm: Add limited ACL flow statistics support
  net: dsa: motorcomm: Add broadcast/multicast policers via tc police

 drivers/net/dsa/motorcomm/Makefile |    1 +
 drivers/net/dsa/motorcomm/chip.c   | 1835 +++-------------------------
 drivers/net/dsa/motorcomm/chip.h   |  360 +-----
 drivers/net/dsa/motorcomm/smi.c    |   33 +
 drivers/net/dsa/motorcomm/smi.h    |    2 +
 drivers/net/dsa/motorcomm/tc.c     | 1792 +++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/tc.h     |  414 +++++++
 7 files changed, 2459 insertions(+), 1978 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/tc.c
 create mode 100644 drivers/net/dsa/motorcomm/tc.h

-- 
2.53.0

