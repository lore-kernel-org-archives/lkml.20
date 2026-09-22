Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF56486B99
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057674; cv=none; b=AMsH6NgyzSV5FMKSpHuh6ntITTOfJj0kP3ClyXo4snG3XBWpIb0E9mkWJZorwDrVtT0dvT7ue+tjoGnPQOyumjcp8p4w6qUZbyc+u8aXKR0dmB97a17GeWlDt4rGKBSDCyW0FfY0xbJx2epi/NbsvsqJXeKWoz9lPoreqEaaG98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057674; c=relaxed/simple;
	bh=FCH/9o4E9MuvSWidio/A1XpbpWB1BgwKfBc1t05V7tg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=m+Hyl/mPbk4WesozBwJJBCR6PXTx8i/X08wyuzMGkI0Od5NSaUdZx15wwlFOfi7p5F9KBJQddiO/xXJR1I7/16vSdX9iWNoVtVvkf05tM8S28ocTfKvrCNnaPAokijnrpgx1Hc/9rnm2hHl4THE9VuGB/tAxSJe4GQV8VhXnPs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J3Jrimo5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=No5jGA1b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J3Jrimo5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="No5jGA1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790057672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uEea0f/ypnCyJEnI6MX9Td8H4D5CU9RYE7N1wN1TJiM=;
	b=J3Jrimo5zIGARVvQ2HV9D6Mw0lp4QDyKyL7gu4KXBMJLzdYOCUz/Fwf+iazviirgevKRnR
	+q0cGUoYLz/Fdgr7ONF1TKkNE8i8sD48Wpd9sAt5LkDD8JGmhu8C6qW44eweWUOVbEFINR
	YpPQtu9ekKoMesstjSFN1r3rnNxDY3I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ObSPYleVNWKYtpXubb2zlA-1; Tue, 22 Sep 2026 02:14:30 -0400
X-MC-Unique: ObSPYleVNWKYtpXubb2zlA-1
X-Mimecast-MFC-AGG-ID: ObSPYleVNWKYtpXubb2zlA_1790057669
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4957287363bso32516685e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790057669; x=1790662469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uEea0f/ypnCyJEnI6MX9Td8H4D5CU9RYE7N1wN1TJiM=;
        b=No5jGA1bi3sVxprE9RfWhiN1wmJZPlmCPLSBL79b2GcL4+DIaAbV53AmVXqtwwGVaW
         Dx4VGR1F+WtiRoC1PDf+B62FxbbvmvsEqoWQ7Ll1eJJsuhsXMQasadvjSO/Sax2vwf0J
         0G1VcLk6zGQ+bHaQUlNp3ITNtYCjETzBoPdRzJpRwVo2OLwTxd8ejQIJgohHNppFvHFk
         o+7ljmTWw3ifwEAe4PZpaLsRRPd1XaSVG1HbshoG7HXXJ61w15No66kfhBqd9MTVNpQO
         l0ttVI4SZlGakj9AUzMqbDz+IxSYoqX40QY8czMAge0/L4zIXPizKyi2hXk0IawssZOq
         qOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057669; x=1790662469;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uEea0f/ypnCyJEnI6MX9Td8H4D5CU9RYE7N1wN1TJiM=;
        b=f/+FY2AhNUIBKedI/Dr3SnYPyDxlPaGpXOks7KNervBjXWtthHeDrDXM9hz6xcZDDK
         N3KyDUFX/5oQesT/30r+EM6rFkFauhy6ZJnKbHnh+kiyVA3xZzvnhec5sn+8GW30yQnW
         /KXVVcXh2TVCY8Xmg+/z2tcKK0PeYapoZPBMhXxoFcXRUMVjR4z8aemhQHh9VNB4fHED
         BKn/KGlxGzf6Tf8IcT34+4VsCIIZisVkFzaUiEnhr8sY8cYH/d+yo3Swk0R7JriA/SK4
         lhnKgQIGsZCS9IAYipzIi2Ulq6ZZjjzokJYXLxqFpzhM0+Eztfr6S6Y41D5FES0YNfBl
         0h3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvhSP0nL5uNPZYziexJnNQhLzwqF2PqDPtgYkOEDWsC4eR86zTG8TxrlNRF6SRNneJGbw6GaR9M2J9W04=@vger.kernel.org
X-Gm-Message-State: AFuF++kDAAZUURtNHWrBMV6Sn4jzpEPFmwqvTGuuP03OGGBNk8QjOq1M
	GF5iZ2ubkRMl5jQYXH9KmyF05amk4ZmAq6/xiG32ynfL90W53a+ChqajBqBbUzfTva+1ZsZsL9/
	HWP9oB0NG07jCbIOLXZ/Kvn/MdbP5So3JzdqJKDCkdXphhStb9QVGL5rocsTZ31HR0Q==
X-Gm-Gg: AYBFou39GBsV4h5OnO28Jk8qrOM7aUFPCWNDyxfwVdzVoc3b7XMNkU2xyCLWitt9x21
	/ktdlBeYt5di0ibziFhDUrG5LTYyPufdM3tMUiuE2wE7ntyW24HKIFw9CeCdUVGtbp7UtVJ3eNA
	erVS7EkJLW7SDXYRsJmfMcLLdri/hGhB5+adKbM4z7obSgrTDte8uWGYAtwNUySYMJTk5VxG7CC
	6n8h2uh7koKv7XLIoE2UGu6ouGZGhTWuyjlOsnNoLpBtie9LOb2VzFAOe96EskrjCULSgl5a5ob
	MfnwARICLPH1HeZLaoWE7MHWGbs9NKGfzwca9gTwxokqUGeGW+57pNLrD+kHoc+hlb3Abx67
X-Received: by 2002:a05:600c:1d29:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fc572b7afmr203197725e9.22.1790057669539;
        Mon, 21 Sep 2026 23:14:29 -0700 (PDT)
X-Received: by 2002:a05:600c:1d29:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fc572b7afmr203197485e9.22.1790057669192;
        Mon, 21 Sep 2026 23:14:29 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad53c7dsm22533805e9.12.2026.09.21.23.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:14:28 -0700 (PDT)
Message-ID: <d6bda4dd-7055-47a6-85b8-9e2afb70614f@redhat.com>
Date: Tue, 22 Sep 2026 08:14:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asm-generic: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 uapi headers
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821103425.246901-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260821103425.246901-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2026 12.34, Thomas Huth wrote:
> __ASSEMBLY__ is only defined by the Makefile of the kernel, so
> this is not really useful for uapi headers (unless the userspace
> Makefile defines it, too). Let's switch to __ASSEMBLER__ which
> gets set automatically by the compiler when compiling assembly
> code.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: This has been split from an earlier bigger patch of mine into
>         this separate patch to ease reviewing
> 
>   include/uapi/asm-generic/int-l64.h     | 4 ++--
>   include/uapi/asm-generic/int-ll64.h    | 4 ++--
>   include/uapi/asm-generic/signal-defs.h | 2 +-
>   include/uapi/asm-generic/signal.h      | 4 ++--
>   4 files changed, 7 insertions(+), 7 deletions(-)

Friendly ping?

> diff --git a/include/uapi/asm-generic/int-l64.h b/include/uapi/asm-generic/int-l64.h
> index ed8bcd99c34d7..f840806bbe7e9 100644
> --- a/include/uapi/asm-generic/int-l64.h
> +++ b/include/uapi/asm-generic/int-l64.h
> @@ -11,7 +11,7 @@
>   
>   #include <asm/bitsperlong.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   /*
>    * __xx is ok: it doesn't pollute the POSIX namespace. Use these in the
>    * header files exported to user space
> @@ -29,7 +29,7 @@ typedef unsigned int __u32;
>   typedef __signed__ long __s64;
>   typedef unsigned long __u64;
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   
>   #endif /* _UAPI_ASM_GENERIC_INT_L64_H */
> diff --git a/include/uapi/asm-generic/int-ll64.h b/include/uapi/asm-generic/int-ll64.h
> index 1ed06964257c3..4fc3e882bcff9 100644
> --- a/include/uapi/asm-generic/int-ll64.h
> +++ b/include/uapi/asm-generic/int-ll64.h
> @@ -11,7 +11,7 @@
>   
>   #include <asm/bitsperlong.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   /*
>    * __xx is ok: it doesn't pollute the POSIX namespace. Use these in the
>    * header files exported to user space
> @@ -34,7 +34,7 @@ typedef __signed__ long long __s64;
>   typedef unsigned long long __u64;
>   #endif
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   
>   #endif /* _UAPI_ASM_GENERIC_INT_LL64_H */
> diff --git a/include/uapi/asm-generic/signal-defs.h b/include/uapi/asm-generic/signal-defs.h
> index 7572f2f46ee89..4073143fa3dae 100644
> --- a/include/uapi/asm-generic/signal-defs.h
> +++ b/include/uapi/asm-generic/signal-defs.h
> @@ -78,7 +78,7 @@
>   #define SIG_SETMASK        2	/* for setting the signal mask */
>   #endif
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   typedef void __signalfn_t(int);
>   typedef __signalfn_t __user *__sighandler_t;
>   
> diff --git a/include/uapi/asm-generic/signal.h b/include/uapi/asm-generic/signal.h
> index 0eb69dc8e5722..6b089d4b2965b 100644
> --- a/include/uapi/asm-generic/signal.h
> +++ b/include/uapi/asm-generic/signal.h
> @@ -57,7 +57,7 @@
>   #define SIGSTKSZ	8192
>   #endif
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   typedef struct {
>   	unsigned long sig[_NSIG_WORDS];
>   } sigset_t;
> @@ -88,6 +88,6 @@ typedef struct sigaltstack {
>   	__kernel_size_t ss_size;
>   } stack_t;
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif /* _UAPI__ASM_GENERIC_SIGNAL_H */

