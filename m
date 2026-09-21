Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD03C9EFC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020665; cv=none; b=rb99JIxOtOzyC1GnF2a2F1PualiWIZX+LK4GDEnu7oLK81IwoEhMeUd1exsoLqtb5VFwyjyx0PvJDtwv45jpSAfcmekvflGPjZPXJp/HkZubDnxFqhM1MrECNyYrilPioi8PRod/TCTxgah2SxZko+mM4iYhN/MbEIfIzu/oP+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020665; c=relaxed/simple;
	bh=dNq4bkulw35Cidxo9e2r5O87nv8tva9TJtkuLwU5vsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gz/xX6CiWpkBkcVBgMrMQX2Ck7QP/29GWXYsmRz1YUB9zDbQ1u3+bLV9a6u4jQLuepXQYRaRmDG1jp2kvv+sp97WsTcsyU9dw2EfQ7J+WHy3Tlgl8pWKs3wdNS+A371geYmai4uA4fdYDBo8u3+iqAhZ+DsvAeZ1I8Gha5HVU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tlr6Wi8r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EdOV/a67; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tlr6Wi8r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EdOV/a67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790020660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WAji1n7QV2IWerkWF2a/t4cm99jyoAVuQMXhUEtU/wE=;
	b=Tlr6Wi8rRgPqlk01junDHvva9SCSRPFZZOct30qvKtVyEnwq0DDXVGDowvECjmgGklfCnV
	r/VTUfX3fwodX/po3JNxVSZDum9SOWyaVU6o2Z7rtbJKxf13lCrwQxXF4H5/zcsXaVyrp4
	RDJs9dQDH6IAc6gPseCsZ8wPckzVtlY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-EVz7ZUEtNQm4m8rclA71_w-1; Mon, 21 Sep 2026 15:57:39 -0400
X-MC-Unique: EVz7ZUEtNQm4m8rclA71_w-1
X-Mimecast-MFC-AGG-ID: EVz7ZUEtNQm4m8rclA71_w_1790020659
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso461627485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790020659; x=1790625459; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WAji1n7QV2IWerkWF2a/t4cm99jyoAVuQMXhUEtU/wE=;
        b=EdOV/a67MEnCMthefwtQqV3kimuQqYjGzaORMPDlnhrPcVHY8kOxaq1duvxbYke+GH
         HcOezpho7WQIGFaxmwjJBwl2DXHVtSKjRy1jco9tOzbF9VODfXaV7TYbAEQYdzka78cs
         RgEHuxRawQEhp3aJhEGiHwnU1GTgiGVk5zXQXhcAVYcXmIj1qMuP4+gTs75KMjNcIzQ1
         zmu7zp2KslO7BQU+7jXGsHNlmx3J6TybWmgPl1+kcxiuSayzXoRFlGS6pFTNNai5flA+
         MmNEa+V6XUM6g5OpMuOcivxaHsjhDm+/XLug9NXCJuk7yqOD3fYYIcrqgFSAnv5pCB96
         tTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020659; x=1790625459;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAji1n7QV2IWerkWF2a/t4cm99jyoAVuQMXhUEtU/wE=;
        b=O7gptTbPXiMdeh1QnjN+Hyvkrb2ggd8Sqq1mJHcNDzRTQgV7wY2ElXBGX8aNbGx06d
         f25CVvwoK26t7V9136yEwARTQrVsr2u3Amg9IXwmLQ1SvobKNZeKvOadXhHuHHKNUls5
         rb9iuagdr1nXS2U3cWcljMTt3D1vPZR0U6n2NqGqeChgHEaoDNYDpGB/KYvmFCGaEr2b
         VgHFlLGGVECWcn/KY2p3/0SVoIMxr40bYewZklZZmkqsIn9UU7BhcszW+NhB2Dfhoi09
         7RrE7t38/J4jGEqR89UZSUuubF5zl/H8co6j0BjOjcPORbrBahEmgwGPkftBCE4Tqslt
         az8A==
X-Forwarded-Encrypted: i=1; AKwUvBwaCZ8FeUMuERPtiO73elJtv9r8mzjUHgiWMrn5cTJ2c14WyeNSyrxzr1jf85ZJBHwlaHDlYFcMGSlqKms=@vger.kernel.org
X-Gm-Message-State: AFuF++kNbPlfPulQgovvQBLteuCf1b5SyGQ1C1zZk1iw5RBXYEPc5C56
	vxNXMNWf1ctnp6tNQslWRqYIiG/OwHX4p6tfZBXNDRBNUjiwdeL0xM8nRbmKTpi8zhbi58+Q1Il
	Io8ZyEJT6hM70GBgumxfitKKeZ7lRaWjtLYPoQYkiIc0CC6cpimUdk9Odi+A/fDjVjA==
X-Gm-Gg: AYBFou2wfs2LgBSDrCGE/catKE0h4anxh+CuIJg1sqSt/fP+rQYfTNd4zyGdHVN6yJ5
	CPoS1vT6JZbXJv7vdQTu+BaNuFMJZq2g3A73YBxQ8lQ1opCITpY7S8kUW82qBXTlM1H/hpPnpS8
	BG/Zq0vEc7ISenZ0Bxk/MITLsetkuul1RKCEuMqO2SziBthdTcZY7OXhS1fz4cUq9fmYUr4gCPi
	3rQueTiztVJpc3PJhFu0XBIZMjd0W2qAgX4sJ0FkjD402Sk4ck+GQGmJq+6o2VpRrWoOZ+EqcR9
	pBiAmk8VsOwLDboW3/9WVfvhOrRT5L3S/O5cWcCGcAeoRvmRSHCqi+oxXFdQ6dKkT4VCOewsuA=
	=
X-Received: by 2002:a05:620a:4686:b0:937:7e90:ecc with SMTP id af79cd13be357-93c15d9a15cmr243298785a.25.1790020658541;
        Mon, 21 Sep 2026 12:57:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:937:7e90:ecc with SMTP id af79cd13be357-93c15d9a15cmr243292185a.25.1790020657833;
        Mon, 21 Sep 2026 12:57:37 -0700 (PDT)
Received: from redhat.com ([2600:382:8127:317:3053:da10:47fd:5e79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a86f62sm74973656d6.33.2026.09.21.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:57:37 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:57:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
Message-ID: <arGMLthMgQvyQHuR@redhat.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
 <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
 <arFEwdu6EucK1G9x@redhat.com>
 <c89f566b-9fd7-4824-ad19-bd8b055d2736@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c89f566b-9fd7-4824-ad19-bd8b055d2736@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Dinh,

On Mon, Sep 21, 2026 at 11:59:50AM -0500, Dinh Nguyen wrote:
> On 9/21/26 09:52, Brian Masney wrote:
> > On Mon, Sep 21, 2026 at 11:17:13AM +0800, Ng, Adrian Ho Yin wrote:
> > > subsys_initcall() / subsys_platform_driver() would not fix the failure we
> > > are hitting. Both still run after time_init(), while the DW APB timer is
> > > registered via TIMER_OF_DECLARE from timer_probe().
> > > 
> > > So moving from core_initcall() to subsys_initcall() changes nothing for
> > > this consumer: the timer cannot defer, clk_get() still fails, and the timer
> > > is never brought up. That is why these patches use CLK_OF_DECLARE(): the
> > > provider must be registered from of_clk_init() so clocks exist before
> > > TIMER_OF_DECLARE runs.
> > > 
> > > On the broader point about CLK_OF_DECLARE abuse: I agree it should not be
> > > used merely to beat platform device probe. If the preferred approach is to
> > > keep the clkmgr as a platform driver (subsys_platform_driver()) and give the
> > > DW APB timer nodes a fixed clock-frequency instead of a clocks phandle, I
> > > can respin that way. Please let me know which you prefer.
> > 
> > I wanted confirmation that you wanted to use CLK_OF_DECLARE() for the
> > system timers.
> > 
> > Will you by chance be at Linux Plumbers Conference in two weeks? Bartosz
> > is leading a discussion about the future of CLK_OF_DECLARE() and
> > friends.
> > 
> > https://lpc.events/event/20/contributions/2503/
> > 
> > We want to minimize the use of CLK_OF_DECLARE(), so the preference is
> > to keep this as a platform driver if possible. If you are able to get
> > around using CLK_OF_DECLARE() by initially running the system timers
> > with a fixed frequency then I think that would be preferable.
> 
> I originally pushed back on hard-coding a fixed frequency for these timers
> because if the bootloader changed the frequency of the clocks for these
> timers, we may run in to a problem. But I don't think the bootloader had
> changed the clock frequency in a long time, so it may not really be a
> problem. But it just feels wrong to not take in a frequency from the clock
> driver.
> 
> The other option is perhaps adding the ability to defer probe these timers?

Lets see what comes out the discussion at LPC about CLK_OF_DECLARE() in
2+ weeks. I'll make sure to attend this particular discussion.

Brian

