Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907648;
	b=iWQRm2kQuf0Rnsk3249I0IjiMW9T+WGzVL6IpxN7fMOtjv+um9cyrAdisUdqnHG9sj9s
	 CdXG1bCzw1PZWHJOS/TJzIdXkdDlQ0zlA5ShIHeEGmCxRG611667k9D8u85n3EX2Fjgs8
	 oz3P2FeS68cr9iCjazZyDet1XV0SEP9UfmK2s88ZwI3ytTaf7ienZSig7ochQvgNb8DOt
	 BvCh1A7TCNPLOk276PWf+eJsUNYAzCFw/agOuesPidCaw3jKku23qpRQyze2IPPUw+WX5
	 PdKHicDX+59kyElvlsyyz54nozflZ4BgpGZvL5JHqb+uNkasYd78Ybc5M3ynE4gkElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907648;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oTTb+Dn7nHMhxxnq5jmSly2jMvu8te5GnRCNd9YojcQ=;
	b=v3EEKMLv1QGNtpwan4tcB9G9q3Rierx1fb9v6yHf6uLf8PgmkLS1qasroWuPx/+9a3UB
	 QJRdJ5wbq/GLsjfH86XqkyLqdsSyzXn01nqMac+o10910marsGVJFIq+i2D5BgZzFwgxO
	 URvEKVd/RryZOAYc4Dn2H1IN32qvBwW3V3yTcYPqOkiTAegpS8EFdq8m5BgrWXEuGTGAH
	 29a5HFWBxxMoGCeg+Ayf7eRj7gzb5OCMs9KWd10nGfIGEIl8s0oz2kwM1nnyy7EBymYpS
	 HN4eboPU/Cx8pPhV+PYd4XQbpe0RjF8dz3ciVuW7xHLFGU2jcRy+E5XIgE80qfINJMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i8/pydmq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFC6606A330;
	Tue, 17 Nov 2026 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8/pydmq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846961F000C4;
	Tue, 17 Nov 2026 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794907648;
	bh=oTTb+Dn7nHMhxxnq5jmSly2jMvu8te5GnRCNd9YojcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8/pydmqN7orR0XVHafLfjZZYlyjMJWjJpVoT1Iyw3gZnx11mrCK7E5yitfea+E2y
	 lBgx6t0vxIi+J56RLzDtS1pxKQRaAiGsVRvY8Ru4uFphVseCQtCRt6F5BfRA6TfxUX
	 yAgcE6zKEKo7Rpln1PSIOslgIpC7BAyIZhYBD3SMawByEMhrAtK6vZodz/iSyNzIC0
	 VoV+SFbnW4fAvR6Fl8/hbRcQguga37+IH2TJwXGBbN5mPtzeS0+NDLVhIr03cbcosM
	 ZZ3m2w4Q28nTXIAP0p2eWHqh4q/gZQO64VmJu6MwCzc0OE1YeDBGQV92l5B87G1Utm
	 jDvxoI6g73pdw==
Date: Tue, 17 Nov 2026 11:27:23 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261117092723.GA124972@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116200515.352387-1-sashal@kernel.org>

On Mon, Nov 16, 2026 at 03:05:15PM -0500, Sasha Levin wrote:
> "Describe your changes" already asks for the user-visible impact of a
> change, but changelogs for fixes still tend to say what the code does,
> why that's wrong and what the patch changes, and stop there. Whoever
> has to decide if the fix needs backporting is left to work out what
> the bug does to a running system.
> 
> Say what that means for a bug fix, in two parts. For users who aren't
> looking for the bug: what a normal workload is likely to run into, and
> separately the worst case and what it takes to get there. For someone
> triggering it on purpose: whether an unprivileged user could do it and
> what that would take, since a race that no real workload loses can
> still be won by a program written to win it. Give the paragraph a
> label so people can be pointed at it.
> 
> Coding assistants are told to commit a fix with a message that
> describes the problem and the solution. Add the user-visible impact to
> that list and point them at the section.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: Willy Tarreau <w@1wt.eu>
> ---
> Changes since v1:
> - Split the bug-fix paragraph into users who aren't looking for the bug
>   and someone triggering it on purpose (Andrew, Willy).
> 
> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
> 
>  Documentation/process/coding-assistants.rst  |  6 +++--
>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
>  2 files changed, 27 insertions(+), 2 deletions(-)

Sasha,

Since you're already making changes in that area, could you add a sentence
asking reporters to provide the full dmesg stack trace?

Many AI-generated patches reduce it to one or two lines, which gives no
indication of whether the report is genuine or fabricated. Early in the AI
era, I saw some completely fabricated stack traces.

Thanks
