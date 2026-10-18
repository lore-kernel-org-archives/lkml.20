Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903CDF76
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792310620; cv=none; b=RYtY5wX2khAbI/SkyGZW+XkGEBG1N4+eg8f62+ialIrTVyYieys6LutiJzfGKn4lv08a63xFF9AgwlvLEjMJWhboZNXWP+GkoD5riRtO4oV/0ryn6U++h4ErNEShGtwVbPgqxbZ6O7WD8GJ6jq1YSF4MrMYIS+vROo23haAz2mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792310620; c=relaxed/simple;
	bh=IF9goZePh45tejtFUlq3UQB7Bq3FqvSqUD4SrsrNDTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKUTvn+NkQKEjlNH5sC5fJNMeOtvIVv5+58UBP+NFq2gDx3NJ9VgcWcYI1LYNaXBrOKS+uykWF9eHabOacqKGq9q0zPJ/uhi2V7XbFhDyq5cvNk5LIRiBPBMW0qaiXWyihKVYWBjxCMw0f53QWNB6zS14h1GOJpEuSBN+BJQN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DvDuCCiA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DvDuCCiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322B41F000C4;
	Sun, 18 Oct 2026 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792310618;
	bh=JJNINly7g4wRKqQk2yVdy8PqtE2VfWd7xctymCWVDhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DvDuCCiAmEXTdyLdTj+Ss4eYO1JS05AEJltJNekwi4sjIzn0GvVpRTbFCEunQ+bvt
	 iKuIVXIvFasEu7XxsokP9aGfMB8K3qQu+XnJ05ozGzAPaN2BUFjVRbU0u1NjnEnoT7
	 s+aTRNEgPqNpXQ7fBMwEpPF40uHsrx9ZiCM0zhcI=
Date: Sun, 18 Oct 2026 10:02:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] SPMI changes for the merge window
Message-ID: <2026101847-predict-churn-eb98@gregkh>
References: <20261018055336.1037077-1-sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018055336.1037077-1-sboyd@kernel.org>

On Sat, Oct 17, 2026 at 10:53:35PM -0700, Stephen Boyd wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git tags/spmi-for-next

Pulled and pushed out, thanks.

greg k-h
