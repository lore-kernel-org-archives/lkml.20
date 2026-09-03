Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEF4A499E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441799; cv=none; b=azLJ0ovboMrzoDFdhLv88poFjJ2opNhIoYmeEmqCpRylVctMzAzdGzCnkmQ97yANmhy6bLpQwvki7PSD2bYqKJUvHOXWEAdOW6zCq2mYbwhAZWzXZwfycvE2epDYm2Gxhry309D3s1Hkt6+1NeVMmVvsoAxJfe79oMSserKEho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441799; c=relaxed/simple;
	bh=EDFARvlMcOirKUGwE9AZ0iZlv5bOg6YoUmnxawq5gxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwaXEjyFajBLfQC+0WBD+cQgm/sjZ7Kd9Tkq8ft0z4WyFj15MY+5eUryjyHzqrhLPop1gEaEWlE67dhkvH3J9gto6mi5fwhUyKFtTnyQn/Z8KHA20ySyRoQH0le+UBdjR/zPaD3d8eWXyjgpXLMWnMC8r2xeV/1BrDYcTWt6aRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=amBTZeSK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gsqab8UP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="amBTZeSK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gsqab8UP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788441781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lljH/FqiYJ4HVD9LG6mSefJkZCWX5aKHWi6CMB6vKwM=;
	b=amBTZeSKW/D7LgQKWhSBzOLwBvIkSX/p6OenPL98d1uiuDDpSQyjpXfhgfyNz4iitu29rF
	K71u24U5VAYqOVWrD5ODI1Pn9yKBSMqUrH1Yk3oHngEUFK/NRtt3khrwMv+Y6vJbjfhuJm
	0Juur2+xjwviXMqHW+Sxo0inpoZnFWw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-vFnzsEBuOFOp6rPyoQgt2A-1; Thu, 03 Sep 2026 09:23:00 -0400
X-MC-Unique: vFnzsEBuOFOp6rPyoQgt2A-1
X-Mimecast-MFC-AGG-ID: vFnzsEBuOFOp6rPyoQgt2A_1788441779
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49a1b4ea633so24560415e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788441779; x=1789046579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lljH/FqiYJ4HVD9LG6mSefJkZCWX5aKHWi6CMB6vKwM=;
        b=Gsqab8UPA09Sje4VKotnyjahqJl7BHCCqd0cUvV88oX0ECHJDy/tIEKEqxZ30rnx4r
         LiZNgts70ySTsdrSzCweAHHZ6yfozHQ6+oDR59y34j8tF5rnte0oq2bw3Hf5jNsEMy8l
         KhtyNJ8KFiONYqezHLCsJm9mb95ToVs+ZJKj0rYsfN20wqZVyHxKcUcf1jXKCBNgcuZT
         HblPRJ3vTtCe83WocTDomDa8RsuF4ILK+H9YNo/lZnMv2asU2oOa3cHit46WOwCLNk0M
         BAhNwD11UiJdhisNSg5prbUynZESVU2mm90RLd8W0OQoOE0IKkxVOt3xRfG0WcOpA/pd
         G/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441779; x=1789046579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lljH/FqiYJ4HVD9LG6mSefJkZCWX5aKHWi6CMB6vKwM=;
        b=ZcL7AUrgrSrueudVjxval2txoNHxc7VWUuQ01XsitRTR+0YaW43cgbW7blbqZhiH4/
         1fiavk1oRN3o8YIwAzisvZs6iQv/bcfFGd7shZf+MLDsDn0/nWswd4szYUWpq/9PeTy3
         5a/Z+z8r5c2Gvk/IiG5rNgjeYXZRLBKcFAQ64cFBCtMOFGfF1DjvHseUL4HOqvjQH/FB
         z0gaHGceGxA6zY0Nyc11Y84klMaR6AbIOzQyZ/KDkq1JLMgkrwvX4Dl31wqoerNfF3mJ
         QcbiBIY7L4Hfu+ohXvMWGGoVZUgSb1WgaGoPy6WjHPqLp2Q6kjB4YIy32BozPttN6AGi
         KOdg==
X-Forwarded-Encrypted: i=1; AKwUvByQ6wrNsmkNWfoXHIYSyhbZ04Ew20TpkQ0pOeNZp64j+1ZacyOGBhRhalWRFC54TtPEr8GI/l8kWKW4O9k=@vger.kernel.org
X-Gm-Message-State: AFuF++nHoQIr1ytWoiVzqmLOMU5ORrG7+G21JkHFUgIsyLfxolwUl037
	EtJ/ISEaRKnRkg3/BHvqxeLLP5A+R7rD5B4NbB5ZCrHOFtTmL9AwgqSq1qKkMdKuTAt3LvzSYhl
	bnKChHIWaFlSPs4yRHINIRU3BLYrlLXyO69ypTw7ZbtniNor5kD+fFHH8uCEQTXIO4A==
X-Gm-Gg: AYBFou1/s4MvcfCTwwnqojNNmOP6ceo7eqV/QVpXyW0pqGJ1CQ+taK2OJwQAhaFXLGv
	NuEcZoaUW2wdfr9R/zgbdAMD5GblYZLteaFdEI2C70YkV9FwqOEBnpXwVQ07Dlo1JbeLsOp5m4O
	HPGCjupNIML+F2u2/O5tWiQw6ZJd/v8L611iw0AZSCccK29zK4gMPSW5ExhiC9piwe1p1Z++DlN
	Q7zHSWEd0CgFiNkiGd2wzCDEpVP7iZwlQ5PYYVESZz/tCvwzxRx0+66NZ2z+tET/OkxS+oT+xUi
	+XHan17tME53NjpQlgPYQMmlb96lZIWEUr0iiJyqa3TyXCKqObWVXW17M1pUl0lSlIn/A51+47t
	fDIbPWkQkAf1KWG5hiUlOK6ewDR3d2hMyefHPBXERELn5xZoZoW1Mgf31R7hIcrLLUVBSV/Yg+A
	==
X-Received: by 2002:a05:600d:a:b0:49c:e88b:b7ce with SMTP id 5b1f17b1804b1-49ce88bb80emr188830435e9.11.1788441779281;
        Thu, 03 Sep 2026 06:22:59 -0700 (PDT)
X-Received: by 2002:a05:600d:a:b0:49c:e88b:b7ce with SMTP id 5b1f17b1804b1-49ce88bb80emr188829265e9.11.1788441778811;
        Thu, 03 Sep 2026 06:22:58 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm70872675e9.10.2026.09.03.06.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:22:57 -0700 (PDT)
Message-ID: <5832ba17-c096-4f07-aa73-2e2bb6f79856@redhat.com>
Date: Thu, 3 Sep 2026 15:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net,v3] udp: revalidate socket family before publishing an IPv6
 cork
To: 4ncienth@gmail.com, edumazet@google.com, kuba@kernel.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, horms@kernel.org, willemdebruijn.kernel@gmail.com,
 vyasevic@redhat.com, linux-kernel@vger.kernel.org,
 netdev-bot+sashiko@kernel.org
References: <20260902010408.1057857-1-4ncienth@gmail.com>
 <178844070069.3394541.5419916956797677793@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178844070069.3394541.5419916956797677793@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/3/26 3:05 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 2 · Medium: 0 · Low: 0
> 
> - [High] Incomplete fix: the sibling IPv6 socket-dst publisher in the
>   connect() path is not covered, so an IPv6 dst can still be installed…
> - [High] The fix is writer-side and after-the-fact, so the mixed-family
>   socket dst it claims to eliminate remains observable by the unguarded…

It looks like fixing this kind of issues, if possible at all, would
require adding a significant complexity to the data-path.

I'm wondering if we could just remove setsockopt(IPV6_ADDRFORM) support?

/P

