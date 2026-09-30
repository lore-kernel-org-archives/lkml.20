Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D493403E4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754290; cv=none; b=AdFp42621hb3UULmfb9y/obsvcIINTVKBZoKsLbIiSBE4OKMC9HVbur6PZIAFj2QIxfby1PHKA5klhGd5XSN6pprdatMD7TeWEdTzs8I9t17zgN1BS5KprnJdwO4fImrmmidG+jzYLbQshum8o5zhQyZUoR5w9cd2Et7aP5ePlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754290; c=relaxed/simple;
	bh=LDVQ7lyg+1YS+lGp9uMmKlAPQeI0BGbetpenCTNZP4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7ZIUfx4oiKL+8wzEkNU1zQHr2KVQwkKWHiscGV6dq6yq6eih5coDmmEfNHZ29Wj4PCdZdXQf2MnqwT/2LltJeKiE/bJR97MRmq3ArGELUT4diySwboB4LKUf+W9PwX4rpS1i2CwEW4p+9RHGQs47++PO4+LjZaTxYfikUXcMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUMvNXgG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUMvNXgG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso36952465e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754287; x=1791359087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aP3HpmdVFomE22DhxX8rVgzIVeQZvs2xgSWS4MOQb8k=;
        b=PUMvNXgGOfQeulr935xCGc/pRvA4axgkmAm8l54Fa3YBFtIu30RcpM6x3fhfmqbSAN
         Zk4sArm+HUYaCyh3SoDEtpmpPvPBK+vu7wyYzhuAS6Uz4U+F5J8lAgDNEoBQat0uVBhH
         jVDc0ESqJqI7/e8am/atl53qbK5WUTH2YjNeocXnORER13SlChEZXL0w7jzTObX8NDNe
         +UJPXAD5aLWJ5CwKj2HKimAekq6bx4QcQAreYc0m1gH622XHH2wAGRS/xitjoZ+ZdB3L
         y9hoDv0Yf2FORtQcQibgJMy1cwfyNPWmD2rg4UUf95GkPDhpfusRKzvXe82TMvNIthB4
         ompw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754287; x=1791359087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aP3HpmdVFomE22DhxX8rVgzIVeQZvs2xgSWS4MOQb8k=;
        b=oSMci8xAM6Wkemnf2jeiPxjVPRiRKHQk60bd919gthZZxyye/DURqS9Pd80w2TesYk
         ELfy//eqTd7UcEmVl7sV8tz0f7Qar9x4NaMCtUko1FuSdTQSPEtxVII/8wfXrJhrFMUD
         D+vRjSLEyC7nUpRFigZoVI9bkjjiel40DZHXJAtajvSY7WVCRCEmK9ilTEHwtf0jK+JM
         A21zzMQIL6iiahxRmvwd69YSjGvrkrbOnzL8T7Oj/KfrfIjuUkvIilfPt+xqarqCrP7S
         Fa4hINBevLNJu0c9rsqcYWjFKia4mos7oQqkhy1BbXsUj6/pzMhuCKuZn/BDHLtfoutF
         G9Wg==
X-Forwarded-Encrypted: i=1; AKwUvByNQev6XPqJYoltksRTpZIKMs+S2LdQ6z6i3HcNsNERhrw6/xGXaNP5fQWkO+3OGj/MpmLn4xyBXeQ48pA=@vger.kernel.org
X-Gm-Message-State: AFuF++lNAh540nDyscyFeWfxySV/i3OpiGWEEguttekFLNTubXZOip3p
	8TQ7N/ZlkIYT2EL5gLoJ+mkboTlx98AcSCtXJqCqVtwcDAYX2PHLrfE3
X-Gm-Gg: AYBFou3P0Bq6tktXSoauGG6tqddmRuN6l/yyCkHElfhiczLmyffCpR3pANzqiUM+O5L
	5f6JPSAd0iYqNamr41RrWQ4+LX+zhA1kXuoB2MFiyUl8tOWFfpQwvCsDVjcGDdGV3g37G7HkQIt
	xtYPy1Q51lACtLAmPqJmc9IENpWlbin3oxDGRQbqTDxAj1viq0Rn+eotFtlbcRhsYXJT1hYulYm
	6YO9UTpvUI/677mN4o0IK9nB1reHH639dbXPD2rj976zvnI7IIG0lwZssJ31pdlERzmpGjP237l
	ey17h879/pAlj0DcBzNFTEN4/ei2zmcKdIReSvh7pw/5PQUtvQ4mCEIoEFOG16w0WUcBB7t7m3s
	HQb5GfuD7EWhtIYVbUqIH1lVljyqq56qjueBPEKGwfXpXKCAhYZbf+edLzwTGvAIwvTJGWLH5Ul
	p9SrnSp9wXmI6EJwhd6oxIUdkI0+5u+TYitEkfTc+faWzOBYZUsLaabVnx7VJINmF2J/NYFdv2G
	Tq1
X-Received: by 2002:a05:600c:1f84:b0:49c:eb04:1c49 with SMTP id 5b1f17b1804b1-4a01b00c503mr6110215e9.13.1790754286577;
        Wed, 30 Sep 2026 00:44:46 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017bad33fsm23934595e9.4.2026.09.30.00.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:44:45 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 0/2] wifi: rtw88: channel switch in AP mode
Date: Wed, 30 Sep 2026 09:44:42 +0200
Message-ID: <20260930074444.1991223-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

hostapd's CHAN_SWITCH fails on an rtw88 AP because the driver does not
announce channel switch support, so the only way to move the AP to
another channel is to stop and start it, and every client drops.

This adds the support the way rtw89 has it (edba3f107844 "wifi: rtw89:
implement channel switch support"). The first patch is needed for it:
rtw_fw_download_rsvd_page() fetched the beacon from mac80211 twice per
update, which advanced the CSA countdown twice per beacon interval.

Tested on 6.12.111 with RTL8821CU and RTL8822BU as an AP (hostapd 2.11,
one and two stations): CHAN_SWITCH with counts 1 to 5, the stations
follow without loss; aborted countdowns and STA mode scans are clean.
The hw scan path is compile-tested only, these firmwares have no scan
offload.

v2:
- rtw_download_beacon() takes the beacon from the page build and fetches
  its own for the hw scan; v1 left the scan with -ENOENT (Luka Gejak).
- a hw scan is refused while a switch is announced (Ping-Ke).
- one wiphy delayed work per device instead of a delayed work per vif:
  serialized with mac80211, not re-initialized by a hw restart, checks
  RTW_FLAG_RUNNING, cancelled on stop_ap, vif removal and WoWLAN
  suspend, covers IBSS; it starts one beacon interval after the
  countdown beacon so the count on air is not skipped.
- commit message of 2/2 without the rtw89 reference (Ping-Ke).


Mehmet Fide (2):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode

 drivers/net/wireless/realtek/rtw88/fw.c       | 75 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/fw.h       |  1 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 46 ++++++++++++
 drivers/net/wireless/realtek/rtw88/main.c     |  4 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  1 +
 5 files changed, 113 insertions(+), 14 deletions(-)

-- 
2.55.0

