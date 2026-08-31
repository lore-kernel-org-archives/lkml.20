Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5401640B6C9;
	Mon, 31 Aug 2026 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181197; cv=none; b=UXeD/d25IN+pfNMeJCAgi9h9eo1WZZ3GD8Z5vULtEgUD2DQerSFxySxXJI8o55ChXamOVC4rF3+0cK+mwVqqHv5YWQj3R5qraTH4CXF37KPTl3WUi709g0LNKWjNPcDKMnhmXE77rB4jpDMuxfbfrGIxoSxHZUpWnwkMq3UpeBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181197; c=relaxed/simple;
	bh=R3ja5w/TgaKTaD424WEFnZcJTRYEmSiud+7QxrHyScw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/OXTAWF49t11nuszUtmgIaDDMOoUlT/VXkf6qrrJ8c+cNEaeKPdNQVBVqlAgtNl98m7iTn4tuoEjvP8Xk3vVZHBZU6y+12f/fbSJYKRkJjJDv+P7TUnH8makdiwJvcnTgPDWwS8QG5ypGeSI1jguELVk3iqKr8t3MWLaXItS5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyLTCSd3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyLTCSd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860821F000E9;
	Mon, 31 Aug 2026 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788181196;
	bh=OXDzBZW6ylCDPYUVd2CPM+zhSKPBY1v2fHRc7f970LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FyLTCSd38fUlp3jr+RpQM8IUx9GAi+A14f35a4pOxfsoEUZwakqKwwhfVvHI4t6d5
	 nfWfVAcWGQJh3ssuK0liG7ZK5qmBhRVwNHvRcuxksBw6RBUfCznYu56cef0ApBIvmx
	 kSWX60uokkPzF+50Vvl8+ABvKHHAVgfjkf0M/P9T2ly9zJWAvyOQl2pHZqAF0YyHwq
	 Hw9XZWGXagRGIiYSvKAYqeUId1NgFTZDSpvlouUxsM57tv3LQJgFr+/jlwAIRABkFH
	 MweDXYLl6meEeyYicX19Y8CzjAT0OMI3+CcIozcClZm4lrvfEQdffK8cwVlfCwRTsN
	 tgfyZVHfsszNw==
Date: Mon, 31 Aug 2026 14:59:53 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] doc: Change dynticks-testing repository name
Message-ID: <apV6yW3HPTbmL2CO@localhost.localdomain>
References: <20260831081823.67972-1-marco.crivellari@suse.com>
 <20260831081823.67972-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831081823.67972-2-marco.crivellari@suse.com>

Le Mon, Aug 31, 2026 at 10:18:08AM +0200, Marco Crivellari a écrit :
> Currently the documentation still mention dynticks-testing.
> 
> Recently the repository name and the tool have been renamed
> to cpunoise, so fix the URL.
> 
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  Documentation/admin-guide/cpu-isolation.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> index 8c65d03fd28c..6d8f91d2d761 100644
> --- a/Documentation/admin-guide/cpu-isolation.rst
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -354,4 +354,4 @@ Some tools may also be useful for higher level analysis:
>    runs a kernel tracer that analyzes and output a summary of the noises.
>  
>  - dynticks-testing does something similar to rtla-osnoise but in userspace. It is available

The dynticks-testing above should be renamed too.

Thanks!

> -  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
> +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
> -- 
> 2.55.0
> 

-- 
Frederic Weisbecker
SUSE Labs
