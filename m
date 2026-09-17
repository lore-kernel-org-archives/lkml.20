Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3533A4523;
	Thu, 17 Sep 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682685; cv=none; b=r/g2nnwEuclnnHTW3Nsgxd7e4XbrFGGS5XA4bkaFCNHK6sLYFj9iR2Tl7Y5rakAxgQWsdAGN2Y1Ij3kfU4UQEwlmeIfXBlVLVCoaxo8SvdnOsnZxsPKnSf5a7EqY/JQc4HVZ3MVcFemSBrAZZ6A/DxVY3PFErhDw6agSMmyN7aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682685; c=relaxed/simple;
	bh=TJroROhPoXjhJhMWd9juxirzKNPGRKpB6k34y5OzVlI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GgBLoNrBO8yCPijsbBV7/F3DsknJu5cWueOMBi+ypU97HbpHptIBK9gRDhNP7+fgRXvJQa+C9oK4xfmCz7WtEUyxgpDVTa7O25q87irv54HScnaPs4XwGfocmvxc84Yw/K6qRPOzO3FNelTQHguA+Va4zQG7NULWZQEMsWwWU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lH3U3sA7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lH3U3sA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6951A1F000FF;
	Thu, 17 Sep 2026 22:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789682683;
	bh=Sit5dXgTLfs5SZTHMDJB36zhXNOrd/YRYjrGNUNPW7Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lH3U3sA7tXBSJpQNADy8QF2OUE6QzGtoSMlQOkfETtznsSSAaCIFEnaqmD4Cpq1Df
	 hKrrRPFDQ5POnjSuKefCfTrDXb8evzmlVlpUMvAXQd3qPG/UtBkhU5QqO+jAWCaD71
	 8U0z2OCbwjOL913H45G3aJjGWm03WnbgaJtrQgWE=
Date: Thu, 17 Sep 2026 15:04:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH 3/3] mm: kmemleak: raise min_unref_scans to 3 for
 verbose auto-scan
Message-Id: <20260917150443.a872ea0fd692503c53b2b773@linux-foundation.org>
In-Reply-To: <20260917-b4-kmemleak-doc-v1-3-84fde6d1f749@debian.org>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
	<20260917-b4-kmemleak-doc-v1-3-84fde6d1f749@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 06:47:37 -0700 Breno Leitao <leitao@debian.org> wrote:

> CONFIG_DEBUG_KMEMLEAK_VERBOSE sends every report to the console, so a
> transient false positive there is broadcast to whatever collects the
> kernel log rather than sitting in the debugfs file until someone looks.
> That asymmetry justifies being more conservative than the general case.
> 
> Require one more consecutive unreferenced scan before reporting. The
> only cost is that a genuine leak is reported one scan interval later
> (600s by default); the value stays writable at run time through the
> module parameter.
> 
> Kernels without CONFIG_DEBUG_KMEMLEAK_VERBOSE keep reporting on the
> first unreferenced scan.
> 
> I've been running constant upstream kernel with
> CONFIG_DEBUG_KMEMLEAK_VERBOSE set, and I am still seeing some rare false
> positive, that goes away with min_unref_scans=3, so, making it the
> default based on my heuristic.

I'm guessing going from 2 to 3 reduces the false-positive reporting
rate, but they're still possible.

It all sounds rather rubbery.  Why do these false positives occur,
anyway?  Are we papering over a fundamental problem by filtering out
its user-visible effects?

