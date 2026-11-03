Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793735860;
	b=svPZgRFCxyAIm48fx7pcQ5s1gUNQETFvaSZIZcCGDxXf4jOSe2LY6+akLw/Z9YLD9i54
	 CSmKAlffrKUIM4InSktW5NH25mYX97oRdxjbb4WjYcN1wFRdj2wU6CPvYJSspmG7ubBxk
	 0G7l9nDDSajkg1QqRKT5ovnRXP8D6FE92sXPvSjg9wfZql3JGFUJ2jFvEIJ2yp8APo58+
	 /HEWbOQIJV+RQF8ZgCFIkvIP6MvXypm1gXwlZtGZbw3x9TkbMw1WERBbne78lECTHvY9Z
	 kkVY8eWiAMmzsIXC7I3uxU4e1nZjTe1ltAn+YgLsBkN0Aj0NaOT8r91d2CKiX6q8wZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
	b=HsxAQCzbHDJ9SQJvFNdKM+mjv7FEBMmX/Hg1IRuEV//N/epCs+3Hh5plB8vtIpALf1EC
	 Bi4Sy6o/LptzdX5iV/ZLmONGPgnmCWxLoaHfVN2+1z8vCjPL3ovM5U/Nx5g3gN0QvCpfu
	 GlpGl3l97HdKiDU4ocHOqYwugpcne48/S2192zMTykZ0rUnHTgbRYgle4eF+7oElFrh+r
	 3j9bNjP4WGQpRn6SAZCNt+IP/ZBfI398Vk/y7d5pslec/kaBbDjkVJmNIusVnJtG7aT8M
	 LuGZIR54qmgrIuXhIFF0+NKA0+GP/LvICgqfxcsb24jVau2XL1Ked52r5+Z1YmIrapQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kp77IwLk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66E606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A66E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kp77IwLk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so46105135e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793735859; cv=none;
        d=google.com; s=arc-20260327;
        b=ml3rhG9FeKBVIn1vZ56MpbKEHFDQTotsmGdMarzGjTBxyfMxcPM54TFua1bs6NMHvo
         lHWPOE4HWEbaXzvkNA8n0IqqvoQW34cemieMaltcccuHVUz6mFP3D/6wvRa1EhYzoLmw
         B88RdDT29Po63iElv3EHqHPibYVFMYcsOklr2fNZ3ldSDn2LlRnWs/bxnr5PLkU3pARV
         No1xS9HTZX9eTr3vTJMyA2CWhdhAr4YarQhtlRWkNSkWMvmdRPic/veFmxSDCEZuPBUC
         xGUktbrR91742ejVxp/ki0bMrYAKbEE68bLPO1oWYa2jHghPeP/0kFK7NqEv751ezLBv
         crSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
        fh=MbyN5ag0tHObw29EtU+blaomJ5TlDZj1oPGKmp0r2I8=;
        b=JcHFhC1CsgMY0D0Jka6+G2WKzS2eT9ns2CrZwZCTwkHdo6K0XRzmveBNzASyEROMOD
         KKD/3Ze25yQc59cg/SRNXyVtKthMxG4RxuBd7szbCik0FBZ5FNSLBpCUuXWhXZ9xMz/2
         9k2jzpAUPyadVPV06On+p5Ydn3qJtMCmbEkQ61Xkhm0JURgTHhyvyqLJFffmw9PgBfzW
         /SK8upYXrgi81mmtjKEf/IVCIsqyfic6GG1/wkYiXwHgpqVeyKIV2v+glnSmxrIQNUA1
         PH87N6koSESPzw9X9um4/avKDqj4/QjvYfBQod4BA+dY7mHekGoI4fxFVNbEfoF3u+Ea
         GiAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735859; x=1794340659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
        b=kp77IwLkVV1TMxlTLYbUW8B4pQGw8p2W6+pLr302qojpzyD2CWp0FN0tVCAq7pNQ1h
         zhRB418jU+jC51gvZSL3GIflLJDJMP43hsQqlLbA86UF2feBVmmQyFYOUBGk2Vd6ZlvG
         gJJoDmX/QP/lOE0sO/JvOwK0rS/20EwxBHQfjCARDkrc51cXCiWuuBi8tzIuD1I/CsWD
         dhupRH+ciNA8oBDnbziJGyTZNeNus+3EDNnkCjUzsa6ym2b9Ud7zDEE4Ff20HPoOdD+m
         AxxYWZLVaJ+sZcgk+CteJMfOIDkybvQdv50QizZbgYDsBWFXdMhRwvGIT6t1vAQLgA2u
         5vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735859; x=1794340659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KvUAdd82A2FrfHcfd34zVZTNXZ/zNcTHH3fL0iHdhE=;
        b=WOiWrLdV4VU0e+ojISqgDoO3sYJVvQbHyqoJox8wD5bkvdjniPHcDH8wSrfZjFtQQZ
         MO54JKjwYDNdvfqpXPTAWL2i6Qw2GJuA5mV5AbfsRCYMeU4/4ife9o6ZvushBHMt0RZN
         27ZF6zoZeWaLKhC7qquTqzV6ASJ/uxPecOgC6BtCrwOiJb77AnLcxDpDmEwRbLdWJ91U
         Xsoof54RNlzDAi/Le+hKAITo1qQLjeEYORXfue7cfuCd9VNkLTdb6mFlY2QKV4SN1zLc
         GsGEDpxUOr5xLi9W9Ek+/suOO6NaC3sJQwE/v314W15SL3c2+ZJjx+b3HsLAExkjtZZp
         LE3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkUlSZQaNyscelCqzyoy29Uqx2kwwL7CcCcK6KD6+s+r+OOWsgZC7GpPaULB4oKyUAJrfhqMwk2YZSqJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0hM2OfmvXYiDdoxzXcJzl1KfyDHN7i3TTG8HG8xOss1HcJ3wh
	7J9fPqN6rTYW2K49Ekx9POH2l68Vu2MErPrWhOiseo5fWRfQxE0qAnP5RzB+cGawwSKQC201n61
	lXiu0OWUEw45Qv8ShSZjNWjDnUh/OS5o=
X-Gm-Gg: AYBFou3SGOUnA43Ew1u/7t1dhdHKJR4L5MuP7Zc766/BROtni9dw30BEkujC0bTge01
	3E2yXpVVDY4icKogdDhtvEBY+bGhnzsNd4Q1hUIFdfrMsvSLb6sL016QTgcBHVU7MmGf9PMTbio
	CVtSgRNQoyLdhwJBCune3Hs5DxCgoD/VYAn1HXTuKDzfT4WPSnc8ioKMY93dzgaRkSfoBKDMKvE
	s7wfLf9MEQwknHkHAufM8QOx0iM4O43kdQbYLOVxwZCEdPy0axrfJaKLe1TD7MiQVzAlA7kxHIp
	LX3aETWwHcAJ/TZ792vpU3u/hFy9c9zDJoF49rVComMvZGoqYnbDNk4qqI/SRr4Ksj+8lWS4I0i
	NqwnYYjxpg7DWQKAZ+IiyCnijDLrRyqQ4SOOuPgeaOENS62N5t/6lyFwVdR/DE3x7reH9KbVmns
	j+QLxGvnc7XGoL5B1SAg==
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id
 5b1f17b1804b1-4ac16bc547dmr344461405e9.9.1793735858729; Tue, 03 Nov 2026
 11:57:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031070515.3042848-2-thnkslprpt@gmail.com>
In-Reply-To: <20261031070515.3042848-2-thnkslprpt@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 3 Nov 2026 11:57:25 -0800
X-Gm-Features: AclHuK_JytKkKfU5M6CJRcikf8vCv1-AjVOSiBNPYKxP4EvAaHLb1svGn_IQLNI
Message-ID: <CAJnrk1aJ32nWqoSLYBOhh6zhM51BMk5sCJGpZBOtNGj4A0iRUQ@mail.gmail.com>
Subject: Re: [PATCH] mm/page-writeback: avoid unnecessary strictlimit
 background wakeups
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 12:05=E2=80=AFAM Avi Weiss <thnkslprpt@gmail.com> w=
rote:
>
> balance_dirty_pages() includes pages under writeback in
> gdtc->wb_dirty when checking the per-wb background threshold for
> strictlimit BDIs. However, wb_over_bg_thresh() only considers
> reclaimable dirty pages when deciding whether to start more
> background writeback.
>
> This can repeatedly wake the background worker even when there are
> too few dirty pages to write. In a 15-second FUSE writeback test,
> background wakeup requests dropped from 2657 to 682 (74% drop),
> while writeback_start events remained nearly unchanged at 99 and 98.
>
> Check wb_over_bg_thresh() before starting background writeback through
> the strictlimit condition. Leave the global background threshold
> check and the wakeup required for dirty throttling unchanged.
>
> Fixes: 0437906841d0 ("mm: start background writeback based on per-wb thre=
shold for strictlimit BDIs")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  mm/page-writeback.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 499a35473e4f..cb0c58715b93 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -1826,7 +1826,8 @@ static int balance_dirty_pages(struct bdi_writeback=
 *wb,
>
>                 if (!writeback_in_progress(wb) &&
>                     (nr_dirty > gdtc->bg_thresh ||
> -                    (strictlimit && gdtc->wb_dirty > gdtc->wb_bg_thresh)=
))
> +                    (strictlimit && gdtc->wb_dirty > gdtc->wb_bg_thresh =
&&
> +                     wb_over_bg_thresh(wb))))
>                         wb_start_background_writeback(wb);
>

Thanks for the fix. It looks right to me. I think an alternative way
would be to save the wb_reclaimable value computed in
wb_dirty_limits() in struct dirty_throttle_control and just check if
"gdtc->wb_reclaimable > gdtc->wb_bg_thresh" which avoids the extra
wb_over_bg_thresh() calculations (but is slightly less precise for the
memcg case), but I don't think it matters much either way.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne
