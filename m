Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C8B372EDB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814970; cv=none; b=o6xi+BLLydNoBAQ5wrWEhE/Aaorb1o2porTOSJHbhviZw/2wNQAxXvf3bHug0fpoMl68EChYluCIphr/qexmR94vg8aEotKD4hvZh4GipPqMAtpynPhGNbpazDXU+eY0rHyIisoLQHNKemJumvp57ZJ4xTsvsAllmDxNaO5bZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814970; c=relaxed/simple;
	bh=mEiOxK6qgL2knbgWwksX7Taq8hLellRiYQOPrC1ldZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N77VOvsRi97OxK6ryOHrYMEYQo/cupukiQBfDEgo30X0hgenvr5qXznUEQIfF9GuH+2lFTROJB9v8a9domE2KuVJm+yLSTIofw3YtHaORYiep1RrV6Rtw9gOD2R4+riEDstEFSlrrPU4DK4uMTDp8YQh82k+/AZNCuQJLHYbN24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdO6XnWQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Df0W+jSx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdO6XnWQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Df0W+jSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790814966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
	b=CdO6XnWQtublw8+NsoRQljqcdY6oVACGKb7CQEUdxd0f2yM5aOYmuWxteAic9INbqD2cbt
	Lyfwu/20GdXHxP9SUAQU7/5zU+jxOyJqcsTX8tdNSDesili5ffl4J7hl3B+x08U8DUxJ9t
	Va/t9ZuK/wUH4NywO4swlGsvug0YAXk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-ZW4-zvetMjCUG8qBZzrCzQ-1; Wed, 30 Sep 2026 20:36:04 -0400
X-MC-Unique: ZW4-zvetMjCUG8qBZzrCzQ-1
X-Mimecast-MFC-AGG-ID: ZW4-zvetMjCUG8qBZzrCzQ_1790814963
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-916cc44720aso65680176d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790814963; x=1791419763; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
        b=Df0W+jSxP/qtfW9CLTJSk+3Tr77clbFB2kSBPkbTFDn2fGeSr2hJzb+XykVdipXble
         JKcI3mJHR83c/JrD7Ps+hkCcNP+kqnbUaNmPYF/8Sc5GLgkZwqJyPfkozt28Rsh75+dP
         ZvxDtYRJ9VYfO3sVTkf5x3FCI1eokLt/JESSaI2aPArfEdXLweihm+ZPGpUuyVL+/iu3
         SbN0/pG+A7BdLwbAtVgNvon+QS+fDnI9QFK3hhHrSSMuNkLyMbCg/mHdYN3J73Oaltfb
         iltpPwlJjT1F8diK8Ae6sFnaJSIOoAWVT2R8vbRhCSY0sMqj8eqXVHHsT2Jki4fo7eBG
         ndLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814963; x=1791419763;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
        b=cSqR2LYyetGTsl503fdLPNY8s1HKsKG64G2qZQsvlD8m6ewxMbYNlTACsC4xxkOE64
         xPKHVkFPu7ppTh85IPMW8f2FjxpZU9YHtBgpH9H27j9U6d7Hhr0L6lXjFSIEiXMlYujc
         Y6+/YQcUY8KEcmBUUamR+0iAUAhO+fZL4Eap8Z1Y9sp85RFChkU8KdaFH40GDLnx8UNF
         j+BhZYM8wP6+a2BAlnC29rxSiO7Ddh4E/vXsR5TS/ZK1uZcEIALdlUDoMmgEsUUw2re8
         js24whUECeJOZLX/9BzLyVswpDsp53xY45TetZepXaDM1FNk1asLxnhvQtulQLfhFmCc
         rfCA==
X-Gm-Message-State: AFq9FYI84xHFetlqRNmy/UqQAEhuaNO8OC4Jin2/XGJJMxOaSJWRd7P6
	GrOV+IYZAQ+zpOKnkOgbj4HaZ3JyDG2YtjNEaEqWaA921KVBmh41rlLCO/MBfKXvoRw1vRZgkbr
	GaaKHxCSRoxLkUxNYsnjBf9sUbJW44dvIlAFoBAhNLukTsvwvByKIS0/YRTcDJ1SL8w==
X-Gm-Gg: AYBFou2GoPATv0mhpJlwpu9tbJG/QQsIh1/ttrkkjfJZwVgBkrJ6CzLwHzqQXxtwZSr
	yeSi14QAEk59aWRRLkjY2OQJveSDuVXweOT/PVYyXzWycH4JB5Q5+4E6MKECspLZx5pgz9CCRE6
	2ChOcqWGF4CzfEZA81qrU6Zam/K9URytKyqZCsbiMF0jrU+/ZFePU5cw6X2hJK21xjy22mJcxhY
	SCcSIrfMcQYra0CNlmAmo7KH4pLKUKTZYWVbjOetLoTYh9p9teoyTGelEUxW+VydyuUgMWz1hgu
	H/bjAP/VGE4PrTnAHsxWaQKcGEuQ/Mobag0+fSqk+a+mhn0Zk3xdKImXG5x/7Wv7ZXF+3TUhMY6
	VaMe9dwUmf1pnADAKGH7x1OQI/zIcYpUqAbI=
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59189326d6.6.1790814963482;
        Wed, 30 Sep 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59188656d6.6.1790814962863;
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a881aba3sm12432406d6.2.2026.09.30.17.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:36:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-ID: <ar2q8M7Sn9DccVBI@redhat.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4>
 <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

+ Sudeep

Hi Dario,

On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> On Tue, Sep 29, 2026 at 6:48 PM Brian Masney <bmasney@redhat.com> wrote:
> >
> >
> > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > Support spread spectrum clocking for i.MX8M PLLs
> > >
> > > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > > boards using i.MX8MN and i.MX8MP.
> > >
> > > While at it, it validates the spread spectrum configuration in the clk
> > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > extension, which converted the spread to the wrong unit.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/4] clk: validate spread spectrum configuration
> >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> 
> Thanks for picking up patch 2/4.
> 
> I put the two fixes at the head of the series expecting them to go in together.
> Am I missing something for 1/4?
> 
> And how should 3/4 and 4/4 be handled?

I can pick up the other SCMI patches, however I am waiting for a
Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
and 3. It looks like Sudeep wasn't CCed on the original series so I added
him.

Abel is the maintainer for imx in patch 4. I can take this as well,
however I'd need an Acked by from Abel.

Brian

