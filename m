Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4A4E50D0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412322; cv=none; b=EzMy2Rus0+p23zfifRvYPDcIyPw4fFqE6U3XkSEXkcCoQnOIA4T2lV1GILnSv5iyfCo6dCqY22QJGTFxdLl+l1PCdGrFSijJKhMGMWTtKI6u7xnU3/Sfmar0GctdGhAJr/Mplfts/HsiepGMouIycoimY9qz1yuZ9cNpzqWU0g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412322; c=relaxed/simple;
	bh=Dhz4EAB84K8YKVdaec8L7yXiD31Sa6yoCg3DwbxFBCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvIHUtsx67WgYt0OPRiFzikpFuuXA93PZnaycHUUaeozH7X0siXIbFNJv8KeOT3i6ua7ORJwwJrnpKIIDQPHrkwD/JM1KMfQjkFe6Jfv0g7yALfSS2BQMXJvre9Y3N6viVfpn4Qf5mmH6skP6753LFP8wgR3s3fbJsmki4NDYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=NsEdyxw+; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="NsEdyxw+"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5364d86f7f0so21387481cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792412320; x=1793017120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3WD+05XQNdmEK1W1t9slgGmeAmpjGd1vFRCxbqLd94=;
        b=NsEdyxw+bwxLmw+QXjVWZR5ZR+wegJLa5TOQv/pzq+Vsd0tueReKyi7Rmd9+7dopvQ
         wPOMQ/vNtVMozb5JYaaUR45XUpQHYKAnwYgcSivLxmmBZ8pX1LnvD+0CCqMOc+chtsk8
         kV/KEHwb5jBctJ7hVBfKYmMGVxo1OTBVaiJ7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412320; x=1793017120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3WD+05XQNdmEK1W1t9slgGmeAmpjGd1vFRCxbqLd94=;
        b=j4dui6MGvmxW4IGtvs9ZTffiXlPLrBOiX0uk4T5fPsdQq5qfgEU7uQqdhAwyz294qY
         779saHNtphtXVFvIsr/ykm5D7EsVLStYzxLKE6yeQc7RKe5BKHiEwbBbvZfCIzcZmtOR
         FqGsK7smgTZzZYFwtelXQxooybSTNO8hW+o4QGG2k/sHqpQn+US1BMN+fvud0GERe1bz
         IgRX90m9Lzu1tHZW8zRKBg8gtQR0TqAVHfhyjJhMJTN+R7uwFKd2/N9re/aSVrdUaMke
         XpUMt0JMh3NBX/vimtR8jnCAL4U4W64hBt77XySeqTS6GbNDJOZTpo0ErxRaQy2Gw0Us
         bY+w==
X-Forwarded-Encrypted: i=1; AKwUvByVdDAjAu+z6GK0prBwVFZZTN9D4Pc9YmIx/prGYnPc4/9jl+wsa+6p71pZ0jijG/TaNxRQFWDx3YhNkis=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYvLX1BeGL/wk8TLggRGuy9s7JTl9wzh6ndviQrBi2dJMEvGbJ
	80Td59O1N1WTbt7BhvWT/Tdy+ZmUccgStKJDe5oB/7nF0IPjWcX6wZVFiDALSAylSA==
X-Gm-Gg: AYBFou0fgu5O5WOEqeUQsA+NbvLDmc3XN/GKnn7ctnljkOEvgPv9GA8N77DeSH9Wfl7
	obRsk7MTYZxyjzbDxgaIwbVj5tIo/3L40BNyETODNAu4ouZwqmWwQkMDcdTVHfv3mIkG56bzcO6
	bb1i3fmNlFbFs+tTF+bTbQSW3deNWvrhf70F0/LMW6KaYV7wJulH9s0YansK+tH1eZRman0e9qn
	gpG5uVMCp1uvrKgACBzhdgA+3w0y1TGYx4opIdQb2GWSxA/6m5Ft7qUJD7qkW704AmXysPTIF0M
	hssa75b5zWGGJ8vn2Hb1NggJoSmlkj2Us792GETQz8MGhYDdOfNDuKIcH5/KpNeaQmyNegN22zk
	xIoq98kuIerRAYiXRKW+EwJ9RG5jmIKDfx3hQCW8Pmywxh3e8XI6c2QjcMAEyeqG7xs8IvWvkGe
	9eP27Oq2/o5LZWyWbmi+xl6SZVgnetAYqZG4labUs5CsBjpsbilFvQUte18UzPEr1NVdNUsySDd
	Lp8
X-Received: by 2002:ac8:7f4c:0:b0:535:cd9e:c0c9 with SMTP id d75a77b69052e-5364611f857mr110473131cf.74.1792412319625;
        Mon, 19 Oct 2026 05:18:39 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-5367f9abab7sm2496911cf.1.2026.10.19.05.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:18:39 -0700 (PDT)
Message-ID: <2977f214-00e1-43e5-b286-eecadffcab00@ieee.org>
Date: Mon, 19 Oct 2026 07:18:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fw-management: fix argument alignment
To: Okhuomon Ajayi <okhuomonajayi54@gmail.com>, outreachy@lists.linux.dev
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 5:42 PM, Okhuomon Ajayi wrote:
> Align the arguments of the fw_mgmt_load_and_validate_operation()
> call with the opening parenthesis and split them across separate
> lines to avoid an overly long line.
> 
> CHECK: Alignment should match open parenthesis

So this was found with "make C=1".  And the checker tool used
was sparse?  If so, that bit of context for this message would
be helpful to add.

Also, I tend to ask this a log on these small one-off patches:
Are there any other instances you see of this particular
warning?  I *know* not all of them can be fixed as neatly
as this one, but are there cases where aligning arguments
this way still preserves readability?  (Greybus code also
generally fits within 80 columns.)

If there are, I think it would be good to fix them together
(in one patch, or possibly in a series, one per file).

Other than those comments, this change looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
> ---
>   drivers/staging/greybus/fw-management.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 5d01da6b6eb9..e20e9136c106 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
>   			return -EFAULT;
>   
>   		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
> -				intf_load.load_method, intf_load.firmware_tag);
> +							  intf_load.load_method,
> +							  intf_load.firmware_tag);
>   		if (ret)
>   			return ret;
>   

