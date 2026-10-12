Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13368470E89
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808493; cv=none; b=Xl8rgqqMme3qSC0/PR7QIyXDW/a/ymxkWcNq59PeQW6kUyrsAOp5WMraazpRY+dS9fcImpLMUkuM7kxOx/ilignP97Hifv8o5iG4ByuY1MPxFlU6blNg4Ej9JqRyiGP86596MybcAdGWuUFOY5q26zHYpb0SO7n4tQAUEwMjJZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808493; c=relaxed/simple;
	bh=Mq/WbsSiq3oXZbSRnvwfbEyk9Db45P7WGXVP+cuw0Dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FI4obOkQdo3FTnUXAPR137leYtS3h8yo+fF3h2LQWxVTEaPI9ON8iQ5Wxcgk3kud4jOZEGRiAlz/CJ16cvlHN5R5jJ2S+e2PF5hIdyFavgNemoFkMVBEaKYmG5ML6Fc1skbpi/Y4aBborNem3t65r6mULQ0pZ+/TtQTmA7vh6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LEenVjKk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V60kDlLS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LEenVjKk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V60kDlLS"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791808489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mq/WbsSiq3oXZbSRnvwfbEyk9Db45P7WGXVP+cuw0Dw=;
	b=LEenVjKk3fSiSyw12YRK/CIa/FDgdQ8LTxPO7Tcf1P/4Zj5KF5roNZmQK1wwuTmjJqnATb
	8vn2SPpOoVaa9735dknYtfBQLsvkI4eg+ZgOwtW/MliYtG8EyVfx41jJMbUYjS/hnQ3ub5
	J4LG2PzUDTpeg7pau/qov8aY9ZWY6adt4nwBniZ/313rhHYirWb2Ym9c1hv1qApndoHcCm
	X2F+nG/SooQW6j5CdRsRMfNJALD55TtYUccd7VtUh3GNsOu8biBdT7O1EJoHyk4uz7KQbo
	yFh3L5Vtk6WlU685f5rNn1Ykjzd6XyvxpH9vr3uk6a81kH8KF2sR1jc45g5EuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791808489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mq/WbsSiq3oXZbSRnvwfbEyk9Db45P7WGXVP+cuw0Dw=;
	b=V60kDlLS8AFlA/9hSRa1tCc7DtImrmuGlMkaBXchzPv4dsBYGuoZ70YR1gDCUe/WK4NpCj
	DsoKkXw9RbrXtZCw==
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, Petr Mladek
 <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org, Nguyen Ngoc
 Thang <ngocthang2710.1999@gmail.com>,
 syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] printk: annotate the intentional data race on the
 data block id
In-Reply-To: <20261012120341.12423-1-ngocthang2710.1999@gmail.com>
References: <20261012120341.12423-1-ngocthang2710.1999@gmail.com>
Date: Mon, 12 Oct 2026 14:40:48 +0206
Message-ID: <87pkxfxfkn.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-12, Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com> wrote:
> data_alloc() stores the descriptor ID into a newly reserved data block
> while data_make_reusable(), running from data_push_tail() on another CPU,
> may still be loading the ID from the same area. The ringbuffer allows
> this race: a stale or garbage ID simply fails the descriptor lookup or
> the blk_lpos check. KCSAN nevertheless reports it.
>
> Annotate the accesses with data_race() instead of READ_ONCE()/WRITE_ONCE(),
> which would needlessly restrict compiler optimizations for a race that is
> allowed by design. No functional change.
>
> Reported-by: syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8324b8fd984b86905a66
> Fixes: 896fbe20b4e2 ("printk: use the lockless ringbuffer")
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>
