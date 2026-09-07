Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27F43636B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774896; cv=none; b=WEwoxvR4oKJdlAqdJ93uaDWxDn1Q5Fi3t4Na2mrb6c93nscMIBmSoVIRiBzQbUSGKJFF6AP4tKT5wvo9jACSU0T/YVDzw/AM3LE4Yh+hLb1HTPywef4fy0ucBQQ/c51YrC8kcLsmQD+E7eQg736XJC1revnoczdhO0qTQntR0N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774896; c=relaxed/simple;
	bh=m1ip0be5p6K//25N2xI+s07kjlY0PpGTuRk26Ygx5rA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ctqt6Z9Aj53KM2xSOtQ3Sm9mEIV9biWuWiqI5Sh38ZVFsqKMNGMvgDBVUgoqXWieLEV35UkFiA21tOhRwOKopkTWEZ3LjYIQw8Zr9nBMQewdTllLNt5FXqwVLcVgvjozazxrvOj+i8I+o654JbY9Mv8sahwk/Tg2Zo+ohlG4l0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmSsXUQp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmSsXUQp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647184c73so3964724a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774893; x=1789379693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tR97cmi0NkWDiEH0s6YYBJjyIYeR1zRd9pdLJfF85lM=;
        b=cmSsXUQpyoAx4etzE8XRFvUYbYy6oCmXSRHL8doQHGhWFwrXtoCXT3JAZG9sOXk8yO
         SCFsceMZbXcMCYUR5mT/+rwu/HiID52NodrCSjDLWKnbfSOTPDs7W0T/7t+NoVvAgwUK
         c1Blt7jkqGa47Kqrw+NSjQ1oUmyRdVRGpv9tI0FN60m/w6VAlGFEQ0dQiC0SaYjl3Hjl
         4KRc8O3ktxwTRz0eootcBGs50mXYo7WZfX3JmR1lizeN/Ocjaz/6g2HbFRJtW0DivuZV
         4daVyhqSyTB5QrzL3U3Bwv3RKLwZqVUyXX0L0wlOymvDIbPmtHUzBWOMosMRknMVWh7K
         pzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774893; x=1789379693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR97cmi0NkWDiEH0s6YYBJjyIYeR1zRd9pdLJfF85lM=;
        b=gRg2Oau3/yLG7Q5nAPBS6vEff625HSPU8/xOuTd+rxIADB4Ias5ojaO6pRYcX04Cgr
         x9hpDqFTdJksthAOPKaHFhfLMzxb+G8bUKAgQBTxpsdpD06ze0kX5V2a42Z0oCJtmgcz
         uPVFSEQtXMVxH8OZxv7LcuPjMQpuQsawL9BanMbV/pJ7xHfsp8T/26h1mDTQt2RywtBD
         4vt3i/R8NBMbtzQJKsvCsmA0iUwiGceAJIgJL+Fixxu0yBwr4sLcJH0/ex87EQDHlZZk
         +qBomFXSWIT3emSHnsxpDC3at46FOf3R0AXZ6tLm50TfheCSwnLkJlstWqyt1obf35Ja
         STfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhQkrk+zPwZOPzD6je86Q0jPC951iOaAVvEvIflyPApJiFBbP8pJyICnUzsAsCM7BdCLi2WVKjyJXkwn8=@vger.kernel.org
X-Gm-Message-State: AFuF++lKsWsc57J3k2Ezx+Y0gWVH8OzigpeNDDK96AkEtBGKhYxyHdd/
	5xPqp1eX3IheWtioWXjSgJsPgpx3LkYntck3pDnbk7zQKFIImEDEYpge
X-Gm-Gg: AYBFou0a6sJ/tKicXeBEghiRu+Gf693wMLPCoAZWLD0az7l0cWv5u1qzHi4DAk/WdeN
	qCBjoCKMZ+7Nf5xIolmRDZl/ot4wEVhvbNgz6snO1Y5HrZomjfN8FmS7QSW/ANmzZY+8hTwMWYC
	SBf2vPm0sV8S8RgtocyiIJCRJqSOuj4992sNuE3RyNDn8yFFSXQJT2sH27OGVZNVAlPED4s+6WP
	1ijl413eE0NSfSGZ3k1nKMIrB51un5m7qAPgLuyFpLUyGahb+vMQKD5hnepl8RtfboooYbn/96E
	pxfkUpTHx1ZU/IJDczLVgBj4MPtrHQbBeABl/Q126M9oxG1eO3JjtGRdIGTWn+y9eNHfgmVUOda
	ZaOyDiW+wpor+aX6BbRiYiYuEIPWRi3BhbakFILvRzXVYpiHcbGesGazcz2sOaPHNnAltY+NmZ4
	h16h1HVjahk4ina3cLA6/bu4lcRx4v4GORdrj84kNlBmeOBAja5Bk9lKTdwyBPrGWqTNSLpEOTu
	zENnmAP6mfZEw==
X-Received: by 2002:a17:90b:3fd0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39b07fed101mr30328985a91.10.1788774893379;
        Mon, 07 Sep 2026 02:54:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34831030c88.2.2026.09.07.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:54:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH iwl-next v2 0/4] intel: fix typos in comments
Date: Mon,  7 Sep 2026 15:24:42 +0530
Message-ID: <20260907095446.27290-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comment typos across the Intel ethernet drivers, split per driver.  Found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

v1 went out with a bare [PATCH] and a "net:" subject prefix.  As
maintainer-netdev.rst asks, v2 designates the patches to a tree, and
each subject now names the component it touches instead of "net:".  The
series is rebased onto that tree; the diff is unchanged.

v1: https://lore.kernel.org/all/20260907064528.6602-1-hemanth.selam@gmail.com/


Hemanth Selam (4):
  i40e: fix typos in comments
  ice: fix typos in comments
  ixgbevf: fix typo "enble" in comment
  Documentation/eth/intel: fix repeated words in comments

 Documentation/networking/device_drivers/ethernet/intel/i40e.rst | 2 +-
 Documentation/networking/device_drivers/ethernet/intel/iavf.rst | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_common.c                   | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c                  | 2 +-
 drivers/net/ethernet/intel/ice/ice.h                            | 2 +-
 drivers/net/ethernet/intel/ice/ice_main.c                       | 2 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c                      | 2 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c               | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

