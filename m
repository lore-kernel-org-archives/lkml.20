Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20494D797C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672773; cv=none; b=BF1vfH3Rlgp1vxXFreOgJNgLCmiUtEVrLtIU9/OvdG4Oa50L7x50R9bALbHtsS2SwRARaQkfZ3Wk2nRYZTdvRAPAlvuC3ckxzdl2KPpGte/16oaDjOxd23sMT3sx7ABN/q/A+OjdOG2LpIBLCoKEU1CLTxNkh2xsnUnk8fODYZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672773; c=relaxed/simple;
	bh=8QBQayhQNtGpDP1n1M55xxpbZasgavD+PCoPdkBpQbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0E4hY5qTnXbKIQFdOlSftOpbcP+/ATmia9gBsVGKBR5udxlso0m1sgBtj7rc3IJ1zpFanLhI0b7u+rWRZZztFB6BcYrIVB6Xt8Rgo39rTx7aT+WCl/FI7uCr6AYDqNm5lBI34+loTzg4glvD6lu4hInhSp6yoYhhtaZu+iv7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1WfZCkW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1WfZCkW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso9183955e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672748; x=1791277548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TExyK8zIEMku3wrghEduJ+4wDucgiERD4p9sT26jE8=;
        b=f1WfZCkWoJSJP9SKuQu/OlU1rcke1hUiwlY0qZUBTbAamFQusLRIjb72bT6CHp1Yqh
         Wh8D06X2DBJisX44YaKRpMizJCm0SIcMsV99a2Tdtw1JGfr9PLWJ0BWJ7AOE4EV4moyo
         dsw0l1NJ4A0Rz5yAwTDOoQyKFs0MMSwPRXR0gZ3uIPOz2pxaLWGz2EBJWbmlr/S78Iif
         IMU1jJvkKdZ4pDRuDMyB4b5+nxBgMAWm6ZplKomwACPiwPMj8PXkHni0VA3cn+w+QvxG
         avyBz41KdVyP7/aMxReIzh3eOxHK2/HcvlXOFDzkf50En9/zj+vZYygIHkjGx7cxZ03N
         8j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672748; x=1791277548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TExyK8zIEMku3wrghEduJ+4wDucgiERD4p9sT26jE8=;
        b=Omu0eGrTITXQ+YdDEe9/wTaF99yLT7OxDzpiFE2wW200x6z43PE/tbXZMHl8OyiD9W
         T9GNTyfgjp0YIIcZKuYSERUORWN+tZOYnpocC3zqeylrXdofZTI3QwFgsxhzNfbKIMBy
         APuBkysUhpc4zpmpr2YcBHiv7QAF44etubLqHovxPVGeMmF7NdUFXGUimaYeuGbVTbh7
         OCCFnLQv3jsOCiWM2L21sJgy6t+C+7vYdQt0skD9McrZQkQwFXhNNsPUuVfDybXucB7P
         wt2Mrlrzg92D2UcwmdiYXB9s9zzfDPQ6Hy3SKHLZjcCBhNy1rO1t2hi5YfYkNJBTQvLs
         kQlA==
X-Forwarded-Encrypted: i=1; AKwUvBw93vQ9/a4U48XCaIGT2d3VJXa0XRTFEvCqhfuEiToHc4g77N1fpKryie7KdAKKG9fDYnv5y4CgwpByDVg=@vger.kernel.org
X-Gm-Message-State: AFuF++m8pYelG+WINsjgmpS/OtFt1Mel7+PEwW5gbXxOKvExHgPD9m+M
	NbReyZqW8+JC02XSP3VtF8HmD7EKwF2t72NYDXQgRq8zVZWFvuvFnY2T
X-Gm-Gg: AYBFou09caF3fP4NYeHwRjXPaaouvh2fyWTcOgY72kqGN37pT3rDdAATUtw7Uk/wXq7
	VgF1Vzq9P5WQmbqif/HW999ESJUndryUhOTFeWRp4sAh3cQrQNMBUhuUz7PZu80YDIvL3S5tpdM
	1uv0UJKSAPQo933kIKQO+fuKcQel6JvZY8x+fYKPWxG2yjIOTXos9JHPUqOffbbRUNQG7txXvOZ
	nxlPzpS1+bSJEBlRbIJHcM3tN1h91mkEeYIpWYw+u+2X31FF9zRNdBaYaPb1bsyrJDE0HOsuJTv
	spae7qU+1X4T3LLU0hMeruJDrKp7VazAHRIDxURSB/VnBpIjND59XDEO3dk/ujHwfSbR7iNL+0x
	YWs04wSVR2w59B2Dp+sgR1gUDJcYPsmXQcPFZcbz1GFcUZObmlgFzY4Wmu49OJmw0dBgFlzbiEs
	DUHtnBlCUkXmNwOYIlvf6De/UPD9xQLeuuY5dd96/41WufGHeRYDDikRid2F8=
X-Received: by 2002:a05:600c:4f45:b0:49f:fed0:fc47 with SMTP id 5b1f17b1804b1-49ffed0fe54mr144940245e9.1.1790672747833;
        Tue, 29 Sep 2026 02:05:47 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf868b5sm90738705e9.1.2026.09.29.02.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:05:47 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:05:44 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check MREMAP_DONTUNMAP mlock accounting
Message-ID: <art-TQZISqp3frvp@gmail.com>
References: <20260928111055.482136-1-azpijr@gmail.com>
 <ae606df5-7d14-47b4-8569-fe47321bfac7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae606df5-7d14-47b4-8569-fe47321bfac7@kernel.org>

On Mon, Sep 28, 2026 at 02:08:51PM +0200, David Hildenbrand (Arm) wrote:
> On 9/28/26 13:10, Jose A. Perez de Azpillaga wrote:
> > MREMAP_DONTUNMAP keeps the source VMA in place, but clears its mlock flags
> > for the whole VMA while setting them on the destination VMA.  Two cases
> > leak mm->locked_vm as a result:
> >
> >  - an unfaulted mlock-on-fault VMA moved behind itself self-merges, so the
> >    single resulting VMA loses the flags without the accounting being
> >    dropped;
> >
> >  - a partial mremap() moves only part of the range, leaving the pages which
> >    are not moved accounted as locked in a VMA whose flags were cleared.
> >
> > Add three cases to the MREMAP_DONTUNMAP selftest which mlock() the source
> > VMA, with and without MLOCK_ONFAULT, perform the operation and check that
> > VmLck comes back to zero once everything is unmapped.  Each case runs in
> > its own process, so it starts from a clean mm with VmLck at zero and a
> > failure cannot propagate to the cases which follow.
> >
> > Verified on x86_64: the three cases fail on v7.3-rc5 and pass on
> > mm-unstable with the fixes from the "mm/mremap: fix two issues with
> > MREMAP_DONTUNMAP" series applied.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
> >  tools/testing/selftests/mm/mremap_dontunmap.c | 273 +++++++++++++++++-
>
> @Lorenzo, could something like this also be implemented (maybe with less churn)
> in the vma.c selftests?

if the size is the concern, most of it is the per case process and error
handling, and I could try folding that into one helper if you would
prefer a smaller patch.

--
cheers,
jose a. p-a
