Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525E381B10
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206399; cv=none; b=a0jd60vOviWDDpiL2OqX0F6YuWzbOB+DOtYlQUotIRatrLXqfm0zWuFjDM6lrZnRW/Tnf3ZIPeKO/FiGkjiZPonUCnM17PqCfqJgJNSehjY4MEs5OQKTVf2GHKY3aI4+FJgigiyghMVoUQY97XzAxwV5rVWvo6bwl/8JJ4+5Pk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206399; c=relaxed/simple;
	bh=Ws3918YV6HHGK6XqlgDVOPnbMiUTUJbYH4Kgb/H2jtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hbPsRzWXwZMrKRHnrICyd7E6ZZLH6BlDJO/r7L9Fe0w8A8zsyLNd9ZC49/XxXNEehCE3N28Smzb2amckWZWvB95wRmQVsIEWrlckn8+XdRbLyhabweLRxAueedsNFMUfEHMIK1FOpSh/GF4aPenP7KkYcwuTPh9Qqz7eohQpQxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=AZUrsoCe; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="AZUrsoCe"
Received: from [IPV6:2601:646:8081:8d71:2faf:8150:30da:aafd] ([IPv6:2601:646:8081:8d71:2faf:8150:30da:aafd])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 67VJxRIu3266963
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 31 Aug 2026 12:59:27 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 67VJxRIu3266963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788206367;
	bh=42+matBErk5/90UKZfRFNbkFpVxEV2kcZFSZQlHWELE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AZUrsoCe4rGQvE2hvtCyw2/00Hdd86nM20yfZIDknUWbb9V2U4aksW17iN15oj8ta
	 LmW6eEJ4bPjE+LPLU6jvuUykbhNcKubtlg6pKltcsExN05hNLJ96cJAvfSZ5BDv2es
	 5nBMzoZidEG0atIwIbDUtDCa+B1iQFsLRG3dhRBFDP+2EXzklZFNh+e/f7EY0HHVYL
	 TQRlTQDppJp6j/j5kSi/7JbnBej1lisUFSGSqasraX3133H8DqggI3miUk8e6BJ3PL
	 +0ksXG6QHV2tLjyvQTxRpILRMnlAL7KLdRAkfZs9yF8jPURpq435SR1apLpg9ZtS5q
	 W1WF+gPt3ZUog==
Message-ID: <639adc61-6efa-43b3-ac84-db2b4aaf43b7@zytor.com>
Date: Mon, 31 Aug 2026 12:59:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU
To: Eric Biggers <ebiggers@kernel.org>, x86@kernel.org,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20260831185706.90103-1-ebiggers@kernel.org>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260831185706.90103-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-08-31 11:57, Eric Biggers wrote:
> Since commit ab05214025ee ("x86/fpu: Remove MATH_EMULATION and related
> glue code"), X86_FEATURE_FPU is mandatory.  If it's absent, the kernel
> halts execution in fpu__init_system_early_generic().  Remove unnecessary
> checks for X86_FEATURE_FPU that occur later in core x86 code.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Reviewed-by: H. Peter Anvin <hpa@zytor.com>


	-hpa

