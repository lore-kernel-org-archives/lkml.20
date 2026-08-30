Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03952F84F;
	Sun, 30 Aug 2026 23:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788131180; cv=none; b=oevh2G9ddh1RbLDqSdrEJ4IDIE9TwP6PCrf6+sJ6aWHkx95RujQ3HIfMvE6t5ASTTfVb2QTEQpGjMu4jKJT21YJDoiQsOxnmNUxAVpGn1ZMnAm1Qdxp02s7u7yBArFG1aFV9yJpNlYyrjN/othxFeeukKjaNyrnqyIP5Imk365k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788131180; c=relaxed/simple;
	bh=bJL1sj+VUGJlpxKrKA1cmuTRFOofhLErs5eGBwvODGc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S6eQPTblGeg8zr7hiBYODn9CHr1xxDiNqSQoHqvkhND06HnRL8/z2UBh8tKTo4XwdzkQCuG7om6vu92jU/2vZektYEIehrVgj5QBYbtUnQ1+SiIGa8zYH9Gc6PfJyylGWmWL0rV5MuoGVXiTKL957QEne26F7RqXCe3dz+hiIZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sxuBG8Ui; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sxuBG8Ui"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 752AE408CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788131177; bh=EzJOdIDXA4HnoxbTkltuKMtHqQbHFE2iHHlfUADXXA0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sxuBG8UiFeGIByavP/WIv+Zm177+8cgtySew+xHm4RNwhJ+M6DKJRv+6H7fmAPeHq
	 hjwhTYbJqBesvunMTE/bIzXlCbFzPXcY984k5lvGzlYnXtlAcuH1e/UmzXXSNp8wPK
	 pu8qQKsGB0XmAabBqbRJpWgY1vuEhgN6CHU/8b6s7vbq8XVoxFMfMD8fT8znXNVLbQ
	 +pKgrMmKnt88AqIxFjn93ZQJodQy0LtJJywr/4N0cnU5qTpOSdz34BrYy8kzIDcnfA
	 ltvvjFrzCYqFh9X0io1YYB6LYrMSfloWcxSVi0Q2cFgZb5hUpwgUcMi5VkkUSCJOAQ
	 +OT80MWQVVSwA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 752AE408CD;
	Sun, 30 Aug 2026 23:06:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?B?5L6v5pyL5pyL?= <pengpeng@iscas.ac.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: dvb-frontends: ds3000: validate firmware size
In-Reply-To: <5c173af9.ec340.1a054d9be08.Coremail.pengpeng@iscas.ac.cn>
References: <20260830124034.95459-1-pengpeng@iscas.ac.cn>
 <87o6ejll9n.fsf@trenco.lwn.net>
 <5c173af9.ec340.1a054d9be08.Coremail.pengpeng@iscas.ac.cn>
Date: Sun, 30 Aug 2026 17:06:16 -0600
Message-ID: <878q5nky3b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=E4=BE=AF=E6=9C=8B=E6=9C=8B <pengpeng@iscas.ac.cn> writes:

> We are a systems software research group developing static analysis
> tools similar to Sparse and Coccinelle. Our goal is to publish at
> venues such as FSE and ICSE while also contributing useful fixes
> upstream.  Most of our kernel patches originate from findings reported
> by our tools and are reviewed both manually and with LLM
> assistance. Dynamic validation is often impractical, especially for
> hardware-dependent driver code, and emulation is not always
> sufficient. We therefore rely mainly on static analysis and careful
> review, and often state this way in our prior patches:The issue was
> identified through static analysis and manually reviewed.

Which is all good and fine, and the fixes are appreciated, but you need
to be citing the tools in your changelogs.  Please see

	Documentation/process/researcher-guidelines.rst

and

        Documentation/process/coding-assistants.rst

Thanks,

jon
