Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD68E34A79D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028242; cv=none; b=IzQhro2hCUxIBa5L2vXjR1HhpWVWW4MLl/JSL4hRdFuVjRFFG0SS5+pz8MiFcSDdUzrtWBF0YNlVxZVDX5QC1rNCsijqpnR3CHw5JgpuyfJLT99uxdq6dd+fLZb8pfE1MJ609ZSu76Z9VW7ET9FwwoolsTDT9NZDg5sJzO6lNPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028242; c=relaxed/simple;
	bh=w6XJjtdMq8EKHc9pVdEX8u3tdtWz759iuTuOB4Jpuaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y40JFJar4Df+kbgbGge6+RnDCLBpBWae0U1LL93c9V2GAoXM88ALsn7IpzGTNdk2NoVbYys4R4/ZvMwPLs/tqB2dO65lAtRp4t+B6TEUZXBALOsMGtVkWHX4chU4NcDYdsB1an8NC4NNdpcWAauPFylEA/5AyvahuL/PW0EHXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWgxJ0kb; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWgxJ0kb"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed3993c1eso411011685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789028239; x=1789633039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuIcbp9Glx2f/SBMrmwHmlzrrBdIDZEXanHorc79Bhs=;
        b=BWgxJ0kbY3wpbm0ZaKZqlgPLWJpp+mTrZ51tWgvp4akdqi4J4BuiYAmOJyMw81+OSN
         IxeU7rbOe6XQzX+TVd9J+T0S9fKc9tm+cBMqtsQVmeru2uuvVgFBC3W7xpGogiPMDkdL
         4KCNTygo7zBgyjfxO1gc1mWyigpirA66WSNv0nWbe4yuyKIFjhhoKGxz/jqQTnaptXob
         KZfBs/xSLjaunhHHnjEvG8E/lhmcKhDHCg93t+Sz/uR65Bh/Nps7ZEdV6mg0GoD5Di4t
         o/mvp98jtQbmKGK2UNmS3Ds3AKTpd4xFUkYXw/d5BC92xdF/d3QLh8+T5aRIeyijz2Dp
         R9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028239; x=1789633039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuIcbp9Glx2f/SBMrmwHmlzrrBdIDZEXanHorc79Bhs=;
        b=QukLceyJ3rUWtCvvRBO/hINPAU9WjGF8lJYGkxyd8i7XaC07ctKIYBJUrwfkR4NIMm
         ua3Vi6NIhgiLAQuhK/bZk2ARuncJl7jcqV8l1PnH/SoIPpXJW3nnh8qVfb59SgtjydU0
         SnPMpwMjWtwaE6sfhrVLw7Z1yZZUXDYMICVdNNlLY+GTT8UddwCtyeD0oJJnTnv1xCu+
         pTx6v7Ozkia5KEFEmi4szo0qpsQ11AmlNm5fOe3sEF4KqtnWk/WtWIDQsuDh4IxYWU9H
         ICuZkRqPVUog2LLjS9BYY/wLts0TG6TXwqHo5xHoMzHN9XUBXSTzPnL87ngvRyXJcbQ5
         enSg==
X-Forwarded-Encrypted: i=1; AKwUvByov6Cvk/fZiB0M0lUS7Y2DFvisWjy0+X8V9blUrNnSy+8tNyUQvuq/0zKIhZK+78dC8Zi9P/HzX/IsOt0=@vger.kernel.org
X-Gm-Message-State: AFuF++nsMFDpr2GWUBk7W1KFdTt7mM3n8N4797JmJDdl8FrI5AXxhamt
	mqVrNvpij8MLFp98hBhqYUnLgBaCGmgve4CMznwQoJ2XLd77Me0/yIuo
X-Gm-Gg: AYBFou0qdd72jPucjgED/vG6PmXu0IcssTI4mDxI8Lzz/+3JrOeHZWxtLTnRM04JpjZ
	8AakU8u70JQb3FfQ1wRSFVnXBHiL8hsmUSgRfmjVy47lWX1m3KtWx9s+JTlnE+kRFjdqPKm2cl2
	f6aog2colfYtHrHzx2kgMFvotVDATO7LQr0VK5zG7DgMxH3O0N/KAVgv8U2/3dd8Sf0i98eUXwK
	orx30HopqoN8QO0g2fVYiNgeTKcl74YnhxHiJaGeHJjDdfTVAMDFu2TU1kZk2FkvzlYjQ+5DRBL
	Z/iSfeIHCgvtPyifEA+P+C9M1UhDqQqsFqs++FpGiJTIxksjrp7lynMpEfK+vPiOAx17c6CgBC/
	hhHYdbbi84YRHHg+ZAp+ysHhXREyd0Dy+BSlfoVM89B3eDbuZK//rRaROPz8f0nsl2FPSn3E6qB
	cOayAjlZjPgd9LsiO1HUQTB2wxeQnX2qjzH5mJpmDKkg3D7VdjQJfuAr1Yt9S/IEj1pRNQUazdP
	d//1F41GfQdaBs=
X-Received: by 2002:a05:620a:3942:b0:939:b8d6:9b1c with SMTP id af79cd13be357-939b8d69ba7mr2142775385a.19.1789028239422;
        Thu, 10 Sep 2026 01:17:19 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939a57535a1sm1087723885a.0.2026.09.10.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:17:19 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 0/3] wifi: rtw88: usb: keep bmc traffic from exhausting the TX page pool
Date: Thu, 10 Sep 2026 10:17:13 +0200
Message-ID: <20260910081716.769081-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

An rtw88 USB AP with one station in power save and ordinary multicast
chatter (mDNS, SSDP) starves its own TX page pool: every broadcast and
multicast frame goes to the after-DTIM high queue, which drains a few
frames per DTIM inside a 2 TU ATIM window, and the driver hands over as
many as the network produces. On an RTL8822BU the free page count at
0x240 goes from 1803 to 16 in ~100 s and stays there for as long as the
traffic lasts; nothing else gets out, nobody can join, the reserved page
download fails ("error beacon valid"). Only a reboot recovers.

The series closes this from three sides:

  1/3 bounds what the driver feeds the high queue (a small budget below
      the measured drain rate, the excess leaves on the AC queue),
  2/3 admits only the frames a dozing station actually needs to the
      after-DTIM path (ARP, EAPOL, DHCP, the vendor driver's default
      "allow special" filter), everything else goes out at line rate,
  3/3 widens the ATIM window to 0xa while an AP interface is up, as the
      vendor driver does, so the high queue drains faster to begin with.

With 1/3 + 2/3 the pool stays at 1803 through a 180 s storm on the
RTL8822BU, a DHCP flood still takes the after-DTIM path and is held by
the budget, join/ping cycling without power save is unchanged (10/10).
The beacon-early C2H that Ping-Ke found usable in AP mode is the
long-term route to IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING; that is a
separate series, this one does not depend on it.

v3 is the review of v2 only, no functional change, so the v2 bench
results above still apply.

v1: https://lore.kernel.org/linux-wireless/20260902104146.3853102-1-mehmet.fide@gmail.com/
v2: https://lore.kernel.org/linux-wireless/20260907190901.1056945-1-mehmet.fide@gmail.com/

v3:
- rebased on rtw-next
- 1/3: the refill macro comment now says what one interval buys, the
  bookkeeping comment is a single line and the block got the blank
  lines (Ping-Ke); Acked-by added
- 2/3: the IP/UDP test written in positive form (Ping-Ke)
- 3/3: unchanged, Acked-by added

v2:
- 1/3: macro for the refill interval, 'budget' naming, refill
  bookkeeping rewritten and commented, blank lines (Ping-Ke)
- 2/3: classification from skb->protocol / ip_hdr() / udp_hdr() and the
  control port flag as in rtw89, SNAP parser gone, include order (Ping-Ke)
- 3/3: new, REG_ATIMWND 0xa in AP mode, default restored on stop (Ping-Ke)

Mehmet Fide (3):
  wifi: rtw88: usb: bound what the driver feeds the after-DTIM queue
  wifi: rtw88: usb: only let the frames a dozing station needs use the
    after-DTIM queue
  wifi: rtw88: widen the ATIM window while an AP interface is up

 drivers/net/wireless/realtek/rtw88/mac80211.c |  2 +
 drivers/net/wireless/realtek/rtw88/reg.h      |  2 +
 drivers/net/wireless/realtek/rtw88/usb.c      | 66 +++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/usb.h      |  5 ++
 4 files changed, 71 insertions(+), 4 deletions(-)


base-commit: f71dd599a98182d6bc34dce39977f928068ecd64
-- 
2.55.0

