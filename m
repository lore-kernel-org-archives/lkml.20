Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330225B08D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628401; cv=none; b=cdKJIvJDbA8NkSmM4BXDKaofPrJ6YeAtSAD9yPBUEy7+qbHvblZpojH7N5nMSPPNg4QkwPAFpUXwAHRc28/w3hOVg9itpXphGzzQrtZ06lIrtouhPrcl9Z0ojAvHzVzJgfPsTx+8lX4XbX0ofXnU6IPuXNcPoh5ndOxCe53pGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628401; c=relaxed/simple;
	bh=cXpXyyAxJEQk85gzl9TTiU5pF79hr7iF/5HP6KNcpRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApS5uU1q4DnJHs1iqTWdA/yKjPW/+J6fXKonEYy0eRP9U16exlhi+NWAjUqcaPT958bitgPnUC22XT6GuAcBZjBEjQniNizb3FDNV8ZmdzLbkpD34qyaeyZxFOkAbu7WbGD1y0EEF1CuD7IewcttJL1pwUuXf1ALOC1un/+zupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQbseQY3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fAZUhG3h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQbseQY3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAZUhG3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791628398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
	b=DQbseQY3WwBSOf3Y5C4C1j1lwHLM7CtjSHxunYeNSliFl3Z83h6/jTdxm1MIDhKzJZflba
	ItOamoHXsEzYgWDn2rqE3phPlkr5+t/fV3AaDP2LVTUwrhmCoo2zs9UjNjH7PBIv8lPZOG
	Q/t4ad24JPAfd1e4z1ZXPzjZN6YfxR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-znJsB3IQNUmoHnXiFP6KxA-1; Sat, 10 Oct 2026 10:33:12 +0000
X-MC-Unique: znJsB3IQNUmoHnXiFP6KxA-1
X-Mimecast-MFC-AGG-ID: znJsB3IQNUmoHnXiFP6KxA_1791628391
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so8767275e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791628391; x=1792233191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
        b=fAZUhG3hSkMR+eSLrG/1BQVa5B8HUZi8jnALPAYtTjgesfR2k9vpNfoWHBADgvxc6Z
         xn4C9v8xtMtHlkYr8AWBiDAb8ejXhGXYjKXYPPMAVzAZpbgwbFrT85S8ZMpsUlYbI9Tp
         CG1Wlcb0dSVTk1GKkSh2JkvOnLM+b6XA8zoWEO3Uz48zlyJT9hXt+mf86DvwrFiPBrbo
         OiA4mkYhIg2dtYMZgj2Dc6eszm0dGMLjv0yca5yzDxpJJm69jd5fFKe5Y49u46x6t/EQ
         gjsgxEhEBJOyzQ1TA95CA1oLhYPNk29nRbY4dFWrGeC3AD1xaJ1S3BkTC1rrTARfVlWc
         aCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791628391; x=1792233191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
        b=zxM+xOBE4NET9fNMM6a0OU7vWINuItzgS28IqRoKHLvz0XgGrUldIdBDxCvAJExpat
         ziTgw4TJ1mcac9YG7VrDBk76+M/O8eO4IKhnyGniFBD8TUtGZBi1Owrx9PjGqM7FUpIp
         EINj/ayt1Mz1KAUInRjH9sF3guUketfl5/Nke/izB5zBBnaPvU1z/++NawfF+zSH4LMX
         mg/7G7Ue3s+8ZwUMFUpF0MQAcdeyO9ZJTD7azRzVZPGpUB1lQpllndIQ22uC3Z9X+ihs
         E2qNubTkOUTws2WzzvKP5QLPJUYFkKOpi1RyUZKGqmRhKA5udqQTPh1RF/AdGqJw8rXN
         THiw==
X-Forwarded-Encrypted: i=1; AKwUvByXgPvQGBKdHxIRfIlKsgaE/uQ7aYqB01hBJJuAEEtUE8qUyZ38QaU1lC8qju9AKU8Zkx+HQb9/E9DqeEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY2z11Fw7cK+okJl2OurOEdDSw6PAl1O7qyPMDUzplwrNXg1us
	804nuZDWYOAZdCQCtEpK4tbv1oUZiCIpcwWIkMi7vThwXpSMgJr+xFXfEA7hV5tYS5IiGEKU99n
	lORN8AO/Z7XCe2AKfC18cj800/ltYGkVpv/A1brksh2hDtsNNx9DfC24yOmBR9rcSGg==
X-Gm-Gg: AYBFou2qqRW+49w6ewDZMkD5lhuGzk5o0f0N8UIbEh17b5W6ADz+lACDy5+oOmd8C7h
	ooeSNylkEeP7NQ6DKGws1XxSlCe0hGMYqRdiUZOag5fM5s0i7bdfBaDX04Bxj2wb9z7BwNRRuE9
	Xzp5iOrVsndL9aPGSNKiajT0lzvzsBbh+LB8nAvwoLerowVPfIkf9AA1Y2tOyynmPD54zH4QC8Q
	HrIoN1eg/QfE4yLzdgzSt1oPpC/K+vQG5DJHirWGLLwoQm2UiwFlrSDEQyePk+fZ3Gu9txLBTB7
	4qGsYr3K1SkuMItiATBReNmlfvArrTJPFITuIroKs0K3xNvKa7FYoSZTRYDOCIwQzejirRM=
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94488325e9.21.1791628390725;
        Sat, 10 Oct 2026 03:33:10 -0700 (PDT)
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94487985e9.21.1791628390226;
        Sat, 10 Oct 2026 03:33:10 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c3a13sm8328544f8f.25.2026.10.10.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:33:08 -0700 (PDT)
Date: Sat, 10 Oct 2026 06:33:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH 2/2] agents: add a skill to determine Fixes tags
Message-ID: <20261010063228-mutt-send-email-mst@kernel.org>
References: <cover.1791499378.git.sashal@kernel.org>
 <7fa126fd22b4449cf63a7045f7cd959e106fac87.1791499378.git.sashal@kernel.org>
 <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>

On Sat, Oct 10, 2026 at 11:40:56AM +0200, Thorsten Leemhuis wrote:
> On 10/9/26 00:54, Sasha Levin wrote:
> >
> > +A ``Fixes:`` tag identifies the commit that introduced the bug being fixed. [...]
> 
> Sorry for partly hijacking this, but it seems appropriate while we are
> at it:
> 
> What exactly is the right commit to specify when it comes to a
> regression caused by a change that exposed a way older bug? The change
> that exposed it? The change that introduced it in the first place? Both?
> I'd tend to "both", but I guess some people might consider this as too
> noisy.
> 
> I've seen occasional discussions about this and our docs for humans are
> a bit vague here:
> 
> Documentation/process/submitting-patches.rst says:
> ""If your patch fixes a bug in a specific commit, e.g. you found an
> issue using git bisect, please use the ‘Fixes:’ tag with at least the
> first 12 characters of the SHA-1 ID, and the one line summary.
> [...]
> A Fixes: tag indicates that the patch fixes a bug in a previous commit.
> It is used to make it easy to determine where an issue originated""
> 
> And Documentation/process/5.Posting.rst says:
> ""One tag is used to refer to earlier commits which introduced problems
> fixed by the patch:""
> 
> Ciao, Thorsten

I'd say the one exposed it. this way it is useful to answer
the question "do i need this fix".

