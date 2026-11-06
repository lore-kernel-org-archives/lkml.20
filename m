Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793972147;
	b=tA4JnYznFfePSzrkROpIjrC/Olna10Zem9TY+39PeREUNipT2aDotEq2M1dIGckEtIzr
	 Wd/Y5jRVk5L85ofmFtlwM+9VpyNEbFOZLkLQvrDW4kDHLpDn5fLorwcknQ5vmIbXbf6W5
	 Xk4yBj7ADNyWzeOCI3dDhknIkv0Dj94GuMl6ryyXZ/Bh7J12Uua9SP/Gikv8HlxlyVhpA
	 9OT3Sa7Yh8bGpDX6h2deQ5wvwNGTjtLheGoa0bUuQQbb3beP2jQ7nI7jgOU2Pt3KbLsMR
	 z1AGaFAYrVfJz8k3/jbJOGm8xUAApd6Ut8hv05g0/41XDduan9NFpo+2PyOaQOoprhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vqiBZf8MCJNi5yln1icHnq1nqZ0cACTANM4u61mdQZk=;
	b=Scu9jvHX/fEnPevjlr/VUR55lM4R14GPQqkDUbjDebXOBQ6gxt60kOpjM2DtLDwnhiWE
	 caQuIXkz1PzCDQtiVAV030ex3noydIseyyYencfp/kit6f3p88TpEGXYFBDCKikFeI2th
	 U1vnNrDn1Zo9jeOuxxXktO3dt/wjvn0y3dvbQq9esZtHVdk1CUi/zQRW1ARK6m3SMSZf4
	 gv1hk8cB89rPQO6a/PT8B36e3eTvWHbCpuQCZ2JhW2XMjgSPJx6l2oniFqw4m1xmY0Jfw
	 M6us11BHG5lnWGNnB8zN7Uwpg8XZHFTljgJT0aF3Hi8WlrFpLQfW/JiT0W9SkzO5JDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJF3puIu;
	arc=fail smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D932606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D932606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJF3puIu
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b001cd92bso363077f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793972145; cv=none;
        d=google.com; s=arc-20260327;
        b=D1e8BYvyJddJPUStW0L9ENyKc00mC01HSf4q3giRUtIgI3P+GBNpBtapINBqgdO+bf
         ag3abuDEG1hgLJn0uj71iZWPmZ292xTaXDx7S/dlBot0+MevpcFv8YtvyVpFhOZj7s2Y
         LdhPsuTM5Kok7xOweYNnL1NaLUpVEvSJvtxDPwLq0XSHbTYi2ISV8jvHlgK165Wexc6n
         R201evD9kxYCb9xD7MqGis52apKyqRofpTNw2Ek04x8vCsD7o1EQ+3ZAqsBg5aNHbV4P
         xwKHKbLJWvz/SXP8sK9F3DELEcsp6Tze6/iCd7Mh4ixuEx7Lmbi8KEdglv61J+D7rnsD
         mB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vqiBZf8MCJNi5yln1icHnq1nqZ0cACTANM4u61mdQZk=;
        fh=EeiRl7ozkS0Ry6OGr2uKGFMm5jt8fsvBW4YyrFemmfw=;
        b=PNyHAyV4ciXdHqqJtQmGoeutsX8smFLJTqKdN0wFfW1kGr1WUUbUZsFVYbz1+RKwDt
         KWZkTCpqCpd88223zLIylFDsCnJG0FTU+JuYD/5mWglIIKJB7iHGWs5Cfnkk8Yb3LeiZ
         n1CYJ70ojQYXe5+W95b/voM7QifTcTJSm4dvhsURFMaBWyurbhtTF+9NGQXhGDAvYcAw
         m9gWR+JrzKKyEdYtPyHtKIHXivSoRqXtXhAd7gaDDCTPo7FbK7uOVoaNkOBl9QUe7vuS
         9V4jE4uwoHlpTgKoXlmCQeykLbHVqZPaKpVzRBRnMLAUEimbSFZaaFWiLaBzQen39J9d
         ZORA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793972145; x=1794576945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vqiBZf8MCJNi5yln1icHnq1nqZ0cACTANM4u61mdQZk=;
        b=AJF3puIuRtNIJRLWbcLSabiCREtpW/FffWanMMkKvADW6k0WIXxsBRYfyaeu3auUn3
         Css5wFsawN7zzsyih8CxMOXs6kSAPS9c8MbAXxty84qFWfadQpsBcq23EO55FfC6NOa4
         3TpPwt5DGai5wE0jaDLlvrVjGosG7YALHiM9cR9mu7RNRYRLDYnsduEJSdPXsjCGguMW
         Mk3eV+VsGnV8sFSU0eDuxcgLilQTpvp+kyldgsKohj4UYNdmeOHecB2Fie1gQMlIGGkf
         Dp5IcoNq3SN8fdLuptYFs4NnMwLgEllTAsNUkvWMXAdms1qCJ4i5fQZ+UrrqM/DOYBvb
         aOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972145; x=1794576945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqiBZf8MCJNi5yln1icHnq1nqZ0cACTANM4u61mdQZk=;
        b=d4cbEYK/BWiOdwhrzb+cY6PpYN/Ywp5Oiv4Gs1nmy2+HUslzqwkUWfeEU3j2EA3HYs
         Ne1eWO0pwLsl1lKPvc3Bx3Z9Rv5+MVlsmMRzPaN/ZvpqxyiZdaOfU2P4+c2sHhFYJk4l
         PTCpgQq7D+cFLMrZ8C5A7H94OMAYVeg/ZxTBvZp6ADz8DxgX+gazu2G6qiKFobCKSP9a
         DOU+e3sPwI/0+Ae0v0X+xRbRJkRuOB328vB5+5MACX3bL/bXU1RZKHu3UqeHSjTy9imf
         LYSPERLp+gbyiV9PYlQWJxW1DsWNr9rwFDpfLygVsAkNWawFC8q5UUVJRhnl1dI26XgJ
         zRQw==
X-Forwarded-Encrypted: i=1; AL+hErFRv7jGYmyBiAltj3iRzUg6HFFo4eZA0LL0lqeQYQn4jiDvJXU86ABNybAIxIx01CSn/CKddoqQ3Ww23AU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z35fHFm8uf53g5EE11JbOz3nA0gIccBK1N6iczDn63fNadbK0
	9fU1whyFUdh3gA8vKN5Hg2mFpnxcyWIdzuLPdFOg+CRKC3g0nC++rwTup1xhrswOGap/IP19+Jw
	B4IesQanEmR6bK9tzePyxeqHVcVyQp+o=
X-Gm-Gg: AYBFou2ixEMzeOPahiePEg3M2WhKf8gyYmpMsiLo7EZL7yyqiW5FXM8B664J+G0Xl/0
	3Ucoz5hbx6pw2QCa+nYpbZL0ZksgJfjneiVPTPwOQvnuwzv+Q6tI9xpOmalChkvvDs0mG/kfUoJ
	deEoGPLomUJfgPosmjV2sQEwHMoAIz5JyNw3Jxa5CdK6GFIC5fTuzA7dp7uEhF3LKpA06NPVuVa
	pu835NkWZ19mLWgu3Elk1XUqQZYEZkVWtsHGeOAiEVxdj/XQmqBct/Ds7WajjuDB59sxxxrGk8/
	AjH/Ka7uyWGZ35HGwJLEz3MNN5GkcErFMVA+h1Hv6CEbIHoKMKiBGLcF6sJTGFWT6+I9dZt48Zl
	xIt8ZjpB7A39VBuRNC+Gf34JgtJvntzvMqeDWsNC8ZuJqb1nUTIlkdnl2AKJrGZu6KHHCpK+uoC
	MTyALL41P75UWwpp6iZgbgH7AUa2FCui2pmC3xM74b9VM5U8c0ao7Y
X-Received: by 2002:a05:6000:4282:b0:48b:9ed:b81f with SMTP id
 ffacd0b85a97d-492760da82cmr5408804f8f.10.1793972144669; Fri, 06 Nov 2026
 05:35:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019160615.2348500-1-nphamcs@gmail.com> <CAMgjq7AEg6XEUJPaM3mMBQAeS_KiDv8_za4w-R2WaZ=ZGenvuw@mail.gmail.com>
 <CAKEwX=O=PL3DEaEDe=F-=zhQ=VW3_UtcqesdX9fH_cr6orb2wQ@mail.gmail.com> <CAMgjq7BSzYTbrzbA4vGqMbvegoHnDtJ0vA9PcwCet-m6Ow3ouA@mail.gmail.com>
In-Reply-To: <CAMgjq7BSzYTbrzbA4vGqMbvegoHnDtJ0vA9PcwCet-m6Ow3ouA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 6 Nov 2026 06:35:33 -0700
X-Gm-Features: AclHuK_c4e-RdWwmOq4OypJaP6HdPutPsMXoulXmVlinw_aIwzodsE6iH8OD2N4
Message-ID: <CAKEwX=O0s9n2x5p-BL1Hru3e-9z88Eg+JVM6OM02QTeY9a=xdQ@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, linux-mm <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:53=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wro=
te:
>
>
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -449,9 +449,13 @@ static void swap_cluster_free_table(struct
> swap_cluster_info *ci)
>         swap_cluster_free_count_table(table);
>  }
>
> -static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t =
gfp)
> +static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t =
gfp,
> +               bool locked)
>  {
>         struct swap_table *table =3D NULL;
> +       struct swap_memcg_table *memcg_table =3D NULL;
> +       unsigned long *zeromap =3D NULL;
> +
>         struct folio *folio;
>
>         /* The cluster must be empty and not on any list during allocatio=
n. */
> @@ -472,8 +476,8 @@ static int swap_cluster_alloc_table(struct
> swap_cluster_info *ci, gfp_t gfp)
>  #ifdef CONFIG_MEMCG
>         if (!mem_cgroup_disabled()) {
>                 VM_WARN_ON_ONCE(ci->memcg_table);
> -               ci->memcg_table =3D kzalloc_obj(*ci->memcg_table, gfp);
> -               if (!ci->memcg_table) {
> +               memcg_table =3D kzalloc_obj(*ci->memcg_table, gfp);
> +               if (!memcg_table) {
>                         swap_cluster_free_count_table(table);
>                         return -ENOMEM;
>                 }
> @@ -484,8 +488,8 @@ static int swap_cluster_alloc_table(struct
> swap_cluster_info *ci, gfp_t gfp)
>         VM_WARN_ON_ONCE(ci->zero_bitmap);
>         ci->zero_bitmap =3D bitmap_zalloc(SWAPFILE_CLUSTER, gfp);
>         if (!ci->zero_bitmap) {
> -               swap_cluster_free_table(ci);
>                 swap_cluster_free_count_table(table);
> +               kfree(memcg_table);
>                 return -ENOMEM;
>         }
>  #endif
> @@ -494,6 +498,20 @@ static int swap_cluster_alloc_table(struct
> swap_cluster_info *ci, gfp_t gfp)
>          * Make tables visible to cluster_is_usable() after everything is
>          * ready.
>          */
> +       if (!locked) {
> +               / * Lock it here before assign, not after the asssign
> and return */
> ...
>
> This should fix all potential issues I think?

Lol this shows up twice under vswap's sashiko reports:

https://lore.kernel.org/all/sashiko-outbox-181084@kernel.org
https://lore.kernel.org/all/sashiko-outbox-181086@kernel.org

Now it's personal :P

Anyway, I'm sending a patch soon based on your idea (will keep your
attribution around, if you don't mind - but we'd need more eyes to
review it to ironclad it). I also have a couple more fixes along the
way. Nice thing about sashiko is that it's digging out existing issues
while reviewing new code, for free!
