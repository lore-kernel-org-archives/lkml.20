Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EC73A1687
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482305; cv=none; b=aJvOaBb19546eZ6yHs1xuuu66ihmPhAri/KLegDZycD1D/VsthklNC/17cLwn+SqqRRahxFpE5UMgB4gAqYIbkNttVuEZfG1OQgG2Sp4qC0RtzHtNxeguJ65SBb6ELRusHN5IV0XLUJGa3lEWX7OO0PtxWcIbgMO2lLIaYVFGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482305; c=relaxed/simple;
	bh=7y5YE/MAfnwPrD1k/nX9JiMq80KHbsOZOo+JqaDlcfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBL2ZVN3Gr9R+Nzi7b11kV8tdw7jelRlHD9FdZX8M2vnyIg1m079VTPWwuOe+p/qlfhIes8i65F6ql2lm4s34FqbNQ3TEhsqGqyHK2NYdtSNKmXi9Hd8N7YoAqBa3iQ+yKo8G+CcnpQWneBpxVixSk+itU5WVBmohhO1pbnCS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aq7sG+Hx; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aq7sG+Hx"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0abca97c0so1079610a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790482303; x=1791087103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBNeugMl5R6M9EUys4hINw2pmQ9OojJHfb4jGPLABiQ=;
        b=aq7sG+Hxg0/YtNafQGQoCB+Pa7XxMVAH+S8MGY4IYpK+2yIaaPBPa5L+dl1n8t3UrY
         WqcWCFSuG3qRWRqBwSgjAsEDV5HWAd9korubS+q/KKfhpf3W+LKwSQaxl733SkDgTC8m
         2XCZthuir8dqwa2YadLcPrTIrRuObtOivpMO5hbPg9PUpsG4vgSLfcf1ojUnC4NNzEW3
         lwj1OVfhJ3/WzhbsKcJYwsa2H7xd7DgMksSUWu0m6Cg2joCcK8yFtt2jSraIknUluXX8
         I4RdGBEExgGy0NjNCnrlASo6Kew/zBPdC5qFVCk3jnKbwdlQ+tYxz4T0K84smM7WcC0E
         cvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790482303; x=1791087103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBNeugMl5R6M9EUys4hINw2pmQ9OojJHfb4jGPLABiQ=;
        b=ea2peg9NslLcb+fupTyhSF1BUA2pKaApKiPYeDXdz+qEQo2daTXRPL1aG1l/v7hsTK
         40p6gtQkxKw9fAu5Uy/oR7lSbplS8JCPqSB0XJwU/yh5DIccPRgYqz+5aG3khqcQ1ekz
         PbJoI7frVRZ/i98EFZaMKU2jWR5ou8E9c+JozdSQ80Ne43LR2Vs7JgMUnE45KLCDpxec
         GrLI7h69WI89lm9EP72CYCB7K4scXpFy+7wxoxuZAYA4BH8raisgTwLm0IdwbROHA5Uk
         xtqJsNZQ5daXDpjdUYLg8sg9N2hKUrRwlzj58+TjzoMr5x3LJhE2+/0G6vrwUz6pl+gm
         NV/g==
X-Forwarded-Encrypted: i=1; AKwUvBzpPBLVjyNhyQBwPPPm9sIrtkB1JWVL1Lpf58AaHV0eLMLRyz2x5h6J34Udg9ZnuJCSZRXoZYSMTat91ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiDBAPWYiuAcLh217VzSoD9qRxRIwICAzYw5Y05a7qIaRxWdWd
	RwhsQ0kHoOhIc7gSyuGdcRqt5VXr22OKyrx0mFN/8ZuhyGT5iX2vAYxg
X-Gm-Gg: AYBFou0K3axVzeSI2Tv3+L4eVnYAxa3C+SpFVGKfNKSjSWoqdn8TTGtWMpXRH3P9n6+
	KJYbGDqypqmmkiX7IFOo7JnDZlkssuCyG/7c4bs7KrV+zqX+OzEdAOCjcHcyoALPcd6RG0mig/D
	A7x5uuQYfssavrwDP7uOnBEWkY7EVyHvd3GyIWvy99G0T0DxzHQsSi6dw9iCTenUNLrVbsAsJds
	CQiEiWwoKricluVddxP0h0Bw0hwAg8mHJDNHQbqXX9GfRRVdaGY5PZVHsAdcLekuIGQsSlIDxb5
	9ErBc1mrAxk+mfcl//+h3VMhzAVgNhfeCqAjKeAbteviDv3Cple6SZnNnpJF9UQ5GPA3bfBD2dd
	tzTb6FDKxOqqMxGPd91zwK4RIaEGhEmeT77bHRymaM5+/igFAxaj/fpSZVNf9mN+ud84cLkhCkg
	KhlHRGuzAHy87gSvBMdSB9+6r5dorEPpAixpFbVAbaf1twucqe0gvq0dt79nqQOn9B3Ld/VSayq
	TS9vlJeUDXVWPGht/bmxIg=
X-Received: by 2002:a17:90b:48c7:b0:3a0:e21b:db1 with SMTP id 98e67ed59e1d1-3a0e21b1625mr2804987a91.25.1790482302675;
        Sat, 26 Sep 2026 21:11:42 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b4f6345fsm5542732a91.1.2026.09.26.21.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:11:42 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH 0/5] HID: wacom: check input devices in the report handlers
Date: Sun, 27 Sep 2026 13:11:33 +0900
Message-ID: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>
References: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the extended version Jiri asked for in
<579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>, after Dmitry's
observation that "there are many more places in the driver where it used
wacom->pad_input without verifying that it exists".

The audit turned out broader than pad_input. Of the 155 lines in
wacom_wac.c that reference pen_input, touch_input or pad_input, three
places already test the pointer first:

  wacom_wac.c:1807/1815  wacom_tpc_irq                 pen, touch
  wacom_wac.c:1210       wacom_intuos_bt_process_data  pad
  wacom_wac.c:2192       wacom_wac_pad_event           (HID_GENERIC)

so the inconsistency is inside the legacy dispatch rather than between it
and the HID_GENERIC path. The clearest illustration is two adjacent lines
in wacom_intuos_bt_process_data(), one checked and one not:

	input_sync(wacom->pen_input);		/* :1209 */
	if (wacom->pad_input)			/* :1210 */
		input_sync(wacom->pad_input);

Why the pointers can be NULL on a *successful* probe
====================================================
For a non-HID_GENERIC device the report handler is selected by
features.type, which comes from the id table (wacom_sys.c:2945), while the
three input devices are allocated from what the report descriptor declares.
When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
wacom_setup_inputs() frees that input device, sets the pointer to NULL and
still returns 0 (wacom_sys.c:2172-2196) - the "no pen in use on this
interface" case. wacom_wac_irq() then still routes reports to a handler
that dereferences it.

No error injection is needed. A descriptor declaring only touch usages
leaves pen_input and pad_input NULL; one declaring only pen usages leaves
touch_input and pad_input NULL.

What the series fixes
=====================
15 locations, each reproduced as a KASAN NULL-pointer dereference from one
/dev/uhid device plus a single UHID_INPUT2 write, with no privilege beyond
access to /dev/uhid:

  patch  file:line          function                       pointer
  1      wacom_wac.c:4229   wacom_report_numbered_buttons  pad
  2      wacom_wac.c:137    wacom_penpartner_irq           pen
  2      wacom_wac.c:227    wacom_pl_irq                   pen
  2      wacom_wac.c:244    wacom_ptu_irq                  pen
  2      wacom_wac.c:303    wacom_dtus_irq                 pad
  2      wacom_wac.c:326    wacom_dtus_irq                 pen
  2      wacom_wac.c:391    wacom_graphire_irq             pen
  2      wacom_wac.c:444    wacom_graphire_irq             pad
  3      wacom_wac.c:594    wacom_intuos_pad               pad
  4      wacom_wac.c:1209   wacom_intuos_bt_process_data   pen
  4      wacom_wac.c:1232   wacom_intuos_bt_irq            pen
         (both covered by one check at wacom_intuos_bt_irq() entry)
  5      wacom_wac.c:3100   wacom_bpt_touch                touch
  5      wacom_wac.c:3117   wacom_bpt_touch                pad
  5      wacom_wac.c:3130   wacom_bpt3_touch_msg           touch
  5      wacom_wac.c:3178   wacom_bpt3_button_msg          pad

Patch 1 also guards wacom_wac_finger_count_touches(), and patch 2 also
guards wacom_dtu_irq(); both are reachable with a NULL pointer but their
only dereference is in a dev_dbg(), so they do not fault with
CONFIG_DYNAMIC_DEBUG=n.

Dereferences that are reached only through dev_dbg() are otherwise out of
scope here. A few remain, on unknown-report paths in wacom_dtus_irq(),
wacom_graphire_irq() and wacom_intuos_irq(); guarding those needs a
separate look at what a pen-only or pad-only interface should still
report, so I have left them for a follow-up rather than mixing them in.

Approach
========
A check where each pointer is taken, which is what wacom_tpc_irq() already
does. Where a handler serves both pen and pad reports - wacom_dtus_irq(),
wacom_graphire_irq(), wacom_bpt_touch() - the checks are per branch rather
than at function entry, so an interface that has a pad but no pen keeps
delivering pad events.

A per-features.type table of required input devices would be one place
instead of 15, but a handler's needs vary by report id, so such a mask
would have to demand every input the handler might touch and would then
reject reports that work today on a partial interface. I am happy to build
that instead if you would rather have it.

Testing
=======
linux-next 20260925 (7.3.0-rc4-next-20260925-gf5f84daefcd9), x86_64,
CONFIG_KASAN_GENERIC=y, CONFIG_DYNAMIC_DEBUG=n. 27 uhid reproducer cases
covering the sites above plus the dev_dbg-only ones, one fresh VM per case
because the oops leaves driver_input_lock held:

                              before    after
    KASAN faults                  17        0
    probe failures                 0        0
    hidraw nodes created          26       26
    input devices registered      25       25

and the set of input devices registered is identical in all 27 cases, so
the checks remove the faults without changing what a device exposes. The
one case that creates no device is a product whose table entry sets
.check_for_hid_type, which uhid cannot satisfy; it behaves the same before
and after.

Each patch builds standalone with no new warnings, and checkpatch --strict
reports 0 errors, 0 warnings and 0 checks for all five.

Not in this series
==================
Jason, your review of "HID: wacom: add report length validation in irq
handlers" (17 May) asked for the length checks to move into the
sub-functions with len passed in, plus WACOM_PKGLEN_* names. Eight
handlers already take len and eight do not, and six of those eight are
also on the list above, so that work overlaps this series closely. I have
kept it out here because I have only reproduced and verified the
input-device faults; I would rather send the length revision once it has
the same evidence behind it, on top of this series.

Jinmo Yang (5):
  HID: wacom: check the input device in the shared report helpers
  HID: wacom: check the input devices in the legacy irq handlers
  HID: wacom: check the input device in wacom_intuos_pad()
  HID: wacom: check the input device in wacom_intuos_bt_irq()
  HID: wacom: check the input devices in the Bamboo handlers

 drivers/hid/wacom_wac.c | 97 +++++++++++++++++++++++++++++------------
 1 file changed, 70 insertions(+), 27 deletions(-)


base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.53.0

