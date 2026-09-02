Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7624A99DC;
	Wed,  2 Sep 2026 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369599; cv=none; b=dM5G5QZahXPxj4QNlgoE3pI+EEZcqkJBD1uY93azT3PCGWlBRl1s7YhyXm4HYYOBQ+GgTMqoA+i7jT1WLILBUmDzNgP37L4tAMjm//ZwQcBjGwJZ79DNO+Kj+5BzKZSVykgaVATqxz8xH6Un5MVUHDOCleUkdHl7ldpxIErx3hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369599; c=relaxed/simple;
	bh=9lV8j+r8havL5KM06J/p5cqXKt8MEkpD3IlK6KoKJBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUdLFvUo9T6+7dqCSgXffonrG6Dkdz8hQeMUuN1cU3q5tJNZA0fnhIGgs82JgiXEyH+HHGtC2BrWt5/21QscVoxFK3jwfbV8ddtMo2eILJzzkRcZ8EnYr264zPxr1Qa3dMvKp9LPdP55yy7Mjlmv4cVKx8zqUdU/EIJC1BPm1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XdSPziTh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XdSPziTh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=npJMAtUVNtJHA6DL9J6HP3NkqrvmeKrijd7JleVnCUI=; b=XdSPziThJsxdoZSYvOl6SyVqex
	indWaeO8bpKCS9WiCVL3VCoKluRmFQXznCFjyU9VBRjqB+Yptr5bdZz0B9qUhTb/Fj8kSMZSEwgxb
	6jbfiGHSlrsD2BBYhRLAiqQW920IUi0ISPRt5KexiAesUnz7QGYS8fO7CPrWFWhOkkIJqLKN28c7T
	WKgzEt7/FDgvtQQGFbekHw/bdJCOh9m+65PQ3Z9yZQBdgjqhzOT6qtQwPlhE4MATTE2GgpGhYJgoQ
	HkBd6t16HNJRLYtLL/TBH7T273K0h6eGx8ZRhAkktGEs+TX/NnqRzoLcM2IXKqi3I4S5s0dMLO7/o
	5O06jWeA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ocv-0000000FQCX-43n9;
	Wed, 02 Sep 2026 17:19:58 +0000
Message-ID: <10591fd4-72b6-4d43-88ce-57f4ed29c5c7@infradead.org>
Date: Wed, 2 Sep 2026 10:19:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: porting.rst: add bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902145428.704582-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260902145428.704582-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 7:54 AM, Manuel Ebner wrote:
> Add missing '(' to function in prose.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/filesystems/porting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
> index 60880eb0c..810657082 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -673,7 +673,7 @@ watch out, since that shortcut is no longer valid.
>  they used to - they just take it exclusive.  However, ->lookup() may be
>  called with parent locked shared.  Its instances must not
>  
> -	* use d_instantiate) and d_rehash() separately - use d_add() or
> +	* use d_instantiate() and d_rehash() separately - use d_add() or
>  	  d_splice_alias() instead.
>  	* use d_rehash() alone - call d_add(new_dentry, NULL) instead.
>  	* in the unlikely case when (read-only) access to filesystem

-- 
~Randy
