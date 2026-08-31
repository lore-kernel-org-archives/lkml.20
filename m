Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E35392C48
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199801; cv=none; b=WsHA4dBpNgNYBpR8wwHV7DSK2IxApkJsLR/lvRMY5XaOkxbN5XNGDfQJTfARyN2HoQvomJpJOd8bf4FG3dFneJURcDB8KGny3SIMs8d6P5LEBbRhAo6xyAPM41nvOkA+Az6t4sIGuQ5O6GarrPGtc/BI8ufMZwg6Z+L89S94YIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199801; c=relaxed/simple;
	bh=OUMY53HyrTCqQnkA8KrBjrrWVSQyECdBkTmSBNMfXJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKxaD3nSZGWnKncxW1SawnxgI/VmynPnZDj9Q/Zk4Mx6GNwFKIfObnQLp3+vqqNQ/mU2twIT81oHEAX2SxXDw6lVVzcXQ0mQ5+83IZV67nQaTv3hntl//8Gm7qdKjGeZFnBTd6pwqQXc2PkjBOjQwsZwEqYDk0iJCezO9MeuI+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=csx5e/cU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="csx5e/cU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso84161a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1788199799; x=1788804599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFdfHylOXjETtPhdnLAsv7jcCEOZVeZCY1hqt4pQN3M=;
        b=csx5e/cUTC33Kr+U+h4jgBT5/yiteflcmuwWSHhkMWi9g0gM8tTHH9di6/lcLZYXkS
         I1zWbRAXjoYsNWWZ8jelrHZr/MgXrRG4T8DJHiafUft88BhbYF+x6onvy+nEAnQJCXWn
         IkNBv8kg5JcTux6hnulY8e+bNawzjj9xPJ+/0viInPRRzwsFqnrj5SYaYJob/PncA6o8
         NBZScSGfJrvzhglcfyCUGjvu0noBtYxBjziFAV4pY1aFUswElpSB3I9VIkgCorjtF8TN
         km+y1/Ma7dw1azRgBBjcPmsp0K/rfXGGYMnNDxAUFw/fK20avEGE0wMleTSBTu9Y1Rca
         r5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199799; x=1788804599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFdfHylOXjETtPhdnLAsv7jcCEOZVeZCY1hqt4pQN3M=;
        b=GI/nRssM5yV+JI4LBHaIWE4JLvEdyeHZPD137SWjPDpCN8n+Z/lrwue85v/tsXpdQ5
         o1w00nFe11i4kbu9j/IAPCRSuf3Z0wJ0Tu6TsyclaL82Kin3wc7xJbcoSQNDpmCt8cK6
         ahogQikUy97TT3w16oAZ3A2p1RsjpE/BDh0rir+H9ATZMfa37WGObovi/YQRDVQ5qeW+
         LKsymKca8B51QOfn+ptyT9yq24uegUYUyNAt/oq3XwcuyXyp30Tarqj0nctCzkedtYSq
         rM5Q5d12Mad5np9iuWCOf0n3yEMVxClhj0zQWpNfWN4A/QbOf2xkzQ0YnBiy/vG9E/SZ
         Vlbg==
X-Forwarded-Encrypted: i=1; AKwUvBxLpvxurKWIyqxW8EcSsiIiCGZ2CKokt1xabEHxBoU93BMTgH3FzvQ87MXNjeJqwkqDp7NkWMADt2OVXKo=@vger.kernel.org
X-Gm-Message-State: AFuF++lJBPakxgu81o9siLonwo62xPgVnxBjgLjFlkaSDfgQ3ScKDNpg
	AxzRtA95G+2gm9hVxZi1viTmjQcUKo4gcl/a+DunULRvXkR3K7H2Jk3wafUnMalAus+bMq6QFUn
	sh3vZmwo=
X-Gm-Gg: AYBFou2zjqvauwo9iBa7J/jUbmSMQ3GBOnBA5PwlIH2gHmiECojqoE3hzLSss8jE5zD
	Ed/IKLjRuiMumpYxoXxuoHNol+UxRykTAFkAGMbdGJVOtVqzmul9fCIl/JOsYspy61evMIH1jQh
	wyMU1FXHq5uCD4jFu1NRCW3AtWheIphAY4L1Yg0akvu7cnsqrwy59Nlqz0FAYnPuQAFk93kvRaT
	QnUaZhpWm/GdfBO744fuGhZ+WLulm05Si9jWV28Wlzl8ReFx6dCO0VC3RLH9hdVh25/Q6/I5nY+
	6y1KxVOWDtzVU0qY+X1UDY+ZMeNoAkdfXKMmwJ+w5x0d1O1unq3NnmYIdiT+wT+jdStyUlYyY9c
	gWlmg56FcNLRNpoMmot7X+9XL5uORqKfg1mcD7jUMrpqD32uzScold2JTYdirAz5MzJSr/IlotP
	dP51utNkiNv5z/6sYQO9gTjJqs5B9LDzUYR0nszUSj2Gg0vN4f6bzikSqxPC4n/Ql0VOJ5VaNMZ
	uI0DcX0CXYo7msZdS5ISgkjrshpS0LsETFKufPBoPG3Uvcq2pb2iry+VhaTPg==
X-Received: by 2002:a17:90b:5102:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-396d0ea862fmr45975458a91.6.1788199798914;
        Mon, 31 Aug 2026 11:09:58 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::7:1753])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4de3sm41695477c88.12.2026.08.31.11.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:09:58 -0700 (PDT)
Message-ID: <4388edf9-7248-48e6-876d-daf3bff39e7c@davidwei.uk>
Date: Mon, 31 Aug 2026 11:09:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/6] selftests: net: remove unused variable in
 process_recvzc()
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
 <20260831-iou-zcrx-v6-2-02d1d012f0fd@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260831-iou-zcrx-v6-2-02d1d012f0fd@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-31 10:34, Juanlu Herrero wrote:
> Remove the unused `sqe` variable in preparation for the multiqueue rss
> selftest changes to process_recvzc() in the following commits.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index df6b62204343..c6dbd0ad5368 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> @@ -269,7 +269,6 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
>   	unsigned rq_mask = rq_ring.ring_entries - 1;
>   	struct io_uring_zcrx_cqe *rcqe;
>   	struct io_uring_zcrx_rqe *rqe;
> -	struct io_uring_sqe *sqe;
>   	uint64_t mask;
>   	char *data;
>   	ssize_t n;
> 

Reviewed-by: David Wei <dw@davidwei.uk>
