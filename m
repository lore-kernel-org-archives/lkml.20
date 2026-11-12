Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491340;
	b=rwbKXFAuRzhemwZ3b0VWthtTeIuIkj36P6E/QrHHxe58snBYMZyGKsU+W5lXGj1Iv13/
	 Nhkxdg56WAvHpJyv9k+8k3U5EDrXZSMByQ8NJOALotzRGCMQxHvqd5l2kC8NwbbzsMTxb
	 lCTLewFWimdJHGN/N/nyy+KeBVINzBDSZwHgT3P4JRNBa70lLcgzZQ8TslyLoN6LaY/vP
	 o+CwmwaDN+mQsAYarUoA7+ldo2+wMgceoDJ80mqWLqk8L7DdoILYpRk9AR+grvIkMfRJ9
	 wAVdMSXpT7cpR5MgheMBT/jkOqbRlAE0Oyc298ck85Qbn97MX964YPg1ZOKjhgulBqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491340;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=kkl+icFjzxE01q0Je1m7UUl7PHHf9qq5oQVDLnVQrE4=;
	b=omoqYjKJZFl2GAkge3uUir6+dgpExb3nZTtpSIVWN9fENGpLUo5seId+nVlNe3BkZ7xN
	 llEHKi6wB1GAOpyH2FEIQWTCYJL4WFF9yhMBk+anl2VCfPMShmBGk0NViFGUaEoaCGLfT
	 EMhMTezYgJZD2jiSUGP4bpn6ptJo5m2XFxJbjfPZzrMM3r9DBvIblITp888T7yddYaZLu
	 jBCAcDGcynW3E62wmUb+PCpUoLookhpafMpWz+zQOUGBo6+2jTcdveA24QSPtbuYLFYEG
	 HDW8XMg0UocrxkpMHLDz9bbD6Qqi57DZZVYNV2Mdpt51I3o1NPVliQ15fkxcigyQaBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfR8WLKm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66702606A31C;
	Thu, 12 Nov 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfR8WLKm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE841F00A05;
	Thu, 12 Nov 2026 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491340;
	bh=kkl+icFjzxE01q0Je1m7UUl7PHHf9qq5oQVDLnVQrE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BfR8WLKmKOsDXaKLiM1Ug8DXfW2zJBjiN9fzDTa5EwV3z/sxUhZlb7IASSQ96U421
	 Mt4TsyTelm4lALktExl12zsgk/+O+uSElGKX4+AShhNRldi1RycsYF4np8RLDt3NZp
	 8zD45kOYeEt6mwyEf0cEPy7UpQBZWN7nmcvPQqBD+YWWwG/W2vcy03aA5x0fytDeNn
	 fygblzfkCt0nOWp/i5DNrXmtHLKMLXPo2+xEYTZjGBMNgySpYJ2Btfzk6TE9FopFdb
	 FX0hHNLxoFBG1EABRvXPDQGLR6rN+Ep1ph0B9qT/pSsNowZHegrNPUMrgsc77wzFlV
	 2GfEPlkisak9w==
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
Subject: Re: [PATCH v3 5/5] kho: docs: update description of bootmem regions
In-Reply-To: <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org> (Mike
	Rapoport's message of "Thu, 12 Nov 2026 12:38:57 +0200")
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
	<20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
Date: Thu, 12 Nov 2026 14:48:56 +0100
Message-ID: <2vxzcxsagnxz.fsf@kernel.org>
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

> The description of the boot memory regions does not mention the low
> memory region and claims there is always a region per node plus a global
> region, while the low memory and the global regions are not allocated
> when they would be empty.
>
> List all types of the boot memory regions and describe when they are not
> allocated.
>
> While on it, fix grammar and split the description of the regions size
> and of the CMA usage into separate paragraphs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
