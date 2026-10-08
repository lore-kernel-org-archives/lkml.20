Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305043C3F58
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444387; cv=none; b=aZwrvDLGgB+HlgUD3/K6gYwZ7xEOdL07nS2hNxc0tXVmN2sFTdqwRrkRUpqdb9h+Sc8tOzex6IbFMlO6A4jnScYdYsIYdjc4+npeYMSuCEm6YstcRqSumgf2qAOJ7WfLK7wIj8zmSByL9+WTDCqq5kBB4KelGTttNdUF4lm3c7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444387; c=relaxed/simple;
	bh=j8W5fcVIQL8yr1o7jHpFmoYapsdcHpcbNHxnm4HBbtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpvxgnPWRxRFMeAV48S0ZNKteRBwHD2Ku5Q/pBpEGA1VmbTy0LA2TDiieOsTePz69B8TMTJBZV7yjwpcNSF258oWVAkeeFefNv2eMSnN0q9HHRpY8J/Yst4k6EAW6RTQAON8/dvVznGM/dzpXamia5KRtPMjJuDnDmLLIgz/ONY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iitHbdG9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iitHbdG9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e6038cebefso13861665ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791444385; x=1792049185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwW6TH+uNt3PSjP2BacA5tGNX0rsS9JlSkv1g6t6otA=;
        b=iitHbdG9MitO84FjdtX2Njt1nmAdpzby4H2wfK8/lAleXxm9t4PV/PaHe8vynZZh1z
         rV0vy1qgaOCfZ7RDVlsNiVkwegKTP93nKf2lS8b151QzQToyatXBmCGXxY45M6s6szEK
         18eiVvLJlskRjpwdZYEQVrnq2CZu9VWkAlFvTkFF6qglQE/gQFsNAv91tK1wU7lylW5X
         BQYABgp+R2+tslaKEybG7UppDBwFMVCt7ERFiJYP9F+0/0TVuecgAoj4hFJmJrWGdOv2
         iEQIm08TI+GEtvEK2ddi1QW9qPKIgvNp6oj721BbgRr2+qgyTZhhjX0R79B5uHAPAL2T
         53bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444385; x=1792049185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwW6TH+uNt3PSjP2BacA5tGNX0rsS9JlSkv1g6t6otA=;
        b=l9g8wiU4FgpRkIRT8DeMdaqwBDZ6wzrJRi3y8qhZljdBSVXEyViDuHzhnxIpJ/Q806
         yKAdVm44onjClKfaqHzolV1yZh3p+Qrjkg0XgAuBsW/74j70pJcDILGavavy2VdLs3xV
         zeGWkglAKhg+cToIazsS23K/cLVoohnA7RJ3jEZAgB+/A0uF9hT4Lw5jlJkF6N6sGW4e
         lDXgBbFGlDOEfouQFgiv7IsmVdHoHZ+/5vwNrZARknwlWIiB5tMsJGJWh0OS9QNkVMqd
         TIzT6ipT+8oqXMxAvusUeI4wPajMlUBuBBsoQNUf8JJdapOlUuZjXs7obKgdD79XFnD8
         ZTNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3xxfKQsCjKs7684WHh7k4b2FJopJHf+EqoQhPcf96XgRN0EC1B9+VTn6SJ6WoUler+S10ZDuKKNOMFag=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUyE8WGc3Lhi9oB52BhYzgMtTcDSMYwIUVkKc5iSbeGQPtu5FE
	Qzm8wl6pJv26gfo9Ew2qkNpfYLzTRjYV+fmDcp8qA/gsHoCPk/q0IR1I
X-Gm-Gg: AYBFou11PVGzP8oRBQ02kN0OVAWzzoRpuQCFvw/bzKsEDApiqomxWQZU/fzMGBRyn4k
	UsrCkNF4T8vDaqfWTTxy3Gxcv/O/QiS1l/Z7AHI+ADjBvRLIWxfHnvODG/Fq4TwbpaduJVHD429
	d4P9ADtIXpeXn5C3UgkMvP6fwsbLYBvkyhLJ0NNhHwOrZc7fgqlY2wBM9jKQr8RPzv1YGDfcX87
	rL9bObPMc41i+UgVGx2gHwzqyxNR1Wrk9M/X2nQag9ShxQi1Jz5Yd4XQu4QpdNFnEo/vncyvj/H
	NdhJ43ShqfPMqsFodem3ZL8fqEh6QNWVC5wAGWkj6uEuR01hfY3D7Fk36LNrKaTpUoGkJkjCb4j
	NDhyxf6TpSErlaU1MKf2Rm6og6k3I8ypEGpoua3WUPNOYwk02wLVaGA2dLMi63K0pDsyyTfSP9Z
	qfy6gEC1+XCwtoSnmvInIfWIgYOQMWDABaqLrqhZmWvDiFlKhG/viMcbbsJjV5TRdSNRO6+onI1
	hHq4p5g+h0gaPnWweQ=
X-Received: by 2002:a17:902:cf4c:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e6005979d8mr40321045ad.60.1791444385483;
        Thu, 08 Oct 2026 00:26:25 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0d9sm20957695ad.20.2026.10.08.00.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:26:24 -0700 (PDT)
Message-ID: <f456efaa-08e2-4f1e-ab5e-e34ef3368ee0@gmail.com>
Date: Thu, 8 Oct 2026 15:25:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ext4: return an error when a journal block is not mapped
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jan Kara <jack@suse.cz>, Baokun Li <libaokun@linux.alibaba.com>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261004180629.27213-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20261004180629.27213-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/2026 2:06 AM, Karl Mehltretter wrote:
> If the internal journal inode contains a hole, ext4_map_blocks() returns
> 0. ext4_journal_bmap() logs "journal bmap failed" and aborts the
> journal, but also returns 0 and leaves *block unchanged.
> 
> jbd2_journal_bmap() takes that as success and uses the unchanged logical
> journal block number as a physical filesystem block number. Journal I/O
> can then overwrite filesystem blocks outside the journal despite the
> abort.
> 
> Return -EFSCORRUPTED for a hole, matching the error passed to
> jbd2_journal_abort(). Keep propagating negative mapping errors.
> 
> Fixes: 62913ae96de7 ("ext4, jbd2: add an optimized bmap for the journal inode")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Looks good to me.

Reviewed-by: Zhang Yi <yi.zhang@huawei.com>

> ---
> Found with an experimental clang that warns when a function returns 0
> right after reporting a failure.
> 
> Recorded QEMU A/B testing used x86_64 kernels and a 1 KiB-block image
> with a hole in the journal inode starting at logical block 40. The
> unpatched kernel overwrote filesystem block 40, a reserved GDT block.
> With the patch, none of the marker blocks changed. There were three
> runs per kernel.
> 
> Both kernels logged the mapping failure and journal abort:
> 
>    EXT4-fs (vda): journal bmap failed: block 40 ret 0
>    Aborting journal on device vda-8.
> 
>   fs/ext4/super.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index bca0dc87d0b7..3e7dabe45153 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -5967,7 +5967,7 @@ static int ext4_journal_bmap(journal_t *journal, sector_t *block)
>   			 "journal bmap failed: block %llu ret %d\n",
>   			 *block, ret);
>   		jbd2_journal_abort(journal, ret ? ret : -EFSCORRUPTED);
> -		return ret;
> +		return ret ? ret : -EFSCORRUPTED;
>   	}
>   	*block = map.m_pblk;
>   	return 0;
> 
> base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3

