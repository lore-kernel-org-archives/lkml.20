Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001E49BD83;
	Fri,  9 Oct 2026 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538730; cv=none; b=tffU63ffrX0pFOzwu2xnUJSTeLY2Bt4ptQSuVTmAWfih4qsyHLZpvi8q5cOlM2nZ6YPMlbG9WHNacYNTv6GdRrPiQRK5lRfSOnlGiBmA51iWURaTC4olpstlcaaubjhWNO4LNoMAfNbQ/zhjW974j1DTBJFliWFrg4X+KgY+0bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538730; c=relaxed/simple;
	bh=t/8BTFDSs8/NUSurdImhQN1o+FHvkF4zuRilT1jO360=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twjaoGiK/d9o59ufZCmCWo8CQPHbVewdSCBKf73l8KWBvtFRpuTwSrGbnxlrdYSDlsJxOOTYJIzQzy2Kgkfq1hmr3xszbLhxtUDo7/uzSkg1f7+81KvB2TaJgw+IiqRfxcHl+K0l3+pscino8YjvAMds7RX2nl8u8pVxxn6DfxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K7ouyRcx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K7ouyRcx"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C904324A;
	Fri,  9 Oct 2026 11:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791538598;
	bh=t/8BTFDSs8/NUSurdImhQN1o+FHvkF4zuRilT1jO360=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7ouyRcx/r1kBYBhaKHmONrS3ZOqNIj3HkP41itKyufp0xxHmFupGuoa+2vA/NCE4
	 84nQBJ6HzLux2/HFF1V+jcIiRoRoI/FBNcKPkKyQUWj9e5NNkrwCKTAAiEKd4HOgms
	 laT24Sx7LgkJbKUTtC5SlNhq3XfIgc/bMeTbq3fM=
Date: Fri, 9 Oct 2026 11:38:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261009093835.GA680229@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009083137.3-1-sashal@kernel.org>

Hi Sasha,

On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> The Maintainers Summit reached consensus to deprecate the Assisted-by
> tag. Remove the documentation requiring it.

Please explain the rationale in the commit message. I'm sure you know
how sensitive this topic is for many people, the more opaque changes are
the more questions and frustration they will generate.

> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/process/coding-assistants.rst   | 21 +------------------
>  Documentation/process/submitting-patches.rst  | 10 ---------
>  .../it_IT/process/submitting-patches.rst      | 10 ---------
>  scripts/checkpatch.pl                         | 11 ----------
>  4 files changed, 1 insertion(+), 51 deletions(-)
> 
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
> index 051f0d819f68e..509dbf23a099b 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -40,24 +40,6 @@ is responsible for:
>  * Adding their own Signed-off-by tag to certify the DCO
>  * Taking full responsibility for the contribution
>  
> -Attribution
> -===========
> -
> -When AI tools contribute to kernel development, proper attribution
> -helps track the evolving role of AI in the development process.
> -Contributions should include an Assisted-by tag in the following format::
> -
> -  Assisted-by: LLM [TOOL1] [TOOL2]
> -
> -* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
> -  (e.g., coccinelle, sparse, smatch, clang-tidy)
> -
> -Basic development tools (git, gcc, make, editors) should not be listed.
> -
> -Example::
> -
> -  Assisted-by: LLM coccinelle sparse
> -
>  Procedure for finding and fixing bugs
>  =====================================
>  
> @@ -82,8 +64,7 @@ these steps:
>     another one. The fix must not add build warnings and must pass the
>     checkpatch.pl checks (see submitting-patches.rst).
>  6. Commit the working fix with a detailed message describing the problem, the
> -   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
> -   Assisted-by tag, as described above.
> +   solution and a Fixes tag. Do not add a Signed-off-by tag.
>  7. Identify the maintainers and lists using scripts/get_maintainer.pl.
>     Documentation/process/security-bugs.rst shows how to do that.
>  8. Indicate what could not be done. If the fix could not be built or tested, or
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7ae79452e1b46..5f4e0156cca78 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -632,16 +632,6 @@ bugzilla.kernel.org is a public place in this sense, but email addresses
>  used there are private; so do not expose them in tags, unless the person
>  used them in earlier contributions.
>  
> -Using Assisted-by:
> -------------------
> -
> -If you used any sort of advanced coding tool in the creation of your patch,
> -you need to acknowledge that use by adding an Assisted-by tag.  Failure to
> -do so may impede the acceptance of your work.  Please see
> -Documentation/process/coding-assistants.rst for details regarding the
> -acknowledgment of coding assistants.
> -
> -
>  .. _the_canonical_patch_format:
>  
>  The canonical patch format
> diff --git a/Documentation/translations/it_IT/process/submitting-patches.rst b/Documentation/translations/it_IT/process/submitting-patches.rst
> index a742610cb0709..d0e0d6c9ecc2e 100644
> --- a/Documentation/translations/it_IT/process/submitting-patches.rst
> +++ b/Documentation/translations/it_IT/process/submitting-patches.rst
> @@ -691,16 +691,6 @@ un luogo pubblico, ma gli indirizzi email usati lì sono privati; quindi non
>  esponeteli nelle etichette, a meno che la persona non li abbia già usati in
>  contributi precedenti.
>  
> -Usare Assisted-by:
> --------------------
> -
> -Se avete usato un qualsiasi tipo di strumento di assistenza avanzata alla
> -scrittura del codice per la creazione della vostra patch, dovete darne atto
> -aggiungendo un'etichetta Assisted-by.  Non farlo può ostacolare
> -l'accettazione del vostro lavoro.  Fate riferimento a
> -Documentation/process/coding-assistants.rst per i dettagli su come dare
> -atto dell'uso di assistenti alla scrittura del codice.
> -
>  .. _it_the_canonical_patch_format:
>  
>  Il formato canonico delle patch
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8a7787d228a63..c9840f5219c2a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -655,7 +655,6 @@ our $signature_tags = qr{(?xi:
>  	Reviewed-by:|
>  	Reported-by:|
>  	Suggested-by:|
> -	Assisted-by:|
>  	To:|
>  	Cc:
>  )};
> @@ -3124,16 +3123,6 @@ sub process {
>  				}
>  			}
>  
> -			# Assisted-by uses a free-form value (e.g. "LLM"), not an
> -			# email address, so skip the email format checks below.
> -			if ($sign_off =~ /^Assisted-by:/i) {
> -				if ($email =~ /^\s*$/) {
> -					WARN("BAD_SIGN_OFF",
> -					     "Assisted-by requires a value\n" . $herecurr);
> -				}
> -				next;
> -			}
> -
>  			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
>  			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
>  			if ($suggested_email eq "") {

-- 
Regards,

Laurent Pinchart
