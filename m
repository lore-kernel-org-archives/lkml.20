Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211425;
	b=rE8dMrIl3MKXLFNBvu2KFUPfYwNtoYpXn+qdjvokjaYNGynR5Xu63qklHr1ROjYW5HgN
	 y396vMwJYQejPlzVW/uBRgVe2OdihI5ZmkZc+pQv1xSXaUPPz5NHnXvGFgRcwOXwbhhGm
	 BEU6Y8iBIunmL2zeZi35lWZyOdGcaHEMkAjF1IeffbEUM7zp9W4sD3Oyh8Kr9vjPfqwUr
	 BmgG/4WtA60Mz+g4Z41SFRmayKZy154BlDvjEgj8WLaWTYvxLDFmP8xW+Sn5olTwIN73S
	 FbmkX9Q0oJOaDcBxYwSlbefXy7AIki6NmrbZrF1AtjTwnAn6sW6EpOqcBpig5oWqzzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211425;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CRBjkWhn7d9366M4Yy3A+HpQt8fCNA/IAxwrY7sZxQE=;
	b=f2X5TV/FaG3nGA7n+80b1TQHw7dWvE9uS9bC6G+1qCUmmhvmNF+hs4C+ObsBk781jLaD
	 hLhFsiDfZ+5ZeFwKbEf2cOLgGLRHSAjTt4xJi0DvEG6fvFnBMC5rO8I1txEj04q8RBqBR
	 7Cy4n0YoIogt5srYwT2v0uoYyREx54JIqvysa00MGc+nLNIVULrv6VyIQqP2VGu/oQYjS
	 qB/ocJT+qfOHKaO1Ooz4SSProyp0sAV9FOVds99JlPKH8GGLNp7nI7sObfEwW5HaIlcrn
	 Vm7A+Kme5EGUCMpqmY75rAi0YvsuT/en+hEqq0K+uQJndf/ROe3WtZRGoDttv3GZORQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZR5wLV5d;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RaaB9olK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF94F6083614
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF94F6083614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZR5wLV5d;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RaaB9olK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794211423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRBjkWhn7d9366M4Yy3A+HpQt8fCNA/IAxwrY7sZxQE=;
	b=ZR5wLV5d5FvFel1Q+TFsiRt6dgm214Lf4e0T2CdrMUJWJDlm621F1bd3NNag8y9e0PXtLL
	f7I6ACXwIxC8NTXFM0ZdqeLcQfLHxBH75Kb8stwCc6t+PXH3TW/SojXkEXjzNZyzos6kUm
	uLkmiIxuF8YrgqTRfmgAwA5DQqMFDkE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-btgasGU2MmmAybtN2xERKw-1; Mon, 09 Nov 2026 03:03:42 -0500
X-MC-Unique: btgasGU2MmmAybtN2xERKw-1
X-Mimecast-MFC-AGG-ID: btgasGU2MmmAybtN2xERKw_1794211421
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso2540635e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794211421; x=1794816221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRBjkWhn7d9366M4Yy3A+HpQt8fCNA/IAxwrY7sZxQE=;
        b=RaaB9olKDeM1axdF/BjA9sMkXn4eMdHiY+N4az9m4hlg2jez3TMiTT1X1cx7nqC+6n
         JwN+meVCZtEmfSQCfjNRUG/HUa2rPy38I40ZXGeE0S4QYG/ET1JlQX3EXPgbNXtrI4Yh
         9UQsLCDH2AabmfrkiC32SHwuNREAuXaFrw6yWDkFCK3P2k54eFGG2VIwElUNL+I17egI
         MDsdN1HS+92hECb9tSDB3z0MP7PshZetdLVpGkV1cQZQn9cLvcR9I1pos2F7xdBP6OYg
         XqILlr6dcuoDHeOrAWi5gqwp1ptK7YfkL8Wobl1LME9OzbA74/vxtR7V/tcPAgm5NnWs
         98vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211421; x=1794816221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRBjkWhn7d9366M4Yy3A+HpQt8fCNA/IAxwrY7sZxQE=;
        b=QN76qvkNapqKkyyTPAUYmcncKQa9Q/YR2kr8LNfnKpVN74XoxPGPaSiezQIE5og3Uu
         NUAz6BdkuMrH+lRZ4R1gnq/KVWIWj39fiK+e+3kLw01RcXk53MaqtLqi6V+P7vpZs/T9
         u7lEnVTC7ZS+k9nze+suA3hQQN/lr9UzvVDHQSCvBwH6s3W8PmEar2mumWp2d27zlVvh
         EFFOb3tLBQSSiTTt87S2/5eKifqHOfV5Plhvfm2Kol+wY7HTluv9qoOtVKRGgMjiz9o/
         Oh2w9iYrfNcerVjsTOmvYhcp84+i0l/v2zOUGXr978C6KxlBWD9uVw1M+zn9f8RtU/cj
         RGPQ==
X-Gm-Message-State: APuU4Z8Sixgycm5GWgZVEA7QW1xcDHOw2dyhi+Laoak5t9+W4RY1XmfL
	hIC05619qq2ENhym6FX/EWZsxRHrwl74qxK6R86GlQ9JGwTZl6EKIbP6+GlU6dlHqrHIH6vKtWf
	gcCvejoSzrDgyM166CyKwpINVeTOM1cc5DEzAqm6ehb1k3ltutEBo7SPD0dNGmr4WkuzOaDBiSw
	==
X-Gm-Gg: AYBFou3xqImzsO0uVNe+H/o3OVbxySikEZVxuhpx/XwVeLMJYSww61WMImk9aVo694j
	ZQYx2de9kbDume8UCziFJfomSRIXdHlu8AY/TCK4VV6k7BOqKUmOhGGEsG0dSF8CjfpvJHCTa2q
	Qqzf/I+QDdXtcrPqUwwcCYxWLmqhVa45begKfLdw0utIIGXdLAL/s8Sy1E4h+dT494HOW0FcQA8
	GAYGF5ihkel5rmkR4jl1m7dOaJKJXftV/lVQWfWTB0RHpRvz7YLWq5f3zewrhmTD/qI7rmikfby
	th9a2N9eqMFsymJwKKtKD810VtR3ZvxuhQoBveWIvCFxSJ4Tm9L8soNElTozQk2oDEO7J3Mh6rM
	q5ONcWkBlDWymVmUhRYZWkN9Mx4d5jcfrljdbm2Tlrm+TC2rrZQJAlGZUsD5QDS0F7/bgzK938W
	+WEiKm7MNRCl5heoE+5YTikWbBxePCiitsPhaz8+dRpZs=
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr57229755e9.18.1794211420929;
        Mon, 09 Nov 2026 00:03:40 -0800 (PST)
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr57229165e9.18.1794211420377;
        Mon, 09 Nov 2026 00:03:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm8407766f8f.11.2026.11.09.00.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:03:39 -0800 (PST)
Message-ID: <17bd863d-0ea5-4318-8d05-4fc786fcf37d@redhat.com>
Date: Mon, 9 Nov 2026 09:03:38 +0100
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
Subject: Re: [PATCH] net/sched: cls_u32: drop ht_down ref on hardware knode
 failure
To: Noah Weinberger <NoahWeinberger2003@proton.me>,
 "jhs@mojatatu.com" <jhs@mojatatu.com>, "jiri@resnulli.us"
 <jiri@resnulli.us>, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@kernel.org" <edumazet@kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <se_YnKsUIDyPpX0CSaIOaKht61bpYFwFGdmOcphFkus7Rk6NW3JnQsqMNGmDOjF1R4yTPaR_yeEK8clojDnh5Orl93J0kiHNJT7R3PkCxWQ=@proton.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <se_YnKsUIDyPpX0CSaIOaKht61bpYFwFGdmOcphFkus7Rk6NW3JnQsqMNGmDOjF1R4yTPaR_yeEK8clojDnh5Orl93J0kiHNJT7R3PkCxWQ=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/26 00:51, Noah Weinberger wrote:
> Hello,
> 
> u32_set_parms() takes a reference on the TCA_U32_LINK hash table
> (refcount_inc at the end of the link block), but two of the three
> paths that can fail after that point never drop it:
> 
> 1. Fresh knode (u32_change): when u32_replace_hw_knode() fails, the
>     errunbind path unbinds the filter and then frees the node with
>     plain kfree(); n->ht_down keeps its reference forever.
> 
> 2. Replace path: u32_set_parms() has already re-pointed new->ht_down
> to the newly linked table B and dropped the old table A, but the
> failure block then takes an extra refcount_inc() on A (the old
> node's ht_down) as if __u32_destroy_key(new) would drop A - it drops
> B instead. The extra reference on A is never released, and since the
> old node survives this error path holding its original reference,
> A's refcount is permanently one too high.
> 
> Each failed attempt (a TC_SETUP_CLSU32-capable driver rejecting the
> rule) therefore leaks one reference; the linked table can never be
> deleted afterwards (u32_delete returns -EBUSY while refcount > 1) and
> is never freed with its hash array.
> 
> The patch drops n->ht_down on the fresh-node error path and removes
> the bogus compensating increment on the replace path, leaving
> __u32_destroy_key(new) as the single place that drops what the node
> holds - which is correct for both the LINK and no-LINK cases.
> 
> Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11-08), net/sched/cls_u32.c:794 (refcount_inc in u32_set_parms), :958-965 (replace path: compensating refcount_inc targets the old node's table while __u32_destroy_key drops new->ht_down, leaking one reference), :1191-1202 (fresh path: u32_set_parms then u32_replace_hw_knode), :1222-1238 (errunbind path frees n with plain kfree() and never drops n->ht_down), :406-414 (__u32_destroy_key drops n->ht_down)
> Longstanding error-path bug (the compensating-inc pattern predates the reviewed window).
> 
> This was found during an assisted (AI-supported) static source review of
> mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11-08). The patch below has NOT been compiled and has
> NOT been runtime tested, and no reproducer was produced - the triggering
> conditions are described above instead. Please treat this as a report for
> verification rather than a battle-tested fix.
You should invest a little more time here, asking the LLM model to generate
a reproduced, and actually testing the patch vs it. ATM we are flooded with
tons of reports of mixed quality. Half-hearted theoretical things will
have hard time to get any actual processing. Also you should cc the netdev
ML.

/P

