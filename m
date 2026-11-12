Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500652;
	b=F5vKXbrv/V7CjAmaX4pGtr4TH/KVUSHSW4uQpEs4/tbC1wTknXaeLSsWXhdvFNktgECy
	 qEJuDsLnJupiwPTCyHVcSCtIZKw8qv8n1ziX2P18g5WJf237h13PtMA/wHyWKOdB8ikwf
	 5A8vfoHU66iuKRIuFYBz3m8Y9zDH8BMstPskDVLPiZhtNmzfyo0/1f3ppxAkLSeeLBATz
	 nb874qXqFdE17ApNhex1BiQ1Ic1TjubRc7mVpRykCtBTq78csjm1niqWuirS04WZyGjVZ
	 JTsyDDCuGMLtgmsdYYqYdopHJGHEoNgmWqutLTgz14CAIGUVLWrWcAkmWVn8+4omwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500652;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=6Xx9ll4KiRlZN5Q7aztt0nmyG6Z2FwPKVYZ86wY/LHw=;
	b=R3UzPGXfYJkurcL0yOgGCglxvAEowtdWi+nNSFXL6rg6lsUtHtj5rBR4xH1zs5snu5bO
	 tvtDTAMRoSp997DSO89Emn1zFEZ02kbjLwvzcYcL/THEBTNskLdYYzLupT0QZvrpcO6e2
	 s3L8E9EtoOfwrWP0nm/cMFMq2ndpsOcqVIIvJd49jpHJXoX6Kw8czsD7zJrBFF5bzn1wQ
	 CGi0h5YhGvCFkdmOVr7FKtlU/wAsdAcaAwoh++SZG8gGNSsUoNPl262UTVXrlTmyGGxcq
	 LGD1Lc2iZA9XEpSzWolcrxBrXiP/gRIaTyJAqgLVABFL8Gd3iQucs7aP+UdQEMuJRDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BqQLHNlY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285B5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BqQLHNlY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69EC11516;
	Thu, 12 Nov 2026 08:24:08 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F8FA3F673;
	Thu, 12 Nov 2026 08:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794500651; bh=1Zrocjmf5KDVgs9C8TWM+FCvnpiEFAfhwrLPqAEVgUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqQLHNlYEL+MGcY7ChdyVQ7siuvacMh/KJ7dkXQfKvojNWvmYw/fDWZ9Ui9lqm7F3
	 9jsLTQTkZVACGQn88QQYjBHPS96QiYQAoGd6prS231FJxAvj7b4bc6yFRmNPKYKITA
	 nPX92trHEYqZSAzvnLx+fsCkWZKwWfoOkTWDUUFU=
Date: Thu, 12 Nov 2026 16:24:05 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v17 00/12] migrate on fault for device pages
Message-ID: <avXoJSGh5xjGFgod@raptor>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor>
 <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>

Hi Mika,

On Thu, Nov 12, 2026 at 04:00:09PM +0200, Mika Penttilä wrote:
> Hi Alexandru!
> 
> On 11/12/26 13:56, Alexandru Elisei wrote:
> > Hi Mika,
> >
> > I want to help getting this series merged, and I've been familiarizing myself
> > with hmm and device migration, please bare with me if the questions I'm asking
> > are obvious or downright silly.
> 
> Thanks for the interest and willing to help! I am preparing a v18 of the
> series and plan to post it early next week.

The series is big, and as far as I can tell the MM people are hard at work
reviewing bug fixes. It might be better to wait a while, to give people a
chance to have a look? I know that if I see a series being reposted often,
I am less inclined to review the patches since probably a new iteration
will be posted soon. But I can only speak for myself, you know best.

> 
> I try to answer your questions, there are quite a bunch of them!

Thanks for your replies, it's going to take me a while to digest them.
Despite the silence, I'm working on it!

Thanks,
Alex
