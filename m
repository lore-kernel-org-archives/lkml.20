Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993C99463
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381022; cv=none; b=eIHGFORCq3YdkWFAc1dRSbBYmy9CWVBUjmv8ddlq7uEalOm15rMcYkkjHwpZraZEGjkp3nFwQQF2dJcWvx7Z+JpzTu2dpZtSpaPJde5MTCXwwz/KJqORXUSWd1D1fbRQbFDHGu7eC2tuB170lYwTLte2tvuQ0MwyWpvsFJgJ8b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381022; c=relaxed/simple;
	bh=QtSVqDzz28J+/kj5f9nh1TvvBhDcfYvZhhdFPufVLrA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=aUZcVqpN5o8lWufVQTHj4WqI4EKoQxKG2jHqLNQp9hBgUY9vU4ZQcM2FwBxKe7otDtL/klttJCMq4N4u79eMt2dv+7SzK9RlAX0cEmTqHcXCT6TQLNGxXRJHX3Vrv6xbgdjISR8bSfjSaexz1hKzCQh7HxtdpLbWvRY6rFMaRfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=DsT4K0RX; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="DsT4K0RX"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=QtSVqDzz28J+/k
	j5f9nh1TvvBhDcfYvZhhdFPufVLrA=; h=in-reply-to:references:from:subject:
	to:date; d=arkamax.eu; b=DsT4K0RXX85eSjEZmf7kHJZywvxtIgs83xopCse9ps1XJ
	Pa/GTuXbcTrdoiZ+tY4gTFppFq8DsB5l7GH9yY5dRF6wCL7S59KkJV2YBC/5TpLNVx4Gz7
	uqQk/OCzNmoSZIXBm+51Ko+CHGc4DV7ldfDZaHXQZKsKvKIPIcfEGIHyvSpb2Fmn6BC66Y
	pNZAPnyTuyVrz0wlPOb5UpEnO3CsqWmPKe/P1g0cQv3OoQJM4BbVbHUROYEAkITAlVMuRO
	217icKOdUQb5h5kFptTid9CS7OWOZXxJ9q+KWQdpHCOMcF2FHdUAqkobB9z8awa/mzVkBQ
	lYWKFpg9mqfJvG9Ug==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id a9f77aeb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 14 Sep 2026 12:16:53 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 12:16:53 +0200
Message-Id: <DLEYMPA5WF42.2GHC28RDZX90E@arkamax.eu>
To: "Maurizio Lombardi" <mlombard@arkamax.eu>, "syzbot"
 <syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com>, <hch@lst.de>,
 <kch@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <linux-nvme@lists.infradead.org>, <sagi@grimberg.me>,
 <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [nvme?] WARNING in nvme_loop_reset_ctrl_work
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
X-Mailer: aerc 0.22.0
References: <6a9ed559.6e6c5f9e.240462.0003.GAE@google.com>
 <6aa6c282.4c28b7d0.c1bba.000d.GAE@google.com>
 <DLEXGM8VZOW9.1J9A20FEP43RM@arkamax.eu>
In-Reply-To: <DLEXGM8VZOW9.1J9A20FEP43RM@arkamax.eu>

On Mon Sep 14, 2026 at 11:21 AM CEST, Maurizio Lombardi wrote:
> On Sun Sep 13, 2026 at 5:34 PM CEST, syzbot wrote:
>> syzbot has found a reproducer for the following issue on:
>>
>> HEAD commit:    2f0c1cf72f46 Merge tag 's390-7.3-3' of git://git.kernel.=
or..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D159b19f95800=
00
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8c5c3949d762=
a91f
>> dashboard link: https://syzkaller.appspot.com/bug?extid=3D4a1d521d19d632=
1f5aad
>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for =
Debian) 2.44
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1074f6155800=
00
>
>
> It seems that a reset operation is enqueued before the controller
> initialization is completed.
>
> when the nvme_loop_reset_ctrl_work() finally runs, it will find the
> controller in LIVE state, thus hitting the WARN_ON().
>

Maybe moving the controller to CONNECTING state before exposing it to
sysfs will prevent the warning:

@@ -570,13 +575,13 @@ static struct nvme_ctrl *nvme_loop_create_ctrl(struct=
 device *dev,
                goto out;
        }

+       if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
+                WARN_ON_ONCE(1);
+
        ret =3D nvme_add_ctrl(&ctrl->ctrl);
        if (ret)
                goto out_put_ctrl;

-       if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
-               WARN_ON_ONCE(1);
-
        ret =3D -ENOMEM;

        ctrl->ctrl.kato =3D opts->kato;

Maurizio

