Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222442;
	b=J5asJBYduT/fopZ9j84Pl2vRswKTphwI8hP2odl42/4hHA+dUdiXODzYMBlAcmB0blfH
	 HE4cSFj43FoLJWRRDCCSPZVNPQwU+VLlJ4rkTsR7NQ2gZScEKOoGtokn2iD42M4mQ9mtf
	 t7a46Cvg9A7zAR3wO1f+bhnKmNn3Td1gtadXp6oRX9UW1jHQdn3ItCRuCowSvsk0K0EOr
	 3EZRVWEd2VXiv7sh4tNpq1CGwPa4468c8H1HrRHGeY3JM767ZSgwYAfimG4Zj2Dzck6sJ
	 iBADiF++WMQ+vGTZglqaVhZSOCPRMfttBtaSpu7vGvHzk27TxxneVM/UkCu1tgufbwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=;
	b=z8q9xN8RGFNZCZLQq3EgfZDmkezDstS390XvcxsS1QpAm7JZaUqkr5BnxVfe51jRHpRW
	 a1wdXBDMu+u+xjQFqaKnbfoDn1s89M4nx37d4fnBky7jK1EyHSg+Yd91wE2f/NH73630t
	 T5BypqY1d4c0BwcR3sdu1kTKwBbexZvy+Qtmx04fzz56BQiGREvGOlcbTE99mx3HReKZM
	 I/SMf4jZ0P3TGepwm3C2NY9zhmeVJ2WA1UahYBYvyWops1vDARjOaZGNtqJdnppfU9f1T
	 91JaE3PG5w3HsADNRgi3NlNP9wFzvt4fXpsoIdz4GaXgxBMt0bSjH5K12hTR9uBeeDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZ+qip2G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1B3606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZ+qip2G
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so5679475e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222441; cv=none;
        d=google.com; s=arc-20260327;
        b=BJjOtM3oL7eqU0c4OEm3EFdlgwuJEgwPhdLDyhjEIt5K48dvgqhu8BmYZArKMrhiBt
         QiU5BBNZil0CiFeHax0TDXhYJX4yhLoLZOvhWiipB00YB81dVhE493kMgmDHR0RO/FE9
         /TkIT9UozdcGU3Zmnd29RV1+tWuoL7++hYjXV29+1NAPEc0SFDvb27wf2Vcrouy2i5rj
         qmnbIHIGSxyHdF34wPvv0X/wjzd6dVSzyjfHpoGzKpXkl1K1gY/Y39F28pQ3FefEtsD9
         iUssayEVqV1SpKw3+1YCXrlFFUj+3Vyh0GwTGDw3Z5AtpSA61E35Xdny/SAsiHkVVsJt
         oBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=;
        fh=FswkpDtObjdwGdcJO8wp7leqwmmuzlb4PXsUf/pJsZU=;
        b=Zl494O2yjQDqEOSsck6XCFL1CSfbitWNFDh1mH4CqCQVcicwbxXwWZ5QhTtBa2bQ1W
         nTl8lh2jEaOEjdIKmXore4jjUqiubC0ubhM/qdkF71As4Fx7Q4IRmaSX68TNV07gp7AX
         mEoym1QRnWbcbDGBbPAwHrzw79RNedFp71tMxqr3QHzSf8fnfBoux/hKjoUHmEua13Mc
         tOxnpb6ZwIG0ujIg99SblA88QG3DcxSvhc+dD7EcBLC0bmy0CSvYtD9/hSvVLt72IHEu
         tIu3m0tivYckDz2YfnCpK3daKdLXpxQTuQgYx/WuOY/iVEuXKpqFJ6DjOAyDvkhboLjM
         FtBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222441; x=1794827241; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=;
        b=qZ+qip2GTuXv2VkES+CE/K8B/IkQ4/E+MCis3qZVMie+pNMNxtr3k4CMcCFKi+mUkZ
         WfwLB/a27T3TjaH+YqsS/dKj0TE7mDF5VAV4VFijGQTtXysEPGmTz9cTCN7BgjGWUmb8
         P7RGMUo9I9Qr05ukfqh1NCe+3e8CfZep8HfBHCZnXrrkPIfN6294msmzZjwP+iX6dTim
         BsDAre0L9+bVzsUuKMcjMUlrDgFynZ0NemIlIvYaijLYtYc0Mt6vrj7yUyXs9zLHqtz0
         HLa2XW336NOWeOqhZmRJ7zHKja9CbOAV7QIRHNwH7K59Z9RqG+BgE56pLIxNRC5U+hSF
         npEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222441; x=1794827241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=;
        b=QI/6XAxFWP+je33KOvkIcrrqlfIXLvnFUMjt4HGJGFBywlwDhjMgNv3JoJngWtt244
         ztw0QDfR/FkEBSwllxe/9txzM0L4X4/aLGVk47RNEM6ghun04IfKTxIkrIe6//zg+ODa
         bzLafYMFw8L+9uDmh/al4ImDMDPzxm6aHI2WawLt82ELPitVB1e9gqgJHz19ZAjlxZHz
         FXTJpWjANL2ADxEekDaxCJocve7ik8ss0J8PNZxvazzj3nYW6d8E80s/UYlf/QpC0sWE
         9r0mD56YhADKyTlIq7S9gIKvtGcaLrS0QnkMMMGYTXsp+xj48HUv2ZNeR/idKhBeOGBt
         DkQg==
X-Forwarded-Encrypted: i=1; AL+hErEqFCBy3hlEeqfXl+BQb5oISE35rmCnzkZWYcV6GPiJ9OIxvqBbcqN7Zu3K6JJxxmyA91niwTKyj3oHEMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gaP5HeXsG4QV3wvKOhTP1I1MxmIs9200QxcKbO7/ivYIcOYeI
	FM8BR2WI6HFBXuyGKnOWrcPeKStrklir/tnzefYp2DCbrYsC73iVW6xEFsRB2K9tEgTeoBipk36
	Zo0x+GoGUW6noRIeVzDRszzTxwcRtD7I=
X-Gm-Gg: AYBFou18Q7ogxnyvOxwbHgon9DhVvfm93a+qHAdv8k25nfmL/GXMZ1Yx6Y6fkLN6TkQ
	vDyDIfSRJDi9nnpmb0dCAw59qWnFw0mWwI+s3AviH3fackTaRKUqztm2hlC5F2AqHzl00FmMaUS
	6kkoDaDj7id31NHAkleRDd86O7ARwdLd9TcMpmSBB3DuBS30QQB5LHJ5Jd++LeV1CFd8t5Z6KUP
	N/CeuTaxUAFFQEhFaWJeWcAB5A1bLr+ck1gyl4owOik+yWMlPeuawBIbe6j+w1lp7yI7Z8Uxlwh
	sDFUXzA7S5XCek23PutXcuOPXaLubvzmK6AqG1601fBed2CqV93BHS6Te2ZXmktH+q29mkyiLQQ
	eW/LW10N0IIbUXJEwb0ISojfJ8JUfLJa1mgfM6Q==
X-Received: by 2002:a05:600c:3b04:b0:4a2:e0c:2b0a with SMTP id
 5b1f17b1804b1-4b960e9a794mr69581505e9.16.1794222440621; Mon, 09 Nov 2026
 03:07:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com> <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
In-Reply-To: <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 9 Nov 2026 19:07:23 +0800
X-Gm-Features: AclHuK99Avp6YitNghM646M3nFfapLv4xavJ0UAfEt09SDcSvaVsVIm1DZLJeo0
Message-ID: <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com, 
	linux-mm@kvack.org, baohua@kernel.org, dev.jain@arm.com, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, david@kernel.org, rppt@kernel.org, leo.yan@arm.com, 
	xueyuan.chen21@gmail.com, chleroy@kernel.org, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, ajd@linux.ibm.com, 
	jiangwen6@xiaomi.com, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 15:08, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Sat,  7 Nov 2026 21:49:43 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory is
> > physically fully or partially contiguous.
>
> Thanks.  This looks pretty mature and reviewed.  I'll add it to the
> pipeline for linux-next testing.
>
> Sashiko likes it.  I'm working on a different AI review setup which
> finds different things.  Very slowly.  I'll let you know if anything
> interesting pops out.
>
> Do we have sufficient ARM review?
>

Thanks for picking this up.

On ARM review: Dev reviewed the earlier revision in detail and
his suggestions are folded in. Leo Yan tested the large vmap() path
on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
and others.

Wen
