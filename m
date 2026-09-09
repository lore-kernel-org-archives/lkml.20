Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C856B879
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967948; cv=none; b=Fgrx6zj/N/0evJbKjzfA577HbGQ82pbn6IWHTSaEG5q/o30ChkkFt/RVF5lzb+JTPWPc/dc3qWq09En8MuQeBrkpOpw1NLdVjCsFerDxEE0qZAnWftErh4I/kHU1wcAG5X5MLHe1qtOLkqUjY4ZTUaFPOzNnnsaFBmcpNwRh0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967948; c=relaxed/simple;
	bh=14M4ZYjhJX3O4zggMzrZLFQTOxB+Uxhxu4feVRw12CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuUOHBbQadXNpGCu37pkhfyENqDB1shwLT3fhrggdbWbLe4LYOJ0ybUot6E9lzbn2M1SbibD3A4TH7Chou5Rh4gi1rqDNF1Gu5hpSDA3tzSr/00xKw7RYz+I1FfEKCvs6Vad6mK7mtZbFodDoM6ed8NivOGianAaLXdX5h4M7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ew0xP6cZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=diKHtcR/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ew0xP6cZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="diKHtcR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788967945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiToT9bwf6jQEAPqpOH3/rlRkJ/28pcpFwIlQDA5v28=;
	b=Ew0xP6cZLUqrbliDhTFDAhc7hnONzmwrkjvEOiiN7FgSgae+OenEB1oaZR0mSVbSIzgbpa
	ww6jFTX8hRlF/gPcjwW3dSWbHxq/zl/8CIABSNtPziECAWwkeEePJKwZguSlv5E80tZghe
	rkuOeFKOIbwfy9SfAz+QQU/ARPxFjbo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-6yexwLG1Ph2kMiRROcHo4w-1; Wed, 09 Sep 2026 11:32:24 -0400
X-MC-Unique: 6yexwLG1Ph2kMiRROcHo4w-1
X-Mimecast-MFC-AGG-ID: 6yexwLG1Ph2kMiRROcHo4w_1788967943
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso4119610f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788967943; x=1789572743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiToT9bwf6jQEAPqpOH3/rlRkJ/28pcpFwIlQDA5v28=;
        b=diKHtcR/NHiTms1Za6NNJsncNwGVUYzibjr/rDoZwvpG0UyhJSBQ2vfLgu3rZf2k7K
         kUmu4LttTzGBI+o4A6kjmh9WvW56cEAmU8QvBUx3TM6yWOGECM1hk833H90I9fiw+XyY
         PH4mW3mn7hXykmsLOrNqgtsdrvKeRPi+qy2sanlNG9Rcq5Owqp3LpOizDQW5t/1P+5ak
         fibZIlHvkKdo59pOZY84ZFloIABbzwFzMuiCyGwePbXyUJ+9fOeBU8vTrMLe4yWZ/UpS
         KbcOou5PmbXDcDsk5OyeG7V0k3+EdZE2hgpYPnTys2ydXQfvaT2fjyy2X1+Sssheejhe
         rX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967943; x=1789572743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiToT9bwf6jQEAPqpOH3/rlRkJ/28pcpFwIlQDA5v28=;
        b=pqkk3aujzOEorFo+PjKOGOI0Tl43zioluPEvyMqsyVBREp5AJhsH4DNO2jQg6mtZ+y
         xpbumvxHi0l3MeQRrRVkMHk1glrsak7f8nhtswLK8LtZorzB9aeNcFKYwWpr12npNjhM
         uWQGQAkj/MRL0Ja/r1iUJ22e5r0VdYsk9NTJTlTZmfdGkumbdJwBngLGfxqUTw+Knafv
         wGvEyKZTdnU2fKY/MZEytLYiT8heTnadpIxqkfk8AT0bTeY8868D+j4S6SJLaq+c8WgY
         xRUjbAzw2xZ443NDAmGTlbb2jI5ciPwn5Z5yJB3+Hwym8vdeQFxYVA9ppfFocYNP/C82
         Lxng==
X-Forwarded-Encrypted: i=1; AKwUvBydVIdAna2EeMEkIFViI2UFRavWgGSKJQqtOa6cV9FLGPQFqqmmZdvqP6I8wIoqI8HzVua5VXI3i+4DWeA=@vger.kernel.org
X-Gm-Message-State: AFuF++n7EmcDNLxsz56fg5sKkrPGiWH0GhsathQaY1+xSc3MpBIuXd/O
	riwZJWlFpbFtz8k6xt1I/IUEhHpcPsRLFFb4ifnHKNL2kk+FOPEJI1kqWpNy5Q5P3tz+AnLRsyG
	iWBlObZBjLkVlUrLKMuSkQf6xlqJ3MV8+XwRcAlktiK44mz8j9+9MAVR5cBQcDkCukw==
X-Gm-Gg: AYBFou0rbZ3PGJHysJTzBOQnuJGw6fCmxr0HsU6quWk/71pC4n6Iji+TBiNWwY0/SoH
	UONSXYG4oN8YDDbcdXuVSzA/8Nn6JQ29/8jdhnZ+5r7AyTs6mZvLnS2zXweQMPYCqocg32Gq8Tj
	UVnm5Nj+2WGW8OHw/Rg4IeLwtJDnz/XNxYYCorf/UDAGl37BwE+lrve2zdzlwjgI6Hxpeeafvk6
	SPP4g3t20Sn5cbIO/PWROcFAqQNqY+u5ZBaXi6MFxJ+H9aggCA1rEvdahkmUDAv7kNISezq8Zhy
	l8nLLU5Kd6nQEVvkXidy+cZB2wEXveH0GHHv3jHV+5tV76haGF9Bi3SPoS+Vyyv14M8V7B7t4td
	IzAQo1kyh75NjcpUX9wnN9oxBRTT+PdTygD2yQ2FDXq5PAci1Bp0rnj7spPbnpTi0UCQTV0CaNQ
	==
X-Received: by 2002:a05:6000:40ce:b0:484:3310:710e with SMTP id ffacd0b85a97d-485aae0e2dbmr12699294f8f.26.1788967940448;
        Wed, 09 Sep 2026 08:32:20 -0700 (PDT)
X-Received: by 2002:a05:6000:40ce:b0:484:3310:710e with SMTP id ffacd0b85a97d-485aae0e2dbmr12698537f8f.26.1788967936909;
        Wed, 09 Sep 2026 08:32:16 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm44398592f8f.14.2026.09.09.08.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:32:14 -0700 (PDT)
Message-ID: <7cef8694-2abf-4ba1-9bda-2bb8594140f9@redhat.com>
Date: Wed, 9 Sep 2026 17:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 01/15] mptcp: do not reschedule the RTX timer for
 fallback sockets
To: netdev-bot+sashiko@kernel.org, matttbe@kernel.org
Cc: martineau@kernel.org, geliang@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260908-net-mptcp-misc-fixes-7-3-rc1-v2-1-df1de70348b6@kernel.org>
 <178896537258.219967.9085177988970978054@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178896537258.219967.9085177988970978054@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 4:49 PM, netdev-bot+sashiko@kernel.org wrote:
>> @@ -4141,6 +4146,7 @@ static int mptcp_connect(struct sock *sk,
struct sockaddr_unsized *uaddr,
>>  	if (IS_ERR(ssk))
>>  		return PTR_ERR(ssk);
>>
>> +	set_bit(MPTCP_RTX_ENABLED, &msk->flags);
>>  	mptcp_set_state(sk, TCP_SYN_SENT);
>>  	subflow = mptcp_subflow_ctx(ssk);
>
> [Severity: Medium]
> Can this set_bit() re-enable the RTX timer on a msk that is already in
> fallback?  It runs unconditionally, before any of the fallback checks
> below it, and the fallback state is sticky across a failed connect().

This is an unrelated/different issue: when (mptcp_)connect() fails early
it returns a TCP_CLOSE/SS_DISCONNECTED socket but the status is not
fully cleared. Should be handled with a follow-up/unrelated series

> Would gating the set_bit() on !__mptcp_check_fallback(msk), or moving
> it below the early-fallback checks, close this case and also make the
> new comment "Prevent rescheduling on close and in case of fallback"
> hold for a msk whose fallback predates the current connect()?

FTR, I can be low of coffee, but the above suggestion is crazy wrong.

/P

