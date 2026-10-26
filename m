Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027332;
	b=NLzdAqqnILutjRAJTOsR9zM8aWQqgnQ6/i7GrKOxVcdQ6pmqzmR9VDEycWddm/wELSmb
	 WZFS5EpTEX69Ey+5SwwJIjNQCUSEtJhscMAV1PQOo6aPftqux5jew9oAOGwrb6+CAV1L2
	 3+WvxXCuhygimIC1HJk6e2yc9r2JKaFH/byRRElGCiGIhaCx7sb+Zp6NoI1NncT1LNvIq
	 HQwhFuJRK+fLG5UjLhvsq9JiFgsYGfnEIxF8O9p0UX1SAgWVHzmBrpC0rpBwdU8PuRstN
	 K63bDqZShyxDfAIKPv6upjWJqfmDlYRG2N+WmUW6TuSIdGHEHYqzT5eCa9eZNLqrK1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027332;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
	b=CDuA5soS5zgI+C68LuWQgVHglPX4TCcQ0x2n/0d8LOebsgLg6YEzl7S8IRjaXNtoUskY
	 nS2EWGziVkGB9/acsTrYj3kjraJszpkcxx5ZyUTE0VWv52YqRhYlSjpKYeDTwfSTIta8l
	 zJ67IZbDrlRn4OcDGk/grXpS+4US+X3u3jy4SMNkVvk0TP3oLWM9/MPlMTRhlajCrYIhY
	 IspVDdL8GH2dpHE9T5bPT562tb1djfsKvBo8L23bjYc8V43fTgufqcnBNMq/vhFaJ2jcE
	 qdEzrr07cPDJJfjIFrO0xgbUBFEIjr6HSjRL2UgyHS30Nd4oQeBTD1kCeGPIKDrzoNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8pKZPa7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tkO5XjHq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6B4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8pKZPa7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tkO5XjHq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793027331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
	b=X8pKZPa7bXKV0UmYB0YV3AyGzgGe0lf5d2Vsz1jLjBc1DdAfkr5hqcf8R7fMHRydy0T12U
	HgR9bYC9prjSNtLrxyi5z7Xx5zNZIutSFM0FZHmTktgZkPOAQPi4F55XepBl2Vq5yiBBk1
	tZoxDrazyPPlTRkK7wigdKGiwxPvR70=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-71t-EjSoOk6rgl6uyfE0Yw-1; Mon, 26 Oct 2026 11:08:49 -0400
X-MC-Unique: 71t-EjSoOk6rgl6uyfE0Yw-1
X-Mimecast-MFC-AGG-ID: 71t-EjSoOk6rgl6uyfE0Yw_1793027328
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2e8c76334fso277687166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793027328; cv=none;
        d=google.com; s=arc-20260327;
        b=NSABlawk2LxbMvvVrKset3YbcQD2PI45ZhL8UaC12WNtwr+ToTTF4m620JbMbjSvcQ
         KZAUM+cQfbq2/3TrIS8UJYUeWcIBI5vq542cbw++2fT1WJiuYkFEwiqAXAclMQ+7oWtS
         6KkHAKDuS/dfsFEoC6Y3aIvzgT9VgHjkX5fLM0FTHj2oTwfzXxt0Qx+YKzdBuLDIH8Q9
         BvtWXm/MiyGve6P1moHRp21XAOH5Fu4uUmn7Oj6r+bfWi8UVvjcRKY4i7VjNITzl8irX
         /dDw/sdLN/owGJTZwuNb65QE7fgnRslPrpdkTxMhyHPog36wn5Z70prKq3tspoIAYT7V
         +uUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
        fh=x2lyefy1AtTGqjLPdSIKkfYwSNhiYsPBXzZmf2DVbY8=;
        b=SlHw7MvRLTlJwJZMFf2AmFfJE7BmWClwjeE3+h0x3Q1dRhEbm2CHyG0sRMT1Rh0bXq
         Hl0eFBldosOCd1uyyEhtlc4cJ5WgOj7yszAXUbIIrnJHOfZ/HK44nf4yBizHD2B+fwbu
         XcL3OLyirqXeuEtHofjAFoMxxZY6DsDvhGEa5Od43O/6vXCxYTn/MWzBsb1ReO/Oz1e0
         xQPmW0coSXz4SWw85lp/cKdSMQ/12W9sb3dXuzCtgfyQ5Y4xArFNQG1X80H0YBfWCZuc
         HGKDkkfTGX/zOMdgRBS/s9yF5CfWROVLPeFKyOpIrPtqXjX2MW3jj1tvl+4mrqbY5dUU
         FrOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793027328; x=1793632128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
        b=tkO5XjHqaDmMahSaJ+r47B8XNVGH17+63wts+4WQfuobHJy/rpApfEaxCwDGCMCCkH
         1KhWd5sDm2MKVmi6dx9XNldGse8t6qD4DMPZ9VvpNKtGCZYpdhURDcTaqaPOZBc6Rjou
         H4mIBf9uR7Br7MW+Te4OJ2O805qJ141iXAewczsro8He+U2SwW60NxLjC3Ui50flxIC8
         yiN9WFPT3XQHtzIUOIgJ5UBvMl2rqeXacEYnZuqh4NbfPC071ShGY6cz812Tb8LmsHo1
         XmM67qHrSVuS/RTRHgU/Ul6x9S7qhbkaWUrjreJWWUyDHXG1Aie60jO2hlU1MgVB7CgY
         XmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027328; x=1793632128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyJxQ7BMV+jNvS3lIrz62hXnVQ7wCVenbzkRPcvDDiI=;
        b=ttce6aCIPYDZly55zQHSyx9iesW4KwUzVOZk6DrDIR/FRKIiXBX+/X/KB4np7SvX+7
         dOdDLEDYYfJq4k42oZWH7Fi+tQ4bA7PRCEyD21V9YXG7PV6DZlWEjQfBxqpLtqHKdjJb
         e4jQMVCqG8qQqvun+zhm4YOxPp9dEYlak4EuDQE8JxmCIZf2/SDW2OW36zwTzL/PeUkN
         TwSs8DGT4Xx0b9pX4S2WsEz+oWrd9Gzg9yTG/ilOV/kl3hhYemdni0AWJ04ItLpHk9V/
         1LcFzZVNJBzaorDA/t+XEKCQAPjcOuzuZagVtFPnqSY7pY7LBFFP9uFMwT8/ybnK1SMT
         O8bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuE/l1uWa5FzfJLhT6WaLbr3V0jH2rIEwinFRG0rsfuV/vBfRk9Pvg5LCG3auRH0clsqo5u2gIwonEHC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4wdDceboT/cbqODmHojcOZhM8EHBf8dWhYkXxuusMvyTV1zOb
	PhJSr9s+Tj/jHgaPiQmbD5XeWbv+SyFjgmWF4HcEpqCOaDZb+/w6DNSLMMVlwiFhMDF4zNsLGF9
	r3odYCoiS+9I2H9c32VjbYyiMylqbHA2TRqu3FxxhcYmDtb38pkV6aDozRZjhyZIo71I6eIMcWa
	vV+4bc4g8eSIJr7XsKyDwxZMUbBa+HqdDXLH7wFs4x
X-Gm-Gg: AYBFou0m+1XDCOFipplutHfZuqovuT+qMl1vKXw6zZoZ/cF4zyjbqspF7R0JRJe+LIj
	EFy8KCyZsBbxL+tRw1kR1SEjQSV241XZmyhQW+D4Cny6Rrslm0jY0u0Y+Lp1rVe7bnQwqvJsSjY
	9yL/1YviFvrFUZXcfO8Fgb1sISII+be/3ITbBEX2Z20PoKrbFvq6cag+WHbqvnMHMfbl8HUiaUR
	O12TgZMKEUWO7st
X-Received: by 2002:a17:907:86a5:b0:c39:34ba:2f6b with SMTP id a640c23a62f3a-c46bddfd4a0mr837725966b.26.1793027328464;
        Mon, 26 Oct 2026 08:08:48 -0700 (PDT)
X-Received: by 2002:a17:907:86a5:b0:c39:34ba:2f6b with SMTP id
 a640c23a62f3a-c46bddfd4a0mr837722866b.26.1793027327916; Mon, 26 Oct 2026
 08:08:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ar_0GFOb5hZfhHHx@sirena.co.uk> <asOdxWlcjSP0DrB0@sirena.co.uk>
 <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk> <atZqw7pdZjMwahdf@sirena.co.uk>
 <at9drMPrv1IvPovj@sirena.co.uk>
In-Reply-To: <at9drMPrv1IvPovj@sirena.co.uk>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 26 Oct 2026 11:08:35 -0400
X-Gm-Features: AclHuK_6TVR7BMSJB42PtVchv_9brsV_tlMYihX61z569i8dPulhRABKPASeGyg
Message-ID: <CABx5tqKQs2LFNEW7ZTwFqD66Mzv7EM+fSbqWkZ8chaWfXhheOA@mail.gmail.com>
Subject: Re: Missing signoff in the clk tree
To: Mark Brown <broonie@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Oct 26, 2026 at 10:03=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
> On Mon, Oct 19, 2026 at 08:08:51PM +0100, Mark Brown wrote:
> > On Mon, Oct 12, 2026 at 08:01:34PM +0100, Mark Brown wrote:
> > > On Mon, Oct 05, 2026 at 02:53:25PM +0200, Mark Brown wrote:
> > > > On Fri, Oct 02, 2026 at 07:12:40PM +0100, Mark Brown wrote:
> > > > > Commits
> > > > >
> > > > >   d31b7d87d1b28 ("clk: nuvoton: ma35d1: Add missing WDT/WWDT pare=
nt clocks")
> > > > >   488d2cfdf3c99 ("dt-bindings: clock: ma35d1: Add missing WDT/WWD=
T parent clocks")
> > > > >   9546425453234 ("dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX de=
fine")
> > > > >   ea2ee01da5555 ("dt-bindings: clock: ma35d1: Document the missin=
g crystal inputs")
> > > > >   35ba0118dac01 ("clk: nuvoton: ma35d1: Keep the clock count in t=
he driver")
> > > > >   e92291a009f7c ("clk: clk-gpio: do not blame the DT property on =
probe deferral")
> > > > >
> > > > > are missing a Signed-off-by from their committers
> > > >
> > > > This issue is still present today.
> > >
> > > And today.
> >
> > And today.
>
> And today.  I see the commits were actually done by Brian (CCed), who
> also appears to be a new maintainer for the clock tree - I guess the
> contacts for the tree need updating to include him?

I will fix that this evening. Sorry about that.

Jerome and I were added as the new co-maintainers and we are listed in
the MAINTAINERS file. Is there somewhere else that we should be added
for linux-clk?

Brian

