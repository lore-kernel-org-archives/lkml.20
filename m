Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B32D386559
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789241997; cv=none; b=NCBvLYC3zq/Qf5zTNbaEi8xGduvSiThLxeh3FxqFhgsZpnvx3MfLdlxJZXZ2FnilM2ep6XZ9xlE8ps7dBb9M60JEA0Z3G2qPmv7UrKG2XXVndwgUpxq/g3cqdvCzKz63oSjDywBi3xSAmZAhsF8wlEVGSE1LG45u1yuAbeypd9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789241997; c=relaxed/simple;
	bh=AdChyE9QQdLXS/FICQDcwm0+ypo31/BoXuJxJr08H+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wl5czG8lTSnp38aGv6l0/kY1GLfug31saqbMCcRAh4z9pLcNimSonpXI2uVZUBWkATB2UMcvEQYRDJKekW8KMVEGLVxeNrpVf0ezC9xTdIN7wKdNczHzEI+kswd6B95zso7PVbEU7Xjy/UkU3QrFBbQNr0kS4v9cZCrW+lg2Nfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2TuRyJh; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2TuRyJh"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so829257e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789241993; x=1789846793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCThjcDAlbKsFQN80hFuu4ztvw1PnueEZBsdmTCibKA=;
        b=f2TuRyJhpQCecB1uRmMsGLLTZzcGZCA/5ETExYpWQ+lXO+CJXJB4piPf3KRSjDW2Hy
         Fa0YpX5sClhDK5IoISKUCMj5l1volVO8YBRU5xHMiCm5V5KPQgl4pcLNvdPgznbc1lE5
         UJLW0F1EMiCVzTwC5MKnXE6CefVK9gj01vv/OTjt9tVppR6dZZWfk4bQlU6UASr0M2bc
         +PZ9SJ/6uBFGOeF0ANT9sIOH0QVM/AM6g55pVrE4q+n5Pwr1y40O74exmdCcpskGdJBa
         iMq7atGNtuqqCc3AnhmSR0WgP2EEsVienigfWJYobef9Og5qKpuiP9jhGv8ec6AyaxHC
         Z6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789241993; x=1789846793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCThjcDAlbKsFQN80hFuu4ztvw1PnueEZBsdmTCibKA=;
        b=WWbk+woVp856yY4KpUFWRLHkECz9cipJlx+nCEyBJRhDVjLdGjNnV145J7oEzOtG5q
         shiQ8tVjJ0wghl+zZ6kp20PAw40zBSPNWs9KR28qSj1cT3L3UTZbpfAILXpu72OhsMl6
         kshvF1jiK+Tuq7oX6AsBkGQhMeT2qCPIPPieqJ70Etv4j/nnTV2yblZD3IZVfWbUGMz3
         Qk3TqHHSP24Ayj6psMv0qwrYoLKN5mvGL80R3KKtRnXv0QkYMNdQhn8nEv/uH9rLFIf3
         oNwnd96Fh6tvFZLygJVmEeFmD5VWXyCRxmspAnCdVjHmSJ+tkjh7mGwut36jJvJsBqEn
         dcmA==
X-Forwarded-Encrypted: i=1; AKwUvBzTgnbC+kO8Z1KAikcle9BM8h/CvVa2lU0Swfr019qmp8kKcEuXNMR1yVnojbIXVCi52HJ07cebIGWatsE=@vger.kernel.org
X-Gm-Message-State: AFuF++m8L2/hhkxSLi13yriLcsI9S9SZKNJxIxBBuwyQObVpV1IP9mfR
	6TUevmYtW7Jmnu8JGVMD+UfeG3S1FplCJf6W5Xpl9ywUN0FcuDRYA0zImtyaxkeSB9GVdVeG
X-Gm-Gg: AYBFou2bxOo/bh65qf6sCUy4fqqiASAhKQOAfBKawSiebEUHu+qNdirDzT4/yiMOQ6X
	Dcnxu8pxkQNjeuQ4avn9UJTXcEHqTT/ZP5GV0oW5Iv2RD2LqqswsfYlZoqOJq43IDXJwG/9Sfde
	jBUJPc+QJfbdOSEqXlMv1/HoBMQW+P65mobR+WOZ8M5ieZA2q08ae0oG6cM/SMauYxP0tUbwVP6
	XZKqLTuSKpjYdySOU+f6YOXpW4GbR2eUtagehZoEXXDFN2micEkIWhdIP5Szp0zfXL4qBMYOWv0
	feNZAov9rPyo1FMiwyYOLmmZWVeq+qHqo5AXsf/SXZ+VJe910SX9+vlH6G75NFHfNHkxwVeMG1F
	woPSZbitAfGq5uuw0rf6eDk3H5gP1C15lS0QfTGKV3eIu7d9KJSYiH/6+wi797Jezv3cdz6/gZu
	q+UJ356wR9SWKi+tIxbpXYNnQdXyvEOr3HoYtmhX/SSEDfVuMqmWXSKVRkrYlWBjQMcJMkvsYvb
	Z1J4U84I8GjaKzmjqSIYaohy8o=
X-Received: by 2002:a05:6512:3a8e:b0:5b4:ac1b:89bc with SMTP id 2adb3069b0e04-5b8a8ea6ebamr693162e87.24.1789241992711;
        Sat, 12 Sep 2026 12:39:52 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.65])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aa12sm1392668e87.74.2026.09.12.12.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:39:51 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: rtw89: WOW_CPUIO_RX_CTRL is never answered on RTL8851B
Date: Sat, 12 Sep 2026 22:39:36 +0300
Message-ID: <20260912193939.5565-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RTL8851BE every suspend/resume cycle with WoWLAN enabled spends about
20 seconds in firmware timeouts:

  rtw89_8851be 0000:02:00.0: c2h reg timeout          (x3)
  rtw89_8851be 0000:02:00.0: Unknown wakeup reason 0
  rtw89_8851be 0000:02:00.0: c2h reg timeout          (x3)

With WoWLAN disabled the same suspend/resume path is silent. Both results
are 3 out of 3, using rtcwake so the cycles are identical.

A kretprobe on rtw89_fw_msg_reg() shows all six timeouts are the same
command:

  h2c=10  ret=-110  3355 ms   RTW89_FWCMD_H2CREG_FUNC_WOW_CPUIO_RX_CTRL
  h2c=10  ret=-110  3345 ms
  h2c=10  ret=-110  3344 ms
  h2c=10  ret=-110  3315 ms
  h2c=10  ret=-110  3305 ms
  h2c=10  ret=-110  3307 ms
  h2c=7   ret=0        0 ms   AOAC_RPT_1
  h2c=8   ret=0        1 ms   AOAC_RPT_2
  h2c=5   ret=0        0 ms   SCH_TX_EN
  h2c=5   ret=0        1 ms   SCH_TX_EN

Other commands on the same h2creg channel are answered in 0 to 1 ms, so
the channel itself works. The firmware just never answers this one.

Six calls because rtw89_mac_cpu_io_rx() retries CPU_IO_RX_RETRY_CNT = 3
times and is called once on suspend and once on resume. Its return value
is ignored by rtw89_wow_config_mac_ax(), so WoWLAN setup is not aborted
and the only cost is the delay.

_rtw89_mac_cpu_io_rx() already has a way out:

	if (RTW89_CHK_FW_FEATURE(NO_WOW_CPU_IO_RX, &rtwdev->fw))
		return 0;

but rtw89_fw_feat_list only carries

	__CFG_FW_FEAT(RTL8852A, lt, 0, 13, 37, 0, NO_WOW_CPU_IO_RX),
	__CFG_FW_FEAT(RTL8852B, lt, 0, 29, 30, 0, NO_WOW_CPU_IO_RX),

and nothing for RTL8851B.

Should RTL8851B get an entry, and with what version boundary? The newest
firmware published for this chip in linux-firmware is 0.29.41.5, and it
does not answer the command either, so from here I cannot tell whether
support is planned for a later version. I am happy to send and test a
patch once I know which version to use.

One unrelated note from the same trace: "Unknown wakeup reason 0" is not
a failed AoAC read. AOAC_RPT_1 and AOAC_RPT_2 both succeed, and
rtw89_wow_show_wakeup_reason() reads the reason straight from
wow_reason_reg, which holds 0 because the card was not the wake source
here, the RTC alarm was. The switch has no case for that and falls
through to the warning.

Tested on:
  RTL8851BE [10ec:b851], subsystem AzureWave [1a3b:6111]
  wireless-next 13e51269b6, built with KASAN, UBSAN, PROVE_LOCKING and
  DEBUG_OBJECTS; none of them fire during these cycles
  firmware 0.29.41.3 (65cefb31), also reproduced with 0.29.41.5
