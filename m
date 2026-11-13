Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600997;
	b=qvVYmDBD4BVjfWwpts+eAzlt1JlJc4BWooSziJ5ig4JFgEgyBap+wlGNiimSH9eVlJ/W
	 5PjUMLNgLUOyoIL4qR7PXwuf1Q6QZT7Bhy/k0cEDwduW4IZyw2+S7qn2XSrxA8zP2DTY/
	 QdgFfMCvrIX6IpxFW5Kq/cPojMHjlepAzzlascpsXbYzkZybRw0KNKn/twi7loirShoYz
	 XeZ9xoZMXFy52UwIlD07HIPiVwRZrdbZVStzkOxhgla97DtMDNCDtffa0I4N9p4M501Ja
	 sne0tVU8O82of1MCshpBtbbLnSJSBvUULJcHc6BOKoFn4WHZGJqIsflmROql72E/HCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=yvdKJNv8V04CuNvtL9/ky27CXMTr7ydOzimWcL7zjCc=;
	b=G/SEMJ5cp4vvQPumwJefMmgPVC+WRXy9Zu/AVB4iZ1hG9ULwzEC6TsHBA0kDDGKK7/AF
	 TrN3RIaWJko6ReKclm3NJiibDuy3SvsE59HcMCZCowBdz6dxkI2XUZm6XEeHjYVy7BaJH
	 NHYVF6OYNuOtn0l0DuMPMGC02YokDiXur7NTSOsczpYCYDjniwIW2Vmhyt3Msnsj2mYOg
	 kP1ryWS979KYGVMR2xEVGMniMnuXB1lOQ19bdjUsMJ7AjjF0naH4111u0L6u5ID7cjs+q
	 cRZcHxtsE3ahgSry2eoKPnBnUooU1qHca2g4XmU4v/wxHOMY5mNHVmShcFazE29GcEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggbFz86P;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D6A606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D6A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggbFz86P
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb61185057so840485e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600996; x=1795205796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvdKJNv8V04CuNvtL9/ky27CXMTr7ydOzimWcL7zjCc=;
        b=ggbFz86PZ19pd6a8yEtWjlR23GMGBo70CPaecmEpktaYZ7ejxop4ikBV5MVOgkRHMB
         VVB0Bin4edGKZ5WBgJloEF18Eft0y2T1hL9bil0mEcjQCetqmBvXjwneWo0rpK7/ly/w
         EO9QR/VTRQp9ZvlvfZUL/oxz4QPXafAQsvJnj7ahdmhRN9dwG7iX9rfW3dF6DwLP/wF2
         u7UNZkhV77CvP7IPQZ3EKgqzJTpwhWrXNjODTjkVY4sw8kDX5rFVYaemcHt082sC7zE5
         QNangEb7P+jmxxIwub/uQIm/2urZf+bEeeQbAwecFBVvsrOi1Sl5P5/+BZSPBzVnzh06
         r9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600996; x=1795205796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yvdKJNv8V04CuNvtL9/ky27CXMTr7ydOzimWcL7zjCc=;
        b=hJsARRncnBUOcCuLZEahmn467iSi28SQhPlEgewFhPJEvwHpdymUYnP1+0zbTw44ul
         9VTYZfTc8xGPR/ZvNrS/J49od9A+mXqqDxlzSRvsgbhyCjaBAGJiz7KUW9vap9SVNNSO
         6tSw+0GeXxoGXN+3wN4E727X23/SttU5XfVz1PUoh8uj98zfWK5YnOdcA6YWfwdfARiI
         SEcjgqAjr6IhOO+YkA1VMFneoZq02MMDu5rpi6x5EokjfCL+AI24/HL65gKkpMwAEjhx
         kqA/rZtyBrPnvPhYD1jlstRV5NzfVCy9K+8A85WQs+RhpRsN82S9//PPrRQgD+twMl+X
         IrRw==
X-Forwarded-Encrypted: i=1; AL+hErEkM9kHlLno3a+pcdtldjlhzo6Dxs3yEecDLPpWYFozNaIdnSYMIGPv04PKp/5fYD1NWGk/9C1IBVk5iL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MoBjLXHQb/is9WqiLavHE/FAq7+IC037XEEVTRDmijnFlUf/y
	EAkpszjBsO88oK9WIupDVvXq8XZblSpRbbSAwbNWSlqptyzIq7kgujeS
X-Gm-Gg: AYBFou08X4yMkhDL6DIXfG7JrWs6/D/x8UTjcHt9VMW+fp8ouddMJMWBcYQBqSK/cDe
	XEDFYCAgzFOlaUuotYHvb8ayAYpeasGQ1BYZ34cW5Kn14ZRM1LfP2wAp+c3P+FAsDXqK4Ri239P
	BebCr0XnuSFxDssluvjXHXYByuTWm+LSzOPf/K26c7IUrvFxMubb15p7zrmUiC3Nhw2b6r7C8vH
	XvrFSAIsuE3X+RMiPoSt1GKhM92j2D6WSrgFwiK/r/2gIQ7tJksetBRAyV11Y9KseXVM8+nDYRM
	GW1mWGU2WuMZx6mK9eBOl1bPln0bK+KBaZ2brpeEa+N+TtURNvgz0g3OYvKx0LSF4EepVl9zUKj
	SY/WSCc0UiP8AePc6K8BsKv4Bo9g/LPz6Mof7S5J7eO3doVkbHp2DjfFz77pgYhkUe8pyY6bBrS
	b5C7qc21iDcBcZC4Jw7lTNiEr+N+TFviucHp1i3qfQ8Q9CQcu3IrAwVyv5jjyhfrC4A/OeVSBce
	niKAxBwLrnrX+Rs7hPppnOwHSqFRuD5Xb6/FDWBlmo/r4fGkMjOfGR8eq4cEqWYVds7VYe93AMt
	YzB3hGI6IB4+2IT/y3JYpNqIkZth1L2IgBbH06PocRXJViaHSMdteg==
X-Received: by 2002:a05:600c:1f96:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb55a4ea81mr74860855e9.14.1794600995421;
        Fri, 13 Nov 2026 12:16:35 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm178215465e9.8.2026.11.13.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:16:35 -0800 (PST)
Date: Fri, 13 Nov 2026 21:16:33 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/4] landlock: Fix REFER in layered domains
Message-ID: <20261113.3fa14baa784d@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261113.eiChee8pohch@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113.eiChee8pohch@digikod.net>

On Fri, Nov 13, 2026 at 12:24:52AM +0100, Mickaël Salaün wrote:
> On Sun, Nov 08, 2026 at 09:23:47PM +0100, Günther Noack wrote:
> > This patchset
> > =============
> > 
> > This patchset fixes the issue in three commits:
> 
> Four patches now.

Five patches now; updated :)

–Günther
