Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583703;
	b=GRIkpHYNkSboL+W6hMyvCHqeYnMZTKJvHZPF9fIjzajJnK1vicugRfT4Puj21XdE3MN6
	 wBiUa5Qz0Ark5rnTgIEMZnjSVrQTGbFvsvNLy+QwIwnB76/vrseavA3NBfQXG9Vv0TvtW
	 9BwevqvXD4xDiT+ltUtZtukaUWdh/OtOQjK7hWfRk2nNTzOe1fikSNZBzpiRKnCg34hXx
	 /IaDYdEw1JGbW14J2EuUSVm0laB5+c2Bb9w9TcL4Ib0wwOuEPeqwsbw3gwzpLgGTgKIwf
	 zTr61Mf6IVRLiBGMvYIWqNy3ZbhkkcsoFH0YR19Dir84rz0gSZPcCuEpsncXwBlL4wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583703;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=PtsCAQ4oJQ/AZqg/2DE58/B4C8vJHabhRKD6DgPzpn4=;
	b=Famrrxr28qbz14jR0eWk9Jdoy157O/sazq0S1kgFo6a1KUV0sv9wP0by8Hm0UP8YUP8U
	 LYKfF1x5oRwq32FyOJpPaxB/9HlJtSTCdTyifmPZUnYpZh/nkjSXeXeV09J8wOABnRGyw
	 +UbcWwCaJe4N11bkTm+kfpuH+yZYNhzhes3gV0gsmZW3onbFCWVe8uypZ2zmo3Bi7e9Ij
	 nySpWMaBadecP+uAVy9LfZWLkBqh3EEy+gjbdntN+xds2KtyJZUDVfe8N3PBiN09NLbib
	 r8V1ezaKxC5W8guKdUDOxabSv+RJwqwEY0uQJ9FcVCflazWUs0THgocSKri4JLA/pfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C7606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-809f1af7992so1327403a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583702; x=1793188502;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PtsCAQ4oJQ/AZqg/2DE58/B4C8vJHabhRKD6DgPzpn4=;
        b=HCt3lb9yjxuDSJzWPFD6zsYugRY1sBjip0xStH47tin/+z9sXZ+lXzRMmKqm9ev8oc
         qr76+0b4+MytJCOoM2I2C29eBO+AQOSHJw5avFm7VRI8dHajDnYNtAPAwld/mALUrslF
         sOsy3pnbomXrvZtNRWYKkZb+KiCPyvbUA24mjX4PLS808pvat7FC27UX2szpL2Cz5TIM
         GZxJbOCgXa7TYEshqLT5u4yWgyvNubn66boC0G6rV/lrY2Yb7B8OcJEKuUbI6iNfsjQo
         fsU/6K3OeDjIcYUZjj+3fj6OpBK7CMefw5Hn76a2WD3iCN5dEobjAYIrLxcTtbo4NqGY
         q6aA==
X-Gm-Message-State: AFq9FYImoon5usBCsNrQjP33/dc8b0Uu8mUzR/GSPDTaaWT55qcuSgtT
	/siBwQSeGdqlPuDMmTFIoAPETif1ikiALX51lFe/rMbAgngSeY8F7nifBBqtYRoilpHDIuX2mZA
	jqPfIXR+6v/XWW5lLtoLJetxNS72OwuEoUTcO+JjKUINzgLv0OkGrrLP4eZY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1982:b0:4f5:20:d847 with SMTP id
 5614622812f47-55358189973mr993535b6e.36.1792583702430; Wed, 21 Oct 2026
 04:55:02 -0700 (PDT)
Date: Wed, 21 Oct 2026 04:55:02 -0700
In-Reply-To: <871p9jthve.fsf@toke.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad8a816.bbfe3b82.1ac288.0002.GAE@google.com>
Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	toke@toke.dk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 23



Tested on:

commit:         a804c574 Merge tag 'lsm-pr-20261016' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ddebcd580000

