Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138D347532
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978299; cv=none; b=ehaWIwWLvrRkYiezsugXJmj4Z6bnGXxFsEncmu0i7hqE3fBIr1VfJOP0Qd8gcEJc6DX+RJXFzRc4Gl7YaoPe+6lvpiwe3Cy3wDT3hJ1h+yvr50mX5AHuSB7UFiTILbLO7vMhVNaZBbXo0DSr2PWiu9ODba40i+YzpEkUmol9Ng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978299; c=relaxed/simple;
	bh=IrlpGamxvY47LrJzjSi4FPT/Dc5GHOnfyc0578uNYcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLcrOhfbnFph5RwxA761FE8cWiLv0xMrqeSz7bzWGNv6WeqFL2r2mXpcUNUBDbZVu8jJlthyZCxLctXlVN74L6NvfMqTvpSl7xmzCi6Gzdt0E9peFbog8bHiCUpE5UieuKWUFmupU4I4BT4AfWlW26U2T8UnBtaXuzB7/RUrMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtZHYnmM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtZHYnmM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so1838465e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978297; x=1791583097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMnh9nYpaVJY0QctaXPIQ7WvaFNDN6p1P1QAh2BjACU=;
        b=PtZHYnmM6WZ1pQLz2rUO1gjTGyCycjkk84vv6MQozPEAIzVDfdWJEm/4WcRtPox9xi
         iTay/Bt59jI4qCTpqomgOYxphZACOdyDr8Igj/2W4iYQuixoT5HAX9uxJOaBiuYzwRkO
         clkKdMKRwyAiPo9RZ15w6FMo5QSOn04SdcicF/RpIwNUOQ4iDOPRBAZyKWKZtfMyylHD
         3NqcPLaGn0bvBuLiJJ6Tea9dWoD4QsgPrj1stl3QDv195oeNDjowjWEgoCg+EDlOCLur
         1nwfAH/Gzv2u9pO27K4D/yr1qT80UsaPuN3A5tTNFzEx8yYwT5AnH7bRXJkvDy+oNhoo
         QAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978297; x=1791583097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMnh9nYpaVJY0QctaXPIQ7WvaFNDN6p1P1QAh2BjACU=;
        b=2DnObCvqMPI/IiCDcTEBOCi1W+NwOQ1CUGAFzN1TWaKqywDXmZ+6n4U43zWBSA1WKq
         6T22/Gs9JNU7HAez8t6BIAkrJlHZKN/Lr7iE5zaX8Kk1N1vDUWO0zWWCD/iZ/GzPyYKr
         UJLWd2zJghhPnh6CoG2OaEV8VofZZy3l+Jano8V1BJDRylFGKv+mRUwGLWTw4z5Anmoo
         Lf6LtbotGJcRN4LAk2ZU0qoY83yQ1gy/6bxX4giYdriNwY6HFgH3L8plFB/nBBSGYRbl
         +vmCPQz2r/A01lx9TXLtc7FErIv5zJ2cLHyAAO6FN7bbkokkEE/2HGgGo/v+7XMJV/39
         jycw==
X-Forwarded-Encrypted: i=1; AKwUvBzFY5sLHY64sGGPhwT8hASWSeMRbyFhPPxcWkmt/1kcmUsdgYrIYU3BGx2XWKrG45W33HUKS83M1jf4M8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nLeVNq/mDVssug0QY8MUmrofYnmyFSaTnAYLaLqCSQSbT+PQgN
	PJ28y5h/xtQREa6QvlA/RymwbJdvlcbMMgIHKWE3B1ziLBoIWZG+3vSN
X-Gm-Gg: AYBFou2O42vF+yoJDUPEIqe0sZb0EUt5Ft1u5YK/ftLHWdWFxSThoI0VUJUydNKy496
	j7NoNMtZJcD8stN7ZM4Kb4H1IOwFjgsTgcjIXgj7JN6lYvAjH0ZKSrxgh/l1CkizVPe9tPDYpre
	EP7qDtKzSidLgpqsdF1NDzh8PG88zh9Qb7hv2LpQclEvyLpLeDqpQGrlqFlWY983xb8MMsCDudR
	VHOHIrCl+o8ZnaeMsXEWnOP1PcurDspJkmx0nSpLZNOcdEmY3/ixJ+qkW9NcgWEAcF8BNpkyvoP
	sGlQiRTWHMMf3O8E9V3IE3zjbPtJDnbmhOAplS0J3GYDT09PBTs0VdOxdHr9P0lHq9fPiBY8hjr
	352GlHV/BGEQ8/SoluL09t6VewQYqAVIybBUqHxcfIRk5btpdU5cCHy77bZzGDihKOeXZjVWZh3
	yo4NtNnnRViMyGeusQrlUy6NtdzTqX0H/cCrjx2f1NeIh5htZgsg3Ayo/hi+nIRGLKoXjUSn9pv
	4x1+i7Ri25ihew8ZNSOjhJnbJkj1sXxmlSZSvgk60l3d0K2QdF7kYRS/S4M9HFOGs5DkarioiCO
	vlEYj0bIkQWp4AHJPGt0azIgTXxaZ44bssPQ/XSAUo9Yua0KvwOVvGlvwCnCDDDuQzG8j6HK7iD
	05lDajHpXUoQ=
X-Received: by 2002:a05:600c:138b:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a02759b46fmr71998765e9.19.1790978296761;
        Fri, 02 Oct 2026 14:58:16 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-af35-1901-81da-eee8-c2d0-ee3b.310.pool.telefonica.de. [2a02:3100:af35:1901:81da:eee8:c2d0:ee3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm120987985e9.9.2026.10.02.14.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:58:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 23:58:14 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: intc: sort the prio and sense lists after filling
 them
Message-ID: <asAk-lpM0rBnQTT3@gmail.com>
References: <20260927191359.6144-1-kmehltretter@gmail.com>
 <3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de>

On Fri, Oct 02, 2026 at 06:57:19AM +0100, John Paul Adrian Glaubitz wrote:
> I just booted the kernel with slub_debug=FZPU on my SH-7785LCR EVB and
> I'm getting the following "kmalloc Redzone overwritten" warning in both
> cases.
> 

Hi Adrian,

thanks for testing. A cold reboot is not needed. The reported object was
allocated by usb_get_configuration(), so this warning is unrelated to the
INTC patch.

I sent a fix for the USB R8A66597 bug and copied you:

https://lore.kernel.org/r/20261002213225.27834-1-kmehltretter@gmail.com/

> Are you sure your patch actually fixes this problem?
> 
> Or do I maybe need a cold reboot?

A cold reboot is not needed.

The INTC allocation remains live after boot, so SLUB does not necessarily
check its redzone automatically. To check it explicitly after boot, run:

  echo 1 > /sys/kernel/slab/kmalloc-32/validate

Could you please test once with only the USB patch and once with both
patches, using slub_debug=FZPU and running that command after each boot?

Thanks,
Karl
