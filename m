Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495259;
	b=3U6izQPxfQUTPIJuNgdsF0Mx2iPKvW450JPnFMOo5i2Ie5WtUJMLV+J9JxpdwjvPe9/8
	 5Ru2NJFHZ5P1JvRT1QwtbnY9tE+f0QjN+tezKBUwy6SWnWRwFG4fFTwrh8kNN2fnVr07g
	 7YOSZ3TFT9nPpeUe85I4h7B96fPq5sPdx+Le0f7vy+koN6/amV//kaPQ/ypS5Ypc/GIRz
	 0Zs2hFAnqITu486zTg9+qxREMi9clJfTNdWOaiO96wtVih9emOCXVFqQqykTlLxpX+64x
	 o1sSs0tovN/2X43iPiDAhU2XL00acAmWjS6hfqWLSBluJ/wIP7aoohhbwhbBni/dlBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495259;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=yyyqgMzIMMGtnyD3Zq5EfQcKLXj5vmbezlKr3OPD+mw=;
	b=F4ElEOurgHZIb3gYVxFI9fJkGvreQc2WYlFRxehyuCjaNgjKiTwjzTnALsmNDhplo51L
	 EOKsUZXXafLoXwoMvKV/+1dCxM4XUWjUhgBWsscOTtWMBCEjysv8wgp8Dmhsm9nQY9DOR
	 dblqzU1dcl+/gloieHhlmiS+2IuQN17/VwNkLwEXe3mTBk95t/KWbrwReUWtTQ3cIaqW3
	 sk5vwR5lzQUkhwrJGjsqAWyVmzY19yIzaPwJ6bez06/tDS7/vBUkvJBy01Tc3KTD7FaF8
	 9a+TW63ouBxCkKP278jbR1up6R9xdz7iGVLf2EGrFJOD4TWdPJvqZXNCWWBEod1hTEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=LboxVGV4;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB076606A321;
	Thu, 12 Nov 2026 14:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB076606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=LboxVGV4
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 67B2940904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794495258; bh=yyyqgMzIMMGtnyD3Zq5EfQcKLXj5vmbezlKr3OPD+mw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LboxVGV4aWJL5rYqiTxqd07I53sUMubL7glcmLhJjhPgaPk0eM1sE4R+R/27jrYSd
	 7EUXyPI/yvqpwvZNNYJZlcOjY6QRY28Gmm8t2KK8KzGNsw6VWLSZW86KnMh0LaF8Rz
	 GdT0tUJU1XfNHEjCQzxEotmE4DrOSE5d3O7eF0cnZAFY4xw72IXwwRLpQCQFJe5l0S
	 HNzyMgef1WEFBNquYY3pn1V/OQkp1c5Vdvk1QGhgPZ1s4+tjUCYuq2rLssoPRDpeEu
	 yfS9Pj5RjUBMdlx/ieB6OKhZaDLbEwQh3fFueeYIoTAGMIC+YCfaF5U69+0phqO4Hn
	 pGxUFEctWRvLQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 67B2940904;
	Thu, 12 Nov 2026 14:54:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: exception-tables.rst: fix bracket
In-Reply-To: <20261103121716.102730-2-manuelebnerli@mailbox.org>
References: <20261103121716.102730-2-manuelebnerli@mailbox.org>
Date: Thu, 12 Nov 2026 07:54:14 -0700
Message-ID: <878q2y6qy1.fsf@trenco.lwn.net>
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

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Remove needless pair of brackets.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/arch/x86/exception-tables.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/arch/x86/exception-tables.rst b/Documentation/arch/x86/exception-tables.rst
> index 6e7177363f..de776bfdd1 100644
> --- a/Documentation/arch/x86/exception-tables.rst
> +++ b/Documentation/arch/x86/exception-tables.rst
> @@ -72,9 +72,9 @@ The preprocessor output (edited to become somewhat readable)::

Please note the above line - this is literal preprocessor output.

>      {
>        long __gu_err = - 14 , __gu_val = 0;
>        const __typeof__(*( (  buf ) )) *__gu_addr = ((buf));
> -      if (((((0 + current_set[0])->tss.segment) == 0x18 )  ||
> +      if ((((0 + current_set[0])->tss.segment) == 0x18 )  ||
>          (((sizeof(*(buf))) <= 0xC0000000UL) &&
> -        ((unsigned long)(__gu_addr ) <= 0xC0000000UL - (sizeof(*(buf)))))))
> +        ((unsigned long)(__gu_addr ) <= 0xC0000000UL - (sizeof(*(buf))))))
>          do {
>            __gu_err  = 0;
>            switch ((sizeof(*(buf)))) {

Removing a pair of parentheses will take this output further from what
the preprocessor produced, and the result is still unreadable, I don't
see why we would do this.

jon
