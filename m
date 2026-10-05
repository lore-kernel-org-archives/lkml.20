Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857232D2486
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172760; cv=none; b=H/7sYo6qIUONI9CKyK6fFcwotzBWHRJ1M0QYYU4tv++MKJLyEe44O0NTuG1gZVEgR/GVZSRwH2o4SGPAO3K0kgld+MyJ/iM65McCnkTxi/MW5LkYEaOvfHrwo4bCeFbR7oGvktnj8yLeYel9nwid/Rom3grD+YnbV2TdHAjX0B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172760; c=relaxed/simple;
	bh=/YL/NDw4Vut9GC0llIGjtY5kgFOw0zHyjbzHjLKiEeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQgqBLrRqjT66EDTshdqk8ny2Q+wkjffJYTSnDgkD7cUu4HvQjXW3D+0J9z59+GKcypLU8jF9HnXeMom3Eaclsot/UTDWhhpyF59HMSqH5XFCNYlcNgwjTdx0sNn4y+6En/C9o23REtQXFYMa4PpffehYYO5cb3Iu1TCbKDZfGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVDLRo6V; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVDLRo6V"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso215533b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791172759; x=1791777559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqPHoZukMon/XfTDSqXj38S4m3E3GhiGtLb2lk8wRjE=;
        b=dVDLRo6VDTrY6K5YWpPtEOquxb0BhZTnchMH9baziq6IOi9jRpAeTfJqUVpigTMWON
         +qjXKWemfNh8AyIETD9G/J6gawZI9o+Gw57Bfi4tlXgQ5rfjTWC6lVSUhQKuvoU1Mnax
         05Qm9KGnz5Qq7R1nuZh3D4W7Pac+qm6BaRInv8Wxrbe2SBB/o9cW9j9+ZXq9hFbhql9b
         Gfop0FlRn+WPcmij1l7LHqNvW6n6sR57S5PIzNDNfOlRMJrwhitRphEgihLLEviq6GmI
         LIU3jxDrI4kibZf4q6PtlZVwaL7njQ9IXdjghetAdLL9P0tF2NFr9hpTMWnkE2C+VxhK
         KLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172759; x=1791777559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqPHoZukMon/XfTDSqXj38S4m3E3GhiGtLb2lk8wRjE=;
        b=kStpcxFsZw8iWqQXCkfwz0MATR4a4sEJpT8wi0UE2RhGJ6fMMU1XmMM9GPXLk+Xb+2
         Yfe30chlUeThR4PlTiygxbsiCGPEr21SNfe94eH36H3L7JgagYcM9yN1+GJ3SbjszYs5
         XTelErBxfHvgf2mlKX0vO5JvRKGsH6IrXkdfSkZLzbNbF85Uvbr2AmSIh+V4SA9EkDgv
         85HBVknvI0bmO1K6Toq3IUkYIZwPXgBL0TO/pAkM0kZ9dGlMAVYFfKUi3G8gxLFcuKGj
         NdhlATnSkobqQAnEq261XZhOfHeYO7hDYLLMCfgHL2fzd5ZNNPwyxiUyeAeBfuST2nnX
         E8Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxc4AkVCl5a7L1MfxqBPRt4ztL+LeMivvccNaLj0zs82gAJp+4VoaNJCIVWy6Uh9yZ5QmWFKeicNSLupMY=@vger.kernel.org
X-Gm-Message-State: AFuF++n8ReLSIndcpHTtBxLresiBYtCio/VRlfhnuJtod9i2htmFvujZ
	mGNvFtb8DYKpgGeezahJSzQ5efjqfPs6eo/d55e75RnZPgMqsnrELJjf
X-Gm-Gg: AYBFou0NBhjAY1Fuz5rt4igd4J3CqOc9ZOVyDK7oPfDnHfuoQVj5nxnz2LsnysnLTtj
	/jcJcNdMt/ae3IP579B7h9eJWyb/+tUWH8RYVIRC1zmYLb4NJnJXnD7A5fF68XOk1TWbYmC0Hwc
	fHDqBPKUqp9rR6vNW24AcoyJDwp92O2UBsqtXQ16nxWV4kdcnzWDsjaA2cdCA8t/PI6xClrsGdQ
	1LtZEIhbKG5mKl09HcRTu5D6UbbEUKbx2rWuvbeqGwqrh5fyGXsLrWcqmDX1iAGu/+jTMzRbvAq
	ZRffTiEwD2ITQJjDKoKL0Ke644RZS1NLem2XX6/le02YHWrHSka1x79QVMfHUfLORWh1QVxbhU1
	PykfsPdI1HxqTOGPXhzyOfsVeYlThDaHi4dfmvo3X+JXoQxsHG/oIeEHFxSkpL6DQtZVXi2kXyl
	HnGbRa/eZZCs6/Cfd0eh2UJ63OSFleoEDxmupfwrhWg1k/P7y+tNgIQuajw3dfvUpRW1Hlmhtnv
	f8T3vKBEydhMUjGO7t/5j8=
X-Received: by 2002:a05:6a00:2986:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-88c631c679bmr5326680b3a.19.1791172758715;
        Sun, 04 Oct 2026 20:59:18 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c79273dsm2879126b3a.40.2026.10.04.20.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:59:18 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v2 0/1] HID: wacom: fix sibling use-after-free in mode change
Date: Mon,  5 Oct 2026 12:59:08 +0900
Message-ID: <20261005035912.910925-1-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004111353.118025-1-jinmo44.yang@gmail.com>
References: <20261004111353.118025-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please drop v1 and take this instead. v1 carries a Fixes tag and Cc: stable
but does not fix what it claims to, and it adds a second problem.

The Sashiko AI review of v1 is right: wacom_remove() stops the hardware and
cancels the delayed work before it takes the new mutex, so a sibling worker
holding that mutex can bring the device back up afterwards through
wacom_parse_and_register(), and removal never repeats those steps. Two
things escape:

 - hidraw stays registered on an unbound device. hidraw_disconnect() is
   reached only from hid_disconnect(), which is reached only from
   hid_hw_stop(); neither hid_destroy_device() nor hid_remove_device()
   touches it. That one is from reading the code.

 - init_work is re-armed on memory devres is about to free, because
   wacom_parse_and_register() calls wacom_query_tablet_data() ->
   schedule_delayed_work(&wacom->init_work, 1s). That one KASAN catches.

Moving my test-only delay to just after the worker's hid_hw_stop(), so that
a concurrent wacom_remove() runs its own hid_hw_stop() inside it, gives this
on v1 five boots out of five:

  BUG: KASAN: slab-use-after-free in __run_timer_base.part.0
  Write of size 8 at addr ffff88800bc1b460 by task swapper/0/0
   run_timer_softirq / handle_softirqs / sysvec_apic_timer_interrupt
  Allocated by task 11:  devm_kmalloc <- wacom_probe
  Freed by task 79:      devres_release_group <- hid_device_remove,
                         under uhid_char_release <- __x64_sys_close

1120 bytes into the freed object is inside wacom->init_work.timer
(offsetof(struct wacom, init_work) is 984 and its timer sits at +72 here,
from vmlinux DWARF).

My v1 testing missed all of this because the delay sat in
wacom_set_shared_values(), after the worker's hid_hw_start(), so the window
never opened. The clean v1 result was real but it was not testing this.

Changes in v2, all in wacom_remove(); the worker is unchanged:

 - Take the mutex before hid_hw_close()/hid_hw_stop() rather than after,
   and move the remaining cancel_*_work_sync() calls and
   timer_delete_sync(&wacom->idleprox_timer) inside it, so the whole
   teardown is covered.
 - Keep cancel_work_sync(&wacom->mode_change_work) before the mutex, where
   it has to be: a worker blocked on the mutex would deadlock it.
 - Add a second cancel_work_sync(&wacom->mode_change_work) after the
   unlock, because moving hid_hw_stop() inside the mutex lets a report
   queue our own work again after the first cancel. That work can only find
   a NULL wacom_wac.shared and return, and the mutex is free by then so it
   cannot deadlock.

Same kernel and reproducer as v1 (x86_64, hid.git master, KASAN,
PROVE_LOCKING, one fresh QEMU guest per round). v2 is clean 10/10 with the
original delay placement and 5/5 with the one above, no lockdep report and
no leftover /sys/class/hidraw node; unpatched is 10/10 KASAN. The cost of
the global mutex and the untouched wacom_wireless_work() are as described
in v1 -- v2 only widens the hold to cover removal's own hid_hw_stop().

v1: https://lore.kernel.org/linux-input/20261004111353.118025-1-jinmo44.yang@gmail.com/
Sashiko: https://lore.kernel.org/linux-input/20261004112812.460B21F000FF@smtp.kernel.org/

Thanks,
Jinmo

Jinmo Yang (1):
  HID: wacom: serialize mode changes with device removal

 drivers/hid/wacom_sys.c | 60 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 10 deletions(-)


base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.53.0

