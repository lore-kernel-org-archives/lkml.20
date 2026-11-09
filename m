Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248128;
	b=UiACQkx0eZINIW3c1TSVabd0HjBJ2nw9Gs/jFfVDRstNa9/kFgboTd+bJHKx63AgBvLe
	 +KjJqHaYIOHwPlj5Bvg2B1IV8QqZFG+L7t/e+fwPWMZBauzeUF2wmHPIV8rhs2WEHDJdW
	 HwWPxu1SdmQMb1O2YtHSxeQ35XT7BKGsAkBNb2gwhNtjBkpCrPT3ywlCA47YPp+8PXfP8
	 43HbqkuM3NZU//u+yQTbknb7DuomfiU47DJd37gFTZJ2FAA2gd7BAeEz71gJfEHHhlxZF
	 D77JvCLhylrnLSoMFBmjHtB6oRHgzknKpb5T9jITmbEE7g8JI+YZ8HuLBnF0JIxYE7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=A/qVClOCqu/XJfl5OHSDd/IqxT1Vn4LDahzKvulflyQ=;
	b=H/0jMviPBlAjm4/k0eLsGHVtef1fvRTl70ljAxGxf3nbj5hpwKPvAHFOKrpUPP6bSenQ
	 TJ6zo7KzwMvdfRSIMGEwja4Va8POvclegK580qc5kSgKhRZofc9nS1Mjs8SGrKy+wGwEo
	 97Dd6s7KSkwKwF0Ar0ccFoeW8mo3ky5c9Ng2p7/v57YC+v9ZSCLPho+Fh5LUAXD0vrEOj
	 /J/gEA+OA5EHqJRvnc2GNn7/gHHJJTz6EiTukKA0fOxtaivPO0w7i+z6fExEY2sPDOqZ0
	 rW8FSmB91M5MLjVjQ9tosBfA10DdkCrS+UgqXYmuqOVFCP/X9pS/eJBv7Pw7QUNntAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0HnyTglw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F7606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6F7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0HnyTglw
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso8790251fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794248126; cv=none;
        d=google.com; s=arc-20260327;
        b=CxXdzSeM5Y7LbW1tbri4elp1FnG4VTicYPY1naV2+164P64xxIskA2zV1x0JHOnTU6
         mc5Dfp8oasnNLo7Eb+4LfTE5auFN2msW+gtL/uona0eGKPi1pAJAJwqfa/lo/t/QGcy8
         MyAz9MCV8HrNSoDgku9Ibsl98IOLdPJYS80Im3ZfE2J8VL101oWzeK0lNM46jM3aSTub
         a7rGTwxQXldvlIf8n2sRlz7Ac81g370Gmvf31ZLiBI+dpDj0/7n+R9NNUhIZLTJxeV6X
         QC612ceFbXlkrgSDK30Lb2jYaxfUa9qLLvunKHKUcoCXu9METJn8kPDrmM3AXK4TBwUO
         K8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A/qVClOCqu/XJfl5OHSDd/IqxT1Vn4LDahzKvulflyQ=;
        fh=AmXh9HrZmujUHxJynCzuZdCVQ6/xTOPHsNCGb3PcqBk=;
        b=afTaVqAgWlqFZiqyQOPq8e02y9l4xer4tfNemxjDzIjU0wtVBI/GW8vaubMD4z82Us
         D6gv3eRcFOJzR1UNCysmv+GUNPFL6kXFrAL4oiFjX/urS8zTdhiHpUr2BKPjb3KAFuqu
         OI+ic2U4LMMS7AaXy8uYCcYy/mBmXBKdpegpAcMkmHNfoOjB7C/yUreMW38FlhVD7SBd
         +/UAFuFad0VPvE/gawKN5+HbC2oKKu8INp67Na870+tmwtlP+9QDZaGMa3VqVul7kMoW
         rqtMEIva6hvPoUiMVYCZ56Bp1S6u6DiuTmKZ0iK/FeAqOU8+Sg6VLaXZTAD3FwiwcN2h
         wTBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248126; x=1794852926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/qVClOCqu/XJfl5OHSDd/IqxT1Vn4LDahzKvulflyQ=;
        b=0HnyTglwTAL8gX+olVe8YavKHfLdVCs/Be3jlhbF7fiJ+BKhmXakYEsD8bV87zN8LX
         5baMSU6AgQuNEbABjA/yInkUpowZckQGLi5G7NdLcn+Db94+JHJKoSUatxJTey1sUiIT
         6Cc+a4BNwjPonJI5zoFYFSoxlc1OZu8/khdxk5l+nlPao2z4j3MXOPeLg7Qz3g9rmbxG
         lT/Pzdl4hmjyBx0aKYC0DXlFboMzZFYWltciUjh9KNDjKugvCvNkvYTc/qgCopKva50A
         j5/Z+wgveMoD9+aZ1FlmXreaQ+MGFHABZoYLDgqSbjYDrI9xXqGCmseyvdRwjNtX4ois
         LlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248126; x=1794852926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A/qVClOCqu/XJfl5OHSDd/IqxT1Vn4LDahzKvulflyQ=;
        b=voTU2JldRSLhh6IBchnbGxNbb7DtVdMUEgweojBqpRibcztFxusiFUaX0iTX8sJ1lt
         Zb115f3qi4YHelpYlafnRyZX7Pr2cZIvcoiGA5pEFQdHSkmWvp9CevagUcz66WmzJioM
         EH0ifnpDnCgwHQzQc8l2ZNpv1Ft6FJ9n4QodRvDJDkYASt4Ht1tAwldJ5mh5m6QXk659
         n6KG3U6MLwmYMtqQKO0VB0Wi1FRxNJ6YEUdI+Y4Q7nwpWaVsS0gXMdAVkBx2LymqcnKl
         Lj9+orjnLoOGEJ9tcNYq1sEEWhyWYfPQQzwf+sFk8o2sYFIdULvkh8WjkVvwGmnegXsu
         3nZA==
X-Forwarded-Encrypted: i=1; AL+hErGp/WNU9Q44qJ7FNOaTtYZS0Ok/wst4i4gNBD2pcH7EjfJrn+Zy4ykARHMlQHBhrkWy5Vjv7TIzKnPW8kI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L4spucVFLkrCa3vAgCXqd05mH+rAkfmgFMaCaah+V+v4aJGPD
	hukqgWHvRTCArOT4pRh/G5gXywHKWkTGgNTbY8l9y2Upu9rPcft6HdqqJ1IJitd/d2rFv1jVqip
	a67w1G1gmE1HCNfFIwoLc9gBACpAuuAQ=
X-Gm-Gg: AYBFou2xRJCgDuuYO4M8SspBQQt04f8U+cfJG4Zhb1nNrOJVmknocBpdWWUlp/NsYM6
	byRxbzaOCsXTDDsVscDcP/hoSsEWYZSkogkwPOj6xWvg9+k1+Covd9kG20a0pADt4nsjJxnpvuQ
	661IjlB0yTfkJiMj/vJJJITxsOAiGMwFyQFFPQsqxjg+Lao16Ob8qtvfEb6nrV+hD+uGVEe8jpv
	101rl1Qo7UVunUpHwPogBpfpfA505yCHhzKxBYUNq9WOfWj8Rilyd9oWC4NE0kcFCvuXzS/0q1f
	r3fZ+oESYgDvy1S89QF9NxAchwXDSv6hLGBanvrAZNOfaucMP7TcPfU0DrnD7QwlaM3zidehFyA
	V0hS0LJLYSPET5qejlhKUFa5Stwq5wSSa1R5q3I9Y+/g4NQCBDOwDZ5/zJjA=
X-Received: by 2002:a05:651c:1991:b0:3a9:a1ed:6341 with SMTP id
 38308e7fff4ca-3ae096266a2mr129721fa.11.1794248125851; Mon, 09 Nov 2026
 10:15:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106191029.469837-2-oss.patchbox@gmail.com> <4cb58287-4273-4518-8cac-aa3056dc28e2@linux.ibm.com>
In-Reply-To: <4cb58287-4273-4518-8cac-aa3056dc28e2@linux.ibm.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 9 Nov 2026 13:15:12 -0500
X-Gm-Features: AclHuK-kA47IWOIX7U2zRiO72EVz0LSCPAeXxYhlYbmsVsJrtKZ_L0q_mB3RhFw
Message-ID: <CAGG=RgDu7-3g1yTGRYukfhpXnPgqE5BDQ_cAzMN=78QiUrOykg@mail.gmail.com>
Subject: Re: [PATCH v2] vfio/ccw: Flush notoper_work before returning from reset
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, 
	Peter Oberparleiter <oberpar@linux.ibm.com>, Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 07:38, Christian Borntraeger
<borntraeger@linux.ibm.com> wrote:
>
> Does the the iommufd backend have the same problem?
> iopt_unmap_iova_range() keeps calling the unmap callback and gives up with
> WARN_ON(tries > 100) and -EDEADLOCK. So that path is also fixed, I guess.

Yes. With iommufd, vfio_ccw_dma_unmap() is reached through
vfio_emulated_unmap(), so the pages are left pinned in the same way.
iopt_unmap_iova_range() then retries, and if notoper_work has not run
by then, it warns and fails the unmap with -EDEADLOCK instead of
hitting the BUG_ON. With the flush, the pages are unpinned before the
callback returns on both backends.

> > Fixes: 0c11f61a876e ("s390/vfio_ccw: Move cp cleanup out of not operational")
> cc stable ?

I'm not sure, so I'll leave that to you.
