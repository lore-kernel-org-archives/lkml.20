Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720B4BA1F1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473965; cv=none; b=l8gthAJiSOl4M3DY94oDip8io7jgAhMnwkCkAygpnrJr82THNExTle/g1WMEIf11TW6nGrT7or31jKzMeODzwx9FQKDUm/+D9waluyHCeb1BJdYXC7djc2/MQ95oxhSYXkMUmTajoG0PegQvah8rAyArw1qflrp7st2aBgV9INs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473965; c=relaxed/simple;
	bh=s/jpSV7XN0TnDFoHQNCPZZXRUOTkLv+eKz/vGCtBSZY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ozJQD3pl55yqgOlixzt4N5Bk0h0SrPGPSyTrtn/Azzfk/PPoO/GEMtbsPRgUst30D9CKLCMW284CRiLnPmP3xeBl4b5k2eNTduXAmGuxJI/5JGnNjqadtsFDHZmWD2WtyIWsyy80fwJT11hlqhvYSO1pGJN8RsSqZgfndHqxuP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46f178d813bso168811fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473962; x=1790078762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q9ksXWVQ1sWJ/DOcf+Bj53KMNB4xPoPSr82HgI8SrAQ=;
        b=090vmhRMOJrHWIOJ9LmPcOmcVP9ngW1X/13l4TSKc6VourQPKKsmMLItBdKNeQ/eoB
         TW4TkAJ79Mln3tWDB/N03w2/D1j8SeWSrwMTbwem/5x5nrJwHSLXn6058t1VQ4k5VSO7
         6QuammBwwgHfE2qvqm4iPkSUz8vitqnSGRgn+lI5M0Dt490YlSxjPK/qm8c19x5+LZFJ
         hubzPONmpG0GvPaEul2cftPQtzqfKL9bsWJep07zXacdKE6IclMPuGKbraJOgJO1U4Bj
         jwqeR8WhtHlNbxFz7m0jsYHZjknI8+E4LXoS4XBuyl2119NveWihl3U0R3CtWVXbNv5O
         9NGw==
X-Forwarded-Encrypted: i=1; AKwUvBx0YIb8xu0zxVZoU9dbTBvOZUt0lO3VkJRS0TE4Sc2NWHt2gFYixdgYXoAJi1BAa1lTmSMyj0t6sAMX9qk=@vger.kernel.org
X-Gm-Message-State: AFuF++nJXeEGzuGs47z78FrnIzHXG5E0GLR8tqVbyXerIzwcZvDUQMyZ
	T2tzR76V+X9c80okhwvTT5OClciv4PiQl3eAMv3RVOjEGEFJbpdLxwTtPunHU/xgBWegOZ1C1jT
	YQBAbFu0/qPoxJzxOLxpEp5OBSqbQ8lylS+kQbU6dOmyDJ05u72mUdNMpZv8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80c7:b0:6b3:6bc7:2ea7 with SMTP id
 006d021491bc7-6c737a25a28mr355037eaf.7.1789473962563; Tue, 15 Sep 2026
 05:06:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 05:06:02 -0700
In-Reply-To: <20260915112406.920101-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa934aa.4c28b7d0.c1bba.003b.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in bus_uevent_store
From: syzbot <syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14307905580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=147348c9580000

Note: testing is done by a robot and is best-effort only.
