Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D8189F43
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270904; cv=none; b=Pl0X9++6yqCGGwx0l7ZjSCQQsk5T+VtNAuTr3odYsT/z1A40ofg7vazuAaJCF/2N+6PDn5LG+8XJyI5npxAr1ZlPoyas3tWiHhtTwvfgYLmx3v7yhBCIeiGQn9VOZ/Ybn5QEc8uZAKP3N8nzoPXVcurq5j/AvFd+PTJx4vLfsPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270904; c=relaxed/simple;
	bh=/Pv0AAWYb0jl4hz6Ua2kexQogSdK2GmdnkdDXJC9w/I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pwlQkgMOQQTPiIFFLZiq86BRx12hV6PNVtgMiuFK7m841IpzI3NLr/2XRSyVtI1MsA2PZTQEdd6Ddcpd+nMrqUoIN55fNnnCDkMkItHibEuoS9wU/s3GhGQ0i5oUqB8bYRn1qgU28EOF9gAkT6dxU1VRl1vGMjw8cWagxDXluBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dbf4197so1126626b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270902; x=1788875702;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yWnA06NvNkhaGPIA84TZUB6p/D3Ab5c95Nryrui03M0=;
        b=OI9ZkUmYTsvNfKwVAeUqE/Ui9It5H3OhnzVmdKBPEsXukMcnAmHItVFHNPBwQsjw5J
         ENydN66czJbRr/b/bAmjw+Ya2CwIszJiNma6gQ/o80YcFloM5snbcA66Egq/BED5qoV/
         JC4Lve9+BME+mEU3rqszQj8PgDIY8L9ZGzD0O4sVDFvB+BEC5GDjqm5IbZI5CXVbToHs
         09901R8N1WVAIk549ASHOu7rf+Fd9sSvRwx/S/TOtp4Pd6K8ev4B11B7MfHvBrvzo41r
         QEi9r0FLhQQjT/vuyaWLndzVyjhKzMMq2Wsiws3bbiR2t8d67WawdS+9NQWMyhAhxJ1e
         Nuzg==
X-Forwarded-Encrypted: i=1; AHgh+RrozrgPWql8mUagg4LUpJpJByEPaAVlAITUbthQjRQ3zdu98SiVwdCh6DPaRyG36tGyw7b2OC7VL5qNCfM=@vger.kernel.org
X-Gm-Message-State: AFuF++mOi3moVJLhOn1Wib6l1kec/6Nbdps8iEWbThTlo+HZa+PKSV0L
	XmZufw0CdEEyKZ9ONXllbUPZd6Pnr/0767Q52e95COpOrTSPrd1HHtXL7MTyqvwuAl/CwkXK+c+
	Fsl7eV3pJ8QRMF8eWve93nGgoFvygSAIJe0s7Xnu30CKurWB9jhwUc1q3s14=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:d4e:b0:4b2:3e72:bab1 with SMTP id
 5614622812f47-4b3980187dfmr31716616b6e.6.1788270902315; Tue, 01 Sep 2026
 06:55:02 -0700 (PDT)
Date: Tue, 01 Sep 2026 06:55:02 -0700
In-Reply-To: <6a96d026.1c744c18.2a1e2a.26ce@mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a96d936.99c12218.408a8.0006.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] kernel BUG in clear_inode (5)
From: syzbot <syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com>
To: kth5965@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com
Tested-by: syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com

Tested on:

commit:         786262be Merge tag 'edac_updates_for_v7.3_rc2' of git:..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13096779580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a22d2472d0d324e7
dashboard link: https://syzkaller.appspot.com/bug?extid=fc026e87558558f75c00
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16a84779580000

Note: testing is done by a robot and is best-effort only.
