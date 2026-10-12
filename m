Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED548EC91
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819278; cv=none; b=CB+0iKWsWhKNKBrLsskJrTirKjzWWL0c3K8ehEGaap/gUOZK2P31i0G8/Agc0iwBp/JPdWufcGkAILk4yD0+n11PLK6LdzSMB6B5WEP1W0dZi7cxUuDFUqeqoUsGmGggyIQBF4zcMocBaG4gkty4kpLU++/LZSUKMFD4bgb78eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819278; c=relaxed/simple;
	bh=xLZf1kGF5shHGn7VtBPMlBDgabDY+duTErr45LXA/HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOAH/g+fK6jr3PcrijMy/JS7eOyDmY8XbsEaZEsuR2tCzs7V3u58Vzb4SJJ5iM1Z8TyHvWOp+qDIpn2hW4ZHWuPOFev02Bo+x5eLYdIukJeW0X3juja/cWA6SoThHXFHjSD3s07swxrR5hgJBA9jw5d0rmwQnK2rF6a0vXG+jkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RARiI/lS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DZvmoLC4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RARiI/lS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DZvmoLC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791819275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myjUzaBL+K2P3k1wyYvU0ibyOmHh6KLF5zYoWPKwyNU=;
	b=RARiI/lSpf2INv7E26gnTPBFd7Iu6JHrg/w4DFHIb7TuALDgXre8JTMFzoMhwoUPAYLNeD
	9wKAVb4h1OVZEsa/qRpZO23ZoyUQlfJlsZIP2IheOgxX6QxdXBPfIq7niXqJTmkshnC778
	CcmSxbqhdgd5YbWc1LODTxmbhkrF3ug=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-3AU91IqgMLOTxg6gvtU4oA-1; Mon, 12 Oct 2026 15:34:22 +0000
X-MC-Unique: 3AU91IqgMLOTxg6gvtU4oA-1
X-Mimecast-MFC-AGG-ID: 3AU91IqgMLOTxg6gvtU4oA_1791819261
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a165fb7beeso18969535e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791819261; x=1792424061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myjUzaBL+K2P3k1wyYvU0ibyOmHh6KLF5zYoWPKwyNU=;
        b=DZvmoLC4pCcS+I1B1iEOSGdZyUKayWUEdU119wrwD23ChAF8Q1pUYUQaswvZEwcD12
         0rqNk40tBIjaMiF9LXwgv5b0+e18nXI1axouHOUW0tYtRaSExWjSBzdIFv5cFgYmeFDT
         XLKGVXtRxegI9cUaJyRXUWucgsFPN2CnMXzKO94mgL4QZoUSJcET6scKT6dr6qNerbwZ
         /8u8cYmw0QfUHkpVGM0gxuZ6YyL1LMHVLbvlF4p2khTapsDNd5xpsurbHjuvPiBOLhP+
         0IWU4H3abPjJkJ0Yr0G77VgfMqDETxIepHTuHgmAntyS75axoXntqcjkrA9bvAsbjbJA
         DhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819261; x=1792424061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myjUzaBL+K2P3k1wyYvU0ibyOmHh6KLF5zYoWPKwyNU=;
        b=b6RzQsQ47dA4fsOhsXMHATIcbnR2EiljmYiJhRd9yP93NiKGQ90Fx541K5RhDBCKRZ
         tOv7eePzyzqaHLlIv5tMRz0vWyXmJf2BbeopD3/Z8wgPOSvEqn38yrX/VRzxei6OeRdm
         rLaVj7zyG/REyko7pUXW4pLk5ZjHJnBkCKdZXIjLekV1x/X364mUoE7Z5bpa2Ihf0c6w
         uFursGZeZejLrcaK6rSxpjK1DeC8wnBnLTlc16fT7TIApZ2wwwXN/UXhcbDrW+ELGMXU
         CHWV5RwX0trwar1mRztZHPyxMXmgaVEKhg2fcX5hd1GXK9F7upvOr3clHBq5D2F1GwEq
         dYTg==
X-Forwarded-Encrypted: i=1; AKwUvBw8HTXzdA8H6Fh2NtL/Gtp9BWFWvFTHyzmVC1aRGfASZpHtylyp2j/XlSTg6A27FcJPsG3G/k8/xU5RRCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5iGjTTW9+g5RQDjAVfMDXsBE3bNZF6FXHJcV+5030Y3gnjDjA
	ncs9mP+RX58HpwZFuvHQjKVeK5vmla93bAIk1BVRYSs71GA2QjBJsoKBjmk5++x4CpC2INE1ZBw
	ZHC/IRKmiHTED0GoT77uAl1Y3vibmIl60T8NN1pHJEDEDtu/HiyJ6OShcz/4Z2HKv42i3A7Z90w
	==
X-Gm-Gg: AYBFou0Zy2LfPwqUSmm7veMPMlPzBQGTysTnHSo/denfqK4bclyEHyxAvKmCFizEl9U
	P6vNTl4FQ8icD6L5e0aNWxm4QSJLuIS45xT3S7v6M0TYi5ZBEtS+SAxJkLc145WkPYpJf1Sgzls
	uDPRVJ+KQ/UKYbLNFbFP3kiRO01NGU3kZ7/K0Ju6RzxiF+zMHOGBv0cWoLQ6/4IKC6gUdCJh+2G
	DWm6tlCsjUFuaHz7BOPoinvQ4Z79y8LeYDxHmca+uCsQwhh/u0MFSaV/1uOG9r4bVJCkLpWLSFw
	TvpblnHB7PViXpCBOY0za0rN+BPFNZSs3r0FERrxwU+EWEmrxfELA2OVeQqqo5xPSC3AHhSoIka
	ySrhmL5aG/iFLyV8WvxTfl3XhaszwYcbCHuxAwx1oOQqvli85sGrLVxrYV1fZx11lkRxG6e+jqw
	==
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr112401445e9.15.1791819255791;
        Mon, 12 Oct 2026 08:34:15 -0700 (PDT)
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr112400725e9.15.1791819255303;
        Mon, 12 Oct 2026 08:34:15 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm299361335e9.15.2026.10.12.08.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:34:14 -0700 (PDT)
Message-ID: <baf77454-2a6b-4f10-836b-9e3612fbeed2@redhat.com>
Date: Mon, 12 Oct 2026 17:34:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] lib/dim: fix 32-bit overflow of epms in
 dim_calc_stats()
To: Shashank Mohan Jain <jain.sm@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Tal Gilboa <talgi@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261005014411.78626-1-jain.sm@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261005014411.78626-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 03:44, Shashank Mohan Jain wrote:
> Commit 0843b2389064 ("lib/dim: fix 32-bit overflow in dim_calc_stats()
> rates") moved the packet, byte and completion rates in dim_calc_stats()
> to 64-bit arithmetic, but left the event rate as
> 
> 	DIV_ROUND_UP(DIM_NEVENTS * USEC_PER_MSEC, delta_us)
> 
> DIV_ROUND_UP() computes (64000 + delta_us - 1) / delta_us. On 32-bit
> architectures that sum is done in a 32-bit unsigned long and wraps for
> delta_us >= 4294903297, the last 64 ms of the u32 microsecond range
> that the function is meant to cover ("u32 holds up to 71 minutes").
> epms then becomes 0 instead of 1.
> 
> net_dim() and rdma_dim() only wait for DIM_NEVENTS events before they
> call dim_calc_stats(), with no time limit, so on an almost idle
> interface a window can last that long. With epms == 0, cpe_ratio is
> set to 0, net_dim_stats_compare() returns DIM_STATS_BETTER instead of
> DIM_STATS_SAME when bpms and ppms did not change significantly, and
> rdma_dim_stats_compare() compares a cpe_ratio of 0. The algorithm can
> then step to another moderation profile based on a wrong rate.
> 
> Compute epms with DIV_ROUND_UP_ULL() as well. The result does not
> change on 64-bit, or on 32-bit for windows shorter than 4294903297 us.
> 
> The issue was found by the Sashiko AI review of the original patch
> (see the Closes: link). The fix and the test were written with an LLM
> assistant. The dim KUnit suite computed the expected epms with the same
> DIV_ROUND_UP() expression as dim_calc_stats(), so it could not catch
> this; it now uses explicit expected values and gains two cases with
> delta_us of 4294903297 and U32_MAX. Without the fix both new cases fail
> on UML i386 and on qemu i386 (epms 0, expected 1) and pass on UML and
> qemu x86_64; with the fix all 10 dim cases pass on all four.
> 
> Fixes: 0843b2389064 ("lib/dim: fix 32-bit overflow in dim_calc_stats() rates")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927051743.71460-1-jain.sm@gmail.com
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
Sashiko pointed to yet another 32bit overflow, and I prefer
avoiding a stream of incremental fixes, especially this late
in the cycle.

Please address even the latter, and prepare a net-next series,
moving the kunit test to a separate patch.

Thanks,

Paolo

