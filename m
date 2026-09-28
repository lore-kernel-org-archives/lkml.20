Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2D2F9D85
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599514; cv=pass; b=u0y8DKj1sJVOCHZv1u0YUKpxr6KoAtU1zeS+6mfatNSlIyOvWgAZnexPK2Ob1Kx/se/Bv3QOwh8eDoA9bgl9njtIEQrO+DMJzRn5KavLJj2miX0aKMKSh/L2yhvK3mVWG0MysAiPBmYOw23CsbkJZwo+T0yydBNin6J5TUHjZlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599514; c=relaxed/simple;
	bh=uml54LJdPXLb9Lj9vOwlme7Ptb7ND54ckXVmhxSLoVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJPTZB7/obUidwLfgP4ZqeTm9veTML2GpB6GUNEPsTuZM8sljg91SHfh+TxVgMCVhvrONCvpSvl8FQRFIuNlRMvgpPkhKACN2K+xDLEXLuM1HXWh1CqCa+2W9qk7zxUYL4BZ1xIcXqE6lAKUEreELdQ1wqXipbC8USPEZuGKhyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCCMf4u2; arc=pass smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCCMf4u2"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4c1e3be1093so1250820b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599511; cv=none;
        d=google.com; s=arc-20260327;
        b=qS5s5YTSbzxMFUuXFKuLTiO4GeC8veRZ8uChKvzPNuEh4bw++R93JdZwJzt1HSKjgK
         2jmaksiV9wzbfHMfuW5B0/FLa2w5fvKH6T+CEsfo+CmpCGzPu/F0Em1jvohNTGAmTIFG
         dPYOw1yh4hMOrfczwxIG5iGFktvfPSg69hHeLIqeR6uevqgYtkAPz8FXKKela+Jax8YB
         rZ6fAWZ/PVg9eFUwsnozsETX35RXfaRpd79Azuxg1erGMlsfkEVkEYu2fuwTvh3MtdrW
         kfLVNpolEL0GPLbwYf+rUzOVa46GIunM/gWhI7otXTNt6yFsGdZ39ihsOAEsFQBaXtXT
         kFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uml54LJdPXLb9Lj9vOwlme7Ptb7ND54ckXVmhxSLoVg=;
        fh=lD7r8qNwh+p4PQAgKf5KsCcH5Z5lK+8yrzEtxPazWlk=;
        b=NqbChxf1WtUOYFEzJioeD5v2x6FHlgPJobXlhttDOcR5Spej2XKB5QQVtwvSwZm3b/
         zXFDDNwHNxAFyHw8KQAouM94U6J9lL/XRwYUjxcTO44SqrvXLU/ipD0mp7NZLTpRNRg+
         KDV7MoausJRFGc4Kgf5Qj67Uq8ihgmeoKFnrPJEu+18Bd/zxa0Yi2ij0cQp80e5j67d9
         7+SBVyUdReOreuX5W2rIWG+ATkW+xK9N64CrJ/Ub8/9jbIueYBoksZiI9B+ZyKQ2qeLS
         VzBAebpqOEyqPZ/xYuHxBtGZ0MQnXO8QVL866E3dQCl8MPOWWxNBuhCAWTLnJVQdOfn3
         ZT7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790599511; x=1791204311; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uml54LJdPXLb9Lj9vOwlme7Ptb7ND54ckXVmhxSLoVg=;
        b=WCCMf4u2AjHud1qCNQ0sC5XzY75zPL+xRzdxVkKDRUooLOnn/6Fi59ETIN+zeXyXK4
         0Uej8Q+ZarRRRnTVJoBUY4TRiDBFGkFvvXOrzCIdPG4c2MHYlpMYsrcOhZofI40Rt8qj
         2gs0KQY6ycDs1pH8vy96JlRoAO8nSl++eOpJUojuIrlJyj668PCdaZ+bwuMw/gElBT4q
         tUuKVEVhNvDWZDOuaYeoYKui09K2oKxKLxLtHe6vY/HMtKnQaE+QkW9e/IYjCjccN2rL
         SDIExMwB7ajK6iSCjdPdw/aNyDErSpvwFMt4P8szLZiv4fioYzoFIRtWJqfUNXK2oVNs
         cLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599511; x=1791204311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uml54LJdPXLb9Lj9vOwlme7Ptb7ND54ckXVmhxSLoVg=;
        b=x1otOkOEzCH8oe2uOY+o55dGHkhxFLfVdaTeibFh8LMXqKoKGw/Jk3Q0YgQPA8IEGL
         a2y2SuDxB7qbO6UwOxAmqa7y4OAKykeZzdLCL8KDAqS2zJVvGcfG80zliM603WsMnG/F
         qwjWMYl36yxb0U0PWa8zBGiDnX4te1gcS/NJhqmNqvqhNppO3LO97A7R/PZ8zrPcr8oi
         FK1U6doc+n+ZiLz3yLbaGE3OvjjXKkFLrBqyb3rOEgOPXvXquijxX8RxXHJNKI3qtkvG
         m5VXC0h8A8b+1uqVZipo88c2cInpnSfsyptlcYtYUNqVprjxiBqC8uIhOLstm2P8894N
         Jj9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7nvajtcomF042VYpo6ORronxMKeHbJjaWi9hz4Cbe6GiqHLs/Ilvji2/f6+Ud9byZEnqdLdLAQDr2r6g=@vger.kernel.org
X-Gm-Message-State: AFuF++mgUsYd/IVgVL4/VVAMhGhU1nl1pH/XinYFH6o6Ydnj+YqbikIu
	RZpAP3tC7LAyBFoONpKyKxROK49J9WaeAwhLGsA1uOvmt9Jpjhfom8Jg62GRU/rrSmLiPmSc4QL
	CLHoWUCVV16d9SLIhEMjhIL7Z4aWtqFwJsTHV6zsR0GtxbrALxw==
X-Gm-Gg: AYBFou3iLEFdwp9/aGz1yIz383lkH6ftoZoT+k/9iuChx+tLDauuCXuvOANxtggOyEP
	yAYHICbUkHPUdWldDeK1e2alfrHy1tFjQsWUZOMVRPd4NFwX0HBfabgPjQDkNqrpODwy99l2fpy
	3uq6nhwXhFL5JPxuJ3OREEFDChvpR5Gc8pquiRJNU20VxZ3gKyQrEejhE7X7x5FUSQvN0uL3QuP
	WauxRKL+WjEnF1msG8ZamPW4Le2Rpcrm1BppRPoFUj4FGR6cQ50p8wPX8ufTBjYlzro9Oxw9Wlw
	XMfsOAl41Q256vjt2QvAyxn8zsC4FtvjTHVs3myBcdybtVXZ8m2CGYV2IVV8IAMkyabx0ieJG62
	tpvzSda6EqzvEjKjjBUzL
X-Received: by 2002:a05:6808:4f2a:b0:4e8:92e5:db3b with SMTP id
 5614622812f47-4e8930466c9mr5061632b6e.35.1790599511413; Mon, 28 Sep 2026
 05:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANOyQmEg5abcMc-Xk6=2hQQWu9vq9wevGR3spe352QLyxsZNEw@mail.gmail.com>
 <CANOyQmGkGwSkwUj-NOKzhQ_mgapoqqoOLaqXaGAjWK8jiknarQ@mail.gmail.com> <20260928122822.JdtAHH3g@linutronix.de>
In-Reply-To: <20260928122822.JdtAHH3g@linutronix.de>
From: Jason Mike <jm5905938@gmail.com>
Date: Mon, 28 Sep 2026 20:44:59 +0800
X-Gm-Features: AclHuK85xEilyaFEaA6Ff-fETSVKq3q1FX0B6TRO8Aa1XTtbukC6Oiy0wX_0q1I
Message-ID: <CANOyQmGkfZs8z2fcDa0fN508MV2aahvq4Gg41BCxUOeMqCLONg@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: picolcd: Move output requests out of spinlocked sections
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+912222e4cb82423535fa@syzkaller.appspotmail.com, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On 2026-09-28 14:28:22 +0200, Sebastian Andrzej Siewior wrote:

> This is not limited to PREEMPT_RT.

Right, thanks for the correction. PREEMPT_RT was only the configuration
where I reproduced and tested the issue; the bug itself is not
PREEMPT_RT-specific.

> picolcd_data::lock. The important part is that the lock is a spinlock_t.
> Non-PREEMPT_RT builds should complain here, too.

Agreed. I'll update the commit message in v2 to make that explicit.
Thanks,
Aveline
