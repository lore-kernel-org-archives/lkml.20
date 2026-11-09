Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259971;
	b=lIGP+PrdpVEEqVbQf2fDtTB/NJG4ToicOQ7tiV9xdwjTAss/XXZdyfovEnG14e4jJ2Dp
	 hnuObRkPLAWnc1dCeNQiIGflHTQwyPdHI5vRyadsPbNMwBfYJ+oWhBaXh5SBTSV/P4jpy
	 gcTqhWthzJOPc+I90wqXdrzvmEsNRCY3xvqdDpVyMR0azac5LHm3cDXI9msOKG0Z8URw/
	 E8/vzt5ryR5VemVjaQ/YFXeWmq3o4R7hzbHtK1WN7e8fP1Z/aFQMSSGklufKOP7kSOIUK
	 xH638NFj+R3uXd+llFbVMpkdg2wcAEWgXp7C2vk8mlCrgWkoblZWk5xSpmRSfMGYaRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259971;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6VIOG1/teVwNhzgf7kdnRI9KYVBfFO57TSsxzE6fxYc=;
	b=F4ZWtX7MtHHGqgnF+a7JI8jYS+Ns5Wv+Oqy5wxuwYXt8ubwkpLcTEqbmIZ5qZP501fBo
	 QZ0EOYMJoWfDfOAZ9WsM4NiS/aYa62bLp6bo/fm0FPkeHz6FdWyUAk2hWy+KNZSS/S8XI
	 7LbHu8DaLQ4BcriPkO3okNo/0/VLqo9dHYkWRxeOgY3fhjqwnKxIhGK0fI8OR78HoZoix
	 5tgIwVGyIQ7R5GoVYNkLu9BHJCHWe0QLOe5TRR3vHfSY1AYzwLNevYAfbS2g7j1XbxXhA
	 fnILOxFT8oAguKmKLJ89CsyLoGuN6NeSNjtG2SR1ORMtMyuEqLsbTYdLiyVvy97OMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=X59RtYlp;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB435606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB435606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=X59RtYlp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=6VIOG1/teVwNhzgf7kdnRI9KYVBfFO57TSsxzE6fxYc=; t=1794259969; x=2109619969; 
	b=X59RtYlpUFgl84Wxxr3OX0D4qrEA0smQGw17vv1tpvB/20BcBMdDGok9miJlUd+sxoRWq7JWq33
	zgNgMG8qhAZCtRjvcMfgmVs/x+lZbUW8tULcbLvwpHwRUrJlOugMU6vmxRrcSU6Gj/eIWYckMXRfb
	BgJExt0kzJh0oweZSSdExU2mhCe7/oMB38X5Wq9H1Y1JCtmHzMxflPZrPTezNE7PyAc8Yv9jgTCcI
	1LfmOscptNayzhguwv+tXIYCnjylEVIaDlsrflhE46Uu4zO2Tk5WcmjVtarP5W6sMeV3d5zOUh9yy
	92nypaCz7H8nq0mwiLnf9OHUfhTDQVEWKFag==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQWyh-007keL-T5; Mon, 09 Nov 2026 22:32:36 +0100
Message-ID: <c9077b39-b7d9-45c7-968a-6bd1b3ab5572@igalia.com>
Date: Mon, 9 Nov 2026 18:32:43 -0300
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
Subject: Re: [PATCH 2/3] futex: reject the unused PR_FUTEX_HASH arguments
To: Bradley Morgan <brads@mainlining.org>
Cc: Darren Hart <dvhart@infradead.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>
References: <20261105003129.3130709-1-brads@mainlining.org>
 <20261105003129.3130709-3-brads@mainlining.org>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20261105003129.3130709-3-brads@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your patch!

Em 04/11/2026 21:31, Bradley Morgan escreveu:
> PR_SET_MM, PR_SET_MDWE and the shadow stack cases all check that the
> args they do not use are zero before doing anything.  PR_FUTEX_HASH is
> the one that does not.  arg5 never even reaches futex_hash_prctl(), and
> the GET_SLOTS branch never looks at arg3 or arg4, so
> prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS, 1, 2, 3) hands back the
> slot count.
> 
> Once an arg is ignored it is burned, whatever userspace sends there
> today becomes part of the ABI and we can never use it for anything
> without breaking whoever already passes garbage.  Take arg5 too and
> reject the unused args per sub command, same as the neighbours do.
> 
> prctl() is variadic, so the two callers under tools/ leave those args as
> whatever the register holds, they only work today because nothing was
> checked.  The preceding patch in this series writes the zeros out first,
> so this does not break them.
> 
> Fixes: 80367ad01d93 ("futex: Add basic infrastructure for local task local hash")
> Signed-off-by: Bradley Morgan <brads@mainlining.org>

[...]

>   {
>   	unsigned int flags = FH_CUSTOM;
>   	int ret;
>   
>   	switch (arg2) {
>   	case PR_FUTEX_HASH_SET_SLOTS:
> -		if (arg4)
> +		if (arg4 || arg5)
>   			return -EINVAL;
>   		ret = futex_hash_allocate(arg3, flags);
>   		break;
>   
>   	case PR_FUTEX_HASH_GET_SLOTS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
>   		ret = futex_hash_get_slots();
>   		break;
>   
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 755bfa5ccd92c..c4839c986f5e0 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2885,7 +2885,7 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>   		error = posixtimer_create_prctl(arg2);
>   		break;
>   	case PR_FUTEX_HASH:
> -		error = futex_hash_prctl(arg2, arg3, arg4);
> +		error = futex_hash_prctl(arg2, arg3, arg4, arg5);
>   		break;

By reading kernel/sys.c, it seems like most of PR_ options check for 
(arg4 || arg5) here, not inside of the function. Any reason why you 
didn't follow the current pattern?

>   	case PR_RSEQ_SLICE_EXTENSION:
>   		if (arg4 || arg5)

