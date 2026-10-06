Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B114A8FD1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311603; cv=none; b=nFjBjA5+fGp0lO6mzvk72SNc0X0HXPN8mAeN381SxFJjbqcDDhAiDHN7UGnykLfx3HF5ETSiuayQHmjheBK9++1UDvnJrARP9dC3ZumE01P7I5KMa7lxR0zJgZzZ1RSSZC281DO23XQEVkTyRnKBSTPz+ciLedUA//3udou3fO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311603; c=relaxed/simple;
	bh=zSjwMrhpQy0gdO4THn+5z3rARqPugiKEYMi5sHySdqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwoK7DL5Nhy4h9V0iUTtj4LU6Sftg7tVYJnLMOvao3LM+GpYHh9lcO+BXto+hPknHGXMMfwP3MCBkrX+dK7v31231LXLOfWqL9Y6BYBDubsnBAhDZh3kjVJgElcHSH+CeU8OQptpAvjLZl5iA4vGoM7k/J0LmCfzb77OjcdYPVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqVRhRRc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqVRhRRc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so8536425e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791311599; x=1791916399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iL7IcH9O1zz5fUcz180g3RzsepryNL5OFkSsRSiDAvI=;
        b=aqVRhRRcwUdaRWL90B0O+MRiZHc5xjZqJBbWVT8iuuS/RoUaJaimlnMG4a4YlmCBCC
         /FILERz2tPeu2uuZKCHbWv2uBofvaBNdQ9NjVa/XjYNkk+cOTd9MCXqZptkmMW+zOxzg
         sNFbt6n/KZ7dt4M/3qXCbTxJCjOYOzzgNIvPCbj8oYQ8AsWomH7/2LArf8N4K/GO6bAO
         xjxR4vxkedZjvX1Q8ayxDRuTzxRF6P66aBZDHZ8u1aV7+8ACZi4kOLxw2HfBBlK5Ax5r
         yn8RYx4DWqJNa0aPyk4NuQzz1l9Wbyzo//uN2P816cxsZC91rel0jZh6AcolqcDmOReF
         b7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791311599; x=1791916399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iL7IcH9O1zz5fUcz180g3RzsepryNL5OFkSsRSiDAvI=;
        b=xtc+Az4a0Iv0dDRpXVL6O+Lr0QfbWmKcADQmaprQaBwil31B6fCOOOttyaBGoN9tH5
         5rq0nEhmrexzl6UFYDs6G//vRyz64uj93VuvZSoJF3fLN7/ZKgwVFqNBqraX/9BR0Pwy
         gsivgjoqHZxfLUtgd5wzwxu6VDe5hNG0F5LfntBjVKck+QMIeUJtandhC4Sp8ZSP+dng
         0YJdGEBPix1LeNMVkqreyGkR1UetWEpUxt91c6f8p3HIEtHtrDNBw5hnOl2oLMNAmbX1
         4lfeh7BM9XBf6FotaXR00mQ9cuSkHcNIk8+t/qKd3q1KTlfjQie0fsxxZl+mnTmQiQUG
         l85w==
X-Forwarded-Encrypted: i=1; AKwUvByZdVm1eZriHPUeQM0R2zXvuIIOREg8zs/GfpZbI3I1HamdeF1y+aVB1+4Jjo7j5n0ecSVzHmUUdmOglvE=@vger.kernel.org
X-Gm-Message-State: AFuF++lxpsOXPfL/6BqN+yNKBqGoDTxHHvAvknPBm6Q44f7o52xw8W26
	HO4BRWYtSnqRb1ejHlxsFLKsg+jvzvGzPnfqYoYH/w/RcKJhhZ/2oNE=
X-Gm-Gg: AYBFou0yTVwPfsl8rjzUYnyH5FqC5VhnyNMlHfK+po07EXOXBCow8Q518fIWV8V+UMH
	V+oFti9EsS/cDlntyWITNqYwLcoid56rGn+NTjJLBQwrjc4gBis5yoOac8eT2ybhf5FZCJsGoH4
	B/F913cDoM2G2lLHo8SksrQwzeXHTZtO7D5YaQvizVc73kILBj8g9Kf+q2l2ZBMa/n9FaPI0vX2
	7XWJO/2cbnnwHr2ev8JgNTag0jAi6iNUMkPCbjDXMWFdrmcYefEcyxvtRIldevPct80t9q5Lmsf
	2xvOI7zjyp2FoZW4zgPWgef2WvYFCWyoKIkVveSm2QDmVcLqT+QSkw1bTux6v0k9RngjbmY/g2q
	lK3mFVLu/xZEGYNfBM5eh8Cd50Ec9z09RBrmmaO5hVfL/4RFJ8grqqSD7W+sP4aoJa1gE/73Xwa
	P9GfpEQ/qu681wtFDP4wOHKzzJJfA930KQt+a1Cumh7ajlo2viR5CQL8m4odSqZjXP7yMhsonVu
	rZFXwW1vQyZtA29tgKCzI7xhJ0xg25F0nHHtprhM0nSwXRnrQ==
X-Received: by 2002:a05:600c:4f4c:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a17b53c623mr45024235e9.19.1791311599064;
        Tue, 06 Oct 2026 11:33:19 -0700 (PDT)
Received: from lithos ([2a02:810d:4a94:b300:d1f6:bf6:35f2:f07c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1fec3sm1102411f8f.37.2026.10.06.11.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:33:18 -0700 (PDT)
Date: Tue, 6 Oct 2026 20:33:13 +0200
From: Florian Fuchs <fuchsfl@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: lib: Restore r4 in shift helpers
Message-ID: <asU-6UBmN4OjNsLV@lithos>
References: <20260714104147.2016549-1-fuchsfl@gmail.com>
 <85c4e0b40ec4b52b73c1525c2340cdaf31fd7d6a.camel@physik.fu-berlin.de>
 <e2d4c042a53eddc1ea8d800e171e6c59c9d3f7e1.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2d4c042a53eddc1ea8d800e171e6c59c9d3f7e1.camel@physik.fu-berlin.de>

On 06 Oct 07:41, John Paul Adrian Glaubitz wrote:
> > Please correct me if I'm wrong, but after reading the code in [1], it looks
> > to me as your patch doesn't preserve r4 but it's actually storing it into
> > r0 to be used by the selected shift sequence.

Yes, the value is copied to r0 for the shift sequence to use, but only after
the r4 original value has been popped back into r4.

The shift sequence themselfs only operate on r0 and then rts, so nothing
touches r4 after this point.

So the caller gets the original r4 back, which is what GCC expects.

> > With the previous code, r4 is pushed onto the stack first but not restored
> > before the shift sequence is jumped to, so what your patch does not make sure
> > that r4 is restored across the complete call of the shift helper but rather
> > restore the input value in r4 from the stack before calling the jump sequence.

Yes, it needs the selected shift sequence to not touch r4 as well.

> Could you comment on this and maybe rephrase your commit message if you agree
> with my analysis? The patch itself is fine, but I think the description is
> somewhat inaccurate.

I think your analysis is correct. The selected shift sequences don't touch 
other register beside r0, so I think it is currently not necessary to make
sure that r4 survives the complete call, even if the selected sequence would
touch r4.

Is it more accurate or which aspect would need a better message, or do
you dislike the "across the whole call" aspect? While the patch doesn't
really make sure r4 is always preserved, it reflects the behaviour after
the patch.

	Commit 940d4113f330 ("sh: New gcc support") reuses r4 as scratch for
	the jump table offset and pops the saved value into r0 in the jmp
	delay slot, so the helpers return with r4 still holding the table
	byte. GCC can keep a live value in r4 across the call, which leads to
	runtime data corruption.

	GCC calls __ashlsi3, __ashrsi3 and __lshrsi3 with a special convention:
	value in r4, result in r0, and only r0 and T clobbered.

	Pop the saved value back into r4 before the jmp and copy it to r0 in
	the delay slot. The shift sequences only operate on r0, so r4 is now
	preserved across the whole call.

Regards
Florian
