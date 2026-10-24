Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792858246;
	b=4FsIGNgoZ8fnHVOFc6sxqt7kJ4hh56uQHqtRQmReZuE4jXdHOyqS6mGut6z2cGFMvI4/
	 4RDB/q3vdhDYxq0+l/0vqRUBoJ2PBU295tFarLku1+bDd4DA8nWgVb2w1X+1Z9NdhhQA2
	 wadiZMt3CZiv9hX+kgWh/LKJ17HP40UmFGdIVxJsF+foLFLWT8bzsslTi79/CciO7ZqA+
	 Sc3jCEm9khZV6W/9xjVDvAzoW3KBRd7jNJR8BodKJWFRDBaVEgZoagfPp00CE4nfJolgw
	 /D70txe0MmOpXjf4WBQu9LIAh13I8e0SCnH0eBnsIuR6XMSJHc9raUmeZdYqq07rTpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O8lYg+fnY/scDiybaCmI8FMgC2eiB+AC2lyV0CyUaD4=;
	b=n8V/YSfXcYviy6WvqEYaN0/AIFmRCIkG99/Jjw+nn8lUBAdEUOULwNWCAYOo5/AOaIwo
	 avbb/ZKzlpesgcQgq74jXZy00igV5HScRPVgHMaJ9mtd91Et1+Thm4Pt/e7ZGkjvebI2J
	 omgJMuvuWb3lVGI4Pk364Z1H/87sEFOOcdap60f7B1S7n3H9X7YBsw3Ozv/QVydf859UN
	 qbuGK6NtTazY+NfUDYzny6xO/f49EonKpigd8yyn/TIQaPBmJEjhjuIYVBhFs2Wuca48+
	 73iymw62NOl370G7kn4iNGorV3cvF1vVTHsOqYiVFj66u1qbpiJiaWLWBFzRclL+ugg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JD2Q0yS+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023D606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C023D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JD2Q0yS+
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c263415982eso215755466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792858244; cv=none;
        d=google.com; s=arc-20260327;
        b=Cohd+uBAo6mkLRbDP4Vv/UGJwTYg/k+v0jPKf3A7oqABO5lWUMUJUpIqCaO2rI+adZ
         zYihb7SAgrtmpIFzAgUK1//fyxW9gOd7I7y2tvkbkt83C7QYA2Is5Ug0GnlEU2WiWkeQ
         n5fXGVWr7FcL/BKyRZM33znZrOGSbBUgQPaGGw4d85f5IydX/FfGoOTkceoBDtpRuCFN
         BuodJKFcr63PrUW4GhY0KSIV3ybuOc5MjjJrkZWSo+m2Sv7eyOZK18H5AGoPDpC8lt2p
         r8YLMRNpogYoVuuZGH6G7GgGw3BfZem0GB3yry82MD8kWX0XyOGJRycBxoJpYFmKV9u7
         1YOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O8lYg+fnY/scDiybaCmI8FMgC2eiB+AC2lyV0CyUaD4=;
        fh=ElnS4F9hlkmTSngX5UzjMqOl343DJxMygkDR1sthnR8=;
        b=p3mX/AHoKSTJ+qXXWb1HoR5IlcJBArOxZEN40NoiG/0yL3wfncKk5cmYQoawvl4c2g
         8M/JrZ6xzKp6kUd4tDUXn/eTiIdSRJRe8S5P2Qfxgvt0tYELnbLNUFiKGBvm06Ib/0W4
         1WYY0qsI2ekfXVLqqmVHYb9i+ZFzYkZM7oUQ2n2O/VghmVySQ/Y1JxBA//fEXnwNDkWt
         T9eJLKlbqvLsuEnIwE5z4VdtUkxAzfhIQ6SBhrzeOP/w+PmSrqK88dY/H/Fhqt/WrrC8
         ujSWjvrYCmjP3FvE0Y4PxQCaC72+0b3qeCvnIY2uaWLhrL4L+7EfYRapuXkFhQuqUyeC
         Sg2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858244; x=1793463044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8lYg+fnY/scDiybaCmI8FMgC2eiB+AC2lyV0CyUaD4=;
        b=JD2Q0yS+Crx1yIKHI4mAisGDDvObziGAva6uOk3z3rINdjFvSeN6ze9MJ2Lnazm4Ra
         nUDNvdLNhoqYOoNII7YAYdSAkwTKuz18NxcmK10GYxYca9ihsuUg9+12lFojbYaaKRwm
         Z74yljxLU3UmsrFR9HMsP8zjhW57p5LxFE+1MkaXFVozrkZX/qInEkBNWqp3b2R5f1Dt
         tI84hKoXdmuOCSvK7QJM6pxJfwleQhZa/9k9OkSWgUKy9WM4sF4WU/VFdFm1eVSmPTla
         iGHGPaKfUDpStNoroi3mrmPXuu8yRpta4G9QJ2HfEKgdP8Z6Ijc1/fCsK98xMe6+QHRV
         DXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858244; x=1793463044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8lYg+fnY/scDiybaCmI8FMgC2eiB+AC2lyV0CyUaD4=;
        b=vvLWNg/uOFRQO2fgEv+6T9LZMShOW3/f0+3x0Yvf/oxWYmb2W5dH4O9udPbwEjobY6
         5ONFZMt3V7LLG5VCWfirM+iricPHqHOR0vIcCe9ls7dew/U1RjgsxtAb77VbNJnpRxta
         5YEB1vGL2s3tFOYyPkQMCr6r6XZYaAWC80muySfQwgvP16lzqNNSJPnrp2f56KkzbnwW
         0c4H8mJpT4zH4BHbOsMsv6lbcTBPkauJK078VmenXSv1uwOLNEcdfEMMK6id6mWd1dmG
         pegqvu1U5kfnHqIqTw5WuOE4qDINTSkZ9ijMOz0fTzQiMfLXTCSiyeurYfrh4ZjOFRlI
         383g==
X-Forwarded-Encrypted: i=1; AKwUvByF384tX3C/1O55dX7V5W7/t9XrtL5Nu4NRQeo+DvfEjq7q4p1qeZTTmCy3WZATEbFW3yQaUBoysaMZF/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCG1mcx/hm2XrS/QL/IkztZV0CfgaFLfufWUCYbULmPZ1Nd9VC
	o5z09D2tP0hmvXKvoCZbWzb7XeYZyoQtGWCxgqv8PxgPPKycB4ijhoviKSnEZkz/5xRWHQwbT/l
	1Hh93ft+3mAOwD9vyKDREtxOJXlwsQ6Y=
X-Gm-Gg: AYBFou0rk2/pbCef3FMgd1zcwGvN9UgXswXQigC37C3E+svxYfc2i6TYEOVs+X1Dtsv
	aI123dx883oHDvEI8DLrpwmKMt38ZpMSTiYonrtW3ANkXtiUpvMgURfC+5DYbpur7JF9GFCOw1U
	cWgvZoWHfk9uEbc4q7BqIspzwfkaCJA1D9k1qOF0cNV486GMcQnsMiBcT9UnFILR63GQvxZrh0b
	QVTD0bO3ARpBRblRrrPq7LgON4J4+rcspWCw5uBNPntJnDr+Dgn48jlQwQJQof7/lW0d0nEkwFC
	yNmXDrhIgQ+QJkQ/lozYWS5WNNbVtQ4RHQ6nu6/k74G5k1oIdfTcWkycMBHFRUt0tWlZNBhK9uM
	GkQgR5DwqrwQBHfjj4lgZF0SC9l8LY7fZislxlsif2PkB10hEGQJ9fa93pVy8WVP4lY4nGg==
X-Received: by 2002:a17:906:c111:b0:c29:f5d5:5a97 with SMTP id
 a640c23a62f3a-c46bde8850amr239585766b.33.1792858243877; Sat, 24 Oct 2026
 09:10:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org>
In-Reply-To: <20261022220203.91911-1-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 25 Oct 2026 00:10:07 +0800
X-Gm-Features: AclHuK_zKvVN-u_xkgLG7OpnDHiy6FM15-noft6nDg26HGMwK6XiyRffHviluFo
Message-ID: <CAMgjq7C6htO2bp21Bq-dU2feN2tXuxHaqgNcG5sD=u1bwbEuYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 00/14] mm: mglru: fix swappiness behavior
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hui.zhu@linux.dev, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, david@kernel.org, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com, zhuhui@kylinos.cn, 
	baoquan.he@linux.dev, liuxiang.277@bytedance.com, wangzicheng@honor.com, 
	lianux.mm@gmail.com, liam@infradead.org, surenb@google.com, mhocko@suse.com, 
	rppt@kernel.org, zhangbo56@xiaomi.com, lyugaofei@xiaomi.com, 
	ridong.chen@linux.dev, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:02=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> Classic LRU respects swappiness, while MGLRU only partially honors it
> when selecting the scan type, resulting in a much smaller overall
> impact.
>
> For example, when building the kernel in a memcg limited to 1024 MB
> of memory, with swappiness=3D200, CLRU barely scans or reclaims file
> pages, while MGLRU still reclaims a significant number of them.
> Similarly, with swappiness=3D1, MGLRU does not reclaim as many file
> pages as expected for such an extreme swappiness value:
>
> pgsteal_file
> swappiness   CLRU          MGLRU(no patches)
> 1            5,894,538     756,589
> 36           799,998       497,282
> 71           548,331       415,612
> 106          407,012       383,814
> 141          253,737       354,249
> 176          189,003       347,805
> 200          0             346,078
>
> pgsteal_anon
> swappiness   CLRU          MGLRU(no patches)
> 1            3,962,404     2,768,654
> 36           2,830,250     2,976,260
> 71           3,121,386     3,142,954
> 106          3,521,720     3,382,383
> 141          3,504,471     2,970,859
> 176          3,592,335     3,163,130
> 200          14,095,617    3,209,132
>
> pgscan_file
> swappiness   CLRU          MGLRU(no patches)
> 1            10,270,808    886,997
> 36           1,010,341     569,036
> 71           656,136       490,972
> 106          460,326       436,042
> 141          295,184       403,132
> 176          235,147       390,358
> 200          0             398,363
>
> pgscan_anon
> swappiness   CLRU          MGLRU(no patches)
> 1            19,341,957    5,960,884
> 36           17,530,774    6,394,951
> 71           18,624,264    6,673,569
> 106          20,088,558    6,976,364
> 141          19,686,813    6,206,580
> 176          20,936,177    6,344,854
> 200          45,313,873    6,295,581
>
> refault_file
> swappiness   CLRU          MGLRU(no patches)
> 1            5,795,115     678,254
> 36           720,877       419,659
> 71           469,270       338,518
> 106          331,584       308,983
> 141          174,509       277,375
> 176          113,352       272,390
> 200          0             269,349
>
> refault_anon
> swappiness   CLRU          MGLRU(no patches)
> 1            738,618       578,308
> 36           451,410       665,723
> 71           514,961       657,870
> 106          633,161       786,893
> 141          648,640       662,673
> 176          668,779       708,969
> 200          4,816,312     672,514

Hi Barry,

Thanks for pushing this series forward!

One nit pick so far is the test data seems redundant with the one
below, maybe we can just keep one of them.

> This model also allows scanning and reclaiming from the two youngest
> generations, including the youngest generation itself. This can help
> resolve OOM situations[1] and reduce the need for aging.

Right, the OOM reproducer is demostrated here previously:
https://lore.kernel.org/all/20260318-mglru-reclaim-v1-0-2c46f9eb0508@tencen=
t.com/

That series is merged at V7:
https://lore.kernel.org/linux-mm/20260428-mglru-reclaim-v7-0-02fabb92dc43@t=
encent.com/

The problem is largely eased as described, but it isn't 100% fixed at
that time. It will still go OOM with higher pressure. So before this
series, I could still see OOM after hundreds of loops. And problem is
gone after the fixing patch in this series. Unfortunately it's very
hard to reproduce and that reproducer is the best I have so far.

>
> Patch 9 from Barry fixes a cold/hot inversion exacerbated by patches
> 1=E2=80=938 (which also exists in mainline) and improves reclaim efficien=
cy.
>
> Patches 10-13 from Gaofei and Barry optimize aging based on folio
> distribution imbalance and improve reclaim behavior at extreme
> swappiness values such as 1 and 200.
>
> Patch 14 from Bo Zhang addresses the GFP_NOIO issue in MGLRU.
>
> After the patchset, the results track CLRU across the full swappiness
> range (see table below), with more file scanning at low swappiness
> and more anon scanning at high swappiness.
>
> pgsteal_file
> swappiness   CLRU          MGLRU         MGLRU+patches
> 1            5,894,538     756,589       7,394,183
> 36           799,998       497,282       526,176
> 71           548,331       415,612       433,353
> 106          407,012       383,814       347,647
> 141          253,737       354,249       314,437
> 176          189,003       347,805       261,677
> 200          0             346,078       188
>
> pgsteal_anon
> swappiness   CLRU          MGLRU         MGLRU+patches
> 1            3,962,404     2,768,654     5,362,153
> 36           2,830,250     2,976,260     2,736,749
> 71           3,121,386     3,142,954     3,246,589
> 106          3,521,720     3,382,383     3,074,851
> 141          3,504,471     2,970,859     3,178,409
> 176          3,592,335     3,163,130     3,650,544
> 200          14,095,617    3,209,132     14,538,399
>
> pgscan_file
> swappiness   CLRU          MGLRU         MGLRU+patches
> 1            10,270,808    886,997       16,246,260
> 36           1,010,341     569,036       614,389
> 71           656,136       490,972       484,769
> 106          460,326       436,042       367,969
> 141          295,184       403,132       328,943
> 176          235,147       390,358       268,142
> 200          0             398,363       188
>
> pgscan_anon
> swappiness   CLRU          MGLRU         MGLRU+patches
> 1            19,341,957    5,960,884     7,646,122
> 36           17,530,774    6,394,951     5,914,405
> 71           18,624,264    6,673,569     7,167,762
> 106          20,088,558    6,976,364     7,821,921
> 141          19,686,813    6,206,580     8,495,970
> 176          20,936,177    6,344,854     10,585,375
> 200          45,313,873    6,295,581     30,313,342
>
> refault_file
> swappiness   CLRU          MGLRU         MGLRU+patches
> 1            5,795,115     678,254       7,315,064
> 36           720,877       419,659       448,199
> 71           469,270       338,518       355,269
> 106          331,584       308,983       270,736
> 141          174,509       277,375       237,643
> 176          113,352       272,390       184,908
> 200          0             269,349       102
>
> refault_anon
> swappiness   CLRU          MGLRU         MGLRU+patches
> 1            738,618       578,308       1,383,725
> 36           451,410       665,723       543,071
> 71           514,961       657,870       683,874
> 106          633,161       786,893       669,716
> 141          648,640       662,673       719,231
> 176          668,779       708,969       901,918
> 200          4,816,312     672,514       5,511,787

Right, that's really nice result. Do you have system time or
performance readings? BTW for the performance reading I think we can
focus on the 36 - 176 range. If a user asks for extreme bias towards
anon/file, they strongly favor reclaim priority over throughput, and
the behavior is arguable at that point.
