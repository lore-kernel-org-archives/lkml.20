Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E60046EC84;
	Mon,  7 Sep 2026 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798467; cv=none; b=TjkiXUkpwadOrvzACv6yPUuKP3j6ZmRnQ+MPptrOvuWIgqWQEARVacStr6AO+jBEs7fvlmTq5+nrfIOf0Hw2oKKkxVRcMLfY8exydXCqS1TXct83z7YW7CBR0M4x4AGluqPpjwvzukfsPDcXsID7tO90e2f0qHnM3SQkr/nAqgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798467; c=relaxed/simple;
	bh=wVPrgc3LVTVB2QGWwCj2HNN0YVbM1ncERRgatcOX06w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zuq6+P1aftd9omPXLtuEdkPz5dXZm3iGOgIqEL/wuxFoVfC7M3JcVJcAUptHgFbu0kHulhZRPmGjv4r2td9uAtEBFTkSqx6EKr08/E3iFoOljRw/QtFn4QTTW09SX6pkPUl45KMAs52nw8cUSuYq5v6owPyeCiDiqmnhi9Vw2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pAw3ElS9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pAw3ElS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439B51F00A3A;
	Mon,  7 Sep 2026 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798466;
	bh=Ch3EI2AJaULOgXSA64F5drUFMjF9ZEXJGFO29bMebA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pAw3ElS9cRnI21lEFoFuG/uieT8fWBbmATSn6WVoHEe3Ece6uOS5pab21VsAEVwkq
	 avMYfn7Ap3PWS+ZqHxG3Fe84MI+Rb4cOwwN3ikk49lQkYOFdZVsDFWjMEMa/gYnXDx
	 5+zGUNcG6qe9zd4ykpyrm+2q2fE+Pf3C/rl8IpQU=
Date: Mon, 7 Sep 2026 18:25:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/2] staging: rtl8723bs: Changing two struct members
Message-ID: <2026090747-uneasy-version-2d09@gregkh>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260902150542.2746-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902150542.2746-1-fliegbert2@gmail.com>

On Wed, Sep 02, 2026 at 03:05:40PM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> This patch changes two members of the struct adapter.
> Two additional patches ar made to fix some checkpatch warnings.
> 
> Changes in v4:
> - Rebased against staging-testing

Can you rebase again please?

thanks,

greg k-h
