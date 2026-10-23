Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792779562;
	b=D8imjeDHrPuDuFhO23m6WZ3MD8gv548Hy2oSLPJ3FHebfgXE4yudsUbShw4QRXLMDDUe
	 J2nG2AfJHkvlP+2O9/QZ86oyt+gDviMU26VzPwR8oAeBq8QPX2j1m0UmGxAjCIvkSQzLs
	 iX5n//vNVhSBhRK9cdq2cnxe+kxQw9YtY8+ToE9sVmSEmnYMn2gQWIqDDFcY+H9orwuiH
	 +gAPwdkdvv+9psBfj13mHAw46cuxDbf58L4SsdQjCJ01zFWlbn2MmN6FnNZ4322+D/FBW
	 i3hQga4tOtLDF6nH4vBo0ZyyCUgQ+a8qxEWDAPa0reTRntAF176esTIpEL76vV5eflQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sf63KFDDNNQERzVahv0eOgq9vdaVcq8l5ll+ubDdbTA=;
	b=Bj3+bn5yL4RYkjag2jDJD7FN1dw6Fh4qRWI2GA883qq4u+gWK8IPnfgShXJ+4G61y5FS
	 4+MSBRykuszQbajlqLVhsFoLs6u5srwH3uj6otJ86sGX3NXN/5tLApxuOusRawV3+5pLE
	 xJgIub5g6l1ld2BIBx53C86PBLRDI3wnxU8AKMh7+AFznD90NyghP5X9H6rZYWIEKIGEa
	 beHm0mOF1tlLz9dGSFMgRMt8h7Y5Tu0Yn1nGyvtEB2Oh0VbVpTkgTZ7JJG9ETn5sJCK7Q
	 ATmnPkrweGjUPXXX1oNxXLm3cLKvgPahBVpEEkyCZSZ9d44YInAcUy55M1pNpknnvyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BBDe59so;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BBDe59so
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so727552f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:19:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792779560; cv=none;
        d=google.com; s=arc-20260327;
        b=K8oDMuRQOd77yLz2K2NZWQX5Lf9SI8SI++iVxLJYHWfbiZDs46RcSwCLqifCfhB6yq
         RyO58yvVF6BcbWHSd7bGBYkVo92YgWIJE2ZskSwhSyTYn9/P1Xp/0Z20x3V24NZ6gNoY
         PQb32CA4/daKwvZ1hQkwyfIspgFw8w6xPVp7+sNZ/KaMRZnWOUKS6MP/zj9qBdc1jHLO
         ma+/4Vg2a7ruc/bYD+yOgoqEyjCaf3DLBmX/44Jh1YCnFQYC2GFjhGmgd67up9OgXq+a
         RgG85NgEjGxCuUsg6ZtBFYJawsMkZ8GIfMT5BHyEHvrJTGLYf4b4JmgRB41bP94uSJnE
         u1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sf63KFDDNNQERzVahv0eOgq9vdaVcq8l5ll+ubDdbTA=;
        fh=iImqOGjBMNB9XZheqNEl/1YjWfXNxGCBWUWoKUeSYqE=;
        b=a2PO4zpRLu+47QweTsJVn8mn2BJpleeuJPYCO8xdpfGzRhwV+TxdnWXiHqB2MayKrv
         cPltCYsDMqAOpxSAywsG0CbnPRKlT5JZUj9ApvhTy4/alm4/kljYCrDJiivGYBmISj92
         NXNJPqs04eHU1CNsBdrirhGMzQ83sU/2oED6/X69O2WNugtbOaV97aqsBHLES/SJYpfc
         wpscRo0Esv+EbeDS2JqxC9KYEeZcAFQ0AcIWvbWPfFgO/WiMOyXs3BsYKacGDp5JR38Y
         m5FeWAO6meY9NzxjTzFx7hmZ8UHPcJ3Uzl5cqlncjdgvEnGXL8Lpt28z7QnGaq35EzZ1
         BG9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792779560; x=1793384360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sf63KFDDNNQERzVahv0eOgq9vdaVcq8l5ll+ubDdbTA=;
        b=BBDe59sorH3ey9ncvQ8jxLzMaypcvb9JmpozFNmxG+0UhPkZxLLRrMEJP20fzxpkGD
         qZoKsXRemYlyRqaHAHur/TLtEsnaYJs3FQH9/dFlpU49ktIUx2el7C0xwTlKfA/HbwpQ
         1yfH8XqLvKpnH/zNGjvyTaSQcAWCdy+NoPdFI/vttof0uje/KCUqhmJr1Pm8a0Pq8P+Q
         4Llr5QB5O4hx+q5fLA+Rmws34llicN8FlbeCu3vU8CqsNkU+NPGF5GIHhGjOulcEoJQG
         dCu1xjV2umDDfNfM0w4DHSh4WdMK1ljoaeDCGprHns+5WGMymEqCDl4AuqQfCPdIqXYB
         G1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779560; x=1793384360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sf63KFDDNNQERzVahv0eOgq9vdaVcq8l5ll+ubDdbTA=;
        b=cI5ktkK+AainsENwfPIn+t19eCbyfKJACy7vLCqZ2Q9brQEfgybcBoIvWVT4rl3KkE
         Mmy5BJSxxkBw5B+tJFeIpoa4NvL2xJtnN4Xaieb7pbKJuzvIrlO1kE0M5fEvKBZ0OWas
         g3xaRKICEXpTUbYP7MRJZODyCy0ABMxamCa4qsbyzJO3GGGuK5dTpvEr+lDrl8l8oYpp
         68+Aovsqi+VYpc7bA93TtrSO+DyeAttjz7ZYaV9kirT7Z3Rz5C8H3b4A07V1EBuMEdwM
         5Wi8e5V6K3IHBrjbZWZDC652/oKPzFm/FT9Tx2MuPb+aaf9WuNLFpCxaynVWW3zsBR/9
         WULQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGKyZHupTrDFjI3pLCyxTNGzju+oFqkydUvQFAvaDfOyUotenI4jYy+3qYoLQ8oIKM57bFUMnlVoAnuNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpjU0OWu5VnAhS/9Uivam3fd1tGgfqka6SfxOU2vRUKrGCqSbI
	tYvdiXgvH6VdJY6V8dCp7162XEZnnV593oRIRDbg0QZYEZhVkE1lw2JDVDGcymRAZ+G8/H3Frbs
	qgtyN/B/YQAbDqdblQgSP6Wwbp57hw0M=
X-Gm-Gg: AYBFou1ZSnxvD5G1hqT41C90XPx7UQCOLPuRU3hXHCDxe0/+RYDoqRXlAnDXqqLtxeQ
	6xEjrTJ71uysfMPa5wFK18qQGhMPmsatNYfxoM9OOyw2/ZB1bDclh2FcSmD336aFZ9/KWHC7pPd
	Kq1jmvSiAaAYhd5pPyL/ADK/BC8YWx20JdZXSWUVDlJxNkg3Q7MvlDxSRq8yGGpj2Kh9nRDAbDM
	+V6D+Dmzl9RlhlrYEcCOT+v5lmnKa7gk6CWZ467VRW5qsTirrEIH3/ftdN34l7Jo6UR5COYsHTZ
	LGroG512wnSqZTvHo+R9jB80tEqFgxEDJkuABBLLtK3w+KBDs6d/RFYoy+f4ERLiwEvfL5BaeWn
	ZinZZybyXMpOgzFoUiBbYkFGru4SC/SeYz215kWhl+TGkfDc60PlPfUn9M+QmuX3nBsVrspogFM
	+rURKiN+p6mgw8CN4wQE24yqDrGQeAqKf5K9vyan4BxlGf1FA11gBp
X-Received: by 2002:a05:6000:26d1:b0:48c:4444:f0a2 with SMTP id
 ffacd0b85a97d-48e38546c63mr4724859f8f.7.1792779559823; Fri, 23 Oct 2026
 11:19:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016120927.3191690-1-hongfengchen@xiaomi.com>
 <CAKEwX=ONniSwdiZAe_8NT5XwVj=Mmc-WJs_rWE4Y5snjFg2=Eg@mail.gmail.com> <20261023123736.1542117-1-chenhongfeng0212@163.com>
In-Reply-To: <20261023123736.1542117-1-chenhongfeng0212@163.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Oct 2026 11:19:08 -0700
X-Gm-Features: AclHuK8IXUKXOT1G5BawvIMJ1TanzNZCOYP2ZLn7pIObqIp0SWbrNFngRQ39xBY
Message-ID: <CAKEwX=M4jTnxmq6cj115Gw4u5jdY7Ex65jPtVTEopW70jGzfuQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/2] mm/zsmalloc: defer object free to per-cpu batches
To: Hongfeng Chen <chenhongfeng0212@163.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jens Axboe <axboe@kernel.dk>, 
	Johannes Weiner <hannes@cmpxchg.org>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Yosry Ahmed <yosry@kernel.org>, 
	Wenchao Hao <haowenchao@xiaomi.com>, Wenchao Hao <haowenchao22@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	Hongfeng Chen <hongfengchen@xiaomi.com>, Hongfeng Chen <chenhongfeng0212@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:39=E2=80=AFAM Hongfeng Chen <chenhongfeng0212@163=
.com> wrote:
>
> Hi Nhat,
>
> On Fri, Oct 16, 2026 at 9:09 AM Nhat Pham <nphamcs@gmail.com> wrote:
> > 1. Would memory freeing be slowed down?
>
> I sampled pool->pages_allocated every 1 ms, and measured the time from
> the start of munmap() until the zspages are freed. Three cases are
> tested: 1 process x 256MB, 1 process x 1024MB, and 4 processes x
> 256MB. The results are as follows:
>
>   workload                  base      with-patch
>   1 process, 256 MB         14 ms     9 ms
>   1 process, 1024 MB        51 ms     31 ms
>   4 processes, 256 MB       45 ms     24 ms
>
> Memory freeing didn't get slower and it actually got faster.

Neat! Thanks for double checking! I assume this is because we're doing
memory reclamation in parallel with the extra kworker thread?

Which brings me to the next point:

>
> > 2. Would this introduce isolation issues, especially when this work is
> > not properly accounted?
>
> Yes. The drain runs in an unbound kworker in the root cgroup, so its
> cost is not charged to the killed tenant, and it may take CPU time
> from other tenants. I'd appreciate any suggestions on a clean way to
> handle this.

I don't have a good solution either... This has been a blocker for
other work offloading idea too.

+Shakeel, who might have some ideas on this.

But before we do this:

>
> > Another thing I wonder is, how much of this slowed down is because of
> > zsmalloc's own inefficiency, and how much is because we just have a
> > larger logical footprint
>
> Mostly zsmalloc. I kept the footprint the same (1 GB paged out to zram,
> then munmap()) and only made zs_free() do nothing:

Is there any more juice we can squeeze from zsmalloc in that case?

It would be nice if you can perf zsmalloc freeing. And yeah, maybe we
can't optimize any further, but let's eliminate that first before we
rely on offloading.
