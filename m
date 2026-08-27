Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1E53B058E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829851; cv=none; b=qiE24DsM4KU4d9WmhEJul1hNMCf75DyvtxkRB7+belQkLwTjmw73KszkCDkdkfWcDmZe37AXLTeUKjaKYEsNE87m8DP5Do7wx1JN8QEq/9ZQkl2COk4Nvao0lk8/ql9GdCwLhvb/SQO8acPaBDD6aya38BfFTfvf38bCOCeNjtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829851; c=relaxed/simple;
	bh=HsJi/kmbOkPyWXILRsepipv/BWPqAwuHAhhkZSW6x84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8pP6rJTvGY8sgZGTtzuYUilmqzOedQit7S1zDH8gWc7SaNqqApglY36NLQA9MCJVNXqrWnB0kwp5txPIgvqKyDD0lFshNOBnjqNB/gCUYXAmxbGj9TFMNucWd03q4VfX8nPxABZnnlI1cp8vyHPKWsRQUAbn+chu4HK4MQmQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ghq5N55T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ghq5N55T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A176B1F00ADE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787829849;
	bh=msnrvx8LAnGtyTEJd5pnZspkDeQKGfyI1P9cpd8MuMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ghq5N55TXxTo3GYPbb9WpAyTPm1WQenwDZLll4AY5nD7gYnwMXEQ/Adyyx392v1fK
	 HnQ1ndpdvjLr+GBt8nS/jndKghcvFEgvXkO8h/l1F4W0+NaFjTb+N/PtWpbo+TyfyG
	 RBSlNf+yNOEFqGae2IU6q4eyeHCcZlDsOki9WbxIarlbMbmEKSbF7PgiUW1KT1OwiP
	 2rqAhsUDQYzb62VKSs1bsNg4TIi0r5av7m8HCcLGDKSkjBm+nSH87d7f/h+dCuD1S3
	 iIrx4ALenpfUd3rtISAy/ZMNSA3zuWicDipqQxqtoRCzh5BWy7NcooorIAvZHJbhIn
	 YwVlGCg/KbG/A==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-936c02e58dfso120253085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:24:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCGZoO+3hR4mgCBJ5rXVR0cPlQfCiv7GohABCvyqxeoCNWMJxXvmJYSP77nPwsLYLMAwxBwjLC2gOZNz0=@vger.kernel.org
X-Gm-Message-State: AFuF++mPLGPPWKrFokfOltNv8fNBCLoa7lviWGaE84LulTOU11gc0BuK
	cqbHIo8XyoaxEJ38Rt7VAT8nz/bh+f0Kyxo4fMEGsM8438KsOzvBnuo6CVZVc4zbmX1B3Jupd0f
	hwVpys+lDUrBiRh9w66ZqYLGeuyqK+4w=
X-Received: by 2002:a05:620a:2255:20b0:92e:4bc9:6ea9 with SMTP id
 af79cd13be357-9377fe2fa36mr1030747285a.0.1787829848970; Thu, 27 Aug 2026
 04:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827103435.1371882-1-kas@kernel.org>
In-Reply-To: <20260827103435.1371882-1-kas@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 19:23:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w+eFiu6PvVDekmo_qSiRfoH-YJ=XfqvCoRJFZV7wfTSQ@mail.gmail.com>
X-Gm-Features: AcwNN1VxQoDPZPuAv0nEmdx88eOWIrEn4l6ErRMl8bIF2cOB8XKs_Few57OFOR0
Message-ID: <CAGsJ_4w+eFiu6PvVDekmo_qSiRfoH-YJ=XfqvCoRJFZV7wfTSQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 6:34=E2=80=AFPM Kiryl Shutsemau (Meta) <kas@kernel.=
org> wrote:
>
> I have been working on transparent hugepages since 2012, starting with
> the huge zero page and file-backed THP.  A lot of the code that causes
> pain now traces back to me.  It is only fair if I share the review load
> for THP.
>
> Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
> well.  It is also my commitment to be more active in reviewing this
> code.
>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

Welcome !

Reviewed-by: Barry Song <baohua@kernel.org>
