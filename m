Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F151597E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983787; cv=none; b=GuO0q+4rbgcEHfZu2eurz+XgGhQxQIdka/A3i/H0UYrLvO4YABMoAZJ9t96tKkATS52FDh7bUVi1yKSUVwCYXM9nzkQhznPTyKWL0MR2m5vp0Wrk1MhQ5Sr0co9T6piaN7KNIJBeIRR8oInVq5aL1Iva9GhmAJpGrDivRmD6d2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983787; c=relaxed/simple;
	bh=837DeabTMy1BiT1h3uWhZuK3yIfYwfrEzbEU/rR9yro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KdkwBbnvwg4FMfl1+lvngegozt6SIB9GiybhlS0HBtrCuOPDLA6omK0pZccPsiwMAhOCTtkOV36U5miDM275r22sSMYgyyT/3MOICbyubu6wSSAvLMy+UI92UkLnVTSo7ZGZbJ3mV+GqlHTN+hF9qYuRXldhw4Yz1ODyrQjDFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=hTr61KtT; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="hTr61KtT"
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 995B5A7C0F;
	Wed, 14 Oct 2026 13:16:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id AAB2C20025;
	Wed, 14 Oct 2026 13:16:16 +0000 (UTC)
Date: Wed, 14 Oct 2026 09:16:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Chris Down <chris@chrisdown.name>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Make John PRINTK co-maintainer
Message-ID: <20261014091618.673d6e67@gandalf.local.home>
In-Reply-To: <20261014115029.203908-1-pmladek@suse.com>
References: <20261014115029.203908-1-pmladek@suse.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: AAB2C20025
X-Stat-Signature: cggnqm8q6ke6rjcc5bn54doqzx43iewz
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18CFtSJ5uLuzwXqjpQbsY98gaLyBlmoMtQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=n3tseCm6BrrubIa4j/8SMIkstlYQK4yQQAERvsCyQ+M=; b=hTr61KtTRZFh3Mmm2L7HqOqNkujdas5N+iQl4ZzZQzUCy/rj4XHU54dF7hnTT3rozumzoEyjAf9Pfikcm+VwZarXaBodRUcAkY9U3MDZYSOB/8yWbLiLbcYAKKHQduLFQMjiXil6h6VxVHcycyczdOPgoNpKbuCSPMNVg730d2c=
X-HE-Tag: 1791983776-362513
X-HE-Meta: U2FsdGVkX1/sIrFueXWnWyOO0gRWzF0dl4SRxsiWte1WHDYZRA+iDoJO50VtdMKzwsmMlBnyWUhbk/18sF23H9n7Kxq0tCY8uBf9mQ9EHGU8VvECupX3hJnvq/wmP5y3eFVuVgRS+QihxboZmAwapwiE6dMbcieTpIlSRD2xQBZ1ibVR33jHb43SJbBU6MgPR/bN9A7bB1DSH1HBp7P1X/ASDH6p1O+sdC0FF6u/F7Yel7Gfwfad/5X8xBKfTgt0EyXkL+eZtUWF8SN/syu9FlrxVmKN4TBfaP6hhLfEyEauF7pUlGMcCBAxf6RMQIbgAa6F0qqSTAgAC9Y9JCR8CT0XdLHqgIJfDdkIM5A1OQ7ycfk+/fdd1OoBrnp2llRcNhacMkMeGeb6oMALR3HsZ2uM8XEtETjLp7FsuFfKBM54H5eMZIFBTQkZq/0j2uEA0gRGtruvV61qVRe3RfZgEldd2HrvtDzi+hvNGtFwu1c=

On Wed, 14 Oct 2026 13:50:29 +0200
Petr Mladek <pmladek@suse.com> wrote:

> John is author of the huge rework of the printk subsystem. He has a deep
> understanding of the code and great awareness of the various user
> expectations. He is willing to step into the maintainer role which
> will be a great help.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..5dec288729ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21848,8 +21848,8 @@ F:	scripts/Makefile.propeller
>  
>  PRINTK
>  M:	Petr Mladek <pmladek@suse.com>
> +M:	John Ogness <john.ogness@linutronix.de>
>  R:	Steven Rostedt <rostedt@goodmis.org>
> -R:	John Ogness <john.ogness@linutronix.de>
>  R:	Sergey Senozhatsky <senozhatsky@chromium.org>
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve
