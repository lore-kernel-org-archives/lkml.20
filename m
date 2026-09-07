Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D31299959
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788822305; cv=none; b=K0RIke0L14ortbYZFFaOfK1OtDOGu9tXm2melL83SWMUfdCf0koRX/DIfxppgF1NJ95se4ETvxhaF9jYkH7tfROVmHmbGTDbIFZUCZizN/9XzdllPyvunsp55ic5IhVzB5FRdWunaHdXEI46e0DVfZtEbqyH+NEUeG1lyyDB9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788822305; c=relaxed/simple;
	bh=2bYbdvG9aExcBH8iiQjekcnaWefTqRMuCmCwSHJh34A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Uj6i17+EXtZKFkshxq4pwd5JD5abn/8OCwJ06/YyUItBQTIXtS/CEUN9gHe8qF+h7cP/BUZc/Op3WqWTso2HIPggSNhh4HP2r5ClISDSZBqqElbVZI9aullB/g15M6a/WfZ7Jkh2xSRn3nbUwDF1+FFhpZJeIlvXLAJg7U04Sqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b7932ec2so3623252eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788822303; x=1789427103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvG4ukCQyp4TCooKEPhCpdiYKUNDzT6iMt4/nSDw7cQ=;
        b=l4Az6R6NtDIyhH1hobwicNb7uRIvztD5kk7A7hT7BBRQF9bkNw7P/G/sXx12KiyFTl
         WpTkNeK2RPFLGXiRJ6gj35Aiycc86SJRrLFaCK0WtCn4Yg7/ox6YGWoYn/Xhz4WjkgPz
         YekgcvITYCQWGal6jLd0iCJ/MLuBLnWIow9MJ/Sex9YczD2DBKXITwyUejxbjuJQXeBM
         PT9DJpEXNnMKSHjPG2D0uos8WAA8+4dLBchK7Lwz1Nys0mgIugjBdJNOcbp7DzwmN/lk
         W0LvHkf1t1Nxld3AomG260JyVzH3bLFvRTxa0tPtWddsvsji8OzeSmswEcp28ZXryR8g
         ZE7A==
X-Forwarded-Encrypted: i=1; AKwUvBwhg9Lefv+9h7kxCBNa/TmYsQ9PPyPRTPPTanA60huRJMKk/tD2rY1xSoTpBoNNmMMWJAE0FAAOnU7RHAE=@vger.kernel.org
X-Gm-Message-State: AFuF++mAPn0oRsCU6DIbYLghQgEgXG/a6Zl3K33//ev7tLmJnNdJVejk
	0cPQ6mL0uyZlJzX6VFilnkfw9zIkz/IeRbxwflpIseoKruvqnoKy7m/AkKi6pAsmJTHbFTMuV1/
	mz9HHpziDhxtJn/8iqib3f+df8OKUDpacnWnkHg1aGMzpyxIVBpcGpvK+7Ek=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:83d0:10b0:6ba:448c:4790 with SMTP id
 006d021491bc7-6ba448c4a8fmr3451693eaf.27.1788822303054; Mon, 07 Sep 2026
 16:05:03 -0700 (PDT)
Date: Mon, 07 Sep 2026 16:05:03 -0700
In-Reply-To: <CABm9WX4MZBah37_Q5wABcyBnJJECuy5Z4ah3AD_3-xE4s9ThxA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f431f.b223f61b.7f796.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in cx231xx_send_vendor_cmd/usb_submit_urb
From: syzbot <syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com>
To: jcperdomo100@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory


Tested on:

commit:         df290809 Linux 7.3-rc2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=ddccc0c0dbc0a38ffccb
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ebdaf9580000

