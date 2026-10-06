Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EDE286D70
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319765; cv=none; b=nz31QkBbGflxOmbHIev8WYgHOMGyJZ33TUsaMlZn7DkEPGuNp2GxkBmsCco1PBIzKdKJ5eTEX9bZwZ5wTVhZ9qUxthzbOVzAJd2gu59GmVFWZbynuY8oV5nQ4aosyYYVwhQ7V6Is+Lce92iZ+K985e7MGKuzer8HuaSjG4lTVXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319765; c=relaxed/simple;
	bh=xqgruxMEoFLO2U8PYIGjqFRaHgL3pjz/G3pFAuZ+/GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sZiWS33amxA3/A8Mpn1EalNIEWXIXK/hIN1GntImBKETe0KItVQgSXtsUfO3bvzRh9JpAP4Uj0VrYqQwKshhag20XvQHLiC0UHXBAw2mbLoIXKBWBivgxTZ4wj+TM+7h+H+WvvNx5RRDvuQ16fUOlv/epyEkmgDiIAU1Hu5WA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehsWfi0R; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehsWfi0R"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6baf77afso2073485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791319762; x=1791924562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIHAb9GAkueefUIdjR3I4J5afRauN6gZ3S+I0imvdZg=;
        b=ehsWfi0ReCotPByzrNdbavZ6dEzh6EjlQUjT7YDnxcZBvKHq49EQU8tsG9QAHcLNtB
         geACW9ff/8cXAcX4cCU6F+QS0p2B6ZzVNniRjeDh1w0Aegix17/Z76jmYHWUnf3Orv0d
         MWaKWmLuXYOZtB/VqUcjNf33ou3rWKs2NpU/adpq1EN6i1PKh+vb3Qm9VVi58Bxp9K4L
         Kca7o/NI4guCDRZsMdPy4Jp5Z1v9zU6WgQZW+mSn5tM4WDeQ3bLR35/plrRCp4mYw04h
         z4R8Qr1+kG8lQiHymTsG59NvOi3SYCfI0TuZioJw2oJxXUwSLZdfVo4d55E4u92s/JSw
         csCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319762; x=1791924562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIHAb9GAkueefUIdjR3I4J5afRauN6gZ3S+I0imvdZg=;
        b=dJnLElXrlwzNh4+j39guLAdyGYu/eQMkvLCMpzpzqOUG1Dvvd9Qoi1AAiIO0btKOUD
         x0NV/LicC9ldxT7LY4c4Z/CL4spp2974LJjoN+fythdU9xlRPfqk5rYB2X9zxF9IvwZ9
         2J+0f4rqhKkRnOHaj2Y/bYb42NDHN9w7OjoIlgaMj50mDNdKheAWc3MDRFKFdmbvp2wI
         rEYecKDKDtt/qz3qG8G4i4ke0x09MYwxUs1aJ6K1hBLM+AdU9O649o675YxWuVVX8zbt
         4qUWpkVEsUAaY5WCgkaMct/5Zvf+bTnHJsG0EHYs3q36yO3ZR6G/8r8ixCObUguz7FCh
         cV0w==
X-Forwarded-Encrypted: i=1; AKwUvByLVs5PAugQLcqKc2idrJ+dcJBlye7I7DtWfKF2AWEcfLc137bBsLcudkIHdeRo0Yuqa0tVbjMhvh07Oj8=@vger.kernel.org
X-Gm-Message-State: AFuF++mkLBsvEOKj56gIsA1sIbA/Vb2FTCohSIkN39pqKef6LNa42TFF
	DCsVNbT+ZjVfCfHhHltjiu4a1NMOgr4kMGhWm9ZsKhxQ6unxqjOQHPY2
X-Gm-Gg: AYBFou0EKH5vqZ8mRgTY/87Lfsi2SL646gLygThnzlqxB1QRLiC8RXgruDuOOlVoCJZ
	X8Kura6DhVn7hYlIt/Vb8jx+UPerfEpTEwMxIK+ETOL1FP7jL1W4E9eeo0MMS3V69b01xYfcYG0
	q9/GgeZpWE4havXCjEwes4eWCgK2Zr1sJCff7B1r77y9pXoPCoN5D1QMleoHTYRWee7t24pe0iL
	+FdXmtb1J4hvWjgakU5NdrTT1ipMumJBbzVD+fplQJtgCqQlAbP0932DXNZRXPDgIJ/EMlJRqPe
	gI1rbUtrR0NoVxhDKQupDhp2ZytP/y0+7WmEHUz+P/uVYOci6FzsKSRIDZDTJVTzTZK6ORJU6yw
	DyfCT70WmJQo/DOsEPq7XU+ikPrC3KjySlD0k6cCQjauEtVlan/Uesw9g2ZGgREW8pHoLXf7ttT
	MV8T08nq0alaWUXe09cOdTfBqISar57IORSaNgK+5f3uA/PLoCv2ANh13OUhPKtgIJNIpKPVLR
X-Received: by 2002:a05:600c:820a:b0:4a0:1ca8:70e2 with SMTP id 5b1f17b1804b1-4a18031129bmr1090175e9.1.1791319762113;
        Tue, 06 Oct 2026 13:49:22 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:92f9:f192:2805:c29a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm94359625e9.3.2026.10.06.13.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:49:20 -0700 (PDT)
Date: Tue, 6 Oct 2026 23:49:18 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <20261005163245.x5x3gv2habdk2xe2@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asOMP3uJJmdpfvtt@inochi.infowork>

On Mon, Oct 05, 2026 at 07:41:52PM +0800, Inochi Amaoto wrote:
> On Mon, Oct 05, 2026 at 12:12:51PM +0200, Vinod Koul wrote:
> > On 29-09-26, 16:52, Inochi Amaoto wrote:
> > > Add several helper functions that allow drivers to get several phy
> > > consumers in one operation. If any of the phy cannot be acquired then
> > > any phys that were got will be put before returning to the caller.
> > 
> > Do we have many such examples? Phy is not a many resource like
> > clock/regulators... Do we really need this. How many in kernel users
> > will benefit from this API?
> > 
> 
> 
> I guess the following driver may benefit from bulk api. Most of them
> are PCIe drivers....
> 
> drivers/ata/ahci_imx.c
> drivers/pci/controller/cadence/pcie-cadence.c
> drivers/pci/controller/dwc/pci-dra7xx.c
> drivers/pci/controller/dwc/pcie-tegra194.c
> drivers/pci/controller/pcie-rockchip.c
> drivers/pci/controller/dwc/pcie-qcom.c
> 
> Note: I mean the bulk api, not just the things I added. I guess many
> may want devm_phy_bulk_get() or devm_of_phy_bulk_get() instead of
> devm_phy_bulk_get_all().
> 
> Regards,
> Inochi

Why didn't you try to convert some of them, to make the case for your
patch set stronger?
