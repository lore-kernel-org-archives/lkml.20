Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231A472073
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118514; cv=none; b=qN0qwuI3OB1rqP6e6iAyqwBM+oN/BFWNFxfGyKd/BaoZ/I++YsqP/6cWDxzohTblri035GDqcc+Lqn47+PX1YHKpVp5CCgQLxbw9TNJOC3OwsKr0WPls5CgAMYhHghnSfINXrC45Q5/TksU1jjahTP9iE/WLIIpFpGiie+K3bcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118514; c=relaxed/simple;
	bh=nx6brTotxarlxTZrGM+Fj6R79ny/7KUfFRF6bSnhWUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akYd1CBe1D/w1TgxlQ7D/t7pd+G4FA2mvDFdlqgMoyfv0UaCvNWp+XMP6mLu40slOm97k4WmVxXX5BbD1HhcPI4flkVZtaeaBTyxKJruZ/45tPt3yIpR5ZIQmodo68CE2UVjf6yhrHzlzn19O7dtBhPzJ3qO6IxGHRLfMStx3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=uCnD4yBP; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="uCnD4yBP"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso1225821a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789118511; x=1789723311; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjVFnBxEO1MLoXcvfbS05AZY/4o4gvi/RgLwD+0L4C4=;
        b=uCnD4yBPENwlDoFVvZs5DfJMwodtdtejoKR3G+LAtziHYvqPJOSkHtEsZcs0qW72wU
         2lFKUtFuraaNNsXxqn+8Rutp7Ogc8N6knq9S8WMlFSWWWkW0cixfJxMVCswbfR2H8bfg
         jCmgHIW+4PjUWW35I61xEoT1pV81DjNca/r2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118511; x=1789723311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GjVFnBxEO1MLoXcvfbS05AZY/4o4gvi/RgLwD+0L4C4=;
        b=DGPKWySRe76GRXoGcdfk42Ej3FqzpOhirilFfTm4vky2YZV+7mBHqDEJzNyO2mgqHI
         JsK8hxnOQbqivZVWirFjBafsOQe8H4XQK+tjygxnXsm4+Ns14LnMC00eqt/MjairHK1o
         464NxhZmmzYOVzbaJV2l6e2UxE6C0TgapJ+nzzWzrZG9FiDuR0qAoft5wqSshYrbGEA0
         i6UNIXJaoUbGR5PlL1qBgLhy+i/qvinVGv6+ZrLYgrk2Jxj0aBjrwpCFLk8DVBc4lV3p
         3H6MN5Q3GwfzkcHrliuRcbuCqpK2reVoblTtX6rNaGNN0Wx/j8e2mVBik+Z1g7aSuYKt
         jeTA==
X-Gm-Message-State: AFuF++mj8n3JsIK+5z0+z30EgWAa3lmrDwaJPeZFjm+90L/3R8LZmDp5
	njnnqKwa3hwaT9JDONcr3942GFk9vNYvWqQFwez8rfpth6xekNYfg5eAbBCEU873AGU=
X-Gm-Gg: AYBFou0ObfkSD7KyKofrCNplBbKImxtaNqHGmzFU5qfZyJ8bD9Ag0XuM06B+gXUXgvi
	viXzvPo2LW+Mtdsh9HcvfRlDV9bPBKC/E1vCAX9EeRJ4eD4527NJNNbVegmeMYpwKoY7HFL/3us
	7Fg7JgrBCMtEv6QDVIGVD5QmrT2E68Wm+jGxAvgnVsiFI1i0UwXYHtF7nHlL1zTpibRg70IdqM5
	3RPZHpunw2aE/LyDsgFHwtEWzUlZEJmTaERZAy3xJG5TUwhPupnsPEFCob8TkeB/vbQN2CctMqk
	AFgqeJjnpTKohrlaCKnpWjA5DT3jA9Hjli+4S/SUUySpLBPdLJBFBbSMLhyVtAISGc+n8O/QEVJ
	IH1qFroQeiR4iShWDAU0xlAO5efwGDtbK1BjsXmaeUCKJH7pv0I1OBRlkOCmFs6Umo7oU5hjqdo
	K3Z+gfFqiJv4qQB3NBYuaPdbJO1Ud+eAN1Lg4nSgOect0Q+zDSwrbPKPNlO5PGwdZet/yUiflw0
	PI8nTB/NHfQFCpZ
X-Received: by 2002:a05:6402:21cd:b0:6a5:d8f0:dc12 with SMTP id 4fb4d7f45d1cf-6a9b56254e0mr1186463a12.14.1789118510967;
        Fri, 11 Sep 2026 02:21:50 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5912644sm576837a12.11.2026.09.11.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:21:50 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:21:49 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 0/3] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Message-ID: <20260911092149.GD722@carbon.k.g>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <c78630cb-999e-4825-833f-3e184ed98573@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c78630cb-999e-4825-833f-3e184ed98573@kernel.org>

On 26-09-09 08:27:22, Dinh Nguyen wrote:
> Hi Petko,
> 
> On 9/9/26 06:15, Petko Manolov wrote:
> > Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
> > SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
> > carrier and they are cross-monitoring each other.
> > 
> > This is the SoCFPGA devicetree part.
> > 
> > Changes in v3:
> > 
> >    - add Draeger AG in devicetree/bindings/vendor-prefixes.yaml
> >    - separate binding changes from the actual devicetree patch
> >    - remove "earlyprintk" from the boot arguments
> > 
> > Petko Manolov (3):
> >    Add Draeger AG as a vendor
> >    Add Draeger's M48 board to the SoCFPGA family.
> >    Add socfpga devicetree for Draeger's M48 board.
> > 
> >   .../devicetree/bindings/arm/altera.yaml       |   1 +
> >   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >   arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
> >   .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 129 ++++++++++++++++++
> >   4 files changed, 133 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> > 
> 
> Please look up what a commit header and message should look like for these
> patches. For example:
> 
> patch 1/3 should look something like this:
> 
> dt-bindings: vendor-prefixes: add Draeger AG
> 
> Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
> 
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>

That was really dump omission on my part, sorry.  Will be fixed.

> You should look what the formatting of the commit header and message look like
> for the subsystem you're submitting patches to.
> 
> All of your patches are missing the appropriate formatting.

Could you please specify.  I've run all of them through checkpatch.pl.  Maybe
i'm missing something else?


		Petko
