Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F9635AC0C;
	Sat, 17 Oct 2026 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233799; cv=none; b=irkXeWbdny3Mt7BWQtmuq8wH5J72nJLFebj9268wqxolj2/XJQS06eV5TFC8C5w2gq6awzXqtuNC+nUIDsEdRuk3iDG/Pw1PBs6//eS7npKsBP7lfeSURS7mf6B/9h8ZKWdlEcLNiV36NK8grILcywrJdpOJHeolr+IHCKwt6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233799; c=relaxed/simple;
	bh=CDTyIg4KGnpl3KlMhoaV4bOZH2G5VqT/G7hHtf7bTTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eirXxR7u1dieNynR9RGYLq/m4Hx4YZ636wgyCMllaHNlcYT5h846rtBxlsJpjJSxDDjQwjBcJcu9GRfP/hB1yAJtta17nRSFKnlTpxFaUS1INEMP+9SoIIg7PxSuSFqBkTCD8Iui51qa/Z0pGrvYZ2bN49DxrJqIyLAENcdwv60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IPOTEpsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IPOTEpsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C8E1F000C4;
	Sat, 17 Oct 2026 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792233798;
	bh=UGaIEIUcdH/pX31AMNZU7iVlUnAAV+3y9KJB9EiEC/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IPOTEpsJV3x4xYpawyMovtFn0gua9k2L9eWjriWViJgI3+SNJ9L+Ban7MSmPFshSO
	 yzFc2pz/Hnxj89GXHb9K30QCcZUzeEuXDGOsjZC7ZGYvI9cmjLMPxaMtXQhnJ9SUHO
	 oMoKTMFVIEV5V4gobCYwq68rGEI73ejmQEVv6GFk=
Date: Sat, 17 Oct 2026 12:43:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Feiyu Wang <wangfeiyu_mc_code@163.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix logical continuation style
Message-ID: <2026101742-zit-gristle-c603@gregkh>
References: <20261007102212.112463-1-wangfeiyu_mc_code@163.com>
 <20261017103525.6203-1-wangfeiyu_mc_code@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017103525.6203-1-wangfeiyu_mc_code@163.com>

On Sat, Oct 17, 2026 at 06:34:44PM +0800, Feiyu Wang wrote:
> Hi Greg,
> 
> A gentle ping on this patch. Please let me know if there is
> anything that needs to be changed.

I have no context here.
