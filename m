Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793712981;
	b=ptxFE5noOt6kgS/CAFQSjyyL8pF6ip7kMH+EmfHiDQC9f1FwBlDi3DnxHhnGtkthzpj6
	 7Qfr0tYOTfuWZQqpfdT1+PEC/PlLWFhoS5vhoSaQXl6IwJcLS/lRdAzoURNAMKi6Sdrc+
	 XqbowNmBZWNppqEqkztBIMvaD4roJKihgNKoYT3OTuYeOotE2zE2boswW09UViA7a0yML
	 IqOST/BRcAc9uOvNZVMIcmolaUxdQa+DJ7bKWjDco5gMwW7732plbNOvr0hF8pLh6OSB+
	 PJOX4gal7uAr4jzioF4QmT9+6FqH/mdGwVJfUZsMiWsdF7TA6vm/fyCLDjzS3RQn5Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
	b=Fhamx1eWKyx4kqYV/eUL0vd7o8BeWZmRZDPbiaUySoFtpPqhgC+pqjNn12JBnWEJgC98
	 YxT3l5iJ8U39erNlMJeNgF81P4FmXtCybb2JjTFLQ/vdqqqDOIH94kPsEkf1bMoiQ41q6
	 636i3i1BrGdjmKeYoXcArpz99rrpViGZv9uriOVvDiQWgrfY6fWFw8QnUG4M1S95JQFRe
	 o/nOezIFwKzaqyrSanGHkNI3m/FMxhr1BfAiWF306NF5UVaJRpykFgQwy0vjjO6DXqlkE
	 W0EXtxzZaFmyoiEx4Alb0yve6y+oxiQ0rrmc4ju+EDPhxCJqXKbFPbM1v8xV5kyyqLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTiqMTLG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21E606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B21E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTiqMTLG
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c19fc50abso51906886d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793712980; cv=none;
        d=google.com; s=arc-20260327;
        b=ktvK0nxZ2GEFWpgDl+YIv/koRouhrF/GJUUTQbYkI8Vf0pdMq7DaZz2ix8y/C95Ubm
         V7FqkWN+are8Igl6/EvbQ+YhJNPv42F9LbIiavUjKTrm1rWheT2MmFGCccxZrINKLGGC
         szsxUNNx16Xoi9JOc3zZgwpQPnrlAP8WTqwucH5am7+Cm/qCZh/MsDRTjKW865CDxeyU
         hvzNwhFDhMtqJD2I0F6vBp4sQ+SdHtGtvwphjqEC9swIWBzAsk/13ion7DlsGioJpkp5
         Y7Z1vZo/Jas6ltAQCfnpXbVcanFVK5rHgjWJ1wD7EpWnhilfFV78IhXc3wx23JMtiu3G
         bLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        fh=wys//jfL4F0m1hJdxl6Y6+fEQglMjl3tGN/Hcy+awsg=;
        b=s1AspeaHEn2edMPxGpkdHi2AbsAQ0DMLLZcLjAOkU8HijocrVzYGMcVZQtIGLjDsoY
         aS43owucfJIIF6CpayxNViNKG4JdubVPb6SCRswVhRRPDIKSLIXC3kivkAsLbUocipFc
         lOR0VbS9Bl0OWqSFUkH8qB7VYbkd9h1Je6kL0byttRI93n9xXzOVXEqrMgc/dg86dM53
         oCffFaBlVAMhXSFuvsT4sKuSB6+wfWwqZmMDZ837h1KWiSdObrLhovcBwh7pDreU6LxB
         qC/8OsSJWGu7YUIA4RBxee1Wil5NeBXyD3eo9avqWrD5dPWsJZWJTjpaLEmQE1ANRBYO
         QX5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712980; x=1794317780; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        b=mTiqMTLGajkWWb+Lh90vdyb22P9zGDoS9RIl2x3eEIc2oxpQiO23S4a/09qDHuRwJC
         juy2fNpkC6uqd0BnNYrLeFxirqbBRZ1Cvg4xk7zZw8vE/ESCCvJWA5f0qD5MytDxiCJS
         I34jlBPhNYRlCzz2V+Ua5UenSvr+w5JBxV809qOwXk2X+WivVoF5Kamf/LdkNCOoCzza
         C+TmmByNYKrqCeEIhKRYZGnPi0SLgcEmFRYzQjh5u8BXM33aN3e9aV9vEuBgILrOIRlV
         8mjGwfpWBiuOaCKIRlbkjVhhuokuQb07aIiBqr8XaU3bAEpt8gJhjxIRpbitlHFFQVM5
         WRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712980; x=1794317780;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        b=Rg73VFnI7xspMtIfovY9+0P9bDD+J1j2ZqOKEa3RYQNN/WJuHR2C+Jg30r0QhEj0Rs
         YK3ht60q/OIiDmzx/0uEWO7EWmD7dghuC4VlrsE8rleXt5boVBaPHBjxOw49cpPlB5ES
         mMtZ2EdlmhIso+Kw36YCYyIy/Hw5T+AEF5mDkPE3vgXiEw7CIFZAjtFq8QdQrlPgIrdf
         4nPu689npCYarkvgcpDBAs/Lc28SgD44ISEI+vj/nxCBMNs2pFLOjOZ2DK5wxdWfkXXW
         Y0RW7DfBxL0yy8gD1vwbbIiTw3pDBLrPngVrLRKK0S2LLlj63ib8pFl5NDhPEahNPisw
         HcJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYGbSnx8AVAmNPbvoXcmP3Un740YFSanFRaH6zbmWxbDBh70bqhOwzKNKCUre8GdzSoFgD2vHU4GRsj1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VsxoLps1yTxIKdFEV1d5bYt+ICV7mRebDTAeS8jGm0smHyv7C
	tD6HWmI7X1ZesBE4g2/MGT9u1OJk7YtU4CxiLXmlcRr7Pvne4vG7xW4vUKJYvNEDVj75YDfgPjN
	13WXrphAE8uLdDEbHKf2OpmMvJ3co/ts=
X-Gm-Gg: AYBFou1t33nWmNXk5xI5Xgfha8CA1OdoQVXP7rpq+awJ/1Hw2Y44L5y9gqmvgUWyJY+
	4VLt6g6xkYlEi60aaNMqp1tZEmlIw1eF4ybVmESWzvfzs155uk197CZdxe9H2jWilF7tC5mUQUm
	xp/vCWR5YXWakrIjN9pHK0KmacUFMNLj3IJ9IZkraUs5V8mDYD3ghikvfOM1xj3zEWB8eWXTij4
	ZTggR0WO1iB6D1temyrVZ+mlAHnDfCwGD7u8WIQyMaRtlYe6DbxEZ1VovZpOs9MAtsTY7JWH6Cu
	RPes22vayBeadf422++zZigQgVzAd7pfyFAkE/SogdACR9JK9PxHOlMk5AKOrMMM6ldTgHsGH9z
	3SFDjL59eaZvNchy3T3tF+drerTmGOPJ1AespcBoLxOwgXj2qnmpxRLRv/6pByknLZ4GoZKQ+GQ
	/LUn9GkD+aGR+B6MM+NyGr0u6jjZ8sOMANhTfNFIcuiMGSgw+p8KPjHxoYxi1cbIaJTdY6ukzt/
	TGw/WrZlKwYtqjEqwEOusQ=
X-Received: by 2002:a05:6214:2249:b0:91b:5d3a:f135 with SMTP id
 6a1803df08f44-91ca4b7fa7emr216830276d6.52.1793712980412; Tue, 03 Nov 2026
 05:36:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
In-Reply-To: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:36:09 -0300
X-Gm-Features: AclHuK-5QE5RUaf-W6zbQ7a-8WdeKO-KxqeRSBAxVd9f-wJkyCdpMx_t9-dgL3E
Message-ID: <CAMAsx6dX8rWtX=uCqpz+LR9NDScWYLQvopDHTs_0MRVu=1qBtg@mail.gmail.com>
Subject: Re: [PATCH] docs: changes.rst: Remove obsolete link
To: manuelebnerli@mailbox.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	unixbhaskar@gmail.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2026 03:09 PM, Manuel Ebner <manuelebnerli@mailbox.org> wrote:
> OProfile has been discontinued as of commit 24880bef417f ("oprofile-removal")


Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
