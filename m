Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798513BB670
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092152; cv=none; b=t0qWkWLykt19o294O0oLkdzif7oOcSkP62BA4z4NJ1zfsXB4OGcKKgfIRbI5r+bkMW8U7wnwxspawuQeOC1p0ajd0hvgM2Dv5yW0Oc8+/k352oGtZCoTd9jbm3n0LnW67H5Dfr5xb6lwhf5Odu7Uk4dHj6QLEC7onIs8IGFuktI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092152; c=relaxed/simple;
	bh=6xPsvuCUZiWtDiYwTCJ2adkdAD9amKFNrL2zN0WQE2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGfnA7FK0iIDWkrJYJ5G4cO+lJSUTgkV9L30E8wLxqHMstJ3QWSUvhxv9kBMgbviYbWS9Xn86W+4zv+yiiBsdV0vQXxZ2c+Il2ggHo3ZFD1CzGaGglO5vSijrkbkeT9Mr88V3/LVKjRD4bDNmsjkGg2iHq3xSB2wYVbiUPz5zKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwpfbZJa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwpfbZJa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C05B1F0089B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789092148;
	bh=6xPsvuCUZiWtDiYwTCJ2adkdAD9amKFNrL2zN0WQE2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KwpfbZJaSF0O1LfAuHE5wIn3l8V8cwFMMW0Nb+i22EA+WmNmywvHE6TuxXlKoHfuD
	 uv6MMg+iPDFyQrsp3WkvJ+Busbm7mhUZ9JP+qaTFViYi/2UgaZLR2R9J0G2THChxA8
	 jJCpvBGH+8GVMCh7Z0B69Yv1RIyzTqASfVqObep1tfjuylJpU4Lz/CeNobrrj+uo9I
	 yVpy/izCgTsJ7FdKiFRiM2Gw92jDkV2uQnBYqrfqBuiDfpyq1ehQ2/SZfHmsui4yjw
	 NZNhuGXB+pnvnG/hp8kC0wNp5ezJ8BsFvZu593HINsYsae5jwpnRphq7im+bV5l75g
	 C9czlR8S4D+fQ==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d2so329989a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybKBWaPsUF1frXdDAEaDmk8c98Dr40Lj4SXapM0Ym7xAf+1/BZreCVY+usY+8s5sCRELn4vgNErqTPfFM=@vger.kernel.org
X-Gm-Message-State: AFuF++l1Lcmx/U7pCZvKScRO5ndosYBenIwd+fNEUE1Lu8bGuWFtGxX3
	mw/PP3ghAgrUef3cQMJg2tQvw6jnNB909m25ezxuidOuhQWzFByo3jsu4KmmQb3XUJdl6MCkT0o
	stHbBCYbTr5528DGRo3XnheLkGluq1oI=
X-Received: by 2002:a05:6402:4028:b0:6a9:a088:6788 with SMTP id
 4fb4d7f45d1cf-6a9b50a3072mr884028a12.14.1789092147099; Thu, 10 Sep 2026
 19:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910183742.4029092-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260910183742.4029092-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 11 Sep 2026 11:02:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9zfsscZ8xaPwdZSbtgfZiMaOi8zH2+c98Yh2oKBc89-w@mail.gmail.com>
X-Gm-Features: AcwNN1XSWOXYM1Ndvz_QLB9icX217ocCOqcN2MvHx90cXrUPU7WMZq-cvovuqio
Message-ID: <CAKYAXd9zfsscZ8xaPwdZSbtgfZiMaOi8zH2+c98Yh2oKBc89-w@mail.gmail.com>
Subject: Re: [PATCH] smb: client: validate absolute native symlink targets
 before NT fixups
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 3:41=E2=80=AFAM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> With symlinkroot unset, an absolute target is copied without conversion
> to an NT drive path. Later code still assumes an NT prefix is present
> when modifying the target and calculating the print name length.
>
> For "/ab", this causes two failures: sym[5] and path[5] are written
> past their allocations, and plen -=3D 2 * poff subtracts an assumed
> 8-byte prefix from a 6-byte UTF-16 target, wrapping u16 plen to 65534.
> That underflow causes another overflow: memcpy() copies 65534 bytes
> into a 24-byte buffer. A user with write access to a mounted share
> can trigger these bugs with default settings.
>
> Validate the NT drive prefix, including an ASCII drive letter, before
> accessing fixed offsets or subtracting the prefix length.
>
> Fixes: 3363da82e02f ("smb: client: fix native SMB symlink traversal")
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks.
