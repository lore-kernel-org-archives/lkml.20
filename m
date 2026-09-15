Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839463F7ABD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495111; cv=none; b=XkLd61EauNO1s8de4KbGkRp3mlSWSRtmb+M4WA6a3razG+K/BiPzDSMKB0uNKQJRPOzcqyajwQZSN8sdvcIKFfKWkSWBdHOtWIaG5yDmumHLIFjvMDjCs94jRuFFkpSqhGzGd/c88CH3JasBEZLz5A/Q3AMnLj2F+ARMFXZ+oQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495111; c=relaxed/simple;
	bh=SfG8vwTqe4TcUJSbsJF8gE20YotoiJTOyVPoOfSALB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBt/S9TWEGoLXmwIz5B7Vmgddqv28qCju43g4Vq2XEL08ElTP42DZK63VfHziJOHKpfvlJEmXzXiCWXH6poptgH7jxpOFtVuQtJKEwBjudU13ff2HD5MOp2SPCaeUlvRstgfwXdwWb2EZBK8LbQ8GEjvLSFY/dePxFh+CoYn74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GawNDlmf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GawNDlmf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so435405e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495108; x=1790099908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+H1sTCqogfHVEMIyxU/sX424jivm8nyc1UeMZaa0E9w=;
        b=GawNDlmfWcfonlHpEv2QPnsToubye99ITpC660uVyOUma1lJLN78dEdi+5662J3aKA
         S1mYuOg/zwuGe9AN816/bn50SZYks2gLdey6NS55vJ53FMScFef4PX1t9St1T80V8Iyy
         odS1aPShkw2ucHTwxxARWKq3BSh1+yPTs4UCjlDmiaGAJqMpSeQyHZFOYp5RuHwhb3q5
         NYe/cnr0uzUTPH9ZCXFTwDGwoGRuRBW3Se3090XcrGcNAMs6+eoKURuGjwxM9WsRLOHW
         oB2VlmhwF1IQM0/3Pe4RnrwEFP8637NIILAhkAyULEUiTlW14QyEuAJHCiz5LRlyQk7y
         yqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495108; x=1790099908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+H1sTCqogfHVEMIyxU/sX424jivm8nyc1UeMZaa0E9w=;
        b=uL4F+EMfsXmch4iRDywiKbgP2ShPRQeZEOCu9rxR7PjM+bQ6tDtTzIP+1nOwkMP35O
         E9PTWzitpfVDP7quP7bsi/SmqbJzcD4nzC4NLikzWvz0ICJwxzl8YFkp32eRhTAztrCR
         ySYSKhwVofivHR0nJIE5q+LIjU7C7cb//MC8G44YCCT7E4QqwUToeN4499x/39p8qAe3
         PT+eqn7qqiEajZXFBxqLGb2QQlZQLCKDWdFPL8zNkgMj/LebhA/kc3S3MKTA/7SJqooI
         UzNPuJ4mBlzt3In/2Nnu6kBMH8IhvqVTJa0PI6Mzf1B1P9j21ZruC1LPotkq8wU+PlcR
         g/vg==
X-Forwarded-Encrypted: i=1; AKwUvBwTz63Pk5ynyacffwX5RazybtAvTDZ8WnnD6SV3n+SyMDndOYjgBdA4ty9kqkEazQbzqYzC836My5cQweE=@vger.kernel.org
X-Gm-Message-State: AFuF++m1u02qpXXymXPmQX+Nh76HuUe/L/hmaKvt2OgD+unW09wStaF1
	oDotSxaC+pBiK2rQWLBHA2fX61cSzCmsDbun0E3h2matO/DFN8UW9WYy
X-Gm-Gg: AYBFou0DpS2lDpTLmgfCChI1Ts373w13LVRoU+i+z8RNO85cfoJwEqUyaF6+FGEtNv3
	OTAGVZDgYlGsL3g7qOuBe/eBbPj+pAdSi1mdQmsTFeRJRRC88RA/p/7dVpQxMQt5HeJh4VRZ34F
	CMyEMQqixeVM4rr3d+Ti9YXcVvPlMzcCmWH6ANfCpaY4A0B4z9iUOxP7ynfkYJJGIEsXfI+t+u4
	9FGsUc6ToiSsp+8kaXcO3kA58syF9Y9m6xXx33jGWKnzzi8KvjjVX7XQTbhEpAVn0zHtfeQRKVO
	Tl91b6iVXJRHe85iEgvXipMVP+jz5rRmglsWmYemJ4cGw1CFrQhGEOVsL2Va/tsWpyAu4pahaMY
	TFyRt1vwSCuvF4W2KCIUIA7yyRzL+X4FtTBxLoaKu9DeHAcK3EhBg38bmhSklGej9BrIhB8YKg/
	KRPpQ8MC3Y3bTW7gMNxgzSM2GP2/zhpFkX88JwiIoWmuemrIeLauMW0lmKaP1TmSg7WlP1vh4d7
	brkLg==
X-Received: by 2002:a05:600d:8652:10b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49e7d73dcf2mr47539035e9.9.1789495107673;
        Tue, 15 Sep 2026 10:58:27 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm755687f8f.9.2026.09.15.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:58:27 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:58:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Message-ID: <aqmHP5QaqfC_St6_@stanley.mountain>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
 <aqmGLBRaLwQ5GpXS@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqmGLBRaLwQ5GpXS@stanley.mountain>

On Tue, Sep 15, 2026 at 08:53:48PM +0300, Dan Carpenter wrote:
> On Tue, Sep 15, 2026 at 07:38:23PM +0300, Dan Carpenter wrote:
> > Callers should test the return from of_clk_get_by_name() with IS_ERR().
> > The function returns a valid clock on success and an error pointer on
> > failure; NULL is not a valid return value.
> > 
> > Document this explicitly to prevent callers from treating NULL as a
> > separate failure case.
> > 
> > Assisted-by: ChatGPT:gpt-5
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> > There are a few other functions which look like they return NULL but
> > never actually do.  This is one which has caused some confusion in
> > the past.
> 
> Sashiko says that it looks like it can return NULL.
> https://lore.kernel.org/all/20260915164913.597D51F000FF@smtp.kernel.org/
> It does *look* that way, which is why I'm adding the documentation
> to say that looks are confusing.
> 
> It's pretty normal for these types of functions to return an error pointer
> for errors and NULL for not found, but the of_clk_get_by_name() returns
> -ENOENT on error.  https://lkml.iu.edu/1810.1/06936.html

Doh.  I meant -ENOENT on not found.  Error pointers for errros and also
for not found.

regards,
dan carpenter

