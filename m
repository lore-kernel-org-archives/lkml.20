Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D53409632
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355438; cv=none; b=ODZZHfgZgEIow0V/+Jw7pTc2dy3dQ7+7oGP7xlmFhYvFv/5RHKKJjWyQdKW2WP7/gieP9cvMQG6NUyLEY/iD9D3TULts3NO5O6uM4bLoBvgpQXByMyLT03xIEVk8MSlO+RaJC0NaF8nvCtsiRXWdB8+Can/AduTK4dEX4loFK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355438; c=relaxed/simple;
	bh=i8Cuomz9nVZD1UiWr0cVYHry87FXZeZcQeH1fABXuno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPbfdkexOpOk55TUi4CSSFoD6cwiqkqepsjR5/1Uyq04AMzeqsGbxoc0QKtv7eEadx7BSWmH9h6+yBHMBtoiqv0dLVGm9IL4+E2FfkANgBFqur0XpoYWhkJoYI0C+jMJ131ycm9Y9lM0hGRf+8PrBrNAwRJSw+SSojqT52TjTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=XJjHGh20; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="XJjHGh20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1791355432; bh=+Ej/MtYeTNa1H6LQ0Os99sLWrM9tE8iFe6pT1RpAn5A=;
	h=From:Message-ID:From;
	b=XJjHGh20nbHEbBMeyXfNXWItjhPzwnIn02etBFbRZ5GIGGEx++C/NCLVK/1XIVAgv
	 jDv3HSllIt3Z72famxDtlQBWu38mR95TQDxVmyf8QJLdjVn6YU/UiuE3/R6Q2XzqpP
	 w8Olro6agjzGEfiGqW5JqJ/VU8WLnqWgxeEgFBeM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E9084C090D;
	Wed, 07 Oct 2026 08:43:51 +0200 (CEST)
Date: Wed, 7 Oct 2026 08:43:51 +0200
From: Willy Tarreau <w@1wt.eu>
To: Daniel Palmer <daniel@thingy.jp>
Cc: linux@weissschuh.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] nolibc: Add dirfd()
Message-ID: <asXqJ0F1PyG5KdN3@1wt.eu>
References: <20261007052914.888956-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007052914.888956-1-daniel@thingy.jp>

Hi Daniel,

On Wed, Oct 07, 2026 at 02:29:11PM +0900, Daniel Palmer wrote:
> Add dirfd() to convert a DIR back to an fd for functions like fstatat()
> that take an fd.
> 
> Change log:
> v2 - Fix the name of the dirfd helper, I debated over removing the helper
>      as suggested by Thomas but it seems right to have the logic in a single
>      place.
>      Add test a basic test to make sure dirfd() actually does convert back
>      to the expected fd and using dirfd() with fstatat().

The series looks good to me:

  Reviewed-by: Willy Tarreau <w@1wt.eu>

Let's wait for Thomas in case he spots anything subtle.

Thanks!
Willy
