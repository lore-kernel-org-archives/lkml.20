Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA013AFB1C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496081; cv=none; b=jIiBU6pTH7R/RdtB2uaLSFF1bZoVGTMN1wEWwdTIO9PaLNM4ZPrJPYatia268q9S8uxezcPw9D/9MFf2o8Sthn81+AzQexf+JCuH3OQaZB9+jaapVIsVIKoXKB6XVEKbDE/KZABGpJauzBGiMOMoJaqWNS5pgDXJhiR996XVMmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496081; c=relaxed/simple;
	bh=3/FDJbbvvbVGEGneVPYjEYoqqd20hnLqcGTS1/pIIbU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Sp/D/rtg5qN2+dDyr6edt8SU/xUV8NUrUIwun6OtHJ5Ko8OAQUqroY9BhrkdM61kwABcCuqVl55vA434NSi4iq6BhAmQ3hj0AolXA+Fx9Zje8bZEAH4z9PIwghcJ9BY/0zjh4DEZJcgBvlA18uBHFebih+YmWgUWtrz4tJX5hAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0gr/kHqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0gr/kHqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346F91F00A3D;
	Fri,  4 Sep 2026 04:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788496079;
	bh=kCJFtgL6xdcTMGe+9WP8iYjWEvs66hdQP/mx1LoKy90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=0gr/kHqO/4ULNDJqPp84Lr60lI6kRpHpGBsaJ4e4DY0IrOIABLCKnu8b0Zb8++P4U
	 Uz9mbSiKYC/18RzGfoNdYjWOSH2jJ7d56y9bvv+pHFNAGH8w+OcP+QvpuYDENuS+y7
	 1wg732cuJfMcY5ImcFpZd0ZoqDL+FeKIUTzsD2TM=
Date: Thu, 3 Sep 2026 21:27:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: baolin.wang@linux.alibaba.com, axelrasmussen@google.com,
 baoquan.he@linux.dev, chenridong@xiaomi.com, david@kernel.org,
 hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com,
 weixugc@google.com, xueyuan.chen21@gmail.com, yuanchu@google.com,
 zhangbo56@xiaomi.com
Subject: Re: [PATCH v3 6/7] mm/mglru: move folios from oldest gen to
 second-oldest gen from head to tail
Message-Id: <20260903212758.4ee5fec2a7def1a26f19eb2e@linux-foundation.org>
In-Reply-To: <20260904032748.210-1-baohua@kernel.org>
References: <129ecc53-f96e-4a5d-a79c-c05293d815d3@linux.alibaba.com>
	<20260904032748.210-1-baohua@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri,  4 Sep 2026 11:27:48 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:

> On Fri, Sep 4, 2026 at 10:47 AM Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> [...]
> >
> > Could you add this info to the commit message? (IIUC, someone tried to
> > remove the prefetch in MM, since they found that prefetch doesn't seem
> > to help much on modern CPUs.)
> 
> Sure. I guess we could ask Andrew for his kind help in adding the
> following to the Changelog of this patch.
> 
> Hi Andrew,
> 
> Could you please update the changelog and add the description below
> at the end? 

No probs.
