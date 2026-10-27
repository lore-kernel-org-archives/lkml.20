Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118724;
	b=0M2IMwiWya4q2XWYWkYttI5k2V6t1GgPbtEwSQwsjiyUt2p4u8YJDiVo8CoopjifuCPo
	 1K/gL889zDz8D0UGhefhnrP3vF1IT/Vk0fWWMRV2Y0wgJZDB9bpEwbQlQFhy72SR0OpfC
	 EaG7Qn7Gj7eik3bO4ubOlJ/g+ZaIKpnWQIjavq377OPS9H9nZQ4PFgDSCKcbnlTFiSeAg
	 JdXiNmglAtxsOUW7UBeVH7XLzBIOKxIoINJ6LddhjtxJX7qF23S+cXp513kD5UJSRmoXU
	 Ih1IHVA+iskbUinsbEkqbVuJV1KIwy7v50dXG0L2RycoipnU1rXhMASK327FCXWgLig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118724;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=dbdgB5SaSuKHphrytX+WZBRqQWQZ1NaHzU0AFr2BlNs=;
	b=Gs8jx2b7orhsH+448/19t+ffDB++ZvRMu8pr1UZ2RzQUtcA1M0c/BbzIso57Wv4FlIPO
	 wBmE+PCtiJBvpH63ISnl5gKhcgJUSpqli0tFaCitqfDa8o+Iyb+0qgb57TEbFo/grsuh6
	 OF4iQXcikIpNfl7yHfcWEMbTspgxwOCdCwzNX/Bc+tT+mavink4AsSDfUIjxChm4rkADo
	 oHrdqaoJ+qSP6Qy6f933PIld3hzkpt68AdRXuePbtLS9+XoUHQyYYH1LPLeDSchP566T1
	 fzPn9fmAH1XE/P/M5c5b8PfO2t7tGvvi4JKJjLoghTdUv2Dp1g/fFtEvTxc4lOx9FNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0C1606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C0C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo1660150b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118723; x=1793723523;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dbdgB5SaSuKHphrytX+WZBRqQWQZ1NaHzU0AFr2BlNs=;
        b=RiNzg3z7Ddi702snCmrt+YdAPI6wDJDyPzdTxcWWBA50eaR7TRt7NuaH9QdGlKSdMP
         sJBHy9S5eZjCXjLq23yX3E+n7d95JRne75V6aEnPd5z7uNHShzhjWvS98eX4fa5tklSL
         7esHH5vucnOtUZHxtXmkIoiDUT7Ua2O8FPxgTmNxfndZwOt3RQKkQF6qN7fUylCtoafo
         mVF5KL1Ko7Lp5Bdh15df1uK4cqiuCJOHer/A7+imM+kzNRpVqGdHieoCiM2cz+nrM8fA
         CWwOWHTJlQkVjm+R+8+fvSlT7r/tTZLRG8TWLptY+y0QXlKyF12TAoFSPBOGF8R+3lO7
         VZgw==
X-Forwarded-Encrypted: i=1; AKwUvBwUwS/wNCrMMa6wVwx09RD4Ij3XHSHV9N1yTT/6AllcdB71y6Li46XYHDgnPOdTVJOQ55VQgbyf1dD34fE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA3m2vZvhooPvpCKyxb5suWrtCasGqOG9qOiE80aY3DpqGHXRa
	tst7NPke/DX8G+fFfKAvnIULQS9Acgm0U4byrAFEvaojMHwfyYvZwiA4Ri3mnnzmZuCD8kx9Xai
	GQUkQtlq5xa1iEkNKyq+2lqs6qBQkhnmX1iUg/Lp9kpwKhVHd2Cn19PfhxmM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5397:b0:4f1:7609:3428 with SMTP id
 5614622812f47-55f810b624bmr1716072b6e.49.1793118722965; Tue, 27 Oct 2026
 09:32:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:32:02 -0700
In-Reply-To: <7d527bf8-a5f0-4894-9582-80b9ca721b27@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0d202.3a3d6196.2ecadf.0067.GAE@google.com>
Subject: Re: [syzbot] [tipc?] general protection fault in tipc_named_node_up
From: syzbot <syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com
Tested-by: syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com

Tested on:

commit:         d135ab45 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=108bdee1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c87c97847f0654ee
dashboard link: https://syzkaller.appspot.com/bug?extid=64197f7577a09686ffdb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13016469580000

Note: testing is done by a robot and is best-effort only.
