Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D6E1DDF0;
	Fri, 25 Sep 2026 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340093; cv=none; b=qSOiuyJWbkrztj3cdWCkB+flx9zfc9Bq0ga4uQoCV4UpBu6Upi0uU+QOJ3mpsgvDNgMlbyHl2ZAWR2UndVzS0a4kgVCup9x2GpzeoeiJDuip0/GBpx0UoSAnfYaf6ZmJElD84llT05oIPFwNtcr9Tq1cTin0u2pdofZeSSxMpLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340093; c=relaxed/simple;
	bh=WKO/plG+XZDmd3cranbFqBBTghCxRIULPDoRVVexiTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avcnE+w4PA9ASgHuoCw5pSwyCZqEl8xfNBvoaWYgiaZPaOlSv/mea4JNz/X7vn2TLY/QI6XOysTcRvC0W+pNBl5Q5DLn9SfDpZzJzH7/ujCOLMdOxJaFXWCGgO3dkVkzRBs2lK36VTyfHocoyDs1Kp4xa+ZfhYX9K/I0rk+W+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IA7Q0h9o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IA7Q0h9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4D31F000FF;
	Fri, 25 Sep 2026 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790340092;
	bh=Qr+tEsTCJfTScS02sjU9Yed8it9/1Ompuc2nj2RW7Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IA7Q0h9oVLLpE8DmTnSsWfXyvV/VcK+713MO04KEo9xkex8lfPZZ9mk8jeNCRuJU8
	 jU7K0qLuh29sPghOP0M8+w5A82svXpE45xNF3M6TOJofvFfWwbrvUAWAlK2jwAbGUY
	 uQhpVH7rWvjUbETjKwqZIOtPMyxVoFo2O3w3BE0ChWMUBI+0/O+0DOjXFxzGEXzyBv
	 +9Max5kvex53oWFxUJny/hjZoPPrTV045VQBbAnApUxUIhSAdxECbVnn9IgIhfbNMH
	 qHfikGpLIXIXPYY7MyVXgGgw46JWtodS45byGFWWsHvz498YMpLqJjoEIDcvz8dTWE
	 Z+mwO5YK/7M9Q==
Date: Fri, 25 Sep 2026 14:41:27 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	tytso@mit.edu, krzk@kernel.org, maz@kernel.org, ebiggers@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: document the branch in git T: entries
Message-ID: <arZr94JdJFPpsC2h@ryzen>
References: <20260925120047.1093617-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925120047.1093617-1-matthias.goergens@gmail.com>

On Fri, Sep 25, 2026 at 08:00:47PM +0800, Matthias Goergens wrote:
> A git T: entry can name a branch after the repository URL.  The first
> to do so, commit a1aa5a770dc3 ("MAINTAINERS: update hwmon subsystem
> git trees"), added two T: lines for one repository, one per branch.
> Today 109 of the 846 git T: lines name a branch, and ten entries list
> one repository more than once with different branches.  Commit
> 083bf9c56d06 ("get_maintainer: add more --self-test options") taught
> get_maintainer.pl to check the branch with git ls-remote.  Neither the
> MAINTAINERS preamble nor submitting-patches.rst mentions any of this.
> 
> Document the syntax only.  What a named branch is for varies: many
> entries name the branch linux-next merges, others a fixes or topic
> branch, and some subsystems want patches based on a mainline tag rather
> than on any branch of their tree.  maintainer-entry-profile.rst already
> asks a profile to say which branches go into linux-next and which one
> contributors should submit against, so point there.
> 
> In submitting-patches.rst, say that fixes for the current release cycle
> and new development usually start from different places, and where to
> find out which.
> 
> Suggested-by: Theodore Ts'o <tytso@mit.edu>
> Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> v2:
> - Krzysztof: one patch instead of two.  The header no longer says when
>   to name a branch (v1 tied that to the repository's HEAD); it
>   documents the syntax only.  submitting-patches.rst names the branch
>   that queues work for linux-next as the usual base for new
>   development.  The cgit about page he mentions is a good place to
>   describe branches, but not every tree has one, so the text does not
>   point there.
> - Marc: some trees are integration-only and want patches on a mainline
>   tag, so what to base patches on is left to the P: profile or the
>   maintainer:
>   https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
> - Niklas: fixes for the current release cycle are now told apart from
>   new development.  memblock is not alone: ten entries list one
>   repository with several branches, so the header says an entry may do
>   that, without recommending it over a single line.
> - Eric: his fsverity patch uses one T: line per branch, which the text
>   allows:
>   https://lore.kernel.org/all/20260925041654.112935-1-ebiggers@kernel.org/
>   Pointing HEAD at the main branch with gitolite's symbolic-ref, as he
>   suggested, is up to each maintainer and is not covered here:
>   https://lore.kernel.org/all/20260924040030.GB5048@sol/
> - Ted: documenting the branch at all was his suggestion (Link: above).
> 
> v1: https://lore.kernel.org/all/64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com/
> 
>  Documentation/process/submitting-patches.rst | 8 ++++++++
>  MAINTAINERS                                  | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7ae79452e1b4..cfc72975a9d6 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -40,6 +40,14 @@ patches prepared against those trees.  See the **T:** entry for the subsystem
>  in the MAINTAINERS file to find that tree, or simply ask the maintainer if
>  the tree is not listed there.
>  
> +What to base a patch on also depends on what it is.  A fix that should reach
> +mainline during the current release cycle, such as a regression fix, is
> +usually based on the latest mainline or on the subsystem's fixes branch.  New
> +development is usually based on the branch where the subsystem queues work for
> +the next merge window, which linux-next merges and which the **T:** entry may
> +name.  When in doubt, check the subsystem's **P:** profile, if there is one,
> +or ask the maintainer.
> +
>  .. _describe_changes:
>  
>  Describe your changes
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c52ec2d7d3c1..c3f8fc52f3ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -30,6 +30,11 @@ Descriptions of section entries and preferred order
>         See Documentation/maintainer/maintainer-entry-profile.rst for details.
>  	T: *SCM* tree type and location.
>  	   Type is one of: git, hg, quilt, stgit, topgit
> +	   A git entry may name a branch after the URL, and an entry may
> +	   have several T: lines, for example one per branch.  What each
> +	   branch is for, and what to base patches on, differs between
> +	   subsystems: see the P: profile, if there is one, or ask the
> +	   maintainer.
>  	F: *Files* and directories wildcard patterns.
>  	   A trailing slash includes all files and subdirectory files.
>  	   F:	drivers/net/	all files in and below drivers/net
> 
> base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
> -- 
> 2.55.0
> 

Looks like a good change to me:

Reviewed-by: Niklas Cassel <cassel@kernel.org>
