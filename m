Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE5E435537
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788045832; cv=none; b=FAT1XDWiEc/c1u4L17uVQCvkpaXexJZKtHPJAB3FVlbT99Ts4Ko4t8V2hZ2PdSAOntxNL2euGBqMrEV4lEQNzXEm0G/BqCDpiLAbHLoIfQMqWDCbM+akQ/BGLQzu66fdslZ/k8EOF7UtrgTwSfg8OEDJdGD8ntBmMELIn+/Cis8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788045832; c=relaxed/simple;
	bh=N8Gz9McofzWv535xF+nEz2d6Ic2C4DrUyBwMDUrsIyk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Hc+VdWMJZ8/+1wOVsMzLSdyPqLJfnJWB7sw9sI2dKNQ69YqkDoxZRyLbupdu7rZkjgDwdJJ6deef5v1HzNrU6bwHVmdFqasyTEz+a0SihXBvkGAp+0BiQE5fL+cQ8VYW/IiY7AA2Qa2mP8uIGB6a/pkdFcs4fHCXENEiqf55nlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DpOSND2m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DpOSND2m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E441F000E9;
	Sat, 29 Aug 2026 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788045831;
	bh=49gEV2enQJtI6Pn8/a36/WznBZaUenfunZ5KLnItoNQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DpOSND2miLdB1GD5NgJn8Stt66Q+x8L4/1SQCLOD5EQ3kWTnN/TrSIEIfa5MfX6LU
	 sONM0Q3H4a1+VLJ00yg8SklvsdoZMBWr4HhzvLTHFrUOHXBUoZ23UXcirnTwWzqtTN
	 i3r6cI4OE2Xvfv/Q7cD0BU7+VzIvg587WFDWUg3U=
Date: Sat, 29 Aug 2026 16:23:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, usama.arif@linux.dev,
 brauner@kernel.org, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v4 1/4] fs: fix missed removal of
 super_fs_objects_eligible()
Message-Id: <20260829162350.1ee9e17d71a297b06b171941@linux-foundation.org>
In-Reply-To: <eeae0d48-4d50-4dd4-9e16-b4f9902d84f4@linux.dev>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
	<3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com>
	<20260828114129.909edbfb7e42b36af2da6a98@linux-foundation.org>
	<eeae0d48-4d50-4dd4-9e16-b4f9902d84f4@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Aug 2026 09:49:44 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:

> Hi Andrew,
> 
> On 8/29/26 2:41 AM, Andrew Morton wrote:
> > On Mon, 17 Aug 2026 17:03:25 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:
> > 
> >> From: Qi Zheng <zhengqi.arch@bytedance.com>
> >>
> >> Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
> >> individual filesystems") forgot to drop the super_fs_objects_eligible(),
> >> just fix it.
> > 
> > Oh.  Why?  Please can we have a description of what's wrong with the
> > current code?
> 
> As I replied in another thread [1], this fix and commit 0ef8faff490be
> together make up the complete patch originally sent by Usama [2], so
> they should be squashed together.

0ef8faff490be is upstream so they can't be squashed!

> Without this fix, all memcg-aware
> nr_cached_objects() will be skipped during memcg-level shrinking.
> Besides the newly added memcg-aware shmem huge shrinker, XFS will also
> run into issues.

OK, please add this info to this patch's changelog.  Please also decide
whether a cc:stable should be added and if so, ensure the changelog
makes clear why we're recommending a backport.

As part of this, let's expand on "XFS will also run into issues".

Thanks.

