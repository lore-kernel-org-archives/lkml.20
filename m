Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C53472094;
	Tue,  1 Sep 2026 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255805; cv=none; b=PKI/ZsrZBkketBZLFkOP8r99S0VGUBf9ygnf0wmDBppp8elT1Kw4t7dcBv57AosM5lRVzEmkeOQpTIYCYjL4gjd8ccGyQXZk5n8A69IriDlhF4m7P02Xh28iy1e5b0edVN1bPljbhQrK+J0Q1bdYXqhLrImZj0VQrwc2eZ18xPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255805; c=relaxed/simple;
	bh=hhiyhKH+orRJF44pQ8M9dR5FG6lC5dDpV5hq4M24sns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKT0jcSwJmK14Ymf9PIGgoErGNsA09U3OMsvt+GskzumDaYXuuMOxMuIA0gndQLTGBmTs72leOAuvmSuUaf6n61k3jHMwD7LAU0eGHwZiQ5anxiBUUFOF0u3+3/TQp9DYE0yMcHHl31Lya9RtIASTpF+sJw5KlyEHzKFIVO4Sus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QFdmsEAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QFdmsEAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4B11F000E9;
	Tue,  1 Sep 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255795;
	bh=hhiyhKH+orRJF44pQ8M9dR5FG6lC5dDpV5hq4M24sns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QFdmsEADcnZxYx0G4iIm0Qvj34vCZhQkY5n0IEeqypjcisYWGpuZMS/zwreD2GrQ6
	 u89UvcLqqZjWRBFfaZimOSOMDN7s1tre1ELXSsjdtASQjGrcKA2drJOr4bATcvqPcD
	 CP59B2yV2F1WzW+gVNnyXcfEYetUWTEPfsylk358=
Date: Tue, 1 Sep 2026 11:43:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: convert swing index variables
 from u8 to int
Message-ID: <2026090155-cruelness-plus-404c@gregkh>
References: <YOUR-ORIGINAL-MESSAGE-ID>
 <20260804170137.20708-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804170137.20708-1-mishraloopmohit@gmail.com>

On Tue, Aug 04, 2026 at 10:31:37PM +0530, Mohit Mishra wrote:
> In ODM_TxPwrTrackSetPwr_8723B(), Final_OFDM_Swing_Index and
> Final_CCK_Swing_Index are declared as u8. Using u8 for variables involved
> in arithmetic calculations and lower-bound comparisons (<= 0) is unusual
> and triggers static analysis warnings.

What warnings?

> Convert both variables from u8 to int to clean up the variable types,
> aligning with the TODO item to "convert any remaining unusual variable
> types".

u8 is NOT an unusual variable type at all.

thanks,

greg k-h
