Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE1D449985
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939874; cv=none; b=dGxJmxZakebNIuxg6gVytIHqRrXDvh0GyHLHf3B9+aXJFKk0XYd8x8CP2C9wYmJS+oHGwqHVyiaZdcuR5/vW9ZCjz8yidqsBzXHTfgM8KP+MxzkEI28aycbtUxiouuMbgHFl14iHHZMT//aA6HuzI3fZ7QEML1QYOyFX4farJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939874; c=relaxed/simple;
	bh=ctLCOPsdvD2huGObjPOvOKVglzGSNFCbt4dUGg6iAuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RovCn1GrHfw+6vycPsRJXnErvW11o9BnWikQsmYDrorr67qj+lGe5VaOEIukfRQkoWfbd90a9RmLiMXuObU+U8l7iQjEe3yHV0dIzFH+emsxeZDss2p8HklnOcSKaXiXDDLeDLNY6mvPF5uGZXdaMjVBqSNJLO2UcyKdzNmtcew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL0i5p0V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL0i5p0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD4F1F00A3A;
	Wed,  9 Sep 2026 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939872;
	bh=rkGvGsEkq2cJDsktGH60LKXNalxxWAEDUL+d98uZD/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HL0i5p0VAb9P4h0lD4hhN1kMu3DHxR2PmCKRpc7ZkB2Cl/HPt2O1TZE7QcYsHWc30
	 rrFqwmpudgUg48bNqx5sqg5BMXB75mYlAE2A+Ar2idyt/bCV+5vwRFB3yTrroFvhLx
	 uGIJ391AtyvnYYxRJaaFIdALUPY0IQBM2DDA6phMwetoKDpsL1dGHVBoCkcVrNa+Ss
	 b2LgpUdyhpYsxNJzfdbaIwxrcVPyZnNeT5spB75Ec8Pns+F9kec/AGjRSYRcuFzAk4
	 qopNmRqAHASVHgbH3skYUmO8EWmoYry9++bULOW+6TePEAo1gbrI+HirWhiOuTlGtn
	 kOeSvq6k0IK2g==
Date: Wed, 9 Sep 2026 07:44:28 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>, tfiga@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] printk: Introduce loglevel bypass for pstore console
Message-ID: <aqEOXGJAZ2k5xgjj@google.com>
References: <20260831070346.3490745-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831070346.3490745-1-tzungbi@kernel.org>

On Mon, Aug 31, 2026 at 07:03:44AM +0000, Tzung-Bi Shih wrote:
> Currently, offline consoles (e.g., pstore_console backed by ramoops)
> inherit the system's global console_loglevel.
> 
> In production environments, physical serial consoles (UARTs) are often
> heavily rate-limited to prevent verbose messages from causing severe
> execution bottlenecks.  Unfortunately, this identically silences the
> pstore console.  When a kernel panic or lockup occurs, engineers are
> left inspecting a crash dump that has been stripped of the verbose logs
> that could have identified the root cause.
> 
> This series introduces CON_BYPASS_LOGLEVEL, a simple flag that allows
> specialized offline consoles to request unsuppressed logs directly.
> 
> Patch 1 introduces the CON_BYPASS_LOGLEVEL flag.
> Patch 2 adopts the flag in pstore_console.
> 
> Tzung-Bi Shih (2):
>   printk: Introduce CON_BYPASS_LOGLEVEL flag
>   pstore: Bypass loglevel suppression for pstore console

Hi everyone,

Just a gentle ping on this series.  Does it make sense to you?
