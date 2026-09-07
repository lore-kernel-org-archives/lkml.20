Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E94192FC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766917; cv=none; b=D4V+HGul8uymFV4uCpYfa6xZP1qZhRd6WiNPkRF/Ecv+ZO/WeBPYkmHMuKYjxDTyN4ZDaZ/7UueBeKqjCOK86EjFpgoK5X6RveyMWQx3o5BuVjZBIQRYvY7sZ8vD6ZfPpJ9ekZfHBurNFLNFbd4IrYSTtkCof6PNMKB4MlakbOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766917; c=relaxed/simple;
	bh=846bMTmXtFIz58zwn2KWlMI0oVbNLlrCfeJ17SRVbqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGo3Y2k2+WoX0bKBj0HeEc2aPOsVgrCBtruwcv18KFTfb9DqKLMYmrhX8ZJqkMx4SOCv/TtVSL1nqgRsvBSfH4YsmZ8aYPN2aatZ8ECVjGO34SeOGt+60ic7FPgZ5DzjPcjEw7xebxWxwUsA/fte7/XscndlxSBSzC60PIngm9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=nq4BMIQ1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="nq4BMIQ1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so24868255e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1788766912; x=1789371712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pl8Bn3vVjsLyABhtV3hHgEyHKlUX2lWCov436sZUw3c=;
        b=nq4BMIQ1q+FfOmtN44ipGA07cHtsWIUqOT12Hi3dSUrGLdIo1cOS1pg0T3o6iP8WQA
         tC64TC3JU/oCmU58hUfHIuP+mBTkwTmpDg9X5R46KdM3vKh2dW3kLQs4Wj5Kneq6fIbm
         Kh8g9ckrANzsNVz7wJ2zaE/cDR5SulFTYpBJP+UppKt/s/HU9bt2x9G2DwkfDgv68Wz6
         m5289RzW+2k17JKxy18ST3nzFXRD5bKRB6/BYvNSjGO+agGIBQ6BUhJE7Iv15wE9C/YY
         RFyYXzaJD0qtk6mI/sX6z2enVnI6HzT0UCxKMEjlYCLQ55LsNTORhtiZ6A99EfYjdAYE
         lD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766912; x=1789371712;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pl8Bn3vVjsLyABhtV3hHgEyHKlUX2lWCov436sZUw3c=;
        b=Sdycvj4uMNBwdv1RPcsN+SJHkKy7a7qulsUq8F4Z4d7daOJHXCH11uX1FpY7+gZBQm
         QsF+nrPlV8Dcp9SqreyHGAhDP2nawakXajA8n2IlGd8G+PbbDlJwXQevDbeXw9Zubxj5
         Esip/Y1jL/eTOXDRhFOeto270pP7rZVWY6RoLJ/8TrqhCRgYnloHfE4Q8/ltFcTEjQjv
         PQiFYaVMzYaERddldLHHA4MEnr7oNyzkdJpxBaXSsplfhLM8/rNZqyEcqN1lS/XUo+xI
         deCPm2Ja3YkcvX9WQtYw9o6AzM2HwRNT5fhft1AqcQwNOEix/KFn41oQK14GVv5r5D2g
         LORg==
X-Forwarded-Encrypted: i=1; AKwUvBzhxx6uKry9NR24VnmwiBuMAH+KAOEdUGDb6IbGHuk0H8WY/VtTqu13w2HkEkc1ehRtBZiZDOCMMOyZHf8=@vger.kernel.org
X-Gm-Message-State: AFuF++nO78nqxfSwBbhf6d1JiWSYE5wJVQlWOlrgxFrkSLcM8NMfwHa6
	z8BwSFMEKRaBKO62pKeWpi392esR3jNZmgFJlYoP2HjZuVAzEu6xOKdTN/ufeMsloqY=
X-Gm-Gg: AYBFou0RVzlRXt6LRKH8HBs0TutPghwsXxxDM6ROvRvwsh6enlscCwG1MfqhYTJfSLy
	cbm0NmAeAQfcbQQ5gPVr69I35sinsNqElUgJW5yFAMI/ugq5kTQOHhbDCAWP3XLm+oBA/Y5i0X1
	Sd7MUdqpVE1NF8pjByGUaU4GYRx1QtMIavS+rGYCBH/YnyCCbeeDUgVvZS8mBKZJ36tBKF5TV7Y
	TWzhLNFlhK6pzmiqKi19h1E7YHDH/h8ZduYRVdZFeZ4xA5/McYtSNG+PaKcXCVddXganDNl0+0u
	RQ8jJABO/5O0BurKZOGlcKynZK/B8kBKGU2p6yW+aqKCIvC1YvBqWKbQn0CTXz/LoPvJ3Bc25V9
	UWR7TOno2rETliQjdxYZEycthhicW7ibpcxWVyuDHhgrDUD/Fs6C/AqYQxyA/9ujpZYeKkcO5U1
	sXy8Xuo2zRr9m5TJSVpGvhmwTmst+1yUqSHABxvIex9LNp9SWWGUPwgJFgkB6I/a/FSsfuK2ZPa
	wDiaJMP/Z8i4h6hqs3ZyxBc4vx+sQ==
X-Received: by 2002:a05:600c:4e8e:b0:49c:dada:f57f with SMTP id 5b1f17b1804b1-49cf823cd42mr194952845e9.7.1788766912309;
        Mon, 07 Sep 2026 00:41:52 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm433527415e9.13.2026.09.07.00.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:41:51 -0700 (PDT)
Message-ID: <c5d539bb-3bb6-4f76-8c75-05a8f240c39f@blackwall.org>
Date: Mon, 7 Sep 2026 10:41:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] bonding: fix slave_cnt leak on XDP error paths
Content-Language: en-US, bg
To: Hangbin Liu <hangbin.liu@linux.dev>, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jussi Maki <joamaki@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@kylinos.cn>
References: <20260907-bond_slave_cnt-v3-1-57df3b3cf2cb@kylinos.cn>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260907-bond_slave_cnt-v3-1-57df3b3cf2cb@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2026 10:07, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> When bond_enslave() succeeds up to the XDP setup stage, slave_cnt is
> already incremented. If XDP setup subsequently fails, the error paths
> jump directly to err_sysfs_del, bypassing the slave_cnt decrement.
> 
> This causes slave_cnt to drift upward on each failed enslaving attempt,
> which would lead to unbalanced traffic distribution with round-robin
> mode.
> 
> Fix it by moving the slave_cnt increase after XDP setup.
> 
> Fixes: 9e2ee5c7e7c3 ("net, bonding: Add XDP support to the bonding driver")
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> Changes in v3:
> - move the slave_cnt increasement before bond_update_slave_arr() (selftest)
> - run all bonding selftests on debug kernel to make sure no regression (Jakub)
> - Link to v2: https://lore.kernel.org/r/20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn
> 
> Changes in v2:
> - move the slave_cnt increasement after XDP setup (Nikolay Aleksandrov)
> - balance-xor mode is not affected, not mention it (Nikolay Aleksandrov)
> - Link to v1: https://lore.kernel.org/r/20260902-bond_slave_cnt-v1-1-36e95bf4a6ff@kylinos.cn
> ---
>   drivers/net/bonding/bond_main.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index a9bff7663eec..1514a8ba0888 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2284,7 +2284,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   		}
>   	}
>   
> -	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1);
>   	netdev_compute_master_upper_features(bond->dev, true);
>   	bond_set_carrier(bond);
>   
> @@ -2332,6 +2331,9 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   			bpf_prog_inc(bond->xdp_prog);
>   	}
>   
> +	/* Increase the slave count before rebuilding the slave arrays. */
> +	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1);
> +
>   	/* broadcast mode uses the all_slaves to loop through slaves. */
>   	if (bond_mode_can_use_xmit_hash(bond) ||
>   	    BOND_MODE(bond) == BOND_MODE_BROADCAST)
> 
> ---
> base-commit: 38b6be101006d3e7af972999f45d4f1e8250587a
> change-id: 20260807-bond_slave_cnt-88e78c5f0ab9
> 
> Best regards,

I think the comment is redundant, of course we should change slave_cnt before it
is used by anything that needs it.

Anyway, the patch looks good:
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


