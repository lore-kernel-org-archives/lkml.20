Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF553612DB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703179; cv=none; b=QLbG6KkDV/THgX2KCdSTk/ro5bKwhfSyX+DPsNLMOZiO9Ss5FMGbKI6AEA4OA69p7nV+T8QRU7U8SCTDR6/uB/U0xtG76ZN8j6q0DjzYCIAw68VtGgvR1IWAmk2q44/qbvflaFvx/vWmNnXvGRBBKKsfJwX6VamEy+3W/Q3ku48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703179; c=relaxed/simple;
	bh=6RBbukdhyAdbI30bNabOXKrlWLURq2LUvgKx+1SV4us=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rHfUySfg3ynuvZRGlSEU582y4y+7kWm1k+wVETcuKyzs0gQ7cNb8GIvuzYWEvIgYIH+TSGYGdbCdCe5sL5eOsRK/uT/B9mU9p8Eeww6rdaMY4YTxW/8umO5qhvnMJ4x525qOu+vLAhPS4u2x7FEa4HEz/hKnVbllK6u1ZJ1a3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c307941971so135245b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703176; x=1791307976;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byx6IfNy+gXS9XYtiHMuK+g/YXXsfkc232Am1PRL/44=;
        b=SzbjgUPlGX16+DT1mjIeSIXSdt38yykVckxF8Cxw+YmQ+xqdpmXMqMknGeYz9JUhJX
         PxCm2MXPImfAzP5yETO4PMoe7CvwcMmiiuK0/GTBpRKA4KfESEVS3y6mXhn8YyhdB2eJ
         yRP6FcIbFRl4k46S71ISPzNzraIgFnZGe8Exh/RT9IE6EhIMIu1YdnDyZiqFFfBoi54N
         xYc0Vx7rn41VbHJu2p0qI2xQezU1qpoP1wBAPa18o7DS7+tsFUn7zr891H7nii8awX73
         lfzgLwxV/Y/StQk/AHJVn2QydWy1UnsOYlWiTST5ly+9JV68/G0ZnI9MdbDLbAITVaTm
         NnqQ==
X-Gm-Message-State: AFuF++lvx/b/YFJ2i0bU3CLKpK9Nz2DgdbSHx5aDVwqzZ0JsR8trHTVh
	yv7TYOs/wSFO/r/AGpsYOG9ttuw8SxXphJtdQJWJR5ZF7GXJGBLK0Vc1ZvzE3sQLZxMgEqWS5h0
	pz7LtnUOtrzAVSahr9qeTe2Zd+gAedPaV/5/kIQjSOeliglaGd2RDdpUyDbg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f82:b0:4b9:a829:f010 with SMTP id
 5614622812f47-4f069f81e1fmr268407b6e.28.1790703176416; Tue, 29 Sep 2026
 10:32:56 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:32:56 -0700
In-Reply-To: <6a85042a.4d75e56a.c9a88.001f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abbf648.80e1c6cc.1e8e5f.007a.GAE@google.com>
Subject: Forwarded: RE: Forwarded:
From: syzbot <syzbot+e39090bc9b3cf457717f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: RE: Forwarded:
Author: cloudadmin2@cpps2.pphosted.net

[celebrate]     CloudAdmin 2 reacted to your message:
________________________________
From: syzbot <syzbot+e39090bc9b3cf457717f@syzkaller.appspotmail.com>
Sent: Tuesday, 29 September 2026 08:18:48
To: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; syzkaller-=
bugs@googlegroups.com <syzkaller-bugs@googlegroups.com>
Subject: Forwarded:

For archival purposes, forwarding an incoming command email to linux-kernel=
@=E2=80=8Avger.=E2=80=8Akernel.=E2=80=8Aorg, syzkaller-bugs@=E2=80=8Agoogle=
groups.=E2=80=8Acom. *** Subject: Author: nogikh@=E2=80=8Agoogle.=E2=80=8Ac=
om #syz invalid It's using driver_override. =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D
ZjQcmQRYFpfptBannerStart
This Message Is From an External Sender
This message came from outside your organization.

ZjQcmQRYFpfptBannerEnd

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject:
Author: nogikh@google.com

#syz invalid

It's using driver_override.


