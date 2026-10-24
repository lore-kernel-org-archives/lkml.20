Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792846384;
	b=AYft2nA+qV2EeH5UgGBMgSY1SkIvMkymzu4UahttEbDXXWnDTc3mnK/0X39je8GdEiAh
	 oUINtqtTZ/DyQMadETSASTBSpqh8UBjxIMh04rcxqFSKlxHdHf98S/VDCt+nbV/ZwaVxK
	 iI5lBqWFBDc03lvsMAYqeKYQT1vK9jFe2Hq8Rilrx0hfxK4b2HX6kuwtM4Js0Sn7GhFKn
	 JDaGFOJw2vMxhB4awvjXSWmkUPOCn2GPnZv761WWJUhvOaqMVYDUX3PqOhR+fxKl/z68A
	 UxfyKiUtAKatquUsZBbK/YhXJJR82xQdms9mbcStQM+tF0A8vtd1ln9wpMSo0voMhMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792846384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=LIloQVKLtM3sgtJH3seNv1AXYc9OpmBeH9cov2M83Fs=;
	b=tE0OzViVTSmOHpopSi1tjdTG16o9iTAzVY0ycLdYTDkjAWlIOkwTf1B4IxIZfiWnYp5a
	 UC3ZWK8G3ymB8v6koEH6+fW8i5KRjyB3TeMk0dKtz4MFrho78O33pmC2Mc7LZQI3CdHIh
	 12MBF4PwjwwseHXJKXQzNysgecjvaUXEtb03te9GMRidQPWhP0OE+8rS+P5fTfXBmH/TC
	 M+n2txSRgxdA3tuCm+e3MqnwI3eDIj078x3Og6glZnDAzxRFRqxhyWCdPtlSrBhgvoxLJ
	 Dx1XHTmD3HUse9rZ65k/zXjHKioR3tLv59WYcmDCopbc0pBxjIPIw/I+uPHF6ihmzqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=taylorandnoel.com;
	spf=pass smtp.mailfrom=taylorandnoel.com;
	dkim=pass header.d=taylorandnoel-com.20251104.gappssmtp.com header.i=@taylorandnoel-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r5sn8NC3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F935606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F935606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taylorandnoel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=taylorandnoel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=taylorandnoel-com.20251104.gappssmtp.com header.i=@taylorandnoel-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r5sn8NC3
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91befbcad6dso29054716d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792846382; cv=none;
        d=google.com; s=arc-20260327;
        b=EXy/TMPNxQ9CHLdXJaviCCddSg9Okvzgbz+9MjtInD7fG5YWhNftmVl2HGBlRLRgL6
         JMG0dkUej9TdTqdNnEl6iUirnDiwv/KtB7AW+ptgEbM0fFvrO+7VO1TYmw1sxjCXvlF7
         p+H5iQkU8bnbc3f0MrrIXa9f5f8cMWBgp6l/9uKAtKnyBUBj+ZKcHhuEBH52ex5jxxuC
         C3G3QxMtpBOl0dNuzdkCJKBbAG0QazP6uxDb5If0getd3fZFkKqKvyfVtNkmMPccyX9o
         KxJG5HX/RBdIEC95DgCS/OcgSbUILA6HJ6t8m+mA89UJj+NbFvxytadYooirRD2i1hkD
         UevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LIloQVKLtM3sgtJH3seNv1AXYc9OpmBeH9cov2M83Fs=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=TQtmixgOuQyAZlC6kwaM7P4jd26WmaqnqhhSZ9QhyFaf+SItiAvi5yhdZ8b1CS5VKP
         CRbNPeOeuNz5CF0nTASTUsVdnxQ4NWmApbSBUgN5BX7K8aJ2ba4blDhwxEirv8OLEc1B
         Qh+N8fvKCkxFYX27SRhi6Ili7Akj117owzkU9vOgqhwTJjZhu2tDq+tk0NjZgKen1ul2
         qlaCTIx8H0vf+xF/uVMFIJ3ERU1yHZhVfs54okZtcAhZ61wA9V1p2vMhs9yqp6SJXsyf
         E+ITQfUXz4KpUGSwQBOXqCzMhdWGAKU6Fes5KuooBFP3R6dnHnP880nJla6DvE+O/UYI
         iPuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taylorandnoel-com.20251104.gappssmtp.com; s=20251104; t=1792846382; x=1793451182; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LIloQVKLtM3sgtJH3seNv1AXYc9OpmBeH9cov2M83Fs=;
        b=r5sn8NC3+A/O13uOxerAc6PQmAj/BoxpsT0gf73Gi4Kf5LsKNZki+K7zUEqXmLeTcW
         4pDHlQlXQfR0ultEn7ANod/N2yJSeShAx3NPNt36Z641forBZ1T6rT83+7v1oxrdluWk
         kAqZ2dgBEUFU42WjzqmXoNR1NHfsiqf434fQ1fAR8gN5ZwglBBm6tCbhLFaxuQj/3QuG
         g0AF0Pv+8r36Mq4p+iR4o9XxrnaAjzUioOOHNJi4nKqiHt17i9rzz9GsGyb0+yxW0INe
         V/h8NNn7kMiNsVKYvPjSs6ku9XdI6/w0RchYZeXgDkXhJYLXOTllxG7h199kAAnBlT8T
         Uh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792846382; x=1793451182;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIloQVKLtM3sgtJH3seNv1AXYc9OpmBeH9cov2M83Fs=;
        b=RSyFYeM37N5h08bOrsLBqvKgWTRALU8YNLWAZuLzdeHl5NocLJ5m7sQmY4fmpD06DM
         8S29wpPu/olCSm4igSw1vbLMQJIB9drPV0gzW1sB29mpNZR+H7OM9ddyQxL85SWw3hb6
         AUCtmAfeqjsdHTWm/mwBFmJZYEVYdNM+JlHruaHtiSnG/6iz9iV3sdfUoUtakTvHvSBG
         soAbDczEhxEkM+6fni2O5F4rL5Q0BndWcJxEZW1Z3aKU170nlSRv3tkoY8GkcbYY4n0Y
         OUzpfxxlFYRwpsjQORptG0sIm8qadKcaWMHRHZI1MOL9ra1Uu2RdD52zeuzzQMRUeHlH
         n0wA==
X-Gm-Message-State: AFq9FYJSPZN7j1pWFvxGuLK6Ao1KIHztul2DKTFn9DSiYkY1FRjhjrLt
	0A01tQsJuBC1ttI8aEWRilUAXewhLDg/ZczfRMm/p74O2/hSHUlJcLXrkcLyUcuzF4fecDbkFNv
	g9EbSXnE/43clk9RPPgpS2jo3MV4Vm4yTe6PE7odxEhHnqQQ+rXlV
X-Gm-Gg: AYBFou1DAW6X+/i3cdfSxaNry1ZXTTHIvQlOdOqRsD/LHJiV9SgWOz98jkzVLyP7lgT
	aob9W6QTFyUxxPlgDEFaMK78lZ2jxJQ1IjU/as2mPPC7fZ2pWKKowg/JVGmv1BdRuwIGWuHuObp
	0KZBUTusDzUaAlBHZsdZ8/1tdxhwTb23oXq59zM74uN8D3R/9OMP5H4BZnifBQzDI3Jl80qqmus
	n6xOlBIBZVSXxqPMFhtEX+OM/kVqrvPPXsbz2OWAVNkdTCUYj1alkCs+g1rnYRDE1NFsdtn0DNg
	v62/5rEGVz71l8vwwGvDBmF9V1LkPdoNsq97Bb0wcI3np12V+kztk9t+VisjXU+qWUzxdMKI3mL
	voaKhtehMcbdd6hGUrnxnkborGRk6VCUuMBnPIVaQQgke4Bvd5Lo9bYnUAUFHKmqa/g==
X-Received: by 2002:a05:6214:2681:b0:91b:5d3b:7ab4 with SMTP id
 6a1803df08f44-91c48ebd533mr27362656d6.48.1792846382506; Sat, 24 Oct 2026
 05:53:02 -0700 (PDT)
Received: from 493521813865 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 05:53:01 -0700
Received: from 493521813865 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 05:53:01 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Sarah Noel <sarahnoel@taylorandnoel.com>
Date: Sat, 24 Oct 2026 05:53:01 -0700
X-Gm-Features: AclHuK-we1eB_sdO6cU7cOjhX-J-tlTDvuxlQFSYpCO15L_C4amO58awnDZkAaQ
Message-ID: <CANAxVn2fRAkfnQAPLq=etBuwJ126ej=imeJNd+392Cj694rFSg@mail.gmail.com>
Subject: Checking In on Our Healthy Habits Article
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I wanted to circle back and see if you had a chance to consider our
article on sustainable healthy habits. We believe it could be a
valuable addition to your content lineup.

If you already responded, thanks for that and sorry for the repeat.

Kind regards,
Adam Taylor and Sarah Noel
