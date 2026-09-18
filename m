Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0674434985
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709506; cv=none; b=N+3iYzSpLlUVheRagydz7eYoehZBu+X4Zt12cUDZKkT/gfoNENNLf0iHQn0MghSG93To0jCEki4/pshlof+Nk22f1qrQ7Ve+H1wNcgdJFbQN9ue/rsMt6zy4BAI49Ac1tb/By2ILkHQh1LP/9Qm1hURBlNunVm0TM7/xH7ELHh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709506; c=relaxed/simple;
	bh=lTKs4UNutRziimqfjfFRRtWf3g6axFUgMAOFzei57H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H31lXoWSuKp6ssAqfd5pX8Q43cI+uu11urB+K4C/3AZTXpVHOqdDtGUen9dR7E+2uUunp5iZg653aNJyH/iSegNzUU7tjNPAdC5MWzfuI/4V+wpGkBM/NV+jdNSlaV7EempSCRVEzOV+mZiYsHL/Wm/j2WJi2Gle0skpYwr0trI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XALPkTHI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XALPkTHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7991F008A1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789709500;
	bh=lTKs4UNutRziimqfjfFRRtWf3g6axFUgMAOFzei57H0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XALPkTHIOXBAgobYA6UDVnDozvAdDLZC3xRanFKDF6fM0hJbu6itU3Gfxx6Xabvj+
	 1Sdd1vlOKXZusbYwc0YBQgwFyAzlDjI6yUqNT3Gh0uOia8qwC2+Pdaw7wZdGps/fDy
	 yBUYPAT7zJeWwVNb66vHcCJ6mBsXXL3g5X9SW+SG3Re1yc+8b+QdQjYU77ehMeXe56
	 1lAWGkwi+LVNIjMVc0pQ6/b9+Yfss6yAmq4XUkUDPPm8d+Ew5YRRJwvcnlPhcvevMO
	 dfsztsa9sz6MzGqF03erFilyIWLi+WGGgxN2S2mvP9KK2NYlM5aKVv63tLZGzLcuGe
	 USBPFM+N87EaA==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa8so36033185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:31:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBweGocUjOV3JYZaxXgcbF/Ec0Zi+mOQYpOrSDTubWXFqRNj5By5bP88PpzNKtYzetJih++EBMHsBv0VJQU=@vger.kernel.org
X-Gm-Message-State: AFuF++kwfF15yX0Y/0/60kFOIHGHODu48vUJeYKn9okRfTatVp00nzjf
	3ZRPq8LSrRvpxd0v9PIXkHHZ9fJDLmbzGc9LM/wWbZqcCOKvRDfNfpjQG5NeTxQCnreDsiSbi2T
	82zKMPMDDhioBokx9l/lQ4R1yWGCY4qE=
X-Received: by 2002:a05:620a:8014:b0:93b:d79b:9a72 with SMTP id
 af79cd13be357-93bdcb308c3mr211352285a.83.1789709499349; Thu, 17 Sep 2026
 22:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com> <12bac4614aa4b37490e92051d484f4f2cb215076.1789701677.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <12bac4614aa4b37490e92051d484f4f2cb215076.1789701677.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 13:31:27 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w-tgRiaRz0HN9yuC6uaJ7TbzcyZjhZ8jAeoFP+Vh2p9Q@mail.gmail.com>
X-Gm-Features: AcwNN1VR6l_eDj5OOibm_tX3rRIND2K28WTb6XdqoNZ1l5ovR0kEfYMCExbY97o
Message-ID: <CAGsJ_4w-tgRiaRz0HN9yuC6uaJ7TbzcyZjhZ8jAeoFP+Vh2p9Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] mm: khugepaged: remove outdated comments and check
 for shmem
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org, 
	ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, 
	usama.arif@linux.dev, kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:59=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> After commit eb92d97f7e6a ("Revert 'tmpfs: don't enable large folios if
> not supported'"), all shmem mounts can support large folios unconditional=
ly,
> so drop the outdated comments and the check for shmem in collapse_file().
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>
