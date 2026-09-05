Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25753468C3D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605538; cv=none; b=hkYM5rydrDlxW50/eBWyczxMIZsSVAVhP9oRj2xVsFZ+syZ1w2ACxJpcG2zFGLxaKQw2QsAzqlxHz2BYvLAaQyGtVKVJ8wkjYi5/C9zSj7AE6f9tgMhuqilneXZLfUU5/i5pbMIvRTqFqWuhiBzUXTv2G4XN2IffrLm0OydEdr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605538; c=relaxed/simple;
	bh=NtchyYKwRIGUXVrtQ0jO9YBLefxN8FB3ugsFlO16HMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S15r+NKCukwro69CcJMH4UQzGRkjdmjF9gE+/pylz1o1K3BK2hDjc+heVRdUnHvTpVEDTmbRHXKjlMfRW4UCch9M/OifWYfesD4UPx5xeB3DJuUSU7oPScItr5sh+vvVat7JYkR8UJa+MHi2KRLPNcmxJ76x+49rx50zRS1WIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQqBzJ9S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQqBzJ9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4F01F0155A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788605536;
	bh=NtchyYKwRIGUXVrtQ0jO9YBLefxN8FB3ugsFlO16HMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IQqBzJ9S7MhInSmQHhC+/89oCvr32JPoZr+9dQW/UnrRnR2oTG7xNeZ//8VgQAuoZ
	 bel7HWxqYuux6YK+Ua18fxGY9h2IxGqIjhCzwll8RyDeA6W5EQX95XBislwdJFkDlT
	 Bq+BewNXMCQaVQk0Yc51QufIb3lJ5T4UJ3MUeZfwZxecyqfRlOTJpgVc+3/0Z3UOov
	 5lS2I4L8c/jaZXk1YNdJ7gywevQOF+2E7GcRm4NdpHU/34Jy0gDwQWdRIO7erXWD/P
	 xYwyU+6q3SeQfDrLmAb4d7fYqgMoxA1G8O1aFGaIrBJtk0EqqerT299+4MlM5pRm5H
	 aluI6YGYPv+lg==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9399c77e2ebso2170085a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCLm6NkdsvorWE9xLVz/Y0ibWWb3vU9LWxy1p5JladNPOBLG4vAqhQ1vRKyhPj0XWMcZ7j6OnCrbEpiaY=@vger.kernel.org
X-Gm-Message-State: AFuF++kgcghacze9q7iqWT4Lc8bQk7utBIgBvite7Sbmwn9W6PRRzI6r
	Rkx332yHRmFQSEz9f2xYAtygQ+BsE84JZ7R7Ns/SdDhbA7wB9KzkSPgLpw4rmeVtqTkTACt13W9
	lxJVHH8RBdz8J2tS/RHt+oTYgJFqMMIQ=
X-Received: by 2002:a05:620a:2905:b0:939:934b:dd61 with SMTP id
 af79cd13be357-939934be353mr216074385a.22.1788605535375; Sat, 05 Sep 2026
 03:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-7-dev.jain@arm.com>
In-Reply-To: <20260901054358.4049095-7-dev.jain@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 5 Sep 2026 18:52:03 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zByTsOgMRZHPsqiFw9HhWCJhtfkC5aYSnmyTYCqr19Lg@mail.gmail.com>
X-Gm-Features: AcwNN1WqV8gqvn0kri-vxqJflABlnJROJZJbXDW0Uofbb8st9bHSXv2-ep7QvYY
Message-ID: <CAGsJ_4zByTsOgMRZHPsqiFw9HhWCJhtfkC5aYSnmyTYCqr19Lg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mm/internal: add set_softleaf_ptes
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:44=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Currently we have a helper called set_ptes() which is used to set
> consecutive present ptes in the pgtables. To do the same operation but
> to set "consecutive" nonpresent (softleaf) ptes, add set_softleaf_ptes().
>
> The softleaves which have a notion of consecutivity is swap softleaf,
> and those grouped by softeaf_has_pfn(). The latter is trivial; future
> code can convert present ptes pointing to the same large folio to
> swap softleaves with consecutive offsets using this helper.
>
> The other case is softleaf markers. They do not have a notion of a swap
> offset or PFN, so future code can use set_softleaf_ptes() to store
> multiple (same) markers on the ptes.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
