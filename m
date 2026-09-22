Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2934383993
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051885; cv=none; b=A0UsYJYyd9EoplS15wrbDIkNrFfyx0yJZIII9UEKHiZPa+SMqW26n+Xt51EHVkAosns+xcnCRazFjfBXQDb3oXcy69wPZOLWPVpRd6XLmKPE4icb/oUhmzwI5ULR1AFoB6fMq9IMr3so5dmA29cmnXTC2uicCKhJMkrCtPKgrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051885; c=relaxed/simple;
	bh=dhFIbc2PAHt2xT7Awaj9HDJqpxd3MjWWgW89iTz9lv0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=n6I8QZZLdfjR+Q73NKaW26GwYohdN5m1KQLBdCdZxRFgzW62cOcO9qiDb6ravuUHHjXNzMtbMZHU0nK6MeERfXLkQL6m9X2zTtNgypubNCVnUtW49ZDiuoRbOaT2fzM4Pj7PwZBu4enbAC4SD/cyt01jHonYrQjyYO4wJwJvTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c153bab4c3so4274791eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051882; x=1790656682;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xpxmb3J1eUvuVQwxpkZOjL8NrrFwVDo829TLQ/HBMLc=;
        b=ubD6d72EoJNf2VJP86O5hnB4TVPMX/J5P8vbl6xaER3+T0mFp4P2pR82L5TvSGtEha
         KY/0iW5ngtgJcDWAHeRhuBlA/dZsgu3QMWsq6hXmWUgdYuhn1ozvFLhCB5EmIj25lfh8
         7/f5vlW83pQTMtUpEEwiTXOdCdUoshCV1IxT6jVkB3P1fYafOpCaorSkyVRxEFhEvX+H
         aZTSIVVXtD1AA3aU1dzlKb9uFGiv0VB9HI3XXmYMVPOHAFjiM2vRbHyFtk2W6N9GgQjC
         4g1z/VaY1OSqge2jm1/sOh5lH+YfQ5niRv9/Ykuk5+67OEjVrFiLRQd4AyUWg37/RwZt
         Df8w==
X-Forwarded-Encrypted: i=1; AKwUvBzYdDV38qQ+GtOD/guH8iqylNY2SbatmJ8NP5tlZN1na0Qq5biTUHYfF1djNoj4JjJQOxLD5L+pDbII63M=@vger.kernel.org
X-Gm-Message-State: AFuF++lVO26LGf4s8oz4grD8ZbPCy+jeyl6Wy6jQIwGkitkZLXvvPZpP
	jGBG3AahM+XYi4/RiWvBLTX/SRtxE9Zpo1F3dsjI2Gz9tYyBBNsglwHVcGaOf53oleAsHXP7l8X
	jCcNn+vne6qDd0jhoIAzPuQ7qD7MF6zrcOh6qdknUHB0o36I5NwrekrrZyqA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2005:b0:6b0:d7aa:5c18 with SMTP id
 006d021491bc7-6d18e114714mr1130099eaf.29.1790051882013; Mon, 21 Sep 2026
 21:38:02 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:38:01 -0700
In-Reply-To: <20260922041204.13428-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab20629.71f81b7d.15fa6d.003c.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_write_tag_70_packet
From: syzbot <syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com
Tested-by: syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com

Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1558f45e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b924f079099ba6e
dashboard link: https://syzkaller.appspot.com/bug?extid=e4391e0d6e7c89b8c84e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1232d4c9580000

Note: testing is done by a robot and is best-effort only.
