Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896FF43C05E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824409; cv=pass; b=kW1ilKdO6BS1vhYTQB1AZHmz+U+kU3EhDJgMiIFU6kiCsVUi3p/ZA2ZhH+pSw544xeInwe73dHMyFggGPl6cm/b0tsAbuUrQ9QfBT4BYLPR8/DU9v4I3228+OtMuKnHhX4QCXO48Oanyrh/qdJaYH936xeUVBs+s6BQKYtUSOoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824409; c=relaxed/simple;
	bh=wcvDNTVbWq0q8nB0hMygTs9DXGJyBi/yudEDYV5wMpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSpXtc0nb3gRn8HHctCm1ieF/peL2i8DIJ0iB6sS7arAZINd4H0GMTroHu62ZHto4bU2VKnLqmZ07pTV8kAzxpWqB+L47Amewfj5ndVGaYXPQmQXy8h5TdDtQOve3eabL5EdBf1ZnIB7RI8w2ptVFhLOGFixALz6zenIlUn1NGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXGO0zbJ; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXGO0zbJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2544ff970dso53659266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787824399; cv=none;
        d=google.com; s=arc-20260327;
        b=cAB6lDIkkwGVKmSbnqk6Zat9wk5FlzbBhCotEQGa9KusIFaB9NTKhruRDvxuRtyrT5
         TpZQA/Lu/m02LNes3+Y4CBH07Duep9uffKtd9l9eafLwFzC/dFFZYV2EYkukHeRM94tL
         dsP7lQ2V/uyx8gor/WZl86iCSzKX1p5ZQqF3G2/9+TC3G1YsWBhja7zP6wOtFfe8y1tB
         PLDUcnRTttmsIUrFGhwYRIS0kc9lJkQQ9saH53XkHS2oV2QiVJ811cwNL7nnZmx1Fd41
         yZSsF2BT7tMDckVRShvRqmeWx0uAPnIFsonwGAtwrC6B3Q20/fQzZBijKsUoPqzs/aAR
         92QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V69wi16LUNblUa9nJqEd/LsAMjztWA0WyDgNToplCPU=;
        fh=eCjh6rD2iUWgjhvYoJp8BDDR8ih3jh+v6mLazo487FY=;
        b=GZIRlhqYe33flnovhbuK8eDmqnQIhuGNamGcvPoaetuaD2X55h0jp9ayEm+MAlWlwr
         CXSVc3deZIWdTr7I74G1d2auWKSvAkIa1JSP22aPo6iSfqok3+8hdiwdSYyp3CzjObwJ
         BaQgmQ1zdjNuVBJQ+cYbyUbx8EaelrFSP5M0j7SgHNsEDP4PkQg+M+GrxPmRr/8BYX+H
         PpORjAYUlZlv9bZzYPikAlS7E34wyJTezsIrClIns7qe/TB/22+Hay+rF82lCNTi2CgV
         AhyxNVhX1RMTDavm204G+A2d4QuqNmrxkHM9iSI7BqbV8XL80CwvN7mOfmHPtVf9txC4
         Bemw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787824399; x=1788429199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V69wi16LUNblUa9nJqEd/LsAMjztWA0WyDgNToplCPU=;
        b=IXGO0zbJ8nJ3Lov5NpnL93rV56Do2sba3AM4U7Sl1N613wYAEnIE0PorYwgVVUNktV
         h+oj0ENYmoypXFPd+urDxZbdQmW9X3VeJtoqBKLmNWD3dMEPXi8qu8Og27QvnfAae25U
         P4v7ZExbRszB2QOd6j6WiFMmUtu+z806UWPBVV9WAaxvWOXo25kG2tbf26gki3FNx9Lg
         FtaMl8d3Vk+N1l2ry6c55OTlnN5Amf2POhJrSAXSBxu+8JWhj2CxbBzSCikp7pV0I7vx
         wJf8QEqIl5GuNNyV2+ZvMAgLjJF+NCHT05NDrMC5iI/UR/iMdhcQege4XuvQz6931uXK
         z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787824399; x=1788429199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V69wi16LUNblUa9nJqEd/LsAMjztWA0WyDgNToplCPU=;
        b=UFQ7g4lmKl8x+bjxU2NT6JTtfZOoBv0LMGnuLHVTX6QA/bCrgCUPQt28ZBHSNa3ZVc
         j71CihEmJx3A6IJRs3JOoazV6kCZDwc4+r5dqATaqOnpy3hXPp7mRCTm9wrsQ+SEAlow
         6M2ocxJpLfgbljBEnvGOLLWuVg8KAqMizjLo4EzUFqr9IYh1WmHpWRXtEh9gWCIB1P9y
         UPexaIcY+jIHvel/kPniXa2p2djhjIfWSG1nyUf51+yhjgicNrbdKuSORqYt/gqRstlX
         3uoP6fGD9AL82LgKRdUzPICMylkFuE/WIBzM4Ln66Y84galfMmVSIrQFNHE8rc4WlH6F
         cgKA==
X-Forwarded-Encrypted: i=1; AHgh+RqU4IJ72bKd/FbHKnplMErWF0fW6LBGNDkZ66urxumaEYcgBo6Wa5TFyXuvu9/7BO1T9w5Q9SE+Mb96bMY=@vger.kernel.org
X-Gm-Message-State: AFuF++m+kzlZl+k9oGlSqguVa0M9dnybDSAvQZuOMHDsTIW+nu2WJ3QJ
	KOgcGNS8z2GjukexG4q6alHTpAcxYko/objWccMh41CNASrLgXe7zxmy/a8Ae6eJsN3Dpl6wtZx
	o7NCuyWAjhwZL70sMHffsvW5M1OQUhyM=
X-Gm-Gg: AR+sD12E7u1cEVhJ8Agntiue8jtP2s1uG480Ci6ZyZJQe/OaHNA05kIdsp7jByGWfdd
	XBxg//K/YX5kJkVYRYaRhmui9jYsKyxqvLq9EikKJ3UFEq1uSAycBl6iLQX6ygDkU4adqowjSew
	fH44ZWc31UJmJSKEgmiElP7fPWkqCat71B0XIh1j1KoBzzZF7pl573VH4sDQpdbgzKbuw6Xm5ha
	jNNDmyBRbccXR5eAPms3xa4RBnb4ZwFERKSwHuvLjQu1Y+pIp3ARoLDbXxcAq0C3HKQBzPmt63X
	XT4zHIyi/G2ecj2v0cgOZhAxKC+MpUIpgHYChA8efdDYBwNgI0MgePm595SWUTfWSAchIXZUYva
	2HA==
X-Received: by 2002:a17:907:c23:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c250bb76ecbmr1325039966b.6.1787824398993; Thu, 27 Aug 2026
 02:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827082722.1809702-1-yuehaibing@huawei.com>
In-Reply-To: <20260827082722.1809702-1-yuehaibing@huawei.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 27 Aug 2026 17:52:42 +0800
X-Gm-Features: AcwNN1WwUiTkWAVLyp4BxCSmQtm-xAoV5FfSeeHtQxSaSTeH_J76_KhX5livf4M
Message-ID: <CAMgjq7CvP64ULRViPpMN3EHCViy1_nyY8ZnudrvUVXY-XFOvNQ@mail.gmail.com>
Subject: Re: [PATCH -next] mm/swap: Remove unused declaration swapcache_clear()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:08=E2=80=AFPM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> Commit c246d236b18b ("mm/shmem: never bypass the swap cache for
> SWP_SYNCHRONOUS_IO") removed the implementations but leave this.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  mm/swap.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/mm/swap.h b/mm/swap.h
> index d077e5893a42..29060a305443 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -344,7 +344,6 @@ void __swap_cache_replace_folio(struct swap_cluster_i=
nfo *ci,
>                                 struct folio *old, struct folio *new);
>
>  void show_swap_cache_info(void);
> -void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int=
 nr);

Good catch.

Acked-by: Kairui Song <kasong@tencent.com>
