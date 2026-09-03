Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5C17B418
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422919; cv=none; b=dE/fznmoeaMdSs0wCB/qtcCB5rfhgPfb3UwQXCk9qkrfN0gUcsK0s64+U6akHKwJoE5DqV/vebTNUvpmIiMPE0D0Dp+YOannviVwitaLLQ1rPyMbddVbZ98D0wsz2cXWynnVF29aBUtVci34ADahubfWWylBa7LMLEg5t3Nh0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422919; c=relaxed/simple;
	bh=YwGBiuEcm3sjogZOLti1YAejry6Zqo6w1QEnPrFrIIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8aX5VS5R5WwvJQVXsyyRePSTaNO2EGRQjVxO8U57H0wAiFNx2UQmGqFP3AEvW/yy4GGgtZonDpWrFW6JM7oRv8SZG56zdE6Pk5H5zUpZBBx09PbGVTrUi6e6kpepl5CrbRgDLy1H855kAH0K8gNQRniYq+RoymX4gf52FS4miU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ey0vAWc4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsCqkc9c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ey0vAWc4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsCqkc9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788422917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pxj+lVXL/zpSaRcXZGTkqNDz4XPtDz61G0ycxj2h4L0=;
	b=ey0vAWc4oDBW8My3CJcXU2wpTF9pAhcLRKgOlwfA6ZkUiL0ruxoXQE2SeBF/Xe50k15kv1
	stWyUudoaJOrKdtSywUrFYlEyNvveyWASuZz5quzyiffruWQ807K71cZbgy4eADX7AAUeP
	A7dbMK1uPDMSmB4yCRliGvH8kdXDdoM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-Z1L_ViI7Nm6U9djmi5J86g-1; Thu, 03 Sep 2026 04:08:33 -0400
X-MC-Unique: Z1L_ViI7Nm6U9djmi5J86g-1
X-Mimecast-MFC-AGG-ID: Z1L_ViI7Nm6U9djmi5J86g_1788422913
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso1392403f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788422912; x=1789027712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pxj+lVXL/zpSaRcXZGTkqNDz4XPtDz61G0ycxj2h4L0=;
        b=bsCqkc9c0rbIyjgW06PCPpL95B8A3d6UnSikHKmjoTMDFb4zLZY3M0eza4GeaZ3lDF
         OoAyOTx1BKv6rAYoRGgrF5y/WB6xwyy1P82lC1WmDTW8A9Ck1Te6nwi03gakAwfKxA4x
         y+D5CKcEPuQskR3oHw9c8lFIFp9XHRgCPkeAkTre8tz9NOCc/qjLPfF/6T5OD5hM2AWS
         ugXYta1oD13HOvyw5bXCijzaH2MF1OsvLua9l+DPTwcYTM6t9y0L2BlBGdvlJLJjDh4P
         rQ3JWOJI2PkmUDaxRJKe3MXD3jHCfxnCeZ6Ahi/zS16+zM1xcXFBZkI+QgnZfqqJuepj
         rpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422912; x=1789027712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pxj+lVXL/zpSaRcXZGTkqNDz4XPtDz61G0ycxj2h4L0=;
        b=FTCn5PIvD5rjKWp8XSS8dikwhLhc5quA5P7DC248dv7ENkYSJHf5LOv/Jx3/ea0wMi
         rHuGJ3nDWfe996DR6EltdupjQpS5N680Ali+hK6CytJN9qJaBccyVggAWJCYznyqWCph
         8mDqKtUyQ6Qkzm1NP0NhYJ+QRyivnGm0+Vdc03/P1I4wk14xMGI0Jk7WQp/9wdFx9CNq
         yQKSrrwn9owCr7r71dPRlQ3WXLzgLSDG/DIRqCpDlw3ZCxknjoX3rDT9g37rzLSKkJbE
         zTcPlwnCd/CM/3paXFc/0YYXSa0Fvd4vgjqua6abrzTaNnFMQk1JpyFoei47pb3iCuRq
         TRXw==
X-Forwarded-Encrypted: i=1; AKwUvByqLDndqIYpztWHgXF/shQFaFpMUQr/1qsU7V8utkwDc/SlSlIxqMqL+C8HES8dBihNYI9q5qI5a1rPzd4=@vger.kernel.org
X-Gm-Message-State: AFuF++lA/fVH2vMdgFnhz9cjpanta4rPE4Q9b1m87lXCXV8n5pc3OB+d
	oEGdQ/TzAnxZ3nLGFx8MiYq/ZeLNUUGEolLvMTVsmeCpTSEA6oUtSPF5thm3pEsrKUoN/ZBpphe
	Iq68Y+Xia0UkImq2kB7V4JWCj2d4ikmQkSOmZE03070KC2m2WhLRbKf8UwQtKBdXbog==
X-Gm-Gg: AYBFou0jdZMu9GsnsEeep1z3X2qXnIcUTgTzw34rCOWqU0cFbxNDoLdKisSz7UPEtSF
	oat64LxJGx5nN8IK6Hxbk9yOkXBbNZtkE6uaX+tVNUUnqqYoHCHnIQS2V7/ZI3Eioo8tN4RLbc5
	pSRe2H9yFhyBJMvO7cIe0OwlBDy6eihzCJczhok+pwtsOdN7TyzsdvYyA8AgkeTAf4E/eSuBWs/
	y8uqnRB7wfK2eEWktgGtS6/iCHLcxizGG+hZcS47Ux4xezgX2N4lGFqwaOJz3Px5FIEYJ7BSKIZ
	FFqnn7LZXat7SzHuaBvqC4jKnw+wKXZOjIZcbIGOo7dSClxvBETiVTAY+KovpKN+zm4ayVPUmj/
	dTgSQJ/3IFfe26jpnRnVKTedVUpm5FrZoKlqHr51sHiZayFd0xWIGL9kmBU9B1SFQvr7JFOQ62g
	==
X-Received: by 2002:a5d:588f:0:b0:482:fbb5:8a74 with SMTP id ffacd0b85a97d-48488f032b6mr17086062f8f.11.1788422898343;
        Thu, 03 Sep 2026 01:08:18 -0700 (PDT)
X-Received: by 2002:a5d:588f:0:b0:482:fbb5:8a74 with SMTP id ffacd0b85a97d-48488f032b6mr17081105f8f.11.1788422866905;
        Thu, 03 Sep 2026 01:07:46 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm13498841f8f.14.2026.09.03.01.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:07:46 -0700 (PDT)
Message-ID: <da990dc8-a7c5-4870-89f0-ad8e7dad0e0a@redhat.com>
Date: Thu, 3 Sep 2026 10:07:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] tcp: fix mdev comment in tcp_rtt_estimator()
To: Ziran Zhang <zhangcoder@yeah.net>, Eric Dumazet <edumazet@google.com>,
 Neal Cardwell <ncardwell@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260901023539.6986-1-zhangcoder@yeah.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260901023539.6986-1-zhangcoder@yeah.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 4:35 AM, Ziran Zhang wrote:
> The old comment "mdev = 3/4 mdev + 1/4 new" only describes the
> common case. However, when RTT drops sharply, the code applies
> a finer gain of 1/32 instead of 1/4, resulting in:
> mdev = 31/32 mdev + 1/32 * new.
> 
> Express both cases with a unified formula using variable
> gain g.
> 
> Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
> ---
>  net/ipv4/tcp_input.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 0f60a1dbf..2c9feb181 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -1108,7 +1108,10 @@ static void tcp_rtt_estimator(struct sock *sk, long mrtt_us)
>  		} else {
>  			m -= (tp->mdev_us >> 2);   /* similar update on mdev */
>  		}
> -		tp->mdev_us += m;		/* mdev = 3/4 mdev + 1/4 new */
> +		tp->mdev_us += m;		/*
> +						 * mdev = (1-g)*mdev + g*new, g=1/4 normally,
> +						 * g=1/32 on sharp RTT drop
> +						 */

I'm sorry, I have the feeling the above does not clarify much. Also
AFAICS it's not a 'sharp' drop but any negative delta.

/P

