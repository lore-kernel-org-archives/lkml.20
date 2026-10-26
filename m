Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030769;
	b=nABPQveRORp+jZAhccizpBCEfdVD58uJk+XWwtIDCnZz02UAOfq1yoy1ieRsi25nTFFr
	 afovYL4dx67t8TDodeQml80vZB+rFEoXRtR4B4CrN+MatOiD2pcLuHLbS8kLWrMNunT8q
	 9cSYHscr23//s5kYSwcu+lIi4dsYnErDSOTNN1awKia9IM+5zUEOUcA4kFGBN0lMnzWo/
	 551OAe46T4fGE0yFz5xJZoxMWFLhGg3k0tLXMDKhnj4Jm910c8yclv97z69pUkR1sFEBY
	 odv6oGyrb+xZV3OVt+RzmA0p4VrVRuKVKvzlH83I1GEvtnah6NZZB2ruYRLs88bCnog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030769;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=BCEMz2CFYveL1xoG2XUVNHrPjoSZXv7AdH+ZcDtzgUA=;
	b=JATLuIPfZzgYysEoKSofJDEhZP0wI+3AoxWMV0I+N+k0Ma0WKeBOc/ViBvDZaWAUc5f1
	 G8A2EmApGWaZ44ID8BiALz5Ajm9jFq6jQLbq1NmTI/EOPL4D6d5q7sWWN0z+sZd86PbAF
	 cKphkGcdGWqY9GNsMDEiEHTbmEQcRw+xQAx9lvedr5wI83uQ9WlRH+nOIv07cZeDGGU84
	 5ChL+UXNavkkB/3RrQiidJ/DbCvxCw3zjlmYvh1W1NoRw85qERCLJAFxxIVeTr46hYoQJ
	 sp5JqjOi7teRIHj3/IP5Pq4H6KrEhYQor9j4zXucEZqNzxqswF9071R61O4belSps0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=ErT+e9sb;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56A606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B56A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=ErT+e9sb
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id CCE9B807CB;
	Mon, 26 Oct 2026 16:06:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id D57CE2F;
	Mon, 26 Oct 2026 16:06:03 +0000 (UTC)
Date: Mon, 26 Oct 2026 12:05:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Chris Down <chris@chrisdown.name>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add new "printk" mailing list for PRINTK,
 PRINTK INDEXING, and VSPRINTF
Message-ID: <20261026120557.7f0023aa@gandalf.local.home>
In-Reply-To: <20261026160128.12581-1-pmladek@suse.com>
References: <20261026160128.12581-1-pmladek@suse.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: pouu1mg86bg4ekb1kdkdw3okw3rr6k8z
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: D57CE2F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX197/3GfyD7WWycJFt6QGyxT/aWAQHWAqi8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=BCEMz2CFYveL1xoG2XUVNHrPjoSZXv7AdH+ZcDtzgUA=; b=ErT+e9sbNYhZz9uCYaHQxwE6UevSVzj6gmS5o8aG63aPrmBFxwrtgnyX2b/TacOOYy35RsAfAxXvwkSh1wkvVql+MS/23Op4tq4+VMeRjre1PXYSAu76EMMUXOw/USmA2W8aK6jN3H3V50rKMwJP4aacuWRhZAHv5HvOtcmScdc=
X-HE-Tag: 1793030763-369230
X-HE-Meta: U2FsdGVkX1+UDiEB5/zYzCtWOGeOiaDkoPoDAXFRrkf+H4w0lE5qBOoSFvQJyecOval8DMfv0Lp4CEakGurGkdBVVj+Ep8zNnPnJnX6rCv93cXEbq+QNpqdGrPhGzbc+IdbWjhCBBBUT0isQgQ3tLjzUfNNpjgxF4vpMU0gamot3qtMC1smUhsI/W0kIySSwCMQXxrKEsEsXvIhp9XUTPz+H87cvfW1yBdFhafRGsrxqk/7fZhMxbK81mKYYC+t1fOmQJh7/cgq/J28hLN0vg73psTqoYSwchFLvp6Q9fiagNzCy22DsaG9sVlP5Lb+boUcw0Tz0bDpPiCrVoHErGWTqVLcOgAkRvcQ9VrDZGKftg042AldIS4EJuoz+OutXSylFaY2FxF6xjnrCEr/HZ5/lJCP3kab5t+SA2hO4zNFTTup1Mkups04gGDZTJiNCGBNOeeOH8gHMtpfH0fxiR+pyp0p3taW7ZCO4ySypJDSlB4ibDA3pBMNdJ9xVK1uN

On Mon, 26 Oct 2026 17:01:28 +0100
Petr Mladek <pmladek@suse.com> wrote:

> Reference the new "printk@lists.linux.dev" mailing list for PRINTK,
> PRINTK INDEXING, and VSPRINTF subsystems.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e3f9f2751fe..bf0a12274e68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22211,6 +22211,7 @@ M:	Petr Mladek <pmladek@suse.com>
>  M:	John Ogness <john.ogness@linutronix.de>
>  R:	Steven Rostedt <rostedt@goodmis.org>
>  R:	Sergey Senozhatsky <senozhatsky@chromium.org>
> +L:	printk@lists.linux.dev
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
>  F:	Documentation/core-api/printk-basics.rst
> @@ -22219,6 +22220,7 @@ F:	kernel/printk/
>  
>  PRINTK INDEXING
>  R:	Chris Down <chris@chrisdown.name>
> +L:	printk@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/core-api/printk-index.rst
>  F:	kernel/printk/index.c
> @@ -29851,6 +29853,7 @@ M:	Steven Rostedt <rostedt@goodmis.org>
>  R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
>  R:	Sergey Senozhatsky <senozhatsky@chromium.org>
> +L:	printk@lists.linux.dev
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
>  F:	Documentation/core-api/printk-formats.rst

