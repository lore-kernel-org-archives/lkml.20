Received: from mta1.migadu.com (out-238.mta1.migadu.com [95.215.58.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDD4A8FF1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363109; cv=none; b=Z2AyMr97dxqhY++BGFSY0JApFT7VQRPZiQilpzjhEay58ktFy3sVZH8o0iNf6TuuGG98PIxt1fAtZp47/afz11uqaUTMoW57Nizk9K6sGybPY+c/GyFVXQ3qAGqmun3QOU/XBzkh1nWr1PzwAx3sgDhi9EjdR40ITYrjN3Pid6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363109; c=relaxed/simple;
	bh=CjPSCnsUpLK56lUaqG6IE2GGQkTEEaEXfOtMPY3v6+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYsywNB7okkAMPbLB8Kom2uP7PiqaR9PZVHuDzHhBTlJ/6mxSNSG+WjG8xO8e2HmchlxPNdmHoQqK8iSw64dTyZeSe6JMhisfE3AR8a5Xa/lXSdZ0Iy4vJhmnY2VHqaFy0ejf6sMZSi2K2B0Hbn+kW/iefeShKkDWtdaB8zEwQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QIE00KxH; arc=none smtp.client-ip=95.215.58.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QIE00KxH"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CjPSCnsUpLK56lUaqG6IE2GGQkTEEaEXfOtMPY3v6+I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788363104; v=1; x=1788967904;
 b=QIE00KxH2c4QY/lpkQ2IC58iiEiFDIsuzEvGHQCebqbaxb2RhdTf23Zm3tEKDZXaMhaylS7z
 BClYadv7IyqxvNZcBPG98j2CMmzWp2F7BTH4tsi53eAn5QveYATUk2U98om83j1KH/o8uiD18do
 Yg3ytF9nG1VGgACbJxbUPlh4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2ea74c8b1f02b032;
	Wed, 02 Sep 2026 15:31:44 +0000
X-Mizu-Trace-ID: 2ea74c8b1f02b032
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17358so2715e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:31:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwr1fTPmSnxLrvL+RTGqYdWHBEVppZGmOOJy0KkTU4zoy2Fx6oS5MOO1CEbIVHsEbVuzKaNL4YSzwC34vo=@vger.kernel.org
X-Gm-Message-State: AFuF++lkqLgNY1uV9EwWw9Q1BomcxUPFOEwbIStDalxQEWhP0EGaEJSK
	2GcD6mOXKHUUFDtaSQRtmVROQrBuFouzrQcRj8btKtRe533CXlxEiengdYYBgJRQ9DP11tBKEsT
	pEN9jMBJRyLMVWfQuKmkuHqZ9Df5Xzwyk71fTuT+1
X-Received: by 2002:a05:6512:3e15:b0:5b6:4ae:3fef with SMTP id
 2adb3069b0e04-5b60d6a45ddmr57115e87.14.1788363098958; Wed, 02 Sep 2026
 08:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site> <452D9DEB-606C-4B54-B8B6-27E03573A9DE@mainlining.org>
In-Reply-To: <452D9DEB-606C-4B54-B8B6-27E03573A9DE@mainlining.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 2 Sep 2026 16:31:02 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxrJB_3ks_rqGAFyihyFwKJEEJYk2ZTMLLXgoMWM+GO_w@mail.gmail.com>
X-Gm-Features: AcwNN1Uh6KYsOOsxtA_g_cWeHELqZIqPYdvMlWKW3UeD8dEbrY5PhG97CKJlpGI
Message-ID: <CA+EHjTxrJB_3ks_rqGAFyihyFwKJEEJYk2ZTMLLXgoMWM+GO_w@mail.gmail.com>
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under arm64.nompam
To: Bradley Morgan <brads@mainlining.org>
Cc: xry111@xry111.site, ben.horgan@arm.com, catalin.marinas@arm.com, 
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 16:29, Bradley Morgan <brads@mainlining.org> wrote:
>
> On 2 September 2026 16:26:55 BST, Xi Ruoyao <xry111@xry111.site> wrote:
> >On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
> >> > not, could the caveat go the other way round: arm64.nompam is for
> >> > systems where firmware ignores MPAM, and should only be set on a
> >> > machine that does not boot without it?
> >>
> >> Yes, seems fine.
> >
> >Sorry for the late reply.  This is indeed the original purpose for
> >arm64.nompam, a dirty hack when we have no other ways to make the system
> >boot.  If you think it causes an inconsistent state I'd not complain
> >against adding a loud warning or something.
>
> Sorry to impede in the discussion, would you like me to submit a patch for
> that?

No, thanks. It's written already in the form Ben suggested. Will send it soon.

/fuad

>
> >
> >
>
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
