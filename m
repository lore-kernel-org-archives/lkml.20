Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA63B4756DC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475214; cv=none; b=edQ7AvUY0qwY1pCEkdGoLllhelTA8ldNkEaN2JM2ebagW7QtA5HQag6lgKCn0qJggroXg4x/tyH3sp8Kx0TsXkmJ/bqjiiO9jlJWkmH+UXtauIDxwiW3dWaloxtEpyPPnBOO+4KL1cCzQOEmVHU9wXILJdWbryXHxYQYKH3Jr8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475214; c=relaxed/simple;
	bh=xpmNOMEFZ79Zl34tT053pt+ZMJVypP0OCV382hkhG+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDXZMg8l3O3lUPup1oMmOXJ2wJYouahSDZuhc86CIQ6UX+q1skc8CnM39OIhbvwTcQF+/+yPp2UEta+bYviSGsdHCmeNr+KlqBVKAHp8/tP7tAIBHjqKMR8MJUOQgUfD0M6aOxIaJOe67jA8RghXMRBghGlxLB8Uy28U/e9pHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTc3sQ7w; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTc3sQ7w"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a306a4f735so26268851fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475211; x=1790080011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6k2WCPX2Lro+tylch1akShaYbgtzv4QoGFTVB6XS47g=;
        b=FTc3sQ7wO0uJ9NIQo5nNP6Rl1r/hwqg6LlNn1wre4Vt1kfJ0UPkteahV9h/y2BUJss
         K+Qm+mmHwtzAWAMdierL50qlC1S2gDLrl7LWSrIoR4Q+oNPlk8CO4m0y4oGxJUyAmzvj
         5LX/I50SeyeAcqOErl638QI9HCCoRGSS10/hcFZy4gXRBBLL8bPzzRCwnpbmIw161cSb
         BpF3JgKA6/iuLOnrzxWPT4pPQuKl2rq8UuOebQdHAyd5PVo98obnU7ywYFW3epuCOd09
         gClMuM/rsEdAutstghDMGyKzm65uye/5yvefWgrjPiBZEuXR6Q2fCH5gHopjrYMo59Ut
         F7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475211; x=1790080011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6k2WCPX2Lro+tylch1akShaYbgtzv4QoGFTVB6XS47g=;
        b=iAhYIP0cQDpAzWZ1gTGbh/N3HHIp4Hl/4pYe3G1uWKBTUurkTv7w0EakxgrP6/maBJ
         /ARanzHX1MBED7EVilWVLAjmMkPr971HTboyDkwHOe3HIv9TGpqCS17m+kQ8QMFAaw16
         1iMBvxXW/qnbpP6eFwVcOzU1eHxTsM2y0IUtq4BlZAJmO+8CSTivuB+YAUH2I4we1ICx
         fwnLAnLX4lPtaU+oEyIcuZvHRFU/Ikq//Utw+oNi+Rmq+Z9JczsJzou5jo7/JaOfyHhl
         5rAhtFDpzRdhqLRkaNYQs2m/1CXfFEf6NSYfg76sdHLOtYIlYCNuzLEkrkVCx9lT4Haa
         93Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxLiTAft87kBt6NFKw1+wR+zvVMJtU8kn9Xz/gjaT0G6UQe/dVqftzVJp1sqbrkjiz0eoqP47Ti+AUpIR4=@vger.kernel.org
X-Gm-Message-State: AFuF++lCiD9lXMUOgshsGKV6NTT5VjkTj+pA3GLY2sSB9rRXCm9IG4qQ
	FS3rU2XnEiXDxmN7nzYrBoSSXeYe9U5svbpQzeOiRDroYmPqHwAbCbp1
X-Gm-Gg: AYBFou0TR7H2sHuFCXcVC02PD0WYnlteig+vx195xC5wY32XSa+Fm+jBmtmcJwUnbdR
	+yowdwsQDwVq1WN2WKs6fgzxxwqf+0dNXbqW6QwulAHu8E+3eeJhN0XDR53okdWVNTaM6jdN0kC
	QSCIzGw8gCOROgVtWQO7se5Jazs5JAMhspZz3x+DsbdjisXnffFdTJ352iVcsq9XpOz2NO5BzQk
	tSnguqGgeiIALtxUkFc6zAvX9VbsuvQ4AU5NQUxNfHEnTcit1hfdTG4Hxsm0rUspFATsatcRLr2
	89GcftnTl5IAG0MKfsY4EKvlwjqmDA++cqY3SOQwIL67+i2S3eCw9rzB6XhsBCZki6yECTabY07
	0Du2ousdJXo9/D7on865oc2dbrwdC7Tn6r1enEizWxRVoUtGhIvZ/EbhX6Jvcuyxpf4YbGNJ0fz
	qeVZhIpk7gbCehSzZ4HMb1+fTaUq0GDuAR4XQEmHOIa3Sto0KCYwdXu9VZKtpn/D5rwQZyM3R8q
	VI7NxyVUjHMILoZ
X-Received: by 2002:a2e:be9c:0:b0:3a5:a139:526e with SMTP id 38308e7fff4ca-3a5c897d9c2mr11521781fa.20.1789475210365;
        Tue, 15 Sep 2026 05:26:50 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04600a2sm3235840e87.36.2026.09.15.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:26:49 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: rtw89: BT connect state differs between scoreboard and bt_info on RTL8851B
Date: Tue, 15 Sep 2026 15:26:22 +0300
Message-ID: <20260915122625.6341-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RTL8851B with an A2DP sink connected and playing, btc_info shows
bt->link_info.status.map.connect flipping between Y and N, while the
scoreboard value stays the same:

  reason                connect   action     BT0->WL
  NTFY_RADIO_STATE      N         WL_OFF     0x40000013
  UPDATE_BT_INFO        Y         FREERUN    0x40000013
  UPDATE_BT_INFO        Y         FREERUN    0x40000013
  NTFY_RADIO_STATE      N         WL_OFF     0x40000013

BTC_BSCB_BT_CONNECT, BIT(16), is never set in BT0->WL, while the bt_info
mailbox reports the device as connected:

  [bt_info] : raw_data[49 00 d0 00 04 00]
              raw_info[2] = 0x49: connect=1, acl_busy=1, a2dp=1
              raw_info[6] = 0x04: a2dp_active=1

The field is written from both paths, _update_bt_info() and the
scoreboard read in _update_bt_scbd(), so it ends up holding whichever
event arrived last.

Is the scoreboard connect bit expected to be set by BT firmware here, or
is the mailbox the authoritative source and the scoreboard write
intentional?

WL_FW 0.29.41.3, BT_FW 0xf8ad230(patch), Coex 9.24.1, kernel 7.3.0-rc1.
