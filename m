Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553394;
	b=mABQ52db1Kn8GxNHpu7y0WvH5XwWz5pb77HLHsRr7q/nXox0ZP5tlkWxp1+vQCL8kcRU
	 wXsR9/90WQBJkzI8kEwFPICvN+nphhlQ9U/x4n80YkJ6TxMWpPaBDVF2CvEXPLdZt+p8D
	 JCL7xlHBBJSuZmw4JkjNdxEulZKxfKJatiXooU/OB4Z+w8resqbZ3sH8bFHomG7pvaWZL
	 m4Wht8MLNf6bB8bKCfub4btdRTzwiQB7YL9oGOukKqXh7li5CbKtwEuolxwJUf4PBnxl8
	 opVen0oFnHsswjRSCcpT00sAy7zZ7Fw+JGgwBzeNfIKrIc3Uhy2qaPZL3t7OpJpFWbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=stfMBCCx0iYEkgEJ5sWasY787cUVg+XUdXtndqYjb9o=;
	b=Z58Bjh1FhsxTExkeBrQGlFhVZuQzJ1I1kFV0Ylo0uKxRTGInEDrK6NZUFjEe/tiD4Wja
	 jgC6fzedl0dCJ4ohJbsKPcaWgBSoDt6KOJfCTWX5w5cajHawRrimaThrsyJHLzPPqFA93
	 gSl2Hqlc1DEonpBOHUXPZai1mdXFpEDCWWENTRT9poxfKZJN0h+oD843+TWa3GOShLGgF
	 gBDhYeu/fQjc2KfHjnvA1TEDWwWQR7iopYKX9uGa3y7KpUNwg7tUBBfz4hxCHKpmKWY3l
	 U0HCXmFsFCzeDoZdiGG8uhCJPFP6jy1xBvolmZydpZfMfYznDgQsOeCWUcM0SY7wylA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gNQ8Tpbv;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD4A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gNQ8Tpbv
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso2970107a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793553392; x=1794158192; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stfMBCCx0iYEkgEJ5sWasY787cUVg+XUdXtndqYjb9o=;
        b=gNQ8Tpbv5/eK1NBNWCxtTgc16zPTW31++MtIDLWD3Q/1zm4lUx52ChF8Czkb/NMICb
         UX4FF48fhvwXyObWcaMxmZPVQOL3xD6mt1ikX5AMH6MGeVlPBISjpeEWo1vrRNiyJr0+
         GSQPwsqvDokOUf5Tz2oS1y1Ty72N6IRBibvNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553392; x=1794158192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=stfMBCCx0iYEkgEJ5sWasY787cUVg+XUdXtndqYjb9o=;
        b=GngWrYhoIv77h7hqPoWga8r2lTAaEBzs0a9GdZOwyFMJE7URGeT5QRgdUhfWLK3vFS
         +QpDG2oq0hjBTF72X4E6Cz9bz5O8sgrUKCpCr8LbYICr7px3tw2+ke8S/KjO1dUYvzls
         yuOKEelkRTHfS3xZF9ReYvJ7z3iIXb57kZKi1jTkcbF3GRSVHccasT2GcGC+zU5YV0Qp
         87kT+z0K7nLZXKLr0z259vii6IQa8G/HoJPUC/vAV2ilcAgLhFpodK73SN3W7zfmXzH6
         GDWwhu8npx9UUfLMXsd7LJwEJ7huP3bv4OhhfTlyG5hP1fZ0RueuIyWRfYO5h54GOwKV
         SSRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPgbklJau/wgs/D5n2EWaORiu184wwiUFWP209/l+tfP3TNU+OgDIucq40gH2tRx0FgCHqoRxepy4PcOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IcKEqMT5yPjNLbM59/kote/70lz7HtQU+z6B6wR6pGD07sh3i
	10KBsLK5kFEkChN8eM+mUugjmgvMJVqvscZlT+SQW1RMF7HD/MYOIAevIdeZ0utsmcvG0+Nk5wF
	yuI6MLjc=
X-Gm-Gg: AYBFou3FuDtiKoEQ2M9Wmh+/XxrxDwBbg44p/3qTKzyKLYw//90KcRGdKunqGc49IAW
	aV4MpHJsXZCs4GEXfRstYBX5fVjaP/gVsV7w/VI0Ka+SbBG4L+z+VyGvDQg5VfBi6bHHsLJSSPb
	RhNbjbzZbPNtgGRxflnMl1KvTtfzHJzRXoUQF0JfJyadL0EMnAjwWB1k+L6AF9bBGc4XgIPIFgE
	rSE/6/osGOvIAj9dw39Q3yZKEpVA7XTvwB5UeCpw6t+fhg1eksrFnVQf8HkxrhEc6DIFqArLOcj
	zuR19f7k8f5JnQ8mmtWRbZfhcgzOnme1ZZGSaa3jxLgf1vjQaldSqjRpxS84lfjNzEwn+7nReZK
	2j0yJSuEyQqa7wNoRSXHbAn/fkqHtKPuTED7UGfoLOLwgzXJ52KpHoDdz8FQPfcqO2JYFNbJyY4
	v9DhYB3dq0OcLj46h+QEIdhISONICoKPYT7PdGQEYmlX/5ZgXCZap82oHbR7E/jqOPQoBUBdY/Z
	eJztPved835SNqW6chCl0HTCEWO1UqBC762PYlAILv9trw8kwQ+2bQJBU88/x3ouWeqxLLVYThi
	f6BbR47RvCb8VAKV3NZgOGeGcz/bOEwYcGnUoTruJ6DW1LLKzPydN0Begi05nJ6KhFKh2rq0vFh
	1Nw==
X-Received: by 2002:a05:6402:4008:b0:6b3:fc9c:6345 with SMTP id 4fb4d7f45d1cf-6b4d339239cmr4882403a12.3.1793553391968;
        Sun, 01 Nov 2026 09:16:31 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcba5sm2409708a12.20.2026.11.01.09.16.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 09:16:31 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4550d8ab15so263658066b.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:16:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz2NgL82hzNuIfV347XDSLSFJHkHHTwxwPylthf+UI0sE7q3lzTOSNnFvlZCNYCFVh2S3agtKRaXsgPJeY=@vger.kernel.org
X-Received: by 2002:a17:907:9615:b0:c41:e75e:5889 with SMTP id
 a640c23a62f3a-c4ca7ab6062mr670144466b.33.1793553390629; Sun, 01 Nov 2026
 09:16:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031095716.3030288-1-amir73il@gmail.com> <CAHk-=wiPhTLn1p0ZHx-7SMdk4_zazqDK1k7MMEn9scRfqeDgtw@mail.gmail.com>
 <CAOQ4uxjNrdxZdZZipsqnUNq+TswCKqp+30iKRKCqh2WOQ-zKGA@mail.gmail.com>
In-Reply-To: <CAOQ4uxjNrdxZdZZipsqnUNq+TswCKqp+30iKRKCqh2WOQ-zKGA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Nov 2026 09:16:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiimdwWu0EVQdxGVjbVWdzNKGg0f6vZ1aR-GXxDvQa-Eg@mail.gmail.com>
X-Gm-Features: AclHuK_uccpP1X2e8Vqp60tdiLbtX2zzsC2PsbIq8_vF14_xkvBHQNU7aw3Vaz8
Message-ID: <CAHk-=wiimdwWu0EVQdxGVjbVWdzNKGg0f6vZ1aR-GXxDvQa-Eg@mail.gmail.com>
Subject: Re: Return failure from take_dentry_name_snapshot() (Was: [GIT PULL]
 overlayfs fixes for 7.3)
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, overlayfs <linux-unionfs@vger.kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Nov 2026 at 03:50, Amir Goldstein <amir73il@gmail.com> wrote:
>
> Feel free to apply and/or wait for ACK from Al/Christian,

I'd like to see an ack from Al / Christian, but

> or I can include it in my next ovl-fixes PR.

I think I'll also rewrite that function to use guards. I didn't do it
originally because I just wanted to do minimal surgery, but when I
look at that patch I go "it could be done more prettily with our
modern infrastructure".

Let me look at it in my copious spare time.

             Linus
