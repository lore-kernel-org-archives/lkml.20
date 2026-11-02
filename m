Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613726;
	b=Zy8/OPXdkdLzd3sZoXX0RXJj6mCBwNbhdgdJvpTq+WfFPXgdXnT7Z/tPIN4zdVpoHBg2
	 2+tsmw0FNpl1XqTg0/nnZsRUbBYg2Y4GdbQi0Z4HoRMMLSskTwwQ6WYolet4ZvPQez18v
	 ArCpY25jt4W6g78yNwIqlTI5TNYxYL4pQWtvFXtE0YU+9oIwgvy0d08TbxV5LpNaCZjzw
	 vBNBApjIHH8t2+/iC4NjYUqC87aqy2E3gAFnW8dvoiGIpRBJ+rdzVDhnWlqDEvVfebfrE
	 /12XbEpTHnRifR1DSaleAy+Uz1XSAfht/HFvH2S6kn6IYCfJEMnLP+Bs+ePtICoi9+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613726;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vbPfZPJoYQ0C6lfKs2aymef5rN56sPJo97x0rrbpNk8=;
	b=I3dGVSlMTcYA2ZZEilElA4GiVf5C08B174TqactAb/o/6aDesrDV/o8epBnl2xH0RUpC
	 RPTjVdKyU+mfMHi5t6ry+8XfRJCr2Z2rYzGdVlMfP2icNfl4kqkRhtCrA0UEgmbQTOh3/
	 EFytP3UmN7IGjTS11uTT4a4KGoP7GxZn+BEBKS/Jq7uAHB4NgAKAtO6XzZjoqhvI/BSr6
	 TLxY8pLeex+8el1r4GU2wpGlhdJvS/kTf98B4k17yKxhOcP7CiqfudV3fEzlp4D2j0oMf
	 d4+9gCmh1I2iqK6BS37p+tGDSRc3vBAQdrh65pBvHdHLl972TF0dRd9TRjrCBH2VWxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D5oX3oCH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E84606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D5oX3oCH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 715BE1595;
	Mon,  2 Nov 2026 02:02:01 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A6DF3F59E;
	Mon,  2 Nov 2026 02:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613724; bh=h4Xk0lr5kbJWzEIn6ychy0sjf+fV8fkwo6IeleqRgRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D5oX3oCHYZNYcvuBTbRPgfj9gLUa+29ws6N1QKtVCAc7adecVHnhTCZj3NKZ5znHR
	 uVbF0lzrh4YlNaIFNY1oo2uCyie2TMjAlUfJq2hYHwuB99qTvSvL91Fhhng/pid0LB
	 yJfa2P7cJ0h2fA8n2D47PRHRde39GxYuqrhzqaaU=
Message-ID: <c54e9853-b503-4aac-87cd-71c68ef4f7b3@arm.com>
Date: Mon, 2 Nov 2026 10:02:02 +0000
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
Subject: Re: [PATCH] arm_mpam: Warn when firmware leaves PARTIDs disabled
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <8950f9bc-8ca9-476c-a7d6-2b434908b80c@arm.com>
 <20261101025550.1633447-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261101025550.1633447-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 01/11/2026 02:55, Ping Li wrote:
> Hi Ben,
> 
> Thanks for sharing the direction. I asked our hardware team why they
> implemented HAS_ENDIS: the motivation is power. Enabling PARTIDs that
> are never used does not affect performance, but costs leakage in the
> registers and combinational logic behind them - with e.g. 32 PARTIDs
> implemented and only a handful ever used, the unused portion is pure
> waste. Their expectation was that software would enable only the
> PARTIDs it needs at initialization time.

Thanks for this information. It may also be useful for getting data associated out of the cache
quickly once the associated PARTID is unused.

> 
> For a general-purpose driver that cannot predict how many PARTIDs
> userspace will actually use, that is not something we can do. So what
> I plan to do is either enable all the PARTIDs from the driver, or ask

Enabling all the PARTIDs in the driver is a good first step to support hardware with ENDIS. However,
going forward I think we could actually make use of the feature by enabling PARTIDs when a control
group is created in resctrl and disabling them when a control group is deleted.

Thanks,

Ben

> the hardware team to drop the HAS_ENDIS feature.
> 
> I am happy to drop this warning patch in favour of your driver-side
> enabling patch.
> 
> Thanks,
> Ping

