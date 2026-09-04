Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A53955FE;
	Fri,  4 Sep 2026 21:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557247; cv=none; b=GfgwkldocXJF7Vl1j1s4PJzLsJ2ymlSRqngKKsqrHTRdjnFLIPYYKVx4dGBIe0UBjumyyeFQRcNRYcOtEWm88n3of4iXZbVO7lpUvqr1DviDRZ7BQomwLowaZPRp/iiBugyeZ7RMEb9ZUG7yNliZD+BwJm7YKvxiQenZlSlg0X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557247; c=relaxed/simple;
	bh=geeQkzWpKSC97O6RguvLAD6LnU8llHLZWM5zboMmt0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKAwiqJL/dUzF1EdKUn5B970g5Bjv9S/6FXzzxhMYsgihHUqgxqQukOouFRKTjgvaip2dAa3K/r2ju1fDliUYRQWOD3WKxppzkYF5U++6Ig4q1Qbw4yOyjfkOGkoxqyVUUoNSGwf52N2NUUOy5KO54bXyfGn5nu1FY2HqSSt4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D2rw2q7a; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D2rw2q7a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=s+ljn9u2rzP37uWKxSz6ngS9FNJj+RBHkVBRPhJzI7s=; b=D2rw2q7acvCI8xbOZ9tM6uzhU7
	5V+IejQasmiaJ89K4PydyWJeHGk0iTgpTpu7JwvYX1FSFnKzIksCEzzEd7MCMLe4nLGcru55VUW0s
	jc4wUrN2SqTWXa70/BD+HvhegqMu5K1EJpmliEZ/VTAzIgkFPYP6wOspyLbo1D27NbslOvo+Y3ZDD
	UKYeJUpNYxADMC6U3rRvyEAC71j5EnsKShkQmZ6KGoVUpwdoxm8A1ETYVDeO1sX94i5SAvv8sZ1hZ
	Xp4u+dvggSb72ONnwjtqjVOnRa+o9zhKEzHbnyMogwdCFdTdmOeBmsINC5sOChWM/YEUAxunrJemC
	8RQZJQhg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bRU-00000003KNg-0n8d;
	Fri, 04 Sep 2026 21:27:24 +0000
Message-ID: <be33d71e-e354-4b24-870f-32eff8f72021@infradead.org>
Date: Fri, 4 Sep 2026 14:27:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/core-api: fix typo "maintainance" in
 comment
To: Hemanth Selam <hemanth.selam@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260904113257.13594-1-hemanth.selam@gmail.com>
 <20260904113257.13594-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260904113257.13594-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 4:32 AM, Hemanth Selam wrote:
> Correct "maintainance" to "maintenance", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/housekeeping.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
> index ccb0a88b9cb3..71ba5d86f249 100644
> --- a/Documentation/core-api/housekeeping.rst
> +++ b/Documentation/core-api/housekeeping.rst
> @@ -9,7 +9,7 @@ extreme workloads can't stand, such as in some DPDK usecases.
>  
>  The kernel work moved away by CPU isolation is commonly described as
>  "housekeeping" because it includes ground work that performs cleanups,
> -statistics maintainance and actions relying on them, memory release,
> +statistics maintenance and actions relying on them, memory release,
>  various deferrals etc...
>  
>  Sometimes housekeeping is just some unbound work (unbound workqueues,

-- 
~Randy
