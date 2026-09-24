Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C5F29A9C3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211862; cv=pass; b=uUnFqRIkDdjjd1XtmUgVhPH1zWYxlekqblieaxXpte/LsjIS6d3z13QKd/iABrQgjWxSwOWEZmzJ4riXCu396r/WHBm5ZxblarAIjVwHQ1Z04un7McWqJRXwO4WqRG6TV2JrzptACzfR9bjLba3AJxzwIlkEXGdSdBpIIr7gymM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211862; c=relaxed/simple;
	bh=e7NYzYowAH42T4CIyLla37LCOTvpZlsNv4w1YShEB0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3y/ktLVrc/w9n0jKxI+LpCTSU3PFgl01wBfZixodaJ+e91GhlRsOeUTNvTy2y/2ADSxXXvPSUdbvp7JWOwHZbOt+hSGddwk5R87nKM6WwIozVXWip1zkQ4O8Lt2lnrBA1Va+eB1AMJeFXmBdzYZm+zB6jFxSP7N8pVKtN0l9c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajy0EMXt; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajy0EMXt"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1074189f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790211859; cv=none;
        d=google.com; s=arc-20260327;
        b=XiryYbZiliwJeLeLgbkLzeVBblG6D/c8rrDh7iNHnfb8CUI4LHYxm2YxcoKipxXWVp
         ITl8eR9JdYt7fG9invLiV6+d8YgDB9w0pfZYtlEC5JHUVRCCkTmBHbx9y/R99KCircSm
         x+DYzU3vYbEdPGjfywzyoA/17Rzaz/0oPwtUJsmWo+BbWGopUfQV0zPA9gPpUQH5+eop
         ub77/JLuPmVG3m9Jo7ODmIYG2aT4aDr8aMRbwU6pAqwdA2iClFC8CfWzvm94tyFNLjGh
         7cz85Vcj0J1tmdQR+2XyUah6EfSMOR4usreexcTWyXUmSwT0K2ZxQrFJAsIp3zFC5MPX
         lhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7NYzYowAH42T4CIyLla37LCOTvpZlsNv4w1YShEB0s=;
        fh=+Q5Cjxu+z6ke8dbIgtLSwpt+Rj/9sHl8YfagEwhQTLs=;
        b=ZaFUpNdbJjzDaLd3HXQX9lmqnoSTbQ02IXmNGrOkUrNnr7lU8kaEOyFCQ2aEPunVMd
         U80UEnuoRE7sBw+krVCvr2NdaIAlkr894aYXZyB2DLrPlSYqnZfRhUEhMYAcY3zEh4mE
         s8aWPbsa0yoctn8PTua1P367irOfUVfz+vZv9nQW0se3a+Cx6eTVrVB7i+h6nqJ14dOG
         5UNG2PPHv5wEAKe5zgfF7aZsu4lx1AFnlI+Kd5fer0U5MIjCX03K2PJAgt2SqS11YnvW
         aOSBVjidPAJbhWU0bJlg1/peUyhSsn/RtbYijj+3pWb9UA5zhaJBLBS2ovuVAf/1ta3F
         6DJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790211859; x=1790816659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7NYzYowAH42T4CIyLla37LCOTvpZlsNv4w1YShEB0s=;
        b=ajy0EMXtWXEEtuEzs0fhJaHHzTOIefavKgLWDDqenNKEF592vNluon8kjHRz53ZWeg
         T+cSyPPQoj5F8jyZFK1Ee7puNyQLV+PVASSq8d7XDnmrf1yfL8JrU4R8j8DGw1DAnpD8
         neChnzF5hLluCtW6ZInxgguX6oVyKkIXtpQ2t2oOXcFNPMbWaSRkL6tTOSjmuZlHN5M0
         +2d6ZhV6JieiXYs9qK04hilhRB0dG8DzkLQFuS02GKwvKicGf1TUpgAqS+HabX41kjzo
         alx5DyBXS0hF9OC2ysqJ5aZlqNUHL4M+wS4BnFrUPVek3ojlVc66fdKIlZyKmSlYwftG
         JOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790211859; x=1790816659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7NYzYowAH42T4CIyLla37LCOTvpZlsNv4w1YShEB0s=;
        b=X8y09gpEhpLFCnT+E4wL3mqdRT0Qaoak72VWWPvkckQCeYNggUYSnblVUShKJd76kY
         nphq4kSPoRdyXaV7VMlkU9nuOL/9CsxJWVELPMgrJ2hBlk65THW/qnHjtbeP44NKE0OA
         0sSZjQxWuLc6aeNbXL1ta1l6w1qVgpAPlOTOVHt+7ZoTDVnBhGs4W2pWbZP9fwIEfrdR
         HW9p7/ezEq0zyON5B5UsWb6ItfHVvBhvwS/rEzwYvU8f/uClXd5o0s1BWGJ3auxujao+
         BIkt+r1ielQ5Bcc2JkEm0ldSOzu3gjOuoHu+x+2EOp9B5SOYHjvmsv/U61RnUbh+mGys
         pCbg==
X-Forwarded-Encrypted: i=1; AKwUvByp4f6TKPOVHAVrPs86bMq8WskaEZW1WkXRSCVBezVIux9SC4M63Ik/RhiPZ2Lx1xxiV9K0HSYdC9P4j2A=@vger.kernel.org
X-Gm-Message-State: AFuF++l0qIy9HoqeKLD7fTLy14CTcd8OmA8k6qTfQbIOCxELPOmXlm3Q
	lu+VYzUWNAihAtcxpZ2TYl7gbFcLoacESjzldeTRcvJl3Z/E4tHzYuMPEDJotxMCR6AYY4Woyqq
	Tbd0kHtK4GQm75ginTOGg8it6otEfaTE=
X-Gm-Gg: AYBFou3uNnoBjFlCrXNOFOcpa5OsH3COB8RIKo9OCKp1QlEfJzDhjinWMfeqD2Kd7G5
	cRgfssd0TJIuG4Dh3bKi9TNfDzWC3Xf4etKSnBBMkQJF6WYaMT5TGMTGCHq++JdeNjVlJx/h7qP
	K+GX1l2chg9WrGeM+wsm1W44xOJyM7BAk9nLWmlQTtU+9CFb2sU3VPhg9QDqnB6zLrBTqoe0ST6
	qgM//gKQVFHvfpJ5I53W4aU6Eboujr0NloMyWzz8/yewUWttjWryqaVVuxsvkHQfaFBnI8Cxxm0
	u1Kjucd8zueathg2Yy2V/r9A7v6DXyQphMG39q+aQldT+6v1SEb8iqHHOvSgTiH8MPUnVCv1LbH
	CASnohXc6Nfg2
X-Received: by 2002:a05:600c:1c0d:b0:49f:ce73:7ac with SMTP id
 5b1f17b1804b1-49fe67106d6mr15096175e9.35.1790211858543; Wed, 23 Sep 2026
 18:04:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923095435.591542-1-kunwu.chan@gmail.com> <7efbc8e2ecbf397fc8e44327d13e9a7021b97212.camel@infradead.org>
 <CAN_Opa-tDcZOEk=Mt5MAqUTkg2as5G79uBkxkUaJif8b5QpXYQ@mail.gmail.com>
 <1cb9c1d40f246ddbe24c9fb930d6dce16aaa25a1.camel@infradead.org>
 <CAN_Opa-xVAzFAJVU3rwCsiBzVpQYqUYWzgpBBP7EaX3K+ASk1g@mail.gmail.com> <19595BD7-98B3-46F0-8B47-DAFF304C5A7A@infradead.org>
In-Reply-To: <19595BD7-98B3-46F0-8B47-DAFF304C5A7A@infradead.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 24 Sep 2026 09:04:07 +0800
X-Gm-Features: AclHuK9lgR6kmKYPwa1ltvDPz79B4tIYoVe6PMK2Mrf54spd1LXi9d__ShA6Me4
Message-ID: <CAN_Opa9r1ZbZjLQ_jHSaFQ=8Q-QPrDNxqOrN=feCNz=3N3kNGw@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: Use atomic SRCU for gfn-to-pfn cache,
 reinstate guest mode for x86 nesting
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	pbonzini@redhat.com, seanjc@google.com, paul@xen.org, paulmck@kernel.org, 
	kunwu.chan@linux.dev, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 12:46=E2=80=AFAM David Woodhouse <dwmw2@infradead.o=
rg> wrote:
>
> On 23 September 2026 18:26:32 CEST, KunWu Chan <kunwu.chan@gmail.com> wro=
te:
> >On Thu, Sep 24, 2026 at 12:07=E2=80=AFAM David Woodhouse <dwmw2@infradea=
d.org> wrote:
> >>
> >> On Wed, 2026-09-23 at 23:58 +0800, KunWu Chan wrote:
> >> >
> >> > You mentioned that the SRCU read side scales a lot better and avoids
> >> > cacheline bouncing. If you happen to have any existing measurements =
of
> >> > the reader side, such as throughput or reader-side latency, I would =
be
> >> > very interested in seeing them. That would be useful for understandi=
ng
> >> > the reader-side benefit you mentioned.
> >> >
> >> > Of course, no need to rerun anything just for this. I was mainly
> >> > wondering whether you already had such data from the existing testin=
g.
> >>
> >> Most of the KVM gfn-to-pfn-cache usage is per-vCPU so doesn't get much
> >> parallelism. The main case is interrupt delivery to Xen guests' event
> >> channels, and I did some benchmarking of parallel interrupt delivery.
> >> I'll see if I still have those results, or tell my friend to go and
> >> repeat some meaningful tests.
> >
> >Thanks David, that would be very helpful.
> >
> >The parallel interrupt delivery case sounds particularly interesting.
> >Please don't go to any trouble if the old results are not available.
> >I really appreciate you checking, and I also appreciate your friend's
> >help with the measurements.
>
> It's no trouble; my friend is remarkably compliant once I've held its met=
hodology to account and probed at its conclusions.
>

Haha, fair enough. Thanks again to both of you for indulging me. :-)
