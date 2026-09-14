Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F33648F84F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399218; cv=none; b=HWbIrANY2ltWbNej3SIWQT63T7j4CoQMp176AOKmeeKb21/K8fPGXXzBF4lvjBeXMcrc/15cTfc0YPlaR6rk2Z3p6Pj+I3F9ymJ70m6vYWg8AHvpHx0cRrgTnnU5ElgqHQFV6RNo2TxpKEL/nAeB27eLPFtUN8qmneXSciaB8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399218; c=relaxed/simple;
	bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZJgN2jHEjLxBqvZKAVX1aOqqv6OqndhmK37yibx7/KBtJKRcdVxsPCOcigOn1iAqUauKre9Z5MTCRIsaQlAtYdWn4a5HVCqrSCjasotmvBuENkLzo9CRskEmWD6daUq7UQN20duFseXgoUkUyKPJiKaucc//Kak+WXSsY9MNYOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so2585740b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399215; x=1790004015;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
        b=XATixXNnI5SMjzTqT8XNReUgi6A5aq2n8bVrQ5sj4AVoaXV6naUVAUEoxHrcQl7K49
         TdtqtaiZQbTimCUKhDydTQDTLOCxlotaZ52O5//fPrA8kRBSD+CDdTLXJMoiZOfvtOuE
         nn8+rG95HgBKr8n1Bw/aPuksRJKFrLF8JNAs8KNHs0KgRoJGkQ6Medtm6fXiUH1IrcvI
         bZP/CHGGkoxkn7V0dM0NlF9qXth4rkgTqEgJjRM4umh944mtqpKLsiChalzt5mqRrone
         yrbGq1THMkm4FFbHliE6n3u9P33sPjWIdrXqD+hkMVV7v/Fm+y2usG7LCf1qLy8F4r+d
         4HNQ==
X-Forwarded-Encrypted: i=1; AKwUvByFo2QCgZlxQw/JkW/AnY8RgJdir9rFUrgMLTqvTsBwYEcN3/IhweCHL48ZaORjLNlzdvon/RaqMZYUteM=@vger.kernel.org
X-Gm-Message-State: AFuF++n7MpG7ICM1mqvAw8sD74cEr3ODa6IZ54lJqKNOfDt49HOKyB9/
	0qJOp9YrIU8Uppf++LAK7vKiS9ojTMPjALhWmo2x2JNbKbHkfJaB4re0GfwjcFHi3dhkWr3MNp5
	bGwi8CLMCT95Qr40y2Y5TIpNm/gXl3r38r5IpnYDYBVBTsHo7XEdMlWhyTcg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:179e:b0:4b3:7c33:456 with SMTP id
 5614622812f47-4c7b39d3ccemr1826775b6e.11.1789399215383; Mon, 14 Sep 2026
 08:20:15 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:20:15 -0700
In-Reply-To: <00000000000034ae0f05e9f94c79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa810af.f81106d8.2ab401.0050.GAE@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in jfs_lazycommit
From: syzbot <syzbot+885a4f3281b8d99c48d8@syzkaller.appspotmail.com>
To: dave.kleikamp@oracle.com, jfs-discussion@lists.sourceforge.net, 
	kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, qianqiang.liu@163.com, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, tristmd@gmail.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
From 7e1a0b91e9efa8bec40fc5397ba6c4e683d72df0 Mon Sep 17 00:00:00 2001

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=885a4f3281b8d99c48d8

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos
