Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE4D3E833E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285608; cv=none; b=EgBtctPyWEdSP6JLHSCONfGwAoiOWzIE20dcciEmZcYqqaF8NklZVpEkufiNGdQs47WvowUq6YLFjbFhBFM3P7AQutV2k54MDgnNNy/BhNfiokQQsSuHpQgxcAXCqdwGt9857iLaCOhhufhqcE6AEQLOL+oCe7BI7G9AysD+hss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285608; c=relaxed/simple;
	bh=6T8Xmbs6VmaErd2viLi/O9gLpkVnuINZ/avE3+GSZwM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IBEq4TcYdmcTIRXLOU/jT56Jonp17taQW4/05iTrl99woFsn1O5lxYwpvxy2EyJccHMj39V/LQmrRa6u7n/NDYNDmv3mznAJ40iE72Eu9RGj1Hy2mx6xGdz/97iMHoIQuEEYiexWSM++tQOvAmdnXheUpWq0/Oo2rQjKgX2MDD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cd3e90ff97so2047160b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285605; x=1791890405;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cfiWrg/7w1hOtmxUf5M6kNYvYOOnJHxCTq71KowYFOk=;
        b=EV3pzYNJjgR9Pr7903BZL8bFMrmpiCoPoIp15BjYCyQpMESl8NrIHeaeJqFXxRlRtC
         Dazgo+Tt0V7LWalUoS6ww6y/AYSz3LbI9lJ2zQdzpRdVokim9fYktz4onpFopuo3NOPu
         //xB9NGRO26A8u9ov3GSnMLIGyONR/E5uPu6hS4KHBd3IDOq1PT/TU3nzPJ3UMy2E0sN
         VewwB/5FFMTPNOJnWSphA+cqbeuH+H3jG8p5zT08/oWQAz0thQ4CMTIBbExCm6XqiHWx
         MFgSZooxpXxInCKvYazvr2w4OIPujlDTb2vd698u4/Lph8DNN1BX0vB41EmCkwekAKJ3
         TGZw==
X-Gm-Message-State: AFuF++kfdnFM8N8Pz6JwI89614qkqcbOQJGbJSyyxsjdYFbp1nfyWh9u
	485sbMAkBC3Dkvp16Hxz2Qn1yZcLnWBI4WvYwlXNGkCab+6JZztzXe8BxOOCP5A8n8rz+G0oim3
	8biw8N7NbHmGP6jJR8Fw6C8fxCU06+PbAjLfqkIP78ex3ctyAr1U+zj1I6Rk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a4:b0:4f6:2ccb:c2a with SMTP id
 5614622812f47-4fb428e1011mr986047b6e.68.1791285605412; Tue, 06 Oct 2026
 04:20:05 -0700 (PDT)
Date: Tue, 06 Oct 2026 04:20:05 -0700
In-Reply-To: <6ac33576.53659fcc.25f34.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4d965.353c8d8e.177895.0002.GAE@google.com>
Subject: Forwarded: [PATCH v1] Poisoned page in hibernation
From: syzbot <syzbot+609c80047e3e808b465c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v1] Poisoned page in hibernation
Author: nsvatoslav515@gmail.com

#syz test

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 kernel/power/snapshot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index b209712cb2c3..a893d48e770d 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1256,7 +1256,10 @@ static void mark_free_pages(struct zone *zone)
 
 	max_zone_pfn = zone_end_pfn(zone);
 	for_each_valid_pfn(pfn, zone->zone_start_pfn, max_zone_pfn) {
-		page = pfn_to_page(pfn);
+		page = pfn_to_online_page(pfn);
+
+		if (!page)
+			continue;
 
 		if (!--page_count) {
 			touch_nmi_watchdog();
-- 
2.47.3

