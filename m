Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D994477FA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709600; cv=none; b=XZBiabUVWSUDRRRX4k7700WcdSgsiJoBl65wEokU0RYghelTJPIfy4lL371FySzTj9zXbpAnZIAnVcSYYXc/oiFcUDN8CVErDvoTtfmxjgi1im75KLrJf0fpIaYbGlEmiTsEZEsaHPII2MeysHfuF73ylv8nftcJmVE4FknWxSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709600; c=relaxed/simple;
	bh=MrqgHKZBnXQS3LTmL5rUHDGXosNV/i35MDQkSDwdDWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2N2RqVVHjlVi4ecQK4o+xV1f8I/nuLVBbPkws0fxGDtNTAk6tNH0syFHe1WXAahtpfJ60g09xPCzfk3QS0xqLCHfk0PYJRg7xTEu05JvSdaYIv4j2Kgs3aDfpo/F1PgXJMsLJiR2Kk5VCFpZvZXCaB9/0e45mMKvYFgLrP4X/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STYojl8L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STYojl8L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56281F008A0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789709597;
	bh=MrqgHKZBnXQS3LTmL5rUHDGXosNV/i35MDQkSDwdDWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=STYojl8LLgSZ7rBrlPv5o0I6UROlGvodjFfimLAr//VC2GdJ/rpCRn/yUuNi/NW8h
	 WWyDq0DQzXbXKBd+xO1mscTIEDIQBKbJpx+YZ4xEac7Cs6afGKTUh5loXxO7eGghhU
	 mdN6rNBV0SCuQoELdk9V3LQ+jIIZX5UYSV+/XGmAzLnnzVPgTjxO3IouIDb2Wdcc6o
	 xU3+tQSuiaVWElT+RdKGP1PFpzB5jGxnVldVfRbLwMdl1OaPHXeupIvZzAqwnf+HlI
	 H+ZRs8Y4r1D9zORVktnUOQeS++cxqbbEQWpaIEnPIglBGM/hBAPeB8va+RyspmGigH
	 liT8ztP1u99IA==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939695b5741so33976785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:33:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfi06XtWrfjUtAigMoLi54qkSTMevK3gwxASXc7Bh/hfDdX0H1O3tQKv7Id/4JutEZklEjv5AMJu9ucvw=@vger.kernel.org
X-Gm-Message-State: AFuF++k5L6KT446g91WXwUd9KJ2Fb2NlIo+tcbXvXZaA3TY1fVdcRY3/
	XV1XtfHkVf14fF8kzop1Pmnn1hXSzAYKNVKt6ZZXLZwYPcGSF97BQirCIGbxgb62xaEMOALyron
	ddnpTtLHskz5t9ywWb2u6fmCAcg9NCEc=
X-Received: by 2002:a05:620a:7114:b0:93b:d7b0:c96d with SMTP id
 af79cd13be357-93bdca1fbd8mr175287085a.78.1789709597052; Thu, 17 Sep 2026
 22:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com> <e4d6918e2e420a2378e8f8c502ccfbad2a7bc2d1.1789701677.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <e4d6918e2e420a2378e8f8c502ccfbad2a7bc2d1.1789701677.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 13:33:05 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yLMG22e+ugYbzCy9nsFcYbMAgD6Yy2JnvSmGkeByqkNQ@mail.gmail.com>
X-Gm-Features: AcwNN1VcNOsKJhYjJrG4_QwdawIGy_yHrffsBL1ZX4iaZwpmnTo8DG5_7w7tqZE
Message-ID: <CAGsJ_4yLMG22e+ugYbzCy9nsFcYbMAgD6Yy2JnvSmGkeByqkNQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] mm: khugepaged: drop the hugepage_madvise()
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org, 
	ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, 
	usama.arif@linux.dev, kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:58=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> After commit 2fd4e7693674 ("mm: fix incorrect vm_flags usage when checkin=
g
> allowable orders for tmpfs"), hugepage_madvise() no longer calls any
> khugepaged related functions and only updates the VMA flags. So remove th=
is
> helper and update the VMA flags directly in madvise_update_vma(), which
> simplifies the code.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>
