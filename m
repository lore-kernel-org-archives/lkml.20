Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490245;
	b=bIY8k9jRnf35PwgaabzNi2EYGH9OYxfzhVIMbl0XNgaClAHEi0GlXNuL3YY1UXyyuy/W
	 SYNbC6ra6yJSZdIoT6DPe88dt4DEvNAiwCFVI0aTa44NgCmAxBCr7hAPImf/tMPHdqo6r
	 M4N4w9blnxjMOTa/ic6ah7RjmFaA3Krc7nP3xvZNFO/ATJNGDI5Bu+gqOA+galL6AINNk
	 Plz25anPv+JNNsvMt3j6hLZS4Pk15BV6yrxFyGQSbdWmgKAkJDlgLyirQVBnuTjQhc67f
	 LjD5VOOiOf1NO/r10N++XuSPHRuqjYlXlxvzYtusyL3cpxuFWj8rD5ovX3+yaCAZolw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490245;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=TIJ/B4xCXlnMR973pp/iagBmP0zyby+RS+bYxCX6O/A=;
	b=shOUHpC5oWaVD/tMwcYaX6QmZm+c6X/apD1SZ/ltd/Wt4eobhn47Ke99jTliiwqo3EYM
	 /08OLq4zReCUEg9LUOy23GjsZb2GxhEWCXc+z7l1BGA8yW8nL2tmQiU1IjiGsmhVdAnKh
	 X2PFGLZynqXQYZToSLPc+3AvKbLdGJSx8DhOQaE8Rh9Ezl6pVvUZ6+wkr9EVx3vMPkAhH
	 b1WJour/B07sWCOsyu6uTjrDkAuusv78+tsfI5VsUqPksECY7L7zWv3yprAmyBO5X5xHS
	 HcxR8len/7wUostqFfNnQShHQOXoUhFLOOB+9eMnrsxYoAs9072T/DdHMeLTeKlu8qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPVSqwts;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120DA606A898;
	Thu, 12 Nov 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPVSqwts
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA581F00A06;
	Thu, 12 Nov 2026 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490244;
	bh=TIJ/B4xCXlnMR973pp/iagBmP0zyby+RS+bYxCX6O/A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gPVSqwtsS4+iVC1025PcArimiK7ZsHRGSfLl/9vWj0OFRDu3FHfI2SLPjoziXSFGd
	 tCksDvCxQdG6NdNpsUcKUfbfZFW61q1znvRx0Qpmku3wmIYklPB4XX6DhKQYXGaKsu
	 Xbu8aacc3lRj6gAcSN/lrVVf01PuoNk5mZjnlcQJFKlFMAcHSyCTa73yoMurgPflNC
	 +UAz8LhHJ0LNk3h5Bm4EgtdH5kI6Vqv03I2ajqOCLPe4CMU3GGMoZS/guUm46MlYOd
	 hXbG+m9rvuttdDpzt4Bx5O6QJ2qbbqx/z/Rw2dFI2uULXT/u3EvIyRvFjV0WfHh5Rq
	 hE44LMljP4V9g==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Chen Pei <cp0613@linux.alibaba.com>,  George
 Guo <guodongtai@kylinos.cn>,  Kexin Liu <liukexin@kylinos.cn>,  Randy
 Dunlap <rdunlap@infradead.org>,  Shuah Khan <skhan@linuxfoundation.org>,
  Sourabh Jain <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH v3 1/5] kho: reject zero bootmem scale
In-Reply-To: <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org> (Mike
	Rapoport's message of "Thu, 12 Nov 2026 12:38:53 +0200")
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
	<20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
Date: Thu, 12 Nov 2026 14:30:40 +0100
Message-ID: <2vxzjymigosf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 12 2026, Mike Rapoport (Microsoft) wrote:

> kho_bootmem=0% sets bootmem_scale to 0, and then the bootmem areas are
> sized using the explicit sizes that default to 0. KHO remains enabled,
> but there is no usable bootmem to load the next kernel.
>
> Reject zero scale the same way zero explicit sizes are rejected.
>
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
