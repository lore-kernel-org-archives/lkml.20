Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415459;
	b=BJixpfRhHcUfdMSFkjOt7aH5Xc5E76ODUQBiRofM8zKmVz/vmpAJHahfGdRBmRC2TV5D
	 SRraTE+TB7Z5u4geN7TO03M/kTxaduie5X5arNabXJVTFVBRKxXjJ0XUHs/G74rBMne7z
	 UqXl3iQAcoIl9QCqU6ZyasssfiqY6PZ2G7fV1HJ7708PKXyf6OE90NOwkcie4YIthKvQY
	 ZEy/ADwbgYZMXCluyE50orqxhJSZBIfxCAQ/zoNAdOnrudg6JjE9CXEhiS0WyDj7KtQVi
	 umQn3b9yZyuPuNwOiL+SZFEVWS3xm2n2g5wdyIkEjdZBq6xWMh8Ry/LC/A7jvjgG39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eZsD1auAFGH9focpKeQLt7lmstuziSR0maGDEOD7IaE=;
	b=3l+yrtFu/DJhjmclILTPSRFZa/khRGnK1j9EYVyLJ1hFA7gQqyUwepTaqtxi2skXxFeF
	 X6nFxrhEE0ivtpUOzquUSLTL8MLnuFoqYuv0GOTiEOoqXFM8HNGivbDrwBR6BnakindRd
	 QTya8/bJK1ygyQRJktGt7YOHCcBYZDOwdYHaSUHcB9gV1AF5ch6+fXND4UQ61UjyjzU6k
	 JW5dcNwFM0F+c+EHpv9ZDOecAnEjqcsn5+LXU9UWl65dK8CSilK2szTUnrTsBm/xLmSHf
	 mAzr6aOecxChj81tBBIwS/sspGpLhm1pxjgQp5dEqIxZPqrv/iy3lGsz+akQW/1dqcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=iI4OC7fW;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28894606A884
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28894606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=iI4OC7fW
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5efadd183so4751b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794415458; x=1795020258; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZsD1auAFGH9focpKeQLt7lmstuziSR0maGDEOD7IaE=;
        b=iI4OC7fWOaTxQb1PAHqypE881nbpOEz86R8L4wII/UwdbIOBpmEfi5J+ZIyt3xRKZb
         Q1dMk5h1hGQGA2foYOr9hcC+tw6/QDxQvysptHymI7pVRHH2X3eM2vYOzA3UfR1fyL0Y
         ySF+v65DQ7qlB3IaLEDQj2lhhPxODAKM7NmQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415458; x=1795020258;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eZsD1auAFGH9focpKeQLt7lmstuziSR0maGDEOD7IaE=;
        b=HC0g5jYrg6qcp5fvS3jskxKrMFIFl5NjX6ZC9VNa3Ifuls1hpght68VSOsp4Vlqa6L
         jgoQzLWdkL22fENCR3KBTEavTefDIp3+nFnIIX0XAo6XlGZ8kozVVkCFa4yteQ2AvzWx
         vEZMl+qZBa3otr96UJSjuzcXzyHq70GRdQ98DtY58nBRAGX5DOhx6OMfaur7WnjdrRbt
         g1KLfah9HJ33zy2K4dfQc+GOvmqEuoDuoeKzXKg7REsBHm1xo1klz3024aKARoFNxm8l
         6Wj+VPgSP6tST8hEpvcIUNPItbHjMUILok43XqCAm8CWSrB6YTZnKSh1va5/DJ90YZeA
         +6HA==
X-Forwarded-Encrypted: i=1; AL+hErG6URMKV3XnZVqLUfbmJs9aj4lnZzaYTYLwriouLepcxjEC3o01ArKNnZ0FuNuFQdwvw0pYggqQxdmGKn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TsnNCmW/BH8O2fnPVWf1Zlh5tIiuhHJZ7j68TXtqyF8k+ffCv
	cf6TTi5kEkKEDLpo8vBQRg9Z1cT2+8VAh7Fhjm9nvvMvgejhcrN8hrrYKAQS47yAm5kUYEvcVHw
	BwHd6W5kulQ==
X-Gm-Gg: AYBFou0Ebwain9NVyIAZDP1W8r4a95eIIMd+5egnf/QnF4TGwZzCLfWDsZZeUgytxch
	xIwLC+gUPtJ/h5PC8eEdaCvjGNFkPuXUTwAU61ER1uCUiUAuwmgXS4U2D6X+TSfqzCCFqiCfM55
	6wVxnqw2tLIe1Fkvhpi8NlBvNok9lOTHjtroETklrEJ3wwsOGg6jSvAIm2wg6WiNExs/o0fen5T
	mBtBCbQ87sEKIXimrjphxbxHpQR8atZJyhbCnZ4X/QS+Ksg3OVtvhJutVcYnh+WINbOlYxvv+KC
	MF/UyTdjCNPacuVLByHM9iH0NB4AM/EFe9g2+vn1gFGWUFn1NAcWaIY/QEpoXWWb1zBti1U1BzR
	753yE6vwsZ0MNGzMMflAa7jm77B9w445xcw8/G/p0CNSGr/HLUtObp5r7CbEGJYD8nihUirJSlj
	8STczMFMISoGpbk93gY6YGufBkA0F+I84PucIg9kz0gYA+Jvn8ONU4Kii5e7+25RD3/PJuog2N3
	lDP8dcCe97Rp0Kr2Fect3x84VwozYTXc/Jo1OrI8bTV95Jkvyw0f6R5uwdHtYDXqVzryPh6lLVA
	yRchU1c3PKrfZM3KRn6kSB7++ZKUOIdkfOWEMKNDDezKrDubouRMBncrLoDkfjsqyNztPUf3qRK
	zUpg=
X-Received: by 2002:a05:6a21:890e:b0:3e0:c2ce:3f71 with SMTP id adf61e73a8af0-3f631b88f8fmr7381637.37.1794415458268;
        Wed, 11 Nov 2026 08:44:18 -0800 (PST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baabad405fsm2204259b3a.57.2026.11.11.08.44.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:44:16 -0800 (PST)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso16064a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:44:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF2Y21PoNxicDxdl5iIjCcu+3uCofEC3ugVSgCJUYgcGCHnJ2VeVuysmbU/2XMERAM41fhj7SZTIE5yyXw=@vger.kernel.org
X-Received: by 2002:a17:90b:1d45:b0:3a0:cca0:4a8c with SMTP id
 98e67ed59e1d1-3b197c817dbmr35589a91.7.1794415456305; Wed, 11 Nov 2026
 08:44:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-2-kas@kernel.org>
 <avNuQqLf9CG9dSsE@casper.infradead.org> <20261111-heimreisen-ungeziefer-empfunden-a892571f2c07@brauner>
 <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner>
In-Reply-To: <20261111-thunfisch-wirbt-waldrand-822275b2d3b1@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Nov 2026 08:43:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
X-Gm-Features: AclHuK9b6hltBFcCGqxpbtG8UmrJwldogvwXrVDW7-YQ5_XK3IWVlpv59flts7k
Message-ID: <CAHk-=wjPY=kfgnmtx4COEQjD5UzKx9m2-=KLGAZP4d=RKEH+pg@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio_console: copy pipe buffers in splice_write()
To: Christian Brauner <brauner@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, Amit Shah <amit@kernel.org>, 
	Jan Kara <jack@suse.cz>, "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 05:42, Christian Brauner <brauner@kernel.org> wrote:
>
> So the fix below is what we've done before for pipes and I think it's
> the right thing to do here too. I put the following on vfs.fixes:

Please no.

> -       src = kmap_local_page(buf->page);
> -       memcpy(page_address(page) + offset, src + buf->offset, len);
> -       kunmap_local(src);

This boils down to one memcpy.

HIGHMEM is dead. Nobody sane uses it. It *will* go away. It's already
effectively never ever used.

There are some broken 32-bit arm setups that use it, and legacy museum
32-bit x86.

Don't make one memcpy() that can be inlined become this garbage:

> +       /* The buffer can span several pages of a compound page. */
> +       kv.iov_base = page_address(page) + offset;
> +       kv.iov_len = len;
> +       iov_iter_kvec(&to, ITER_DEST, &kv, 1, len);
> +       if (copy_page_to_iter(buf->page, buf->offset, len, &to) != len) {
> +               __free_page(page);
> +               return -EFAULT;
> +       }

just because of broken shit that nobody has ever complained about or ever hit.

              Linus
