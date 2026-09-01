Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB75379C55
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242366; cv=none; b=Ylnqa1QJx66aBWElkRlnqC5R33UvQkpbCslRwlD/T3Lk4tScUXgii3T6IXXjySsmonNEYy09p0B/t04iO76fG+b4z4i0ArdgxNV6LkphSwYLwPb7Unso6WOSDK78YHx9SdF0VJ3oC1LTJacxxgjKl3cRcWPJpmD3+T11YivI1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242366; c=relaxed/simple;
	bh=+MEYaRxmrzVr2mMwJ9f60mchRqkAWv68VkgKuT8Pz6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FP2Zpk3+t3V2/qd4VsXkd9r7saiepHcOzDvkM3/JrFQpXk4K/TH+437b2r7f6N4PFR4o4Hqiteez+CsI/Wujd50e5j51+6KiboduCpf3IvKuKFUpU0DwJpZjlhQY7Dhkp2uWGyslaQuJfIxs+zLLsfDUsPK9sSwNHx2Um8gSoQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAok0+s8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAok0+s8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07E51F000E9;
	Tue,  1 Sep 2026 05:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788242365;
	bh=SzImJZLLnR7KzJ1vSv1N9X+Zs6R4uonAJmI6sq3tQuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jAok0+s8gqUkYTlkSy9agEI/tLZevpFcyz7fQAUuLVrTlhdqkA8+bEdFm0OkKNGV2
	 YhJ/xWCmWC9WVhhaPvUldfix3UbPdQsRI/aCRULLyRyEM+pSclvqH2L0T51dJh1VIa
	 kKNj9qUc/tssdl8VJnv/VBz3vwDzqoxvmG0IVi+XuTX+Vvsmh5iTIQiPpaXz59vLZr
	 L8aov2+sZ3/ui7mh9C9s98suT+FAsYu32mvOLBBDRu+wfYlg2wh3scirv/szWkPPa6
	 VMhNRRR4utA7v9r3tb1Bc+6BfFywsYJDR7giWB+l+MrNssvgfF2M7BWPxU0F7F253Z
	 8iZQSz1c6DB3w==
Date: Tue, 1 Sep 2026 13:58:59 +0800
From: Gao Xiang <xiang@kernel.org>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: add sysfs feature entry for xattr prefixes
Message-ID: <apZpo_arKm1aGCEi@XiangdeMacBook-Pro.local>
Mail-Followup-To: Jingbo Xu <jefflexu@linux.alibaba.com>, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20260901024622.108319-1-jefflexu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901024622.108319-1-jefflexu@linux.alibaba.com>

Hi Jingbo,

On Tue, Sep 01, 2026 at 10:46:22AM +0800, Jingbo Xu wrote:
> Let /sys/fs/erofs/features/xattr_prefixes advertise that this kernel
> supports the EROFS_FEATURE_INCOMPAT_XATTR_PREFIXES on-disk format.
> 
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>

It'd be better to add a "Fixes:" tag since it should be backported by
the stable kernels which have this feature.

Also it'd also be better to mention the first impacted kernel version
in the commit message too. 

Thanks,
Gao Xiang
