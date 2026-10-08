Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6C3C4B8D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442063; cv=none; b=Fwz0G9bhNg3aS3oW9SN/5E9uAiHVF4irMsdUAuMNE1W3RxhsHeohaKuPj5cdGt7rYT++LaW6Wyd8iAVMikQkrJ4vCn+9+K2+Chh3JyvsJqXjbChbCrnzigNGB/ZsmFVfTLlcQ1dQhfYnU1TNJdWgxTapGy0WUvD9kjw7iQONJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442063; c=relaxed/simple;
	bh=aSPhb7m37JJIpoDkFdsuy/s8Yx6Y8o2Wuc+YdzLkbDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeruONbEx/x70a1aL7o/5/hPxN9eXUkU2WUWznjPVUhyE6JAqf9p04+T+06rexWN+EcetVdOaC8c9agtWx7t6RKXLRZHTc1MRvuvJwG6+O2HCXHR103QNLbM6y5LzV2amXQ3LGBI+TUbNFTMyglUX+VA0752ynucVULklvJCHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CUKGpUl1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CUKGpUl1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso2952953a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791442062; x=1792046862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSjhmKDAna0MFV1NJVV8j+rU8jCUwUZHyKcOgZTfTBo=;
        b=CUKGpUl1Zqcy6Ia35PQskFQCzOxWjd3JntCL7h+h5eoQrR4Wc6syTUzQxgM7sNeDy+
         jD6GEyL9CcvG8QpTBgHEx25l01BWccqMW6wx5qthdy4Itjl/V+21nvTdA4dcwDYOShty
         Xx6xY1SwlH0XGDzKZhQxxX15QTWh/FmogRZu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442062; x=1792046862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qSjhmKDAna0MFV1NJVV8j+rU8jCUwUZHyKcOgZTfTBo=;
        b=PcEf519tPEIZAyYkQnIEctzO6C42vYaU3g6MaajkeN0gRLd8yuUXTF2WKFlaJl8LUk
         lXhOyFoziWLmX9P0YqbZ39h0KqKS8GI+u9CAjdlhp8YlS7bZO5hfb1UNQ+J8IyXpxqSd
         go1ooOFSx6N0iP4SWjY3Ebf1IQjbEoqSr1jVWuTqboakBUfKz5M354l79IJic9kiCYpl
         oJhjtThJSmrkANkgyz1U0heo2IX605JOKWFJ3B4yjBQIdQ3iYzwxKYfETt4Omiw46HhJ
         jDaDxLQN5J230arYX559+r4qJ5/4DwsI4ersvWUd1NWfzYMG1s2g5+V8IGZ43dZbSMJf
         ILXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQVRZJ9pQzn+9duDJGNGrHDcBAC1qujDSOesVmPey8nSHAdKeOyazsnhZCGguKDpeXfN+w+rCyZeM4k6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYxVlpWa+k2Gl6OL8f+w52ltF+zcaPZCCVpc2eoQmQABKdsY/V
	7qQXDlEo9ZzuvvTL/ai+MLVb4EzRN7dmqXyVRZ/vSCpUKG3KZI3J74JTdrA/HsVm6hQRf8nKwG8
	bu2iijw==
X-Gm-Gg: AYBFou3WrW8zmQZJzxTkaJ/0FLRUH5Cf5ORPKaSvQBr9RYYu0ybXdAbBKAZM7rDBBUl
	goeNvg1JYC8fgC9e4092lwTjHsJ96u6+6qdz3ChhNXa37N0sXyEd8tfdrBgwSkZww1wvxDZAEay
	kOU1hik59trggxQPviYvTVovhL9uGvgDzSkXOXX6hj0mjP0ZIRPdKHWd11fjzf8F4DdRw/O2lF2
	wm8uE4lFbNdSeOF9B+i8AAgzdUkCnpvJU78vLLZyPn33wozaATJ9C6lpoulF1dl8/Vr52LatQAQ
	+EPXBK8OoHdSHPmH5PD7gVbqvFTc3EJJ0gHZX/Hw721qG7on84BI1ouEN6v0vJ8+WGBg4pNXwBY
	/zo32AGkVw6uolWgv21M1HtfX9eTs2P8Xp6K/xCJ6Hpv/Kd51yj4p+h45qZXWtpnFSJa37R6SgB
	6G3AFXHlKnFBsox8ZkQKBGbEnASk5Lx7KSgCPr5YjaKppyQNCY28ULX2th55I6jbQ1OfrI2dDnH
	cwyqNgSIGxSrHEKZInxXb3bEtcVtSLfe8M=
X-Received: by 2002:a17:90b:3812:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3a8a0dee8efmr4246078a91.37.1791442061905;
        Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aafbb29c12sm868044a91.2.2026.10.07.23.47.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-141395927feso4178046c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlvptyALSE1cP/s5E6d+fpTEmif7+YI/bOYueu8WSuBEhETb/JnqXqJqLErrxsg+5Zk08PNpH7mhqqHuQ=@vger.kernel.org
X-Received: by 2002:a05:701b:241a:b0:141:52e3:8607 with SMTP id
 a92af1059eb24-162044c0816mr5535095c88.11.1791442058711; Wed, 07 Oct 2026
 23:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain> <20260928203105.GJ4406@killaraus.ideasonboard.com>
 <artM1Kqi41JfNSGg@stanley.mountain>
In-Reply-To: <artM1Kqi41JfNSGg@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 8 Oct 2026 08:47:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCu_RCHXU+0PuELbGci7EKoxGQgwTGVyw7W_KVjv+Pr0sA@mail.gmail.com>
X-Gm-Features: AclHuK-6lBsfZibyY1EbZnPcvBxs95w1QCFOQo0ockAUH-Ktg6072cpe96FFZXQ
Message-ID: <CANiDSCu_RCHXU+0PuELbGci7EKoxGQgwTGVyw7W_KVjv+Pr0sA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all



On Tue, 29 Sept 2026 at 07:30, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 28, 2026 at 11:31:05PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 18, 2026 at 03:20:25PM +0300, Dan Carpenter wrote:
> > > The "idx" value is a user controlled u32 so we have to bounds check it
> > > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > >
> > > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> >
> > What's the status of this patch ? The issue is a false positive, do you
> > still think there's value in this redundant test ?
> >
>
> No, it's a false positive.
>
> With how Smatch works, I don't have an easy way to silence it in Smatch,
> but I'm going to publish my AI skills file for reviewing static checker
> warnings.  Also I've started writing a new tool to help filter false
> positives.

Even if it is a false positive, I think it is a good addition, it
makes the code more robust.

Do you mind if I make a respin of it with my comments (keeping you as author)?
(Or if you want to send a v2 that would be awesome as well :) )

Thanks!

>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
