Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258615;
	b=CUOEz+k1KnV8GfYSKcFJ3nOl8EsSXaFRSNQYzqVbaXRgBL7MujtSvkxRiXCElqbb/jqt
	 dOwGlGM0HP3qNFetpa29EZKhc7+MU1vSQ0mdAswDth8GPIll11mzKG4tm80dsWAa8gZWF
	 E21p0t04Ff6nZmvCs8cZqBE+bNoNd7UN86fxAmrP2zek/+RQuDUO/nz6AK0uYsgR7Eh/b
	 WwNfAeuuzVXcm7B8b+b9UObIme85w0QalxtWgV41MxBo6AuXrs3zXcQoEueNGOflwYuJ8
	 ANej4eiz1jPksQHvl8CcRLLHOqjUscEyRsYSRc0B5CtNxoZCI6LcoTWGDFlPjkpmw7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258615;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=1H7zaCpieKBLh84LxvwJhxxRE643HHbqTw00oHfOz4M=;
	b=d+sBp147t8FrcUZ+I5BFv2oXHn+mq3cDX/EFHnZbny3GdOES2TFod2QJDFmI9UACYVq2
	 8rye2UN8YjcU4t3MEoU+K/loQYWdNCG4EOB7goN6/MwV03VR9WS1O2TnYX3ZiIThddebz
	 AddK4Q7C/TL/CtK9WqK6+ZeNp1oXUx7AQdHFUzrj+3xt7/lkRGKofatrRfbOS4vr9AvOW
	 snck2XSAgoHdhjHJzC+WX97gjnpBGYfymxscjupxZ3z+6870QLpmHEYnQKgZM9K5rWH3K
	 Mad/4iznVk7CRfgFIgFJ2gVPmq5n3NBCjK/FPfSUyv9PimJyKLmUX4Bz18DQRWY54bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMuVRsUF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S3jiDS69;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF56606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMuVRsUF;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S3jiDS69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794258613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1H7zaCpieKBLh84LxvwJhxxRE643HHbqTw00oHfOz4M=;
	b=JMuVRsUFNk9cuIX+zwtr3SP238wHdc6lW0O0zI+JHWiFPxYy/JLIkooU12IGJqP9iPmvdD
	nejnXcenJ2TEG/QOtg7JBigtGQVw9ivQLRJbcO1MzGbR0SUQPsY/86fcPpgnBMgUB30/Ta
	MWKAIQggif9ICAhuHo6AE6TIK1ruXZk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-MM29Nh2YNZ6g83pr9_-lBQ-1; Mon, 09 Nov 2026 16:10:11 -0500
X-MC-Unique: MM29Nh2YNZ6g83pr9_-lBQ-1
X-Mimecast-MFC-AGG-ID: MM29Nh2YNZ6g83pr9_-lBQ_1794258611
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b2fd108b28so20034797b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794258611; x=1794863411; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1H7zaCpieKBLh84LxvwJhxxRE643HHbqTw00oHfOz4M=;
        b=S3jiDS69s2rRCmUyga+BgmMGh924765qbBsVa9HU9yNx2/pyBWZlFu8MB3XoxlrBsR
         UY2euHDsDZ6Z3NZ+BMjmfncHhzk+9w/BVgW96opx7KSAJx7bh0Lm9LN4LrEnHlnqBzdL
         6T6Forbbeiv06LpeZmViNJbbdxOc8TgEukT+6i7FUuYsQSWPUPJug1F7MA0f1wMg/DEM
         NwnhMwfyesTt66yHEKCCLqHd2pLcXIV3o2qWgiMje0VAIOZRm0T9O0JEz4WPe+LWns0v
         QJ2K9TDkXJPdsYATcOMn2xxDCeTI8piCPB6+DCqdl++9bffOc/ZxOvZggN8sSKmIYFPs
         XLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258611; x=1794863411;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1H7zaCpieKBLh84LxvwJhxxRE643HHbqTw00oHfOz4M=;
        b=NKB7tTOtr5LelEuARDrYLKEUjRPgUjQ+K2xrFwyXbARFWqqQaOO1ry+3u/SO0nKrE9
         78H0b4l94jQZqeFw9odWLc3iXI+nM5qK4b7d2sfn+JxhGEBLSzXimTQVEiTcoRIETDAK
         zJJ2FMiib6cZ2A1IFlMiiklsQ+WLTzMPyo5CAJxV5F1qFx/7WKbwGv4fw9eupbE50TC3
         ORrwPhGZp5bDcM9mjP22Di8Ls1npaGUsVFlpxJ/YtVL21J7KQd0aCjuzBvOO3fgXM7J0
         qWpczagQ2hyD9xaUQilpS4M0v2uHAhdzJSG8s7XgakIYvdTrHtWRXginwVpt8zko7mnu
         HBmA==
X-Forwarded-Encrypted: i=1; AL+hErGVXYKAd96piSfQAbXl1urxdM+foAysjDd7I10fmcpoO+H7C0+9Ko6vvoaZrgq70W5pB/iEXkv+jAvkIX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+irmaveJ1KhoYZ10RxFf5ZE6u4HCxcukWXToJ/QflDFb5hT348
	sHqd/+41VEVhhVD7tT75B9nT5jj0hpr+q5VUOfq9JWh/ynNYNwPs46q+s2h0Bj0hDskJ9LP+GVi
	PukpByszNgo9HOyZLN2IIIhCpi8VJdHGCeV9jUJxcZjeCxdZf+Mv5Mb0ImSdMkBL03w==
X-Gm-Gg: AYBFou3lb21cyDHnRkXZv5dPWz2xoX4cdW4e3FFcPxGOOZd0pLce9s78q2f9m2U3loI
	x193qMzqx4BpKvu2EAt/RqQBK30td8FD2Fuz9qXFz/CqX6auhVZ+C5VsxEHIm55z8svheLtfFiU
	fR4uIfuuEQkgF0Y2h0oz8jPXWEHT8c+n+R2HAkLrt8NOcMvCIv6Ebc1PROaKulW16v29FT5pQ+/
	S7JZdjAMZti2yvlh5LsD0rkG++bFDT2hP/fN7YTTC0HiNU8JbEy4nmRze9nB81qBfEkojQBYeHr
	PoogwIimqRb9gi5itUSZUFHm71nHd0I1tq91MWAEtSe+kr9BjXGHWL1O6/Gpu2xsaddvm4V8+c1
	+zYL3Q70AN9QCn2VruIf/0mVqRe5YaPUUtapnufRCrihNw8gwFzvTZQDKkTGN3NsUMgzKNMBpeE
	8R
X-Received: by 2002:a05:690c:ec6:b0:8b3:361f:5d7a with SMTP id 00721157ae682-8b392aa0a33mr3430097b3.41.1794258611113;
        Mon, 09 Nov 2026 13:10:11 -0800 (PST)
X-Received: by 2002:a05:690c:ec6:b0:8b3:361f:5d7a with SMTP id 00721157ae682-8b392aa0a33mr3429887b3.41.1794258610682;
        Mon, 09 Nov 2026 13:10:10 -0800 (PST)
Received: from redhat.com ([2600:381:e227:64a:814:7bae:8aaa:cea9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393421a3esm3583157b3.32.2026.11.09.13.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:10:07 -0800 (PST)
Date: Mon, 9 Nov 2026 16:10:05 -0500
From: Brian Masney <bmasney@redhat.com>
To: Mark Brown <broonie@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] spi: convert to subsys_platform_driver()
Message-ID: <avI2rf-04L3FOfSv@redhat.com>
References: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
 <e86963ef-6080-4aa2-ac80-e06d16d9b092@sirena.org.uk>
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
In-Reply-To: <e86963ef-6080-4aa2-ac80-e06d16d9b092@sirena.org.uk>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Mark,

On Mon, Nov 09, 2026 at 07:14:33PM +0000, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 07:33:07PM -0500, Brian Masney wrote:
> > Reduce boilerplate code in these drivers and convert them over to use
> > the macro subsys_platform_driver().
> 
> This doesn't apply against current code, please check and resend.

I see that Peng Fan already beat me to this! There's nothing else to add
from my series, so there will be no follow up from me.

Peng: Just a heads up that I posted patches across the tree Friday for
this migrated. I think I changed everything that can be easily migrated.
I suspect we may have collided in other subsystems.

Brian

