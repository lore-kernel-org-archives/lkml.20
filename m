Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586823;
	b=q6RnjkuGcgXyCel5b3Ee+iQuNzwcWkUfNmDkKksMnF6ExNLHF+1dlj/uGX/7+TLDhzmW
	 ytO49ZisxhWs2z64uwN+il77DPNI1yz2Po7kt1bclIA+/hhU6N8sMBqV2+SYu9lklzbKl
	 glRCTAtmBqZMxseLzbhr22u+sqDlX2IMHEDrsf2ZoOs61cGyoOiJChQ3+IBOuvBJQiBKV
	 X3uxnx9IUivZbAvcq0l7N4fYHFYSe64wBOwB7DmDMHRX1lBjmXMIgYt56n7a7GYXlU4zE
	 aiyZekjEo1mfrpzYU74CGgrUBDu8wBFmjPhHCoqWyv9nNJl1H/WK9rG27+1nYh2g9lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586823;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=JZNiRY9lB6F43bH/gx5W4W6/QVW1bWwPzF23O/V/U0k=;
	b=fOb2317hYolTcEgvp1WsdT6xLq3VTtIN540twQIJ8T2ZhQp45cdOK/WItunMXJCbfvDS
	 yoDSKnlUrjTzRJQg+qI0VA1W3FxwX0hwmj9xDefNmf8Y4gfkwPzFCNb1VxijgQYQNcRLM
	 YR4wZuBFUOW0M/Bv1NWHhE4ek3tzQy+RZSN8MzXw08wN15nu+Z34lz1L5gf7ZuJrz1ngn
	 QIulrjIadaFaR/0Q3L61xuHOq7JZ9F9u9Ou1DKRBfbkh359jAuBE3ne4t1nmzgIa/Gg4l
	 0zL87Pl4MwqrTAPNCA5k+gobKJFNq3l7ja/OmhJOBMGDlUtp/uLH3rhUa+rtoH/v/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA9B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-482966c4f4fso2761024fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586822; x=1793191622;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JZNiRY9lB6F43bH/gx5W4W6/QVW1bWwPzF23O/V/U0k=;
        b=KwgJlIdXbDc9NN3Qi7I5Vi9Hw3zBXzeY9/VG8MYUl0rnOluRIpLHaO+duV1xwSWjjb
         7W/G3r/mlcNYZrc5JAdAxuNZV/HmDK3AgyALp3ZlszRehTGVPdPfdSmSsC/513HtHjmb
         SwQV/nUpIBOt0nh2aoE4SdbTqyGzEDXq8F5bmVj3LIge6uT1DElh9l1c0V5JPc28scsw
         bLDXQkLv+rMS+4L5hKBzapktEcxld+OaBILz6w0uBkjznkfvnidAMViVTZ97D5vZdFf1
         pkLIH4HxLeVfGDZlxY5UJTw9RePTAcj79MokWVbqKWZ/rSGo8IxSnLAFxIIeNYqfuyy3
         4YEg==
X-Gm-Message-State: AFq9FYKMyPtWngd2+vCEs+MatP1uEeQfTENOKxZUZE47F4LgJqyaYlYw
	mlDo1CTYJX6KdjMCa4Nj5uEsUF0tT/T7nE1xsN0EaBxVt+Xtj/UHFT5mlVLiD84okAbMSg+aJQG
	lqsbtueDgEo+30g34etj/E+L+4Ko/dnqMa6a8yWOUD7swYYC/7QXXh6FqDsY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2227:b0:521:561a:8e8c with SMTP id
 5614622812f47-54d95a68cb3mr2636467b6e.33.1792586822200; Wed, 21 Oct 2026
 05:47:02 -0700 (PDT)
Date: Wed, 21 Oct 2026 05:47:02 -0700
In-Reply-To: <87y0brs1mv.fsf@toke.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad8b446.de8cc70a.2b6466.0000.GAE@google.com>
Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	toke@toke.dk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Tested-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com

Tested on:

commit:         a804c574 Merge tag 'lsm-pr-20261016' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14f11fc9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a37d7227c6a6352
dashboard link: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fe4a31580000

Note: testing is done by a robot and is best-effort only.
