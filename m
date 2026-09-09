Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79FA55C1C9;
	Wed,  9 Sep 2026 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970466; cv=none; b=EPjPJoHdV1mYtAscvnOienzDLnuT1+HRyuwcmnpV3GvTVKFGXxy9K2BHoAuRsSYNLT1Q49K9f1joRTaM0XKyu3T0Y/wbzCCFVp1C9BSVgvKnYrtFxfLhI2b0l++5prgLGWiiP3TqWteql5x4J5s0VNRKTVX2HSs/imSbCKWrbOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970466; c=relaxed/simple;
	bh=CjK29dOxbvlUPL97yDdDfIcDClJ9Ztk1CkqZPS92lHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+xqGzB6GAUskFGFXgt2WD0SjwEh2K4JerVopf7gEeck/LD7BO1U1WqEZG5xfgIt4kDJQPGkQOHgQl5G6TDzWz4SC/vJN1qdomt+p8w+0J+OEEDE/YgdX2wDKyx0BVyMv3J/Y+IwLBESr5U2p9HLmW9i3bI4MQK8ouSt3Z73lH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDR853AH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDR853AH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5694F1F00893;
	Wed,  9 Sep 2026 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970465;
	bh=QhnM1pk1BSw0WnwgL1MI74wdI1unkTvHxP68nkCaJVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FDR853AHtRy9UwMqL9g5nGlnA+AivbVqQi5x4xHdQRVJ9b6fjUk81bfppYJkpzfzy
	 UfSwSHgbZTS3j1AS7odxDmGa9cMTxFXCMm5DgPVyMd2NxX0Qm/xVzxwTcHIA1uXnWp
	 gwCPRzu+Qa4F7WpD1VWo9hCBXDO2Tb2U8PSdLzANQ/l3exA9giNNDbche99ECL4nyB
	 UoTy6UbBz54VWkNJQqFvK9UJGuEZCTDff3tEH4T1IzQoympt4oebuV5WDCgGsPIwEk
	 MN8kFl1jsmoxUOz6Dfs9px08+HySKl4vebZLWZCcApOPw6uHtJEXYbEOhwHJjdHAQe
	 zn7fKC70dEDew==
Date: Wed, 9 Sep 2026 09:14:25 -0700
From: Kees Cook <kees@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: deprecated.rst: add to syntax highlighting
Message-ID: <202609090913.DA27C376@keescook>
References: <20260909141255.1367539-2-manuelebnerli@mailbox.org>
 <20260909142527.106469-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909142527.106469-1-sj@kernel.org>

On Wed, Sep 09, 2026 at 07:25:26AM -0700, SJ Park wrote:
> only the paragraph more consistent looks making sense to me.  So, how about
> doing same to "__counted_by()", too, as it is also in the same paragraph?

I think that'll get auto-marked by our tooling already because of the
trailing "()".

-- 
Kees Cook
