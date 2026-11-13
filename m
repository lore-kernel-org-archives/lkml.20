Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602027;
	b=l97Z2bHIA/gxmsIcZLa3wYRYssTpHKJUxhFyTcZ8Hd651RNDWUzdPGMZuckhi1FjDgF5
	 hLoMCTxTj1m9hejYtg89PLkj7O5S/TzLnUiRd4ca3SkPU22dLDqOgx2b9WhfrUXrstEb9
	 vOd1Y1A+jomcwdkBpt7MxHpgKeW9ZadG66j2sJ5BL8hSXtFZQggb/NI5L1etztEHX7JDn
	 h0QWS0jqnkegS/gExclnc1VwtC1lOZAL5VRPogrqQ/1tKgNeHiCWF3qehMFb/fnhdVgQA
	 XlxvhhUzK5git7gb9JbsqYMyx3CccfHnL8IydF20gkNDpoeGq7hzDpLqbRuvs8HPPdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602027;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=iWwIl8HauuujeGrP8eubDZBpZTq0nypgUvneOZeGjKc=;
	b=Ldj9tgzC+kwZXnX99fhJbIHgLZh0M8sEPr3EOCieTikulpseRM8tfQFE2TwN67ArEsdw
	 bJtBE5AnYhR/ae5zKD27E+niQbBweuhKSOCQEnP1Zb/KKLOQg01bbcjRAGQEOHqY59c5F
	 IwVwgF+AoqKZG+QAjAwaWEA37PIJawoOUe+GVjvyB+5Ra+ui+BKuVSFuSomSEn0KEkiTG
	 I/2L543WzGlpSrqRvla6YW33Oo+jNtTNAHpKiJKT+j8a8IzOKx7RX3k/zCob3kDtwoLke
	 WmdHbBuN1Ip81Js0IiF2fxPMzDMiuasK+mPpTCMYzgu4i71IlD1AQEPO6nnjw4UIi6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C1606A8A1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1C1606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f8281066c4so1984885b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602025; x=1795206825;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWwIl8HauuujeGrP8eubDZBpZTq0nypgUvneOZeGjKc=;
        b=Ty93sk9ZlZD9CfeN8gEPMHkn+tti5yfuK5L+lTQEAM2G2W7EHyYQQnHpkdriIlwUbI
         TdiQTzkDHcuv+VhPK+EZSWbWGZSI1bOijxw0GCh9DjTiRJocCqUnFY2ftTZKH5vBQZc+
         Z2Liv06OYcKBQMVPzr4VBvz0H3h3glTe/z4rh8wsogHHZevSGSyD2DJ54kwQ1wZflsZK
         88rWpV5vMQFEuwuryawURQ+R3WWVoVRhEg3Ry5nDjcAjf9wYkVWCme2V/L+QlKDMmStp
         w9GSTzuHir4GY+yGe4uFHBYdmGL3TkZZStwrUP1IBzafmIGCym7E3mw/5tz6EPM1jTkf
         kuuw==
X-Forwarded-Encrypted: i=1; AL+hErG0UsbpAgeL73MB4t4qB/+Fnv9fYCz2hcfYM5XP4zmU6uTJTMhLA70w2oHOGDtnWaR8mCgiCqIxYQ4HLqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nT+PawbEDWZTUsdmUgLhnRfSLtXbebLoyb3gRICWKCm9EfW+5
	WZpy7gqKJRYHzGnC6Fqdm9BmZsQgPvOkmFetvXYhwXjwJ8IGSKce7Xlu2m+dmkEVT5tQoBxSP9S
	DyqXt7Ar/MPqapHCD/1JZ94QZQV+cZR8cXpMZTumh4SJDkOEtVP1s+zcjptQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6807:b0:4ea:18f:649f with SMTP id
 5614622812f47-56e5fe406d6mr3563619b6e.3.1794602025760; Fri, 13 Nov 2026
 12:33:45 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:45 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af77429.fe96acdb.12252b.000a.GAE@google.com>
Subject: [syzbot] Monthly dm report (Nov 2026)
From: syzbot <syzbot+listc84b10870f589e14c482@syzkaller.appspotmail.com>
To: agk@redhat.com, bmarzins@redhat.com, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mpatocka@redhat.com, snitzer@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello dm maintainers/developers,

This is a 31-day syzbot report for the dm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dm

During the period, 6 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 3 have already been fixed.
There are also 5 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 646     Yes   KASAN: slab-use-after-free Read in snapshot_ctr
                  https://syzkaller.appspot.com/bug?extid=8e6fc64255334ccf3ab3
<2> 479     Yes   KASAN: null-ptr-deref Read in dm_kcopyd_client_destroy
                  https://syzkaller.appspot.com/bug?extid=a2626a25eb2595e3ec3c
<3> 26      Yes   KASAN: slab-use-after-free Read in pool_ctr
                  https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
