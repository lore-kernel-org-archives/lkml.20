Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7341685A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788342146; cv=pass; b=c/D/Nl2ZHJ6KQ8Dcv50Tk/ktY9uj0bP9+hXAWf3MdH/SVQCDPFVHXWaMQTs62dfmT0QiJBwQ6aqzBsqcztdwtZgKgDyFLSelyGsBM8uIa4Pyonfkjn6spF6cyQhd5E0+iugY6e4jcyayjKk//y4qgJyiOn+NWwou1zva9UaZuAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788342146; c=relaxed/simple;
	bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsJiuUED3kvzN/VwTB+eEc1vKeDYymvX6a6BL0YnTjqKl9ZEMNRLCGf+rIcKMBvHfKn5Mk/zjeas9ABIaF0t1jB54MbNYiFItB7SSQTYTt9QLBEyG0MAynnW2KuwD7qVZopXzsnVEqz3DUIZmlxW3u4+f03aPaKc4UsClMX4ODo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rcX9zH2I; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcX9zH2I"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1551708a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788342143; cv=none;
        d=google.com; s=arc-20260327;
        b=ZP7KCYsM4PRVvJ74RNg7IxYH07/ylE3kCzVKN4aM8Yb+1eV98hHikstSTOAKDPjkKt
         DeznuAABj3ayDXiNQjjFR+VQtl1al2sTK6aVkhmLFUXWP1OlqC8BKegcgG5JGUBrU8xY
         8cY21GP3L3b7t6yDIYBCQNtHILz4hKScIGpDxhTxYLjO1D9VLFz8OI09RBQ6ApNgUk7g
         pP1alFWINy7SN+z68gL7QBUvZV2q8nXDb+93TD/m20eaGJBMI4yF53/3sbt6kfMdLycU
         t1FkitPow7tqJhCYs82K2iD1dP/UbBREC1VrXP/NNUPo0SIvjaHvd9CbP3Mn99FcuzhP
         V5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
        fh=0MbfWtPQXawmS4DOzciT+jVUstLleh4OX8Q23fPYMG0=;
        b=i+aUBXcM6XG8VvhmTOqXkT8vUhzko+rL0D3PYY9ZglQgkX6vXmzbwWH/wp6P5tqcKK
         dXXz6loHHnMgNJAvjJe3zo//5DHrcs+lMcnqDzg8Ye6HImXZwCYZi0z1L+W16r1XBdJd
         IskAKtLQiF9h8mvX2sLWqcc+zwvkLmY27Ozdub2JHiAaQ51T0y281ToqMs8gygRtTbUE
         zMFJuPZcrHwAvq2i8W/AiExhEVGRqsHmNxsGnZ+g02kWC3y0iDwLtE4i4Lmwbwj1PTtf
         p1qEtg3KEoqnJCytAw6wEsiL45j3H+DWdjftmX1i/5l94Vs1LX063chDiye/JI0I2I+W
         1a0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788342143; x=1788946943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
        b=rcX9zH2Ifeuk3ERm+Cu9uR2vE+z+gkZJ+VPYM4C5hSit4LJaW2BUYXBRhax1dXPU9Z
         5L6S699yxyKkIsdQSKjyB6qDkATkJogANVwsGMCp6bzDkOVsFhpSVl4bSQDMWowwF50x
         F6P2hhJ91V9x7Tg0RstiJ+l/Qyu+fvOl3GLAEv3Vlflfzkvn6y9Gxne2knmOxgej1U0J
         w5RbGdQQznSCrDeiy/FsrY5SgxTw4A1mkV89X1T6fPhVqr6wGhF2CTwwqZxJH+ifKADg
         JgtwKEKx3gIutTWEj/6ieV8Y+baKj49w50+fzLletTp80xL65L3/a7Nr0P/+jAY9I499
         SENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342143; x=1788946943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZPdm3JlsBSyBiqpPl8P3NLVGhX7z88eUZs7iLPLnDo=;
        b=EYUlll06sNS7C8uiKbXl5Xk4wE0+Su3vS3r3UDR4sjTu0eLscwwG2SPBrjCJJ+t7UW
         fcfmv27SXCqX4ZaOa2L+i55bf0kcwtlJ0yM4kLCQiZmXgvxnM7md6zSnbbnA52tX+Qig
         YGDMyXOHGU4xkBvciBSQFpJZTkjq1Y7twLs9b84GnnBU9JDS+TFFgmpz1chBV/M1DgRF
         ecJFlWi8wo1bRsJst7HOLe1sES5Qo0tBxGhJ4w57WGdfJwv/hvhlz0tD4AVcO+cZJWb9
         8lMlLID0STg9tjjrtudUAfiJRfDoDVes2rZo8oJ5gw9Djkmna9ni3eLu81Ndq/XkTLhU
         5Mbg==
X-Forwarded-Encrypted: i=1; AKwUvBzDethZZrguIxaaGQB6zrjKdy6kQdzWgo+YU4VH4FBBapVuynaOmml2ElH85iSafJ+Jmgjhk4p2pc59cNU=@vger.kernel.org
X-Gm-Message-State: AFuF++l6zJonHkw9pepJybehhxQ1XkHJaqr2tUm220QgW5/IGh3X55mx
	wgBYP2skcq9f80dVP04LP8/zaudXFr1SpM9HmRuCRTZiaxN8+VzI5ZmNADQfMwZHM9n38QQw3lc
	R3R+3KkFsk7pQAKllPUE0gYS4mQICo6s=
X-Gm-Gg: AYBFou3KIyJgQQ2eaP8nFYbeRBTXVJcMGfPCXRTW3WBpN3+Hnhdi2Y2hyVgp2BSH56a
	mvUR6pPek8NLVZaveLRBPdJVonyjBLBmeZGTwPgVsTj+vSnquVDoaiy+LXeeCteTkQviD9M6HDq
	rc9QR+Vp6pYxBTggFQVrAoTJ97WjuGXdKjovj6QPdu6mGxlDmTkHxZ4zaYUgl7trQMvXeVnp1S0
	sNzJKuNEOMaP2Cwcy2mwuAkxP4KJLtEDjIAhrax0zookuX+yw1r4drued0FFFUmOy6hxnOewLJM
	57X7RPGsSRozjnzGOaZEd0GBVb2qw5/cdDh2ziLmhK7q/GMZ8msB0H6FG8Rash80LZxchdl9O2P
	XPRTF5hAYprGVQ2KfDowqvkd2aGNElIE=
X-Received: by 2002:a05:6402:52c9:b0:6a5:ed9e:b4a1 with SMTP id
 4fb4d7f45d1cf-6a6829ad89fmr2344805a12.13.1788342143147; Wed, 02 Sep 2026
 02:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <802e4076e332cb82fcca73d8e22e0a591e44ab45.1788277742.git.mattst88@gmail.com>
In-Reply-To: <802e4076e332cb82fcca73d8e22e0a591e44ab45.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 11:42:11 +0200
X-Gm-Features: AcwNN1WeQg8auXTfAiPp9obWnMyCg_-UrnnazrrKK9k8O-gQb7ik0Xi3Zc4DBbc
Message-ID: <CA+=Fv5QcmifCM7gm18z5sYvZcaexqXsiGQfygTt0=srKhSmPqw@mail.gmail.com>
Subject: Re: [PATCH 13/24] alpha: add ARCH_HAS_PTE_SPECIAL support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Add _PAGE_SPECIAL using bit 19 (0x80000), which is unused in the Alpha
> PTE layout. This enables pte_special()/pte_mkspecial() for marking PTEs
> that are not backed by struct page (VDSO mappings, zero page,
> io_remap_pfn_range, etc.).
>
> Include _PAGE_SPECIAL in _PAGE_CHG_MASK so it is preserved across
> pte_modify() calls.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>

I tested this on an AlphaServer ES40 with
CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy.

A focused anonymous-memory test faulted in 256 shared zero pages,
changed their protections from read-write to read-only and back, and
then wrote to every page to trigger replacement with private COW pages.

The test completed successfully, all data checks passed, and no
page-table or bad-PTE warnings appeared in dmesg.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
