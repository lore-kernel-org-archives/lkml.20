Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414C33BB9FE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184384; cv=none; b=PjoBbYcRWphaZ5EjMGE5Bb/AIkc1870GFDBXrhp/2gjmFIAYI3X8ScWlAwH7cZmt7FksZ4xwPobZyYd9dsUCDrGkIxyQtI+ywk5HrpigZ7uJWnZ397zu8uGBAZAw1EzEP40sk1MrofwbuAbfDT7kJ90zbmHea0jfB3+D83lOCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184384; c=relaxed/simple;
	bh=W1gUpLCRWlS1JI8p6ydDSkx/3ZnL8QYYztGsRW6cz7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipDord+WQUUr864V3o4FAy4MOP9bl1rwgAzkr7q6Lpn8NTsjq63jAgeJZwfdpYumCtGvURO7zbEaUveX3FByLoK0vaCappnqsp/btUWe0Kn7AK++Z2qK43tqwKq2+EC/OuByExJz/zNiAhnVJ86LkSe2+XCbZAuf72ZTikA9QZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EI3HJUkX; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EI3HJUkX"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe207so10783906d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790184381; x=1790789181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ygDODDMwSzeN83/ZHU0g9sP6Gsnzm05V7Ys0IkkdAKM=;
        b=EI3HJUkX72x0G7kCvMu7K+iH4T1WwNa9rC3eU8NzApsv7WwH6y0e7oVcU/xGzaXRrm
         hJdfjfNgXVMmyR22+rxPiodrOr8RxgZ2GPenG6BESkHpx2fcmVE65pLuN5MZnt7JOniy
         5yjYQP4zYSAkt+riq83zcp++GznMTl17l6+duRcS6tOIaHDIJIgz5gY4x7R9qHU8u61B
         4GgfuwKjt8aI4LCAf3VGEt8piYx9AC7BUv1hWOtfm/7O9Bo03czRUredL+Ahl9KaEw2A
         blpJF+5tBL/yRjVjgSIKev56sq3MS1dRLd8di6IrYOj5haLn+ZKasGfoiKkkl939vJFl
         v1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184381; x=1790789181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygDODDMwSzeN83/ZHU0g9sP6Gsnzm05V7Ys0IkkdAKM=;
        b=O15vaFGk8Jr1BVzyeSmNBZvZ6hNOeh1DXd6WVMBr5t3P5/5EmleLq4CBipWJGgeSYx
         8JvYfJMS5jB8moIr37HFzQPw9cvUhjCxyP82PAWtpiFtCs3u2vlX5ddK0kS0afAUrT0J
         DJGYsaUfbE861i64QZjgw7UiaqF0V1NuRx8REGz4wq4jLYHODWkq3zzV9p1iJ/BSIGnN
         MecVLv2w4tIAo0l9aWe1jYmCwPKbPqtCUhWYvJYSXUF7rhvSRQ+rrhEhwuBo3bm9ZDpu
         k96yDleiIlGlpG1nmr69eK1AJsLH2ylLI8aN5JijtedLNtzfeYmhe/+Ax7ziU9YcHk8l
         sDEw==
X-Forwarded-Encrypted: i=1; AKwUvBwdqXjZoHtYiWdxFQQ3fmIfiGKdE/j8XsarzS7Hv2lEibUxI4ovBR2rPkzlYp22MYXthCk66N690Q7CZEo=@vger.kernel.org
X-Gm-Message-State: AFuF++kWvwzgJ6CVrFHCEY/KtmlN7H3DRZSxKs0dKReQcGGbV36hKBDN
	uVWW3xC4LmujSQcPZnG5eoYyf6WjM7Phd//gtsCU+EJcg2fTFbHyeigNjB9XgCoQtfnfmS63ok3
	gqEdLd9Q=
X-Gm-Gg: AYBFou04jJuj6WY5U9kijrmCRPkqDs6Dy3XriaBw6eoPgwZwmR7ZWZff6Fy3QlIsHlB
	vud+9bs4ucBIB0rLFqcZCwTtFfbjKDZbSxHti2tGAunaZ71SZKYKwZmToENPxZOLGOMoCVW99Ly
	T+f+z3TLy477VtuLpWac4Eq7pyxYghqlPM1xLvuSAyStcRrWd3TOfpp7Tn0yIQm13KCBxwtMQR6
	2f1WIgiHMlbC2TegZEWfaP0O0euy7iOGl0kZLN04wTmn+Vr+Y3OMoTj2AEalt5b428cy7hG1hK2
	e2raf51+8MYmsWX0bIgfaTJyweRh7a3ZWtQJjbH/yipk6LYNGeWDgb9ujLkyoA1C+DAFZfTsFH1
	HRTcQuX8xY01B8iXt5WLW61F8gPFohyxy0GChVNOaN+RADB3VHoXBotvlJuW5hs8F1l4Rb6M3+N
	15uCZiKXosBxG9PWjRTrvStbCeSnQTWwwKG+OqpW5gtND0/EsGH2xZHqz4Jko20wegoS1kt8kec
	lhh3+Y8+Np/SLKY61Y1SVvZHvOISzwpCNV8tZS82uGmNkK95e91sgI=
X-Received: by 2002:a05:6214:29ec:b0:910:3ddb:d2b9 with SMTP id 6a1803df08f44-9140c33814emr52013376d6.19.1790184381067;
        Wed, 23 Sep 2026 10:26:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c454374sm24399576d6.35.2026.09.23.10.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:26:19 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:26:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 05/10] mm/madvise: factor huge-PMD folio processing
Message-ID: <arQLDnIocQkdRzUI@gourry-fedora-PF4VCD3F>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-6-gourry@gourry.net>
 <arP4Igew3iL9qVKW@gremlin>
 <arQGK4RbYWYm4En7@gourry-fedora-PF4VCD3F>
 <arQItpXkh7WV4yyR@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arQItpXkh7WV4yyR@gremlin>

On Wed, Sep 23, 2026 at 06:14:29PM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > I think there's some tweaks that could be made here, but I err'd on the
> > side of "don't break shit" before I went twiddling.
> >
> > It is at least easier to understand, but certainly this shows how poorly
> > the original code was structured.
> 
> Yeah, if this is an intermediate state I won't necessarily insist but it just
> feels so odd.
> 
> Maybe have a look at it doing the split in the function and see how that
> sits?
> 

There's an implied v2 for this series i think, i was going to look at
this commit a little more closely for sure.  There's a balance between
making a reviewable patch and fixing poorly structured code.

Let me take a crack at reworking it on top of the series, and then see
whether anything appreciable changes.  If so, then I'd prefer to keep
that in a separate commit so the behavioral change is very explicit.

Some of the sched() nonsense is going to look equally weird.

~Gregory
