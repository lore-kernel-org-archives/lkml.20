Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33F1FA859
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216977; cv=none; b=fbgQqRHEk1DZQSYDVtmiTnwR8ihMNrLwhexJpQNp8UE1ecxvyV9nMyOgwetaHRTEBu8ScaQJyKxBOrxr3CfgppiUACk0VR3gOmxMCKdp4gGXc3996JruMPkhVq+pby+cWhZKONkGTJc4ZT36UbnAXUYfD3NYwuEktVsveC+6cJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216977; c=relaxed/simple;
	bh=rh5d2cNKBXKMwPxK3EfMFKvJ8TMXw53ExafPjYEUPHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmSQ1eG7suQ7IcrMLnUHJewxAQSdAtPytk8rl0qmxPuTCQS1yzsd/T2xnEP+EHsFxmB03vuIe11w3HCsb5lJ6ZpwFhoOodqW0kTHCR78DKGryJ626fbMQtoY7MXU0zciD+k0O/4ghX0FIw0qR9kKLhCwAlYmoIw3FbLy3K/3ebA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=YiYM/PJc; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="YiYM/PJc"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e44so700951a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1791216973; x=1791821773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZQZn6DIMQDQCLXf+RSqa5fylG7dJYyOrH4B8TI6hz0=;
        b=YiYM/PJcenPgfbZ/n3Jm3OB9HIB8j4drOB7+froS+kXYkwgEb0VGBa1MaVHSGx5Rhh
         X79DaJH0fer373z59lKkPyytcx7UP4bc5ZJCkbSj946+C4jbCUp/1W6s45E7IR8Dkv1c
         e0xQlPQkglpFdoZv8IbOMT1RMO0QCWnolYqrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791216973; x=1791821773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZQZn6DIMQDQCLXf+RSqa5fylG7dJYyOrH4B8TI6hz0=;
        b=QwLjpIv/yjzEv0NRDsat5hYZR/yKoT2NKesMGzk0BF1JC+fxbCiv3QUwJfF26belaN
         Rt0TMuy0T+kzUy8JaKwmUvJTUZm+fattwG77NiZupgfz/NhGdbVenDDGXv2YrEFy7PjR
         82bnfuiVr1a8AF7Q5zHIXszg+ZIqdRLcFJ5eUS+pD5v0SXKMkJEXIn91Zs13rwfLtTmQ
         Zy3ZBoraQRC+tfQ4uLah981YS2R2eLvUccNnLnZsSessCTm+7hDuns91p4BGFmJNw8BP
         cE2hblwo7hyKmX8mxcO7EzRokt6eDtNoK4z5+klqaoPU5CGKZn3CA2/Ba5oVRmrkNa1v
         z+DA==
X-Forwarded-Encrypted: i=1; AKwUvBzDh/OVazGgzicqVSyuo4aO0RiI146NaqQVGNA8SLQWQAZKJehvCV0Bsb8VaVIVm8w6lK47QZHpY4ihbCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6fMXAxVONYcQ3JLBl1RWVog1IV2IqyQX3p88TsWh2HkrjbvSk
	m81s2+8ZNHCBRv9qeTWq20oR5ZJU903PXD8LY/tY5MWhsywLkJ4U/lFTrzdkTh/F0A8=
X-Gm-Gg: AYBFou2BSyLpCKgZiZhRjD8u9vau5BoVzXBDtuF/A7wol/yPtjs2vjNljv21lFnfc98
	A1ambRPs+hMqr2v52KN26Ps4hbznOj8/9bqYz31suXFzN21T16fqy/KGdQCP6uRrJXR4JJ8JXFx
	2qW5KLmtR+UDlZfkNzavnbgyX1oEm05AWbbQRtsnf31rYQCmDg0hzc2erL00V1VQH2vCNfTh8yF
	fHUw4jPGrZwelP+00f3KhW5/vQJYCZXrrqcaFnWw2L9ghcM3sPYms18S00PCCwRnjVOA8ehjauk
	4K6D9Bj5le/pK8dJ2tQLB5R3c3aqRu8dUYZ8H/oDFBN9CoWQ9GIAfrlpCt2NtzbytmbrTPH7v95
	en5ZrudJ8Wwy75ANbrF2OCcMRvIHfQ+u/kdwY0NhAFTJOsa28b0zculFZ+LALB4DWbOL1/nUcxd
	jv0iceQO1gcNmwD7SjEmBwqU9ON2Flj21sHKi1PF0ovqbCuVO2GN/vjk4xpYooMsZh
X-Received: by 2002:a17:90b:2fd0:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3a7a46356e6mr4340629a91.35.1791216972916;
        Mon, 05 Oct 2026 09:16:12 -0700 (PDT)
Received: from 1c1aead48890 ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d901981sm1172982a12.14.2026.10.05.09.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:16:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:16:07 +0000
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, 
	Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/mlx5: Fix boundary check in set_report_output()
Message-ID: <7fbiirwo2k34dcyza7ehmdevziqmch3foldxp6qeeclr3xjypg@enyyca5445pj>
References: <20261004-vfio-mlx5-fix-boundary-check-v1-1-1d3b8e55e23f@snu.ac.kr>
 <d4477773-a95d-4cc4-8d10-edf1f7b215df@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4477773-a95d-4cc4-8d10-edf1f7b215df@nvidia.com>

On Mon, Oct 05, 2026 at 06:43:08PM +0300, Yishai Hadas wrote:
> On 04/10/2026 20:20, Seongjun Hong wrote:
> > Use > instead of >= on boundary check of recv_buf to avoid the bug which
> > the full message in the last slot of recv_buf is ignored even though the
> > received data size does not overflow the recv_buf.
> > 
> > Clarify the second boundary condition by removing unnecessary division by
> > entry_size. It directly shows that size should be within qp->max_msg_size.
> > 
> > Fixes: 9c7c5430bca3 ("vfio/mlx5: Align the page tracking max message size with the device capability")
> > Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
> > ---
> >   drivers/vfio/pci/mlx5/cmd.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/vfio/pci/mlx5/cmd.c b/drivers/vfio/pci/mlx5/cmd.c
> > index 5fe0621b5fbd..a49531666e6d 100644
> > --- a/drivers/vfio/pci/mlx5/cmd.c
> > +++ b/drivers/vfio/pci/mlx5/cmd.c
> > @@ -1644,8 +1644,8 @@ set_report_output(u32 size, int index, struct mlx5_vhca_qp *qp,
> >   	int i;
> >   	buf_offset = index * qp->max_msg_size;
> > -	if (WARN_ON(buf_offset + size >= qp->recv_buf.npages * PAGE_SIZE ||
> > -		    (nent > qp->max_msg_size / entry_size)))
> > +	if (WARN_ON(buf_offset + size > qp->recv_buf.npages * PAGE_SIZE ||
> > +		    size > qp->max_msg_size))
> >   		return;
> >   	do {
> > 
> > ---
> > base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84
> > change-id: 20261004-vfio-mlx5-fix-boundary-check-4839d6aecbe2
> > 
> > Best regards,
> 
> The patch should include also Cc stable for the first condition.
> 
> Reviewed-by: Yishai Hadas <yishaih@nvidia.com>
> 
> Yishai
> 
> 

Thanks for the review. Done in v2, which also drops the second condition
change so only the fix goes to stable.

Best regards,
-- 
Seongjun Hong
