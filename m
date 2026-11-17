Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935407;
	b=42ORmwnt23zksTcgsA9c70M4Ea2aT+YGddD2QvLEi7INJefHrH6rqcYd41slYaNgLA7I
	 Rjgn1WFe8LuwiMMAjmsThbO68PpbCWLVufiHFPEj0zEG6CHhTFa52LuA3ydzITeYLa/Al
	 eIwetkDKWQBcQ6qNKhvbVGrdBH3FYm7y+z41jlBr0RiDENGP6oUbhaiTg8ROLgP/g4ory
	 cAo6wG/N1CNPGvd06GGlcFoy/xzHkHDRtEUd0Llz1k2cjW25HHJx0OplvDYmGsJPENV0C
	 4I5DIBTMib7+NpUdhKK0LHFowDUTY0yuJ9H9fF3sg00FDQDqSJ9hAoBhQt+quJhCpjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mQOCu5ETOup6h3/HztjN3vPu5TBUK7DFHy0vvQNh4oE=;
	b=mq/j94Nj9eXyCFyhLW3dD/ouFtAHFg7VxvVhumzYydykG+j9+TruUJpomqvtHqWE2HmU
	 PK5+OcexLDmkg4FzQcVPUXgRc9dI+9BodDpHJBnoFbrllGbaMS6lfhL2wP8/2lpgyrcwD
	 hHe6bYVETr69byHqPdu5hiIJMVTjOjoP2W00slcs2gDVCe/+hMyFJfpyDJd9/C92qakoZ
	 TiPWrU2jiyy+TqwzkReaSJLqxXnPDhr7mtWq8/1DIuMK9cQzLMAteUYV41ZQoIaiumqcH
	 7UnxdzxHFKZD1TY4PkroTBrLTg2+fpRb3bb2e/ac7ZhLyuIJtnuwdQ0mEKlM8sl7fwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6LU2jqS;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8D6606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8D6606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6LU2jqS
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4400843f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935405; x=1795540205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQOCu5ETOup6h3/HztjN3vPu5TBUK7DFHy0vvQNh4oE=;
        b=H6LU2jqS2OfceMaOeYPRgpY1POH8yUisEeG6yNEs91S7R/P7yH/VnNYvqn01rdDWfX
         uUAmtGS2ctAhALGf+q3zM5KiZVne3CaDGVkZFHvTHw+8oSWMjGNBXineTjJaXfZNQIDe
         O3zQNxQ2We6qm7aVw4XyRJW1I/cLHJ3mBrMlBsbWr6UdxGqDi+tI98ikengw3l4GIFNj
         8nz4dceu6ws7u72e+0kcJNFP5nE7MZGRNH4qU9u1gwi7hBra9OxOL/NZvMbyOsipphLV
         TtClhIRdTY0ybp/l5WlOFog0ICfDTbUpkD2v1xoqVBBSpOtCd21SjFJ2CxZhKfQX7De6
         hvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935405; x=1795540205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQOCu5ETOup6h3/HztjN3vPu5TBUK7DFHy0vvQNh4oE=;
        b=GDJ2Chd/LFet1pPd6w7Zl4/+f00llRwU3ErMfu/YOiDPZAsh3orrnc03/Ufx05AGWC
         +xRW+99osKmyqqIlIdv9JLrQXbXzPLkLwof3TknPBFXWOs8+13ONxOdXVE1oaZn5WE2p
         sgrkOvMBh76r0YXC0s4HJMVnj0MadCpsjyjyV/S4xvwYIAQVWORh7FqPCltYCb748Dej
         iMO4NF5ytiGU7x1KJpUnlDN3tBLj/CaZFuKdp3KNU7mjcO7ZpjXsdfr/wYcGO6SiUX7f
         AvqFWuyhxUKiag9Ocz0TZ3eDUtoYFnvKq/ocw3RxdVI8jks7yPt8Ceq2fL2/JyAkt4m2
         tkqQ==
X-Forwarded-Encrypted: i=1; AL+hErF9BmDDxyPCvbJgnmWmrWx/ISEPIpZpB+DtfsZekBO+VQ08FB+952vB7guhJeVxVZaq5bqGI6B4H0/wpGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CkmXDJ84rRCPDbks49+lCrcl34tGGtisYEcxMxv/yxiw4HVru
	B+35b6HdpJL1duAe7MTwwgHsKvf2nGwR/0hPkDUs9U644g5ELrPRXJCB
X-Gm-Gg: AZFdTZcDwHpjgJrLtd8gsfNmEdo2Oxmg4l2b/SU3MhcEjkWY05FxDs8xaTilbTXVaFd
	qpU/ivrYw6eHPOtaUCQs+BdvZHCN8k7+xT2Ok4SITO4AOfHjybmPVDrHvIX94tQ6+AV3O7JYnRt
	Ep2Xah2DzpHVicVjEuG2FXsqbd/QGeq+CH+LUHY0J6CF1tU9pODZh8dAiD7j+skeVVjJwVoYfFO
	vganSy4uT/MvrrDgcd7Z7yyFjGiJ8+9w0Zqvyt1itaSYmnn/0z6ONnSEzhrt69SzUl7uaOSjLyM
	EJ/60mhllO1iclpRXHC1ynipCHZvTR/7X6aMcSGfYZNYZJPC8wFqTZKZJHlEE+kACz37AtuNYm7
	mXt2teegstiTp6YkBOvXf88I1bNjq3464VrhwO/yv34xtrY27cDdFwsOIY0OsLsvbRgm4GdIbSU
	sayljeKn9OaPEvofPvuMfwmtNceyqiNSGPoj7g11R+g1+Rx/3HaSYphj5+nzO90SyjwzybhTvzq
	r+zzhY5E7yY7E9SuOcvvMWmQKlkhww5Pi66UFmrDY3POKVrtB5dvDh1MUP44qKwGwr7HgBOJuX1
	PLSosLg9q4wJNLFxCDG1yBxd9J+1dBqHvOs=
X-Received: by 2002:a05:6000:299c:10b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4a6332bcd05mr172893f8f.8.1794935405258;
        Tue, 17 Nov 2026 09:10:05 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:04 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 0/5] wifi: rtw88: fixes around the firmware recovery
Date: Tue, 17 Nov 2026 18:09:58 +0100
Message-ID: <20261117171003.1840491-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Fixes for what a firmware crash test showed on an RTL8822CE, and for
what Luka found in v2. Patches 3 and 5 are new.

Tested on rtw-next on an i.MX8MP board with PROVE_LOCKING,
DEBUG_ATOMIC_SLEEP, DEBUG_LIST and kmemleak, with hostapd. The firmware
crashes were triggered from debugfs on the RTL8822CE:

- patch 1: three crashes with an associated station interface lost
  five reserved pages before and none after; six crashes with an AP
  interface lost three before and none after. With a test build that
  holds the hardware restart for 4 s after the recovery, two hostapd
  update_beacon calls in that window warned "Should not have an empty
  reserved page" with v2 and did not with v3, and a beacon update work
  queued during the reconfiguration downloaded the pages with v3 where
  v2 skipped it (two runs each)
- patch 2: an unbind after the crashes warned "Have pending ack
  frames!" before and did not after. With a test build that drops
  every TX report of the firmware, the unbind of the RTL8822CE warned
  before; after, neither it nor the RTL8822BU did
- patch 3: a test build that leaves the station out of the collection
  during the recovery, as on a failed allocation, skipped its reset with
  v2; v3 has no allocation left to fail. Three crashes with a station
  pulling traffic: the station stayed, no list report
- patch 4: each of three crashes with an associated station gave the
  "sleeping function called from invalid context" report before and
  none did after; the link was back after every crash
- patch 5: with the AP stopped and its interface down in the same 4 s
  window, the flag stayed set and writing fw_crash returned
  -EINPROGRESS with v2; with v3 it was clear and a second crash
  recovered (two runs)

With the five patches, AP, association, power save, firmware crash and
scan tests on the RTL8822CE, RTL8822BU and RTL8821CU on both bands gave
no kernel report, and three crashes with an idle and an associated
station interface gave no kmemleak report.

v3:
- patch 1: no RTW_FLAG_RESTARTING test in the beacon update work; the
  page download and the page location H2C do nothing while no port is
  in use (Luka Gejak)
- patch 3: new, rtw_iterate_stas() cannot skip a station (Luka Gejak)
- patch 5: new, RTW_FLAG_RESTARTING is cleared when the device stops
  (Luka Gejak)
- patches 2 and 4: no change
- rebased on rtw-next

v2:
- patch 1: the beacon update work does nothing while
  RTW_FLAG_RESTARTING is set (Luka Gejak)
- patches 2 and 3: Reviewed-by Luka Gejak, no change
- rebased on rtw-next

v2: https://lore.kernel.org/linux-wireless/20261116072014.1142494-1-mehmet.fide@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261111213239.569224-1-mehmet.fide@gmail.com/

Mehmet Fide (5):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: do not drop stations when collecting them for an
    iteration
  wifi: rtw88: reset the stations outside of RCU on firmware recovery
  wifi: rtw88: clear the restart flag when the device is stopped

 drivers/net/wireless/realtek/rtw88/fw.c       |  6 +++++
 drivers/net/wireless/realtek/rtw88/mac80211.c |  1 +
 drivers/net/wireless/realtek/rtw88/main.c     |  8 +++----
 drivers/net/wireless/realtek/rtw88/main.h     |  1 +
 drivers/net/wireless/realtek/rtw88/tx.c       | 20 ++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h       |  1 +
 drivers/net/wireless/realtek/rtw88/util.c     | 24 +++++--------------
 7 files changed, 34 insertions(+), 27 deletions(-)


base-commit: fb51e39dfaea5b5990e783e53c657534a37987d6
-- 
2.56.0

