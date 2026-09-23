Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE3B1CAA6D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138704; cv=none; b=ZM1SO9uzZUs+n2Lct3duLslN8UbEiOZVUSqDOEY/mEJa394cD+tDOgDpJgbeC2zQsEa450MF/z7j3iA3ukskhUhrqNm4Y1O5ZFy/CmM3AciCI7L08N5w5tky4LQkNEZNYJDpKE8wBYat+nWotyObiaRF/1UpMksXOBb1NhnaZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138704; c=relaxed/simple;
	bh=v0UPaEeIVYW9y+zmrgHjD6kypNi3ds+bQeTSzKFW7mY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CoCLPSWiAQN7VQ+EErlymgxXl8PDpZKY1i4ffCRxrXtBU1ta5wakj+VSHb6mdK3xRBoyxgAZuCm9BnCvSz/mPjN/akmwiAykSyzQK+ptD0xEYOwKes7U0lnvd5cdSz1joDsYeYDN3gnY1McSZcKLNawBpxsfLEUdY4scHJjsINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b36cf0d9d3so711829eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790138702; x=1790743502;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9QuTNmW2fodowNoCH8ZpAm/Coft76N5m/g3qWwNUgU0=;
        b=Tcc2+oWemMxSnWZtfz3DbeY0JGcoSoSusZqHyK/LYTNhm1iW/vPHrJjyznCw7g8fvh
         g6ASC61C4Zi7Y4xLtNvRguRVpndC+YVOBXSuMy+38Z9Xy5xGZXIM81q451F91SPZuGfH
         AXfjXV/fG55T4KWjIKmsnO50xvXnDJ5jEP4PY4MgA+6FHiHTFQUpQBFTeLs/YW7cVPqx
         b081RLM4+m3xb/j5O7znmeBp17vwa9V9YGRK8BN+7prhTltrXR+fz2go5E5hqymQLuQg
         7kqqwuY/96tx2MaVaIGtp9IUfyoBthofHb+7w38gXI8bi0QnBsaa1YnBcR7oI/ATxb/0
         e1/A==
X-Forwarded-Encrypted: i=1; AKwUvBylUw1Y3TljQtjVJiFdUa0awaFPkDlBTtXmPRl86z0lgD6UoCkzKPjMy158OQv2RLK1qrJDqGCo7GAQHoY=@vger.kernel.org
X-Gm-Message-State: AFuF++mKRjSrJllk+8AaoQsfCS+7Ys6SHuzkBHBTbHm2HDtt+Vu/PwOy
	WktkS1avF+8fSK5Smf/OvZe7PPzEXtYOSEdU8N6Ck1JVzKX1xASP5OksxihL5RCpRoqrZY98GPw
	rCK5FuBvScJlTeuEfvMghqUDAPvosAJCh9ewR8sqbvIoH9g9HKeymrOnaHKw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:83d7:10b0:6cd:3fdc:6008 with SMTP id
 006d021491bc7-6d2d3111bb8mr978365eaf.89.1790138702117; Tue, 22 Sep 2026
 21:45:02 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:45:02 -0700
In-Reply-To: <20260923.130856.432118065581122588.konishi.ryusuke@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab3594e.71f81b7d.15fa6d.0049.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] INFO: task hung in find_inode (2)
From: syzbot <syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com>
To: konishi.ryusuke@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com
Tested-by: syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com

Tested on:

commit:         89a31299 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11508d25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4c311f3405f3ed1
dashboard link: https://syzkaller.appspot.com/bug?extid=6646318bbcf419411bc5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=112d8405580000

Note: testing is done by a robot and is best-effort only.
