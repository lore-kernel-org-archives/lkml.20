Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407024A4419
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296395; cv=none; b=Dplt0Rg7hwtzJ54Z+QB3Ip2c+kw15s8IRDXR+hmxDXIxyjVFIKx0jbzWhUop0jX7sGby4dVLR2uSFEl+z7HMHezbgyfCFuv8IxPIHiZ1ZFk7Ihdv8Qzv/U7Kayt4sXNeJod1AcgXsZaY7OJvBobiStgTaDK0T3W1xJjz/f6M9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296395; c=relaxed/simple;
	bh=7Bwol/isO3PKYL7GwxQ+DnKxspzRoJb43zIQMxZuCDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlB3YZVcLdX86wiDWHay0xSV8d1Ca34gP18w4jVEhKKoss1mEXEZlnXtpmauHym6i/AbJFMLQYYeNNWc30uK65xFMpgUq35lwa0xh093N1BhN7Q3Fv1itMHfAGbCxf1/6AmShoLllOwrrwvdOsvWXiEx3luHTE6g1C4qmXbi2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=YJfB2dm+; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="YJfB2dm+"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-861feb6d61bso5282637b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788296391; x=1788901191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scAaW2u08X/6xoYYfzAu3cY9q95BQA8pLakjGEvGhLQ=;
        b=YJfB2dm+oM8zkvx9mZ/MCddLaSAoLBN9yf8SQYeCD5dVyIi8jWR5rQbpndEo0A5f4g
         N6FHZIL0MdU5dunJVOO8yTEV/34kI0F0BcI/Ij2BoOE/bBndwc4wgOetpoDhOXt/FInO
         ZQLISVUf4WSItvhdBUm697OS6mZVbVlw9BxEfse1pm/pmEhmAsZHMvGTTNbAWVZi5aaa
         SgDlTcKZXIatCkekAcJMZh0AUDL+iz8ab+SmcMILC+xTNl8g/nodf4Zw9f0/AbMU26q8
         5N3rbmsVxw37+0ZClT7huVzl3d6WRopmNQMjVi/9pqjjKVhil0ikA3YHjO+aNNcIkvlv
         Yy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788296391; x=1788901191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scAaW2u08X/6xoYYfzAu3cY9q95BQA8pLakjGEvGhLQ=;
        b=k5O04LTwncFcaOuUdraWZUW3PiqR21z94M60nb2nVt7+6zivbwwUZ4Y46OIwC5HIH9
         MGWerbQwa1AMsIdzTAxxQlO8LJl4FKn39owSwvHT9jMhb+yr9V4fRW6mOUOqBYBAVUUi
         SB6PnK/qoxz9J6wbxB2YOjMq+3pJk7yktRk3WutQzfXHpm6QrM84OV9097T7waal3h3k
         fz5Va13L+zQc96t6IY4CaWNfE3iZL+nbfi9vbNFR4KHVvnPTCz2nPPPkoWYOwDj/k9nn
         y/nDd8oo/8kSqkyCoE/GDhwqRvc2lgrwBfUKnBWnjM+d+CkOuhb9Qpaon7o7/MiFPNql
         c/oA==
X-Forwarded-Encrypted: i=1; AKwUvBwa9djmF0qiLl7ysNZ14PLBrscJc2wAxrBMaoFycKbqL+m2XP/YLsWH93zl3o6lM5mvOFgd1BJuvf0Tjvk=@vger.kernel.org
X-Gm-Message-State: AFuF++nr1DQPraN5qHp3KpuN8oVJSUJLNKNsGdQnwyZ+OLWFEyNfCFjQ
	IaPJCl3aHXPPWEhJbGN6Zl1tRgpHOxRGDtIRzkqJGfH+OnhDlaNnUrGKO7m/XUJ43g4=
X-Gm-Gg: AYBFou3JDPsV81JxoAOrmuXSaTHiVBvw7KUugb8AgOnAR+x0ObJADRn2QjEAoB/YGVS
	pINoRmUxsIguLHE8HeOByih3WJgDHyuqxb0g1J9Ag6ETFxQgly3z6CGAlQ6X5KExGDRhmOh4+fL
	b2DbVR3UyiZKW7nEjxmZIzRwncDgix8bp5D5ZaWQ7KZ0IwljZ18s1FC49O7z4z3ZdKINdD7uFrx
	jc5rIPoybZtuzIy9XHPFohS/h9dQUtAwOSRd6qSeIS2p1IXX4Ec+Y6t37OwCDtKqCAyy9z/S/q1
	lAAyEiSeTaaw7Gddk9enTuFCZgEWboKwyp13VXXqAKWyPtgmGwWqVcfSZGXgbFZlzggFCm0NE8F
	0UMrscb1yOdXWpttdO5IyiBVzg7Bqn9YV1n1fxJ2TfpNau3NEdE2qXgdyKLPGUZga6Bcn6PQngr
	xaiLKuQfN6m/FUXONyUcI0/7bSLTsCtGCd/EWChEX/z0w3P7Qu3M3n6JryPfIh
X-Received: by 2002:a05:690e:1347:b0:66f:8a2b:3db1 with SMTP id 956f58d0204a3-66f8a2b40ebmr2730463d50.46.1788296390661;
        Tue, 01 Sep 2026 13:59:50 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f986afd80sm444525d50.20.2026.09.01.13.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:59:49 -0700 (PDT)
Date: Tue, 1 Sep 2026 16:59:46 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal Hocko <mhocko@suse.com>
Cc: David Stevens <stevensd@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memcg: Don't call schedule_work when no spinning is
 allowed
Message-ID: <20260901205946.GL3004@cmpxchg.org>
References: <20260831234339.280376-1-stevensd@google.com>
 <apYXCL_GJs9Ovu0v@linux.dev>
 <CAOiLmNEV8b3TW_Q7+h5mYrZ1Nw73XcPFPUsapeYObLYajq_PJw@mail.gmail.com>
 <20260901142552.GG3004@cmpxchg.org>
 <apbyZgB_Zu-DK8pN@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apbyZgB_Zu-DK8pN@tiehlicka>

On Tue, Sep 01, 2026 at 05:42:30PM +0200, Michal Hocko wrote:
> On Tue 01-09-26 10:25:52, Johannes Weiner wrote:
> > On Mon, Aug 31, 2026 at 06:04:57PM -0700, David Stevens wrote:
> [...]
> > > There would be no guarantee that memcg reclaim would ever be
> > > triggered, which also would also stop MEMCG_HIGH events from being
> > > generated. Overall that seems a more serious than just dropping
> > > userspace notifications like is done for MEMCG_MAX.
> > 
> > I'm leaning that way too. It's an indefinite error, and it's a freely
> > programmable surface.
> 
> I am really curious about the indefinite error side of things. It has
> been my understanding that these NMI safe charges are a) rare and b)
> there is userspace running so eventually any discrepancies would
> resolve so the excess is temporary.

So I think the question is what limits the error in both space and
time. When you say it's rare and userspace fixes it, it basically
means the answer is: luck of the common case.

But that doesn't help the worst case that can be triggered.

Like I said, if we need to have code to handle that !allow_spinning
case anyway, I'd rather just have a few lines of working code than a
(lengthy) comment explaining the luck of the common case.
