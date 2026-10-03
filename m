Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8C33F8A6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038467; cv=none; b=vCeRGex8eHOnL1iU1iic71uMJ8CvBwcb/PYiDDX4EHdU6wCYTxmI3Zu6JwRDWQpJvfLsjugOqgJSNrHje6+YNzJzde0vqD0NEZIhHs9DgWU9RP+QCk+3DhvRBfZ8T06FujJOYH1slZePzl8EbuNaHvhCcH3+LxWMiLVomLNvN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038467; c=relaxed/simple;
	bh=XChuEnSfNHTS6zyLngara+JRg3Uej1pvbLzumgeppwU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KpFT58sYflHErgHk0izdH1wBsO2eoOfCw2+PKaAXMsDtbSVVMXSgawJLUmoceE5DXdrFi80eZZM8pFi/p1bSr6MjwzAO8nIsAWpDtfAKk+rDR1uTXRYPq6Jx8mf9BHsUojgHVCj592qLAYbUFqWQ9/+eLp+04587V3EKwBgwPv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-815f2b1ecc3so480207a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791038462; x=1791643262;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NpJhh1kzP7ZnpmEUUxuoBLlF7rtv/ASxs81FtSdllR4=;
        b=z0LkQc6edTPrFdbIZjee+aBET+H53dh95Cz+CgaKX5Fi9l9e6XUVmkVOqrgNiDzBKF
         1m9oNn4zsgZHcA3OPIqDtt4EnyAnu/l8ruOFw7VWYrtkD9W4ei8Cn8dKzytXiAahZu92
         JMoAaFWf4yOsJnDAPE0ENMPdze5tBMePcYrJr6QkYvUrJtCF9XccFqOnaSpck+CUjws9
         klngK8jDtvAr9I5W4jzg6UiRkMIm9ssG1LS9tambdVhUlONJrLyId2lFBPZY1MshZ8/f
         8uoGccfHDHtHrqzfrMaW7wTtv+vPdBX6f1Alm6ZNozhbmankO8c0P0J60e6yHWVjprH8
         UKLA==
X-Gm-Message-State: AFuF++kgla1/MHnkZiSDf6U45T1woBLf3eKyvULJNMx8eushNe0fVx/e
	Fa546xZjQPnqKjijHNNHF3ARxlGrDdnKRco4xIOQ+uO4y60l3hI55RXRAt4A8DbCfBd/Am3VbMs
	g41AMrM5ax/yQ3X+B/xoL0UOChBYTzoWG+0Odrp11rMjm2HS8jVF5qYEtgS0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2f0e:b0:4c4:73ca:3edd with SMTP id
 5614622812f47-4f5290f7088mr4632224b6e.12.1791038462663; Sat, 03 Oct 2026
 07:41:02 -0700 (PDT)
Date: Sat, 03 Oct 2026 07:41:02 -0700
In-Reply-To: <20261003130520.3743-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac113fe.9ad129c8.3858c0.0019.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in md5_blocks
From: syzbot <syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com
Tested-by: syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com

Tested on:

commit:         f0406245 Add linux-next specific files for 20261002
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12aef035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dfd189b706ddeebe
dashboard link: https://syzkaller.appspot.com/bug?extid=46bbbe175b7eea8036b8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e9d035580000

Note: testing is done by a robot and is best-effort only.
