Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958486;
	b=HK9bi1devUgPtStsMiR2enxNo6dsC4yuZkUZl9mW606FKbbT68ekPMIvG0V1VoOlPkLT
	 rwRTch1/gQxCEq6EiG811jlalMQtYZBfu4DKG9xGJSTqs0O95b98FIzssiIU8wCQE8XW6
	 5Veil2VDgJC6vKJgmjkg1NHpWu+jVs9mHStdRZAkX3wEC+2N9mY5HfeZ2Py2nEjaSK/i3
	 SfztCWLjfw2kA79C/7CSowTgpFPua4yJhKDwF30mpkgvEm2L2+zdEhzDVw1GUFJs23QQx
	 Rw4aAydaC9nd9TUEGQwXiCypP+DwtiiLc2egCQFSvbUjSZVutQiRBVwA27E/IEQJ6jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958486;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=YomiIyNmZFaGLwxY4lySn5csTypPEsEzgT8H5zBpsPU=;
	b=ovfeDWRvTd3r5OjBFvBJq2UIz8IuJ9FvoJ6SY+CrlZoJ+jc2BwXqSERWlt43tMiR/Uu0
	 tsNadT3zii5cr8nItOv/1l+DuXxy+iJABPvjo/shGw0ukZTonyQAECsqkrfkqZy3Zy9VM
	 vozGfjdSe7Yg72v2bZIJm0hKFoMp+hEXGlW2gX7UDz83KjsxNLqmnfJbJ65vXFdiLRgLh
	 YddlQPoU5BX1XvXn7ggwaruvEmooho3wsLznNRy/PWmo3BkUQ5tMczzFaXiKTJqEMBID9
	 d1eFWfEO4bjXZXCvbRusQOUTjdiDr42EK3reF2+ZLaj/O91fbrBFoHH7jwBQ7yZ8diA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152C606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1152C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5384e381fbbso343514b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958485; x=1794563285;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YomiIyNmZFaGLwxY4lySn5csTypPEsEzgT8H5zBpsPU=;
        b=PqkxumfK9kdef6m6Yj6IE/HZnoBnq2slyXltWKuEqaKu6vP+8d+cDRBBwkOCC8edWM
         LAZ9wmXLnCN3z9QB/qKM9NdXs5DfhHp2Ofkqqq++fnod0xg/vPKInGTmJNiClEE+P2Zz
         3xDxvNf6YqLb/Sq22fToiT7hxnKIOsNoDHii7/zINyR/ap5QOvFcjz2vFyaSKsgaBFuv
         euN7HCc5nlMUcEFI/YRwHvyuCIhgGAtk12iIFOoEYJgq9jY1/QV49Xq9tpqPorDwI8AJ
         YSsqHW6MGUL9pqP1l50MqPRpU3fh9xSgG0ggUnsiGN7zaB+1/sXnjQbjm7jlFTFsL8k2
         5PEg==
X-Gm-Message-State: APuU4Z+eL3JFJkWiZa5C8U8fzm3jMyx4PTYmYqcSYbbkhcF/rh7J+NkB
	1XrP93npo111EnGJVfQcXwP20MQeHtAVVqPH3JTTrEuwOntp3yDGEFhqR+x7u/O0Qq79Ep5yL/m
	InynuBQ3PfzbS9h2S88D2ZGhs0dodM1Vxy3d7fC7KfJnP56WoWEqtB52Fsb8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:178e:b0:551:eea6:9397 with SMTP id
 5614622812f47-567e144787bmr1307709b6e.59.1793958484997; Fri, 06 Nov 2026
 01:48:04 -0800 (PST)
Date: Fri, 06 Nov 2026 01:48:04 -0800
In-Reply-To: <179395311738.788.2665825890109537519@cmss.chinamobile.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeda254.dadc8e63.45095.0006.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING in xt_dnat_target_v2
From: syzbot <syzbot+2e819f6641708bb6ab9d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	xujiahao@cmss.chinamobile.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2e819f6641708bb6ab9d@syzkaller.appspotmail.com
Tested-by: syzbot+2e819f6641708bb6ab9d@syzkaller.appspotmail.com

Tested on:

commit:         f66469d9 Merge tag 'net-7.4-rc2' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=158fabdd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d44b06612b68f56
dashboard link: https://syzkaller.appspot.com/bug?extid=2e819f6641708bb6ab9d
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17756369580000

Note: testing is done by a robot and is best-effort only.
