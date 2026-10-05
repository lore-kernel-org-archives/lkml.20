Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB4F41D10D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791243460; cv=none; b=meoR5AnqxVXd4tA9u+HHMkKAk7GhGJ9JmidtlBjXKxMQiy7uRoS02cByyFMbSCw3RMT/X1E4DtUyOEnRVWhjRi+ZND8t0gEIO2+ovT2mlvi33MaUqeyx9LlxnpY7U4AFenF0XtXCjGUWoFu3LUKUkzKdfU5yUFlTBf8RF5DC9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791243460; c=relaxed/simple;
	bh=C7gbci83GD+t9Huu16iGSHml008dP62awDJLoswA3s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vs6A0E9EdMppHzRzNqMSHsega73MqU9nxUUevPNM6WiU3JMdPM/Upp3T4MRYF8lHcODXPAXjBoSvlgOzXpyHnQA3lDE61xwYuhBBthEEsaK5OsAPiRHlyZKKbEsS2lfumOVFz5hKp7Ry966/VKTeajQGqnUJop81iFZmTtJBsQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=AC0xIYIe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AC0xIYIe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso13638695e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791243457; x=1791848257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/tHJXYEmrDPsmKmiT0kZDlKzYZtfAGjKXPf1jJKMEU=;
        b=AC0xIYIegX1QOd8KmwEYpn06C3gOaZy2zHbvC3Igtv88yUqzu/Fb2LFWdMOpibqjbi
         9UdCY/yll2hX5jjJhlp1l6Lws2MBzCoyeamxO2z+wd5rGBW4OGk6co15bgIMqZq8ouqL
         wjXQ5qaQi0I2dWjhircE2LGVZShnm0JePz3i43ylz0OI0EiqevJ1JUbJv06O6ZcuibAw
         HKtw2R8iQjTmW4UNYbwuRoL6f3ehUuiZf8dpN2F+25zG6f+ePH4F8g6hg2dl9AbejIH2
         sOZBqOnDr4T4WLSgpKBMyBoBc8obH6hnNlZYkXTb2KNswOpYLgnjDjWBfoXgXBRaUSqg
         l84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791243457; x=1791848257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/tHJXYEmrDPsmKmiT0kZDlKzYZtfAGjKXPf1jJKMEU=;
        b=Fx5zEhoaCP7LfBa3Na1AipziqZWQaLSpsclr0/T3U4XtGpD/toahTUQdViNBn+/s1E
         cvnWGoOEh5ciP/rv9xNshejCcIxS2uJkLg4Of10kqj1vAGfjpaIbhbUQIG0NvMx64VHl
         UHvj2CFgN1gtsug/Aegav/+vgre6D9wPmExZru3zhdKTBF4MMita9D2SWJMSH8IThcEw
         RoZcoZokTximpjHhpCZ14yENoX/b7vEVaYqqdY1XffpveX5wSH0EiitZfUPA1HUXWZZn
         +Fl+DkHIltrbK/dNbaSqdZMHa6m7eZQ6L6yMss3Z10tzTAd8gBd0td+n58URmYX/YV7i
         Fviw==
X-Forwarded-Encrypted: i=1; AKwUvBzaKLWo1ENMDhHtnkfn+uwsyyDce/h6mbTrCE+gbvvuk6Useb61ml1aLhSf6KcGbK+X6u2qprzFJ9O1f0g=@vger.kernel.org
X-Gm-Message-State: AFuF++k1F9XLNpFkHGS1jT2VlqFANNM0wSzGA5JRQugh7ikL6iZZqutJ
	SOJ2Pk4q5fBsXBEO3bKmqTgXRvyUyadyzQiGqaclvVbc9oniNqxPuvPH1CFR53hiB7U=
X-Gm-Gg: AYBFou0XaNI1DLFvRUlCuk5O3Rybubjx9GVdRgyCdVYnZOn7bBIZRHLJp65u0hEsD3p
	8uiVRlGk1Fec10yYAyC7T191A+2FualyN/PKo18H2wETUf5xWzb5gfRbYRsDs5dHN7CcOQ0AdO+
	lWuqG03uXyqYw1a+mROOC8S4FrpjDdhUh2oI8oNkRW7fFUxdGzfNo5JBH1Wom8tAGjd9dYBU4+I
	waA+sIBGZuT4FR2mwqYEpywzf4hVphoqLK8aVYVXT7vacrcHG8CTV2y/xskqI61C0E6l6TVDWmy
	QJkJdcDQ8iXnvS1+lubXJyKPM3ZlTjD0P4IffYBTo9W6PsEOnjC6AAu6gb7Q8Ipe3Ib51/DAmn8
	DlHyj3qdkF0jJKGtpzYzUW5eR3y5vwCcNzDvpkcdxFoxnMAdKK7uh0WDuQVV+Eo/l7HjKDF3QpJ
	zy3khttB7BLbBujUMV8p2zzyM75ZIo0ayDFT0Z/DRvCQWTVmQGXnM9+qEI+WHyjVucWsKRDTbT9
	AadcRs4HcnuFe+Yz08LYSc=
X-Received: by 2002:a05:600c:3b01:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a1680ed179mr129727315e9.22.1791243456729;
        Mon, 05 Oct 2026 16:37:36 -0700 (PDT)
Received: from [100.64.0.1] ([147.161.130.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db0929sm24701835e9.12.2026.10.05.16.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:37:36 -0700 (PDT)
Message-ID: <a25d01cd-e21d-4e51-9d24-6cc41589c041@sifive.com>
Date: Tue, 6 Oct 2026 01:37:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: futex: untag the user pointer before the atomic
 access
To: Ziyi Guo <guoziyi114@gmail.com>, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: thecharlesjenkins@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261001184355.2395068-1-guoziyi114@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20261001184355.2395068-1-guoziyi114@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-10-01 8:43 PM, Ziyi Guo wrote:
> access_ok() checks untagged_addr(uaddr), but arch_futex_atomic_op_inuser()
> and futex_atomic_cmpxchg_inatomic() hand the raw uaddr to the inline asm
> amoswap/amoadd/.../lr.w+sc.w through the "+m" (*uaddr) operand.  When the
> tagged address ABI is enabled (CONFIG_RISCV_ISA_SUPM, prctl
> PR_SET_TAGGED_ADDR_CTRL with PMLEN != 0), those two addresses differ: a
> user pointer whose top PMLEN bits hold a tag passes access_ok() after
> untagging, but the atomic is then performed on the still-tagged raw
> address.
> 
> Supervisor-mode data accesses are not subject to the U-mode pointer
> masking (that is governed by menvcfg.PMM, which the kernel does not set),
> so hardware does not strip the tag for the kernel's own access.  With
> Sv57 and PMLEN=16 the tag bits overlap the canonical-address bits, so a
> tagged pointer can name a canonical kernel virtual address (e.g. in the
> linear map) whose untagged form is a valid user address.  An unprivileged

Thankfully, the combination Sv57 + PMLEN=16 is unlikely to be in use because the
address bit overlap tends to create performance problems.

> process can thus make FUTEX_WAKE_OP perform an atomic read-modify-write on
> an arbitrary kernel address, with the matching FUTEX_OP_CMP_* result
> serving as a read oracle.
> 
> get_user()/put_user()/raw_copy_{to,from}_user() already untag the pointer
> after the access_ok() check; do the same in the futex helpers so the
> atomic operates on the address that was actually validated.

> Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
> Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
> ---
>  arch/riscv/include/asm/futex.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index 90c86b115e00..8d80e580eec5 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -40,6 +40,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>  
>  	if (!access_ok(uaddr, sizeof(u32)))
>  		return -EFAULT;
> +	uaddr = untagged_addr(uaddr);   /* FIX: operate on the checked address */
>  
>  	switch (op) {
>  	case FUTEX_OP_SET:
> @@ -82,6 +83,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>  
>  	if (!access_ok(uaddr, sizeof(u32)))
>  		return -EFAULT;
> +	uaddr = untagged_addr(uaddr);   /* FIX: operate on the checked address */

The comments are not necessary. The reason for the change is in the commit log.
With them removed:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  
>  	__enable_user_access();
>  	__asm__ __volatile__ (

