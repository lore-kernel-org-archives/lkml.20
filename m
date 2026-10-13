Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA04390987;
	Tue, 13 Oct 2026 03:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863972; cv=none; b=TplwcQxjb7Y73rEn4/ses/yp6HwU8x7lhvHkMIUQH2O+7+8UJ36ENWys+vVntxP72qKCsaH8RztYS3hx8vpZbT0/r5uBgsFnNNEKUd1XC+oLhvup/Dh5MlrkZkud5Ubu9EFKife0YY9JtHBoucRf3ZCVVEPX43ooaAEGZJ3U9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863972; c=relaxed/simple;
	bh=X8R5GhWkeFJRy8DxDFxfbGIrYsKbRc5Og2bgvXvDobE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4frY70G2CquXy5vC+Lr+Ok4xAE1+cnaJzrTCMLpSRfDklrSbFwJobh96AqArOks/j//dUqhSXbv4W2NEmdboTuV7p3z38zQ891qt0YEM1sGaSQPUeTA3NYAv+x86gPS2guaKfanizkAQaQzHu01Dkc8MOgTD1TBgvLco6jfH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWE5ElrF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWE5ElrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2021F000FF;
	Tue, 13 Oct 2026 03:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791863971;
	bh=mXmHd2OQ7R3TyyJ8nChLbUkrmd3BhyA6Rv+gaNNJWQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iWE5ElrF76L8nOZfrvIRIg5BtPuezf/HG0l2qnfXxFklniln1r9hTQRUbNKLSa1DY
	 uBOhsvvkGqIJBQDmNth7VGD+4AatmRhiUn1CglGIU6Kyud1DgtAoYNthBlHFOYNvw0
	 Rsu3aR7rEx56xik7V+ZHcqSOpJTp7kAATzi9+g9s0evaR6+4Pg/sW3tflubEFtpTEe
	 QqTbd433P2Uda5LXHiBB3MxR1ywZejMI/c7zidhVbpiUXGsaoz8HpEfAGN38Um2zm2
	 3yM4d3H8D0Au0m7U7g/hiycIjleW753TI5jj0BLUv4KD1xEjx9RlsUI9qkc3nm+s8A
	 LJufHlugEDAEA==
Date: Mon, 12 Oct 2026 20:59:31 -0700
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 3/5] agents: add a skill to determine stable tags
Message-ID: <202610122057.6091D70BB@keescook>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-4-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012213452.1863248-4-sashal@kernel.org>

On Mon, Oct 12, 2026 at 05:34:50PM -0400, Sasha Levin wrote:
> +A stable tag in the sign-off area asks the stable team to backport a commit to
> +the stable and longterm trees once it is merged in mainline. The tag syntax is
> +described in Documentation/process/stable-kernel-rules.rst. Deciding on a tag
> +requires knowing whether the change is stable material, which released kernels
> +contain the bug, and whether the fix applies to them.

And I really don't like this redundancy either. The skill should be
strictly as short as it can possibly be and then aim at the _existing_
documentation. If agents are getting something wrong after reading
Documentation/process/stable-kernel-rules.rst, then we need to add the
changes _there_, not in a parallel agent-only file. I would want to see
all these skills designed to give the framework needed by the agent to
find the _existing_ documentation.

-- 
Kees Cook
