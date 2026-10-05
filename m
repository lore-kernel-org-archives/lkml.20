Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A3B492E32
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210809; cv=none; b=F4duHXdRAsj19Z+H9+kouU6xemtqwgUpkUlO/Azug4410mvYKUC+sklW63M8weQsk+TVvx4JgLH9PxOs8A6ucNs6RYCyEu681b9CsVxJ1GO4pDQUFtgXSgUG7ZPURk0zntBuTDO1BPy56FT0df2FMWM+yJkLKzDvRjKks1EF7kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210809; c=relaxed/simple;
	bh=7BzsIt0W0zlX4zWFBkLaGVeP2JETAjfMyZaGXrAqybM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRzxJtSFRndRVUhyZR8TUt2kc4OWFlVvCgEhu7JysEqt3xaF8EXRw+Qd2jBL5lvV7ChEPyGGHjRvebhO7C4i4wvJvFrWQ54/52crVshT4ryk0SaDIwocpYPOB7SrQIn2UklmAiKWVhQUa08FwTJRBZhLfOGp5SO7WxzLQAY/CbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5K8hurz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5K8hurz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so12360905e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791210796; x=1791815596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d80qMXtt2qgyjUsH7NBGqXnx95+rJDKx3BYmmyNTE38=;
        b=s5K8hurzN0yZVMkyiJzg4O6s4KI+1QIWDfSQJJ8XHZyHC1D2dkw/XLLkbeHVC7OaS0
         jPr7bLHbp5nbSyctxehRoeVbeaIa1GmrtYuS5i7T/eJ7a/WzeU906eB/GnbdaPfVBeCK
         UtSwoUkkb+23CKitlsTIzyAdoER5+ADlCRgv/BX1zjPzQh+9oBEnjlTNIw2hMvLqxc6y
         eBYoW6zhMN5Sd4TH4acullMLLndHfOnrpnWUEN8ICeYBbSd2XmUstREa5STP4c8TPIrT
         qHSIlXJ6uh608gIW92o93VyrKppiLymfhtYLG3t3IYUJ8Rd/LJivUgkTmi0BH/ntnyV/
         AHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210796; x=1791815596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d80qMXtt2qgyjUsH7NBGqXnx95+rJDKx3BYmmyNTE38=;
        b=ITrAUF5SMfGDvOl1Fce+bA17JllXwMxooPyknIkiabgLzcCtiVDS58AM/QvjHA7SLA
         FelqDlSzCVZOmEPhZGuZnjim8+g8bDZDRmDtl5x3Rcre7TiOO70SeN5d0DkzRFwTm87w
         HbxeXEjnuw3tbz60oFQC8huDq8nFgsTvtYHeWqfmM0h+jlePi/HICIxWp8TuZMxAHOXt
         Ar+U5x0OV1O6azTrGV94UJVPy+FCPqQTSVF6LpM6aT4PnOZX0rO6LOq14a1QG6Os5Xv/
         Jy4GVMbrTsd9gUKxJ5eIR3Ftvxw+DV92jONB6dXADy9y/AZADhLyz5FMHfe3gIQhuWk5
         h0gA==
X-Forwarded-Encrypted: i=1; AKwUvBys3doYy8Z4dhgu25/JmwhEs+3Wzr1TCoE6gvUjNHRs407zSGHL6PbdghKiWc6NZejrSaLdLJfYqY5cNfI=@vger.kernel.org
X-Gm-Message-State: AFuF++mt2Yljy1otX7IqkFiY8WmWDBoQ6pmzrYE3pUx1yqKT4o0VqrPU
	6+ZWN/eFx8SAemjbneIU6g9Z/Uo+5choRKxocX2IxLECLPTVDG0TS91B
X-Gm-Gg: AYBFou32i/vasuzl0A4FbKQz3T5uaPTfRTu7NR2hSB1EOJj5sgddVrcCuRA27zTMNFE
	yxlF3tsJLZYwUMqvTpligxIUakxbGMDyRQ4Wdza+sqQBYgN8yyY0oAtBXiI9MBJLS/Ja0qYcM3n
	P2z1h3ZG3ZWBczW7lcfGWt/o42XCR4JM5/NXplGh6GEmjCp90STM53me/2bkL9aU8ljyKloJcGx
	xc9BHSMj/lVbjZuD5lX0OZbwKak1/v6y1WTO5WOnmGCNMBd1Wjx4cOmbMvv8rYxSHA07TAgCOjb
	RjIMu1lGJxr+cqfilV/ZS1rajEnFOKdgQHptKLsw7D5GX++oil7kGip38ElHFE7mjvlFL+fTJlv
	ktUawz7SpriPGMw4EfFf3QLYYfGQGfHL3eM0eEJIKoBznM93P1et2FtMgK2slcUptleYVXm+koS
	QjZQXNaamR9obgVlRmOtFGBIv98AHgEhMxcxjQvhGVZNyC4ZxuYZGpvXhNTVTeWt5PXVEbPlnTE
	HpX
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6843:eabb with SMTP id 5b1f17b1804b1-4a16843efe6mr115141955e9.1.1791210795700;
        Mon, 05 Oct 2026 07:33:15 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm363011895e9.2.2026.10.05.07.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:33:15 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 0/2] wifi: rtw88: channel switch in AP mode
Date: Mon,  5 Oct 2026 16:33:11 +0200
Message-ID: <20261005143313.129670-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

An rtw88 AP cannot change its channel: the driver does not announce
channel switch support, so hostapd's CHAN_SWITCH is refused and the
only way is to tear the AP down. The series fixes the beacon download
the reserved page build makes twice, then implements
channel_switch_beacon on top of the firmware's beacon page.

v3:
- 1/2: the beacon out-pointer is initialised in the caller (Luka)
- 2/2: the countdown work lives in the interface, remove_interface
  cancels it unconditionally, the queue wrapper and the comments are
  gone (Ping-Ke)
- 2/2: the TIM update and the PG backup on set_key skip the page
  download while a switch is announced; every beacon fetch advances
  the countdown (Luka)
- 2/2: the commit message names the refused hardware scan (Ping-Ke)
- the hardware scan path ran on an RTL8822CU, whose firmware has scan
  offload: a scan with the AP up keeps the beacon and the station, a
  scan during a countdown is refused

v2:
- 2/2: a hardware scan is refused while a switch is announced
- the rtw89 mention is gone from the cover

Mehmet Fide (2):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode

 drivers/net/wireless/realtek/rtw88/fw.c       | 93 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/fw.h       |  2 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 53 ++++++++++-
 drivers/net/wireless/realtek/rtw88/main.c     |  3 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +
 5 files changed, 138 insertions(+), 15 deletions(-)

-- 
2.55.0

