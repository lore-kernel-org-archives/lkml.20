Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486934;
	b=OaySijRYo6/+qm95wSbUh4K18nNpCFYw8DiPHUOeKyURtAyL2ZcC2C76C+kRB7/jsbQg
	 2HZk1yehT11kXM2Oy6+MTWk/NbNTPegk3H/2x3z1aZEzFeLP03JHzhhg65h/eziQA4T3X
	 imxZ+J9bSwok7Vjiad8Ul86QEPxp2ilEmjA00tt4FnD0DRHRLtNF401LnkvTB11OueZSp
	 nGogPZZFz4pD4wJrjwIIOtLLs9XvQ4fPhiviEyRMOarkjTb+WDHocX3TQ+YrZHEzbVSPN
	 99O0X/8jU47L3qu7LVnZ3/5g3pWaiXCdeQ2PGSK5VbKSl2PtJC27P0qSNXIbRy8W+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9m8EJZJphILGcBqQZQvehuU/fPhn1XULUzvAHjdvFco=;
	b=C6e27G084nrj6x01rxSOWiegwmZpoBeUDBlOU9+3l/iEPCgfWNhxTy1ZXYt8Vz20Az1w
	 GETcTDINgjt30iEbaOY5W6OJbjuj1/LfURM94N0UxNYjL60//5xRQeHw1x3u+rtCtDQrR
	 ESzCwxWgvEgq+o1aKn9s3qh3HV9AUAL/HIqqncn1JNLgYpD/LvxGMheQS3fq1XofMYDiT
	 pqR+HIToI60hFbmgaFsu43YRfnaX5OWd/I0jsTVXqJIZ2G/bv4woqZDcJdKTlB7AX96zV
	 PsbLgUS8OBld4l11cxqfHmtOs4Gkv9MOSJ2AD2E7iDGn689qMZlghIEzmiDQJ07T6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=h24IFOUV;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF5606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDF5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=h24IFOUV
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso2714095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792486932; x=1793091732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9m8EJZJphILGcBqQZQvehuU/fPhn1XULUzvAHjdvFco=;
        b=h24IFOUVa1efqAQgdXJ/8ARRoI+/w1G94mEeKBJR0/koIiKtJ60MG1t0s4SsUjQcJf
         LxuUy1FroSoNFyvt6I63rpm/7jjCnYaIDOulcCLJBo9axu0zC/e3ekZKnDutdoks9cP2
         m6JFChHR6KSoyiM0tAmvOdSc9cJ6rLFOARclhYclTnd8gZ9BGLXQe8CkC74oCMmraP5u
         pnUyLrP9cRYJvT9h4r4NhHgRg9Bz2pSoVBshfXmScEqJjpcc3sTJVJCNvzahsYDlIOIg
         k/4cPswuiJZgzQHPKr03cReZgenoyQg0tMwVz83JHfqf4q7S/EnwaFyEnNTZ2QP/ip6F
         3MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486932; x=1793091732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m8EJZJphILGcBqQZQvehuU/fPhn1XULUzvAHjdvFco=;
        b=v5negQJOscXnqSgsRFlGwD90bW4kM1IoXfTjL2okDLeK3nCaS5vzdQuxacpwrrz2Mw
         /QsdpvIn1/58QfJNzBb2bUMwyxUxy9MwoS8KMRXjfbjH6hMiMHdb2V+2IycaCokHcFDc
         uQ2Jtgf6k4Wb7D8/hw7qH8CZ86PAfce1fZP5eSnBsa9eBJ1VRTdnpNnagzt1CK7EN67H
         4+N0ltCKRuaQi+ll/ozmN0Ov4Ai//q0Sn4+lyIKh4Z5cNJUO0QC9yiW1BNU2sesWGmra
         lUzXXcBeB+LCxxrexVweEBk4kuRTZmUAzL+KJYqfwwC89F/R6eHl+oLWMMR1/B9/9Pcc
         zfAg==
X-Forwarded-Encrypted: i=1; AKwUvBzvLaxqR8AK0l+gHe0fdHYme1lDZ+YmtbDBqulIsG3VkMiBb7I2FRIx9s4RxaYqfyoCf4atgZ4iSA+OwlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0E9dLtli37I/fs/Qe6x2VTLM5yQ7tX17rfCq87HAoYc5yHVm2
	7y1AVovIKb5qF6p3USSt4ZmA2sPy3FFggY28NEdNdBRqcdCZXhz5KAyP7AIVrOmn/Q==
X-Gm-Gg: AYBFou2F6t76KovR3JFEa7fFAdVbIMnMgUPd8J6ZzyGMAOwq5H/TbFnWn/w2Msn43yp
	ztuhiZG45+vw8tyVugzIIkUJicKely2BizDELGnMs53Z4sA2sAZr9ZhLYyRmouaPvapcZoYxnsH
	aNiQAl0qVScvSmyjAGmpRTYBVq3smzC6t1XHMzU1onSFb1Bv/5JuF5Oy7aAEt5if9fvSwIDAbXJ
	cMA36UZryzdpd6FR55au7DzwOG/CRoz2NzvAnegxsoHLL8LzLq/c4KwlIUaa46doNoW/KR6AWXw
	n25VFFUV8DMafRwMxFbymK+OH+jul4qwhMeMniHj6Zw0Yde4AUUMgUvu19uvH7smjHp3zK9oQ5x
	wGWgk6Vu3IQmhBlajmVAFuOcOzxSqHYPUh4aS4l7kipnJ5/RMUtF6DheeTmywveEmWwDPH/WEkc
	DesT9P0suTkMGWirJQlAnEKY48j/6efPvuqwich65vVfPF5VMxm/QfW1gUObkjAl9Rp2BK0fcKs
	C5v8mQPjmOaJou4QA9hYPbK8BfPdrqEBLpS3ligjRA=
X-Received: by 2002:a05:600c:4743:b0:4a1:d899:b62f with SMTP id 5b1f17b1804b1-4a1f45f8877mr30834125e9.0.1792486931667;
        Tue, 20 Oct 2026 02:02:11 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca30aa5sm33064205e9.2.2026.10.20.02.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:02:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:02:00 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Snehal Koukuntla <snehalreddy@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] KVM: arm64: Support FFA_MEM_RECLAIM2 in host
 handler
Message-ID: <atcuCDHAAKZJEbHC@google.com>
References: <20261016082341.4030770-1-snehalreddy@google.com>
 <20261016082341.4030770-3-snehalreddy@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016082341.4030770-3-snehalreddy@google.com>

On Fri, Oct 16, 2026 at 08:23:41AM +0000, Snehal Koukuntla wrote:
> FF-A v1.3 ALP5 (DEN0140 rev J) adds the FFA_MEM_RECLAIM2 interface,
> allowing an Owner to reclaim a subset of pages from a shared or lent
> memory region by populating constituent memory region descriptors in
> its TX buffer along with a starting descriptor byte offset and initial
> page index. Upon completion, the Relayer returns the number of 4K pages
> reclaimed in x3.
> 
> Support FFA_MEM_RECLAIM2 in the host FF-A proxy handler. Validate the
> register arguments, copy the constituent descriptors from the host TX
> buffer into the hypervisor's TX buffer, and check the descriptor bounds,
> the total page count and the initial page index on that copy before
> forwarding the call to the SPMD. On success, unshare the reclaimed page
> ranges from the host stage-2 page tables.
> 
> Link: https://support.arm.com/documentation/den0140/j
> Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
> Changes in v2:
> - Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2
> - Check that the sum of pg_cnt across all constituent descriptors
>   matches total_pages, guarding against overflow (Vincent)
> - Simplify the flags and offset alignment checks (Vincent)
> 
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 126 ++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>

[...]
