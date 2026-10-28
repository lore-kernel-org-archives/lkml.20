Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199936;
	b=nyt+t/cW5gi6zO6i6qS8r1N6jdAIDzEnNbIfHLydLiHRr4AbmZMSbdirrY2Gi/UvBCOV
	 FOMeS91Hwa9fomwzw7kUQ4PKMXF6onIb0U81YO1N+VjrhMn8vj4qeoFkRJYK0z5/FERsd
	 Q7Vwy49UzERF4UgJgkuv/ymjElMZA0IOJFMqOZQNzqAnLyT0tBx+nBlKkjJ3OH6n2KHDU
	 rNSidd2zh0HgvDYamk/OYVXpLsHa29A3VvNcj8Zx6qMwOyt0TGZ0FnVqbBY53YjALiyn3
	 oj3zNSDgue2zVkMyWF0QuZpO8RtshRFf2FT4MdlSasJSUvv5TYmxOAcLqk1/XETgNXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199936;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eNozgYZwpk0eQaaT+Dcf06b2JjyKZkK/iYJeoIw9vCk=;
	b=AIctE7HQPuT548YBxJoamwIZLqrg2s2ZpNjAFBwHIf8TK4o1iaFRd/bLprmrnXNFgPHj
	 giMH55RSzL0v4/yHxfObqJwDr12mfEvaJctSymEVoJ1EHkeYK79vMil+7/Eu0YZxeYknL
	 yEZpSwN3LLmOD+rvOpICeIUhxoKDHq3B6IH0B0KihtuTjApxU8QBSTH7emq8eTksRm2/R
	 KhYXT1e3kNtkV5aacFwF59c4YjEXgchCqLVa1hpn7IDfYlnzMoO4FCDTjm8otD4djeECD
	 hHAQacQkf4XrFPy3PBD7Yf0lf58M9+m1yh2kPPidWYT48f6QDgAWb8lDNRfC/TX9mfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mAOXMHr8;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07E6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mAOXMHr8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793199934; x=1824735934;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e28VSl+LiXDgkaVSdzum561Gvubfb47OwI8MPs221zI=;
  b=mAOXMHr8OG216nfN4sxL06kBoIa2x+O70ci20H/6frxpFpkPnf24DH85
   auN9uBwDyr3Z0mVNgCKzkjjKHtQQz3XFgz0skX4AcqapxSxs34ff3KSvu
   5loV9/cA520mr+agd2NPZp9lg1Z9+tMUq4Qt4teD3GYDnRelr+CZkCrQ/
   ysSjZiZlcXlrJQoHBtFMvoOCOYfVdxa+RZ7321kdnaY3pksu58rINSU63
   H+RIPzE94Wq2Lz2Ived8ZQm51cZEjuK9FN5P37v5nTKOyN3tboPScvhZn
   5TP8vt1TZYVFgoaV4ZujyVmgHpqi5GReMBEp+2L81qt277BrsrSxmV7dL
   g==;
X-CSE-ConnectionGUID: 3rDq38dKQk+VE3oWeEF9bg==
X-CSE-MsgGUID: nEmvPHE7SCmAkvI/D003+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1935408"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1935408"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 08:05:33 -0700
X-CSE-ConnectionGUID: 7cdo8aKbQ7G41wggCQAhmg==
X-CSE-MsgGUID: qlHtpblpR/K+quOiy2V43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4944709"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.108.227]) ([10.125.108.227])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 08:05:32 -0700
Message-ID: <370b02eb-e488-493f-8eb1-56c0e0b39fc6@intel.com>
Date: Wed, 28 Oct 2026 08:05:30 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fwctl: pds: report device information length
To: Avi Weiss <thnkslprpt@gmail.com>, Brett Creeley <brett.creeley@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-kernel@vger.kernel.org
References: <20261028125531.978325-2-thnkslprpt@gmail.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261028125531.978325-2-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/28/26 5:55 AM, Avi Weiss wrote:
> pdsfc_info() allocates and populates struct fwctl_info_pds but leaves
> the output length unset. Consequently, fwctl_cmd_info() copies no
> PDS-specific data and reports a zero device_data_len even when userspace
> provides an output buffer.
> 
> Set *length to sizeof(*info) before returning the structure.
> 
> Fixes: 4d09dd11d7d0 ("pds_fwctl: initial driver framework")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Looks pretty straight forward fix

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/fwctl/pds/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/fwctl/pds/main.c b/drivers/fwctl/pds/main.c
> index 68fe254dd10ad..01abc7e83975f 100644
> --- a/drivers/fwctl/pds/main.c
> +++ b/drivers/fwctl/pds/main.c
> @@ -63,6 +63,7 @@ static void *pdsfc_info(struct fwctl_uctx *uctx, size_t *length)
>  		return ERR_PTR(-ENOMEM);
>  
>  	info->uctx_caps = pdsfc_uctx->uctx_caps;
> +	*length = sizeof(*info);
>  
>  	return info;
>  }
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

