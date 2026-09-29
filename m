Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C781A53D9C3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703180; cv=none; b=YKZN3EGw3+t0S/sHZPHE4EFyJgEvcD8KEhgJh2IzV6+V2nndmoOqiDj8iGOav6wcfNQBk89Z9HDn6gYUJkUFwqP2Uu4HBIMCniuatkpPjofybA5E/JxsPeK39k5ImXQUYt1ZTksWbZRLqCfg3UHgsRQeAd4zDCwY7RqWGaMMixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703180; c=relaxed/simple;
	bh=GsU3FejaH5d1y9uloXlgjjuNtIBdwO73Jl7MgA1XNuo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oIIchzCCq1x8jlXO0X4JxW9a4rqdj/YXhw8ROoSz+nuC8ZIRCh4ar6X7LhByQ/JsHF0EIfIoP1M0w2vAFdEjZj7pK5sxrvPeYVnPuuQDRCeylDi9Jle/t1hH/z0dUuZZJuSQdXbNwU8iOFE3q7n61Io6Yjb121NDWL4yjVf9V8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso4578466b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703177; x=1791307977;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ktd9xTJ+mGjfJAVhGpYxaCZiiWTtX+vxJGsIG7IjMfc=;
        b=pKrtkMJq90WkZa8u17hCNc1Jp9foIkvpEzsTjRxysYbD1toXcyrFm+msNvruRS/Xm7
         I/V7v7IR7eO8WjKcbfemtmHsoJ700hSw0VuGhypA0hAqfTgFPVjZpnuReP60gqV2Eg6u
         MJJTgxABbytFIG3VMFq3SORuAwC7vlL4q83Z+LqTpH84OaFCLFSO5tH6VnZG4GGvOCRS
         y2KXSkcF0SB3EEx9507J3U5d2jYMc6Tfjj9VtyFdI5k4Jngn5S7bQyzpo4cqgZf9lC9a
         DYjEL5xpHwyu6Aq2snsGnhV2cm6nIn+/IW4+b1qky8yDxck4+a6X+LemHHg6jOrfNuXl
         EwRg==
X-Gm-Message-State: AFuF++k1bJBUu7N2trVxzGtlwqHNMUblpfA1GXIymq+q2dzZ1LQskwvo
	cPk01qppIQ7ae4+B66yy3Vw3sWa2MqGc5jgQbRP8k+AjMVsrD1CsT3OziOuFBYp3QWHJQnM2VHX
	/srYKIS5MFjremtgT1O3HVXTEOp0JQ5PFWOU9wldrkJqTxaqd2yornf/bZKU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d5:b0:4c3:e93e:e331 with SMTP id
 5614622812f47-4f06cb9a1famr229379b6e.30.1790703177670; Tue, 29 Sep 2026
 10:32:57 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:32:57 -0700
In-Reply-To: <6a85042a.4d75e56a.c9a88.001f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abbf649.80e1c6cc.1e8e5f.007b.GAE@google.com>
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

[0]     CloudAdmin 2 reacted to your message:
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


