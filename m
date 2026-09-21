Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAFA4E1414
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010311; cv=none; b=t2xR1OZoE//oiNvkkAaQYJJNGpLnSf3zy99mCpGN4aIt6HXSkHGe2rDmUb1QwLmDyKWECcafmrrNfBmq7LBdfa/g3XMNBOtdW38jGWiHOxMYOxUHJyX+eCv7EyLWJvqzU3abRdkLPapMzZkBsaqR+3NN6JyHmHwywi2HIvEy38M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010311; c=relaxed/simple;
	bh=O9o/2+x9DNyH+rWW8r9iPwh1G4gt3sEINJUrnEZky4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFmc/+3PcylJpBr/yL/eYr6FgRYhoFBlP9H5p3W4Gi7gNg0gYHZZhJjx53enzIICAa0AvzY99UIAdQMJlzyrit9vJWUKTmTMDBBEJSlgOJHPry4uoWegNdtNSA2zQehcFGZyYS/4WFtZsc26tpoBct7YLcMxpWGXeYmhBjBUWnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HOVgiczf; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HOVgiczf"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530280b8234so16103311cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790010309; x=1790615109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7LCENNPwU2GeUQBgdonqhl0jI5d3t/m3wn6hI3Pq7k=;
        b=HOVgiczfcaIDjiQI25uHPyL0lQ2+CXsUaUwdw4qgkufiZDLg77dj76L7rYrzSb4jVH
         D9r+A3sFh44tE2+lX0kkBS048Oqrej4ugK7lHejG83sDHWGVgS48aIQamfe1Bn26jL2v
         fVzTQmxIh7gWHvTlx/SM8BFp737SzyjrNsXJGSqZXwE6NpJvLHEb5vNasTuv/RqaTb/u
         rtCa85NTAeSk9jFYr8W89aTi4fnE/eImcSSl2ANbdvsCc8ffMGM0FjeimuHh3Gxi1p/U
         urCvMQK+ADAPWMf4VGCTvPMofM66E+er4kgIJLpbLzG33JufznoznuqXdbOqr3kmD/Fp
         qLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010309; x=1790615109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7LCENNPwU2GeUQBgdonqhl0jI5d3t/m3wn6hI3Pq7k=;
        b=W38++aQ8NY2sJqbmVmzIldyuKHJeQVh2eDsBlkGIakF8geN4TtauQB+FigzfJAOKl1
         E9HdNAumIjwIQz3eab+QX0FsKo7OfE5Fnpb/MrH7538K0r51iy1Mnbhtm6b0naInlhu6
         LL2WfHHTResbVOim+bBp6pQ0iNly/TS2mXlXQGwCJCjNqu/cWuXFFDGHuR0vF8Lr8zfm
         2FO6jXCg1hlUk0v4iDose49n/CyYJTe3ZAe/ygIw13zhe1QY+CiVlcPnPW3RBwrgVXP1
         lrmRnIzDvvTXPCO+y+jqhRmntjRDvqT7WP725/u6DsO26EnXzLFD6nQhVlf2mFt1tIzV
         F9YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPIzWMtPwyNbuEO9xPCbyaE8vOrc6J7bJ/bsIOJmVaubKXob+yqCJaueZ88MMa3ujlUxvmABaQ9V0ixKE=@vger.kernel.org
X-Gm-Message-State: AFuF++nZzlGCGegiNJY9YDmKCLiJE0tlPZtNFaapJfTgnWdDqshMvyhu
	VF/qi0K2kyHZEaXwobRXgTltgRgtfRzUo/XNosPNkgOwpYA4bXGiV+YP0tbbL57rOA0=
X-Gm-Gg: AYBFou00LC/kgZMzk1ptmeS/Ahm9vtiqqktrPMMdA4DiUk7I9kKfT/mYyjvvLcFiTzI
	Ow56LErBBe7NXmrscQFXdXfKlY/YaLx+I8Ris1G6SHM6vgHYwXMVapgUfHOEOGg8ABm5ChirRhc
	xVfuV0y55uxnf1tTePhNmQm+WxoZ3DE8P2LSFsBi3qcRYUe0YECxG6OayXmBeAWvDkJP0SIDRbk
	YE2nwt4LvuyFfSNKVeQdx/SMVzBUnq2hphG5cxX7PzHGWvLQU6+V8XVoc/iLcAiXlp6QMHRl57Q
	KCA8DwLmeQCiQ827zmN5h8HlxFDXWhnCDSWE9ZvnPWKL3MlqB2OFkcH6pCXNlWQz47L2WZkNywB
	vUH3S7VZTImBEiehDwb8q+acfTc/xO44lt5+avvbxU2g9ue185DiuNtJRx+XwBc6SUymbQljWvd
	xPbeuDYMt6jlkyacqNZINgpnB3rVIEjk3sqnP+SsYMgzuhid8x2Kf2i61jGOS7Tb93GYP+cnVI4
	6vlffVOybp2
X-Received: by 2002:ac8:7d43:0:b0:530:f84c:f02b with SMTP id d75a77b69052e-532db76f02amr3607851cf.1.1790010308696;
        Mon, 21 Sep 2026 10:05:08 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([152.186.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532db6b5651sm1983721cf.18.2026.09.21.10.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:05:08 -0700 (PDT)
Date: Mon, 21 Sep 2026 13:04:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Message-ID: <arFjYiMbWf4ihrCu@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
 <arCeH_aD5PUM1tNE@gourry-fedora-PF4VCD3F>
 <C7A2977A-CDD8-4EEF-9448-A130411878B6@nvidia.com>
 <arFaiV9iVgxIsZ1g@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFaiV9iVgxIsZ1g@gourry-fedora-PF4VCD3F>

On Mon, Sep 21, 2026 at 12:38:57PM -0400, Gregory Price wrote:
> On Mon, Sep 21, 2026 at 12:18:12PM -0400, Zi Yan wrote:
> NOFALLBACK
>   0  :  [0]
>   1  :  [1]
>   2  :  [2]

NOFALLBACK for a private node should be empty, sorry:

  0  :  [0]
  1  :  [1]
  2  :  []

if you attempt alloc(private_node, GFP_THISNODE) without selecting the
private zonelist, your allocation should fail.

But this is more discussion for the private node series.
