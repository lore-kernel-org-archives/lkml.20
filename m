Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920876;
	b=ojEINcCThRL3FUhBgP4YSY8cUCb1fcIc/p1ku6QEWzcZQR3DhJKbdfi8jw+/wcRJQ4iS
	 SHRGemm7k1/OvWNt7nDySmHQT03O646n3ptw/CXttiyZx9dORvGdgkWVvJMTe9hS0FyHo
	 4wje+lo87r/K7xtiI4fW4krxZ5A03/ZYZHHFJSv0WkEUTQ3v/wAlP1Q+WKpm5qNdTtf3w
	 HKsks51abayXs5z8y3Er3EAnOMn/q1Vle22YnRdWHAUH3Jgm5Jwu0nAHwI8wgaayaYUR5
	 CYMF3p4V3VJzd0cQBenqNIU2yxenyG+lrUgFKVJQYwGhqdwVliC3o+DEiUkstCQLVdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7DJk0IhM38ENV4rjdcIdtMGuR5PCfXbmy3NasqzQYOc=;
	b=OhhtV0nr+Ndqm7wyGykzMXoFqb90TfmL3tuP3VzhSjnCZryGyp/WxyT77Q5LywRGAQGs
	 vfnP56Mxn6hPZNJbtYgKexoaqPiUY50/iAM5qdZlLXFnrNCf4+iO/5exMf6i5fGROtFq5
	 WIkUgPJcVI2YrgyQUvRKuMyAyIV2rGwWr5Bp4YDshX4NVj/Mzf2VP9L1NFvGyA+Ns10Rj
	 fZvo5Cj0KmZgRDShkA6O5ktYB6/jM8irE2Xrw16cooXIsTmExXcCzyC6d0zLugFo2luSJ
	 2NVcXl1DfAwxv5bWRPdNNP3L9tRKaDcuaOHPQIFjtNQBL0+8tgMXRkIESRaSz3rGbhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zo7h5jHD;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50EA606A89D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50EA606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zo7h5jHD
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505186727fso284667966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920874; x=1795525674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7DJk0IhM38ENV4rjdcIdtMGuR5PCfXbmy3NasqzQYOc=;
        b=Zo7h5jHD11iDtKJXEzJ5V+r1XIny43nRO31JZu08JCiRC7lH4OM6W+fZBQqaLOcYNF
         QnU2ppzb5tKRleDTnAN9zbMZMo7lfVrUMzlohs9xre+06b1r2ELyR45efJdfouPQWUKt
         4PPhIfEVz537A7xFSXAyCtpfe4LEccjtXZU3/JK6rM7zVm1vI/X8+WkskGd0eOcdejb5
         SIlTDtND9sddi0CRdAYvtIi64xKzjkfb2gGJXVxr1er8TRahFJaG5ZuVA/JJEfl9BSUo
         jQOgfIc+ALKMvcgMgO8+6/6j5CaRjnRIAAD/wyhCrGQBrFK5e7c6N3ynhkItAOmIdAy5
         8Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920874; x=1795525674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DJk0IhM38ENV4rjdcIdtMGuR5PCfXbmy3NasqzQYOc=;
        b=NqWgZpyMXRJ77KT1bZMK+RUHW0kG2GZTsB8/QX/1Wwf8XsTpecqXXpwFX7TKonz/4b
         kIiI4N/aWEKx0tHgj+aEH743FJX/e/mDmpUcQKU5gcAyOzjpv7Rx+iRnzGcmUM11dSgC
         8xEu798dyQtnOSmRZpNZzPIe1ivdYB6wSm+HKnSRjAYQ9m6NP1z6IUCL7elqJhUcTkX2
         M4c3sIZICpyzLOcsnl2/AQilCN71YzzIfW2tBlXNmtdzHpNSd0EUDV+pd5AVOaDk5/Or
         af4mDBv9InJHTuFViStB+oVirulkuN3nQFQutpAUaLBI2+LgJ41+tefkaUIMGxS3Do5Z
         sT6w==
X-Forwarded-Encrypted: i=1; AL+hErGDpAdMWjUhgO0A/yFhQtV1SEgNrBbr6A9oIfbFN63HTEtfrS/+qTQm4f9ffL9ZzDQ4s34W+UCwkDqH85M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zoXlnLD9G1LfUX71bIdbsNmE7Dlc+TwqTf9bGKP7fU9mBN3Xi
	vD4aioQSbkdY3YRpIsNniCXEDSZQqeV4t2yUBpmcG6g8Rzyvbgv0IJIa
X-Gm-Gg: AYBFou26WXNwUtgTsRWWXNKtrjLSD+wSs0flNcKP0RZC36PmzH+QP7wIVd4ZlChjHQ3
	nLfoYK2+8FeMc8btq0I1wg+qSnFEtq1UKRGHfK4HcFFgUXrN9zl6YIkqBejUDmc2R3OZMixxh1i
	wf5K//a5HvlIb3WAQmGUrm5I9Ji7EdneGvfToTc5TICBnA2OxEm0kzzp/0pjSNQOq6p6dnb5jyN
	Ih0sYr4Pn4Bd8/+wEDWPLCNAGj6OUYw6lHFvEv3Cp6q9xBijrLzS1GAK/5WGX4em6eg/Xse4vom
	OSyF5sH7pbi+U4TPO6wpYHYN9E5cFZZjUwmZ8klRtGWDEhX795qnNZB1b8+IGDO6Z9zsb9hDdBF
	W96SLaBFRGf2m7Y1cUHxvzYX9YwX2nQWlmysh/UOdDYkryZa+J/IRKslb45A2gZYKR5gXJXHhAU
	c2L2ABefuvRQIHIk/Gz2qiTI9jb0BEtC+tL2eA37BXHNfpSNVfBG7gXu2WiLK29tseahYrgtEwd
	uM5zUHWOrhtpIruhqDYpxdwXObhPLC16WnakFR+s0t/edSzuech+X37IK0bQTjUJMeG1hX539vn
	+LQX2dMOJJ+BlUoW82PcjoRt1alBwmXS45Lc4Vc8JRCQ2gO1jTiYK4TUFCvOBZWO3Rz5AE0iFbs
	fT9bQQy6s4uZ1vz4MmfykAV9lFeDYL3GxEC0YIL3oP2wXx6eETP4UlFG+RCdio0fQKHY=
X-Received: by 2002:a17:906:ee85:b0:c4d:2895:e492 with SMTP id a640c23a62f3a-c509636a10dmr1086944366b.21.1794920873943;
        Tue, 17 Nov 2026 05:07:53 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50b13a2ae7sm396508466b.62.2026.11.17.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:07:53 -0800 (PST)
Date: Tue, 17 Nov 2026 16:07:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2] staging: most: video: Document locks in struct
 most_video_dev
Message-ID: <avxRpY8InfnNtkvE@stanley.mountain>
References: <20261116183355.22563-1-patelshivani2283@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116183355.22563-1-patelshivani2283@gmail.com>

On Tue, Nov 17, 2026 at 12:03:55AM +0530, Shivani Patel wrote:
> checkpatch.pl reports that list_lock and lock in struct most_video_dev
> are defined without a comment.
> 
> list_lock protects the pending_mbos list and the mute flag, which are
> accessed both from file operations and from the rx completion callback
> called by the MOST core. lock is assigned to vdev->lock and is used by
> the V4L2 core to serialize ioctls.
> 
> Add short comments describing what each lock protects.
> 
> Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
> ---
> v2:
>  - Add a commit message and Signed-off-by (Andy Shevchenko)
>  - Use the "staging: most: video:" subject prefix
>  - Make the comments shorter and accurate
>  - Drop the outreachy list (Julia Lawall)
> 
>  drivers/staging/most/video/video.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff6..8833ab5c7 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,6 +33,7 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> +	/* Protects @pending_mbos and @mute against the rx completion path */

Why is the rx path special?  I feel like if you really look at
this code you will see things that can be done better.  That's
what we really want from this kind of analysis.

regards,
dan carpenter

