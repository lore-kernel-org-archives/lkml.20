Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41EE2C11E4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298155; cv=none; b=caG/fS7uzA83Ap8yE5q001E8YxWMEh5DyEkEW7jvoC8x4BGIOocq810u8F4WBbqG6S9lgC8HDkpUH/j6vS2nmlXo9KCPqc9ygpyDN/yV8nmvTjkvYwdbfBymlMEexmQSTYfM1ANsnowyf8RKk9vKzY2UOGipFGn1jdI6W3qA95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298155; c=relaxed/simple;
	bh=ZOQK97y0bGr5e4vNazb8LXTv0hE6s5ZN+zD4c7Lu39c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVnPwWiAp1kHE49D5zGp4boU+SJlwRHbM7RSOFTKyAMs0mmuDY1JLFtl/rqgzs6Kp3tJDPGU7TMYQb/rviZNWw9mPNDdRTdj7nPW1OQUdwq9XLWqAu7xrhvT0J5Ov4nR/CFBYTLxPpAjLmuTpfT2dx+rPgbfa5+YMFhmda2cukQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWmJhLSb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWmJhLSb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so1836885e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788298152; x=1788902952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkxXZUeQJjn9mQeswoxSoUaM3GIUARZ+50jCNpTnH0k=;
        b=CWmJhLSbJruYauMlcR9UHj/7RwuSYpe1RVru7S9RRvPGDWSN3pY2J9Vab958l59Yna
         138X9Gryx8wN9E7vd42m6QEcX8b1p6gJCWYdlfaQoDfxSGKKKZn9N57vAezklwnRbnik
         da4DZdap62Cd1XYsAj6A5vuHU/6YR3MV0XyaeMgLguKqSkvBQDd5im7my0OquTRbt/dn
         zp/fj4GQtN3Q+k7Zm3dxNZgmdpc47MsYjnmX+zEP2g2riOPqdmZrp3dYwCEifuDGTjLY
         3PH0KNZnn5dH15UrVxB7nvy7J68bWeUz7+TlQsCtP8KA1I7BQIk+OnXcvpXEiOASxDSc
         48nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298152; x=1788902952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkxXZUeQJjn9mQeswoxSoUaM3GIUARZ+50jCNpTnH0k=;
        b=qLsWk1+NWmBB/o1vFIujDn2r3JkpdYROkGr9S8lEFPDNV2uzJvW8/8vXjxLRuV/Lfb
         k61Cnw04tkKnD1UpBR/ELTtDY2t3D8HPfrDD0aL9sbhqb5Cug9KBoKwG/wommhZ/vSEt
         JbBrKD4tr82vO4ihaLmy7sN7BwC+1upJd6f6a5eV06r4q9yxfXo8Gcu0e67CnVJalKTL
         n6C0sjSxGEzZO4jw2wPs7TODvf2WTogQDYHU7Hfs5DpMiz9TEaNQ6JruatNE+D1QKc1L
         p8XD09dohaAT0IAZI1dbocLbqz1oUoUpwz980rYtkifarTQeXkAsVJ98JwDwmc2KRMtS
         NIzA==
X-Forwarded-Encrypted: i=1; AHgh+RrmqhsMcS1KcAiDY+JwQeBQu3lxeH3TcSIcAjtgTBPv9yRGDjs7clRB+08eBzLNsER5NAZOggy6tTfNtqY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYodXglHAxizHwwJTq3OhGGcIJFZWndsAreaZnM0veePAfyyp3
	VVdzbsuy4BcG0p35P90JzdkZGeneidwocOiHeU2bZXemeJA5ps0nq+vW
X-Gm-Gg: AR+sD10aLOtzoxNHOcMS69/4kcpaLVIjIzzCbKiW+MzYratKc2QyhV5qI6nJe590ACc
	yj8NZ7tGgMKf5c406OWRbO0bHyTDfBtyHrvwdhV6AhaFW6wxUcsesbvLDWO/yAVPowYncK+nkHh
	9oAflFXKrGX4CmtKLGPu0VmKRYEotaAq+6HtOLps4KHHoyW+YTH0RAdDxr+cg6GZexa/eSvfjlu
	CRcubp1gDubYE5NILP7cMCpyduj3UbcPuPSoHie5yAHBoUv0UDaUq6MRJb74txYUPoapt2sLyfJ
	CYAS/hy5dFynmlMDG/9yzIzaYGGz97LFBNfMrOHWm6sblsMTHuqAiTYN1peSfYdsyEgMzD1deq8
	rvcUPoZWf5moepOEttEOhWTPGsg96Zc1VC+Ja6kSQnJZwaD265aD733zMNORoAPZRHv3s/42qYA
	W/h6h8ur8PSfD2bSiXCANjZFmjEcor5rs41XNHyzKwR7xzwHJSdxSVG1ibRJJSHD3lJD/08ct9k
	S8SPbjlgjgR+alB4Iqv70wgVg==
X-Received: by 2002:a05:600c:6209:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49ce582039fmr7857775e9.7.1788298151943;
        Tue, 01 Sep 2026 14:29:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce3c86a0asm25763485e9.9.2026.09.01.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:29:11 -0700 (PDT)
Date: Tue, 1 Sep 2026 22:29:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Chris Li <sparse@chrisli.org>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with
 sparse
Message-ID: <20260901222909.05d6239f@pumpkin>
In-Reply-To: <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
	<20260831214437.15d6ad34@pumpkin>
	<a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
	<20260901092043.7feaf5d7@pumpkin>
	<dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 11:05:18 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> On 9/1/26 1:20 AM, David Laight wrote:
> > I suspect you need to change the TRACE_EVENT() calls to remove the
> > __bitwise marker.  
> 
> How to remove the __bitwise marker? Removing the __bitwise marker is not
> supported by sparse, isn't it?

Wont (__force u32)u32_bitwise_var remove it - you just have to know the
type.

David
 
