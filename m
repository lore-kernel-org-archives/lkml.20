Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91344AB8A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835081; cv=none; b=rIq2+N6j3t5P2gJ4r1nX8ccTtjXoxqrYwNma2aUAV4o/OX6KN4LSgg/A3MYY+DrC2sO+WrDFNpiOCUJhP07RPjiEqu3t/O2G/bM3xE7mwZbu6bHcb5brU8ltgf5zSnJYF4iZX5XXqNR0qsZCa15zbENbSt/eEtACr3ipkPyIwGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835081; c=relaxed/simple;
	bh=UORXZGvGUb7IOneOO+CMZ7fP3LHKabFsFB+ra4zY6Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcJ9SxKrW83iB7gLXGWLWJB1NEh7MvPQnIC8WbD8AFFvkGahjqdZtGtRokNxS5c9CsBIsj0wLRuYgcSL7aAqMgS45cVu3CHsHbAVcb7n2B5WoGVVNq7ofrx18yIj8TTSMVQNwfXu7S91PY9kooZtqPR9vjfbK9aSa9lFR0+x7gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aFmMa+S5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aFmMa+S5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF7B1F000E9;
	Thu, 27 Aug 2026 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787835067;
	bh=WrCyFeXrC9zMTDTtRcuYgQJTOt6HeJfsRR5UfmpciU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aFmMa+S5Uv2AgTH4iRwJNPtZ0+W7ql7clXB7sEZ+XX/ETZCFFQat6lH8FaorBkFNE
	 lSvGEISHaadTc2I8fxXnJpvBTJGjWKWcRIGIGq+P5cOy78Txkf1sYn3TYgpv6DhRny
	 qnPbWrv5/Tyy/fP3jlQK4mTFa2WHb4aViZx24gpc=
Date: Thu, 27 Aug 2026 14:51:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: co <co+9d44b184bc8f410d@bugs.sh>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	George Zhang <georgezhang@vmware.com>,
	Dmitry Torokhov <dtor@vmware.com>, Andy king <acking@vmware.com>
Subject: Re: [BUG] drivers/misc: out-of-bounds in qp_memcpy_to_queue_iter()
Message-ID: <2026082744-tiptoeing-napkin-a2bc@gregkh>
References: <1wU0VjMckz7b5ly5tzcr7MbjZKdV9kTFjcc4@bugs.sh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1wU0VjMckz7b5ly5tzcr7MbjZKdV9kTFjcc4@bugs.sh>

On Thu, Aug 27, 2026 at 12:42:26PM +0000, co wrote:
> We found a bug reachable in:
> 
>     path    drivers/misc/vmw_vmci
>     crash   out-of-bounds in qp_memcpy_to_queue_iter()
>     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> 
> Config, environment, the sanitizer report and a C reproducer follow.
> 
> == Notes ===============================================================
>     If you patch the bug based on our artifacts, a tag would be
>     appreciated:
> 
> Reported-by: co+9d44b184bc8f410d@bugs.sh
> 
>     Everything in this mail is validated by the reproducer below.
> 
>     We also hold an LLM-generated root-cause analysis and a candidate
>     patch. The patch passes an A/B test: the same reproducer panics the
>     unpatched kernel and runs clean on the patched one. Neither has had
>     human review, so both still require validation before you send or
>     apply them. Available on:
> 
>         patch.diff  https://bugs.sh/b/9d44b184bc8f410d/patch.diff
>         report.md   https://bugs.sh/b/9d44b184bc8f410d/report.md

Same here, please do not just send us random links, but rather patches
that you have verified work.

greg k-h
