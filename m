Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6385221D3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808149; cv=none; b=sk6hQq6DfoYj9TEDBtGI12/3TwewaxnYAMeok1sWWE4K3ETTrf5ta6/pMxH6fqD/LHJjpLOUFg5Gtm+86cWNADAkhv5zqnUwh3Ep2o9PoCwF+8DNSIRgkQMMVSB/mPvuZqbf657uHNYequ0HUGCRkvc9QksJi0wzGuegyNXKyUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808149; c=relaxed/simple;
	bh=t4Yjm2DFocmwKXQlXnFjkqXGxphq5+vhcIQY98+Bhy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSX118l8A1XoNyU90LLSoCUcXpEFGpT/xUBUynl1GwqAQWj9ZdQdVGlgDIcY+dUQJXmq42AwYesVI6hrgGwPUjfQ5iYxvtzTKIuKgy1ckfskhIQFaRkJWAKWiIXdN/89GG8iT2duNbd1gVn3qInwgu2Y4QkAhFrMvjP9FzT9OHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrF5MKb4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrF5MKb4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso34286625e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808146; x=1789412946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BtYvbGadikfpl85inOhvk04RG8y78PVhmpNVJAilv8=;
        b=QrF5MKb4IheRkOHTPilCSZisUMIqZNZEkXoZy5+z+gYiIVF9FwRefowkeibtcTpUk3
         F1YqAdwXNdob2C0IKTd06SE2JVN3eH4F0ZIKxpiZPC+H3CRbBjP4G0WAFlChOqKE89rF
         wKtzShBqa4pGrtzl7WUdBNidZli6lcBAUpqbJBt2sGRYftKWqyhIhbGsnvrVDfMDnyt2
         cF8EQXT+A2d2VGHz5a/nJze/R6pxeB5F3dky0wPySpSP4uiOyvXd6a41HhVc9ApeQg8X
         92sKgiKayipMVJruoHqcHFytxDw2O+RbX8zSNn7Go0ZHuApCEY2KKOk4tjCtI5RIfH+2
         PRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808146; x=1789412946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6BtYvbGadikfpl85inOhvk04RG8y78PVhmpNVJAilv8=;
        b=Hm0gcVxZtuRYCM+ShL3XhNAkxsSFx4+UmS6KQvXQcZHsV8k8xXJLGd9mjO3yLIa6/s
         pm16Ikd4CLOTB9svTx/CmBa24sw5awPzY8CSbutVgfUNerjHb5mqRzaZO8TvbmbE3pZG
         xi2TwogEwNXQEGfytTGWbqArWOU6STQE7jqcSVDmkpNyb/qwgC6Hlf6yUSpJKxmg71Uv
         SLTGkl7x2bpEBgPwK3aFKJ+O/pjXPYw2Vf1WkXKf4I0Vbx4I9Ktn1JvT0YmOhjytvPja
         C+TfC3GMxFz6QkpVnfeDrDLv/a9DZFJrd9GtY0cunYX3NFGD8mRkaxzSfG1/DFwb7ylB
         pvZA==
X-Forwarded-Encrypted: i=1; AKwUvBwv8lx4sCtJI96ouu33t7nOsi2/VJo7H5kXInwmFT77i0fswuX7p6RJeAlYsCUMNkFcqOjNyN4JY6NnsHM=@vger.kernel.org
X-Gm-Message-State: AFuF++m5YBl3685UbxEjr2s5b9Yk/VrAijCC1NkWJmj8Ouo2OXfMErXc
	+JMphVwhsIb8V/Sh/5ENVFGl7RfhwyBmTBYGf2t8TI3cc5Dz98YcZ2cC
X-Gm-Gg: AYBFou0jLtF2xhSMtMSxL1Gp+Ny2BMa+63N0Skj1TEsu5zKAZoPSke291F2W7l2cR/H
	xDC61UuTBcSllJrW+3wvUQ/Z0SC+oV1ZWTyNPkAeEXvIZRejqu8GanNADsrdiSWcEhxiFjDYhNE
	Y4RzSFQd9uYjYfhEUETpvTZQRFAohvPlY9eR0zEr3M2GYEvaoS5ofk+2rOh7TdSLB2cxM4Ne1KS
	f2qGjFWv6ixdkVQW7JZFUdgpWmYW6hVLO0SYyn5t/ETgTWfl6tJDwgklQ0sGmPSWLATwj13hm6w
	OWP85Tp4smIxBBax/HpVpqGexaIK1Nd5UmanK40AKS0ux28obs210nqTFErA/hw4T7GrzvSR6tc
	KnzVlUXSwEk6vxyDG1NXp16t8g9lRI5JqPDamAnN+xE2Zj6gOgszFFG3SD2JEpL6mWAW2rIuSft
	YXJERYXrqoycr26Mrzu1Z4gfU/r8lOxWE74IIZkv64gyXICqCiT/Uzd0vIyVf38ljtYg==
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr223565895e9.10.1788808145861;
        Mon, 07 Sep 2026 12:09:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm33365544f8f.33.2026.09.07.12.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:09:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 3/3] wifi: rtw88: widen the ATIM window while an AP interface is up
Date: Mon,  7 Sep 2026 21:09:01 +0200
Message-ID: <20260907190901.1056945-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907190901.1056945-1-mehmet.fide@gmail.com>
References: <20260907190901.1056945-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The frames held for dozing stations go out right after the DTIM beacon
and only for the duration of the ATIM window. The chips come up with a
2 TU window (the two that program it set 0x2 at init), which drains
about three frames per DTIM; the vendor driver sets 0xa or 0xc in AP
mode instead. With the 2 TU window the measured page pool exhaustion
takes ~100 s of ordinary multicast chatter; at 0x4 the same storm
already drains, so 0xa leaves comfortable headroom.

Program 0xa when an AP interface starts and put the default back when
it stops, since most chips never initialize the register themselves.
The bound and the filter of the previous patches still apply: the
window adds drain capacity, the budget protects the pool when that is
not enough, the filter keeps chatter off the beacon-paced path.

Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
- new patch, REG_ATIMWND 0xa in AP mode as in the vendor driver, back to
  the 0x2 default on stop_ap since most chips never program it (Ping-Ke)

 drivers/net/wireless/realtek/rtw88/mac80211.c | 2 ++
 drivers/net/wireless/realtek/rtw88/reg.h      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 0b622d7663b6..2a9b09fa76e7 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -474,6 +474,7 @@ static int rtw_ops_start_ap(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 	rtw_write32_set(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
+	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_AP);
 	rtwdev->ap_active = true;
 	rtw_store_op_chan(rtwdev, true);
 	chip->ops->phy_calibration(rtwdev);
@@ -490,6 +491,7 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
+	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
 	rtwdev->ap_active = false;
 	if (!rtw_core_check_sta_active(rtwdev))
 		rtw_clear_op_chan(rtwdev);
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index 08e9494977e0..0b9ba6f37680 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -483,6 +483,8 @@
 #define REG_DRVERLYINT		0x0558
 #define REG_BCNDMATIM		0x0559
 #define REG_ATIMWND		0x055A
+#define ATIMWND_DEFAULT		0x2
+#define ATIMWND_AP		0xa
 #define REG_USTIME_TSF		0x055C
 #define REG_BCN_MAX_ERR		0x055D
 #define REG_RXTSF_OFFSET_CCK	0x055E
-- 
2.55.0

