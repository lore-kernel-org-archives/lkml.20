Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495637;
	b=Hw3ZyZBs4kLTRx4rkO+kdebZ7M1hluGmLkbKfnaYAePqBjInCp42Pkr7YmT6ilhJ7Zzy
	 dSjmsCCrjXBFD3KD+8OeVjMCHZXJD6cN5TbHhP+FPmjB3IuW1wl91kwXqpXNU3yT/BgjR
	 v3j14bnJR1zpbfY0gv0yPZ1eZbyZF6pZomvBJkJR9VtkAezXB75W1WyejuUmwGwPUeH7o
	 QJmZD6MFSwx8yMI88ojAQg32v6oDmRt6RxUSPxmTq3+ob6U4L9fcN6lB5X4qpAsvPtIIy
	 RcZHFlo7nVYXWci08LkKRt9MAj/B1HOwA/gcnL3GO9zSrAw6YhlHJMfN/4TBUfhE1RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8yYqy1tuA0FyJjrVSCVgV+Doj8Jl7Ml/5bTTP3YOpXU=;
	b=kEVKbXzg0+cAyIGNc0pHs5YyQxM5KXQvUd+j8WX0cS/tIkB8LxClxP6k08h8GqWrVgk8
	 4r0snjsQbedT5T4I6Dwd2cN4Y8Fm4L9ZuhZQC0F5URRw6oFVrUtXumVKgsLGxyATCcYOo
	 2cuNd2ZHZFOy7J1hMeOk3fA3QUTS08rqyOqRU4E6oPa380oghxUEqvS/AyZDPZsGn/QdT
	 JOzh5KWom6YnPp+SZ9CsouzjOGmv2JugNDKkWvDVca9nbP2LeM/4XHNJYUTDMLLpQTk9B
	 +MC3QHj+xOPPW7M+R2Xztdk7peYwHnbx9CLUKiRDrBFELxCyYVEv88Z5qLpIBC3K3zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UNTUk5Ph;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C6E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UNTUk5Ph
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ee2ad94713so433375e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794495636; x=1795100436; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8yYqy1tuA0FyJjrVSCVgV+Doj8Jl7Ml/5bTTP3YOpXU=;
        b=UNTUk5Phl6735h5yGynAgTS/6C2cJAMQ5iWpSsj5LGh9dtu6ZbUQ28l9PCUZyDWFS2
         984cM+oMihbSSW0raUu6jnUzRcE4QjotUXIJukljUMS2LAKKCPb0itQ7GlX5XUb4E/Yk
         SKuDu87H7pV4G1oTWB77pRyK19GkF9y0JTc2S4ofIz0Os8H+TLP9NJthH1O5IJX5AOL5
         naVwG5XJzQSxQgYOJ2lKVnivL3+dtVsuXDcE1TqT4jw+WXUDMC3oSYgSdJYXWwcDBDg5
         l0vhl/Ozl5n2wi4MF0827C8dfNJtX6U5VONtrUegzVnq2Lt0hBh42Q5KGK56Et30gRE6
         3xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495636; x=1795100436;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yYqy1tuA0FyJjrVSCVgV+Doj8Jl7Ml/5bTTP3YOpXU=;
        b=EPkuFghEHvIpbNth89khpTy+rj4okxIJFUNHhv4Ud5xaiSDMNhOJ/sg/ybwBgZ37fm
         Ylk9yrH98CNzyk4DLgt3Q3/yatSuQcjrf0giCQwQLMzZCy5+H+g8/6i1L7NlhED0aznU
         BIRn7Maj5wa1/OxcNWI8I+hwt7H/KBaXv6Prkc1WcXbtc5e95y76UYhaD9YBvZt4NK0U
         kTbNoIUFd2bEsgjifpllQxXfMuZGGLEn3AnomPmNof6vNyefgn35D0SOMCF1TKAfZV1i
         WCfGTTnbW4Qt2vktAIIra3bc/7KO0pqKfYDhZyTjOl3lCMhg06cJZmyTKdcYP3sxx3K8
         xsZg==
X-Forwarded-Encrypted: i=1; AL+hErFGe93iRl8ZylWs7+QHNNP3idhPpquZ30EuRaiwLt+JIIh8p0zn4GKAIdAeS86pclnMYI5f7ZBnTgLdkC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y9vPEkR1PfTS5oLZ/L2WvpSXnzcjfXumrREy+2v/jeewkgqwW
	6jhP3BvgkL+FtbH1qcG4Skc9neWzF/AJpNKHs3OfIoS5ex7XBcEosxKpC0yDBq+fmSc=
X-Gm-Gg: AYBFou3J8KNlGWj7HkyH91R5gT1vPus5fnOL16jbHWAw0ZRMeo8+VQyaxFaHxhBm+fJ
	fLsF1Q70YBRC81p7AR+BBm5dlu0eRNhCFO8kCPfTWp/2tNyJdnexEpUo8b7w6wDC4r6on8GAFTn
	UCBQkpMbtfPemqvN1gc/bgpwu79DTOVzsUhumH6o7Z7GGKqsvZKrzx9rX99KbYNaCgsQxC1TvWd
	IRiXwdKJ5CsRj6H4pjgmnjQX6LMXUoqoBkaQJYMzA2I8k23ClBY4qYZ0CD1+MM64wzgwYqPOZAy
	z/3ADNaV+RjbNRdljv5EEcnPJFefhc//jZvXaHxN5N+s93xttL6Dy23YkipQO6ri4GWFwPyQ3DM
	rYQOkFsbdGUQyuD/Xnu9tuS8EpnY9Hn82niYwRQug2K113bydq5lc7/w5JWjc57vwT49MUjSQOQ
	K9+VQUjlVLoRk1efc9qgypjNNW+2PEZaeNpPEbFesf9EsMUnNalFcCSCtyxeAcW/Soms8E2orqT
	OTI/Kpla2m5Yd+Qpgb3CXI/nYDXGUzeyJBJfNSxlBgrVSrnhcNqG2oTDFRTk+vfbqC+Sgqeq5XT
	gBsMigAxoTxFd6eDu0FALSbfPPX6650uhawq8S9VJ8qsaRZIvq6sa5PnGjWUy0s8ZYIZSvPmxzw
	wLLmezvPqJnSQ98aGtfCxphlYb4mW/o8=
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr2759606e0c.2.1794495636101;
        Thu, 12 Nov 2026 07:00:36 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3243e30fsm81430e0c.9.2026.11.12.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:00:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 10:00:34 -0500
Message-Id: <DMTBM1N2LO8K.2LXV0IVP9ZSI@soleen.com>
Cc: "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Chen Pei" <cp0613@linux.alibaba.com>, "George
 Guo" <guodongtai@kylinos.cn>, "Kexin Liu" <liukexin@kylinos.cn>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Sourabh Jain" <sourabhjain@linux.ibm.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH v3 5/5] kho: docs: update description of bootmem regions
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush
 Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>

On Thu Nov 12, 2026 at 5:38 AM EST, Mike Rapoport (Microsoft) wrote:
> The description of the boot memory regions does not mention the low
> memory region and claims there is always a region per node plus a global
> region, while the low memory and the global regions are not allocated
> when they would be empty.
>
> List all types of the boot memory regions and describe when they are not
> allocated.
>
> While on it, fix grammar and split the description of the regions size
> and of the CMA usage into separate paragraphs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  Documentation/core-api/kho/index.rst | 31 ++++++++++++++++++++----------=
-
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-ap=
i/kho/index.rst
> index e78a2bbe2be1d..ce2bf9cf66514 100644
> --- a/Documentation/core-api/kho/index.rst
> +++ b/Documentation/core-api/kho/index.rst
> @@ -52,17 +52,26 @@ allocations before during boot up to the initializati=
on of the page allocator.
> =20
>  We guarantee that we always have such regions through the boot memory re=
gions:
>  On first boot KHO allocates several physically contiguous memory regions=
. Since
> -after kexec these regions will be used by early memory allocations, ther=
e is a
> -boot memory region per NUMA node plus a boot memory region to satisfy
> -allocations requests that do not require particular NUMA node assignment=
. By
> -default, size of the boot memory region is calculated based on amount of=
 memory
> -allocated during boot. The ``kho_bootmem`` kernel command line option ma=
y be
> -used to explicitly define size of the boot memory regions. The boot memo=
ry
> -regions are declared as CMA when page allocator is initialized so that t=
heir
> -memory can be used during system lifetime. CMA gives us the guarantee th=
at no
> -handover pages land in that region, because handover pages must be at a =
static
> -physical memory location and CMA enforces that only movable pages can be=
 located
> -inside.
> +after kexec these regions will be used by early memory allocations, ther=
e are
> +several types of such regions to ensure that all boot-time allocations w=
ork:
> +
> +* a low memory region for allocations below ``ARCH_LOW_ADDRESS_LIMIT``
> +* a region per NUMA node
> +* a global region for allocations that do not require a particular NUMA =
node
> +
> +Regions that would be empty are not allocated. For example, there is no =
low
> +memory region when ``ARCH_LOW_ADDRESS_LIMIT`` covers all memory, and the=
re is
> +no global region when ``CONFIG_NUMA`` is disabled.
> +
> +By default, the size of the boot memory regions is calculated based on t=
he
> +amount of memory allocated during boot. The ``kho_bootmem`` kernel comma=
nd line
> +option may be used to explicitly define the size of the boot memory regi=
ons.
> +
> +The boot memory regions are declared as CMA when the page allocator is
> +initialized so that their memory can be used during system lifetime. CMA=
 gives
> +us the guarantee that no handover pages land in that region, because han=
dover
> +pages must be at a static physical memory location and CMA enforces that=
 only
> +movable pages can be located inside.
> =20
>  After KHO kexec, we ignore the ``kho_bootmem`` kernel command line optio=
n and
>  instead reuse the exact same region that was originally allocated. This =
allows

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>=20

--=20
Pasha

