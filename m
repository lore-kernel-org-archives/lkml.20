Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2DD45BE3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381344; cv=none; b=AC8MvT0bmMk8c/3qOr0+NQXjB01XIVMOkJjjbSIDNnRtQdJA71pO7RUkJs9ylyZ0aOP+vk/ihY8K+3SbLQFnh7ZUHhnZaXpTkZCeDhC6IjKFG/qzAAdr//SA3VN7r8DEQi8aP88AX8lu7ftqx9bWpcocUvqRBlclJlw7Ub00u68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381344; c=relaxed/simple;
	bh=pImOuPqMckVKMPaILETUz1VCf8WYMf3u8DsEjE8GF4g=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=YMRWC4Rr6PrSzUas15YF0IfgCue/jWD42757M07gfftYVkfwCinCQa+KoRKPdGlHRCsKF8Eoa8SJMb9qJR+8zgKnMfZCFI7h78a0aXeFl6zr78DKFh/AjbbcxB23KNjsUejTxHl41W3Aez0HeTnYquSSpRmFUf58qoEjFbNSgeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDWyLC7/; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDWyLC7/"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34182b58c7eso1028423eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790381341; x=1790986141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kEyD+JH+7OnLIHOwxBPzzmfEJuyMZruDiusO3LIwY4Q=;
        b=MDWyLC7/pChlP8ujc/W/T6a50sFIP/8xF3+BxCilbEWrTOLAz9IFs/XnX02v3sjukF
         SCpZFcH+G5IKp08A84I6MpOcSeEBeeh3J5sENIobZWlQLKRRyouiOBrlEj2rLGgoNRLg
         tLltAevpt4QhbrNh/gdMUvDCj8T50Afw5lkGxD8tSlGSPayue4WAIzRP7CaGX34AiF86
         c+5xMv0h9kup+jTUtGooNqgZ3DBrU6gvbph/WamRu2OlJYHmrKJMzBhq19maRcBq50xw
         6UQ2VqAj6ikzeRtHZAOZBfhg1k4/gbXdwcnTmGP0j94k1jciZyoVMrQCJnSRBqIIbjFl
         GZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790381341; x=1790986141;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEyD+JH+7OnLIHOwxBPzzmfEJuyMZruDiusO3LIwY4Q=;
        b=1AJghX8ZfzRHFA5LhdBi4taJ0bdGDMm8gs6IXzBAI3vDeq0EYrdcHUyL+pi+czlg9J
         prx87y4zwE/1+0jwq3FHDTA4HUcJFh01kLdue8o12twbdGvb3M/WR7QGiyWHqNhew4ID
         xRFOhbpYFSsMTVhgx+35FnWfMBkj7L+cwpqf5tTzcDy+Di1cnoA/iyxWKCvJ9g6TM7sK
         Uy5uYqFbkPTdVYMR1SI099t84MIBcLE6/zaVDy9g0r7PPvFEoK9Kz/T5EjeKrnczI7nd
         MkxsjHKO/VhNagQJyQOw4bsXFFcPrywO0HWr3t05nZWhMgwiKzFWWPPWz4KVUL/2WzLA
         zEWg==
X-Forwarded-Encrypted: i=1; AKwUvBwg5Uxugaa0GGdMDFOsnrgwHN8clKkBdPLbxmcP9CdR8q7nX5iBHU/PaA6rKe0LgeF/MSCwIGVKTj4RWII=@vger.kernel.org
X-Gm-Message-State: AFuF++mg4bKwDeV7KkVNQkvf3T/jExBJ+uk2/CXV8zRsLnXLXEEBF8Cg
	ofRCyrDy7vmfWgK0i1Pt7ULXhImz1JswGlIKrPzt2+scZUVaTlr2IVwn
X-Gm-Gg: AYBFou0dJBvrcQxWr87wDto+iAraVif9iK7Xf4nOqb0ShERIVlQH0+xjyVUpbWStidt
	1cRznr7jSMt9DPjpmwPH+yHsoHyaoXD47QZ8/SuPh2aIuuJDvZCbbdM4YJCq1RDlZiAAKyVT4zn
	jNzIHPgqAPwzqq0y35EQatAnp0FVUufvMVuYOL3JB3jp1NFN4JD0uRztdX68mbFBNWVaqUAqP0j
	rK4XbVAARkzLr7yVG9RWrjeQIx0AHNwVtYbclrOQ/VTzq8kyU3bZsMk5I1QAbiunRNoFkF1D8DQ
	pUQiaJlgAWXiDRHJliT8JjMWNo2DC4cFtUQpxfo5LdWj/oo5yQdFnwlTFgB2uSYGH1NWWjlSv4o
	neRPEAMK/HYV+JqMNddWu02YljTFOhIk2gpoRyPaeeJvcCLOtbPE4oLSWHfcb1bqFqvqH5tmc4Z
	ftqmz5VcCJs63MLFHMwVqhZ8DDtC8jJJcGAry7HobBXZ6T/x65TbPVekR9FgbokBVSKVUSXXcPN
	GBG44Aq0fCK4Y8LF5zHx7vE4BIc+J3ilG99u1e6Evs/5XgQaqZkic2JACG3eHTI7uiskW+3w1O9
	UrScNIQMN8seGS4/leWIJL99GmegSZGJ1UbJ
X-Received: by 2002:a05:701b:4305:b0:144:c12d:c6a3 with SMTP id a92af1059eb24-146d0c5087cmr1404884c88.45.1790381341436;
        Fri, 25 Sep 2026 17:09:01 -0700 (PDT)
Received: from [10.156.142.234] ([23.144.160.253])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm8112055c88.15.2026.09.25.17.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 17:09:00 -0700 (PDT)
Message-ID: <40385855-cb42-43b4-bee4-ca8cccbb279b@gmail.com>
Date: Fri, 25 Sep 2026 17:08:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kanav Gupta <email.kanavg@gmail.com>
From: Kanav Gupta <email.kanavg@gmail.com>
Subject: [PATCH] media: gspca: Fix crash in sonixj driver
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fix a race condition in the sonixj driver where if the last byte of the
previous packet was 0xff, but the new packet doesn't start with 0xff00 or
0xffff, it would subtract -1 from length (effectively +1) and add -1 to
data (effectively -1) which caused it to read one byte early in
gspca_frame_add which led to a crash when running memcpy.

Kernel logs of the crash:

[  344.258380] #PF: supervisor read access in kernel mode
[  344.258388] #PF: error_code(0x0000) - not-present page
[  344.258395] PGD 100000067 P4D 100000067 PUD 1002dd067 PMD 10f21a067 PTE 0
[  344.258413] Oops: Oops: 0000 [#1] SMP NOPTI
[  344.258425] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.4-arch1-2 #1 PREEMPT(full)  ceab5b7eb60a89a58d616500ee9fef4aad8789ba
[  344.258440] Hardware name: Dell Inc. Inspiron 16 5625/08HCFW, BIOS 1.23.0 04/22/2025
[  344.258448] RIP: 0010:memcpy+0xc/0x30
[  344.258464] Code: 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 48 89 f8 48 89 d1 <f3> a4 e9 98 2d b7 fe 66 90 66 66 2e 0f 1f 84 00 00 00 00 00 90 90
[  344.258472] RSP: 0018:ffffcde8c0003e08 EFLAGS: 00010286
[  344.258481] RAX: ffffcde8cb7163e1 RBX: ffff8bf8128bf000 RCX: 0000000000000385
[  344.258487] RDX: 0000000000000385 RSI: ffffcde8cb78ffff RDI: ffffcde8cb7163e1
[  344.258492] RBP: ffff8bf82122f000 R08: ffffcde8cb78ffff R09: 0000000000000385
[  344.258497] R10: ffff8bf8128bf000 R11: fefefefefefefeff R12: ffff8bf8128bf000
[  344.258503] R13: 0000000000000002 R14: 0000000000000385 R15: ffffcde8cb78ffff
[  344.258509] FS:  0000000000000000(0000) GS:ffff8bfb7492d000(0000) knlGS:0000000000000000
[  344.258515] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  344.258521] CR2: ffffcde8cb78ffff CR3: 0000000105e22000 CR4: 0000000000f50ef0
[  344.258527] PKRU: 55555554
[  344.258532] Call Trace:
[  344.258538]  <IRQ>
[  344.258544]  gspca_frame_add+0xd0/0x290 [gspca_main 5a055b32c806e417235e8d5e2742e9a578ee2b8a]
[  344.258559]  ? __queue_work+0x16c/0x570
[  344.258573]  ? __pfx_sd_pkt_scan+0x10/0x10 [gspca_sonixj 9778522355db5c2cbeafad6bd503d60db422b3ff]
[  344.258586]  isoc_irq+0xd2/0x170 [gspca_main 5a055b32c806e417235e8d5e2742e9a578ee2b8a]
[  344.258600]  __usb_hcd_giveback_urb+0xa0/0x120
[  344.258613]  usb_giveback_urb_bh+0xc0/0x140
[  344.258625]  process_one_work+0x19f/0x370
[  344.258636]  bh_worker+0x1d2/0x1f0
[  344.258644]  ? sched_clock_cpu+0xf/0x1f0
[  344.258655]  tasklet_hi_action+0x13/0x30
[  344.258664]  handle_softirqs+0xe8/0x2a0
[  344.258675]  __irq_exit_rcu+0xb0/0x100
[  344.258680]  common_interrupt+0x85/0xa0
[  344.258687]  </IRQ>
[  344.258690]  <TASK>
[  344.258693]  asm_common_interrupt+0x26/0x40
[  344.258699] RIP: 0010:cpuidle_enter_state+0xbb/0x400
[  344.258704] Code: 00 00 e8 68 b3 e8 fe e8 23 ee ff ff 48 89 c5 0f 1f 44 00 00 31 ff e8 54 3e e6 fe 45 84 ff 0f 85 48 01 00 00 fb 0f 1f 44 00 00 <45> 85 f6 0f 88 9f 01 00 00 44 89 f1 48 2b 2c 24 48 6b d1 68 48 89
[  344.258708] RSP: 0018:ffffffff89003e18 EFLAGS: 00000246
[  344.258712] RAX: ffff8bfb7492d000 RBX: 0000000000000003 RCX: 0000000000000000
[  344.258716] RDX: 0000005027642b7f RSI: fffffffb85bb9d7d RDI: 0000000000000000
[  344.258719] RBP: 0000005027642b7f R08: ffffffff89219480 R09: 000000000000000f
[  344.258722] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8bf801221c00
[  344.258725] R13: ffffffff89219480 R14: 0000000000000003 R15: 0000000000000000
[  344.258733]  ? cpuidle_enter_state+0xac/0x400
[  344.258740]  cpuidle_enter+0x31/0x50
[  344.258748]  do_idle+0x1cc/0x2e0
[  344.258757]  cpu_startup_entry+0x29/0x30
[  344.258762]  rest_init+0xcc/0xd0
[  344.258768]  start_kernel+0xa56/0xa70
[  344.258778]  x86_64_start_reservations+0x24/0x30
[  344.258786]  x86_64_start_kernel+0xda/0xe0
[  344.258792]  common_startup_64+0x13e/0x151
[  344.258805]  </TASK>

Sorry if it isn't perfect, this is my first 

Signed-off-by: Kanav Gupta <email.kanavg@gmail.com>
---
 drivers/media/usb/gspca/sonixj.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/gspca/sonixj.c b/drivers/media/usb/gspca/sonixj.c
index 2e1bd2df8..03f40575a 100644
--- a/drivers/media/usb/gspca/sonixj.c
+++ b/drivers/media/usb/gspca/sonixj.c
@@ -2695,18 +2695,19 @@ static void sd_pkt_scan(struct gspca_dev *gspca_dev,
 	i = sd->short_mark;
 	if (i != 0) {
 		sd->short_mark = 0;
-		if (i < 0	/* if 'ff' at end of previous packet */
-		 && data[0] == 0xff
-		 && data[1] == 0x00)
-			goto marker_found;
 		if (data[0] == 0xff && data[1] == 0xff) {
 			i = 0;
 			goto marker_found;
 		}
-		len -= i;
-		if (len <= 0)
-			return;
-		data += i;
+		if (i < 0) {	/* if 'ff' at end of previous packet */
+			if (data[0] == 0xff && data[1] == 0x00)
+				goto marker_found;
+		} else {
+			len -= i;
+			if (len <= 0)
+				return;
+			data += i;
+		}
 	}
 
 	/* search backwards if there is a marker in the packet */
-- 
2.47.3

