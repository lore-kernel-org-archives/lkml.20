Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A1541685C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633482; cv=none; b=kfWfqIMRjRZEqPNQd28rsoGwHOgKy40Q2Hltgh7EVeRpzZqBMEScwLGLbF6MQ8pZv4wYGGYTV3Vo+aDiretGrkFO4DwtVuhSdARddjbCFomJdhMye8/TYNry2RBg6sTyxk03LvOzhC1g7ZNRvkiJZ/C47pJLv8GrFTpqDQGO/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633482; c=relaxed/simple;
	bh=L9v9q98gPrJzJTT1P+rysIIc1Lf8YnVgiDYtobB54jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhENvokWPxLoESKyRTqvCCCj/E1geJR2lXHN9HP0eKDSyKuyN9reW4b+/xqDgD4WdlafcL5jpUeOmhANLmeKfZdaom1CqkVtpBirw1k2NgmMVTwFCDHA6mcXD6sFjqTl1x7ybEe2EVuGzr7wALqgH8R8d57bRdy9rqEtRiOK7tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE57fl7Y; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE57fl7Y"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccff31419so4599105e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633472; x=1790238272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=bE57fl7YT2VHCDXMweQkJ6TSCAvOwhs7l9Zkr4F5IU7l8QEr0fvlbLIhRAZQo9SsfG
         fGqOzBIHpSU1qGIF57Kuo1G8kT5TSjma0K4fwgqBzMvfbHRkNQirYy2jg3sDZCCxNiAa
         UgCwdTlqiypXSA7UnXfv4DBF6UNbloDBrfU/Ghqy/+7IFSnXTsAGbbcNINUFhMg+Kgrh
         hgCWjyDLfKiiJKpmISDg53AgzT/NvKBHMblZ0+/M86sQNnLFr1qGTc1UdZkU3artMQ7C
         dDBR0zqRV65qqhXSprm2ZUOjxy2Nze68CxTlCXSCZZBDVvL5+sv5CLWBUyidLxpZHP7F
         w+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633472; x=1790238272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=tV6GDT7zStnWNnGMmSQ3pgj8Ug5HQbuoRcFF5SxTXK6jgR++I2gn+Og6JEf4p3Ow48
         5U3XegIMLOFGzCOPaWaS5+x4jNYEinnPp/7J5r/TChnptl/iCjvELoUpnYQ0iPvP9afZ
         hJWhiLiu571LW/tpw1/jbAmZ6KzIny50Ew4778AAoOnk3rMIVFaDcFEwGKfnNb49s3oZ
         y5nmh+TEDhrWeZcebvYGkesrBCMJAXI/9Qm/YAOZjSwCmh5hn4i3kVZtLWuM1WNYPCM5
         BGXngDAq40z3hUY7fqMdefRbi0NeG1XrHrKwRCGneCmz3ou0+MNbD45iPnCYDu7RkP1s
         myVA==
X-Forwarded-Encrypted: i=1; AKwUvBxaiCwnPCaC9iSdrsuSlWuQ+oaDGAIj2V71vZ1KtLFiDwbZCdGjIOf7vJItpB4alWWTAl434/iAbQfiCIA=@vger.kernel.org
X-Gm-Message-State: AFuF++knKkpPwfWQKZ2AkrLrO8DfnGNhVs1tjtR4AtOBP2jVBf9iWvit
	6415KbdCuyzXo/bFmrEjB4dIa0v+yMPfvQOyYyEWDsJDSQV68I5+esfu
X-Gm-Gg: AYBFou0P0zT+VB1M4EJCelxY04AT4RJsokMBhdHmqmZ1OfZDOVxkDfylyPYffJUXwqM
	9STVgyA28Dq7irbzEAFQDqvPhTUVeqvzpAK3OXkKdAWaUHXV8kT/RPsg+uhbFvOfkHvAVs5iH/H
	hIaNfUBJbVcsTtqm+YiJ9V48kpyyEJO/4WblaLsP/4LrGW1GH63+JsGeYJkesx3Q9f0Us7FNZoS
	Rejdkmpw9qJda2WJdsekfiBHorXG/VqP2TPmzEgd8I+o8oaefXszN6c14u76igCSnnDLHRDRWpO
	RFASw15ozT94nJ179MkAJFsPlFk1YQIqMgS4+iZRgGrLiaj/BoaGlKI0658ivCSg12eCLLH0z8s
	JNaoVV624Qy6CLJl/Mg2Tszm/Kz8OM3hKjJbO7VnuG5/u00kuBUb0gwsfmwhBueD6G2NWSkN/Wt
	t/KqNqUqmY4hsVf8rAuqL9F8DWATB1o+hQhhcgci1Syz7KUoJAUo3SGIJQ/yqHA3WOwfGB9BVuD
	sQYPmNgfzsk65IqYIiNEOhiS/e9JJp7Ha8+k1cHWaLulEMeezHt8DUdcinWCQwwvCicodNjS38c
	wfHVOPpt44w7C5sw/OQXL7uDlOxoTce0rwBuxAQ6YiezB6RWA90ZTp9cpzVLla44Kx4Wn6RGdFl
	VpbVE2fs8ra76TEx05qWvjoU1ZCWLyPFztIfZwNsZ/ro0YGQI/UqjoKTSvePoVOcWySRhcomVur
	5v+gekyEyFZ/qcC20=
X-Received: by 2002:a05:600c:35d0:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49eb7320b76mr75942795e9.20.1789633471744;
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm38435265e9.1.2026.09.17.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:24:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260917102429.00002faf@gmail.com>
In-Reply-To: <aqq_ymTi1I951uQp@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 11:11:54 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:  
> > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > on teardown or error, causing potential resource leaks. This series adds
> > > the missing calls.  
> >
> > No, as I've explained repeatedly elsewhere, it does not cause any
> > resource leaks. [1][2]
> >
> > The autosuspend setting leaks if you will, but that only matters in the
> > theoretical corner case of someone rebinding a different driver (which
> > will soon also taint the kernel).
> >
> > So don't exaggerate the impact, this is essentially just a cleanup,
> > which is fine in itself.  
> 
> Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> include these pair functions.
> 
> I get many similar patches since scan tools is more powerful now.

I suppose that could work. One would still have to scrub the kernel of legacy
use/dont_use_autosuspend() calls though, so it could end up being a large
patchset.

-- 
Kind regards,
Joshua Crofts
