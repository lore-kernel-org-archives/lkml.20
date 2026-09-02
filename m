Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1E34AD4B2;
	Wed,  2 Sep 2026 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368784; cv=none; b=O9APWy/lQ5VXXfv6YUo0j9l+3A4rptpW4mn7eHz6I4pq/N8A4vst8yPC3Tv8Nyd1uJAiTfqN1Y5ALpE9//sJeVrGBVLLoEMktOBQdhS8XLdurM9S3reXTnL5ERL20N2h4F1JZkxseVSK0h7OsRVMY3mkB5ok+9cFaAfwwb/STJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368784; c=relaxed/simple;
	bh=Hr/o41dJbmM6ilCYKkB3JtqVVzFMj2lsV/lBvyi2Sp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJS3PB5r1khnWc911YYpO6156EgEqBKlaqj15e7wAdrX8/ATMYzuGerI8322QTkULNV9zbAZCvghauB7PRnE6m5KUZTcuktPZrDt7UotLQ1KFN0jyfHYXMdQ7XLzWjTgTHTf0CUASRxRiSYxrDw4VC8ITpSEO3JkCndUWTMozfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U8MejSfX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U8MejSfX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0GMwNHym5Ug04EXnhQBcACgL4E8hsutJGMIT5Smodrc=; b=U8MejSfXExqPwZrifHDp9hGuEZ
	CIy58fHXiP1sW5PkALQpnW1wlKrZcX3VRPrqN3g6ui80IUGn3wTY6qJHeDqPrCPumTjYy1U27pTz3
	XzkFU71AVzlufVkcr8NLRkTFvbCYZ0wzSj7RB/2FXPg91Z++88qrF81MLdYuMN4M60D8CGqVTHrIa
	DTvjv1c8aMUe4L1zpZFexEWeYwuaZr1jD1Ulp2F6GZ1CGBehcCW/nVLdDc5EdLEd4zbAxERGZ2qVG
	gEz9gLBl9j8ztic0CZuX/FaFfxBBAAbZdj7OLjmC6hG945gLNUS3fIbkqJOJcwS3/iA44yQR0ia67
	KX9h3wNg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oPl-0000000FOCv-3YSF;
	Wed, 02 Sep 2026 17:06:21 +0000
Message-ID: <d9aed8ec-f917-4cd1-9a0e-d12d21874b8b@infradead.org>
Date: Wed, 2 Sep 2026 10:06:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: doc: add bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902144210.703915-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260902144210.703915-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 7:42 AM, Manuel Ebner wrote:
> Add missing ')' to sentence.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/filesystems/mmap_prepare.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
> index 82c99c95a..0482c21b4 100644
> --- a/Documentation/filesystems/mmap_prepare.rst
> +++ b/Documentation/filesystems/mmap_prepare.rst
> @@ -114,7 +114,7 @@ VMA Flags
>  Along with ``mmap_prepare``, VMA flags have undergone an overhaul. Where before
>  you would invoke one of vm_flags_init(), vm_flags_reset(), vm_flags_set(),
>  vm_flags_clear(), and vm_flags_mod() to modify flags (and to have the
> -locking done correctly for you, this is no longer necessary.
> +locking done correctly for you), this is no longer necessary.
>  
>  Also, the legacy approach of specifying VMA flags via ``VM_READ``, ``VM_WRITE``,
>  etc. - i.e. using a ``-VM_xxx``- macro has changed too.

-- 
~Randy
