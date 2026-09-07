Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E1490BF1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780624; cv=none; b=BVlCQPTeuRo1mOvXAuRUo8nPQdWqxREvrJv4h+2QTMTQSvVkgeX4N5/EBle8/l2P67v3VicC2I2O39GzYI9VDzlabLiLQD02YtDKIReTVxBFZfdJAC+r1N1Z2SIXIL772orc6lJONCmeWsNR1au1b2kYer9ho1lGIKJYHf/bKn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780624; c=relaxed/simple;
	bh=9Fp98YdQtOLk474eiHI4efwe0tjU5d7lBfdYQ3oiqNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVHHT46lZuJZrzfO+8h6q5lGpSNMRdseKbIWD10WLPbMVwHRXEyjQ2t35is0GJBodgDl9lXEYuBMeEBs/DccrWTbj85v77UHT8uoUL0qCqSisZvT+6pFqI1s8kEUI1kOQuVXEF93lu2aNW03WAiDKKx1ekY6cmkA4U2WOiyFl4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikHq3whE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikHq3whE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db710396ffso105095ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780619; x=1789385419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FU4CEbQdu8+Brk6sDGMvGiHki1B0bPVbshQiknk3v7k=;
        b=ikHq3whESpmZRftj/S+nVFzpKKRYi6FZirG8cS0O/1Kv/PVNSCLnQzeM4t2w2pj1PO
         fbzOmX4VxCOwUm8RpexFa+j+KlDsQAdaU7zqm2nRaOjAwW5MgLOE3pU4Q4AI+QO0dRKc
         bAkhF7mMqbdimKukVxIgtS9rj/TLmOv7f/SIEzy5gKyRExsMqwJFwvPvgSWdiAMC6M+B
         MiJD/wwmfB3a9b9IQpHCQIvOYRQfgLoZ0nmjS6DXa0g0dHSwyIJeAxHdHCUKfE8JCG3z
         hZsc0fBM/xfnAA1hz6NfFUTuJpJJfvsqf72HKGDGXzuJ2mshgoVwgJXHmppAIsfSiZbK
         uigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780619; x=1789385419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FU4CEbQdu8+Brk6sDGMvGiHki1B0bPVbshQiknk3v7k=;
        b=tKguRVxlSFIp92NhGi3wy+CBtWC4x2F2Q0H+MICkkX/TNVN5QtfwxVPhituELNKqmE
         TJfC+pNNuwoC0JG21BfJm74LybdmYInhAHuGTPUTPz2xJKUYbZDE6SywpVeIhedfNRZE
         gIeUcGU9tuAqyKKfxckzDu+B8B8q6MZf5yGJUbPMsklbOn7vEBIOhNgLqAHm02Ovxg82
         5LRrm0xwlZodBNH3117pal33t9EhGQG7LvSCB2DiG7hHnobTO77wULyy/FJn2P3rGH59
         NptDyuK2VgqmVKh2dGi2Nw8R0g705H+0aV7SPZMh8up0/GffpM9HPAdBWG5JAAGImESO
         TIoA==
X-Forwarded-Encrypted: i=1; AKwUvByqcPwx259qUrfPMTcXn1rzasAQTvWfx/xYHIIZlCbjJ0p6mgbAbRRM7CpRs0H0TvfyxCcHmskNdclzNd8=@vger.kernel.org
X-Gm-Message-State: AFuF++lqPIeINzynAJXU7o4yAYCUyGq8p36Bf/MAYAgcaxLYlPzx3B7j
	FG7rDOLIU1PIdDd2L9EF8tdr7Z2Lbp5yJ3kbS1I041Lolbbtce699PuL
X-Gm-Gg: AYBFou2hgZByEdi4na0VIRIWdnVBnXI/Vvgq8wNAHegbNIi2W8MH6iTXEJIgB2hVeIp
	IJSULtjMey0gvQJp7z5VXeWoqzAVPO4yh8YSKaTD8cbkQMC/pXfxNUYtEQyL1FrWAB8UDLkE8mV
	MAG0I0+dQ1AB1tPuEnikPKbPTlSVg9K7ZCsLXrsh1wkWbQYpKhCSNU4OhSuJ9MMnM061VOtuHav
	byAbovrBMGXyHVGUjlLKyTNk4BXNeUw2bbxyXLTUWrZdNOOe8RvhYDH1/+wHlQAcCpjTBgO0ntQ
	QDE3Khzf3wvYppym3+oDZ/6m3bfzMYdmWYbjIo3UbvU8eIjQxrOEsHeVy9Nb7O8kkQSfqLkeADp
	Qw7Nn02OkBDUs3xEukrPTfm3vN2rt/pn5nPK/RS2FiDOUgW0OuyZRndY5Mo4wdQ2XV/6jWoiBmJ
	pR2GyUcrSolItWtEf1SL79s5J4inctyYjvMKn3oSm5IC3ChLF1PAL/zgRirnQ=
X-Received: by 2002:a17:902:c951:b0:2d9:2b1b:878a with SMTP id d9443c01a7336-2dafaf60ec2mr266366025ad.10.1788780618646;
        Mon, 07 Sep 2026 04:30:18 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d455sm45019245ad.30.2026.09.07.04.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:30:18 -0700 (PDT)
Date: Mon, 7 Sep 2026 19:29:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Message-ID: <ap6fcP7Oct109dkY@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260907102849.w7yn43x6m3f2rnuj@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907102849.w7yn43x6m3f2rnuj@skbuf>

On Mon, Sep 07, 2026 at 01:28:49PM +0300, Vladimir Oltean wrote:
> Hi Inochi,
> 
> On Fri, Sep 04, 2026 at 04:37:04PM +0800, Inochi Amaoto wrote:
> > As discussed in [1], some drivers may do not care the difference between
> > phys. Instead, they only need to treat them as a group and operate them
> > together. This means a bulk operation is needed.
> > 
> > Add some bulk helper functions for phy core by referencing the design of
> > clock/reset subsystem. This can relieve the driver owners' life who needs
> > to handle many phys, as well as each phy error reporting.
> > 
> > [1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/
> > 
> > Changed from v1:
> > - https://lore.kernel.org/linux-phy/20260831025319.94886-1-inochiama@gmail.com/
> > patch 1:
> > 1. Update document.
> > patch 2:
> > 1. Fix document format.
> > 2. Fix several document description.
> > patch 3:
> > 1. Split into two patches: one for non devm helpers, one for devm helpers.
> > 2. All the bulk helper now use unsigned int for counts.
> > 3. Fix multiple the while loop statement.
> > 4. Rename of_phy_get_parent_count() to of_phy_get_count().
> > 5. Fix some 80 line function problems.
> > 6. Use PTR_ERR_OR_ZERO() to simplify the error handle.
> > 7. Fix zero value in the document
> > 8. Use two separate release function for devm helpers.
> > 
> > Inochi Amaoto (4):
> >   phy: core: Add common helper to add phy phandle device link
> >   phy: core: Add common helper for get phy phandle by index
> >   phy: core: Add phy bulk data helper functions
> >   phy: core: Add managed phy bulk data helper functions
> > 
> >  drivers/phy/phy-core.c  | 700 +++++++++++++++++++++++++++++++++++++---
> >  include/linux/phy/phy.h | 186 +++++++++++
> >  2 files changed, 850 insertions(+), 36 deletions(-)
> > 
> > --
> > 2.55.0
> 
> Please include a user of this API in the next patch submission.
> We should avoid, as much as possible, to introduce unused code.
> 

Yes, I have one for it. This is the spacemit pcie driver.
https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/

But it only uses a few of these helpers. So should I remove all the
things that are not directly used, and let others add these if they
need?

> Also, please address Sashiko's feedback (excluding the pre-existing
> issues).
> 

Yes, I will, thanks.

Regards,
Inochi
