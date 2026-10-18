Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A749AA21
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327684; cv=none; b=Raocps/psShqM25msB4oxLE0k3P6l6Z1FRSroR8iUPSlvNIDfO3INhByi1I1bhVE821wLpTDDxTOaq+1UqyF2cpup/dHAqGk50AOHeqY6w1bEgZzyAe5+dsakWDWQvbDoDfa3ua3ovAuh0+YbkXix4s20rG02+NCB8i/FQef5vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327684; c=relaxed/simple;
	bh=ffuWOOzNvVkfnwWk6AFrnQVEF35/KGyRLJ4wSYHI0d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qnkgGjJ5jXWYFi5hrDu25wL2GmGIR1WPnbuFdQeUfWs6IL6t44GL+SDjrDHGpQRQmtXdXbPRqKsRBl0psHE2jxxwh3j8hn6YhSh6wlgfPBFUq4986dB6Gb4LzZa2sAN4/uPqlEJSCtbgD/EJbFZMw9BpYo1sWAJ8UBjJfZt03eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flwetaym; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flwetaym"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so790378a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327680; x=1792932480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9DXWZWGt3/ehx4k1EsItpkNjOPNH8RuGkAm3vDqpKI=;
        b=flwetaymbf3AxzugGCOov9VNEhCs/xbe2Nw7PWqTroVJGqVe24kPWFo99X8LFWl/UM
         CUMTc5wjLH8aLw6I5K+G0+TtO+dkQQyJbf5SbvBF1XXV46zQvGDI9pILwrA/BTx6nX0E
         F6GSSsb5l8ZPVUcktlUieolqukgkpVgMrJZMC4HYG3OEwRtb2DMX5o5PoCxkAnDwV9g1
         Qbjz9OlVfP5ASUJRYwSN/BSc2KX2yqcurikplivJK+P5BDaiXvIZJRHT/NRvJcVs39gj
         Nd+8AKj70zj8P4INIp+FxXOHfbjJXcPoOPV/y30fJEYmyRIoqLTAW2pZ4Ps/e8hpjAhT
         86CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327680; x=1792932480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9DXWZWGt3/ehx4k1EsItpkNjOPNH8RuGkAm3vDqpKI=;
        b=KdOnuVcHHBD8iem1N5BeM6m1oTmME959SmrSmhtM+y2Tcx8YW5mERzrQV+2PiQyiVL
         xQcVsECFmS4FM51ndXHOs9pV6epXquMcNPc7Eoz+4adFqC0hJez3HwJjpvcI2iqAvuSo
         lzv7dHVGsblux1fSibT2GTqsn3A6wJTn8MjasGGUKfMaz4peUY2ZMSOxddX9BFXR8g2S
         jUo9sz6gf89GWyusdlnGey7UzD9QZEpSzsvdNIGjezC8vAUyTXSsUlFgCc4iPPIe0mSf
         24icSs3xS5espzqJub/DNqN9mscC6xpvC/hcdDYJzHCOqvcLPfZJ6UXWaZ3deZIxKl/A
         2Nhg==
X-Forwarded-Encrypted: i=1; AKwUvBxZpGMhqGH3BsI1I7ZhDqJSAQV+wOzcsffu/Dne0YyfL7LYcbIuWaBBxusvffT+q94MLTeV5jdKZVjA28o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO49SIhYA4rIPjuiF8DWSCNhczWS+EzKWKUF9APA598RjL/Toa
	VjuPkp8P7hHDDlWAWssVXBKwPZcVc0VGPSmLZ+xjJ3vEsRQcqruq46aU
X-Gm-Gg: AYBFou0q9pqNt8BRiU2M9Pwi+Y4TuMqqIjLEkTAFJDUp5EmRO879bu25VLDIM67uwF7
	NgW1YCzigEvgrO7wZhnZNW7BtEYQQR/dUyb/kVm2oOM8i5JoTQsqiEayCbHmcioV5JlZVek69lX
	89UqRyzTmRR93W2zEsWGOXaSr1vOlbIHWW1v5wlMNarOd4dxLSv8UFISw3WNZqRcjT4yi4OFf35
	zd7Nh8sjhUax5OLqXHL4An7z3N9yHyqgqlOXQuEww5Ea8nE9Meq2Ufk4UCRhaE/YibAqMqbmGtL
	qvpmruAFA8CcBhp7B77WqTKPZR/ebbKDqLNtkj5UArOBb3YDWnUEhDaFg6yxw5jxmW6lALzl0FA
	sM/IiBMXIp8/FoGpTiNlm0xXahheSRlMBYerwzhTKZxla0j9Wm3RSD4Lr4f8DaSHUUhPv4Kbdqy
	OPQRWoGjAW53+jVnt0ZkfhCZU7SZoY22Aj+6jTT0xyljAGUSHy2jFkYPi7cr0vGVeVEfIdVgq+M
	GVV4Y/QMe5Z2AHYvuTws2Y=
X-Received: by 2002:a05:6a21:6f89:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-3e225fe0385mr4135819637.25.1792327680056;
        Sun, 18 Oct 2026 05:48:00 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm2804669a12.20.2026.10.18.05.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:47:59 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v3 0/6] HID: wacom: guard against NULL input devices on successful probe
Date: Sun, 18 Oct 2026 21:47:49 +0900
Message-ID: <20261018124755.850888-1-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
the corresponding input pointer is set to NULL but probe still succeeds.
Subsequent irq handlers dereference those pointers unconditionally,
causing NULL-pointer dereferences reachable from a spoofed HID device.

This series adds per-function NULL guards across all affected handlers.

Changes in v3:
  - wacom_dtus_irq(): DTUSX is pen-only (no pad), so the pad_input
    requirement now has a type != DTUSX exception, matching the existing
    GRAPHIRE exception in wacom_graphire_irq(). Also guards the DTUSPAD
    branch for spoofed reports (sashiko-bot).
  - New patch 6: guards wacom_24hdt_irq() (also covers WACOM_27QHDT),
    wacom_intuos_pro2_bt_touch(), and wacom_bamboo_pad_touch_event(),
    which were identified as unguarded during review (sashiko-bot).

Changes in v2:
  - Restructured per Jason Gerecke's review: replaced per-branch checks
    with per-function checks for dtus_irq, graphire_irq, and the Bamboo
    handlers — simpler and matches what each function actually requires.
  - wacom_intuos_pad() now returns 1 (not 0) when pad_input is NULL, so
    the report is consumed and does not fall through to
    wacom_intuos_inout() which would misparse a pad packet as a pen
    event (sashiko-bot).
  - wacom_intuos_bt_irq() now guards both pen_input and pad_input, since
    INTUOS4WL always has both on a single interface.
  - Added dev_warn_once at every guard (Jason).
  - Dropped the cp2112 patch (Benjamin prefers Dmitry's series).

Tested with uhid across 27 Wacom device types (spoofed bus):
                   unpatched  patched
  KASAN crashes          17        0
  probe failures          0        0
  hidraw nodes           26       26
  input registrations    25       25

Jinmo Yang (6):
  HID: wacom: check the input device in the shared report helpers
  HID: wacom: check the input devices in the legacy irq handlers
  HID: wacom: add NULL pad_input guard to wacom_intuos_pad()
  HID: wacom: add NULL input guards to wacom_intuos_bt_irq()
  HID: wacom: add NULL input guards to Bamboo touch/button handlers
  HID: wacom: add NULL touch_input guards to remaining touch handlers

 drivers/hid/wacom_wac.c | 111 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 108 insertions(+), 3 deletions(-)


base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.53.0

