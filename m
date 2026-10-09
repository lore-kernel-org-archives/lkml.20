Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F3502571
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584728; cv=none; b=iPPLWuLyuPD3TcXzka5fYoeDXd5RWlh/ZKb7VDQLHW/zwwJIjOP+wBG7txQ0G4Hy7qWLlESdsHeeaYlMe0lUTPm5rdhVmAdyXC2IyxpMqiJjoBqaZkVQWUgAtHWaRLT+vbXf5qo3i2+UoP3J/Wuj8Y/W3O6vvaP+M/myuaZRXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584728; c=relaxed/simple;
	bh=wXALigrvtPeRJg7yfjB98ypcKtOUetLXGrU2Y6ExQUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlIayS6CdexGZb+w+LAmtvhNyVcGIPxERF6+KQ2KmtI6hAXWgsB51vBtoOjrBUsA3g8Htr1QfhTmkmtY7PwdkjH3rlf/Y0WgFr6HeYShSvh/wJglXrBbGBtgpiaV5fgDz4l36FUoNrxsHTBaKfQ4IJrbs/KI18K1Ijd5PI+6Qbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C0uQMPgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C0uQMPgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E791F000FF;
	Fri,  9 Oct 2026 22:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791584726;
	bh=gP4dN44w+oYYIQRGeL3rl/T6r9+bTlo2SjboTNmAtnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C0uQMPgnKgThahTL/g6+fBk/jGwVXQS1o4kbCNlU0ifWfJKzdapWnj8OzZeH1FwAk
	 0gU6qlrQGk1sMVsSBzMczDpYx11NTXwggqjxv4qdC3WzzZ2w2GTc7gaDwiSrloScGw
	 ZSVhUCW2sfBWbEfMYLZPtyX1+7ICRPvTdS7gwoIw=
Date: Fri, 9 Oct 2026 18:25:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, 
	users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <20261009-agile-eagle-of-reading-698ccf@lemur>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com>
 <20261008-quiet-lucky-ferret-3498cb@lemur>
 <CAHmME9pURv1-37C+iT+Ywf2rgWgQOwVJGLG-gm7dfZ7FHOk4Yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9pURv1-37C+iT+Ywf2rgWgQOwVJGLG-gm7dfZ7FHOk4Yg@mail.gmail.com>

On Fri, Oct 09, 2026 at 06:41:01PM +0200, Jason A. Donenfeld wrote:
> On Thu, Oct 8, 2026 at 3:10 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > - THE REST actually works as a fallback
> > - patches@lists.linux.dev is included on all patches as an archival list
> 
> Couldn't this list be programmatically populated? Lore is already
> watching every other mailing list. Can it simply post ones to patches@
> that patches@ hasn't already seen? Then we don't need to worry about
> the folly of trying to teach people about another list and such.

I have considered this as well, yes, and it would be fairly straightforward.
The biggest issue would really be that it's another automation bot to set up
and monitor (and react to when it suddenly stops working at 5PM on
Thanksgiving Day. :))

-K
