Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806791;
	b=Av3pewgOqpB+Sm7MMF6erHNefRdKB8U61pb4o0W1/vs1f4XpVk/sFy7cuK0B1zP9JI51
	 nQudicwctNgJH2B+UrsYJwGKr9U7Z3sU5V7XgZY2uWWREw4LO58eUp3yf021X6/+MDtfU
	 1mKEHYWHRDSi3gMCV+hTJAyKMcJyEPur0egOvW7RnVonmXg7VGNggpgNo7s4rta9l1rJa
	 pEqkgKKCgUVFGdPRyWVAvff66c816YD4UTyQr8rLs6QMBf6Ar+bFLJf2a6SkItgLKOvD4
	 WvnSqoQjP2m2ITbLE0r+6PaXg6W8rRBfPk11yVGf1A1Jg2ymLjfJuJf7L/PHNTeibmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LjWoAWdpEMOSOVmikYJXtdPPuJN6QLrm0MKN423NGus=;
	b=0+/oKw33xgT0d29pjRKqtI/utEIqp1lpOIga1RxTlwE81iuZ77ALzvNLWjDB9lHcvFad
	 c20s2vWzqEPlYPCbApgihvv82+N04LAS67kGkyR1lAqTDcO2jaqzk5jMAiFDAj8j4aoZN
	 tcj8eJdakln3lT3t2qkxcmB4GG63f2G912WLMmBUv7IBn5rOoixMYZEiolvn8/LU1kxxq
	 VcYNAjqc8SJNWouLv5W+UGsMju/a0CEijXZ724f5XiKWf9tEU0txOr19oICFeodINPi1o
	 YXYx2hHGv0IKEnJrDU5nuYYiegQaZIY0svorgYLT7N2cJQm0eFk3lfRKMXmp/1FQCtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YPpkhyyv;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91B4606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YPpkhyyv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35f036b17easo2593921eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792806790; x=1793411590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjWoAWdpEMOSOVmikYJXtdPPuJN6QLrm0MKN423NGus=;
        b=YPpkhyyv5hzFxNx4hYdWsiT+HV814azrCr67V+G+wP4mksFY+TstfA6X5nbFJvobdp
         DaIZbD9BpidwuMYdiIEMFjDT/1oZwf6Sl9UWdQJAEakU3FOE3pQ0I7k5sYIHQZwa6bZb
         CmKFjmDitTn0FioaO5sOnmxhRyktRt7BIxmQ8RmiHLgUY+Afe06x0+srbWIDJTDKOSm3
         0Hnpx5CRc9yg2+Q+7WVltFvoxG+yH4OZBhBRoB6yDiKDnf9dRSGhjQie5zq8wTn9uuLa
         QmqVm419VGHeLN7ikaqfiQxQ1D/M7NaS3eVY4d3/8vGGmgPFUtInWjiEW3XtGrjFqxt7
         s1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806790; x=1793411590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjWoAWdpEMOSOVmikYJXtdPPuJN6QLrm0MKN423NGus=;
        b=IXCRMcbNDvFajjQ70IKLXtvfujDg3y4rhhIYkg5gDtpgJRd77+GrkPrNVxQuTfwNsA
         kFLoDsF0+wz35lzCV/joJ/kWeFzw7U0UM5Jg9aeSh7PWZ/lwcIqWQhUwYDcU0wWKBwzS
         Llg72cJw+XWkDhRyYxKyDTr1APlgyNG5vW+rJaJvs7T1N9qz+aqHysXSTOpDkGPUgJxS
         RonyZN7sBH4CRI1UStxYNubuX3yPhGiiLFkcTV730FHk6YjeB1JeGM4t+WKEkuTjBTHe
         JUHUnBnocdZBbdqNbmVAIyIgEi6FV7VqFQaSq3d7bKbctFlcD+E7vC/HM2CAE5h9npzI
         WOtQ==
X-Forwarded-Encrypted: i=1; AKwUvBybPzS6m8T+ej6//R7LDWEVjy4fxTHwSxZ8Q/Mrcbko6U3CDIWR2Jj3IHaWJhioN3Onb/gd42+8p+jUna8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlaazv6dsutGRM8w+RAjcZy07Y8/ok5HRYPabwTnmquTbGRWic
	E97QoKI5ysxLDD8y1Puup3Ci5Sei7B41KZKVtztCmMb2HJLVCz1A2WQPDg+Ymcjn4Ow=
X-Gm-Gg: AYBFou2st/jObFZ4+JwGKHpYpc9qqBKAi/2YGc2vLytR1/21plOVq42MrTdaUpFx8aW
	bN1LDzWA9ODrwI4fUoIn0MBsIYBX29cWXJeazZjGHKOZCQ457RMUAvPU5kyg8oSzj887177BPVd
	jK2xYV1N2H0IrhrGWG4qsc1tf8b7xNegdSb/YckhWp7/9iC4DS19GmF4VAwGv0MKQvrqrVCpZKw
	0thZDmb6OvAiufblv55czYp3J3/w7F1vvfbyAtOS82pl80laJa6c+o+WQ4KGs24b+hgOEKEatM7
	T8eKqqPzt8wdSnbRlnXKad/SEZw64xTbg7dMoTvJ0gcyMSdx92lc/HsEULVx3GeMY9hxOkUwTyE
	fcl7Ek43CQco24FnoNI8oqzoeTkWdvmTjJjXcjoyKvzfpcLUZo3Nle6CCD6bLSiS3FRA8pZh+5I
	7NBJMhCbBTPIxAC1Ty5UM9oRTRcX/R6BUYlEcTYTvcWJGkFxBuUVLQRfYCeb9f8XIo8XgzoHT/c
	BPvavSleiT9rP2lluW9QP/MxNZCbydFyheYOfJH7UcheG56TNd41EIIHcRBUSikA1E9+UUximgl
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr1345628eec.31.1792806789656;
        Fri, 23 Oct 2026 18:53:09 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d95e91sm2474651eec.15.2026.10.23.18.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 18:53:09 -0700 (PDT)
Message-ID: <02b542c0-8b25-41b3-b271-fb6fde641544@gmail.com>
Date: Sat, 24 Oct 2026 09:52:40 +0800
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
Subject: Re: [PATCH] ext4: return -EINVAL on hole in
 ext4_convert_unwritten_extents_atomic()
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Zhang Yi <yi.zhang@huawei.com>
References: <20261023-ext4-atomic-endio-fix-b4-v1-1-f91feb0b9613@linux.ibm.com>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20261023-ext4-atomic-endio-fix-b4-v1-1-f91feb0b9613@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2026 6:23 PM, Ojaswin Mujoo wrote:
> We should ideally never encounter a hole during the endio conversion as
> that indicates something is wrong with our extent handling. Still if we do
> find a hole at atomic write endio, ext4_map_blocks() returns 0 which would
> be returned back to callers by ext4_convert_unwritten_extents_atomic().
> This can be wrongly interpreted as a success. Fix this by bailing out with
> -EINVAL instead.
> 
> Signed-off-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>

Ha, this looks good to me, thanks!

Reviewed-by: Zhang Yi <yi.zhang@huawei.com>

> ---
>   fs/ext4/extents.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 7193429a05e1..b54d8227786b 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -5107,6 +5107,14 @@ int ext4_convert_unwritten_extents_atomic(handle_t *handle, struct inode *inode,
>   		map.m_lblk += ret;
>   		map.m_len = (max_blocks -= ret);
>   		ret = ext4_map_blocks(handle, inode, &map, flags);
> +		if (ret == 0) {
> +			ext4_msg(inode->i_sb, KERN_ERR,
> +				 "inode #%llu: block %u: len %u: "
> +				 "hole found while converting extents for atomic write",
> +				 inode->i_ino, map.m_lblk, map.m_len);
> +			ret = -EINVAL;
> +			break;
> +		}
>   		if (ret != max_blocks)
>   			ext4_msg(inode->i_sb, KERN_INFO,
>   				     "inode #%llu: block %u: len %u: "
> 
> ---
> base-commit: 8c4f6e3376348fc3162eed86a05b933921c8f9ed
> change-id: 20261023-ext4-atomic-endio-fix-b4-9e1ead9e1aca
> 
> Best regards,

