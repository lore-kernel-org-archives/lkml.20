Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F31A680C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750407; cv=none; b=fwBfji+KwkuWb1JkwhD3SGZshpUuC8jwCOVrDWr3QjUarS3CafJrPwqHCBFDFWugyOUfUVpFX1Jat5dIsgJd1M0q8uoAX9Q9ZFucu0/nGG/5z11xIJyni8w9fPEhDbCfyPCIuXkjVuMDOkQoih9Mprkm603k9ixCftVjTle+TMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750407; c=relaxed/simple;
	bh=c7TW1G/G0EvUEj5YeHH2fkmVl+Uy+deDJjKhEm2TEOM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=duR+tsvbarj5HfcXC/KMBAqzUzVG2bXwkF/sLt7f0LCwJJlqBoRcfR5uE55+9FXqGA6za8YDJogNInrUxACxtOEsBwnsAWTcyeEb5IW14JSbY4z/LW2Q21AiXOCmjVUrtGkjHVjRHs5SJO0ut5c91wt8p5FmgNUykljb0g9kpA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28deb7ee3so1545324b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750402; x=1788355202;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RlhJ694c41bi7bpvsI9wuMqE2WHpGmZ7CBk4gOUNoxk=;
        b=bheFo0vgUfIdPBFr+f8QkagqzkZ9cmi19TpfcAx++/J7WfAVPXWR3Ty7+45TAKOAaC
         VxUzOHyBw9snAd8EO0j1kCwd3tO5rT2X5Zx4RI35Tu6bEakVuFZZJnXVx7IZrq5oN+22
         D3RGs9kFrqZInvh47SAMFesEBpYGKuew04gL0eKNfyYcShMrgn2VLIKs17TlBnBhukAC
         yJN4J7g4OgOY+3yAfeJ3Nzv2qrOVXiKRBkk5ymgONko6gYKGx0Wm3TgcL1log4GNvfFc
         /rPd9Ty3nJVSs51ryT/hbzZw114PIUR55HZAewIx/n7r5IsWql60AyftmFMQKVq8bdqk
         qJDA==
X-Forwarded-Encrypted: i=1; AHgh+RrvgXv7+k/nnXutxAzpkisVg/QasZEwjJgvUpiChTiSUcE5+QsY5sxnHok3CYjRZerVeF5LUeRUSTPIGKU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHyDVm+9piEMPci/dZE+eDEEksHmhHlDoHow23knjlp4GwtJcf
	rikCT7QUT1qkllFuApc6xxdLnPg599w0prZyR+294FQBxoOHA5PLNpv0nRqS0CTykhNBuc8QnGh
	vmF2d3K8x/+C+CFHS7q0097+W3wRax78gmkzn5YZ14RAf9CHGqoYqULe7fVY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c195:b0:4b2:98a3:a567 with SMTP id
 5614622812f47-4b3666a9fbamr7212083b6e.4.1787750402170; Wed, 26 Aug 2026
 06:20:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 06:20:02 -0700
In-Reply-To: <20260826123529.120359-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8ee802.50659fcc.60cd.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Write in append_midi1_out_jack
From: syzbot <syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com
Tested-by: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com

Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=104ed979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=c35f34092a4bc9855be6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b36979580000

Note: testing is done by a robot and is best-effort only.
