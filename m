Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD423E075F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171788; cv=none; b=Go4xLEyI13o3T2tKi7ehKAHoEVOP8PnT/W6zt5g2/mBETejal4jARvEHcMAq9Ovs0syrClnlFGsuLv4FGb0MDdynQ3EOnyNdZFO3CaJthTL+a734H+EZ/ug7HZZh16onkBHkf0058ajjuuvUblYHBoLATmG5I7y7CUfWI2JX96I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171788; c=relaxed/simple;
	bh=XR9y+2gqQixP/DWH3EIJZZKbOeL9yz2bDEhU/RR6dM0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TmqQ/RMUrWNMZt9IeWytRfzOQWojsZeOjPes8olmOhhPyYp8brTMuqokH3laN8P8WHtejLvKgSxdniUXtBwFii7GJN0I5k5PFP5N/eSk+oetQY4Hu8zatgTbpoXZSAlXFqIm1+Mpzj9Yv9luxtkNJRIV7MQ2D6xz/bygx8+x8fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b19eab8bso506135eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171782; x=1788776582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JBxuHwlqoxbEgSzSgW2bUhW9E1VlK8pwMwVMgEHY1Qs=;
        b=sU7wU+kb/KK2WwuWo8AGHG36LAm/OrfanqfvclwG295TB2dtEH1YzakpsnPwj+5NWR
         uBZ1fXi5JcYDllCEt6Ye9CzYZRsjQdxDegOKJf0q+5XJwjmlYqURkO6r+Eve9LUw48XV
         fZRhTX6lnBbD+K4ZSpmVlBeEASb4TJS9VoySq/wW155zphDCceL3Qf36w4dn7hFk9H9+
         TYC+Lw/7+aGu/NPmeDsFe1mTElxjyrvk268r2L6+23yZviMb+BbcTd0blklsnmDp1YmP
         xoU6EA7EMMW7kL7I9xeISUKxxR3rOd9nhvGUp5qxR3Jz3fN8APmdroLuKSG8Jm1UfnrM
         JBiw==
X-Forwarded-Encrypted: i=1; AHgh+RrhTs8rmYMELRXu2in90rLcislfTcKPYLDZyvqivTIdHUThLJsB5efgjeV98o0eMIJMJUduJ+iRtrITrOk=@vger.kernel.org
X-Gm-Message-State: AFuF++mNbV+cWyZd7q3YHdRqvEQTNukHq3EjHP+ihA/pLw3LK27dO/Qb
	EvBJf8y+sTk8AGJJhIYzr+SLD7CJw5ecuOpEL/nOEks5fH4zmdcfUWPRXS3fezhwzaJqv4xzwrH
	XAV1+A7iZ6VrhFV2E9AWLrt0cCWnAsQOjtqGldoeLL4fQ2iDq6reODnna6QE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:160e:b0:6b1:464d:4d1d with SMTP id
 006d021491bc7-6b1c65bfcd0mr25351375eaf.11.1788171782656; Mon, 31 Aug 2026
 03:23:02 -0700 (PDT)
Date: Mon, 31 Aug 2026 03:23:02 -0700
In-Reply-To: <20260831120320.00006c4b@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a955606.4d659fcc.734b4.004b.GAE@google.com>
Subject: Re: [syzbot] [nfc?] general protection fault in nfcmrvl_bulk_complete
From: syzbot <syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com>
To: joshua.crofts1@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Tested-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com

Tested on:

commit:         cee9395a Linux 7.3-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ master
console output: https://syzkaller.appspot.com/x/log.txt?x=15d41c15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=59d5e6a8ed04e6a000c8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ced379580000

Note: testing is done by a robot and is best-effort only.
