Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936C645FFC8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553056; cv=none; b=B0VJzZ+xEdBkZlUQd8Fz1Uqjiio6D1qU9tdf7w4L+Dcp2JRgf/uuJREULm01KaTeUquOMf5F00fiG5Qh0FS221VT2EGxUmYLXwpgQcDhD/Lndgv5LnHoOuWzPtcZ5IgBZuSh192ZOnMgQD45BuqzoTcbiTJeM1UKq17pc457Sek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553056; c=relaxed/simple;
	bh=7KLdZ02G1ijpboEIJvD6mnkYKnoL//zp3KLniMsbsdc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SErQJ+h5LtIA/+RCi5ia3JljPxf+l4h16ZvQ5VRcjgL5uUGDD+Bnr0lIehLLr5msttJTJbikQ5c4b6KMQC7wHA+cCfVBvxCi/bfmKavbcwp+eCD7ZczbReC+0XtrTcXihl+GVj5snoo1fe/A04g2CdnZFrhD/Vql2DhYQl4S+pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fRTQBFCj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fRTQBFCj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so25684795e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791553052; x=1792157852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHVmwKJx6vlL0Jxf4PIHrwr/lEzD2xz4xusUIoY2sNk=;
        b=fRTQBFCjU2yQWbjVmHSFR6HBdYqyZgxg8RDmzAMn8GUo84bNhVGDVU2c76lOQD2k9L
         oEa1VtNKMp1b53Zm9ZeOvhCGbMmQRTtx/jV62qLt2L0QbnvIc30CGSeM2l8xZlzQMEjk
         XanG2LO90D1CtN+zSb+sobIA8xxG38j3UWFnHwNAthfDugFTbiP9gZQF0At7h1R99EOo
         Mgj9NevR9/E5K8C8UpGRbgHWhbWiT2tP5vYyw80KB+OPzBGttMEks3cBgyUBdCslNhbP
         u8gkJM8piVNGehFsbmfirUi6P95W7yXxvKJutCoML08uW+Fg3QboFXOtZzY3M9c1dwER
         0c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553052; x=1792157852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHVmwKJx6vlL0Jxf4PIHrwr/lEzD2xz4xusUIoY2sNk=;
        b=Df37jb/tXais6E4zS2iqNgxl8UYbKBireeOOayIfgRtLCkWVmx75VA5bgivKZvY3OX
         BRzrdAHZDJPSAZqO1KuOzkd08RIHh7ZdAWejfd8p27kqYFIkft4Dq5zOLlni+2mE06NU
         zh3TVFSvXRqnuIvTk+k1hUr3ZbsIjMVTSSwRD63Hie/ECzRpaHtDeT174qQXJ+wGParO
         XAX5a2+vttTh8QUvy6/PkkUIqN+usE/gi/l4AOJT12bp/UVmas3Ckuxl6IPilI1a6h3f
         jhZzIrEI9+w8K3lVc4Wdcr+hmfOEa75YqxeI22c5mIb7jkT5TK33J0zdxkpYMvtPql2q
         7G4w==
X-Forwarded-Encrypted: i=1; AKwUvBybQbZvNlK5ZwX97uBn9hBZY5SPnuVeCJUOYbJsnokSAJtfZsitLEOO57C19CoqFJB32OFrf9k45IMQgi4=@vger.kernel.org
X-Gm-Message-State: AFuF++lhee+OLH9ZNh93HnybVQDDTlE+QYjt4ngM8QC4ntgrupsGo9u/
	p39WwLsygOnybNwVvUkAg0XYpo5DemLVSGf0wytDB2Nyeh3BQ1xDRtDacqKcPevnfTg=
X-Gm-Gg: AYBFou0gbfcE4LyhlAkU0w20drAZ3s5Ygw8+6hz+ZrRy04rz2r6k9L8Bu3hDppYpp9U
	A/KeuChjaK7eSJqDtXj4J0Uhdt83/xJHTMXBnoeptB691gpMJSbwcLeiMY/gWAXL3KFT8uM5OOR
	uUNecyWjzz+2ZYmoJUivXW0yS7SJpjTiZVScMvDvV7a5XSHpyG4mVUVH0hHeTTAx3W29mDZn9At
	Wi2Ztpj5UCu5cw09hHU4CuQN146xFy9BEf/gKOXBkOhMzRZpLHESv5uGV9npLdmzsNSWFRHFeg7
	9DcbLXaMyA5OYpRh2Qmc7myDGK4yQYA4ZlEBZ8Ll3y0+N9AuDzCowWn6WWjODsw+9/zE/aJujyB
	S4cpCC0PQq1Lf25sbXgjqpiiDQ/roPYoWFx2O2zBFbFCagWKH/gP1ALtBMHQfFKdl12It3ZPvGY
	ZB4Cxy9do/2gFb5fYx6v/PL6SJ3HBAFvAM3wDoQqrUEjnaQHVQFN2gsuzFFMrlrYAM60dFsg==
X-Received: by 2002:a05:600c:4688:b0:4a1:7d3d:10a4 with SMTP id 5b1f17b1804b1-4a18e49c3dbmr38135205e9.17.1791553052527;
        Fri, 09 Oct 2026 06:37:32 -0700 (PDT)
Received: from localhost ([195.94.150.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dba033a0fsm3244147f8f.14.2026.10.09.06.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:37:30 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 9 Oct 2026 15:41:16 +0200
To: Alex Elder <elder@riscstar.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, bhelgaas@google.com,
	lizhi.hou@amd.com, herve.codina@bootlin.com, daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
	mani@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] PCI: of: update endpoint ranges dynamically
Message-ID: <asju_HpgXpIyAFdf@apocalypse>
References: <20260924222444.1351466-1-elder@riscstar.com>
 <ase6toUhGn0XD0v9@apocalypse>
 <223c5189-bfda-4c63-b09f-4ebd01bd144a@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <223c5189-bfda-4c63-b09f-4ebd01bd144a@riscstar.com>

Hi Alex,

On 10:55 Thu 08 Oct     , Alex Elder wrote:
> On 10/8/26 10:45 AM, Andrea della Porta wrote:
> > After a quick test, it seems that it's not working out of the
> > box on my RPi5. Let me investigate a bit to see what's wrong.

I stand corrected: it works perfectly. So:

Tested-by: Andrea della Porta <andrea.porta@suse.com>


I think it should even be possible to tweak the static RPi5
DT in order to make it work dynamically with your patch. Can
you please provide the relevant PCI DT nodes (from PCI controller
to pci-ep-bus endpoint) from the output of:

dtc -I fs -O dts /sys/firmware/devicetree/base/

taken on your reference board?

Many thanks for your work,
Andrea

> 
> THANK YOU FOR TESTING THIS!!!
> 
> My hope was that the recent change (to avoid doing any
> updating of ranges property unless it was found to be
> "empty") would avoid any trouble with the RPi5.
> 
> I'm eager to hear what more you find.  Please let me
> know if I can be of any other help.
> 
> 					-Alex

