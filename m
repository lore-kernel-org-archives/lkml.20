Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741CF4E4323
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555178; cv=none; b=cp6J6BMUXRgw4i6Zhbq3Os6HInsIxLj5Wq/9yj7+1zoaHktwvHW31k464fj4YXqwYKDbcGXpW6Jzg8e2UFwCOlclmr9uY1RX3bVE8DECNsePPzPyMALWDe0tu/8wP0JH7rn9TAxilH90OztvIKHD6arii7QqJgrp0vzabDy60J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555178; c=relaxed/simple;
	bh=wocjecccdY/ci/ZVU26HIKMQ9QjdMuvBoMdEk+FEx9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZAR04uKzuex+WMzi6KD/2vW1Ne6/3oXXKMRshdsFtm40xjGYivN6Vj4NMzOVDtm7yZOqL7U+X62dYN0SrZmKRcrYc8TRSm7aR4ox/Ql8OvsxyxiVlp+050KJB3G7sguLWkPjLCDf+F/4xL8nabbAyXHQGPzbamN8Nl2j0BWE5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXINKFm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXINKFm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB701F0089B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555177;
	bh=wocjecccdY/ci/ZVU26HIKMQ9QjdMuvBoMdEk+FEx9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XXINKFm+cV59eB8Os1UfKas37rSnpk6v8WvhHmAVSmp+hRDwBsiuqLL0r8kJiAJP6
	 gPkUJuqV1lU6d753L6CWUGfMfFzUCE7jzs+Caxobl7R5muOM1K5pl4dhbJLCGYpBpv
	 6o+aJ2bjvSf9KVOjD6/NLDosnNr+s2NvmkeqRFEOD2kSNJtuNbAmY58RTft515PxKb
	 8w+3/Kp8poKjMYNBNFVbM/nvH/maX8oPPcHyPx6zNo5m9JUQAkD8AH7ohLf6etz32k
	 /fHgTwEpffo1kqTF6C2Mvxj7gsssxgII/4pXLrhUs/3LSZWa1DQIiS9q2wBA6YbKO4
	 KO9B9LWWyK8mw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3156e7705cso792452166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:12:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxYynKSn5cU02N2B70Qo8SWP82Gvjlnstqxunub3jCU/5CD9WWndA30FcS7mki6ah6jQxJ3ZKH8Q5nZoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+C0B4y7VzJj1W/IVI5ptNlIH8C+i3ucHQwdLXh03azwOXWMvE
	BlleV+34imWRtuaeAooJ3b7jD/Kh0kZIc40qRb34YjmujHNguGbldIeWuR3zqJnF4NB6xEfqNkc
	oq8QIJ9VhhQOv/E9BuZnGIGq0Ih9pAXQ=
X-Received: by 2002:a17:907:3e1d:b0:c2e:640f:f9f0 with SMTP id
 a640c23a62f3a-c31a9a28fdamr243069466b.5.1791555175695; Fri, 09 Oct 2026
 07:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009093020.1018892-3-Yuezhang.Mo@sony.com>
In-Reply-To: <20261009093020.1018892-3-Yuezhang.Mo@sony.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 9 Oct 2026 23:12:41 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_5PztOY2wAmGzZQpafQobyjziD0NSyphdZ-mzSmmDrkg@mail.gmail.com>
X-Gm-Features: AclHuK8AK4rUzNI4EFKtplGabIcKRhxh6pDH_Tp1LSS953WdhmJjFp5PxI51LEc
Message-ID: <CAKYAXd_5PztOY2wAmGzZQpafQobyjziD0NSyphdZ-mzSmmDrkg@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: mark straddling folio RO and zero the post-EOF range
To: Yuezhang Mo <Yuezhang.Mo@sony.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sj1557.seo@samsung.com, chizhiling@163.com, dxdt@dev.snart.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 6:31=E2=80=AFPM Yuezhang Mo <Yuezhang.Mo@sony.com> w=
rote:
>
> When extending a file across a non-page-aligned EOF, the folio
> containing the old EOF must be marked RO so that subsequent mmap
> writes trigger ->page_mkwrite() and update valid_size.
>
> The straddling folio remains mapped to the same filesystem block
> after the file is extended. As a result, the existing writable PTE
> may remain in place, allowing mmap writes to bypass ->page_mkwrite()
> and leave valid_size unchanged.
>
> Furthermore, writes to the post-EOF range may occur between
> truncate_pagecache() and locking the folio, so the post-EOF range
> should be zeroed after marking the straddling folio RO.
>
> Introduce exfat_pagecache_isize_extended() to mark the straddling
> folio RO and zero the post-EOF range after clearing writable mapping.
> This ensures that data written beyond the old EOF before the extension
> is not exposed as valid file data, and that subsequent mmap writes
> trigger ->page_mkwrite() to update valid_size.
>
> Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
> Signed-off-by: Yuezhang Mo <Yuezhang.Mo@sony.com>

There are still review comments on sashiko. Please check them.

https://sashiko.dev/#/patchset/20261009093020.1018892-3-Yuezhang.Mo%40sony.=
com

Thanks.
