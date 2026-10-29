Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282944;
	b=Ch00bGYMeu0jK0As3k/HgvGK2pt+Q5FH/2tDmQJ20l44QaordJWDcf4Mix/+mWy5NGYt
	 Ym85Nh6xTTqEqBzkP19QFANLbpGDybbyj4qvTG3oVZQQeENOWWj1PZWCuny4k4p+kXiEt
	 LXwO3956KAvz+3CpigIP08+KV9KfJb9B3Azc3DhLkNhLSEs134YHjlXzbc5NkqdQNk90Q
	 BP6irD4G0nXEz5Wq7SEqO+snb4sQM3Lsh3BPXkT4+JgPkMGSWWuzDBdfpEOMKo1XbSNz1
	 FowkylfJGmdD1geyCggUSNslddMvxpT3kbukk2UsqheZXfYfFb+kUSCkRoDo4L/Gzrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=6aXSrY3A4a+657KqfeX973w806JtC78lQ2DbAnnMFB4=;
	b=qi74PFi3sWr/pwSXrVN8TEzw2sTuZY72n9Z76kEZ5HUPz1Q9XysOa24ZZbiiP3qVmnn9
	 0aGoTEi/j72wBKcSiui82Q8KgiMhh7uXqht4Bhrxm/MyGxibHMvHdZTJXLy1G8u9ZsXkv
	 e3Hen5eHc94LmZBloin2HI5/4vfXcOLQ7/OkGHlW6Pk5CGA5wh+r8Ty5X9ADODkeh8Efq
	 5E9RvblDVRxrk0tvWonHJ0hrgAIjASiPDQ2LnxjLaEgLtvRS/QvX/TtvyJtAN5wX7Rxl/
	 MZGr4AUaRlWS999ClyuRvSMtraQMv7w9c0LGQFNcYFj38R5/M39/SgY78XTjeWqySeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD3606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FD3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a41f46d629so2955125b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282943; x=1793887743;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6aXSrY3A4a+657KqfeX973w806JtC78lQ2DbAnnMFB4=;
        b=B3MHUHeEDerzTkSKgy+Pel3JPDXx6wyerloQCJmzCau0b7XPG+VhEwWnJLDMsJbERK
         V5B7L/QuM0xgczp5CqevAlKWEEI6V3WMA41gTXAhwGV2K20AwxvYcDFMEQ2LfWF+s5zY
         KUWv/N4oS27PNMxBwkvF7I5JdbnybzhHteA5CAZ0qPAMpw9SY5rPpRhXkXKqtqojUWPN
         lABfeq79XtTgLnPcK7GW5ARvDw/Jyhf8OINb5z9BoyaQHJ929FIsy+yaiaE62GklA50d
         UI2e3P0wtH5GdXsxkvfbCFM7HKd+KAVWO4mztGGy0VEHZe33Y1tUXc/Zu82o/FecksES
         6A3w==
X-Forwarded-Encrypted: i=1; AKwUvBz6x1yhu44V+7QXDOUtCgPk5DzpaJbn2t/goUjPaGtEdPsIW1LLfeZR3tY3b3yXG2XK87F7fg2de+qIHbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxObXcQOUAUYxhHgv5CZs1aJDyxDkuHJPbmrqQkvTVNSD63DVk
	dFKwuL72KKnUXlqPP5x3NlXZfrNM1JctUbraZ8WJolKyPokA5R4+UqN4zu+Dp+abM0csjJFOuDB
	F6mMEO21l4A/do93/W2X2tGxSEvJxRoPFCll5ENwiK17VLchkGUWyhrdkwwQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3094:b0:4f6:ae3d:8230 with SMTP id
 5614622812f47-56386c2cb42mr4046507b6e.46.1793282943163; Thu, 29 Oct 2026
 07:09:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:09:03 -0700
In-Reply-To: <CAA=drAqs-x4PdFAJGLOL47Nwrp-AhE+-L58oAg8mAUqBUD-8Cw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae3537f.55b94f83.31f4d7.01a5.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in setup_conf
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 11



Tested on:

commit:         c339f401 Merge tag 'platform-drivers-x86-v7.4-1' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1468f08d580000

