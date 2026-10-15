Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61550B8A3;
	Thu, 15 Oct 2026 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057596; cv=none; b=kfWQaAb7ySGdKJOexiGko+oWKPJ7R1EJI00FPvJ+a3kkxTYnv+34Zng1GHRN4oKyDCuy5xpFPCSCH8Zai6fIrmyXz2+qzZWZgujI0qFY1XV7JCAJYQ1CcOAV5uEHl8FJmxIbs7ZuMdkRp+vnA4hQ2LmQaPIL0wfZ6ENA3+sRi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057596; c=relaxed/simple;
	bh=ze5XtEy+xXhz7MawJR57cyq8Bw3rgSUxX9PIOkownM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jq+xEOCsHaBvxwxbQasku0/R8ocls+tuQ4gQD1g9x4F/uXVfwhQT/ywvjl8Q+Lw5N4kCPje3qjRJmHH84CX6CqwPV3qN8520g4x+tZ6N6TFeD1HJqsr0E0BloLIU2joYMv508e9gqQDW3jr98auH72BI6DHmTtAaqvkSUJaGlGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AyLqW8NJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AyLqW8NJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662BF1F000C7;
	Thu, 15 Oct 2026 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792057593;
	bh=9VZhZq6QlHoWg368tNWEK9KMXR2N68zvoC8mzPxyFdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AyLqW8NJUw0VBrezBwZHqplikSHQqMbSxomFOIgqN55ISEwvS1gl3Mmy+bp8y2m28
	 /NdTjqrgyjFqVrBr/4S2E9FvIT1g/El7K0tEYl5+KwtPXLkIVSSRn+9cH7+mZ8Wxdf
	 2X9b7n0TPkNPR1VOtCMhMuZfWu+i53nnhe0JKxWs=
Date: Thu, 15 Oct 2026 11:46:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: pdsj2807@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gdm724x: make DEVICE_STRING array const
Message-ID: <2026101520-repulsion-husband-6704@gregkh>
References: <20261015093128.1004956-1-pdsj2807@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015093128.1004956-1-pdsj2807@gmail.com>

On Thu, Oct 15, 2026 at 03:01:25PM +0530, pdsj2807@gmail.com wrote:
> From: Palak Raval <pdsj2807@gmail.com>
> 
> The DEVICE_STRING array contains pointers to string literals and is
> never modified.
> 
> Declare it as 'const char * const' to improve const correctness and
> prevent accidental modification. Also fix minor formatting issues
> reported by checkpatch.

Please only do one logical thing per patch.

thanks,

greg k-h
