Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E708B44C667
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348277; cv=none; b=t7loxZpZAk7uRJ9tBKEOkwogOAJ+7ag6xZlkjWP4rlsNthAhLy7fmuPo44tr5ym77WyGWMqF6WelyIVtVcDSChKxPJWlVmAvCkqP3T5libtxKNOBoe9UM6aFX02v8ylsCSppwdTHmXuT2ehUO9N3RIwtmGvu7Co73OURWW+FE5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348277; c=relaxed/simple;
	bh=2ng/GTvyy8Ae4BYdp/Dq4dW9sI4ZxKFXpOeNcWCkPg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j++D4J60oSIKiIufFDWrtJ0ttBONENES0/uQCRaa9llJVFtPK7NjBhFfRXL62EyxECo/KTet6nz4dZDsRClDILV6qrUiArTPjp+P45f7M+YMYNLs/LbPsQvw9lqAPf+d57eYG88eJYsvIrXfRUhk86RZxCT6N4LWW5jD+yVtmqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+RC5/vf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+RC5/vf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso1023723b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348272; x=1788953072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EoF4ak3efS2qg2JAezlyYbqCdyBis11tVKnPB5qs/Aw=;
        b=I+RC5/vfy4i9cuey38pc9kDP1V1sbQss+InqJJkDXJL8gY4W0jH6DiuE/hD+ISY+VG
         Tu/HNgTj6aq2Jz2rbtqR3KZe6hsTacXGRaNfA6CbUMLZlVQwnuWXi0fA8taUFqvA4Kx1
         gB1kSb5I9NnA6miK2DqZ9YIaqhjRvVYDsj8r5B7xTuUMvQ9ZcKsxk75hmCQd5e2s+lv+
         I2CvE3a02oMgRt/BtLdKe9VYRkRRH2MnsWGnvuAMBBoKHCfEC4vBKwqt0Izs1fDkRY1d
         4ewd7AtO8zof5CE0dw2lysXdW6vIFSECQdrGrYpD0ceHUM1yV0vsmvSFNbzHOrC904yS
         69hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348272; x=1788953072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoF4ak3efS2qg2JAezlyYbqCdyBis11tVKnPB5qs/Aw=;
        b=VuVVSnxbqicvu9oi5BZmc0vzCKJKCV8v77xQzmHwrSzCFKMMzYbV10OShewd3dzISJ
         Ra6rIUIcsZ0/A/J0Kf5I4qmxNgvmBJ1cgZkHs5CxawBGudJ/ZU5T/XHNxWGvzva1sWwT
         sU7cJh7245Nye5YR4of1TVfu1PF3Yp2mYF0/mjjoRxTgJZB5nE115zuGrMmJ/AV6ecZa
         4kxy6h490vsS7DuLjhwqssc98u0mhEHQ82PDCz03uAaWXSYAVm4Cw6CXWLTUGzIF5vM0
         kBpbFUYYi9xrrTELz5M7SwcSvDXyfrsyTvdi+KpRuYz9SXz/RbFf1onlujyGYvClpAb6
         YaYw==
X-Forwarded-Encrypted: i=1; AKwUvBz/+a0kKQ1usddQHrfLcw/WNFSZLYfUHzhyys3ds7YN4jnV7B5XTLVIEQ3WWWqHhAMRNTg7rRVKAcWTtXU=@vger.kernel.org
X-Gm-Message-State: AFuF++n37uWMX+Tz4yADstSmZt8I7QmV+6Ja1OHfLa34/Dj6oi+XJ2wj
	S/2LWwZw1jdyqOEddIpEEasKATbyjdkyeop8eWUaMxs1aCvxuQNTwV2o
X-Gm-Gg: AYBFou0knkA5sY46cSKBTQj48VZpPW1P1gaerWjd9LSwrHNXGnF+TAnaihFBBmqWBFQ
	HOZ0FUY+EGnr4BSAsfb9jbAu/U4QKVHGxzT0zQsFxu6NBSh++w3nRSZVRi2lBtz1QaIBKPpWszO
	dB1T2BsQjKcJikKOEvpOz/ULlKmUAhBSRTo/em5EbDTWDFOIAexxwz6ADv7W+ilUbeVUrZAaSBX
	VHOu8tV8uv0QFl9UHzNRsvc+IEZzO9CChWibLEDnlwcHNHB2yg4fvTRPHXqd7GOUJ2888ghWxOf
	Dnan8OsTDwW5IpxPShlj8MmUcHV1xzbnMlNKa7AQM+YjJ6NnXWFzz0r/N+DVHbUgS/nVkuouhO/
	OxW4p74uoQoZCMrLamSJaAnL5E4JyMzVg2d+lKDZpwd7NToEtDcWP1TW5ipqBN9b1N4SZmheYv5
	BFNxc6223nnq8lpi2NLYi359ZUTtEHJNd8Z2JPkie0CuQ47k/Qbu07Oes4XW8Pph0F/323uLblm
	9yJ0mA2
X-Received: by 2002:a05:6a00:1f11:b0:857:72ba:ff11 with SMTP id d2e1a72fcca58-85ed4c1b6ddmr7146177b3a.25.1788348271985;
        Wed, 02 Sep 2026 04:24:31 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003a7d6sm1186334b3a.34.2026.09.02.04.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:24:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:24:27 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Hao Li <hao.li@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH] mm/slab: take n->list_lock for the list_add() in
 __refill_objects_node()
Message-ID: <apgHa1tISzqsnc_C@v4bel>
References: <apPa-cGLcyt90l-E@v4bel>
 <apQU8wjMlvbKBQgh@dev>
 <apQ7osHcRj3vdJPn@fedora>
 <ae25c193-b95f-40c1-83b6-1c2546467e41@kernel.org>
 <apgE4TWLFGoqoOos@nixos>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apgE4TWLFGoqoOos@nixos>

On Wed, Sep 02, 2026 at 12:20:34PM +0100, Harry Yoo wrote:
> On Mon, Aug 31, 2026 at 02:55:06PM +0200, Vlastimil Babka (SUSE) wrote:
> > On 8/30/26 16:35, Hao Li wrote:
> > > On Sun, Aug 30, 2026 at 12:45:17PM +0000, Harry Yoo wrote:
> > >> On Sun, Aug 30, 2026 at 04:25:45PM +0900, Hyunwoo Kim wrote:
> > > Since introducing a new variable seems unavoidable, what if we temporarily
> > > stash this slab in a pointer like below, and then add it to pc.slabs once we
> > > acquire the lock.
> > > 
> > > struct slab *leftover_slab = NULL;
> > > 
> > > ...
> > > ...
> > > 	if (__slab_try_return_freelist(s, slab, head, count)) {
> > > 		leftover_slab = slab;
> > > 		break;
> > > 	}
> > > 
> > > ...
> > > ...
> > > if (!list_empty(&pc.slabs)) {
> > > 	spin_lock_irqsave(&n->list_lock, flags);
> > > 
> > > 	if (leftover_slab)
> > > 		list_add(&leftover_slab->slab_list, &pc.slabs);
> > > 	...
> > > 	...
> > > }
> > > 
> > > PS: If I recall correctly, Vlastimil's initial patch was actually fine. It was
> > > my suggestion to save an extra lock/unlock pair that accidentally led to this
> > > trap...
> > 
> > Ah, thanks for the reminder. This [1] was the original attempt.
> > 
> > [1]
> > https://lore.kernel.org/all/20260421-b4-refill-optimistic-return-v1-1-24f0bfc1acff@kernel.org/
> > 
> > I wonder if the fix should be to return to that approach and just have
> > __slab_try_return_freelist() handle the list_lock. The code would be simpler
> > with not "bool locked".
> > 
> > It should be really very rare that we would end up returning a partial list
> > and also have additional slabs to return on pc.slabs? So I think there would
> > be no noticeable performance downside to the simpler code potentially ending
> > up taking the list_lock twice instead of once.
> 
> Agreed that it should be rare and not worth the complexity unless
> we have data to support that.
> 
> Hyunwoo, would you please adjust the feedback and post v2?

If you don't mind, could the maintainers handle this patch on your side? 
I'd then move to Reported-by:.


Best regards,
Hyunwoo Kim
