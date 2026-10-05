Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5254A68B6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210933; cv=none; b=EMY+tII8H2tFj75+hAP7veUxdFUP9ALjNlYtwxXxaMS93LiQk9W/aOKOg0M6UJhRu3FXYVIMmA4Qjoue72P3oeRc1zMV7hJoSLMBD/kjKiMiz3nMAskipdbMPXxaEdv5TEDO+PHm8J+heJP35bkk4uNg6cUkgixoNSB3e1L58ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210933; c=relaxed/simple;
	bh=7BzsIt0W0zlX4zWFBkLaGVeP2JETAjfMyZaGXrAqybM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VU8gpKTHf2STPSij0Js7Kqcl4+TdTdR12JIaB94dHGA7MIuLAKJsT1UBvutfEKQFvLT8+tfz9zxZmi2vUKNxD6qMNYfjo/E4/RvejTtm6FyN62xXd0LWuT35xqJogtH9+YpK6/qYXfS+kSJBNxPGfhMkOfESfMJLuxXA7uQ1fLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdvvpnbA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdvvpnbA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso9470635e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791210925; x=1791815725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d80qMXtt2qgyjUsH7NBGqXnx95+rJDKx3BYmmyNTE38=;
        b=EdvvpnbAqEkwkC28r/KxroXjYS05/XUMrpXV/5lbe00pAykDinB5QRsdC7RZl1z9U4
         QqakbelMxbQ8m+lmv+1odbB04qiCG+WJdSvDSQXjoDB5VIateAfkPR+284LjViQnt/s1
         uC0Bkwi/WrQgkBTKB2tbEXcq0fITbCdOC81sIEHu3AYrSZiKabhmsjYYR6wDFhOenJO2
         69KFEW/bVjKq+ipTQN5nCdZaSPy8mRqT2BlYTomP7VDpW1kDZLmXi1lgJAU+GxaNT3iL
         tvwsqWx+wtwxKFJLZoo39WemJXUpRnnxaTwnEQ7fnm94QfM6NS0ByNrrs/vhLIgfi+It
         yLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210925; x=1791815725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d80qMXtt2qgyjUsH7NBGqXnx95+rJDKx3BYmmyNTE38=;
        b=aPn5+2WDqc1aS8kGMsDtOEGDWfv3F1MSVoV7Xgd+xFUwaqpneG0NQv+l2lTAXfzP7p
         +QH0M181bREPZu4wIzzONMty2S07ZG9amg7ZpYFTuqhdyBLe4odX0jCFnrWxOW9XnXUn
         avVuCFwI2/a7oGVkN1sGdXWknOG26+YHwjF3PYsd/KtDDLvZHjJVk0rfym79u0gcLEPM
         ud/CMjyra71Jbly/qybZrPsdLApwhHvnYtajdZ4nXH5XngfRFB0orcpMA8tiui/YqsDp
         SmzUsjpI7cRNCr5VYJY7ARiB4wAD1RFiyeBLaPHJ5xl/PGcSr8r+fGeucwsCMvZm2aF9
         lF/w==
X-Forwarded-Encrypted: i=1; AKwUvBxjytadhsdTyLr5IGjv/KtRqm6lii3a2U5JOmx98AccO+La64OM5ijLiePXU+tREQpANNwnpavPgpzB2WU=@vger.kernel.org
X-Gm-Message-State: AFuF++knjZLoQCyqgp/EybTwKvKLilf/xZZHBGcD/IyLHLFXVfDS96Ao
	lHXkVk/iAuFx6Eexej5+zwh+E2/0J9RP/cT2tclor7tTSo38ZCK+u7nwfZ7BlQ==
X-Gm-Gg: AYBFou2nRNg+f6AFpi829IfTHK+89McpVkCjgs7nCIq35dzBTyaitlVlyDxkCZjbZj1
	mKqoeYMvGrRS8uuuZW17BosNFcRc2nNA4e6MiOW3WxQdPLQtlKBoejPoVSpyQEz9P9pTYW/X8u9
	SO3GMGM3ODWDlG+IrKZPHNGzpf46AamG6fUzZtIV1GT12CYCTp3RWqBnR5SnSKTQd5RMYgctAPT
	O0EEnB9mR2qRvV5RS8YynpjUCcr5GKD/JzrI6VkNu2uqF2QEGsh0TLtNyLx+kyAGVDGlfsyAhQK
	4LrL+Czd9spNk+lsTHhRmwabWhFDzwaXnHcqtUaQxQXm7ahfQpK62sDiGrgcU6Bh3Au6KipTcb/
	0iPfUUoQDKKQ0gUlhnFF5XdyPtHJgxRpn97IeZJSUTqmCgwdOMFtUsUAX27rgYrXR0bQgH80HQG
	mKHW7KYFBMz0H/u4+G3qo18q7+GQhxkDxuVLWbD14AvFMI+Aw4PtIjdJOHpazXHQnQzz7NUl0Py
	jR0
X-Received: by 2002:a05:600c:154b:b0:4a1:7108:c2b6 with SMTP id 5b1f17b1804b1-4a17108c4camr65216825e9.31.1791210925190;
        Mon, 05 Oct 2026 07:35:25 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm396901835e9.8.2026.10.05.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:35:24 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 0/2] wifi: rtw88: channel switch in AP mode
Date: Mon,  5 Oct 2026 16:35:21 +0200
Message-ID: <20261005143523.130287-1-mehmet.fide@gmail.com>
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

