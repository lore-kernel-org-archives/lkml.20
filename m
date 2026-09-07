Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33F639EF16
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808147; cv=none; b=V0iEEO/NdIzJQAb7Wj6e1ahh+Dg4K/mmcKP+xFcl7r8lchWJbD3KEu57654+7tmImke3vFXy9JAxlaWlpoP8Y0fgiKHwF95PPqMnJB7m6MNuabUYwSURRNhjWpGxsOhn5z3MqCt5gTsNuLDbFwdpLNFspmo6n7wdgBnXFbhehHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808147; c=relaxed/simple;
	bh=klVThwxUic4pJTUSyiq+ubmz+e/crXrnGUPv7tLm5dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uhcBEO63ABKZGEekDcj1ufKovenRntq7+VVBHoU85o46di3J9eTH5UDtNDGb7m2Er13Nsj43BokXkOQI6ZwCBC2YQzf/3P7Oq3s8SY41OHRAOAlYSXmh37CylKLPT3s65099pSw2CLr5GDBrCi033FIBEnvRL+jg3WKB6WcB9kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egNIWRBD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egNIWRBD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843f205a5bso2275664f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808144; x=1789412944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ac1ZNmdF/CD5IWQMna9x33vdoWIwm5M5aDlFJMRHrmI=;
        b=egNIWRBDpguoLA/uZ+XVga5RX0/Y2BnSxCNr2ztZJQ8ICPYQw/oxDCUyMXcV6etsOa
         +9CvV4RviKj3a9ruGUlf0m/HhBnPf2dW+vjbl7NhskVU9PZ46n5pEg9suoUvV19aAbPE
         rMVHlCEJlwta5aHV6MWs21qqpT5MAJ5KC+wSInhA+m9Ugj1zRdkwoM/19by3Z0zH5lH/
         BtekUHccn+Udfr8VqO9ipDLaBBuu9E209mXBUe/b2BhkxZiVm6XCSDwhKki9z0KiAaIW
         xGrS8RC0B5jz+dnu09OJ2aWwmvjjE+N+AZw+Qj8g8M5HHIjExSVRcdsnqeyDWMjsuZ9r
         OcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808144; x=1789412944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ac1ZNmdF/CD5IWQMna9x33vdoWIwm5M5aDlFJMRHrmI=;
        b=p3nPPS88XoplxPD9Nvs7Q5NHtU6vwD4KI0jIEno9rssQPSMNs0rnOFAI1sIDCrXGEb
         nt7sK1EE8PStn4P3FSKNktZ+waL+f39wFGuHu/LpIXIQE1fTJN4NKVDXZYRSnXvbWGDv
         3WjWgy43I4HyqqCfBm5oYtcRHzIZsnUOfxDCdJWGCD5U+ZN6+SLvRo3jqq8a61wv9cKz
         u3yLTYw4Qwn4KaEKjdPD4rC7i3nNmi46lBvMft2JS8afdn7MEvrlpxRosUROmDmAEXsp
         XHTwqol0pInbe5Vbx4DMTt/Vbl2DPf2IpUiCn89PO9zpLB/orySsbvsoUE7Y4uGimmOb
         JFzg==
X-Forwarded-Encrypted: i=1; AKwUvBxlAQ7NniFyC2oe0woFk6s0Gl+vOP4P+98Ez2m5ihWEP5gkSrS7M7eYKn/BGrSUAJtpt0zU/lE3dc3zYPY=@vger.kernel.org
X-Gm-Message-State: AFuF++k7gMPe8kGdo+7D1bylDi49UyV/5Fc33r1FF8Dcm2JX6nI/Ki+m
	z6UoQE9BxHTOFgMTHNH72LvZQfT6ENobs0z+i/md1zeowtmJzVX7IV1t
X-Gm-Gg: AYBFou3Whc02s3f9ABRSydY9ZpZz1zv/wHz07GcVxRa83R6nIc3ix+qgo5wBHwvxNQU
	5+E0KnkAsnCcld260mOWfJlXKZdORq2ds9VpwZs6ULBlo+VBae4Flu+5f4ebxmMIS4RT9TvTfVD
	OlH5/IGA1OqRWrCqtsx5Q0oDLAuFQhEG9c9daGlzEKCJ0W/NdJgK9i75pWqjuMD9GOl3TiQDMIa
	qzV1hZxfJqPl7mwR3igbpg6H1hXANg5TzzvIk2+uNoXHQw5hjf7ziDN1zvpEBUwiTmWf3pE3KoC
	vJPHdpBKZLAdzmfVkBSHtQnsgvN7D78I6Fzjp2pw1y2FaGcbb6L0K/yVBhzpU4OEIbwCHtJKTWN
	sbQxUGtZEIONEmoYkohnm5JpVon8Dox4qtFM6mbU/qyzlZa3TOJE5KGpFFrm1gsn9sXyzcXnpGE
	jV7hnfBstgqlqQB6mAZAWw54IgHOORSXf5vR8sbWrOrmcmUwwbPT+pD+smvxD9OQQrlg==
X-Received: by 2002:a5d:474a:0:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-485872a8186mr19978373f8f.15.1788808143428;
        Mon, 07 Sep 2026 12:09:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm33365544f8f.33.2026.09.07.12.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:09:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 0/3] wifi: rtw88: usb: keep bmc traffic from exhausting the TX page pool
Date: Mon,  7 Sep 2026 21:08:58 +0200
Message-ID: <20260907190901.1056945-1-mehmet.fide@gmail.com>
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
3/3 comes from the review of v1. The beacon-early C2H that Ping-Ke found
usable in AP mode is the long-term route to
IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING; that is a separate series, this
one does not depend on it.

v1: https://lore.kernel.org/linux-wireless/20260902104146.3853102-1-mehmet.fide@gmail.com/

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
 drivers/net/wireless/realtek/rtw88/usb.c      | 65 +++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/usb.h      |  5 ++
 4 files changed, 70 insertions(+), 4 deletions(-)


base-commit: 81510c3d6f2199889a4a936d8cf8b9e05911b10e
-- 
2.55.0

