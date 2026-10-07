Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A79445D188;
	Wed,  7 Oct 2026 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363130; cv=none; b=O+EWduRoDtbkavMYJhL2vyts4Ou2bqkoCKwgSyBWPoVF0ol9UW1HGEB5JL1HTBYmZkCPXvOc2WR5fZBwegk2xT3tvO6Fy8vdvRWgvjq9D0MSurlSIju/AqFd+h97rmkBOVcC2nplXernwr3TjNZPMOrqVNUAM4/2hG68DKCGy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363130; c=relaxed/simple;
	bh=qfKx8kVgUoZSdHy+qHZUw0wNX3pyueJqPOUZRCeJy58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjjlZdORE1NyI2x1h0hW1Te6lkxYhGCw8svtf6cNLqogIUwndkEcumeM9Jncrpq7z9X1ilEhnmmevtFDMjLWYdICPD4Z03CMMPRnuHVwNgRpqDztyVAL48F8/b8awL84RzJc5iw1hScRqeCPquaLABlnaXLv/02g3wqdepv3t4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=My4a+2Jv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="My4a+2Jv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E9F1F0089B;
	Wed,  7 Oct 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791363129;
	bh=2IzwT/l0Lzn0mFWdIM+oQZhTsq5+DhNcbTaJhC3I8TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=My4a+2JvUPoDyESLa0Os6NTAJXhnmqhg1DoX8qYsCq2NSE8YP5bfXRSG3SK0U+RPA
	 6D94l2quta4uz20fCy1en6a5lHyZq1AxTEldMhB9HeODOjti1wo9XRQdLROLvSR2RU
	 9+LJ2Ti193QxpGrCUAT/5SdfEHHdeDFSB5wactNKVYoILGZZDZ5QY2vXOZS6zVNGv/
	 CdeoBR6Sm6jmtrj12CV0Z7m3e78Kjo2DLNi1INdYqi939Ssbma3cl0EZtwr1/NqNbI
	 nFUgXAq3bVatbnAP8pdlkrpbpBmmu2sFmPaKgv8x+SUKwotZX+XImUeCrl8sFx+nIj
	 JRjgL7pLaoRwA==
Date: Wed, 7 Oct 2026 04:52:05 -0400
From: Sasha Levin <sashal@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <asYINZIUxBL8I4n9@laps>
References: <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
 <arhtsrVb82vr6U-p@laps>
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
 <arkiyMt2NIydrPhE@laps>
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
 <arvFBqreU0qahkXx@laps>
 <CAGwozwEfN7cUZm8usUsSR2bu23ux57QCPxyXJRfwv0tU34gEkQ@mail.gmail.com>
 <CAGwozwHOttyNkC=sdVFCZYKZzhSE=cmUMgNd7cukpEE-WXm9Vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGwozwHOttyNkC=sdVFCZYKZzhSE=cmUMgNd7cukpEE-WXm9Vw@mail.gmail.com>

On Tue, Sep 29, 2026 at 06:10:42PM +0200, Antheas Kapenekakis wrote:
>The kernel forces you to have a local version file, otherwise it adds
>a .test wart. At least on Fedora. So there is precedent for requiring
>the user to create a file to disable some default behavior.
>
>Similarly, you swap this series into a two parter.
>
>The first patch gitignores agents.md.
>
>The second patch adds a phony rule to the makefile that symlinks
>agents.md to the coding assistants rst or similar if it does not
>exist. People that do not want that, like me, touch that file. Not to
>the current readme, please. Be reasonable. Yes the coding assistants
>rst file is not ideal either but that can be fixed later.

But then you would need to run make to "generate" the symlink, which would not
normally happen.

-- 
Thanks,
Sasha
