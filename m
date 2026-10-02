Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DC4BB7F0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965825; cv=none; b=Cw8Obydm2V9+DeN/dAVyQeIupErCNVufAwYd6zqD/bHGj90H7Ier8BJxQu9gUcrgIJYfukrxFGWFrZh2c9qEFj0UMDuuAQpASDrCwnBKvFN10s3ACVSaosaXNe0igbO6ipDnOdrgWTm8xlJk2/XFZrFELRY6Xf8rhLFFF1Rjttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965825; c=relaxed/simple;
	bh=a9DGLc0NeseciOnf2q1+7VtYJ5eoK8nd7Li3zgPWEig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8/UAIgCDnHYl3g8vb9x/WghIdbxZz1fQICtt5rQxAzZD7UdYqjPR/BDkHMTX+JJqTWQ6xLeAVSAtYEQ9OFm01XSGiQsaLqyKORA6mQ6fp8I3ZrdJ1MahCbDS2nW7UVu8aRkkb922G6n3cax0BADRM8O7ah4+PTq+GAZh7jkwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLA8PxGt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0iu4kF6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLA8PxGt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0iu4kF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790965820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
	b=WLA8PxGt8D2ZjXp6f1i9b3jxPHDcwG6XkNGwfI5u1+k9/2fg3H9GVU3VdP86Ebb1xIbCKc
	F4IamSUugE3kIL9bq6Y9qRuZU62KKPFR8hK2JGf189zKCGwBW1zEE3+B1ufpVze077VnnA
	KezUIeMkFXj6/F0TdLTkp15MxC6IyvA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-LWIhLlDTOeW_kEEZJ6rj7g-1; Fri, 02 Oct 2026 14:30:18 -0400
X-MC-Unique: LWIhLlDTOeW_kEEZJ6rj7g-1
X-Mimecast-MFC-AGG-ID: LWIhLlDTOeW_kEEZJ6rj7g_1790965818
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1906560485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790965818; x=1791570618; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
        b=I0iu4kF6+U9qDLbkId1AsmuvnGW+qgfcCRJnxJGwC2JzpclJRHSBQAxWdo9PoOke/z
         y2r7F1mgPOWwOzeoAuU6NK/gANOtSX7FYjiKOTUEr68277uYFmUvaQjjgMZg8kqpOnVo
         px9T2CxvQ/iW04F1Q+Y0eYIvLj1R8QnoY6+IDNEbIQlh9GECjo9+iVm6dFqvihaYOi9G
         r0b176VwYQ6J5Sm0pNxfGdL+X+8F6HPj6vvTx2ktuiZoAdw06qpmZytAlJLuuFdR0als
         vdVh8A7MOu8uOCi9+mnG8rKTNJS+4f9LkTsx4jFPlmKbWhJpEv0PW4+54PWBoZKBbT3x
         UdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965818; x=1791570618;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
        b=MHgUmQlRvGFhNKD6huz65HCOVGgNbSYb4yV6asywkH7KFlCbz/84h37dUK9xpV24vE
         ZJVfJIi048sVu/C/qRdncUWAvOkzh8m3DU472l/jdDZbI/qBCkMJ03nlJo6HZyo+B+xM
         6/FFz5eLoDReD1rwbwkpkywfzQQ+a9Q+wVCpQRBptFroRls6fFCsRSGGbzJB43FL/9L1
         kJ3WRo+hU8QM+vwJJoUOXlsINMTrSEcfEEd8dqPvKJjlKcsdi1iz9FBa7jSaa7iiXlmS
         Axs8f8SCuSa8A5lB4FWp+Gz6DelbNjrS3lySNu0CU8e0L6fuRnbEso8C/VOOaT9F2mBl
         hoCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3DBhDEzbqbzNcsSl7Nzq/s8cHoCivesZoOZRCA1URH2v+R6nGpP5Yi9K9d+mpqKwdfeISQQIE0g440aM=@vger.kernel.org
X-Gm-Message-State: AFuF++lwCOemy+4gKsGHq5pW7Z7XWkVvmKZcdZkAJDX0CR/Jg5aVLEGG
	REdlBc77GKCTXa3yNBQSjSaSCrCzLJWJ8cZSqyFhPCjEUGmzIW6jUp4ddlKQf8diMHavvWngIoW
	lJTco+GAzLxn1DAAby/CCGsubkN5cGvQf2grXFWZAzl8xq8qlyyIP5SXYhdqNgFJ4HA==
X-Gm-Gg: AYBFou1ExtZU2xqN0NNa04sAnUaCaQ//gMLyQ5IZf5+wHOK4iG1dR2z5y+7X2jY+FR4
	I6FX7s5bKUvuuaGBiK1Wh1vL4CBlL7Bxn44xTsM4tTDJYj2c9DhXOS6RykO348xHbEVtfRDBK4d
	59W5Ah6RNX6+/aCL86s+3lMua7TmVMzWC5ydRmQutci74E9zRgWW2NY9SdOOXnHF/XxZ5l1viap
	/v3fwvhWG9farmVQwYydNjNpNLY51mECEYCvdanzpyWDeUsjoND0v4rCiajYXBGxcA/CjSjttfN
	AjqwC+ldOts3UrqR6HprjnKoe6VNjW7FdXDvaQLn0zl7GH11XS6D6IFegekLn/CuAVlWsqQVDQ=
	=
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674429185a.22.1790965817895;
        Fri, 02 Oct 2026 11:30:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674421085a.22.1790965817184;
        Fri, 02 Oct 2026 11:30:17 -0700 (PDT)
Received: from redhat.com ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca0395dbsm285252285a.5.2026.10.02.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:30:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:30:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 00/23] Add basic clocks and resets for JHB100 SoC
Message-ID: <ar_4NBLHrq2W7_vc@redhat.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930-grafting-undertake-ff3e01060284@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-grafting-undertake-ff3e01060284@spud>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Conor,

On Wed, Sep 30, 2026 at 11:43:22PM +0100, Conor Dooley wrote:
> FYI clock folks,
> 
> On Wed, Sep 30, 2026 at 05:42:54AM -0700, Changhuang Liang wrote:
> > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > subsystems:
> > 
> > The JHB100 SoC is divided into multiple subsystems, and basically
> > each subsystem includes a CRG(Clock and Reset Generator):
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> >  - voutcrg
> >  - vcecrg
> >  - gpu0crg/gpu1crg
> >  - cpucrg
> >  - usbcrg
> >  - host0crg/host1crg
> >  - pcierpcrg
> >  - husb0crg/husb1crg
> >  - husbcmncrg
> >  - husbd0crg/husbd1crg
> >  - npucrg
> > 
> > In the current series, we will only add the following CRG:
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> > 
> > The remaining CRG will be implemented in future series.
> > 
> > This series depends on the series:
> > https://lore.kernel.org/all/20260806122553.182449-1-changhuang.liang@starfivetech.com/
> > and it has been tested on the StarFive JHB100 EVB-1.
> 
> If this revision of the series is acceptable, I'd (although I'm not a
> listed driver maintainer) like to send you a PR as I've done in the past
> for Starfive stuff so that I can get some of these binding patches that
> contain headers as part of a shared tag to be able to unblock a bunch of
> the soc tree stuff. With conferences next week I understand that, with it
> being -rc5, it's probably this doesn't make v7.4 but I figured it was
> worth getting my intentions out there!

I am going through this series now, and I have a few minor changes to
the clk drivers themselves.

Feel free to send a pull for the bindings and headers though.

Brian

