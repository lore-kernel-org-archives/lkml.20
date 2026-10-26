Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026786;
	b=TrmEqW705DHvMUEEdVBGtIHIzZSPm0YjunQzI/k2esVoTIxuBKCthtJ2S5H0nGl9QK2J
	 v4uC4u1X5aaV+zH3/j8auLM8XTViqc2ZIVKL2d54ONgJt7hyDaGgnSH1itljVMFMUG7hQ
	 hd5O+gdSW6wfNVUwZhHP/Nj7g2P/bUJ/70piWiuIIG3pDVwsEGmWkjMWdaHigDh8x/My4
	 J6U3xkGbtZeCQM6eA262bCLga3DEb+d4PdKlTrd2syxbWMqwLNDMuOuJ+zDjkHzTztMA1
	 miNodnhGBg57sgNjNUhHRwx/6a1IweQDEelYpzussbYDWOnxxJHyA/I+AUcct1NR2EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0hZu4fC9M40eXtw7zx0zkLs5DS7aBYk38bRzFK4atkQ=;
	b=UJ0QhIgLYo1FTe2QgqJ5T/x7j793bSgK+eVNAW+dP2JsZXU3raN5Kl4u0VxRVZu71wN6
	 kNn8QHvFPHruSxKTHGCw+3TDh21rLFPYqDu4UQyIK87dprEU1s3SS4D88jyvez1HPt8fq
	 0adDthA7MNpzRVRjy3ehzluiAlWoCKZgJqWRrt9yn0NwjboN5SJEl9jid0h4bdbccnOLF
	 +wj+aIR8VNM4SmwcUmi/K4NseGfsHOHGosRZcI4C5UsPMpf5ZEqY4mxjDBX8d/o3WzvWH
	 PHjcTIc8jL0QirWIiyRRZZLJz7eYZTqk2mxl4ek3RFYebCvxg1liWblx+bLrvVoG0Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mQy8fw7u;
	arc=none smtp.remote-ip=74.125.229.132
Received: from mail-dl2-f4.google.com (mail-dl2-f4.google.com [74.125.229.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF84606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mQy8fw7u
Received: by mail-dl2-f4.google.com with SMTP id a92af1059eb24-1922a6f0d23so1190561c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793026785; x=1793631585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hZu4fC9M40eXtw7zx0zkLs5DS7aBYk38bRzFK4atkQ=;
        b=mQy8fw7uM92wWWIpdiHyh9wLBq09jjxq+zed7nK0I4uMFJsjwo4T9dRlW9l/8wRBSE
         KARQf98Cx0m2nG+1l2veSKT52Qf9C0jBOxauCrb1dSCfYr4hJr5Yo6u1bmBHgpEZiNww
         jREkZpdX9W0EkNkfRh6w4765LMxQg4E0nkVaFir6rtGeXI30z60OxyvlJdAlXul/IRsO
         yQqYbY2nZI0C3f3UX2h+OtQy8pipnbCslAG0NLxng/2/cm5088gu/bHB70Nb8Xqzeolw
         3j+AvpIEh80m6FN7IUbrRaJY0qdh48F8HvR9p7TblAPI8tObbxW0pU257bKxxXxIBsGV
         74gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026785; x=1793631585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hZu4fC9M40eXtw7zx0zkLs5DS7aBYk38bRzFK4atkQ=;
        b=NKMttVDe7F+HBGaR9gDsGWYpJFt/vusdElA1me+9QqCW3carPrJEYwHGCmMOHjAb0t
         9D8SvD2Kg+pXrariBzoP+ah14oDelEa1o/dJ+q7J+UdUvgHB/EdhjUKgMSan90X5XsFZ
         BpUVV83oAtUDtqk1osY1VxOL9AUW0YH2aHT98anCLWzmtKigPskcxd2ELz1IMfr1et/9
         Y7byxVIyNs079ww9oJsf9/KDAtx1VsXf7iMGiBxFigba6teEQGy6BekWvsf33GsZsT32
         5UmdwVjsNIWCNJWQGU0x5x+QS+lX6PCBwOClPvjtSgBt4G151zOUVo5yWY2HbgjUYBc+
         HW5g==
X-Forwarded-Encrypted: i=1; AKwUvBw31ezXFy2qCQePb1WL33sfINOhikzZKTbUHFOOv6Yqxr+RZqMakwYJgmbfXwLMhnfaGZAJaYQcZhjMI+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXYmxY5icYbtB3C727bdQYR25sBcQ9hJi0+Jd/rqWynHrACcgq
	EEYRI1+KIX50qMxcXDUejZSzSmFYqbEBV/aqt04cNOl1aXQi+5qgVazn
X-Gm-Gg: AYBFou3xhneRS5Fn3ekokDh7YdDdngZLVqHtnIXjNXocHZCyS/OTjHxNxMeSt/gNnYD
	bxVH4ZruhLVZNhZQHMFd6BywLkizbXoLwYW0RfbfHIJYkjs1m49V7NUoxHTfK8HC/3TSffH59C7
	Seg5OiV1cMe/n+T472g/dszudM24GCZD6Ml66KjnVQ/Dn6zm/gpCiRKAgmbu8/J1uU7JoNBzWOM
	PWmW1hbPg74jG/Pf8jwUHBMKQQ7cvdnIMxHNRJI6dZdW6CMsYGEWDv/Enef01PZmwH+txjFTXBo
	6s/+SRgZwT2uQ+AfnPr1/Q/uuBTxSs7XfZCw0xmk4MOzh+nU8ZZYjDAum0y0RPMkOv3YsvbMncV
	54WUbKeAFdABSphxboddiVSlwXLNS9u9MZ7ynz0ZFaA9AkB+mBzuHtfPuCR0eI56GXs5eB3Fg+j
	+pT2WhzOCIQtryu0iqqjsDE8UXh2gttVOCCPvPBfKgddtKknSPUq6jSQUzn4cjr/XBkDq0/wUeP
	Y2OUARlKAF+sPTtfYDoLeZl6Sfwy/unX/aFwnSOiv4qO1LIIlxxvnJRALT2BU5fD+FGB1tr+law
	mCaFFmPhxGB4QBp2Nw==
X-Received: by 2002:a05:7022:b04f:b0:181:8948:f01f with SMTP id a92af1059eb24-19937309c99mr9745342c88.36.1793026784563;
        Mon, 26 Oct 2026 07:59:44 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a277b26csm28619817c88.18.2026.10.26.07.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:59:43 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com
Subject: [PATCH] fbcon: Avoid cancel_delayed_work_sync() in atomic context
Date: Mon, 26 Oct 2026 22:59:16 +0800
Message-ID: <20261026145916.414396-1-yyaqia@gmail.com>
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

From: Yao Yiqi <yaoyiqi3@huawei.com>

fbcon_cursor() can be reached from the console printing path with
interrupts disabled, but it might sleep in two paths:

  console_unlock()                  <- IRQ disabled here
    vt_console_print()
      hide_cursor()
        con_cursor()
          fbcon_cursor()
            fbcon_del_cursor_work() <- this call may sleep

  console_unlock()                    <- IRQ disabled here
    vt_console_print()
      lf()
        con_scroll()
          fbcon_scroll()
            fbcon_cursor()
              fbcon_del_cursor_work() <- this call may sleep

When the VT software cursor is enabled (vc_cursor_type & CUR_SW),
fbcon_cursor() calls fbcon_del_cursor_work(), which uses
cancel_delayed_work_sync() and therefore may sleep.

With CONFIG_DEBUG_ATOMIC_SLEEP enabled, there are reports like this:

  BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0
  ...
  __cancel_work_sync
  fbcon_del_cursor_work
  fbcon_cursor
  hide_cursor
  vt_console_print
  console_unlock
  ...

Use the non-synchronizing cancel when called with interrupts disabled or
from an interrupt context. We still keep the synchronizing cancel in
sleepable contexts, where it is needed to drain the work before
teardown.

Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
 drivers/video/fbdev/core/fbcon.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 94abbb5ac766..f1dbf973e44b 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -56,6 +56,9 @@
  *  more details.
  */
 
+#include "linux/irqflags.h"
+#include "linux/preempt.h"
+#include "linux/workqueue.h"
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/types.h>
@@ -441,7 +444,14 @@ static void fbcon_del_cursor_work(struct fb_info *info)
 {
 	struct fbcon_par *par = info->fbcon_par;
 
-	cancel_delayed_work_sync(&par->cursor_work);
+	/*
+	 * fbcon_cursor() can be reached from the console printing path with 
+	 * interrupts disabled. Only synchronize when sleeping is allowed.
+	 */
+	if (in_interrupt() || irqs_disabled())
+		cancel_delayed_work(&par->cursor_work);
+	else
+		cancel_delayed_work_sync(&par->cursor_work);
 }
 
 unsigned char *fbcon_cursor_glyph(const struct vc_font *font, unsigned int cursor_type)
-- 
2.56.0

