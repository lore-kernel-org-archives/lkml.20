Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3CD21A459
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790402888; cv=none; b=tO122h94IJkrIk9/R6Lxi8at8K3yjvrDgPzyXD0F8X8mqB6rHs2yvCZSXsqG3s6K5pru9sMWt6urCEJWVuyyWTeXYt1M7yEqXigknLBX7LglOXXb54x21/Kg7cDyf0sePVp8YeyhKF3T7SPBIuZXiFYnhf5wmGwmuSK4RxBS9to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790402888; c=relaxed/simple;
	bh=5S03sfs41oZC/sNWfjMq78eOdiKS5Y1fhXBHF0wra/Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YgnBvzvVFAHAvydBmXIqHQlT8mk7KOzNilRq7Tuv9JWBsztrXbssCjG37d3onbv8MOBDX3xL/xKI9ANwMCdygMgx0jPCB/5BsC/lB2oTEYoihx+j+rPqYVpDF2UwUUl/E5O0qKhLztl0Le4gxQkZtkIGl+UXVC0WfdBabJr6Eyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mnlznwik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mnlznwik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6108B1F000FF;
	Sat, 26 Sep 2026 06:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790402886;
	bh=0e6tVO+MRkbZ8ZY9CxiKyu4lnjfzpRHKXdU6fEeSY7g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mnlznwikUN92d+Aeks2ykZCcs/fimoxLT4LyBBmI3/7pEWogkMVUmsdRMOqZhSu/D
	 I+hAknFAbcjkrymv3NgOpM+vVoHqYhWBnIC+9YU8i0C1SssnialK7d8kER5gRSL4TI
	 qu1MdFcMH3rgaySVPJ/5j3NrZmNp7UXcXDxoEMHk=
Date: Fri, 25 Sep 2026 23:08:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Longlong Xia <xialonglong2025@163.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 mike.kravetz@oracle.com, yuzhao@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Longlong Xia <xialonglong@kylinos.cn>
Subject: Re: [PATCH v2 0/2] mm/hugetlb: fix surplus accounting and
 availability checks during demotion
Message-Id: <20260925230805.8e763371bf9c6a54fa02fc28@linux-foundation.org>
In-Reply-To: <20260831133519.2505020-1-xialonglong2025@163.com>
References: <20260831133519.2505020-1-xialonglong2025@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 21:35:17 +0800 Longlong Xia <xialonglong2025@163.com> wrote:

> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> This is v2 of the two-patch series fixing surplus accounting and
> availability checks in the hugetlb demote path.
> 

Could we please get some review of these two fixes?

Thanks.

