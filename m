Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F403128CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881161; cv=none; b=XOo43l7YUCj57KmAloRP6D3h/RzyG9EeaExMR6fNP69iioLcJWUmRpMVC6S6riB5Vdgq9uzDdNZ1SujD2cZb5WT++MywRLeZwHOEHD6zBMlQNaQYcv27BmC3oEAMjiskYYe90znkIl25Q3Ow80cd5LNE15s3SR7KKmrUSh6Dp6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881161; c=relaxed/simple;
	bh=JuND89I4erxGeed1BBcZFOuyajKTy6drp0z/zBacNvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htXjQSayvO2x/3luPo4axgnFcOE5A09VjghdjddUP+TgeIlEF5YIqsDK/RvI07i07twyDCKxKLMOBS5r9VibbKt2u2QSFTK8HgyiFk4Eo6NgokYKg8l/b/qlfPL7/22RVDMVk7tU2PQPXfADLgaNfe4DKHON5iLRpCrSkhIe4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcoPCmuH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcoPCmuH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA5C1F00A3D;
	Tue,  8 Sep 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788881157;
	bh=NLL5t97riWq5Zu+ReRl9pR+1kEZ80aHdKkkE9El90lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GcoPCmuHbs/5Lr8Dm3X2nNRH+3lSUdkGa/XkNpVGsxclarhaAkefCdWtyKmFSW8Y9
	 AmlVx6Q0ADymw9ComHNdXiilpB4JfYXFXYc4Nn10mfnc/x1nUarz9eWPvNnr0vkig4
	 aEkQDUbEkC+WxILBSKz3HftOikoUPC9L3EPptzA6ZkpF58Dh9826YklupEqBc4chz9
	 oNuWYwhyfG+GhPiXyCy5VBVAiba8lge4PKz8BDn4KMdfhNCo3tX4b/YPEVwSCC87f8
	 cPqM8n03l+N8xbiniBAlI6CUw0r8AAArHa90gsAWPq7moHRF6m4obbb80ZCZ457/RK
	 HRrvBwBlL+9ow==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7808F198003A;
	Tue,  8 Sep 2026 11:25:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 08 Sep 2026 11:25:53 -0400
X-ME-Sender: <xms:_Cigaje9FRO_OGuWBqzWBvHv5zWaO4010Dk337-2LRq7ZEWvWc8h1g>
    <xme:_CigasQFOtA3bH0iFVK3KCvqrkZtptG4Jz92AkMpThKylse-J7Z0QqCaUFQjJpLpy
    nmzB0gv75WNY_sPsgdR_sxaMOABYoZ95EHlIzrpunrjvKBtKvifUm0>
X-ME-Received: <xmr:_CigaqmwrgW4QpFRWktIYM4j8UXE-LlpAJLPF-2BpiuwIZgbfvyoZR4-Nao>
X-ME-Proxy-Cause: dmFkZTEb2T3SF9BXFaCq6Y7MiXTtJ1ovoHmlskKKyQz74Er/5FJa3tWOsXEjWGtdcJ4Go6
    Ta0l/J3gvvprxj5O7HnzuAYqoQXGtcuHEGyCho/qrQD1FPdUR7Xf+EKDfUOaB9oXEzBRrF
    t9VrvpJkYHKvWDkZDzWQJxJkPROr1SmDNami2TGx3knpupG+c1faSP3dh/FuLuR6OMQKqz
    kn/xBFbt/vNohUevxk6tRPc3/HHyHA0y7CiwR1Z7EPnURPu3AWqoTfw8//6PgcsJZXqWDl
    YpW2hISp/9iCrQcQd2xjm362PxVejFW0C28VwZ1mch3qpaiswmuK3UT2orIoV/JhxfAgd1
    5qA371ZAr/otAXQgDnRnYGqrAl/Fd58jNcu+5+LSMULuayWiyyPBbamouZldJ36/JAUWIr
    M/9ZbdhjM/LxxDYereX/96Pcf2Vv6bstoedRDGcxM8mKRgZr93gth/OwqP5qehi/9gGx+G
    bRZSPOYSBgqFBU6Ag9OV33JDG2xImSJ0a9kFalv49g/FzdcwENOaeW3StmLrYD0wVguUrX
    1jqQCOPr1mQtcu6KYIPLYY8E7TDo42PCbpXLGxEOzpOjEQ9mR4f7oNSiyFfbXtk3FzrsIp
    yR5kAbcUZzJsKXda4T8BVMg1djPEYFS4YY/2p3Ndj+gNzeyo66GGY9IfVIMQ
X-ME-Proxy: <xmx:_CigaoZOLW6ZiIRdGzCXzzjrEKo6fAGLDWyWuXJrqigHs0Kge3x1rg>
    <xmx:_Cigal3_56a60cWkJrEt6_1tSxma3S79BtpJuzPGTm6-1kNJJ39gJw>
    <xmx:_CigagoqJp27kMI6QFDj3K6glZU8fEDd-FvbDIokiag9uH4EeFe1kA>
    <xmx:_CigahzTIxd3MDCQ4h5wGf4PDfn6iY_RCBQ-X5UUkcSY74WxE0Kn1g>
    <xmx:_Sigavg6MMd9CFLhWO1YiuFkeTXtLp6gaHk61CmnNpkjK7NrDsZ1aWsi>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 11:25:48 -0400 (EDT)
Date: Tue, 8 Sep 2026 16:25:47 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Shivam Kalra <shivamkalra98@zohomail.in>, 
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v4 11/17] mm/huge_memory: move filemap management into
 the file split helper
Message-ID: <aqAo4dFGofAJzkRn@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-11-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-11-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:15AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Only file split needs the filemap and xarray handling and related
> variables.  Move them out of __folio_split() into the file helper so
> the helper is self-contained, and simplify the parameters.
> 
> No functional change.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
