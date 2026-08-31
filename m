Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9ED395AD8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202533; cv=none; b=Ht2upgGFZVtZv4MWwhuSD7yFy+kELpf4a6SV0N20+lgtA1EpX9UFPNDxQ0o6QKSzyQ0enA+kdu0xGDHMJavJ6+gHOt1JYtbvRlyFhGJyO0mJ4WuLYp17+xfJ956pcxGSOmRxSmsECv5e6iT/Shu3xVLOUlk894XGPi/ZKqzcoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202533; c=relaxed/simple;
	bh=FwC8XOV0B4kgwlLtD5BtYRBgGcM+gD2egCbMwwjh78c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKOXfgwHWk9RMqU55+7uj7EJdKlVcDBfztzqZv/jY/Gv112cK59iwB6cC139YnMF2lSj8Ovec+p+HRl7cW/vgUa/cQCyeRrZdCDUYt2xcm42GBerBuHfkCY0fcwnGqDfpGoM4MUL6lCH8q5O6NKhI6ubdED0y/RjFnhgi1yb+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJ1AnoQs; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJ1AnoQs"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c9995ca60so300843d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788202531; x=1788807331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RhaWswkQxW+7On/cBV4TuoPoc9NhNmh0fp369raKMHM=;
        b=qJ1AnoQsENY1k9m18tl4XLALtfzX7TL91Om1zOvmx3n79i96PQ/eyvyWN6OfkXvixJ
         MVmBnkhoarHhGH5EUW7a4M2JNHLWFuFrjy8G3VxvK4s5Zp+wRcKPr53ldxoswqiMfMp8
         Q0vcZGcIj3TJLU0VyJymVRodvoeUUS24IqQazK1eSrwklkvIB2oDa0Mfb2xNqDFphd1L
         jBFskXjokCfozvwPvQFjFJxl9n6u10bNCcYGykCbledUOhJk+9q809YlkDLKNGuqeT5a
         QGrfwqzkhlAjy5iLNMmi78jaibvkPdiItI3S7pr8ohNsuw4EUxWBGT3ZTprPwIqL+Vry
         ib4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202531; x=1788807331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RhaWswkQxW+7On/cBV4TuoPoc9NhNmh0fp369raKMHM=;
        b=RYoIMu99KfRVAHOqKYRpX/rwCLL+Y/9h0TvNUT/SdrAN1zH4wsi3GFA+P9NrgnIj9g
         xPFOGAklFDPTgMNe28votDsX52ZZwvt4nuAAxonA6Eim005O5HbNFAJOxMY8ZabtrCWn
         E0j0vKf2pvYZDr9o06bSscXdjBrucVhiwTAQqTwR9wEWL3K6MnMuDFSMOw6iN7zDPIkZ
         uG9m8/JZwKmvMBILzS21sGXj84Tqti5mACRQyj+tmH5O4wTDBnKGa/bCCHyRBT7nDkZD
         kn3pU8pZFMDv7755bqpmmfml/ZEoQLKLQAcFn269rImRwNQO1ezvzKooOC8DYk8vNV9+
         MchA==
X-Forwarded-Encrypted: i=1; AKwUvBwNVzK1HIV9pVkArx701KLZIWfmngMWKmFUVJaRPzCdIUmtRJkVSptz6KW3XXZwMM6w6S8bCR5/HvKBO1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++njgybd1LSqmY5IYf1vnQcccpUKs+n2gLVu+DKQRrayWZA6ycSC
	bq4UpS2oW7uIA1A5Dnh6mxqhiEFV94+HD9HFnW8hE1Ofz1f0GrZauhT/
X-Gm-Gg: AYBFou2Pz9arfqhY/Oy0d62kFWcB9FQWB3QuKmLfx5SsX+A9nTqRBsVAGYorE5YCJlw
	bRvbIpEl2EMml4PkfvHe8waxnlXUNDU9y6NbHjriLooDXLK2eg+Lvk3/ok02i2WLd64yFnByvHw
	U+TvUQd9lUlA8vxPeXy9OQ+BNJZUOlpQORd8QF0NJOcgZA8CR1HfGrYHg19XUqAfanRyfJ0WuNe
	041mcoeCb/d0v38ibd4WcSB8vJdxEtbK/VRVC+qNEMLkn585H1D4cRXfay+GmmK+jjmvDKTq9W9
	AiMP6TItk5eYWTu0UEhRH9exh5yav/sdC/A1vmC4PDNmue81mt3nEKG/NJ9eSQCm+zu1Ns7FEwQ
	onJHpJI4c4BVDoErS7Vw+cB6SLyr59jOXMzTUh1hTlnqj9nQpUqdXz7pVVlkeu9dCcVp2868AX8
	hRJZRhXAwtGZR2GI9eK6iGL9DUrZHJslooOq/MHWriRMCgJ66qoYPiE5zHNENPaBgPDihXAXHKu
	+B0Vrbr7DEbsZcpS3f8v1uZ
X-Received: by 2002:a53:e904:0:b0:66f:8a2b:b693 with SMTP id 956f58d0204a3-66f8a509c19mr89306d50.17.1788202526777;
        Mon, 31 Aug 2026 11:55:26 -0700 (PDT)
Received: from fedora ([2804:30c:1f03:a800:30b7:8d7b:fa5e:4825])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed2986csm6636227d50.18.2026.08.31.11.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:55:26 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:53:34 -0300
From: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Lance Yang <lance.yang@linux.dev>, david@kernel.org, 
	baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, ljs@kernel.org, ziy@nvidia.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-stable] mm/khugepaged: avoid unnecessary checking for
 swap entries when collapsing a mTHP
Message-ID: <apXHC7uYXE99ZgPp@fedora>
References: <d02405a5-1d0d-49d5-9056-1a34ccdeef10@kernel.org>
 <20260827121151.7837-1-lance.yang@linux.dev>
 <apBB01VBbmV28gWP@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apBB01VBbmV28gWP@thinkstation>

On Thu, Aug 27, 2026 at 03:07:10PM +0100, Kiryl Shutsemau wrote:
> On Thu, Aug 27, 2026 at 08:11:51PM +0800, Lance Yang wrote:
> > For the candidate above, the loop only reads its PTEs and returns
> > SCAN_SUCCEED. Pedro's bitmap lets mthp_collapse() determine that upfront
> > and skip the walk.
> > 
> > Emm ... as I asked before[1], any numbers showing how much the extra scan
> > costs?
> 
> With the win being only some scan cost, I don't think it is going to be
> measurable.
> 
> It can open a path to future work. For example, we could find fully
> populated mTHP windows in a PMD that is not eligible for collapse
> because unmapped > max_ptes_swap. Right now we just give up on the whole
> PMD in such cases.
> 
> But there are more wins to gain there. Just saying :P

Hi Kiryl,

I devised a patch based on your proposed future work idea. If you think it
makes sense, I can send it to the mailing list with a Suggested-by: tag.

Thanks!

