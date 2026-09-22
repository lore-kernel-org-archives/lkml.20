Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB66568FCD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098315; cv=none; b=BYDu90YuK7XZyuw9uqsPPb2A1nKhA6IcI8I43t4ZAK9glKM8czRJ8ZJmhyd6ipXTwNs2Ym/XP/py2qSxEk2zGEYDzwPoQIuOKVldIVYLa3hq+YNrvFzvXo0PRtLfJbYg54MPFyUYE8MuqhMorQPPBlJvpELQfckd3HdO3ye8hrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098315; c=relaxed/simple;
	bh=p5KgkY35eLeEIt1ZauJe014QkbCOGffqikLrFCCddaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5mAGqymSuM0bZrJ4/nJCmuz3UaniMU/FUhvl6r+6DU8s2XGdqVGdfeXA8KJ700nC6WiwXBgMXSWed9Y4ffujF8sbjbSFf95mYB9nIq07W/WNT6N0LW+mLPCWUmgglyam8DsvvkSi04qU2sphN7JFUUcydIg4Td5Bv09SolW+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=id67WtXu; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="id67WtXu"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd6so1305991cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790098309; x=1790703109; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/gPRbBCQLJwNMl68mNAhEYv0OV90CxwDGmkvmCuCwGU=;
        b=id67WtXu78zjSoZRwrfaXTkHrs5DDGhoUiljTuK7LXfqJkvY/WsvPBwd/Gk49m/3MU
         KzMCWWSXI3P9gVpMhJTGuQdPkSZbn19gc2zvrYMkW8gLxiVLmsPtq4E/PYk3ZsY8CMVt
         697ED9pmYD1p9bHZjxIDKt001mRuGvFcwq4FqrBWn7KKI3IMp7g2fA2kO2PCDktQDPrx
         Rxrp9Tj25A9TpjtbOSfiWYgw/ellgXmySKKF7wCPnQE8MhvtJ4aSpkAFCpiTc956WBO2
         K3sOfPO1wNlq7ufKXK7IoIGKm9ax63b2chbI4Q6UAiguqJTb0LndDE6B8bBTdNIUJWH1
         y+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098309; x=1790703109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/gPRbBCQLJwNMl68mNAhEYv0OV90CxwDGmkvmCuCwGU=;
        b=YLor4AQav3G9P/x0Y5Vxo2t62GeBhIFZhy/XIiZebnpBa5d1f+yrrShFFq7zjziRb4
         39ZipAt4B7Rku/wPmcAKtOprgo7XOO8QbKfufyfj0aPJSW1ap2F5/6r603mFDPBL2YzZ
         2Cuq30r+/ZzudpnVcmRZePeGxgeykDHqunkVnGn6oitFHm3/xTRMRqomoiFSEYbr+4ZY
         +bhGNqwDys5oqcsBdJh8lSFVxuojyi2ArvBmUF7ziHP9FeEcV5/xl/dlVL63xAxVZXBb
         F1vT/F543Zhmz9gsVyY7LQ+gm2NrnhKVatWMh+HQzYeZxJ0YixtjeUrlZpFIoqrNXOYW
         dabg==
X-Forwarded-Encrypted: i=1; AKwUvBwWVhyQPsXA4m1iR3x/8qTXAQQprlBXNTHYeNYGqqj0JPFpRsBVl1DeD8vwqim/Lw8NDKSxHM0/6VjyXKw=@vger.kernel.org
X-Gm-Message-State: AFuF++lSFu12in4mAhmh2Je8qlnEu3MUWxznKTpXUvdH/MofNYOvgQYU
	VK/vbH0hCTB7+YyrxOlyRqwDBOVUJmzEm9kq08W+Z+Nezh727pRA04bfSiqIvFCniyM=
X-Gm-Gg: AYBFou059H2LoP4xe9lNQWdtzzi3sT+JzIRRcSQ+zooH9bqWbajzZMdE3GzsPcLX0Pk
	EkpKbnxBgSGQMQ4lHVrPsrjlYya/daDaeFTGn3DsCWn4AFuxstPKfa0CbbkuTPArcoh3LneC0vj
	fmSBVIZ3Fu0uZxYtm7VhlAJl4oG9bS3KmCdkUqTMdiPBnsHqbHZiWJkBGO/7UbU3S26qC34KslI
	YKJi9I9FCCgL/NhsV7Y0BjXqv80SY6/RPOrMAxbCE+pFmVEHH7+a7e2SH5xBHe5bHlU8uKSOR8a
	qP42Vo/5SGSP3TqJHgnROmvSHHHmOpV9ouYisrxXC59ypEejrn+tLJEp9FHNTxxI2D84qiRbIpw
	BW3Qfl4KgXlz+3vSdX+WQ8TQqKhJrjuAbCswnQ5wZgNX9Oau0xdxRCMGvPEeWQiipdjIn1m3vFo
	wW4CI6cEmp38TKaWoUnvTu3VeV8NiutqdF5AOhAfqBw3kui0emk8POWqllmrFjxBkmtIAWcA==
X-Received: by 2002:a05:622a:138a:b0:532:9e8c:ba4e with SMTP id d75a77b69052e-532eacf5339mr4180411cf.55.1790098308508;
        Tue, 22 Sep 2026 10:31:48 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb399581sm1409041cf.28.2026.09.22.10.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:31:47 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:31:44 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Rik van Riel <riel@surriel.com>
Cc: Chris Li <chrisl@kernel.org>, Gregory Price <gourry@gourry.net>,
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <ryncsn@gmail.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arK7gLYD0GJwzKFq@cmpxchg.org>
References: <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F>
 <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
 <arEVDBlfsUYKK004@gourry-fedora-PF4VCD3F>
 <CACePvbXG5kjZmRsdd0a4HfbnNa6w5s9b_1OCySbwvY+HuCqOVg@mail.gmail.com>
 <ad1c4de51f1fbbfc7345036af8f39fb450c1f3c7.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad1c4de51f1fbbfc7345036af8f39fb450c1f3c7.camel@surriel.com>

On Tue, Sep 22, 2026 at 01:14:31PM -0400, Rik van Riel wrote:
> On Mon, 2026-09-21 at 06:11 -1000, Chris Li wrote:
> > On Mon, Sep 21, 2026 at 2:53 AM Gregory Price <gourry@gourry.net>
> > > That should tell you that your model of reasoning about this issue
> > > is
> > > ill-suited to address the problem.
> > 
> > That is what I'm suspecting. Nobody in a sane mind would want to
> > zswap
> > 100% of the RAM and maintain reasonable SLO.
> > 
> It could make a lot of sense to have some default
> limit upstream, that says the zswap pool is not
> allowed to take more than half of memory, because
> at that point the compressed content will be
> crowding other things out of memory.
> 
> That seems like the kind of limit that is large
> enough that very few people will run into it, 
> while also being small enough to prevent actual
> corner case trouble.

Just to be sure we're all on the same page:

Zswap *backing memory*, the space needed for compressed data, is not
the problem. It actually has a limit that defaults to 20% of
memory. And there is memory.zswap.max for users to define everybody's
fair share of that limited backing storage.

The point of conflict is the pre-compressed side. How many swap
entries can vswap hand out. Hard limiting this is the point of
conflict. Any given swap entry can refer to several things: a page
full of zeroes that has no backing space; a compressed page in zswap
that consumes some amount of backing space; a page that was written
back from zswap and now consumes physical swapfile space.

All mapped by the same address space.

I don't see why you would limit this at all. I don't see how you would
pick a sane default. And if you limit it and workloads run into it,
there are no cgroup controls to manage fair access.

(Despite what has been said in this thread, memory.swap.max is for
those entries that compete over physical swapfile space. It must not
and can not control vswap space used for all sorts of backends.)
