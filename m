Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F632282F16
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174835; cv=pass; b=Z6aeCs4YP85WSACVGMllGwHToid1PX555KrkwU8r0ve4g3uDLenkmwwBVVYFHzJJOLgwep1jaPugHSOt4u55T8LkA56o4v+xaqV560XLQWKFTDZLbwVFqD9RlrLnxsHXFmxArfIOKQ56aXgjsY9hruojif6NsO84nMC5c8fwNc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174835; c=relaxed/simple;
	bh=LFfsGf9y/UF/M+4JNNTrn6eIHIh7Khtw5WSiv7vuhVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnJe4yKgsx7V8MStqj0LNIQuImh9NnbryxE1u1uTfvAzgGjPNDG+kZmE6o9/65BU+U2Fh+8kjqmxHBmuSZJyBaZ2l4oonjzSmMcQea4XKstcD82hevSLHezfvE3gcaQVG2rZ/Z2aLoFDm6aKyVBaQ/TKjUsjikb3HZLdcKi9Vyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDrftRJV; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDrftRJV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e27035206so3190027b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788174833; cv=none;
        d=google.com; s=arc-20260327;
        b=XXFINFn0v2qusoBfN0vD8qnzx/Ak7y+/E6ef8wAGkB0+K0FlcicEsrW4mjnPqgyvvu
         OHUlsUJZmQWwlkGaDK8+kekMb61Kz5WgbtzSGB0JOuRKUJfd2uqy030Fl+XJMX1EV4rA
         BV/MgxImyzXpjIJelDzALUoRxZWlQj1rmo1WyMu1xdSFrCzm7TgmFK6OaXn7ElZibuJW
         nDSvGb7TDg+5/q60NicWtafHhzL4kSkqOrQju/WW7KGrxLDcRH0jZKAdYroiqqLJUZE2
         ByRb+miYmwwA659uXf4AtH8Y4Oe67wXkNopJE5RrdScAjjlsRS3AInndFvtTnV2WPLzo
         dYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yuWjbx1O5hIe3EKGR7TrgAX/AAbp43qDAxNhOzFObuU=;
        fh=OzJE0eeooALnIQmPBlr8ZGz1IzoSgxav57xLb6c/kyQ=;
        b=j7KH66jGo5Toce7Q944DtrpiH2gz26IDb4UfSuCwi7d7u/cdCUR6fYr6MOV4XbrPgL
         SltBv258OxHDAXROgYhGTF5xlmHKbAkrB61DWyFzU488Vn8y852EypXsNi4khjgJkpXP
         2wY5Id/jxEENhfeCMUpPG/h7lnqa5IPnndVIr/d7NiVi65othju4EtRop9eYnuf1/Dgd
         WzUVoSgwxcHqBLKFMZNsYDMBYZDfufl1huWJIdsQbxkaL6QL7xWnV1MJb+ZOr4YkSJAg
         OwbY8P6C9z9wUmQLqagb0xoJL+0qipi2TBAGUUtV2rKxD74kRjQeTjWOTXqVVIxQM6b5
         ZaPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788174833; x=1788779633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yuWjbx1O5hIe3EKGR7TrgAX/AAbp43qDAxNhOzFObuU=;
        b=tDrftRJVPlGtElh0Lt8vcT/eEEeuwffO15cpZJITeSrOlVnOxqPSIDx0mshfMwy0/q
         qZssQzbrckmO74xYpNMo/IHUv6FMCmA0lS+HqbeV8hGpIAD2rVy1g7cW7hCfM9ilGrHq
         as84kjJlY/lEON5rNaCuX1mfDT6iTX3gMQEuTNCAy7X3748WvNd/sgGuEoXdvML3SCLa
         ku/aFrWP/QY2lkRKH4BSTPyoU3J4wreablukZSngTKJJFhOfNWwBy3jyRDA6zqKhL7kj
         g4O5vvvaVEkQGkDtj9IWKD31rP/VVAzMnrGpFchYr+PB6Xj2IbuIybcEaK1Jy8Jp3Q+P
         pu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174833; x=1788779633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuWjbx1O5hIe3EKGR7TrgAX/AAbp43qDAxNhOzFObuU=;
        b=kwxiW38p/+jcwtPQKCrc3E4afZrCzFt7XZ+OQYa6WrGa+iRmTzBzCqa4fsPRWcOIg/
         yCwm8UJtzB0GUcYsAlJmDHlCn0b1JrkcnpbV1ylLyXxFoSQOOUd58Z2cj8ksjrQqe6f+
         S7oCAoJVhl+imUjSo9jB2D3fH99g/u5oI9D/YDhaOYn6bHHLui16X/ay2kFM79FrNEKZ
         CCut9yxWMhRpQTTnYqJpYHzTmifQ5C4mznemlLK79M1XU8iYXyrNsc4VMoqC8JUiz7EQ
         eJGPgVUKvmOuS2S5yElqenu6erwCe+303kJpHdoGPp9pLn0Q7sC1z8GLl5Yl9UO28h+E
         pKHA==
X-Forwarded-Encrypted: i=1; AHgh+RrJ7j/P6Bju4dMh97bEit3Das1eH58ZDz8SfMRMrY3vz/41b/jWE2VGLEDZM+VOTz5dESBtrfnVeTEPA6w=@vger.kernel.org
X-Gm-Message-State: AFuF++kMv85tDxwkwSTlpqT4mhVKQGX+eh7bWDAtjBmw0VBVpeod+YHx
	gW8VjlFnIYTwikyFcyLmINFbV0AtiL3a3PB3vkSR/7rj8xZINeTVqP/X2HVtbuHp4EiNAluHxPC
	y9342WWNOQITG+9u1P+AxTv27xNmsjVM=
X-Gm-Gg: AR+sD11wqn4prLF9GqXFpqHY+gRiDzjw2XQdaqCMmOTrCpGKaNNJcThnzs1DC8WZ2DB
	8eEDkuvO2qxNGFf4yaEtcnv5SECt6RrQ9x+LBFxPHH7dLfpa4BlLl0w4S2Q91ikc0kKlhy5tX6t
	mrUpcIdKdo8wyeqVH4cj1GZGtrRyTSV703bfrZNa/KANyNcS1pRIlgKHxu4t/8bOdXr6D5AsgpM
	RtgB/5dEQWpqHeH8l1w9uiub4TRQrb5weTNo8mCQix2Tm23Nf471glxqW5eFdlS9a5y7dnSEGmB
	+Zuxdn6viZ6VaDeFNaFJbmXiNQOqxW6Xi7TbnZquHLS4Vn1CoQhxCNYXfMf7ub8OLHH3pI790xF
	GHQ==
X-Received: by 2002:a05:6a00:4b4e:b0:857:726d:2e97 with SMTP id
 d2e1a72fcca58-85b5c0e42cfmr426775b3a.20.1788174833315; Mon, 31 Aug 2026
 04:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828191433.3304458-1-nphamcs@gmail.com>
In-Reply-To: <20260828191433.3304458-1-nphamcs@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 31 Aug 2026 19:13:14 +0800
X-Gm-Features: AcwNN1VrQPpiBb-m8M8cbBhiD6LWslgKbMuquunerrwCU6jvrwuqE6JT8Cs2Vrc
Message-ID: <CAMgjq7B9FxSU13_vJH222_wp4wdA_n9viy+MJbd22=YfgP7mbw@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: fix SWAP_USAGE_OFFLIST_BIT collision with real
 usage count
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, joshua.hahnjy@gmail.com, 
	gourry@gourry.net, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 3:14=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> SWAP_USAGE_OFFLIST_BIT is embedded in the si->inuse_pages usage counter,
> and is meant to sit above any value that counter can reach. However, it
> is defined from BITS_PER_TYPE(atomic_t), so it is bit 30. On a system
> with 4 KiB pages the flag collides with the usage count once that count
> reaches 4 TiB.
>
> swap_usage_in_pages() masks bit 30 out, so whenever the real count has
> that bit set, every caller of it reads 4 TiB low:
>
> * /proc/swaps understates Used by 4 TiB.
>
> * A raw count of exactly 2^30 masks to zero, so try_to_unuse() takes its
>   "if (!swap_usage_in_pages(si)) goto success;" early exit and swapoff
>   tears the device down while pages are still swapped out. Nothing in
>   the rest of swapoff aborts the teardown, so those pages are lost.
>
> Independently of swapoff, the collision also corrupts the counter and
> the plist. On a device in normal use, a free that leaves bit 30 set in
> the count makes swap_usage_sub() see the flag where there is only count,
> and call add_to_avail_list(). It clears the bit with
> fetch_and(~SWAP_USAGE_OFFLIST_BIT), leaving the stored count 4 TiB below
> the real one, and calls plist_add() on a device that is already listed,
> tripping the WARN_ON(!plist_node_empty(node)) in plist_add() and linking
> the node a second time.
>
> Change the definition of SWAP_USAGE_OFFLIST_BIT to be based on
> atomic_long_t instead. Note that the usage counter field itself is of
> this same type, so it is still a valid bit.
>
> Fixes: b228386cf237 ("mm, swap: clean up plist removal and adding")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260825153238.2695446-1-nphamcs%4=
0gmail.com

It's really nice that AI can help catch more bugs.

> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  mm/swapfile.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 53bf01d5f7f1..601979b97f95 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -156,7 +156,7 @@ static struct swap_info_struct *swap_entry_to_info(sw=
p_entry_t entry)
>   * This bit will be set if the device is not on the plist and not
>   * usable, will be cleared if the device is on the plist.
>   */
> -#define SWAP_USAGE_OFFLIST_BIT (1UL << (BITS_PER_TYPE(atomic_t) - 2))
> +#define SWAP_USAGE_OFFLIST_BIT (1UL << (BITS_PER_TYPE(atomic_long_t) - 2=
))

That's a very clean fix, thanks!

Acked-by: Kairui Song <kasong@tencent.com>
