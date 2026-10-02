Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429E339390
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954623; cv=none; b=iEFWQI0uesV6Ri0WCa6lIwy4DMKG9RBGrDkZINgMg2sYYaQblbWiLXFFLU+ZeGKkLVIXSqGEckXO9kAvXimMDuvpEyJzcOLZSQBj77kxeHc5mXOnyIIwAb31aPO5xgQjn+WhQjfTGMXG/hslNetPjGDRdjnSKfqHjeOC9t33SIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954623; c=relaxed/simple;
	bh=XtkYZYhVKl065Dt/k2DRdL7kw9MBNl5/6dckn+afPxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RutFiGdbvYTDYzxkvi54RcfrDStoCTdBcZCbR9AWyyoZmGQpMdGnmjlO1xTfufPN9EKzTJ5c/8MBIB6A0ElX/+qrvZZVvbvmi5YDKqq5cnBWN6FDJWNmtgxGMlH2viXrMh5iEO5BR+jgov69Qt/C2Z4DN+REcnr7PWuy5RibAa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a691xB4d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kJ/zmQXL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a691xB4d";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kJ/zmQXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790954621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
	b=a691xB4ddkHHoeeItF1tespNc5rc3EoKp+JvgoQDlJluXtrr1kAX/6VLYRfbS6s8DemVGX
	9mJxdZl3EAGdT47psa0Fj4YkvfeqJzNCRuphegRPAx5PzaXFcuZdGDNJRmbDBQ0w9aLAj/
	FdoJwSaI1c9X7EdUNdUDaFnv8rb48ag=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-SzoNBcCBMEKg6rov7-6iIA-1; Fri, 02 Oct 2026 11:23:39 -0400
X-MC-Unique: SzoNBcCBMEKg6rov7-6iIA-1
X-Mimecast-MFC-AGG-ID: SzoNBcCBMEKg6rov7-6iIA_1790954619
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso478480485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790954619; x=1791559419; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
        b=kJ/zmQXL2LArzSSr7wKs8rtTIXCDxzzDfSUy59mvdqBFJheFUL0jZuT22ZriJk58NJ
         rf8eIKLzp1mDeqxx4UtbxCShT9B9/ktJYWPmzFR8f+DLoqNOWBDJB0VnuP9ZMUd1T90z
         1r7q0t7qv9aXcAZYDxymqDF1ExpsP4gOb1ko8cwXvzBM/ms+CaHDbnCXQQIvH1nB+fHv
         Rz8BXOzi6oIbiSL+Gx7ZPPVmyrrNzXZbpuwbpUvEPS+QQlEZovyU5KBYpx5xSInQk6w9
         SbUiFqnArWOpZdclWlEo9guJPVdq/z9rE/D95DvEmL9syXQWvOc0p9Q4LQyPMCJld7+G
         5WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954619; x=1791559419;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
        b=tUyH02oTeD0ICNTLV/8Xmv2v2IH33fQ73tfmiGN2daS96gbvhut/m3p74LdqPfv599
         8RADom0oYVEFC7LIN6AmzxZTcCp0Ya+mkuFItN26YpOrrmIGmYTiI6jRKfu2QC0D7571
         Xy9iqBatl4n6Zbl8+Bp49iU58vcm5sKQe4YUrRWEc5ElDs6jrKBP1EXU0FqsJCUXFUV0
         +RHQWxtum0i+1AqxPbq1Dv2+CY2bhAGlI1NmnrsL8lgwmdNs8wBwOJk2xEBZ7W4AAsuD
         A/mEhcPRkjXHb/amB8pSlUbln+O6k47QSPR0rpnEMxuXrQtuPJrKfI4GkD7RaURnqnCq
         wPGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIoqdneJjMcbwjfEopuYxi5H1hKimw4DoxU9dpISuWQBM8j3CsIsQOnUldJReqVqprMabBVdqTLkSsDes=@vger.kernel.org
X-Gm-Message-State: AFuF++nIxM2v120zzJ1SdyZMYX/m97cmqoUXHC7AjB8U0bJY4UuytWqe
	kfiNKzkOSVaz++D6jwDhGKYjz34HDl0uei8GpCgmEyeCYrO7hyjPgZaPDwuwyzvmqmsyjgCgI5/
	RjTnDekl8+BWMXMyf83wK5E6Ye2/k/5Th2t8YOJM29Hvyx7SxEyXVnUmPIe1kbHIIkQ==
X-Gm-Gg: AYBFou3/qlGwYY5kGqQPyYhZ4IJrR9kDtNmc4LYs8i/be7qZCzGMSz0p6lJo9tx2YDc
	B9fMY9Bxwl4f0MrsCp6C1nsINSR9NJZeiAW6zMaLJ342L+AJQE42rsg/jgf7BZs12ZByJkhLrGA
	sbPGAHe9o0izK4Ai8RcmaEFe0k+nkI3OjQ1D+ZmBE6TUtkOmv50BTSy/HJhtNfM/xrShOdLRgF0
	6eEjelss57B9Y1cYbqB51W6vPGaxdRJRhIsl9/caG7tr5I5Lje0BuMsDVtX/DflUykW/XKjT/nr
	MudNOO+uo86mckEhgmKD0flLCY/3jTZE8hLLoYuRtebyqt5UOXUx1coiicUhGL6AheMcSko5MNq
	mg9pddFsPi2aO1tdcXNYt4y9jsLP9HggBKbg=
X-Received: by 2002:a05:620a:480a:b0:93a:d67:9ab0 with SMTP id af79cd13be357-93ce7a85665mr565820785a.4.1790954619237;
        Fri, 02 Oct 2026 08:23:39 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:d67:9ab0 with SMTP id af79cd13be357-93ce7a85665mr565813085a.4.1790954618588;
        Fri, 02 Oct 2026 08:23:38 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ec917sm242866585a.46.2026.10.02.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:23:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:23:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <ar_MdxhafYCvqci_@redhat.com>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
 <20261002-manpower-croon-26d578f57143@wendy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-manpower-croon-26d578f57143@wendy>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Conor,

On Fri, Oct 02, 2026 at 08:09:08AM +0100, Conor Dooley wrote:
> On Fri, Oct 02, 2026 at 02:07:01PM +0800, Junhui Liu wrote:
> > The external CAN and watchdog clock inputs are not routed on the MLKPAI
> > FS01, the only board currently supported. Drop the two fixed-clock
> > placeholders from the common dtsi, as fixed clocks require a valid
> > clock-frequency property.
> > 
> > Both clock muxes select their internal parent clocks after reset, so
> > the CRU operates correctly without the external inputs. Keep only the
> > required oscillator input to the CRU.
> > 
> > A board using these external clocks should define them in its own
> > board-level dts and override the clocks and clock-names properties of
> > the CRU node.
> > 
> > Reported-by: Yixun Lan <dlan@kernel.org>
> > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
> 
> Uh, why is this in linux next?
> 
> Brian, please don't apply dts patches to the clock (or any other) driver
> tree in the future.

OK, sorry. I just checked clk-next and this is the only dts that I
applied. I'll rebase clk-next and drop this so that the tree only
contains the drivers.

Brian

> 
> Patch itself makes total sense,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> and because it's easier
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> > ---
> >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > index 574c6608aef0..fe85d01563ad 100644
> > --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > @@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
> >  	};
> >  
> >  	clocks {
> > -		can_ext: clock-ext-can {
> > -			compatible = "fixed-clock";
> > -			clock-output-names = "can_ext";
> > -			#clock-cells = <0>;
> > -		};
> > -
> >  		osc: clock-osc {
> >  			compatible = "fixed-clock";
> >  			clock-output-names = "osc";
> >  			#clock-cells = <0>;
> >  		};
> > -
> > -		wdt_ext: clock-ext-wdt {
> > -			compatible = "fixed-clock";
> > -			clock-output-names = "wdt_ext";
> > -			#clock-cells = <0>;
> > -		};
> >  	};
> >  
> >  	soc {
> > @@ -128,8 +116,8 @@ uart1: serial@f8401000 {
> >  		cru: clock-controller@f8801000 {
> >  			compatible = "anlogic,dr1v90-cru";
> >  			reg = <0x0 0xf8801000 0 0x400>;
> > -			clocks = <&osc>, <&can_ext>, <&wdt_ext>;
> > -			clock-names = "osc", "can_ext", "wdt_ext";
> > +			clocks = <&osc>;
> > +			clock-names = "osc";
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  		};
> > 
> > -- 
> > 2.55.0
> > 


