Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B882D5408;
	Sat,  5 Sep 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576041; cv=none; b=Z99xPJRQspwnx2cr5JLza5hmFKPSlgFTx2AEL/UXDu9IhEIfSCeFOACZ5pAiTydfXMlHv094DBPNMe+4pECBgZHAn7QdYg+Yp9i0N7279+UMpNRssKCFDkqpxUalUkbuupS98mhAbupYSBfgbKT+n3Evcz+h52i6wiW86GkNwYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576041; c=relaxed/simple;
	bh=1jHyMN1PgQjTkpyy3nxRyLDm7ZFa8msCO0Limlby7/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEo7gJnk+66PNrCo4qmKHSS60umYNVziB7iBqxJNmMckUe74vfnml/Ifa5cedp6In1TV3/etITiGDQXdcIaC0Oj4l9UGhXdgSjn7pA+KYQDEDbnsqlOOORgETyYMTbEJHm8lyRtLTD1pWvh8YGhs1Is9bCX/gOWAFz2glIJYSVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j9TomF9M; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j9TomF9M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=HJhe4v0Ih6cd9raXVOt4hqvtCOOVK1vFM7fzFxentqw=; b=j9TomF9MnlcTfitvTXNu2bhlRl
	pg374fwBfJmmo4NPnuF0INo3gOR8uL4zMXIHnMzOzfyzAaM+xltmF1Fs30jvIT7fMfncmbbapkrMz
	itb9FAREgDHr2H9EyIeqT2YgLo7DhqwPnKX64jMRMjvLiYj741nw5rnC0VnuxamzzM3mF2oTJHM1s
	Muz3y2VeS95En7e3mRpRf0YZUClDDgzqTGKILWXjNIQr7WVgm0IU9NVSQVcSK9zn9h4YwqV1GjMo4
	p+9GyAva6oV4dwgMExD5tC4g4u/wefWz9jXCFJk6ztk57DZ8Vz0NQ7i2ITjNHjXH1DoowP+igso0v
	qr2/iwdA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gKY-00000003bqt-2C1I;
	Sat, 05 Sep 2026 02:40:34 +0000
Message-ID: <b39a2199-fac2-4648-ad96-cfbf0232db3f@infradead.org>
Date: Fri, 4 Sep 2026 19:40:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] loadpin: Fix stale KEXEC_VERIFY_SIG reference in
 documentation
To: Karl Mehltretter <kmehltretter@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 James Morris <jamorris@linux.microsoft.com>, Ke Wu <mikewu@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905013655.58665-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905013655.58665-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 6:36 PM, Karl Mehltretter wrote:
> Commit 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG
> and KEXEC_SIG_FORCE") removed CONFIG_KEXEC_VERIFY_SIG but left the
> LoadPin documentation pointing at it. Refer to CONFIG_KEXEC_SIG instead.
> 
> While at it, clean up the grammar of the sentence.
> 
> Fixes: 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KEXEC_SIG_FORCE")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/LSM/LoadPin.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/LSM/LoadPin.rst b/Documentation/admin-guide/LSM/LoadPin.rst
> index dd3ca68b5df1..a90fd9dac960 100644
> --- a/Documentation/admin-guide/LSM/LoadPin.rst
> +++ b/Documentation/admin-guide/LSM/LoadPin.rst
> @@ -23,9 +23,9 @@ sysctl allows for easy testing on systems with a mutable filesystem.)
>  It's also possible to exclude specific file types from LoadPin using kernel
>  command line option "``loadpin.exclude``". By default, all files are
>  included, but they can be excluded using kernel command line option such
> -as "``loadpin.exclude=kernel-module,kexec-image``". This allows to use
> +as "``loadpin.exclude=kernel-module,kexec-image``". This allows using
>  different mechanisms such as ``CONFIG_MODULE_SIG`` and
> -``CONFIG_KEXEC_VERIFY_SIG`` to verify kernel module and kernel image while
> -still use LoadPin to protect the integrity of other files kernel loads. The
> -full list of valid file types can be found in ``kernel_read_file_str``
> -defined in ``include/linux/kernel_read_file.h``.
> +``CONFIG_KEXEC_SIG`` to verify kernel modules and kernel images while
> +still using LoadPin to protect the integrity of other files the kernel
> +loads. The full list of valid file types can be found in
> +``kernel_read_file_str`` defined in ``include/linux/kernel_read_file.h``.

-- 
~Randy
