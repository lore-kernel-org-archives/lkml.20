Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460824;
	b=0md63bMBjwUpvc/vROJM8YTcYAwqlR4SctxuFY1AAchXhDF54fUKPemwthKfRNr/jHak
	 tyaEjVPu+9TqokgmtczDFNtnFuFrCrpZbCdDuVVqhv3j7H1g2w/ddeawkphRiDFz6Euvj
	 9dsjuuHWsYZy5x7GYzgtbLwpssCvt9TtFpVfvHV45TVXYU3oL9HqM07OMOnQA0XmB8jLE
	 JwiN12PLpFBM/nH+9bH/HqOvHWvUFCRw0JDA4rifKJzLJodRieiu9vBvFeTbgl9Yd/GiC
	 XLBGOg0wnbbT5sFQ/31RqFuWztSBtWlKDtsCNsq34B4ncndi1Ts30YLQ+itaHv0xyFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=7STOy42Cz/hQ430uFmokc//Klg57b2aYvV2VyBR4bes=;
	b=AhYAHOESR19GP63+D+xwaKKYsrMCIhc2B9e3hu6+rXbgY6S91CBwn0055fwc50nT/NzW
	 sFO/nQY3OKFBN9mAKDJxmRsl3VGWFyxxJsiONI726+iRx78y6x52MhsiaL4KtdwAYDUm5
	 h2TJoTwWDSAKQGb5QYD1mQH00QKfDKZtN0aO0mhF877GGKA3XD+QT6Nuom5pn8DwAMoA7
	 vfZjhF22BdypLDq2beOhUNGSVmekhmjkxY1Zs1e0lLYvfbqR5+O8BDTLVF4eo5TRCX59u
	 LLb9HydgxolyybMoxQ1QTj92JvLh/UtPrUfEFLWg4uBBjwr3OwXHW5RlgP0QZK0VWkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44499606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44499606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8210034ccc0so4858338a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460823; x=1793065623;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7STOy42Cz/hQ430uFmokc//Klg57b2aYvV2VyBR4bes=;
        b=Sc6Qf5j/p1gK7cHWLIRlqXMpmdiNx0igulx/d2EAAjfrPNXB3J7TsRICn+66QQllYG
         uGLUEpbt68GSL+nmTckFFfb+53Ymr62zGh/qe5vjirlZ+bjoYRmJcdFVUfPG1Ws50qLZ
         8BWgde+869CklCeFR63sfV2gT6PiaN4PSV2n5M0egD6C7CVmrwvtqG6R16deMKV1QGDO
         J/uCubDBhmLxL6WQba5rOvs6mmn6K5SjJP6N23Ky5XHrgDnMtoFuQDc5s0WH0pRv2rAq
         rOt32JDFOfa0DSsQp3tM6FcXuH3cpwOshYygsmv/lzSGhNci1kJLI/DJ2BUMAdxtETQJ
         bqTw==
X-Forwarded-Encrypted: i=1; AKwUvBx8JGUekQDlIV0Ee4gK/zHznMa7NaJ6HHKxvGriVtWtOMVk1su+X80l5XDClgsvgwK8m0A8agNBD2qVQ2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAa/Ma5IuX6S77/T55cxLbVPTPrn6X9AmhQhRxGDrwQrT3kyGy
	jaZyGcFh7a5GRWDYtL+QnD1mhsQCS9Jf3RiWyxO737zC0UmiUcqlRjR0flxnHM/WknDNLhhS0J5
	i7VdIZ6AgHV2B7kBtnQbJ1Qf/xx93gBDLz+TBqJfBRIASQNKlAnYf9rrLOx0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2224:b0:4f4:fc4e:77e9 with SMTP id
 5614622812f47-53ccf4ebfa1mr9353603b6e.42.1792460823283; Mon, 19 Oct 2026
 18:47:03 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:47:03 -0700
In-Reply-To: <20261020003748.20847-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad6c817.f84f00d0.6bdd.000f.GAE@google.com>
Subject: Re: [syzbot] possible deadlock in lock_system_sleep (2)
From: syzbot <syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com
Tested-by: syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com

Tested on:

commit:         32c52ec8 x86/insn-eval: Fix shadowed segment index in ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17ef3831580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=1f0fbc2561b3e5d51b91
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=148f298e580000

Note: testing is done by a robot and is best-effort only.
