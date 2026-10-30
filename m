Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353514;
	b=gQhOr09LDHvoXRy6x6WOFVcLhpG6AOqhLZaYS8eR6hL8zRnT5Ht3yk10u1PCmY4wLCea
	 G6j/5h2NBaHm4FZpow/RJSYWtAJTK+eJdMtJeNjucHZ+8w352I+4kNKa+uNM3+pWMsRRh
	 TgyGpN35GoMQLJxi5OnWFBi05KoFWE8jm7l7Ho4kcf5Z60BM07F1OYMjp7+1c+zrDNzlB
	 ZmcQR+F+EXDe3SR/zB4kuyNo59SHwEcUi4jbEPquG+PusQaUUj0Mn/CbEgCZyufYVGxNR
	 IEwst/Kf3oqwNDBQf+hEqHCSrMlPO01nVUBjuJ3lVlXQamzMKpSwVMnb9K8KREruyWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353514;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=q8Bp4lvQqYUsZT0k0dArzQOZC6e3m0dIfgAJwvcDsr4=;
	b=0xPzkNjlkGhn6lHJzYaNO+mcJ287YBvOJcqZZjE6EfiL5JPQZVevmrRUtPD4eVlAvzhD
	 Ole6o6kyissvDno0gyOQ5Xfhq2lQxuvC4CIhWRCyIcJC6+CtSc0gDDX6auc50Ax/GT+6x
	 BY4rBEIvlkUQ77gDuJiasqiivmXknhhdIO327F4RCA6B0XRMqMOItkT60qBUCTekyKy8e
	 XRxN//7AAisgyM60ns82XKdtmIBiLKJKG4lna02tMakHo8rBP1V1WzYdK2PRwXLKUCD8k
	 RNpE3B8F7s7jYm3C3aVz09T6Jnb3u40Xa1c23S+kSxfS8ESFHftqCM2dsOFlDbCN+uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A86606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A86606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-85a6c747dc9so1124682a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353513; x=1793958313;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8Bp4lvQqYUsZT0k0dArzQOZC6e3m0dIfgAJwvcDsr4=;
        b=MXn8BcKkrJDb462EVHE0u91FyEsAygjGoRcPjtxH5kmdhAfSf01FT5NBGCD4tvJ3qQ
         RVVseBnyYvq3kvPzXAVvkJCsDzG3sVhwvW5x36ejFbv00vEE8dmUl5JtvrKKrDRl8wHZ
         6kPSgT4dzEkzv3PmnMQQwSlcqLa1fmV26FK8AlJ+Dsb2BRqRDTFVKYDRah5KiP6+Ux23
         oOFpXp/s/kPNbUig9UWsRo8s0hJMC4BwnbRZhevkYq3SbPVv6r4UuyS9ynNdl1ZVKkF4
         /FynAJ7nurXXXWDniS/1NHojOW4GmUTM0VHkQA8KrO8Irgx4kCDdEgPzPKHg9wLtGHHT
         9fZA==
X-Forwarded-Encrypted: i=1; AKwUvBwjQTBAqsimv1fjgq+as97GkcjFcxBnJCBozZtJhfELJ3ul/QCDuJfC3TfkVsDLVFkieAtIunV0/Ixtc44=@vger.kernel.org
X-Gm-Message-State: AFq9FYL45LzQPKA4lSA0RT5SmHRVWA412i5FoHP9d6OfJvVC2yfJe9SA
	JQ5YOAFRbqrQMGbv2I33Rz2xRwbU05cKL6Jn1sEGNYVj++c3ZiQPsirCnw/JKQjI
X-Gm-Gg: AYBFou29YDZPTc0adMRnCXmw+moebiEjHW40Urfh2gTaV9Tw1mlydDWyGzPzAi2hhvK
	Z0w1B/KgP75ptVshBre+ZXRiXUJ2bBIoSrHwzAmyFZeV4NvPOd7I/IKuisFvZI3kk5CPSR7n0eU
	NZ6qi33oufFxegupq5NtNe24hhu5PBM9uInXv0TiVsVUG0wO4C4Y35GFBM4mYiRs50QTp8+UnqG
	+hUW7lrabWORhZNqozxXV8zuzMgNhIg3D66E9jpoAHQlq1adh1KEc6A19FRUDCV+hC2RgOGxmjs
	9W4cg6E/OvWqRjp+xsFPX91d6Pfzyk6pI4liyAUDtC4d7OtDxL6eelpFCxEu/CZNv/gIWuUV07w
	l7O1kv3vH6AwM3u1pGBRj2UhXKBEUhHkTNug4zGX7ul9lyL3QXffwdO1BzUJMHSx6b7DcZqHVBI
	Jt5Wp4Uyu8CbnQQ1fgc1ghyTNl11glHBCn2Xmv35yIi42ubjDsm+qCs5Mp34SGohewwhZeMYzCa
	pzdON9/mumFEHSBdFz+cD2PrqEPrf8Ug45cNVlqVm+rXxL+jIpWilA79RkEQYdFuPHQwyVot7RJ
	uMK8y+0vYzrGQ1g6l0OjP6mWq9P7gY9B92y27H7AOi0mTTHpC2psibNfs4N7KnljTCZUnig=
X-Received: by 2002:a05:6820:7094:20b0:6f4:fb85:5e42 with SMTP id 006d021491bc7-714f29ad113mr554710eaf.21.1793353512863;
        Fri, 30 Oct 2026 02:45:12 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a84854sm1529689eaf.2.2026.10.30.02.45.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:45:12 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b28d9537bcso381033b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:45:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRtlGIaH3y54woOqxl347oPHkruslH5oXMwU3W8jSIh2egihaHZjovS5TEs9gOQwEl5SUo/hlVaup5hMk=@vger.kernel.org
X-Received: by 2002:a05:6102:605a:b0:7ca:8f2d:5c29 with SMTP id
 ada2fe7eead31-7d0542ccab3mr1591386137.27.1793353163338; Fri, 30 Oct 2026
 02:39:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083800.599152-1-songmuchun@bytedance.com> <20261030083800.599152-2-songmuchun@bytedance.com>
In-Reply-To: <20261030083800.599152-2-songmuchun@bytedance.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 10:39:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjr+-4GA=jBNpL3nig6QfQ0Fm8ob+c-OkLADPUJSaNqw@mail.gmail.com>
X-Gm-Features: AclHuK-5feC2ixWlfC3xXKJ1XowEcUrdLUZ-UGAaez_2WzCy_48TVc-7hVrg-7U
Message-ID: <CAMuHMdVjr+-4GA=jBNpL3nig6QfQ0Fm8ob+c-OkLADPUJSaNqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: remove pagetable_dtor_free()
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Alistair Popple <apopple@nvidia.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 09:38, Muchun Song <songmuchun@bytedance.com> wrote:
> pagetable_free() now runs pagetable_dtor() for pages that have gone
> through a page-table constructor, so pagetable_dtor_free() no longer
> provides distinct behavior.
>
> Use pagetable_free() directly at the remaining call sites and remove
> the redundant helper. This keeps the decision to run the destructor in
> the common free path.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/m68k/include/asm/mcf_pgalloc.h |  4 ++--
>  arch/m68k/mm/motorola.c             |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
