Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CF63DDDB1;
	Fri,  2 Oct 2026 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967960; cv=none; b=Naa2UmMhhzOfRO3yVdKBYoxo18Fw9q9eiq2xfIgVva3pfjSLalkiuE3cJi0+3FrMrZzB9nZsg01P7ApMHay5lKA44aXlzurhn2+RhYKnnXc6GqdkUHp73/0RGHncVAINpnQdTlLZiI+SsMhH/+d3V0Af0BHR0AP3iZ0U8qo/kE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967960; c=relaxed/simple;
	bh=jmMcfiwr3YA4ETCySwWhEb3mIvhe2Apuc8vbQakfQmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgZYPJ3il/A1abAIQ98jOKQAqaVMP6IcZ6c+mha2zA0aYRU0v6fR+slbvzk5qBdiJ7eSi679lUEMXfzL+X2QY8Ic1ZdvGFW+VnrbysErSEnBudECir6MR6KRQ+Li1ZEiok3hq8TyhxPV4uLY3T5SxbRBibm8KTAgJ62jRH0onP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9/o1nJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9/o1nJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE731F000FF;
	Fri,  2 Oct 2026 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790967958;
	bh=9rjSxFrypHsH5/EurS8FfeiStgadl0YePCxY/8OvZYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H9/o1nJTY5XXYyas0W2UK0+7rcUVlLiAQjRM20SgNFB0E0+0htwt647TWpgbXrAcp
	 39NS8/YSHzA7zmTQnT6teVoF9DtEcmk4qlL1e67+PEJvyTpipTz0raxfIuMP4KcNNU
	 49XNHDfEwWQi9LXXKjkNm+J/RFNwo4fd6keTVGip65foK6JwDo9eowO4UorVdzpnJs
	 iww8DchUFgNTvbEKqMQ65tCDQObarWGMG64/PSsfmOMCVyKgebdcv3hkygG3HGy7ln
	 ALB6pWQyFdhUjru2JUZ5kRqxIzd7gr7hiFBvr05Ee+4kNIT/koJ58aXW8zWRjhDloF
	 OxbPZTjFFH9KQ==
Message-ID: <c64c2270-7eac-4db9-a5d6-6e339be68491@kernel.org>
Date: Fri, 2 Oct 2026 14:05:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the socfpga tree
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <ar_0ICrJtyU20WDO@sirena.co.uk>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <ar_0ICrJtyU20WDO@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/2/26 13:12, Mark Brown wrote:
> Commit
> 
>    57bf614eb1f31 ("arm64: dts: agilex5: add support for debug daughter card")
> 
> is missing a Signed-off-by from its committer

Thanks for catching that, it's fixed now.

Dinh
