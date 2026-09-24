Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EF35C6B2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283011; cv=none; b=kanG9BEjfRjj7ftE1BrmTXc1IlpTJiiTzaQGxBfQrWAqvwwKPHqVUSuaIR7rpaWOuV8rK+U+l3KipHQpXlAIoi8pozwvF3RqZZHMv8No5JKRaQjM3cLfI4xK3h74dOia1rRxQTF2hPf/KPjLq8mNDqmTWA/ZhOHv/YlZJp8V1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283011; c=relaxed/simple;
	bh=Q+5hSUgLRco8Y6SztQmttTVOAj16Ju9U76wx3kQ59ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCNPL1NW1vF3lbNqewtN4WTX22Cd8VahdLTUuO044JtPmwws73whqJ7RcokgUZVcV+94pBNfo9aNwGtO29FfgAahnn0A+8pkKytSeWdQs1C6xYAw26F2S7o77c1Oq4QPe47hrfnG/fCaneGVHVAJW3wk76ZS3fgtIX3lLkoxG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnZtoxDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnZtoxDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22CA1F00898
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790283010;
	bh=Q+5hSUgLRco8Y6SztQmttTVOAj16Ju9U76wx3kQ59ho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FnZtoxDGh/uBvSnm9FYLg5Ef8RadgMeHyJbMn3WuO2kLW/CtOiBSM7pUwNfkJ7pSa
	 gtctJh3CvDnUWO8YQttG8hbx26uR4xKKDHQWnpk+7bWEB/elSbZjAWmju0yWZxuewQ
	 zKrN3gbVz4e1+6uoOAcYAQnypQNrEGk+4pmnCJoJHev2Kalsunga5gSjanl11GqCkV
	 DPlVCdzgA7Ue5rh/wrUkA5DRST49Y8l2k2fAX8EeeYtpjG+q8YBK4PaoD2Xr468UKT
	 wiVhwqRNWjPcQMar4L8seIPtzVrmq8RtZMfs1m4+bB4NnGH6RCuz/V28v2NKrXZUnR
	 GWWJGBWofs0Ag==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939eb3249c1so19050085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByefd/XN510Ea+dBk5j/y5jzY2epd0+c5swoGS2slCMUYMbn1TxxnmWAORPk6sY3a1+1cToO/YtvUAH2Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++mMyxZ1AlPdp9QarVf1Cle9L//9OzwGZqEYR9ricuOXAPDlI2ln
	1RgQDSYHX6/6jd0roY4crVk++1KmBP45cm1sOa4uy6JCRfWrxYeHD3S1NrtqT2lkT8BYeyXYPRP
	5GOqs8f5oDf2TzcDPS5fVKPKQlvVScPA=
X-Received: by 2002:a05:620a:4506:b0:939:9d06:e997 with SMTP id
 af79cd13be357-93c43c95edemr89967185a.26.1790283009873; Thu, 24 Sep 2026
 13:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924191103.3475117-1-usama.arif@linux.dev>
In-Reply-To: <20260924191103.3475117-1-usama.arif@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Fri, 25 Sep 2026 04:49:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yiSp_9R5Bc4WR3UF7th03c+FsNyDPK6cyHfpiEGHveyg@mail.gmail.com>
X-Gm-Features: AclHuK9L9SJ1j1Bl7NzcGznD7Wnm5jocUxdYyhg7nXWVX1BHCFN_NNxlXTqkJLg
Message-ID: <CAGsJ_4yiSp_9R5Bc4WR3UF7th03c+FsNyDPK6cyHfpiEGHveyg@mail.gmail.com>
Subject: Re: [PATCH] mm: remove the unused zone->unaccepted_cleanup
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, david@kernel.org, 
	kasong@tencent.com, liam@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	rppt@kernel.org, shakeel.butt@linux.dev, surenb@google.com, vbabka@kernel.org, 
	weixugc@google.com, yuanchu@google.com, hannes@cmpxchg.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 3:11=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> Commit fefc07518227 ("mm/page_alloc: fix race condition in unaccepted
> memory handling") removed the zones_with_unaccepted_pages static key and
> the work that decremented it, but left the work_struct behind in struct
> zone. Nothing uses it anymore, so let's remove it.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---

Nice catch.

Reviewed-by: Barry Song <baohua@kernel.org>
