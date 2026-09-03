Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712404FB9B8;
	Thu,  3 Sep 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457185; cv=none; b=qeYidaJqS5Ogt16xVyYWt0KrTgUnnDfKJPAKcBfsBO2b8zEUg8wFv012DCKdWlvG4BKf/V4MdDz6VdYaqmSk/M0Ji1L1Z3fuXyqBk1S/N70r3amYJa+eeuAVpzVD+p7fjDDdGfR/DQ28F7EX3LL2mvSh02+ooD2I/dSdFJ9j7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457185; c=relaxed/simple;
	bh=es0hrt9bc5pQGcJPW7NL36Y4Jj6+ora9XSzl5f3ltaU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bqSafUbtWQ2L1a3q2kDxrho1celAYxwHzDoBBCc5n/A9+Iyg5bIiy5A6zjJ+SUph3HRaLedb0mmLYZSHxKV+MtzvP9s6zY87Vzfw6C0zjUEPesar0QiW5iQRMn6mQA2O4bMiwdmMuhX7cNDHFBtvKAJFMveQIEU8pPufxj8N36w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=r/O5W8Zg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="r/O5W8Zg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 723C3408D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788457183; bh=id5q1lvxHv2zUL6v/tyJdo/32FcmQhWa7pQiBwU1Nec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r/O5W8Zg0qi9yR580IA30GBEboiJZqljDt370YEQXaYrouaMlNqe4/2sx9e5Pr7zF
	 Lp85GvQzvQ5FdfeKzWY+XxbSTYb/3Wlhc8jnk3k8cDgq3yAeYr6RLR38UHLGNXfTh5
	 pQhAtCAKZfiQuwaEtyCFL0Ug3tOTcvV+Ew5QeyDDc4jzlUPyRMRsEXOyC2XexsIxxU
	 aq8gW9HdsdxMyzWFkfNaIBwBI/itEJZuETA4Rkj3LYSe/B4AGalpjHm5lw/dwjnVEf
	 UMfzjCq/Voa9EHnUACl6iTEUvDwxztFd/UGachcqFxVaOzZUZVop43hINKxD37DR1V
	 XM7e8uJHMpA5A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 723C3408D3;
	Thu,  3 Sep 2026 17:39:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Cc: Nguyen Duc Thinh <ducthinh100812@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
In-Reply-To: <apmtwqxrkg8pN0aL@wyuan.org>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
 <aploLWg-i315frp5@wyuan.org>
 <20260903125454.GA541154@killaraus.ideasonboard.com>
 <apmtwqxrkg8pN0aL@wyuan.org>
Date: Thu, 03 Sep 2026 11:39:42 -0600
Message-ID: <87jyp25j4x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <wy@wyuan.org> writes:

> On Thu, Sep 03, 2026 at 03:54:54PM +0300, Laurent Pinchart wrote:
>> > On Wed, Sep 02, 2026 at 03:43:58PM +0700, Nguyen Duc Thinh wrote:
>> > > This patch series performs a thorough pass across several files 
>> > > in the Linux kernel process documentation directory. The primary focus
>> > > is to improve readability and maintain a professional tone throughout 
>> > > the guides for a global developer audience.
>> > > 
>> > > Core changes include:
>> > > - Expanding conversational contractions (e.g., "don't" to "do not").
>> > 
>> > Is this necessary? I'm not sure.
>> 
>> It seems a bit pointless to me. Contractions will creep back in as
>> patches are merged. We would need e documentation editor in charge of
>> ensuring a consistent style, and I think the documentation maintainers
>> have far better things to do.
>
> Agreed. I think contractions are fine as they are. (?) And I do not see
> a need to expand them.
>
>> > > - Rectifying minor punctuation oversights and grammatical typos.
>> > > - Standardizing terminology formatting to elevate professional voice.
>
> For these two points, it's a little bit painful to find other types of
> modifications among numerous "which/that". ;-)

I have to agree with all of that; I don't see merging this series as it
is now.  We have so many documentation problems, and this sort of churn
just does not address any of them.

Thanks,

jon
