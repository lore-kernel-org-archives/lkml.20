Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741E4399CC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386737; cv=none; b=jc8Xx33RfzIithXsqmUHKtNIC2vzJw8X9vMlA/XoCjeb9vGZXo9P3J5mDeOJYqrH53L+KIGARjMDSHyLGmzuYEM1hdo98Hoa3cs0K3nbIMT28A0Vd8eesdmFh5SKa/Vx16I7imOtx6v4gePg7NYHW9HCTXky1WBy12nAuwsqQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386737; c=relaxed/simple;
	bh=5VUr1g1wC1nEP/ami6aHb3Q2voXt0cHbG0PQMdsphZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0wbbA5cZ7eh6hdr9+2I9v8tsXJ7uhI/CNQ4+rsg6qI2uL1yI3P94vlogpnF8JbL7V4oimGf3oCmojYGWrVjimOkoKa58Qt/2itH2q0G53I32wV/pXuWNAF2Rq6wLxIsH9yPzULY4QbQheGKc1GL3wJfKfnUsBUQe69QZvtC6tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/ju5XkU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lfFTCqdM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/ju5XkU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lfFTCqdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788386729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Di8U2A7Z3tpZBcs42uVo91xChtGCHTKjzJEmp7OKOE=;
	b=F/ju5XkUl3GPVFZW8gAVNZVe0gNaaq2hG07bHEjarUhESRknjOYp4W9FLydmaX/Oo+lo8H
	BdssTn/sMBRCNpIASRWdcfjJMHRG4hTI63qyrlQoqmLX2bi5L33/A/02guMnFA7DcNxWwd
	CuGsd8CzgfI90RuQ6KEbC+Sbi+CoDlo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-07r-uCf2MQOs3J2JS4uUcQ-1; Wed, 02 Sep 2026 18:05:28 -0400
X-MC-Unique: 07r-uCf2MQOs3J2JS4uUcQ-1
X-Mimecast-MFC-AGG-ID: 07r-uCf2MQOs3J2JS4uUcQ_1788386728
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d8cdso375922585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788386728; x=1788991528; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Di8U2A7Z3tpZBcs42uVo91xChtGCHTKjzJEmp7OKOE=;
        b=lfFTCqdMJTb2AThMBaq904fJoQRhJX0JpJY8VEz9dgXR+gvQPqIl2vv/fIx6w4dk/G
         Dk6CwG3ssBMZOEkJBbRCqieZru8ofhljQiNMIct/orUQ3xvoZ7OX+c67pHvj4iPqQ/lI
         oh0ysk4lAn0wGToid3LcLDSzSQXBv2b3cTTWhNkpHFNGNV6rw/Yff6CUYc2aJ27jCIcC
         wwQ/ac2yqiTRPj9ru6KFBq6yDl0uMQrgCrliWBliSrAjc918Sx5CjFa/FFqUcgsh2bKa
         jKBPlqHMkJ76OpnsJKYHXBPhia3GK88/yDcgap9TxHEF9FdbA0EZzYsoenHHk3TACXOr
         BYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386728; x=1788991528;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Di8U2A7Z3tpZBcs42uVo91xChtGCHTKjzJEmp7OKOE=;
        b=hUXrfrhGkUruNnahP5GJ0fKiXFqmN8w2xXxa8F+rXZ0j8SVfnenW/roGHV/J2+di+b
         mDn3czi1hdNTRb9vb8YQ4jNS+9S/+gOqx1em3oAC845P7L7hEbzVfeADHvYd5HiXDTsc
         UTttrG2iFfcZFNiMl57JXEVdb219S1QCQdt1uUP/c8+/Pd2WoLyFzlHHrcYQJPO5SDoL
         alZYu9BTfonV1eClpLBmVegEdab8q3iUfLuWMBSpZSBcjLlCzhyiR247oJWMUmtvFsCn
         5Kh/i6nZQWc7KBndWw0bUP/so1XrypF9UaBKpj0mvPz1FtcSN2HiAPKBx0WTdRTRof2q
         se7w==
X-Forwarded-Encrypted: i=1; AKwUvBwY8WUPI61q/rS78NZfCd+EblCmTC8h63mzSkdFrdFrp2gVIQk7XipzVyxh6pPuPPLUMHfafjeYQtOY/E0=@vger.kernel.org
X-Gm-Message-State: AFuF++mYtJnHwHkvcBusbwgh+gRXl4isWc0Oi1Z07R8lb5UpRKacR4eT
	ONlQ7r+TH2k6ueXvHE81WIm0L7igvd+3kXgk/59EPqghkg4OYDuG6ZuE+VybMN0ZHXkb/wF//y2
	22NwHTq83TK3laIOaqHDmBCSIQSLv9PAsIU2bPBd7ZXYCSEPX8o6Ng1uZgY7VNnOkSA==
X-Gm-Gg: AYBFou0WaLrpxfVSXnCpF/kWZlPK0BEfQF/4wJ2vGC1uPEhWJ3JfEQMmWtB0nC4uiwS
	28f6xIO6G66A1kxIcu8qQwObYTPhSaWPzbTFPSrfV33UGUNR5CIqI0glhXtGTt7bG/lVvEri0xp
	HG8fdGTNTeHOoW/E2KidW7gPd8HUrtMONjtS3hd+m34zSux0i+wV3lKRacfei86Pyn5xuuTvM4v
	SXUc9Amgs/bo4YEYbhMB9vrNYqz+axUnJIEtWBz+wb3teBiNU8Japo9xGc2onX/ICNdiL/bxf94
	VZUV69kR58UdsDBn6IyytJnKG7d/WyvGg11Cs6nEFSlCaw6BXiQCQTJU8feAcTq/YLwUf5Y=
X-Received: by 2002:a05:620a:29d2:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9396de968e1mr286043285a.44.1788386722607;
        Wed, 02 Sep 2026 15:05:22 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:939:6de9:4cf9 with SMTP id af79cd13be357-9396de968e1mr286036685a.44.1788386722116;
        Wed, 02 Sep 2026 15:05:22 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f1ae7f8sm321649685a.18.2026.09.02.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:05:20 -0700 (PDT)
Date: Wed, 2 Sep 2026 18:05:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Lechner <david@lechnology.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] clk: davinci: add COMPILE_TEST support
Message-ID: <apidn5onRt_p4FOL@redhat.com>
References: <20260812184001.75093-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812184001.75093-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Rosen,

On Wed, Aug 12, 2026 at 11:40:01AM -0700, Rosen Penev wrote:
> Add a driver-scoped Kconfig symbol for the DaVinci clock drivers so
> they can be built through COMPILE_TEST without selecting the ARM
> DaVinci platform symbols.
> 
> Keep the existing ARM platform behavior by defaulting the new symbol
> from ARCH_DAVINCI, and use it for the davinci clock Makefile entries.
> ARCH_DAVINCI_DA850 is the only remaining DaVinci platform symbol, so a
> single COMMON_CLK_DAVINCI symbol suffices; the whole directory builds
> together just fine.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>

This doesn't apply against the latest clk tree. Can you post a new
version that applies? I'll be able to pick it up.

Thanks,

Brian

