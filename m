Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478814;
	b=30opLrA+6UIuqNLDGhnw8eavl4nDJTP40TyzM6lgya4iuYfA2mGj6Rp3C1H39BcbQmhS
	 Wg0nBqrxj/xLKZ58wnyZhRrVXy+uw0vCyElBHg6pXYPvz4b4AUvURu/MFczpKr/5/Sdyu
	 E6WO2QiufPRdaBGPLSDJEnV/PNc18ccQlV+kEoch/gZarinzikeVmIapHvv7zZO7A5RHq
	 7VhJRH6bWknsVXDy1n1xpFDUC7+AtOOMBeD72aozgpBQZYMVSXYrUCs+yNKiiLAJeI91p
	 spZQJ7RUW3IlLdTiZyE3YZtvYfzVF0lKXUN7kaAOCQfwFKGwVpLtjdolseuCJkcy/eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478814;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=68ZDKNjvBiemw66qi5bGSPjUFdtqvTif38QW77x1Uy4=;
	b=SBVAUioeShonCYfyC75PwtZ3S6+n/qGYHTybHuUSpX48uN3FcZBEmhSMgx0BQgJN0Xsk
	 Japb1OSZs/8eGQ2Z+zLsdNVWiH788vfxyRtNeJDvIb5RqCn59hqlXbJpjW/7FJHBkN6J2
	 tHeVoZ55HpTm0vCxDkwGq13ZVcW2WFYggXO5+xRs6IZuuhFTHGTbUANjNbqHqe3e4swVd
	 06PUMMtk9u7/DBXZa9Eoyg6T0spvnUiO+gDt2hrUGI1QuoARX7vVz6fWnWWDxbOagrQJm
	 21W8V+Z0azkl/W48fRMDhovzLPxn2YblImpVvLNFpnwIfATLGzIoEfutzD7d6JrpTfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11696606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11696606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dc57e2a3f2so2629334b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478813; x=1794083613;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68ZDKNjvBiemw66qi5bGSPjUFdtqvTif38QW77x1Uy4=;
        b=dsp+9Maml3qgSVpyrWuQ6E7QKpHLVHgicpq7J7yozLXqVJq3WW88ymTxlaThg37H+a
         CRPFNoD77+jgByhAnl3DuD3BpAt/W3tHdQP9FjK5+62+IDMFkQUVL2S8CleOV4DEg37b
         YAl9tCWP9wrnljXtRwiPDA7ehd8E1idPVuHm5ImU8jw5vUkB3fRAgMApFb9+hybNVlVP
         PA9t04yyA+uCJaTi6ciFk3fJM6XDANfoFCrLsvwB+7LpeKa3Q4OHWMngljW/1wuq7N0X
         lkJ968de3hJu0N1CpRnGILBSQsTWDnmcJF665SY9dDtsgwBSLQqnedwGRJtLd+vCaODw
         yhFA==
X-Gm-Message-State: AFq9FYI4CQZxihStX9lFLZqmAgsfFiVB5pb1IxlqdpvvJAQm7jB5+Q7f
	LEdhaTFoYUeruqagVvTPBin8A5QksCUNQRAi+HWEZl+6TfORWNTGLcsxxSezAb5OS7nMZ2tIO7I
	6pNqqWfjaWNCYZh5byCPWZi1+MPSh9sODnYjgQnFLekq6N5jsEPKGOpa1IWA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b27:b0:4f4:fc4e:77e9 with SMTP id
 5614622812f47-5640de136b1mr4077638b6e.42.1793478813014; Sat, 31 Oct 2026
 13:33:33 -0700 (PDT)
Date: Sat, 31 Oct 2026 13:33:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6509c.64e51036.15cf6a.0000.GAE@google.com>
Subject: [syzbot] Monthly rdma report (Oct 2026)
From: syzbot <syzbot+list2e3a6666ee4387535ef6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello rdma maintainers/developers,

This is a 31-day syzbot report for the rdma subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/rdma

During the period, 2 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 76 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 341     No    INFO: task hung in rdma_dev_exit_net (6)
                  https://syzkaller.appspot.com/bug?extid=3658758f38a2f0f062e7
<2> 215     Yes   INFO: task hung in add_one_compat_dev (3)
                  https://syzkaller.appspot.com/bug?extid=6dee15fdb0606ef7b6ba
<3> 3       No    KASAN: slab-use-after-free Read in debug_mutex_unlock
                  https://syzkaller.appspot.com/bug?extid=ae549381b4daac2895b1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
