Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797142;
	b=4cHtfDplnS+vXK42HbNHfMGZW8Y5zWz707idJQSCHjzxO/H+DY1sIvzj9/SFcvBzz1u/
	 flnAzy9YoSVO98Jzh/dOqCqmuidnFWYYY2WMf8T8zitW17X6nFfe+wrqN6RDzLT/AfICJ
	 sud3uBLCO0QxkTOG6SWiBmGdtECSi7GS9MnjP7ND+4d2HlLjtZRrbSMSFr3E1XrVZOGTz
	 RMIftQP4iMjdAQ4ImfTuAikO8qPBl+M/O4QfuiQ4SxgdXMY/HVdvxwYX23Nm0wJG2ESlm
	 MHqTV5v5r19h9PYuz0lRkZVKKAfGz5IRQJgDhmzz6Cx8YmPPxdyligFwuo17xdzC88A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Egu91q9dU04uoNuu9WJS9CZKlSh0KIIUE3pyY4OkdX4=;
	b=jB8xcYH0ASL2Luv0m305ywRbz2VLEZWqLT8xNmIgoh4EcS+aVFvCo+U0pwwlWKcS08Br
	 npxYc5ZzYUgV4gw4pCzUIU1xPcp08mt6vpWovDrISK5slzLirbf7Rz2NRfqTcaFbonsb7
	 9mbmAXjHCi8XggITk169ImoucDUPHjAmBymXgryTXDm7sZbWbUW7nw4eiGRszS+oXttgZ
	 JCRFlVVsiJG3wCFkqg4iVlJyfFvRzBN0OalQfRrFLsg+w2ClpXDygZKW7A2DGqVqBfMuG
	 Hl1snHes9268RMRExB8iEUPNLw8oetCwkzZng3sBHKjyaHiYXdtYglsXo5EW4IP6PZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=OUs8wh9K;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78799606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78799606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=OUs8wh9K
Received: from macsyma.thunk.org (pool-173-48-116-148.bstnma.fios.verizon.net [173.48.116.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6A4CwbhS032333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Nov 2026 07:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1793797121; bh=Egu91q9dU04uoNuu9WJS9CZKlSh0KIIUE3pyY4OkdX4=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=OUs8wh9KKUg7+SxydXoXfOJGoUaq6ntqze1koDf1tO/a3+JdxVimnbNE+joTKqEQv
	 4Z7PcLlqNR67xF1Az9aFt5REhBjGjHs7sjsTy0JKibAdG9GYdJxDPd6lw+Dk4DVNxz
	 xoaCGhpOLlqkpNdxPyiLg1z/rwo8QhZaXMNCDvcm+4uBhV7jBbamr+4oinQxcmNrGi
	 LLmZafzFODALBwGI4UpWiYptMLVN+0Q1cf3j8ufXYQraiBNAFQ6z6TpKmTSjiGLh8L
	 jxiClPFSaYLAnYNBw3Z7tyDuXkwfYq/IztP95AgCEZSgRsOz4rW393o+omQD4uAHng
	 K51tCPtxIU4FQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 7CB22253005C; Wed,  4 Nov 2026 07:58:37 -0500 (EST)
Date: Wed, 4 Nov 2026 07:58:37 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, tools@kernel.org, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Replacing special goto statements by direct returns?
Message-ID: <ausnPnWk9qSCnWad@mit.edu>
References: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>

On Tue, Nov 03, 2026 at 03:23:23PM -0500, Markus Elfring wrote:
> 
> The documentation for the Linux coding style contains the following information.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v7.4-rc1#n526
> 
> “…
> The goto statement comes in handy when a function exits from multiple
> locations and some common work such as cleanup has to be done.  If there is no
> cleanup needed then just return directly.
> …”

I wonder if the churn in this sort of clean up is really worth it.
There is a very large set of AI-generated fixes for AI-discovered
security vulnerabilities, and so code churn that doesn't actually
result in net benefit in terms of making the code more maintainable,
or more testable, or addresses live security vulnerabilities may in
fact just make maintainer's job more difficult.

I will say at the moment, for me presonally, this kind of cleanup is
very likely going to be significantly down-prioritized in terms of
code acceptance because I'm really swamped with patches for ext4 and
e2fsprogs --- patches which in my opinion are much higher priority.

Cheers,

					- Ted




> 
> 
> Thus it seems that the following script for the semantic patch language
> can work to some degree.
> 
> 
> @replacement exists@
> identifier label, var;
> @@
> -goto label;
> +return var;
>  ...
> -label:
>  return var;
> 
> 
> 
> Unfortunately, patches would be generated then by such a simple SmPL code
> which would still preserve return statements that became unreachable.
> 
> Test result example:
> Markus_Elfring@Sonne:…/Projekte/Linux/next-analyses> time spatch --allow-inconsistent-paths fs/xfs/libxfs/xfs_btree.c …/Projekte/Coccinelle/janitor/replace_goto_by_return2.cocci
> …
> @@ -1735,7 +1735,7 @@ xfs_btree_increment(
>                 --lev;
>                 error = xfs_btree_read_buf_block(cur, ptrp, 0, &block, &bp);
>                 if (error)
> -                       goto error0;
> +                       return error;
>  
>                 xfs_btree_setbuf(cur, lev, bp);
>                 cur->bc_levels[lev].ptr = 1;
> @@ -1747,8 +1747,6 @@ out1:
>  out0:
>         *stat = 0;
>         return 0;
> -
> -error0:
>         return error;
>  }
> …
> real    0m1,074s
> user    0m0,995s
> sys     0m0,071s
> 
> 
> 
> How should such a source code transformation approach be improved accordingly?
> 
> Regards,
> Markus
> 
