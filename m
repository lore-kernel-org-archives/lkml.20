Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006301A38F9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742717; cv=pass; b=lKIr8oB5Wl6lOAMdful1eAVrYPOSXmKI6QEczQxUcSb+0W8kue+bOD01f8kEHTbiYb6eV23+7kDxXhfluVy4MrYnDhcn/AwqoM93NeWT5WLn+1hhI45vCyvLWJEeHmhC6FWiDuK8sn1yWyED1I+RzcxK3vMoFTVJ3mJ0XCitc3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742717; c=relaxed/simple;
	bh=ZANROxcIqhrcevsvLae4ZVF5Yym2xmUzeCsrPwIoUNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHHMZAxKAPWJ5ygzn9VI6JG2dH8NQYv7vBeRdm4hGZmtyuhZv1bnpVQ9K5jtkEKZjTJh5+OQdsnRGBUgdYejESdNR6npieXZWRqhQLkZmX/7AkAulHBEWrYGMNZFBcQfk2iYkpZjSZWrIJ+oBLfnP5Ddbw1B2nGPvfEziyOOBtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oedKKICs; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oedKKICs"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so858114a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789742715; cv=none;
        d=google.com; s=arc-20260327;
        b=mwCnjx1mPyK/FOafc/qWIoxUb3A6QZuMGxoQpC9FxC6GWgAdGvd+cDGaRQBnSSep9t
         pwtyTuXVhJtDLOaSEC51cvin0q39zcUiWpj7PQBesGwHCUat0S+UF/Xte5AeAboTwN0o
         /aZQjE5Rgd+MYhqrhLwLiyk07xGHg+2gqzyvZItuPnmitnWIlrecoELjqRcENDjnN/Bt
         w7OvKI4fGtEIWPRXmyYuy4jAFIS8rXL9uEFa8Gv6Rc5y/gcBtN5oSRrHYHp8viSCegz8
         1/lU7FS/qAUGNiU6Rl3NScmuiAj+LplX7uzS7L4GXslmPJE3oGcltDCKeAkWybQsixsQ
         9XnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i4H1dyn7FKo4Dmb7iVZeE4tq+RQeNUXgtmzy1F1tVUA=;
        fh=cyftAEUB5UmYIx3cl0lLIN4h7TI3U+amhjChNY5hkwM=;
        b=sk/k0xVc1ljdEcX/Z+RwA1dLCSeGUB49WmiPJU4zBLVlzbCjunDVtb/OHMRXUgt7c/
         2j8A0E8brEfKtzLs2m/DIbA2QWbSqQCbT8agg4Yfls7ulUcKaf2OXijD0n6ih9e/FHbx
         5MmunwrUQd3/iKAKwvG7frartq30HeNVsBazLcCQlpE7/HXnS4HyjJJzJHwRWW2xVCpa
         +iTWfGO0pU3tZZvUBgZBS8/pA1ECFLtG+lmxTPUHRUn8mkJRtxktG5Wa4DIZGTGcqg9K
         y5pvP1DcCF3SwLa/ln/1AMIpbQDKTsQTkXx0FU7mUxdvTpqmb4NFiKcqAtHq9duWJ6hn
         jhbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789742715; x=1790347515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4H1dyn7FKo4Dmb7iVZeE4tq+RQeNUXgtmzy1F1tVUA=;
        b=oedKKICsWK7PutLKBn5+39eDODSNDKhpz6MEzZooyF9+H67yIMZ3urfGPt4+Q385HT
         J1KMcWgcuamk6frDPCHJdX5vJMZ9onmqLtvJRWTBVGQJ6/8YeIPKEbBToeQPxlsvJjgZ
         9CdZrudFQzgeq0DZWQY7sARvEessfw0RgEKBo4cPZ8S1MPcgEG8ntr/LsFrPz7awzZDh
         c6/7d+RH1NDft6RcTAPgxy6/VjRrk+AzSJw/V7pMLsoGlGeK9rZkUxeQopPo+4db6rTp
         l3vgibYC5O7ByHiNn047zD0YXb4g/vNQ6wb4Qkj1IFAK+y4QmpOe2gkBtJgcX2MQRGa9
         ygcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742715; x=1790347515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4H1dyn7FKo4Dmb7iVZeE4tq+RQeNUXgtmzy1F1tVUA=;
        b=xptJTYxUCMKWYif5gGpqy76ZS+x1xiithYuDNO/5tdnY0z++h3VlJMvN4+rM7oDhWO
         c39K65r6wQoOlnZIC6uIwNFLjPR0tQ6JdMDNhk9RxeYk7W7nkCJHTIvUUa8kkbEj8KxX
         Uh0oXHVziwN1DaHc7z+C/ahcheV4LkNTI4E6oDtsqbaitPstPZ9HBuvWZ209H31I+nE3
         1TlIaOcjHJUsgARwY/970dUDVTz2YRgFOt8/1rxFgqj8lA3QLrXUFEfZVczEIgPPigY5
         yPv6eZ2STO9G0YbD0mEHakmdPbhy1COeYgjDF45XthZ0tRGfbQ58lJCG+Bx2zj+2gfKR
         Vnjw==
X-Forwarded-Encrypted: i=1; AKwUvBzcKc6ER4rst/M2g0mIlLWy8vAygXXdkN8P+oPPxX2pFhG0D3V2Gb4zDDY+O/eG0Dk/rTw1g6FUlFI9sDs=@vger.kernel.org
X-Gm-Message-State: AFuF++llggdJWB1m1QJaTRfB5JE/dYZXR34hcmFBUZvPlg9QCPnR5Dy5
	+tF/6isRNlO5+1UQi7jQA6C2TOrg7CroLodE4BD6qObfzCQ6Yg9Vl+4TtY18uJvkuSvV4QZIJ1Z
	1/+MCOYZCcXxSSpbDkzIq9gvzvi/Nca6Vee1SEdU9CnyDx+eTI70WIJdVN5hHrg==
X-Gm-Gg: AYBFou2eVkXKaAS3ZDHwotOk3UKg+aj81z0mW22ha2AIIoShhdCpobZr8nvZ6THA8lI
	UeKslff39aGzZOvIzDX2p1VIrlzYR1UnkbwE0HkSXCDFsRqzc1QDeS0TFsXBsA7lWQ5CylddrBR
	8UExJrPUjlf4hEVTtTgMNfQZ9ycKig0XUe4HyjYwCZKRhV2NP2p9n1He2sPsIqRGcxNRFNgeU6V
	r2NmKQAc0GLncSlRMbFdMSN9ghYRIm6l53+sTqRloFUMce1ZW8lisf8OX+cAKYPLo/3lMjK22IC
	xgNlEXFJrdoMXb/nAKGYHJQ6L2XC69W3T64hAlQ8u6LyTYWuDrkbqlcgRXNzS5AlQfww+7U6lhO
	/uBN1047uag==
X-Received: by 2002:a17:90b:50c5:b0:39e:6a81:f34e with SMTP id
 98e67ed59e1d1-39e6a81fce2mr276638a91.40.1789742713887; Fri, 18 Sep 2026
 07:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917104306.22145-1-fangxy@xiaopeng.com>
In-Reply-To: <20260917104306.22145-1-fangxy@xiaopeng.com>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 18 Sep 2026 16:44:37 +0200
X-Gm-Features: AcwNN1VsdOoF1CR4dvwem1MY-kEX1GrJkBZUCbo6tbBHym_QJ70vNsvmm2kEea4
Message-ID: <CAG_fn=VhA-O1BDJ7=THD9bViomcOR7UDve5M569sHEzZqDv7Kw@mail.gmail.com>
Subject: Re: [PATCH] kcov: ignore an out-of-range comparison count in write_comp_data()
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: akpm@linux-foundation.org, andreyknvl@gmail.com, dvyukov@google.com, 
	tchibo@google.com, elver@google.com, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, eadavis@sina.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 12:43=E2=80=AFPM Fang Xieyan <fangxy@xiaopeng.com> =
wrote:
>
> write_comp_data() reads the comparison record count from area[0] and uses
> it to index the coverage buffer:
>
>         area =3D (u64 *)t->kcov_area;
>         max_pos =3D t->kcov_size * sizeof(unsigned long);
>
>         count =3D READ_ONCE(area[0]);
>
>         /* Every record is KCOV_WORDS_PER_CMP 64-bit words. */
>         start_index =3D 1 + count * KCOV_WORDS_PER_CMP;
>         end_pos =3D (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
>         if (likely(end_pos <=3D max_pos)) {
>
> The buffer is mmap'd writable into the collecting process, so count is
> under its control and end_pos <=3D max_pos is its only bound. A count tha=
t
> wraps the u64 multiply leaves end_pos below max_pos, so the check passes
> while the record store lands 24 bytes before the buffer, in the unmapped
> vmalloc guard page, and faults:
>
>   BUG: unable to handle page fault for address: ffa0000000b60fe8
>   #PF: supervisor write access in kernel mode
>   #PF: error_code(0x0002) - not-present page
>   Oops: 0002 [#1] SMP KASAN NOPTI
>   RIP: 0010:write_comp_data+0x7e/0xa0
>   ...
>   Kernel panic - not syncing: Fatal exception
>
> Bound count first: only max_pos / (sizeof(u64) * KCOV_WORDS_PER_CMP)
> records fit, so a larger count is not a valid index and is dropped.
> kcov_move_area() bounds the same untrusted count this way, and no count
> the end_pos <=3D max_pos check accepts reaches that limit, so no valid
> record is lost.
>
> Fixes: ded97d2c2b2c ("kcov: support comparison operands collection")
> Cc: stable@vger.kernel.org
> Assisted-by: Hawkeye:GLM-5.3-flash
> Assisted-by: Qoder:Qwen3.8-Max
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

Reviewed-by: Alexander Potapenko <glider@google.com>

I was reviewing
https://lore.kernel.org/all/20260915033345.904567-1-eadavis@sina.com/
yesterday, but this patch supersedes Edward's.
