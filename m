Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFE848988A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399562; cv=none; b=hrFUvVVPwpQPo55kcTYMiZK3tSZ9jtZLU0u1Dqt3b7/UMU/zdtJbF83n7wCWLFFPFZrN/lLvAJza/yiw4IoD3E/YrbBtAW4yz2YG7KjYGLiJCk0hxj3vgbDiwookKoNN8rc/0+3u7bpwPyI/lplITplv6wjE8bBH3fsg3giUpzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399562; c=relaxed/simple;
	bh=LLVhb726Wd6VctkKYcfyvFb50durPjk31wXuFNm8ji4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=uuBwEaC3QzW/2QcMril+I6APQBbU0Fxdq4JIKWKpkKxRUdbzJIUfcDxOlUwQbKHAOGS98qfb0BUUtdvPV1TxzHBGGnWUraokYL6ub1FH3VV3gDo9sph2J2x/fmNNP7EGcuRInZxTedZnkmVYLa0AQxw+EO+SKnKXnuoYF6v+0BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=FDLkArDk; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="FDLkArDk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=LLVhb726Wd6Vct
	kKYcfyvFb50durPjk31wXuFNm8ji4=; h=in-reply-to:references:from:subject:
	cc:to:date; d=arkamax.eu; b=FDLkArDkHUwCtOM/m7r3cFF7UhZKwVUsF4n+bOpX+0
	qG2yMKlc7cID72h3LvC0Mb6EjYfc5uN4kQQfZMVMjdTG1hYLaJjjEoLpZvugyTUGTFMHXz
	Xs51WHTLa3q7mXzy5zrAEFAmKixNPwh/PAKCT6dasn5Sr8sSuv3BuqTGdizgGm0mW9SUWm
	XhcoMGqoGybMtueU63tatps/agcz2ROypwGc+uY8I828LFRohFNABkUBcAiQMtd5cgVujT
	dVEBSQS+6/mljzeXDW4TkVDqQvkKaspj7YcRfitH8sqrr4ThSczXGT0KkrbyVP0FAr6Byb
	LND6dzYTXmjuftVpmTzQ==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 3fef3a6a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 14 Sep 2026 17:25:57 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 17:25:57 +0200
Message-Id: <DLF57C50HQ3U.2IK671IPAW179@arkamax.eu>
To: "Keith Busch" <kbusch@kernel.org>, "Maurizio Lombardi"
 <mlombard@arkamax.eu>
Cc: "syzbot" <syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com>,
 <hch@lst.de>, <kch@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <linux-nvme@lists.infradead.org>, <sagi@grimberg.me>,
 <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [nvme?] WARNING in nvme_loop_reset_ctrl_work
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
X-Mailer: aerc 0.22.0
References: <6a9ed559.6e6c5f9e.240462.0003.GAE@google.com>
 <6aa6c282.4c28b7d0.c1bba.000d.GAE@google.com>
 <DLEXGM8VZOW9.1J9A20FEP43RM@arkamax.eu>
 <DLEYMPA5WF42.2GHC28RDZX90E@arkamax.eu> <aqgQvIG17WgKKoFs@kbusch-mbp>
In-Reply-To: <aqgQvIG17WgKKoFs@kbusch-mbp>

On Mon Sep 14, 2026 at 5:20 PM CEST, Keith Busch wrote:
> On Mon, Sep 14, 2026 at 12:16:53PM +0200, Maurizio Lombardi wrote:
>> Maybe moving the controller to CONNECTING state before exposing it to
>> sysfs will prevent the warning:
>
> I think all the transports set CONNECTING after adding the controller,
> so this would have to be duplicated for all of them, right? But why do
> we allow going from NEW to RESETTING? I don't think any of the
> transports do that anymore, so we can remove that transition instead.

Yeah, this is indeed what I was preparing to submit.
The diff I sent earlier today was just a bad idea.

Maurizio
