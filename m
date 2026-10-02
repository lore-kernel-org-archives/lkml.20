Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19A336D9E9;
	Fri,  2 Oct 2026 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921435; cv=none; b=GnTkjbETwP09SLHLQITRULcDURehJ4szLPvthdjvWtxUItrQNZ1MGas8TC8IOeHcT4DEeJ37b8Hh7UG190tPQlxqdClnHUUwx26DJLscCKmCX4V+rphbQZf7H1CQ2YI2tSUTUNAGeVCNg0KCIzSFfLKBYYvyytNDDlgWxHT9FJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921435; c=relaxed/simple;
	bh=xiMFPZzJ+uxXB01cxuF+DmvvCFMRTuX5Lf8oEWzfTuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzincOOVkTi2eB4ZjZfBU4E8FGod5YMxAjHA+qEYDRJl5vhUjjaowzL9lK2Cd22NZcN/zIQUTspglx1wL122jKinPXQcQxg1c6U1W4OC8B2xwJLnKsWH7VpEX3A9J0ZgEipWT5tJUQxEL1IvIQ21DXjGgMOmk/8p7oxIJHxPZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e0Nv1hV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e0Nv1hV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9AB1F000FF;
	Fri,  2 Oct 2026 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790921434;
	bh=9irke2B9jmYlErbuojGJAVzOHn1NFnI4CPU/UJrNdM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e0Nv1hV4a7XnqPekGtkXh3C4Khc/FC/4mj5MyavXlK0XNdI6KgxHO8dWXWnYqytaC
	 4Q2pEnoV5ikbdU3KG4g71e85FmxUz2hZyj2NAH4+pn6a7hmq0X9x8xo2KKbZcIa9Cs
	 diDigX8APxzeRkTQYzwTpoTqK3gWWmzpI+RAGiEM=
Date: Fri, 2 Oct 2026 08:10:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Message-ID: <2026100211-scenic-eligibly-58f5@gregkh>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>

On Fri, Oct 02, 2026 at 01:07:34AM -0300, Leonardo Martins Martins wrote:
> The function PHY_ConvertTxPowerLimitToPowerIndex() has several style
> problems, such as mixed-case names, deeply nested code, and redundant
> bounds checking.
> 
> Patch 1 renames mixed-case variables that are on the same scope as this
> function, struct fields such as TxPwrLimit_2_4G were left as is. Patch 2
> removes redundant parts of the code, and patch 3 solves the nesting
> issue by extracting the inner loop into an auxiliary function like it is
> done in rtw_phy_tx_power_limit_config(), at
> drivers/net/wireless/realtek/rtw88/phy.c
> 
> Checkpatch issues a few warnings and checks for deep nesting and long
> lines, but these are solved by the last patch.
> 
> Compile tested only.

When doing logic refactoring, testing on the real hardware is best.

thanks,

greg k-h
