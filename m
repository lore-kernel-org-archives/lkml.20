Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698146;
	b=syZL7lR1A1gNtGph3p2gL6LlQKw0UEVkhBhR1KdiKxzU7WZ0MGxgs9amhcQx+vB0GVwv
	 SGNQZFWrde2v9+Sr+VGWXj+76oqWf2ELF66wIvsmwxqlubyodxqe8Ky2GRvn+mw+o4+3f
	 9ml9mIlz8A+ix7vu7dj0XhaPTd0P8qDvURdJQSMuYDb7OCGX8O8xIwzRfW0s0C1BfA4ui
	 HzhCG9SuaxNut+jSFjcyvx3+J/omAbfVpAsj6hMzcRbVGoNMhg02XPhWIbUircyzsd1cm
	 WkLue/UEYMuluLsMfINbYTOBAkYOE/ix19TeFOTTpO4K5uRty4tScM+5cW5nHZCajNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GC4ATzK3IxZRvi3Ei+hKSqTD4en8xH1y2tp0UQprNBM=;
	b=2chirw/PhLGEBnW8/sZSCgtB41mXkFwFsOSCotghm+uVXjjnBy5ntM/a4KUMshZwPZJR
	 gql7WRsQIcKmZihBlq1owo5AZhYnc1UYQnu1H9aS/EV/13kD/2T1vQcqWzAwKUXZE7l77
	 AqeOg3bO+a8qRMmrOhJDLoIASwAhY1PJPgQAQCe7KAKxZ4MTyTEhM00McyNhZJA6slVIv
	 VqVV8WflMImc6m+SLHj5I/pSpBd5+ZGDp8nrufMI9pEhpuacXDRN4w6QTmIitHILUKRkP
	 TVT6gPUigzpioC60OPBtkVzVpUFdmqaPuz2cnyH5lS96jZ0w18czDua6w9EpoAYslAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7gUoOx3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F711606D813
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F711606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7gUoOx3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0728so915814f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698145; x=1794302945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GC4ATzK3IxZRvi3Ei+hKSqTD4en8xH1y2tp0UQprNBM=;
        b=z7gUoOx3NaMBfXF4kv1BjI+0IIZ1dFQohmKAPaBPyKi/Z+iQQEuHWo9+uJux+DJg8h
         KMTRoHyFkNHla1d50xqcN0xmH6Vtcw0gLO0xnYWYJ4bJAAZQ8PHYF6jA6qTeyUAu2nyF
         hlxRxjBKbcPpHWEB2J++Uz2qvDdF8Rk7Ym+G59K35qhS7+Vig4RGNpkykljPwgTqto7S
         3fGsdFy70xobCXsdkeMLp0KZn89JXITqogVzkFZtssW1oZ6j7f5zt0xrlFa3wcqDUmU1
         XRig6zfKTCK/pIlchXbA+h5Wh6j/wF2uUTdHtS2ExtVmzwTz49pWo+a9eS1BoKlLJwBG
         fXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698145; x=1794302945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC4ATzK3IxZRvi3Ei+hKSqTD4en8xH1y2tp0UQprNBM=;
        b=gIQbCgBm4MUU09ZuclkRAbRXYym3sG+NB8UbRw41Sv2FX/vk8Dio4X6gRuUNLxgsgL
         xzzQaCNRQbPTKjnPS52UD/zAhg2oIJlWp146YdILDxxyvCZONPOHmPDALtzKCXKGG25a
         DPXES2EmFZGiK94togAxTgiMDBOtL3K2J0zTywhMJMsbVnqDJaqW39hq9deY5+sk8is8
         BifQ6jJAX0b1+J2YHG3KqmijFSkpLeFbD/KzyVg8SSaEnOyP+o5I55aueFSN6ie74v34
         HyVXrtHW+n2QphLxPngAFiMyxh6t9r9k7rVI5TlT85OMnBfOqo4LNbwyqaj30u3YGXzw
         U7yA==
X-Forwarded-Encrypted: i=1; AKwUvByWbqPwlODrIdAoNhiwatx7OvXrIXa4O63b4L7cTPYT3vA7pcq3/18ExSVVHYveBcE3fnIpjLXtZN9wTC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AMAYs33JTcMsvX2w7T0CtVUucfPQbUS+LNk+95iFztCJ5SHMG
	wNDfEcIN7TWLxJcHo7v2i2sMnYmTWn9WfE3Zeaf7jWQ8u4eYONw5n6yA
X-Gm-Gg: AYBFou28/NnYLF1xc98r5FJgsA8sCrmky6ICetlYSm9zFjPEGXj19kPEQOQJtaDF+bs
	XtLe7fZBSRvhgBz6YqYsxh2/f1UAX7ziN90jzpVK3+MIiJR+UzTlmwUHT77lObxdD9R96Ie+lYr
	mSnmAo+RzQmex5SIx5vWcgPHs3+x5uew18I8dZMWpXH3mYvyaZGFILUEIB6UKzY1Z42dha4HsUP
	WwCyVErLXcExeteu4FhURxTnKBvWrO9LkidWctWg0WWDpKY1cSDOjtb6/mliCSm5awZSNlu/pzQ
	t6I+v/UcDoFRRhi+oLGR6CooRmWtqn/rj1SZEtIUzuMS6Yp/IDxc+Dfid/czRaBg+DgdXrLwogB
	ZfNuOrpcuFtMSujqomFgpABkbbt0kddoPfaCSOyZ9Qyby+lkOM26PugnovXfOETt7Bah8W3aBoL
	qzsaFlRnw3KbF4dqBwPhfY5T++6/5CQR0crc9wIgcin73ing6xJoISOrkEXYqM8o76pyXf7F0wA
	5LdXMXAwVUwVztg/0uCjZIJeJg89VfMK06cBew6itPFnzs8UYSHGH6vBwYZmMxB00bLXxZ+dXtE
	2SeqMb70slldlsTHHlHiahiZoukUNBdtGyzlCeR+KiwA3VkrscPa1N1Fjtc+bVXwPkw/3OfR/kL
	o6+kvxwCbnBk=
X-Received: by 2002:a05:6000:4014:b0:48e:5071:420 with SMTP id ffacd0b85a97d-48e6e2bc75fmr27335389f8f.2.1793698144786;
        Tue, 03 Nov 2026 01:29:04 -0800 (PST)
Received: from C422HJQPQG-Fractile ([150.251.170.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b727c6sm26134262f8f.16.2026.11.03.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:29:04 -0800 (PST)
Date: Tue, 3 Nov 2026 09:29:02 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Tal Zussman <tz2294@columbia.edu>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] mm: remove newly-unused page wrapper APIs
Message-ID: <aumpXjTMlZhV0PSh@C422HJQPQG-Fractile>
References: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
 <20261102175605.a0d9caee8279ffb5f6fdf15f@linux-foundation.org>
 <aumjF5peb2vyuncA@infradead.org>
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
In-Reply-To: <aumjF5peb2vyuncA@infradead.org>

On Tue, Nov 03, 2026 at 01:02:15AM -0800, Christoph Hellwig wrote:
> On Mon, Nov 02, 2026 at 05:56:05PM -0800, Andrew Morton wrote:
> > >  9 files changed, 8 insertions(+), 110 deletions(-)
> > 
> > Tal, you obviously haven't been following along ;)
> > 
> > 
> > This development cycle is not the one for cleanups and new features,
> > but this one sneaks through!
> 
> Given that this is purely dead code removal I'd actually vote for
> fast tracking this into 7.3-rc.  Unused API better be removed ASAP
> before people start using them again.

I agree with this sentiment.

Although given how long the folio equivalents have existed, I don't
think it should be too much of an issue. AI is decent at catching
this sort of usage of "legacy" apis. I'm not sure if sashiko checks
though.
