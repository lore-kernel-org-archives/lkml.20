Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8C4F85B8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100101; cv=none; b=oXPZvVvSSad2WWXTSoyDgHQZG8vEbM8gerK3Q/CpPiYf6/IXsfp4XB2YntR5kG/awwnnqxsx6UqSFiytenl6xXjkWysTgp1Iya4XK4sAsMIiRNji/yPr0DuDLfLj7uccXLnf8ulYpccttB2fsRPI6HyYs+Q5LTd7sFz1iREBEE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100101; c=relaxed/simple;
	bh=p1GOe0U0AvmHyfaWL4dZiAn0LDZMD/k/d2Jjq/xAvbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkpjgKOnx37qGqdtQUuBCQa719mToz8MDeClMC9siLp7SN3A87ZiqDSRnt7SBxjXPPrdc6lDdQ3Hzbi4vARl+KMyc3pDmBPligrlUxpv665inFlqt7+fQY9JWl6nEDxJ4/BprQNYTCv9fNrvFvfDregxjVnpY1MJ2ic3TU/A+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz269ree; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz269ree"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so1177217a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100099; x=1792704899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQimVVD9drWSngFOzWOAmVd128tPGcg8NvVnNLLNcbY=;
        b=Oz269ree3dZATYiimdp3jQcnAvwEyYVSMIy+rniSFMJDfm4J1MtCbzGWYkyA/TawLs
         +K8FIxcmF9ZhQZcg/7lDQGHRuCFaR4/yqgkwoXMQgMDjAIoQCup7Lj/2SvQ7RpIsAGeF
         jCU7hk+EJ8kCYj89Tc6gUEmb+TQjGhXskc+v23ACvxGFfyCqZ4y91bD34AYAg1Kg5cXR
         dZAemonm1K56VRePTjO9G+RTvHj+LYXHJThN4bejVrFXiqmhjqUqOxzRcFWsdogAf434
         pMsfOX2bzSiIhw9rumwGp+cefYPEGhiPG18AEsGvH8Hu7guVDQsVqpdu7G3CrsHNTJ0l
         ApiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100099; x=1792704899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQimVVD9drWSngFOzWOAmVd128tPGcg8NvVnNLLNcbY=;
        b=srcTGCfF51bSFc0NR4LP24372UdqXyUqHL/90KD0Dl6LOTpKvYk+s4YWDMXJyUyAAb
         S7TCfNUOu69TBgjqzBCXmZ9CqtkqnT1a0U/MfqtWpimtXkjLkLk8DstRuhoWWFvCTv+1
         d+FLpPdEyTnPVur3lPM0kOIdjfr1P2ZVJS5jSAES9SI4yhSEsbIa92t707THZ/Z75dyu
         d16wlGZVSBmFRlslmBus+TaMPnJTt5xlEcHmNTEIfByWYhTEaNZyrO+Hg8FoDqQFP8Xb
         pw9wWy56DFcUDIGTBrmIU9r6YeA8vASAwGa75NvtSvrVAazN8eEdq4pdQi6hneAF3FmU
         AdlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc7TeVGEujTZbN/qjMvcHgzsZljGH5tdd5eCr7/7ugc3QAEpAcQ3Qn2VEWCVtcAgWAgR4F+wcs+Mej+LI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy4knIxilmkmeqRjqkwCVk5A5uXyrAtr+E8vedLlrUbsy+MZwl
	1bHvQhwnvRuyBIrDyGMOU8bFEKiOXJ3XgdcAW01L/xLXby/hCiWYpoFLRESXoEovchY=
X-Gm-Gg: AYBFou2Hl+EG3JpQFsSYZtlS7QFDmvS6P1ljgXg33TtHygp0h9eh+fkVCuLDjp1k/wb
	AG/i1gzhWhIrxYvQ30V+2WYK+XR1opFtKw5TavPO2jOLUMppkDtVxRMGBGSFFuTS5bNNnNaLYZp
	1Q8nY1R+MubjFsebilAf6d1So1MPBicQJWIwfgl5cNOLrhS5knOcW3CGZdxU2Qf4a0as/JnyVHZ
	5WcJNBj57qIcWQ3c2HfEvh8cj2dEL+GZ3t/5WwIPmoeR8aR5ZMKLr6WGSAZNRS9809Dm0KnFonM
	jfK8B26XS58PSUQNttgoymhyYHACEF/kGv6jowwxgbYmCd3QMV+ya1ZBZX5GmmsTETSfcWQ59Ua
	OTuZyarj178ZFiGwFTekg/h5M3DIKxgUEbzvtZWAMH76MOTfje03fP2M7p2suZ58h92NN7JdTti
	pbsrz/xNfM5FHVYpof+wWI44bRxNogW4cIAtaCpL2izBUL7B3v9zq4trAe64oEo7S4oQ==
X-Received: by 2002:a17:90a:ec8c:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3ab3a9a8d8dmr19267667a91.25.1792100098937;
        Thu, 15 Oct 2026 14:34:58 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5a::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549f175bsm119893a12.21.2026.10.15.14.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:34:58 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:34:45 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Stanislav Fomichev <sdf@fomichev.me>, 
	Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v4 4/4] selftests: net: add devmem RX and TX netdev
 unregister tests
Message-ID: <atFG77ZcuGHOsKgW@devvm7509.cco0.facebook.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-5-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015163915.1166043-5-almasrymina@google.com>

On 10/15, Mina Almasry wrote:
> Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
> to nl_netdev.py to verify that unregistering a netdevsim device while a
> netlink socket holds an active RX or TX devmem binding synchronously
> detaches the dma_buf attachment and cleanly closes the netlink socket
> without use-after-free or page faults.
> 
> Add the dma-buf, udmabuf and devmem options the tests need to
> tools/testing/selftests/net/config.
> 
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Kaifeng Wang <kaifengw@google.com>
> Assisted-by: LLM
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
