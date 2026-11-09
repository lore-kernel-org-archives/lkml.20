Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256609;
	b=qjdcIlMAwEYjeWUWFntJcNYufovtMAIZq8sQXwdYCmiLbpE8xh8fwfwPCZwn5HJFT1Qe
	 YVw6/X58rnNtM28jUDer01qSsL0LcDKldhNWKJVXsNpcPeAxknbXznnaLSppaThW79c69
	 pZCYp3TFDzeBKiwX+eXEm6tKf4uSe1eReVZJCWptIWsRbpxCyWBDb+LgvVzG61Ay2U+De
	 HsQcC/lB1lpOlPrUZIsIvlzCIWrY23XPbKDqLKFjL/8K77QERFVX9AkoHOyvbYoGiv2AT
	 aW7zGsM+YnqDRqIE26WU+Kxr6GaHt1beg5N0+ZhXCJcPHJI+ybqHqiB3mz3z4/X8WxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256609;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9oF9audfKANIUeCSjRE2UxoYSJ8eZS3TN4Enjb9NBvA=;
	b=UuSg9/ourQ8roYT9l7UEWs91TH0GzJZAz4E6qCxs78xav5BPJ2zRggTGC9MStXx91GHI
	 xzxVQspZioxJSG3ja07NE4IZrySWidC4Z/TWwYQZZBYMq5T4oGSX/08eVoojcVD5A4z5W
	 keuI/KYCGB1gGs+/1VvRsXDkpiy62oVpffZwCjm2D205GGUHnZKbt7ZaNmyJWOTdHNFl9
	 7JqTyToFWFbXpfa7WhNQv/dxSfmYyPzLWt8wv9xRieRrgKBOkdvakGxzloVy7D0ISu2ik
	 3iwxMaBN/HM81ua+YJXbgs1meT8K8lPFKsiq9WUsHQv62S8wumOZNdCUhm6Q4omReNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EefOnyi2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF515606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EefOnyi2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459541F0089F;
	Mon,  9 Nov 2026 20:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794256608;
	bh=9oF9audfKANIUeCSjRE2UxoYSJ8eZS3TN4Enjb9NBvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EefOnyi2juZx4CLNe0tV/hc9vymdy866x18Xt0oh0y/RHhUiC1T/CW9gCl5MSPyyt
	 bf9WQ0uqfn2sToC15cCy7r5Bpgb7yZAhbXviQsZDSb8Snt77HjRuBbGMQ51iw4pC56
	 oBPeCrcM2GaD75nLGNISe9o9KeKQ/Ysd4A3crHHnGBXct/ilMTser/ljPM67RbVuO5
	 GwWwD1mG0kaH2gncGE4ZZo80n8bW3zDa95/z85GZkgJqJExJlZssZjcxtQLmefRWTA
	 2HtvvweWAAE5dQ9cqHshfsygxx8LjajMIFFzEQYTVLhmOuDgPmQqvQKtSQdJIQahuy
	 mBAA7yyrGQMYg==
Message-ID: <3a137aa0-d0b5-4267-b64c-d58ab4235603@kernel.org>
Date: Mon, 9 Nov 2026 21:36:40 +0100
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
Subject: Re: [PATCH v3] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
To: Zhiteng Qiu <qiuzhiteng@hygon.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Alistair Popple <apopple@nvidia.com>,
 Xin Hao <xhao@linux.alibaba.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Yuan Zhong <zhongyuan@hygon.cn>, Shifei Ge <geshifei@hygon.cn>,
 Jianyong Wu <wujianyong@hygon.cn>, Shijie Huang <huangsj@hygon.cn>,
 Yibin Liu <liuyibin@hygon.cn>, Fengyu Wang <wangfengyu@hygon.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
 <20261107143456.1590658-1-qiuzhiteng@hygon.cn>
 <20261109122915.2150586-1-qiuzhiteng@hygon.cn>
 <ef12d685-d111-4a6f-b72a-77bbd1369548@kernel.org>
 <20261110001816.2186986-1-qiuzhiteng@hygon.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261110001816.2186986-1-qiuzhiteng@hygon.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 17:18, Zhiteng Qiu wrote:
> On 11/9/26 14:07, David Hildenbrand (Arm) wrote:
>> For the future, please don't send new revisions in reply to old revisions.
> 
> Sorry about that. I'll send the next revision as a new thread.
> 
>> Is there no way to avoid that boolean?
> 
> [...]
> 
>> This is all information the caller could provide, and the caller could just
>> provide the TTU flag then instead of passing a new "bool".
>>
>> Also, likely this check can be put into a separate helper function.
> 
> Agreed. I'll move the decision into a helper called from
> migrate_pages_batch() and pass the resulting flags to
> migrate_folio_unmap().
> 
>> I am not quite happy about the folio_mapcount() check, though: as soon as we
>> optimize try_to_unmap() to batch better for large folios, it would be just plain
>> wrong.
> 
> That makes sense. A large folio's mapcount alone would not tell us
> how many separate flushes are needed once its PTEs can be handled
> in a batch.
> 
> Would it make sense to restrict the optimization to a single,
> singly mapped small folio and keep batching for all large folios,
> as in the scope of v2? The changelog performance numbers were
> measured with the v2 check. Or do you have a different direction
> in mind?

Likely best to focus on small folios first.

-- 
Cheers,

David
