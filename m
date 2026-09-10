Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA43475349
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041726; cv=none; b=AxHHhJ+HivvYSZLslo/6U1onn+CvxmsVRZOPpKSImtkJ15tsnDJRR/NbYKKK4j+6uVLYXD0o6sdRu8uSpGRO4C86nuXrMWglKTOqo3ecZESk9pT9Ml0WUhdwnBgYEEJWVMq+HdtTqmcZUjRG/KrJKsdRx5bAuP13HKmN0puljjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041726; c=relaxed/simple;
	bh=X8GGF0zuTwZJtgxrmAUL1VfJT2Q1yq9+iZVKj9zGrF4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=p1sczXPlIu6eOnUoGZ3M5DL53Gkm5+7E0bR9I0Q7vv1nXW81CXZLhFTxEBYlpjI5jLJjl9WgbR2rznmSYUxluQo38W42zK6ARbKQxLYqZwaNbu+zMMMSznuiaeWtNlyqtP0JXhWLUCsk/QtjbR/HWC1/kjepSBwLUsOefFhgbCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b36cf0d9d3so6572213eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041723; x=1789646523;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lpmsmQOxTjQHOMhQwUtJewTt/ytqNno5WExv4VL3vtg=;
        b=h5+JaZxaOfLjAgmO/agVEE9NDyhwjiIwV0yjI3qPGYwqQInfTOC8GhoqZ5vaDbauhx
         aB5b62FJcS0mMP6A16TkMzoPBhUEij7LsfNC5BkOr3tdX5nhaCkPGerFVox/3VTEk9ai
         DBg4JPX8sqf+0p19zGwYqk9fEQPHsQ/VlR0Nojlpy//sw1REU4PIZIuFVkeKubAJT00i
         Lz5llTtVhdZQ2DUuHXB5ZDUlcJ00bjogpLSyNdfgppmzwIm79T7v5gGqfQt3VqEdnExf
         xCC2rmWjQH58JQeLUq9kGwmGx4VBXFQOymG7S11I6garbdKmlX5zlowMPtEOdBhSaYSw
         kz9A==
X-Gm-Message-State: AFuF++krbTNdVk22lmtqPQzf6qeXhUvPCfsZUrU0i3j3Xm72xgDO6P4a
	JSA9331CS5IircLBIAtrBtlzwZk+F9zkoq+GrsdCzkzPXr8glmiBIY3Ic6qTFoM87EDgS8jgovR
	0l9HC2OtDNVvOXbIAkyVxH8tCpVQv+JHSQP1lxZuwdU19TYprsHHE2cTB/XI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6aea:b0:6b1:6f3d:2068 with SMTP id
 006d021491bc7-6bdca55353fmr13625996eaf.12.1789041723100; Thu, 10 Sep 2026
 05:02:03 -0700 (PDT)
Date: Thu, 10 Sep 2026 05:02:03 -0700
In-Reply-To: <20260910114832.20899-1-tahasami8@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa29c3b.f2639fcc.29487d.0016.GAE@google.com>
Subject: Re: [syzbot] [trace?] WARNING in ring_buffer_map_get_reader (3)
From: syzbot <syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tahasami8@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com
Tested-by: syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120ec1f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=de3d7f9bcc9212f3fae1
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=102eb749580000

Note: testing is done by a robot and is best-effort only.
