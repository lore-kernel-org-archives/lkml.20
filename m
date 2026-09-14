Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702544606E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387278; cv=none; b=cEzdC6aKLbkAyqA4zoLIIId7OF5/fglpOQEz4NSi6DVizxK4J1Yo2FtkNxbWjZ+51LG46EwKxtxfjpy54elP2iLf8lyqEh7Saiy6K8xmzdk91BmPSnCMmkYnh5sa5skW+q5Q5CTA668WpXiq54zofS3OLbY3n5X8aiozK4wpFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387278; c=relaxed/simple;
	bh=x5aMY4tw8QqU9kRLnSEEtCkPI9yehfxnJ77J2PGO2Cw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JRIAxinroNUxxF2lsl1JCp+5xoEl0k0bvlz24xVis99BBwZ3yABp0BCELEq7fG43hpit7SO78bRlnm0SpPbIO/qJSMLmhmqc4R9+2Ysm25aTh9SM8x8jd8S+kbueeapiBCS6QshOhcPV30RXEQklQIomgk5olOCix/DnQPcKLQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b325074c26so4967820b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387265; x=1789992065;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGcth8Uvjk8ZBxAP+D2S8VDOivGdju6e9xYNAonmsHc=;
        b=M+eURO2oCIiVe3uAd/LBkcadNMQhwRhieeSr5hxSiAZhX291MOF11ujxJNA864F7qC
         3HEMx5T+DBwwAIytcrhp+IApbMEgNmU/LZciqNr4JxpTap+xPh4YckOQvakKw2KC4Jsd
         Sj9FfcvdWOYBIJEk/5Cu8ub3/Y7FpvxUtUHJhFpr6jJDOq3zrospuv4exh357k/OR1fz
         YtAvCVPVEkgPZGOmk5KgGwXPA5ZPlhJOwoOs+oj/hAvjZEaUxYCH4PiZ2qiIKaGYtugj
         BU9SNhrymUHmAHnHj8L/gW3nRmvsWL87e2vDAR1v0HXxhygVpnAGiSk/UiLObdSwz3r+
         NKZw==
X-Forwarded-Encrypted: i=1; AKwUvBy89i9l0aMaiksZeVy/25d3NiQpeiRNaxSNqKusGZiY46LSvN3CSMRKQ8CQPc670eho6CIPDC+8GPymYxM=@vger.kernel.org
X-Gm-Message-State: AFuF++kq+zrZowoQ4dDIdgX0PMEBliir/LMYNKlfkNyI0nmqVc7Ra9p9
	GSt3x6jAAzR32yZvDLyRLWcu5PqmLAjnOCPLmmuJcuCFlMHpPVAgQd0/gx63xWe7lAagdpYN2g3
	pgf5IVFQyldhhRHcf2haTersnd3zC2BBEi10poydG883VizJAYIpYt6OEy4k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe2:b0:4ab:2c58:4514 with SMTP id
 5614622812f47-4c7b0015d9emr1464103b6e.0.1789387265018; Mon, 14 Sep 2026
 05:01:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:01:05 -0700
In-Reply-To: <6aa7dead.a9d33702.5fb21.ea70SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7e201.3aa11909.1a03b8.00b3.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in v4l2_release (3)
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Tested-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com

Tested on:

commit:         08df8841 Merge tag 'thermal-7.3-rc3' of git://git.kern..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13fa88c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=34957180b0ed2581edaf
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16d82471580000

Note: testing is done by a robot and is best-effort only.
