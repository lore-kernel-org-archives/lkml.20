Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930232;
	b=lzSDPu0Jtl8xJ3wXEqyLY2pkX89Vpga+iI6te0SGrug9hiXeHVPjqRcgEbvavl85dxpt
	 Bp976QbffqV8m+iPPZpC55/uBO1LG+IBnUkxHCZTvuR8jZ68YtLUTrrHYhfA/YeFkZY/4
	 T8lOQz/kyLXs3+1zLj78vHWHbr5BfQ0dHHANupCcWUVW/1iWe3SlBeYFuFkLIHz1MS7B9
	 F2xmgL5vUe0dkflb93g7ZDqZa6WLp0mm90EmZA6/t/3SjZKTy6/I58vzDllltGoKD6AkL
	 MPEB1md/raO6hDOYht10K9ERXI19xxfqEaW3PeOG/uUiJZT/e5jO7pELGtGTTQ4PBZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Wd1stQW0PnAi11G70cjVexCVdL0BocGOfoLmEtZFQiM=;
	b=YdWIqVEdSjFupGF5Q1xgAQGhbvf0fuw5ktK+Dciwb8uwPGN6pUExS4gPEbQpij4EZch7
	 /lmXlIGkN7chpZG8zXdvcc18ImeWtqRZxA1D4EHJZI6ZvBj4lCx8R2zjy8pZO4DM7Ej/O
	 DpuyMLsh215ftysHnkD27g2R/dQk3k3nyP0OUtYNnjShEjBB6I+xU9rqj3uQY9SehU/WL
	 rzk7feo/LTRCk2KxoJeUoYjbRk65m1sQlK9H0XIUo9wkzV0Htgo99dBHVWMLldVr/1lN3
	 K22xX9SOY2ipbYwgZ2Y93k1uMjJsg8+zrd8I4BzkixZY7hldv35aAYKrWNw8uGOlPFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ODHK5hx+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001D606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2001D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ODHK5hx+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31915e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794930230; x=1795535030; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wd1stQW0PnAi11G70cjVexCVdL0BocGOfoLmEtZFQiM=;
        b=ODHK5hx+CJtmtLLRX9383lNNMFawi9iv9cvkjFR+rdOwyyvJedpqLeXMOxleYJuw3q
         gu/tHsFeimW6HYfsF9dmqVesit7SL+ADMo/MQDoHeL2NjKYV0WJLXuDbEPgop54jTwF0
         jmOJTMC+mx8xLm7u8uNmUv9rwf9jlV9hgpCgq5J7BJMpQzKtaJhTqyS1RGxYXRJikPiH
         MbrHJxHBHda9Z+92/MZwgR2HIB6vK7Mmnr6BAOH4xwhjDPdbO09n/gx7vzHKBYZbeSvW
         H9MLH7n7C0A+6kjnPtGh1HVgt9UOayqImdWlqsaxzpAfjnwUJ8mt0jbQdalCSgKSj7m3
         oWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930230; x=1795535030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wd1stQW0PnAi11G70cjVexCVdL0BocGOfoLmEtZFQiM=;
        b=p1RmZB/ymu2lHPxfpMRCJ8rgsQ+SmJ5N5v9rwhuBSvRhRQZaKu+znCFowhMwBCYBrF
         BMHL2o1vlwLY3gg4NRGjWB/jqCk9EsC+AXHHtsqeEUWWyUfCm14KoNAnRM90Bmg+ULJR
         z4neVHKoRumyeCple7GzldpiC5LKL9luPN2v17yNLo9mgK/WgfbtZ5UEnTsCSoPEyQh6
         m1w8RbJwIF/wqtW7bA01Wvf7d8PXF12F6P01GnqmSDfy07QNwwSePHxq+CLqRr6p6CMO
         mA9Lfe59ajFBUg/ZzbgMrC+wBDNqFKSu6AiXdbflUpeyVtOZAH1bxHummIUeA8pacuwT
         gEXQ==
X-Forwarded-Encrypted: i=1; AL+hErE+UXEcTtjZ98HiIvu7QwV7CkLgHX/tLexaYOYGOK8mk9b8NS1EqYb/CYgrNDjkGPA3AhWcqG1LolzrJPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U3xnWcbZFstwozsejXa9RrH8JrHrPGLQ1/IfrMSzPDlUhq1YS
	hHF6LZs1l4+7shiokRvVg8pKm9YroUiGOLiGxw0h97JrSNymEYPPnNdXefH31NjlSA==
X-Gm-Gg: AYBFou2/LGeZM2hAgOCSn3QvOjuyIP4vbcwIUXADk4bFQ+8mrTECTX+7uPJGeu/9lBF
	vNFtFtiRSfVvn8sPuVyDQFK1fbYbUmdrs69z0GNSsWb1GHaRBbmQ34ctS3LnoMdmeUlNQZWynMy
	N2TjdBpq3W02YMS4pyCpJaTL2CZ0ufwXOjFYPtLsviEJSxfPN0U6c5+RTEDOBSHCMBRVO+wazM9
	QHe72XLpNvXVWrK3ILDNDlNuWfBkh9bN/Dk7oyQQKFcF7cdyNqUq0yed5KlUsM+kBE1J3qppJux
	zBrkxUpTtZISaWKsJqM8BNDKQ/Hz9ausTgW9m2r0cXANuYzYeKY0Gx3QloKmVXXloXFvPWUnzRe
	rXxAv9CCGjN8N6sTwtQ4aOCFH09PvQfNukd4Gdz5kdZaNhxSTNC8FEwpGDTsxYIKDYtBVjv0S4Q
	Di/8fF5FdMPtCU1sysvuQGkINfXp3olI/YZ86cYGhO7jd8dIhT/DCrbzwXBMt0cFFHkbi02uc/e
	jfkvG9JAalWpsPUL1ylQ1zbyAP0ht5dCe+rfAP1XqipVQXAMAryPUO5Y3FFcPjYbPqAfFrwjpLa
	yxWRaqVgte3jETzKoMSN6PXobSKzqjUEW+qD1GEQwW0A2r4liHsLa3COAqTx
X-Received: by 2002:a05:600c:c166:b0:4ba:6d8:df8f with SMTP id 5b1f17b1804b1-4bb55a832c0mr330308195e9.15.1794930229860;
        Tue, 17 Nov 2026 07:43:49 -0800 (PST)
Received: from google.com ([2a00:79e0:288a:8:12e4:4602:d8d8:3043])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm265535875e9.3.2026.11.17.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:43:49 -0800 (PST)
Date: Tue, 17 Nov 2026 16:43:43 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Ada Smith <adasmithgt@gmail.com>, Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 4/6] landlock: Mediate CAP_SYS_ADMIN for the admin
 memory reserve
Message-ID: <avx2Lzzv-i9KrKFO@google.com>
References: <20261117101157.2520463-1-mic@digikod.net>
 <20261117101157.2520463-5-mic@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117101157.2520463-5-mic@digikod.net>

On Tue, Nov 17, 2026 at 11:11:54AM +0100, Mickaël Salaün wrote:
> With vm.overcommit_memory set to 2, __vm_enough_memory() keeps the
> vm.admin_reserve_kbytes reserve for callers whose LSMs all agree that
> they hold CAP_SYS_ADMIN.  cap_vm_enough_memory() checks it with
> cap_capable(), so a process in a domain that denies CAP_SYS_ADMIN could
> still use this reserve, which is meant to let an administrator recover
> from memory exhaustion.
> 
> Add a Landlock vm_enough_memory hook that withholds the reserve when the
> domain denies CAP_SYS_ADMIN.  Like commoncap and SELinux, do not audit
> this check: it only selects a limit, it runs for every accounted
> mapping, and withholding the reserve can only make an allocation fail
> with -ENOMEM.  As with the previous hooks, LSMs implement their own
> policy in this hook: SELinux already checks CAP_SYS_ADMIN in its own
> vm_enough_memory hook, so making commoncap call security_capable() would
> make SELinux check it twice.
> 
> Cc: Günther Noack <gnoack@google.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Serge Hallyn <serge@hallyn.com>
> Acked-by: Serge Hallyn (AMD) <sergeh@kernel.org>
> Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
> 
> Changes since v1:
> https://patch.msgid.link/20261110202436.2408244-5-mic@digikod.net
> - Add Serge Hallyn's Acked-by.
> ---
>  security/landlock/cap.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/security/landlock/cap.c b/security/landlock/cap.c
> index c89e8d76db8c..c9a900888f3b 100644
> --- a/security/landlock/cap.c
> +++ b/security/landlock/cap.c
> @@ -140,10 +140,32 @@ static int hook_mmap_addr(unsigned long addr)
>  	return check_cap(current_cred(), CAP_SYS_RAWIO, CAP_OPT_NONE);
>  }
>  
> +/**
> + * hook_vm_enough_memory - Restrict the admin memory reserve
> + *
> + * @mm: Address space being charged (unused).
> + * @pages: Number of pages being charged (unused).
> + *
> + * cap_vm_enough_memory() lets CAP_SYS_ADMIN use the vm.admin_reserve_kbytes
> + * reserve, but calls cap_capable() directly, which skips hook_capable().  Check
> + * the same capability against the domain.  commoncap runs first, so this only
> + * sees tasks that commoncap let use the reserve.  Like commoncap, do not log
> + * denials: this only selects a memory limit.
> + *
> + * Return: 0 if the domain does not withhold the reserve, -EPERM if
> + * CAP_SYS_ADMIN use is denied.  An error does not fail the allocation by
> + * itself, but without the reserve, the allocation may fail with -ENOMEM.
> + */
> +static int hook_vm_enough_memory(struct mm_struct *mm, long pages)
> +{
> +	return check_cap(current_cred(), CAP_SYS_ADMIN, CAP_OPT_NOAUDIT);
> +}
> +
>  static struct security_hook_list landlock_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(capable, hook_capable),
>  	LSM_HOOK_INIT(capset, hook_capset),
>  	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
> +	LSM_HOOK_INIT(vm_enough_memory, hook_vm_enough_memory),
>  };
>  
>  __init void landlock_add_cap_hooks(void)
> -- 
> 2.56.0
> 

Reviewed-by: Günther Noack <gnoack@google.com>
