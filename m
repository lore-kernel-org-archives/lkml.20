Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43874A6CE0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550714; cv=none; b=eBjHUi2XnBkFdQsjpaGyp7axIN7tVy0sBcZUQvIeWf4IwNdWN3luTotMinrZcdfAAj5rz7cEY6hvRQ8j+8i085t8Nb78Rc35r5CSdIY9dH6UjtSFpq2Ysd+Hu11BBD+JxRCnP4cffCPmWEte5UltDEa4ZsIUPgl+UGE1vSB+tpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550714; c=relaxed/simple;
	bh=zK44y1aWWHWHVu7SAjkk9nOydc2H3Pn2r2oBAt9S9UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBCaDUzXCsYtfM8jretEwIe46/RDqBEaf+UcY/H/5ekYJQAiLXcFdK9Ctl/MOg84gwJFV3/Yrd+bk7jWjEHmWmLRztXtQNPwPnWsq30KPWOxJq01vDy81ur9eWYmof1BmVRNA4FJpdbil7Lju8n2eFsVyp3VzfFPV6TdL7Qdx/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=dZLp0oK1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dZLp0oK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F311F0089A;
	Wed, 16 Sep 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=dZLp0oK1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1789550706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LRLrwMZl5GDdW81m6m6P4Tqeh+EdUpc9/aYU9PdolbY=;
	b=dZLp0oK1qA2MmIusN1L0vtG5HY3ClKda0BmSuGEOdbCJ5KcYTbpKa0y8iWsHRNu9lc9vXK
	mKTGg6QfS+E9CLlayrzl3ItVQH2zOfjy293LKeH9OyjF7IxLcH0CLo81cItZbmKOSyXEdu
	dqIbgBN+BitMcvqf0pe/tCvXez6/ghY=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 97cc9208 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 16 Sep 2026 09:25:06 +0000 (UTC)
Date: Wed, 16 Sep 2026 11:25:03 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] siphash: clean up kernel-doc comments
Message-ID: <aqpgbwOf0akwxgcR@zx2c4.com>
References: <20260831055236.3457072-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831055236.3457072-1-rdunlap@infradead.org>

On Sun, Aug 30, 2026 at 10:52:36PM -0700, Randy Dunlap wrote:
> Use the correct function parameter names and add function return
> value descriptions to avoid kernel-doc warnings:
> 
> Warning: include/linux/siphash.h:82 function parameter 'len' not described
>  in 'siphash'
> Warning: include/linux/siphash.h:82 No description found for return value
>  of 'siphash'
> Warning: include/linux/siphash.h:132 function parameter 'len' not
>  described in 'hsiphash'
> Warning: include/linux/siphash.h:132 No description found for return value
>  of 'hsiphash'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied. Thank you.
