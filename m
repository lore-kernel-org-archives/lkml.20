Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991209;
	b=b4dGViUSCGPXPFnVW9pDqKbdz6BUNaUdXU/JnOtx3M61jcSOql9Dom8iMCImWkmPKmGP
	 YiHyoNoxn/l4NlrXmjF4AnEqnwZQYJBxCgqjL6ygfwHVsvz0biMZ/DyqDfQeVDYReNsvL
	 EPpWXyM6kEy3evqx7Pc7uXHUsgWJSejPt0yCbW/2rEuyEo4VDmxmJeIhImvYOE8S1rGsQ
	 IRS6mOMhfyUZUhKDI2UMsnEWqSpBDP4S41R8dqELcPoA7Tfgg57xr6yWIy7cRTCgiK9Li
	 5QbpuXNMIJykcZKhh8sXz9UAwh3h4bDCGDdcPvBC2QgXWX/20D4A5ygcaGiJXY617gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3owYrI/0Z3GKKaUgbIZQvjxUR9mSehq81egiU0Y2vio=;
	b=n5ddCv3AuMEYxEj/d+vvZuJOfxo7ARf72KxCgjJMQ7JiuQ+SlnzSY1F8oD/13YS12Lpw
	 XbDhqEfZVqANY1/+LZC7il9xgGLJm5wtVNYIrFB+cyjkvMkUR7PPwnyHfhDkh4gbWfJd/
	 jGFohGWKVGB9+HAV7SIWdJsnpw7Va8wC/9As5Fihhf6yT53Nbwx9spIBpnFonqc628wsI
	 tTzALL4Ze8Msa8B9PxqHppn20yeUslA9K3f6RSdyHWhOaVjRI7V19adqCRP6HBy1x1gxj
	 hmdi72UZg2jfrGuMEKaFTCjZHS1eIm7jHuQ8err8AwvYzKpCNTCRP01QYapXNPhZdhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d01Z4f2p;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A16E606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A16E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d01Z4f2p
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so878785f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793991208; x=1794596008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3owYrI/0Z3GKKaUgbIZQvjxUR9mSehq81egiU0Y2vio=;
        b=d01Z4f2pq0iusavWpwwTgFdG1HvTAv2RgajciVFYHL5fCQJlWleXM98067RNynFhWh
         /mYjaXPXXLyi4sF5GoPha7+wn7ufSOMc2yM3o39CcFMgfT1BEeZ/I0RVVGkvGmf8BKOy
         je0cHHxbgsqC2i+iBaxRSsKEr46943oUxw1m7YUv1nEjc/Uvn9epcjPqLioWXkXHzk9s
         KLHvftCa59bNKqHQUiGFUHOb1Nbt1Z/J5+/a0oocaoTgaYFHADnZetUyB3PR90+DcFPE
         RNIDPBB2H/i4LjQFAMT4vhFT0cqtSHtaGX423d3ZT8w9T9UEIOqcrpJsJ0ct5H6AIxph
         jqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991208; x=1794596008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3owYrI/0Z3GKKaUgbIZQvjxUR9mSehq81egiU0Y2vio=;
        b=pj0uATVW/5O3KfSx0l7qeS/VJpqOiCwvWR0fdngy9Q9XybjSzUPKzyJHkgHEVOUSIV
         l5oy0mWsbzb8NMjeYXG1yHuLnPlqx0vR8AnHB2B5Ey0cElIiMJduZyjTCOXEYgNIiNjh
         gbpmGhbgw+CdMtPlGq6kdRRa6mF8OYwJdJOfCehpcQHsNMSYWJqxTnU+VKbjz+SgMeWU
         sJWpg9RpdU4h2iPIK3wI4cZ+1hFCLMFvdCF+ioco6d8dUrPWf1X1inXjjuFW8TEFCo9H
         yTQuOeOpO28bs9VJlVe6Ox5KkQS8sq37C64ntIQ5bnJzrApSdD6O1OczfXE8YM6r7hEU
         tQiA==
X-Forwarded-Encrypted: i=1; AKwUvBy+mgR1ZeijVeP58y5TvUgILCvXP61edDPF8ZRGBTHNdBd+bATXalu0MT1M6Y2ELGOBbOJxRQhOKx7ifY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5yk4JJsaQcmc+p/Kd6xJpXiHWcfug8S7gueMtotcMrKdu8WfH
	5WwgqSOGObHJTsPrahasXAE8UcMqP8LdkCTjqW9XvQcUTJKmeIMSYS30KRnQnaZnrw==
X-Gm-Gg: AYBFou3TPCqUG7SiYH7Kj6YMcPUY2ohBoomnbeErBX+/7CnSN9iWvK+dy3MH/H5aGTR
	vyfMqdreolDRzXshfszg1LZDHfmtIsXei8k5v/dUzxVftQ+/OroTlrR+Hh5FwgAGyTyf6U1Bnp6
	QBQBKIAmO+Y6mDh1LJRmPo2/e2XuyCcOEtZKSboiDS/nRNXBNoPwTkaEyd/m2+b4HRly/bpJzh/
	qBO6mZFA4C34/soyOsot9MTlL8G78E1NNAGv8OoVW4Ogo4ISkVr/dVns6fNwQ2G8CQxp8Tm6gxn
	xZS/OyGxwKGu2sCHsEYkqlq+FnEK2+bxEmsx7vNfCvmO6DfTQIUfuSjatVrAzqRpFJdYj2SBv0n
	YK/ykaLUVg+H50KkJc2szTWlglSsf1XlRkwZiQDZGnWOm8Gz8kxbO1TD9YGZ3SQ0Giy3YWU+mFK
	jDG80mpDtRpB8lYcsoPgQJ5p29NdrRI4u7vSPKueXpZxU3fvYS+Ei6b7ARkRQd9sCHdosR//2Zr
	Hv3BEzm3mHWSH2IBlGbY13kI9xdO1XHBfZ/xL85erE0fLNtGVYuR6qOZ/RcQepsHWMQsrhL0Pda
	6mjE0/wM9R2DLBcyaVw4ZVOHR0eHKo5rjy8a2hx7Bqo1NGi2TMj+EUN3xJvtgI826Ue72dPSNMT
	AChjdTcQOPA==
X-Received: by 2002:a05:600c:1914:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4b6de788f5bmr58350415e9.11.1793991207222;
        Fri, 06 Nov 2026 10:53:27 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62ecc1sm626645e9.2.2026.11.06.10.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:53:26 -0800 (PST)
Date: Fri, 6 Nov 2026 18:53:21 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Xuheng Li <xuheng@cs.columbia.edu>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
Message-ID: <au4iIai1DiXaPQiD@google.com>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
 <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
 <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
 <CAPOPQMCQfYWRDRvo4PPFW0RAyqNmns6TqS+QYE3-5SM_NFRMQQ@mail.gmail.com>
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
In-Reply-To: <CAPOPQMCQfYWRDRvo4PPFW0RAyqNmns6TqS+QYE3-5SM_NFRMQQ@mail.gmail.com>

On Fri, Nov 06, 2026 at 05:17:54PM +0000, Xuheng Li wrote:
> Hi Fuad, Vincent,
> 
> On Fri, Nov 06, 2026 at 02:34:55PM +0000, Fuad Tabba wrote:
> > Actually, like Vincent pointed out, why the WARN_ON(). The caller can
> > just handle the error.
> 
> Makes sense, I'll drop the WARN_ON() and just return -EEXIST.
> 
> One thing I noticed: the kernel-doc of kvm_pgtable_hyp_map() says that
> a mapping over an existing one is "rejected with an error and a
> WARN()", and the leaf case in hyp_map_walker_try_leaf() still warns.
> Without the WARN_ON(), the comment would no longer match this case.
> By the same reasoning, should the leaf case's WARN_ON() go too, in a
> separate patch, with the comment reduced to "rejected with an error"?
> 
> Thanks,
> Xuheng

You're going to make me regret my suggestion about removing the WARN_ON() :-) 

Indeed we should probably align the behaviour.

We can indeed drop the WARN_ON() from hyp_map_walker_try_leaf(). The if
(kvm_pte_valid()) you've added should catch this case anyway. 

We can keep the WARN_ON(ctx->level == KVM_PGTABLE_LAST_LEVEL). If hit, that is
an internal error...

I don't know if that warrant a different patch to be honnest... none of that is
fixing any existing bug. But no strong opinion.

-- 
Vincent
