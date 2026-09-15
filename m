Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9903D969D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440066; cv=none; b=mMyt/yLePnoMJTuvQQt/I21CY9C1Cy46PmbvBjyJGW+GX8egKbuKFi3d+wx8OsR8n+3+E4OWI/tg+GY0IEyKxuCcOZgS9WaHu7n17HgP8b1/avFaQqpsGoCKpWZ5eLrEBWRfHpkg3YXpFGaKz+Rfb079Vo6cDgWZDfL/nhieTw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440066; c=relaxed/simple;
	bh=uL0mCcjh8EKyJceVBiJm06fA+XGrTTcfYbxNAqOWeP8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=i9RTu5vERQea3Stx1tG+EyICAfXRs+W3Dl7LP6IKpBF2UYA8OfTIGazjP92ToafVM1GpsyZ0cMx9hZJytdV/RIVY+TkobiiBhQi2LR/NEZ1vIm6DuYwXsNsfvbOD/F21dr6/xc1cMu+qp6vo5zPEQH9vI+RBM1FVMQ/MfR17+cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46a12cfc288so7011791fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440064; x=1790044864;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aR8zMiaRSOQ+ix8q1iiaVSonsvkcLynh9D9/nPP0T2g=;
        b=U8iWWBOtfFCimepUUX7unJfv8TkErvOytHp6rUbsTdswLK62LHmEbvgbeNMaVDBgQp
         LvUqJXynOJZFDrtek199ngsC3wi9c+p7Vn2AV/+dLZyM+9DVWHqW+pnauSEtzFADX2dK
         +nMMy07QczSQz0H8WjF00hmrgWy/eOxanPRuOltuhNvPIT/7bzlOKTGzU5nqUuL2/9qw
         +r+TgsWutUUu8hIg0R4Q72AIFCNzGaVElzOh3wnkUdhBKLdQcM0vPcx2IlY3/CY2nBLs
         MBHT2FE5KtizlO0K82rtfD2AHPUIJilphH2Gd5II/WjMsA5Q/2WleON4OE+hU4ExzoXE
         DW4A==
X-Forwarded-Encrypted: i=1; AKwUvBwob3GQQym5OIRcZryQEEy2Iw0YMEX0MZAbcpZExMZy4vpPCH5GxUQ7oCtm6fvsLBYO3Arqt1dNgEEGZRc=@vger.kernel.org
X-Gm-Message-State: AFuF++mYZ/Qz2zfWfzL/AFgrPvdVk/s961NLhbjTr2nPA7hjeCFHEZbJ
	Qw8D2rhCk6z1m0hVIQfu3e2ZpyTMux9TK145+vcpgmLdGLO5fhQkeP7CeF9wwdCzoPYRwSPn1nF
	kPBcq55tB4UtAOd18Avz1GJcjt4H7fepHyOQzI2nLIq64ZZbhvtM1BJuUNi8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c86:b0:6b7:318d:85d with SMTP id
 006d021491bc7-6c5418508femr5726489eaf.25.1789440063924; Mon, 14 Sep 2026
 19:41:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:41:03 -0700
In-Reply-To: <6aa8a1ae.c97a4d8c.1c87b8.3359SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8b03f.f670cee1.72fc4.0025.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
From: syzbot <syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com
Tested-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com

Tested on:

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14547df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=d5c77cabf7a3492aa650
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ca75f9580000

Note: testing is done by a robot and is best-effort only.
