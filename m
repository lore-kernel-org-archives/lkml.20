Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7BD3D47BF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164329; cv=pass; b=fvNbXKMtCBhakqNGCSFBkSEnzm0xDE3WDHvobgShVcVHJwFyTDGWl4DkTWqOgS87Knwf+db8eE6rR3A3+sNVd5WYx8A6VkDMT8YaQTkaW1Um7eeQO478HvCcQsM9SszNmMz2XO/gO2LIxu5YMe0o4sR9aUPSNkE7DdF+nIkCUq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164329; c=relaxed/simple;
	bh=sD6vhg5MsGN+btViVFDykTsdqmpJvIDQmR5Kspi7Sis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxAE84KDH0qKqOW06N2uxoKlQFQzng+UmHNkkX+mLTIx9RkoUIFF2yff5DTyo8WN5weN5dZNHh9zbHsb2+3JO5E2JU0zBRXSR2nsyccEronPkLXmLd2GrBZGE5B5c82V748U7DkhhNYvgAt5xKAulPOkt4O4XVMauflo6laKFJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=OfFHeKMs; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="OfFHeKMs"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52eaeddc837so22917931cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788164325; cv=none;
        d=google.com; s=arc-20260327;
        b=jcl+8YWObg2roqk9taYLatUrrQRwFqhBkJ3MaTDpizd2WgmdrmQgmBr1EmQ0vs3pqh
         SHZzMn7e7ibXnKSgtysqI4A6xiz5M447ewM4G1nqLjlchrLgn2F6q0Zzw+p93+jUmyzc
         JS0KRDdZTVcGfV0rFkGox+fSrrPo6/R1wkRCWbfYImxT7GOXcytB6phx5yDURR4I2EGd
         mJCC2dVAYus3T7SGAG64oGZAvJOoKDL6+1XBldJo536BGqONPohlxk0VBw5Q6eCeY5Dt
         ZQLWw2J4nSVUpuMMh7Z7x5krVLExLNMeAbfsnnzpUeKKd5kmRi00LlfCLjzvzzpHqt96
         ItLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xkiZoIxNervah7q7cypbGBqjGwr4LoCCTOgNZ2t/KAw=;
        fh=JhGNEPRGtL+8m6NOt70MkPjH7P3iwViZ8oL3KrT3wzA=;
        b=d8JG5gjvrz7mVM5RYnvD5cpuckfMujqZ1VTRD9QgucZJ2PAFQLusZIQqJomMMYfiyf
         5Zv5Tywrlw38HL+4Z+BZe50wDZJkToCQj+mOsFzM0Imp7KHEDxNPV44kF5JDUNkiUXqA
         dQXFfTCAY3M0uh3L85ZZm04v6TKWz1ZjYv7GrWwfqxBYCzVUfZRdl6byDFZwX+I+Il6B
         l5cm+jEkB9+OS8n270/Ba1HsKvH64LTDJAUfv7xynU5Ra257iwRWlm/lOj86Kcz/XVuH
         QmjhuYI5mrI7m3lsr+JPV9No9UjY+tH5gVFH2MafmSLGM6xNULW1oI1D/B5Owgqu0rj6
         zt5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1788164325; x=1788769125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkiZoIxNervah7q7cypbGBqjGwr4LoCCTOgNZ2t/KAw=;
        b=OfFHeKMs+lIUuWJEtJIy1Dbgk/XKump7L8AmjnPaLZlawmQlItExOplROTwQthx892
         Qvh18y5yk5BjqfpXKsNhchg3lHzpt/+qTCOzuIOP0imDHR1lTT9Vs07OPEUJOL4IiZ6O
         dpjVFiPG+OrcfBUH2dtJ3oaZ+H5axZL9eHejE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164325; x=1788769125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xkiZoIxNervah7q7cypbGBqjGwr4LoCCTOgNZ2t/KAw=;
        b=Y04MD0jiJ58F/MRKcUTGrqNKOmiUPDENC8moUx/n9YNDT1TFtABBtnTHt0pw58N+QF
         9RWZl3Z9ca8HwwMivJd7HFjC9qQRdwtIdaoQRCixg2+qgHwFjoo4Iltme/UeqjdhQOtF
         NOZXJtmWJEiAmwh2zAcxNMAP8n2pP86whU5nHo8LNv88gf3SNazoy9NIFQF2EuIj8R/b
         BuqlVH7ffMgNXhTm0ZEw3zItsm4RVRNNI8z4PStCvMapQNzitSDDYLF/SmwCp2mC07HD
         ch/4Nu8f+wizJh+phmMlGDJVZ3ZkhgILludCa4IGd0AWAlf1R081frsg3xxMl9VbK1nG
         TEXg==
X-Forwarded-Encrypted: i=1; AHgh+RqLC0FDr8X+JBaI1HATtXfectQSrpzNJ5H2itCC30/3p7hNO3yrOBQTLJ2QXY+NDPRPJz7Q5JpYlbRvRv4=@vger.kernel.org
X-Gm-Message-State: AFuF++lgJ3OGzjFeo74yJL54L7drDOWz8SPe57Bay8ubj/rlZJ8s1NFx
	TwT40YsFQ38Zsg7FwZjthZg4OKmVj4G/JU8FRj5Jmx2JdlKHKnmRkjRso1sjJy8hheNN73n6yyd
	lJwvctsM0B+cGiYBEMChx7wgk4DndhMP4/qRPaoSlXg==
X-Gm-Gg: AR+sD12ZaGkAT3A8JZdSpA4bJJt4ENOaI6nQI+85U2m8bjzO1l2/YWOrLPCghek/f5E
	r6jouzIjkvKBNkuFMrC2XO9krweR+K96g13Qt1dgPLoZ2u9yrD6hLirKthM9xPnORDRFAQyEYBQ
	bO6+fz3KSke4VbQTYIzpGub7XPAxCy8DEmn9cKTPIRa7H8WwBg6KzJOHiiTXnSpUuMqIh8SsArj
	CoLK5n3WU3CiVUnUK0VeQm4ClM5hIRJ3x1CYb5xgwy5sOB/aIPkWFmsoz6cctX8BNNaLDjcY1VG
	wSRz99dN3fCYHiqNwkkIa4gUNVKdbV6L1x8KWLvQ7whxQmif0/rdAnQfhFCUAVgwUJWiLJ/QjOW
	iXdfmOeEnUZM=
X-Received: by 2002:a05:622a:1b0e:b0:51c:1cf8:ca4d with SMTP id
 d75a77b69052e-52fb94b76acmr354793171cf.13.1788164324676; Mon, 31 Aug 2026
 01:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827170718.497-1-aa9736195201@gmail.com> <CAOQ4uxjxDV0U9yrDA_StN968P_6cpjRAN2mBCx1c_RYd7BF4Og@mail.gmail.com>
 <apGCDtf-gE1osJqE@casper.infradead.org>
In-Reply-To: <apGCDtf-gE1osJqE@casper.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 31 Aug 2026 10:18:32 +0200
X-Gm-Features: AcwNN1WtuG1c2F0CSiDk17jHE9we46hn9ZVdZmfYdI6sy7esBdj1sJKhsZBvuCE
Message-ID: <CAJfpeguhxCEs3pZuqAZ-gpG5gm7NV-TuzniSkCCrgAQ-TV6ZpA@mail.gmail.com>
Subject: Re: [PATCH] ovl: implement ->get_unmapped_area()
To: Matthew Wilcox <willy@infradead.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>, 
	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, David Hildenbrand <david@kernel.org>, 
	Linux MM <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, 
	"zhangyi (F)" <yi.zhang@huawei.com>, tujinjiang@huawe.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 14:41, Matthew Wilcox <willy@infradead.org> wrote:

> No, not at all.  All this patch needs to be is:
>
> +++ b/fs/overlayfs/file.c
> @@ -657,6 +657,7 @@ const struct file_operations ovl_file_operations = {
>         .fallocate      = ovl_fallocate,
>         .fadvise        = ovl_fadvise,
>         .flush          = ovl_flush,
> +       .get_unmapped_area = thp_get_unmapped_area,
>         .splice_read    = ovl_splice_read,
>         .splice_write   = ovl_splice_write,
>
>
> All this "oh we have to call the underlying filesystem's
> get_unmapepd_area" betrays a lack of understanding of the problem.
>
> And Lorenzo suggested this in the linked thread:
>
> https://lore.kernel.org/linux-unionfs/69b72e3d-b101-4641-9ce5-51346c93a98d@lucifer.local/

There seems to be a logical fallacy in saying thp_get_unmapepd_area is
the most suitable value, yet not making it the default for all
filesystems.

Saying this without any understanding of the subtle difference between
setting .get_unmapepd_area to NULL and to thp_get_unmapepd_area.   All
I can see that the difference is indeed subtle.

Can you please explain?

Thanks,
Miklos
