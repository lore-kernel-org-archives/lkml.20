Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D362809
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791722065; cv=none; b=DZ8JTjF9HA3Q0696P0WpYGuoonGo4cZ0wm2ynDmf+2EWZgk1U3kfOA0oA2Vq06E7H/NjspGNsy9zdqPBP5cpzJqonntF5tcDbq+6wEBpsNVsPRW1Yp2Dfmjz9xwBI8nZgsSedP02rWi4nBcMpBXKXbzcLlTbGxkO/WiET8cSwFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791722065; c=relaxed/simple;
	bh=G754UKFgaz7NEx/Fz+VlmHiVXICSACBfeV5A/VKS1OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlpKByHJX1JARIgV9i5djswoSympjsM/hTYStEYgRc8+KtcS01D/rF5AM6n5yLru6+7it76etpy2BbkP3LWC07XmOaGGxDA+83dCMsQSEr85bChrM8DfNR5yvEq03YUVM7Eh32bVT70oRyAlHwqMZt6Q9YTHdop+oDyycFAT2CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=Bw7OXEWr; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="Bw7OXEWr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=siPbWGq+0FnI5KrM4kLpf5URwGM6GGItWiEajfGxY3Q=; t=1791722063; x=1792586063; 
	b=Bw7OXEWrV+vXP5WtS0GabMPdughG2uhSucriREiIEpUEvZe5xqOZpMZfTs8QcH4stZyz6CMxdQL
	5cTOunWqK+bB4yKfB8LJxZE67sSmh4maugXrRyg7RX1DlkNYj3BfNIO1yKzjcN/kuwSDzzpoxfpuM
	kT375R30nKHNvxCgePZNbVj/U8OM3BEeD49wejsZTbZS1D+sRtZPKBpNWz/J8G6UmNJhiYCtq8cLC
	wH1YQn+9Xla1429ME41e6JWo0EViug/iJ7f0kDruAbKP9WRoFzXMRMd1JeTJdlhuwrX+I0/b1gD14
	tEz3TWrfJBpBUtNCIugIjhTdgPN/XexKKXlQ==;
Received: from mail-dy1-f175.google.com ([74.125.82.175])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xFskw-00ACE3-7X
	for linux-kernel@vger.kernel.org;
	Sun, 11 Oct 2026 08:34:22 -0400
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso2711743eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:34:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBoKlTJBWL84DyJDtpjr/q9wVXQqkOy7s48bVaBkQZimzQfBxqhzhyiAQzBzb6SsjtntHp7ABVSQVgaE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7684QxApI3I7Ya+fT+GJdFUltnFtwIh07j6ji0xTELINkJoaf
	lFQ3xKLtYBQOqUFpeVc+43LxGY1WsBed9CoHBQeGwlaNEvixMRN0wIss3CBskzukREsuFYKJaJd
	GGOpoBGXcL0Y1mq32z6k4pPurMBdtZcI=
X-Received: by 2002:a05:7022:7f19:b0:150:3c69:2adb with SMTP id
 a92af1059eb24-16a5773413cmr8288107c88.2.1791722061157; Sun, 11 Oct 2026
 05:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009222404.760787-1-nickolai@csail.mit.edu> <ast8bJdwDYBnGRT7@redhat.com>
In-Reply-To: <ast8bJdwDYBnGRT7@redhat.com>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sun, 11 Oct 2026 08:34:09 -0400
X-Gmail-Original-Message-ID: <CADGQE7G+s1=-URpjKtB3ex-s=1sUNsz87vXarnQu-28VBo9ZDQ@mail.gmail.com>
X-Gm-Features: AclHuK_xvhVSvbExYOwXD-fCFjmtW34HnNs__NtiA8vvs8w4jM_VJFH0VGXvxjE
Message-ID: <CADGQE7G+s1=-URpjKtB3ex-s=1sUNsz87vXarnQu-28VBo9ZDQ@mail.gmail.com>
Subject: Re: [PATCH] exit: fix lost-update race on the child_subreaper bitfields
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:09=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
> On 10/09, Nickolai Zeldovich wrote:
> ...
> > but it shares the word and is converted with the other two.
>
> So why? If you turn the *_child_subreaper members to bool, then
> autoreap:1 is fine?

You're right, autoreap can stay a bitfield.  (I somehow missed the
fact that there's one more bitfield below under CONFIG_POSIX_TIMERS.)
With autoreap as a bitfield, it can then share memory with
timer_create_restore_ids:1 (CONFIG_POSIX_TIMERS=3Dy), and that pair is
race-free: autoreap is stored exactly once, in copy_process() before
the new signal_struct is reachable by anyone, and
timer_create_restore_ids is only stored to current->signal (prctl) or
tsk->signal on exec, i.e. never to a struct that can still receive the
autoreap store.

Will send the v2 patch shortly.

Thanks,

Nickolai.
