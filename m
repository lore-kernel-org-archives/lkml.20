Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8813D17557E;
	Fri, 16 Oct 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160732; cv=none; b=OLcG+5eTDeRUxf1v7ucdbYbfNO5tSHpaegqlgbICVLTMzeJ817/CJqjWADFTsg9jq1ONQPUqmBEPJQ9f4YfiFvNqfUFmSeJZXrjZ90UdHcb/B826wFQoRlmnp4AlBMLbHd3oTMGiDtW03HPFykyTcogioy5SpwSU1deZSTryjQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160732; c=relaxed/simple;
	bh=GQrvKnMMNUdTQuKTzxMmg69pWQjssONnnHaNG26+eUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KRcG4i6ByuJZnd2yxB/zjV0awvWcrmZ+Naj+0QwAIIoSKYMIObH6JuxSUJDsKY5C2Sh/7Qf0yjZbuM/ksEoY2JytOxW2sVVYK7qaHBoJuuFtdFAqASUcmBYQ3qlwB5mxL1sIhDNljTuesKaEtkoKRrl4FAl03EArXCYajFitaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K4z2r3JO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K4z2r3JO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CEB65408F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792160724; bh=++8XgFSJgao18+xUbeHtbmy/4oLAjkTK9xKsNH93iso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K4z2r3JOIi91FglGJPr4O4HBO7j2TlnMS+sWBgvWJ0V8lTohq+SUaToE0iYFsW0YY
	 7D9hgvl+UXgSQJUTWK5GL/CY9VVwMZvpRnmY3lyABZb0efLyvRHp44x5qKaM+AYKV0
	 WUUOiqRtW56xbF/2mSEL8iGBzaxa6vc4nuCmdc078FcrXXThc7ZAii+jORRjMj84Cp
	 sh/a1D0Jwf6m/GZf/F8J0dNroNGhX9YzWC/gkKk4iKytCboREpyR/elIGnjDPFU9rJ
	 Zs4am9A+ametWP2pjY/uhvRvHWV4RIjMJwJfqj8aanQx+vZadZDMFDJPnhgj9q1ueW
	 4okIOF78lZywg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CEB65408F6;
	Fri, 16 Oct 2026 14:25:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Jakub
 Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
In-Reply-To: <atIw3EWamd4KN4VP@gmail.com>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
 <8733u8w6p4.fsf@trenco.lwn.net> <20261014233956.605e0960@foz.lan>
 <atIw3EWamd4KN4VP@gmail.com>
Date: Fri, 16 Oct 2026 08:25:23 -0600
Message-ID: <87bj8toh7w.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> On Wed, Oct 14, 2026 at 11:46:13PM +0100, Mauro Carvalho Chehab wrote:
>> On Wed, 14 Oct 2026 11:08:39 -0600
>> Jonathan Corbet <corbet@lwn.net> wrote:
>> 
>> > Which versions of Sphinx and docutils have you tested this with?  I
>> > needs to work across the full range of supported versions...
>> 
>> The minimal docutils supported is 0.16, and the minimal Sphinx
>> supported version is 3.4.4.
>> 
>> You can use /tools/docs/test_doc_build.py to double check if your change
>> is compatible with the minimal supported Sphinx/docutils versions.
>> 
>
> I completed the A/B matrix using tools/docs/test_doc_build.py -f. The
> full matrix shows the improvement without a regression. 
>
> I also tested Sphinx 9.0.0, 9.0.4, and 9.1.0, plus the previously
> discussed Sphinx 9.1.0 / Docutils 0.21.2 pair.
>
> In total, this covered 32 combinations and 64 full htmldocs builds: A
> unpatched and B patched.
>
> Successful, with identical A/B output and normalized diagnostics (26):
>
>   Docutils  Sphinx
>   --------  --------------------------------------------------------
>   0.16      3.4.3, 3.5.0, 4.0.0
>   0.17      4.1.0, 4.3.0, 4.4.0
>   0.17.1    4.5.0, 5.0.0, 5.1.0
>   0.18      5.2.0
>   0.18.1    5.3.0, 6.0.0, 6.1.0, 6.1.1, 6.2.0, 7.0.0, 7.1.0
>   0.20      7.2.6, 7.3.0
>   0.20.1    7.4.0, 7.4.7
>   0.21      8.0.0
>   0.21.1    8.1.0, 8.1.3
>   0.21.2    8.2.0, 9.1.0

That seems exhaustive, thanks :)

I have buttoned things up for the first 7.4 pull, but will consider this
for later in the merge window.

Thanks,

jon
