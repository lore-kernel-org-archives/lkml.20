Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469233E6DD0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605600; cv=none; b=rgyDX1xjfnkfw04b7ppSB7bMjC2dKs0V71SImCFrUTy7Md1RzuVbG1mUdYvUSmp1SbRSJgOdrLl5+V9UBXsdZirbbSaGIq7bqQyahgwnKrvSWS77j4fXkkjW0pVB5S4eXIWby2l+mqQnKPVAORqQj7J3sJAqglLkZyUxr0JXTVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605600; c=relaxed/simple;
	bh=GwwIxQgkGwVM+G43IIXtraKZ/pHWrEky2k82RnB0hvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9SXZk5FnpkcDCeeo86GG7TlCKRKXolA9N6PTAUKbjpo2HKrsvlcetRflvCnT0VGAQEzmA1zn4RBf1qsYwfW6htAoAoF95McJMN09GG+nrDlLfZhsw/Qi7TQWZFLgT02wdBhcCLhhCsmY63ODteO8SyXgUy4NwBl3Et4cfuLw1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8p3RND3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8p3RND3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B111F0155B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788605598;
	bh=GwwIxQgkGwVM+G43IIXtraKZ/pHWrEky2k82RnB0hvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M8p3RND3Ta20PlWOdmlPvnRKaH4rU4b9EKO22tdQmYQnv0URL0HU/DSw+Tgzpqpwc
	 Emq1yd/xFSBVAaBz7KKnDjafm9Zb23TdWp5PRqu9ZMKN51ZMDK1zwdlaS/WIMMY3yY
	 qFmA9tU+GqokH+imz+eVXEWO4MwKiC8BxxWbX2ck1Lm+n9mEeRNv0uFNE1NVUT3WKd
	 5XibiSTolZb+SdXOAw1obHXImQEqMgEAgHdUTrOdMWoEL5+d+BVBH3Vk8gdRGcxjT8
	 3yYVgUEHDcTICWc/5FSsrLLtDflqiQgx2O1mT72lxs2UaKl1ilrWxmugeg+N9GYRkN
	 cyNqsbXELoRyg==
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5218927884fso30149741cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz5gX7arKr/nQTMTIoKAXBid66zbuVi45566th3T1KyMuHp+HyL7BqbVbtKOoh8WQ6VJ9XpxPlYgKWaroM=@vger.kernel.org
X-Gm-Message-State: AFuF++kHX675gKCqTpPHIxCPORZJdUtNj2aJbklvoi4G2isqp7I/H+kd
	w2JGYxSkX+LfpP4sWmwIdxgpjGt/i9Nf4dTltYCddIm8OIgLYXTjA6zhQQfRXzsG1LR7tMc6mYi
	4A49hrWFWRu/GOGJ8cTGtgmXekJ/kMuw=
X-Received: by 2002:a05:620a:a412:10b0:939:8116:fcc8 with SMTP id
 af79cd13be357-93981170886mr762226185a.51.1788605597677; Sat, 05 Sep 2026
 03:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-8-dev.jain@arm.com>
In-Reply-To: <20260901054358.4049095-8-dev.jain@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 5 Sep 2026 18:53:06 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ynguzJkBD5TY_b8qJa8-QG+Y4oJOU+s9eHX9VOhR+TCg@mail.gmail.com>
X-Gm-Features: AcwNN1UeolQ4e3PMULxDOqfsECQTeGbroVuUoAuu7VwKERT-1DPC95ILoXEsb8M
Message-ID: <CAGsJ_4ynguzJkBD5TY_b8qJa8-QG+Y4oJOU+s9eHX9VOhR+TCg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] mm/memory: use set_softleaf_ptes for uffd-wp markers
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

On Tue, Sep 1, 2026 at 1:45=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Use set_softleaf_ptes() to store multiple uffd-wp marker entries instead
> of open coding the batched setting.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
