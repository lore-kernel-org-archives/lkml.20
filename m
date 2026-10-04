Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DDA37EFE4
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124804; cv=none; b=SQikXUeJuMEhSveiXAgPwAC2DnO9banIszIZ8XAkx9GR8JqxT9uF40a3GgONKT9hihuswEuIrhXcUGZjU4ARfyQeVoEhwu7rpcuHk9dQwFTcG5ojX/bJ+SOaSfO1MDKiYT4ixEXd4c6BEz3AVHL/g/bHb9IXGItMUb6VNz9FIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124804; c=relaxed/simple;
	bh=RWbuqTsrjZU3e08tAm3UtL/plK4TD1xBA97VH8vwILo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WoI4wvjTMDPaehAszCMl9+lND70k7Wu+iXYE2sTef6skvw2BKvd7dlZWc0UYS3ycBKTvOuIb/b8ED5R+rg+PQDjdIK1ORGe1zDLk4MZWXUZD1Ic5Jp5WADjRLvhxHmYzPozIozCN+JfUJFC+E7OdhrTyhSupRsCS3KODBXSiSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8233f34d21eso1455031a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124802; x=1791729602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hErthXyN5xbSqFZjTlEhJ/2hSf71CKE/a6NDbQLbLNk=;
        b=Qqri2K8BiHgAwhtccXzHlzjwayiVd2N1i0sEIxLKTxN1/dy99k+J/BkeLkHLHom+pN
         2QuqA8YlzrvUhW65uzw6wEtl1b0Fj8iBNhKWBh4QyAH194tB62ahAITHW+nRPJIZWdyB
         Jj6w5Zm7MLbJlPvuqemySxs0EL6m7w46FQbUQXrmpCXtULMJP5V1u0rXyp6DJ2C0ooKM
         tEpxk5McQDV2wXbhSzC7LPsfwmIUQVtjb69H9kD+WKkdjIoSESsDOVbJcbVgGDBlpgB3
         lvp2dJ8KhRpxQW96gk6J6AtfXyveM4eRQzrNbgEliR0DY6HsiGLaDJZfE6e52BC4YKTF
         NT6Q==
X-Forwarded-Encrypted: i=1; AKwUvByTjtER+x/LDqtqRuw3elMxvo3q8MQK91LBnx2mBgtVW1mX7hAncybx6m5VMJdSWzrQ7IeSew0BGJiue9E=@vger.kernel.org
X-Gm-Message-State: AFuF++naSoduFnIDVgc6/nTb/DTgPRGlM5JC32I4VabR4/Wg+xWe6TAO
	iSxEwo3M7X5koehEYWLlum7gaUTmpAfEeFIXBrvy6/j/eFneukkinRKMX8LIYvC86WJKWNwhnfz
	Yp6HnFjy1Gtteq85lBTgd4GrPwbktWn6KhXISMvkrLOmO5rPxn0VWrlMmbsg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1998:b0:4d6:48c4:a811 with SMTP id
 5614622812f47-4f52644528dmr9289819b6e.5.1791124802233; Sun, 04 Oct 2026
 07:40:02 -0700 (PDT)
Date: Sun, 04 Oct 2026 07:40:02 -0700
In-Reply-To: <20261004141152.18373-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac26542.9ad129c8.3858c0.002d.GAE@google.com>
Subject: Re: [syzbot] [media?] general protection fault in friio_streaming_ctrl
From: syzbot <syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com
Tested-by: syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com

Tested on:

commit:         6addb4f3 Merge tag 'edac_urgent_for_v7.3_rc6' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11519ec9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e5acac5c98285f
dashboard link: https://syzkaller.appspot.com/bug?extid=ac020fbb657e00356ca2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11f5fb15580000

Note: testing is done by a robot and is best-effort only.
