Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795738;
	b=lLQwiN/Fad7H2UYYuoayqfLuUNd9/yjOvLJkkvDZTIdigyM3LLl57SOoldTOojMBBK1T
	 6ckjnsEy3yFNFEqrMR9Ppag7r/kCe1W2E7wD6s/hbnHB/Y3MQMJQU9K1ZVTFqTb/t6Wbr
	 98lK0X9rSSpYP3/nethu0h7h7MmFwHYdm0FsJsqzkmgxZjHE/+nKbSULEOXAjOOzDv3YW
	 cYw7KwtzOk6edtXwNtgpb+jFOAW+NQ+ERWc9KrmZPPN6lPyxcYpX6zB1poDfxPaMs7FjP
	 Avok8wVu39oLYRu+7fX886vxn/kOBpV/u/YeqZvyagkPcK0JVAQR7Jd0MvT208TtMkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795738;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=PFO6n7YvwMi4NU0WsSwg3JV5MxCZrjERTzdE+It3Nco=;
	b=tnX4xQPXaGalQ1k8BD/7eh4ApCuMIpCuQHjMhRzuDf9SvWkP/ls6tgEDUlosHONudrwM
	 PsPSA+hzr2Bafnx2UkCQc26SBQLgwBJeXsq1kon6oePPZkFF/Aj24RPNYfzqnOiay1xfM
	 vZPK0q7J1MF6GsLi95zSoOrNxo+F0X0SY9FqikBPrTAwsn1UZzFxf5NVk28h4qDhx5BN4
	 k/eokOUfxvgl5ubHj23leQFqNSuTpVVJ3alG2LPSlf87NfBrSHO0U/tpjpk4DDTF69dg/
	 PTR1gSy0pFhxv98bOafW6noYVRWE11L/kEAOn/XDvaeccWG3n+P2tvRL/XAtESA8N6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTuJgPLh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E10606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTuJgPLh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204001F00919;
	Wed,  4 Nov 2026 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795738;
	bh=PFO6n7YvwMi4NU0WsSwg3JV5MxCZrjERTzdE+It3Nco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=iTuJgPLh5PToKdG49zOOVGH+CQ5Jys5z+yon0oacjCMpG3mh7Huv/U7eeplq8Y/4T
	 GDeSwjJNvN2jmjilE8nwtasTYSExBga0xXx/eUBVa64gQ9G+BQyFV+JQtMkZ45fKWn
	 vetmLgnio3ES0nDRWx1FQGPvJ2KDpxE62qLURkN+atkAyL+E1OCENc7QWMVsobG3Hg
	 IFvB1WyFF8tMfYZKgkfKSFe4/fR5XDUYh/NuVMDndBIdcyOv4fPkC450V+FDNyPGV1
	 wJvr4tyZ2wG2NiH8747tItOCsS1x6aqhw5LvR9qgZPbDqZS0w4w9pylKndJjVeyBl5
	 Jxl/jzq3Cgkuw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pratyush@kernel.org,  graf@amazon.com,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  pasha.tatashin@soleen.com,  rppt@kernel.org
Subject: Re: [PATCH] kho: Skip zero-sized bootmem areas
In-Reply-To: <20261027074028.13042-1-cp0613@linux.alibaba.com> (Chen Pei's
	message of "Tue, 27 Oct 2026 15:40:25 +0800")
References: <20261026131851.9942-1-cp0613@linux.alibaba.com>
	<2vxzld7kpmmi.fsf@kernel.org>
	<20261027074028.13042-1-cp0613@linux.alibaba.com>
Date: Wed, 04 Nov 2026 13:35:35 +0100
Message-ID: <2vxz8q38lqp4.fsf@kernel.org>
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

Hi Chen,

On Tue, Oct 27 2026, Chen Pei wrote:

>> Do you see zero sized lowmem or global scratch in practice? If yes,
>> how? What's your setup?
>
> Yes. Enabling KHO for riscv64 gave me three cases. They differ in which
> size ends up 0 and in what it costs, and all three are measured:
[...]
>
>> Note that I already fixed this for per-node areas since those do end
>> up with no allocations with movable_node set [0].
>
> That one covers the per-node loop only; lowmem and global are still
> unconditional in linux-next today, which is what cases 1, 2 and 3 above
> are about. Is there anything I have not considered here? Please point
> it out and I will follow up accordingly.

Mike sent out [0] recently which should fix this problem. Please take a
look at that, and see if it works for you.

[0] https://lore.kernel.org/kexec/20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org/

-- 
Regards,
Pratyush Yadav
