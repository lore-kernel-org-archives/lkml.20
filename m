Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477061;
	b=Ngc6MAtffq2BuuXctBXSNYzFGf3fQZkZlsuyW+vkYft0roJGOQMmXTkt+yZ+2Uhl3cFF
	 qv9nss3Q1dHdSv3AILUar8LpOQakuuH/OCjjYPUExWJOCVabLdmo7CDBLUV1JG1IC7V7T
	 I5Yaxx36n2gjCpfJIkP8w1e8Wd18WwS3cO5qAAhe1uGfxEaRx+glk6LlIvquNWvL8j8k/
	 6vu28F4A7nFTAWOGpGk3WnuIFaKy43eqTklzS9hZVU9tAWvlGtZPaOOCKbjFHQrU4qMSa
	 PpgbIqok8STwGJGGvSXVHH9HnigM59MJ9ETkxas+zErWBcDQK53U+qkaqECCBcAnVEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477061;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PWjpZTISxAW1ioWo7zAlKfMSm3zMo7GsaFnXjvMiMuw=;
	b=LN1JdQvbpcCu5t18cbHySQFZ9dJwc2rCENOw77RzJ8I58OhluOMwnBE1DNN+IKC2sDnR
	 vvfwAhgMiipGASMXmVuPoaxb4UZT6BYD++LspO95eJzYoFlVBDdU+HFeoEuSfokv9ihXR
	 fSuFePnoBf0q5HDkdmcAUagkuCLMnRJOXm+Y8xpK52voO14xrgBPPsxlG+WEVIRWU7LGY
	 w8YMMoVQYeXPMBjpQx2Hk6wcsWbcpEcdllUT3AOS2ULX7D+z39HQT6Q0ZqcPXjUG2Dz3n
	 Z2oBnb13Dou7ijPQ4YIg62rPtzLcb7YjhQrIW55rdUv3++ysd9j1f7dUy76NXEBBlQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXWiPM9g;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KXyVzv0L;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22969606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22969606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXWiPM9g;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KXyVzv0L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794477060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PWjpZTISxAW1ioWo7zAlKfMSm3zMo7GsaFnXjvMiMuw=;
	b=RXWiPM9glKt8c84teQV76D3GrDKVCOBLB6mn2I1ijFJCQb4OMmrlLDFWCcFqryVtl+9qRw
	S3cfhJCt406aNjQazTVjoMN1ShBkX16QufH020lkNxDnsh6+qRCYZrayYpANo3TONKVu6z
	RBoTMv3PIYpNxhWQR2LTSjOAj9vwT1o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-MXe5BRKJNYu4v4a0oamZxA-1; Thu, 12 Nov 2026 04:50:58 -0500
X-MC-Unique: MXe5BRKJNYu4v4a0oamZxA-1
X-Mimecast-MFC-AGG-ID: MXe5BRKJNYu4v4a0oamZxA_1794477058
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-492b5408dedso2923124f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794477057; x=1795081857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWjpZTISxAW1ioWo7zAlKfMSm3zMo7GsaFnXjvMiMuw=;
        b=KXyVzv0La1EfoYmGOSDKursoJv+qB7cu2AJUrUEF+n8lT7MCegQ6v5eAFLcMOoxTDA
         MIRxwqu8JNwlXDP9IIP+vlCNr6Dyyn8ppqi1Wl9Rfiux8jDryy5qgvsyQugg59ylrxbV
         CtfS2Kx1304JWpicaWTxUB/Ts31PlHSunJAL973MX6sviRV4hGudIt80nYsG8MndH9Z3
         licU8sniPAMzlXmxntNJUNxafI5BH28UZlvgsEDW4ahZMUvlXPSDv7JKT8mTbNhhYcoJ
         GKVvDaiv4Kjv3WLys74kpWVx1O0MY5pZBYpNmC+4s37WIjxCoQNTAghsCzwEv2Mxi738
         m7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477057; x=1795081857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWjpZTISxAW1ioWo7zAlKfMSm3zMo7GsaFnXjvMiMuw=;
        b=FbjkDMeAouIXNQa8t9p08iz8Ya5OkEmDpKKOack/fDhqNF1AFx6jR50RJrDdffOfYw
         xoJC4ixbEiT5rGffSU3hKNICfRZLrSIihEmYKu1exf1lmZoy4DekfUA/GGaUdfJLF9X5
         K5OXcZ6c3WrWjudpVgV8z0h6uTEgMpvx1QtWk6+iLCny/t/b9x3OkfjtTd/8rnQWJd5C
         +NWsDtP7+N71QtptlVA95Fz9WrZHFRJwj286m9adWVDgeJti5bbTuIbABMpsYXU5pd6I
         US9Cjfp8r38+eiy+N4b32ToKkJFCL98VBFLRezahPP8xh1l8rl1nlP1ifYVqvngjxKhn
         DL7g==
X-Forwarded-Encrypted: i=1; AL+hErF3vwcipTLV5BWm3fCFKK0JPPSRfVmH3yfGgQ7+GI13t2ASv6jCaXbgeASa5LhyY0dRrRh0iOIZpCXQJFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FzElW6mNmBolkmz4vcToXOkp9/uVcng4B8jtxDDPnBqeCPW9F
	uPzfJpMqrOaICx5gqJs/SqDcKNWPdgatBa8F3PlWnuGWOwGliBTuf7BHyok1vG0P5a/8zx+Vbcw
	ICeB6LSCF/ylQbJ7FDXsLTTB9b4xAPeH574apn5Epwu0+oFNcrx4vSxjobgK2ukjo6g==
X-Gm-Gg: AYBFou2D/cTn/lY4idokH8vAQLnxWEFVGR1+EYNipmcPmQcSg+VE9OY7OYZw/JT4WVV
	R7I1Y3D4300kTqeXAwX/ZyLuwOyiJ8T5Laa0WQ/TM83wNYxfFP4BY+5joASG8EScYxvzKvHPqRV
	vxVneDTl4KYNYXRzSXD7DNFDOnkrKXGxfcIazIqq/aK/j2uuFCXScQWGJU15vfHbRKvUvtisdQW
	k0jySJRyEwrK89w61mwjXELUbxjd6P/Zxbn+c2MGbabac8BEyXk+sMO6M7Jcsz/sMc38jBO3CgN
	QpvGscsaAfc7oTgt/KRSu0gzy9+FpyowHq41q7rb55T79B5+jAr6kU8MKiPHbIHVW08ANFP1ilz
	3Ba6G+fLPXIcwgSx+0ODFdi38kjdYh0AcABb7E+2rvg==
X-Received: by 2002:a5d:5f91:0:b0:48d:f9a4:bd68 with SMTP id ffacd0b85a97d-499c7dfe760mr9013246f8f.27.1794477057324;
        Thu, 12 Nov 2026 01:50:57 -0800 (PST)
X-Received: by 2002:a5d:5f91:0:b0:48d:f9a4:bd68 with SMTP id ffacd0b85a97d-499c7dfe760mr9013178f8f.27.1794477056650;
        Thu, 12 Nov 2026 01:50:56 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm10614988f8f.2.2026.11.12.01.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:50:55 -0800 (PST)
Date: Thu, 12 Nov 2026 04:50:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhaoguohan@kylinos.cn
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] vhost: set dirty log bits without pinning pages on
 x86
Message-ID: <20261112044557-mutt-send-email-mst@kernel.org>
References: <20261112085631.128819-1-zhaoguohan@kylinos.cn>
 <20261112085631.128819-2-zhaoguohan@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112085631.128819-2-zhaoguohan@kylinos.cn>

On Thu, Nov 12, 2026 at 04:56:30PM +0800, zhaoguohan@kylinos.cn wrote:
> From: Khan Zhao <zhaoguohan@kylinos.cn>
> 
> set_bit_to_user() pins the log page with pin_user_pages_fast(), maps it
> with kmap_atomic(), sets one bit and then unpins the page and marks it
> dirty. This runs for every bit set in the dirty log, e.g. on each used
> ring update while logging is enabled for live migration.
> 
> log_write() always passes a byte address and a bit number in [0, 7], so
> the update can be done as a byte-sized cmpxchg on the user address. On
> x86, try that first using unsafe_try_cmpxchg_user() inside a
> user_access_begin()/user_access_end() section with page faults disabled.
> If the access faults (page not present, read-only or needing COW), or
> the cmpxchg loses to concurrent updates of the same byte four times in
> a row, fall back to the existing pin/kmap/set_bit path, which can fault
> the page in.
> 
> unsafe_try_cmpxchg_user() is only implemented on x86, so other
> architectures keep using the existing path.
> 
> On an x86_64 KVM guest (i7-12800HX host), a synthetic used-ring
> workload with logging enabled went from 243.60 to 171.11 ns per
> descriptor, averaged over five alternating runs. This is the
> end-to-end cost per descriptor, not live migration performance.
> 
> Signed-off-by: Khan Zhao <zhaoguohan@kylinos.cn>
> ---
>  drivers/vhost/vhost.c | 50 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index e29f154706da..9c3045504709 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2527,11 +2527,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
>  }
>  EXPORT_SYMBOL_GPL(vhost_dev_ioctl);
>  
> -/* TODO: This is really inefficient.  We need something like get_user()
> - * (instruction directly accesses the data, with an exception table entry
> - * returning -EFAULT). See Documentation/arch/x86/exception-tables.rst.
> - */
> -static int set_bit_to_user(int nr, void __user *addr)
> +static int set_bit_to_user_slow(int nr, void __user *addr)
>  {
>  	unsigned long log = (unsigned long)addr;
>  	struct page *page;
> @@ -2550,6 +2546,50 @@ static int set_bit_to_user(int nr, void __user *addr)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_X86
> +static bool set_bit_to_user_fast(int nr, void __user *addr)
> +{
> +	u8 __user *p = addr;
> +	u8 old;
> +	int retries = 4;
> +	bool success = false;
> +
> +	/*
> +	 * log_write() passes a byte address and a bit number in [0, 7].
> +	 * On x86, update just that byte to avoid crossing a page boundary.
> +	 * Bound retries so a contended byte cannot hold up the worker.
> +	 */
> +	pagefault_disable();
> +	if (!user_access_begin(p, sizeof(*p)))
> +		goto out;
> +	unsafe_get_user(old, p, fault);
> +	do {
> +		if (unsafe_try_cmpxchg_user(p, &old, old | BIT(nr), fault)) {
> +			success = true;
> +			break;
> +		}
> +	} while (--retries);
> +fault:
> +	user_access_end();
> +out:
> +	pagefault_enable();
> +	return success;
> +}
> +#else
> +static bool set_bit_to_user_fast(int nr, void __user *addr)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_X86 */
> +
> +static int set_bit_to_user(int nr, void __user *addr)
> +{
> +	if (set_bit_to_user_fast(nr, addr))
> +		return 0;
> +	/* Resolve faults, or use the native bit layout on other architectures. */
> +	return set_bit_to_user_slow(nr, addr);
> +}
> +
>  static int log_write(void __user *log_base,
>  		     u64 write_address, u64 write_length)
>  {


Actually why do we need all the unsafe trickery, is there
a reason? below seems way simpler?

+static int set_bit_to_user(int nr, void __user *addr)
+{
+       u8 __user *p = addr;
+       u8 old;
+       int i, ret;
+
+       if (get_user(old, p))
+               return set_bit_to_user_slow(nr, addr);
+       for (i = 0; i < 4; i++) {
+               ret = __try_cmpxchg_user(p, &old, old | BIT(nr), fault);
+               if (!ret)
+                       return 0;
+       }
+       return set_bit_to_user_slow(nr, addr);
+}








> -- 
> 2.43.0

