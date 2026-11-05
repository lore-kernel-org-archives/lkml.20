Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793900832;
	b=HkwUwXZxlJKZYTtqcxsjAsU6xmQT8No8Uz3lFdnP/VhD1mwuILs61wPdVLLF5B216PGf
	 jZxhS1YXWbfjil2gWyCdhdLMBCorqbNwMnZtRMwf/in5WaWdALUbgNhDevsJjJSQWcMSY
	 S8AwHxzqIxETglO6aAIeWnm3rUPnC3aorbD93EKtcLGeBnuVPvTZwtiYjYW34BNIQKrqL
	 ZGLl9rLATicqYXQdzMMP/LkKWLjQuCALCd2UfiUtUMYnVannKBLTgwTIDG2BqjDIdpBT1
	 2xrJcVwpgYGfAJKVJI7r0L3nVhTflzQZilsduSkTSY6GgjFeS67b8G8fO+n3tfST4mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t7CVsHNeSf8tfZg5LWh+qjeeCQrrxtUufcT7wYfpMs4=;
	b=2ivvv09RWDpN2aBbc7hNK6CzidFjZTDpo3Ri9UICmOlFVmhfK8jshLOVP2h9kh553wEU
	 IXiB2oTvsXhpn/gL7SwStjlQgkqrPtI1C9gR60RIksteqoS6w5y3iwo6QxW+DIgWd0spg
	 8NBs+yIZ19+mqcJyxwxDQhVzUTBrhryVEBbovjfHns+RibxMLS2blibOaV82tU1YGBMq9
	 KQpG6VHsygCFODYVdoAOqsmPdQy5ZGqphY/v4SANVnvXlW3/C2iEA7dVK16Y7ckpKOj/r
	 5RjVNkHNkKVbHjGA9Wxcuj86BfahsbKHRc6dUrOs89qRKYq/b28TF6pCpO2YQB8YQZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n20cIjhu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DEC606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DEC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n20cIjhu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso65e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793900830; cv=none;
        d=google.com; s=arc-20260327;
        b=KHqoG/eZ51YOSAmJGFA0JPHKIhOG4XKIth4t9WbG824VNIK5SvZqpvhkHsojLQZxwo
         iyi8n6Tb/M1PZYMAXVAZhbu9UZ8QxzI0ceFHrYj/VOxtNDSVZ8a3B+RiyvZ1ie4oTk1/
         JrgJOcKxSxwEUIlQBp1T174gQFfN2A1YErhHHUDejPye4rZVkmXD0NZYq59wz4FD4MAo
         8ItwUc49FipiYxMYWQfnaKDa1+RlOC5HJh2TI4uUo9UzHO3N3gRbJ/joyec9tK2gWTfy
         wtTiDcZv5qThFxOnKIIMOwbrOBYrtYVgOXu2QtLwE9I34i+khcC1VIcyIB0S4+lr3Uw9
         3bUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7CVsHNeSf8tfZg5LWh+qjeeCQrrxtUufcT7wYfpMs4=;
        fh=5WnEabUlCFwtGbmZsuts9q0UCe7OaMs6s0ijWEx6Bco=;
        b=bOTEgfUJF/K0u0D9CgTpfeM+J+DjtEOggKifUlTaf0sqLOw9xu7eP94AoN+fBOeYWf
         +idrIazV96KqtFuplEcOxEUVDhi1vd9Dx3vC539MkGwTJXC3zbPT8ZdaCMZGIUfAP/Xu
         HOcbGvAf8KQlu3xGt5+rWJ/HNyB0nKWz+qGUBcDM+zjywCYg56BeipAlxCQKZpMV0/xF
         d4Xw1hQsecjQGGc1/5+xi7aVncM5qSdBZjiJIw7xNwAaVTxeKnM3CD3fkzShshZEL18D
         XtpESFVIvezTsUiAG3T/Mt+OjwSPud9nWQOuhlz799sCYmnpTDgx+F26l4ZIl2Wj7twH
         Tp6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793900830; x=1794505630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7CVsHNeSf8tfZg5LWh+qjeeCQrrxtUufcT7wYfpMs4=;
        b=n20cIjhuKKYdNbf9d6v8QfyQYTo9ylVgVepwOH2mUa0fCR7yZDJX90xYl1S7BrXCfm
         of6BHj2apafM4KnYlHWS+7YzcPEHxuPX/EzjafJz3q9cf/UPTFlPu/X8oteMPYdhGrmI
         mViOjlmoqZAgYLUqNpJtOd2P6mY59dgvtr6z6dZcPIV561/kwARvKCYOV35wbHBQ/J7X
         5KCw9MuTMYBNPTfs7xRkrs0nXB8zLDSbNhl498fF4tSqLkXv9lzgRpyFVEm8/th9m8Vu
         BtRQ7BjkJ803271UKjJNDaT4ScGVzdCx+iCkPt40RR+gYrYd/iTdDIQU6Iw+TSe1BfxQ
         7rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900830; x=1794505630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7CVsHNeSf8tfZg5LWh+qjeeCQrrxtUufcT7wYfpMs4=;
        b=axtrwz3j8WvYN3cizPmW3hvLZTVBshcHxkHn7IkMfr86RmhUsjeyZT87/Y9CQ12Z21
         iUP2TusaPkmAiqKVrcYqNVC/dYpKPM7cx6NE6yM3ZuQ+LqaFY7Ug9R28vnOXLJw2RMkR
         pK+RpfZw96hvbmpKsEZimrI5ajBMMofhA/rJUKI0zgkJxYfEKxDFvU/hSldOu9WbjELo
         Uh9M65ay4XeVzakjpoBdfKurVrOuLgeU/93W8aTi+Rl2WYa//CXRQzZ4eMjdHJ9AE1B0
         s+Da1xLJoN0oFplE/rm7ZmAbPbmB/akeI4KTW4NyMKrFydWdQbdJBVcZ1Qyl377o9my5
         GyRw==
X-Forwarded-Encrypted: i=1; AKwUvBzbkTLHZUv5dRr1Uq3g0RGBt5iTjzuaN84c0lVRZDA9gN1JHxgPNXHmrDDc9QzvUI22tKbzqhZ64HBvAlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x7aVj0IlHN/Q5+CXAGjIz4BVbpbMyp9ToVgi3+NAeFkBiDOKU
	SIih0K6bxW+c9tMGdsymy1TeMaEyT3z+IhMJqWzeYHKfNyMaOHYBjRYmw2QfL1B6MOLy/qGB8rZ
	TKsZRVGFK3MxhUVgJEVHAIDLmGZnkm/7jKHR5aagIij+kK+nf+4zVhobXLYY=
X-Gm-Gg: AYBFou3cPjcUksu7gc/W69tF/vwq28xZ1vnfbmhkW1S2b7bUIEOjx18g/vhBE6yHjzR
	TtszoPFcpaan2fdLTB98iCUzmhbmo3S/Jq0sS0T9RPT3DHMzBRu/rCzOhbQ/88LZrcvrwgf0vJ/
	/Zt5HVIU9JkswbhqDxWYaNyDELWmi+YYBCecX5fkFU/Yag0V+3G4An0OeuqRW+wL1wH9idYU7dQ
	d51Mk/Tbx35sU2655ranmfdTEPpqeqWnHUR8WErv+XttsDIsttOwp3HQehYfe+2ZrOC8lUNj1Y+
	4jOa7GHbdytWJfsums2ZPOoVaF3mwNRB0V2rYjyCGHxWwISXWUlNuCFdg0I7WH1BZ9EuElGI+Q2
	Fqlxf9roG1+jYC9YNPRE91EcNk6V1p/UUF6TItfWoW9BjPzKOEIO4FT6SmfY+Tp4zO5yC
X-Received: by 2002:a05:600d:4441:20b0:4a1:98b1:1de9 with SMTP id
 5b1f17b1804b1-4b59672bca5mr659135e9.13.1793900830268; Thu, 05 Nov 2026
 09:47:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105020324.2011790-1-mkbund@amazon.com>
In-Reply-To: <20261105020324.2011790-1-mkbund@amazon.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 5 Nov 2026 09:46:58 -0800
X-Gm-Features: AclHuK_j4wCRIwrIm4OfRctJi3UAwMmRbwXOunnldIs9qbpBDveUjPWb7R2WdPY
Message-ID: <CACw3F50bfsm0pZoEYL=y_9yiQ2XEQTjCE=496D-=MJbRnXGhQQ@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb: add htlb_dissolve vmstat event
To: Mark Bundschuh <mkbund@amazon.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:03=E2=80=AFPM Mark Bundschuh <mkbund@amazon.com> w=
rote:
>
> Memory offline and memory failure handling dissolve free hugetlb folios
> and lower nr_hugepages. Nothing records this, so when the pool shrinks
> it is hard to tell whether that or a write to nr_hugepages caused it.
>
> Add an htlb_dissolve event, counted for each folio that
> dissolve_free_hugetlb_folio() frees.
>
> Signed-off-by: Mark Bundschuh <mkbund@amazon.com>
> ---
>  include/linux/vm_event_item.h | 1 +
>  mm/hugetlb.c                  | 1 +
>  mm/vmstat.c                   | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.=
h
> index 2628ccda076a..822fe862e5b3 100644
> --- a/include/linux/vm_event_item.h
> +++ b/include/linux/vm_event_item.h
> @@ -71,6 +71,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
>  #endif
>  #ifdef CONFIG_HUGETLB_PAGE
>                 HTLB_BUDDY_PGALLOC, HTLB_BUDDY_PGALLOC_FAIL,
> +               HTLB_DISSOLVE,
>  #endif
>  #ifdef CONFIG_CMA
>                 CMA_ALLOC_SUCCESS,
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index da5d04edf7c1..7c79523b2a3c 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2047,6 +2047,7 @@ int dissolve_free_hugetlb_folio(struct folio *folio=
)
>                 }
>
>                 update_and_free_hugetlb_folio(h, folio, false);
> +               count_vm_event(HTLB_DISSOLVE);

What if update_and_free_hugetlb_folio() failed / bailed out?

>                 return rc;
>         }
>  out:
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index a3e809c57f29..6282eef7074a 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1397,6 +1397,7 @@ const char * const vmstat_text[] =3D {
>  #ifdef CONFIG_HUGETLB_PAGE
>         [I(HTLB_BUDDY_PGALLOC)]                 =3D "htlb_buddy_alloc_suc=
cess",
>         [I(HTLB_BUDDY_PGALLOC_FAIL)]            =3D "htlb_buddy_alloc_fai=
l",
> +       [I(HTLB_DISSOLVE)]                      =3D "htlb_dissolve",
>  #endif
>  #ifdef CONFIG_CMA
>         [I(CMA_ALLOC_SUCCESS)]                  =3D "cma_alloc_success",
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> --
> 2.50.1
>
>
