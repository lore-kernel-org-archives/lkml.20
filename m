Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59D468C37;
	Wed,  2 Sep 2026 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349220; cv=none; b=GscXlHAt307s00RqXRZh/q1y2NShE/u9qe4eK4R1PhWW+u2s9vcNESryaUSXJWoKnc6dLMIYLRVMFkiAYioH/qxwWWmTWShEvco0RTr075Y23twyLTukJx65cstmnx64BxI5dHe0tIvzPD3ZnCSNFlEatZLd4m4n6YmrdECmbjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349220; c=relaxed/simple;
	bh=euahzbTgRyKFcJtkykzjVz23UGcDO1rLyZexs8BshWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpHflAMjWTzKmGvbsqgXLmIls+tuEiCHc4Rjle9a4m+/4lrF6wQ9oop305x++r8BYrY8xwFeqIOqnl5UXQenyN9tHlkbnBB8jzEm9AKyaLTuNOMSgizoZ/cYly5XxSNHigyNdEjUMyQN4ay00Mj4Qk8CQfjJfqVByPy2KAs7d5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cXH3MV/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cXH3MV/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FA51F00A3A;
	Wed,  2 Sep 2026 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788349219;
	bh=Umus33Kne99Ryme3HaczPzLK51JQyS0R64k9efckQg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cXH3MV/NMZavO5stNL9kcpTTNtC0+3XmbsV2A62SLKU3XuG4iSn93jp5shTT4tzK9
	 fReXOs8iPrN16HxzNU0LxfFE+DfYACNu2cp1PI6Q2PqFrCCjeRwPZUyhrvUa9CK4rT
	 X1NEm6LGfEiK0qmEG+8dZ29eeZ6XqApkV9qolgJE=
Date: Wed, 2 Sep 2026 13:40:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove manual ifname allocation
Message-ID: <2026090252-reformer-kosher-c6b5@gregkh>
References: <20260902105004.1935-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902105004.1935-1-nsvatoslav515@gmail.com>

On Wed, Sep 02, 2026 at 01:50:03PM +0300, Svyatoslav Nikolenko wrote:
> The manual ifname allocation via dev_alloc_name() is redundant because
> the networking core handles interface naming automatically during
> register_netdev().
> 
> Remove the ifname module parameter, the corresponding field from
> struct registry_priv, and the rtw_init_netdev_name() callpath.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
> Changes in v3:
> - Added missing changelog.
> 
> Changes in v2:
> - Removed rtw_init_netdev_name() and the entire manual naming callpath 
>   instead of hardcoding "wlan%d", as suggested by Greg KH.

After this patch is applied, what is the network device name?  Are you
able to test it?

thanks,

greg k-h
