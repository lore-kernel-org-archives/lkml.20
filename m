Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD641D65E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782238; cv=none; b=hSs4enb1D37KpvRvftx8x6rmQzu7FmEsA4e7RsnmoDsmJSo52a4lApfWoNvy6QwtD5MduHjv9SI7rY0o9q5XbM6ypAEWbS4n+315Ie2R+alOOBux64Pgu7/gON2TljK5YGPWCj2ysACRdmeckSSoPRNKzbxeXDTFUN7wG8PdDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782238; c=relaxed/simple;
	bh=oAMrQTDpu/6DnAoHvfi1nLbynVijYCLX5XDDMOzn27Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqKYDiEtsun9QPhGcJ1x+C60TeGWdW2LhU+OE6BBH6Kc0BOaCDHE8P6on52V/LieuKEuKfiauoP2DHe//UHV1CMcnwuJg3FWw2vMgE19TNcE0pve2A/HCRTXOgmkNIjgJr7kTPwYr0pzCaH1Zn+9fqaqGvW9m848tF0umpuIBAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO/ENRrY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO/ENRrY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so265270f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782235; x=1789387035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1gcmB9FcGzp8BvkHmT9Fmc8HcBUppQYVGoa05TdIcAA=;
        b=VO/ENRrYnm6hv/kYaOUAhcPKCsmkk9ChPM9HmhGizPWUr74CW8oOFue1qRahUJ179t
         6h1JiZAwalkTO+TWABTWfdQdAqcXEIaeC1/4AL1SUKR/8V7iBWyUvNb5wyzbaSS66zsU
         KawINa+kLmuaHI+B5+TP2D9RJCDXmU7r3P2NG3Nhfw1exk4aTSkJkwheUkCtKsemX+iY
         O4vk4ks8rhT7qat8m/MMmjdQcivoeIwYv40x9G8PrOB2Qr0OQnfq7mZBHfyl/hdH+Gnw
         UGoqJAGWZAoKDYhvQxZXjPZR5dKSLxHh/W97YhMQuZ5SQomibrRbEXydN/PdWRgsjO8C
         TrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782235; x=1789387035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gcmB9FcGzp8BvkHmT9Fmc8HcBUppQYVGoa05TdIcAA=;
        b=CbptuZPRj7Dm4mNnFyROBjnW1PxiNZBEmQ48zke1r30ZDZ3MV662tpEFzqpekhwzVd
         zvX+kYmxhJ6pC7ppsblqMwM8DE0c8wRgY6agjNHXsTSJoJkKL3l5wlbduvKOEbFBEmvO
         eGCXtHtmhs5+TvC69+6IFdGobKbl9scQDVfoX4bAjK3Ch8wPKsf3mITu7phF/NLmaSIT
         8Y22JeNQjp4X8Y4RmMhXniI0sfyyTHcs6aOQ/t0wBlyV5lW9hpB4at8rQMZA/cQOnnn8
         biES/IPteLfTCjZwLCgdSV1G1mXInXZP56c1pngE3C8aPWfKFvE+1r3UMIZEhycX0dPM
         R4Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzvSgALuASoRXNbUv9tTlToUaFOrbT+oJGbG3G34R8V1JffIP27IXaEinx/F00+j5+/sLvp2WaZ/xuVFbU=@vger.kernel.org
X-Gm-Message-State: AFuF++kf/bZ/hg/1ZMtsIohhjRmQnJ1ThknnQeEP2t5ywU19nFlQ7VQB
	v1GLAPF1gumkNLvmujALlJk1Wg4zDRovRXOwTp+7an89qQDnpmiPuxLU
X-Gm-Gg: AYBFou2KTsl15RK+Pk5HCWF9K4aMozX1hgGjuN5WusIjvFQ0OSH2vcUeu3CE0dT0XVK
	G287LFPipMJR8eKa6hHdFqQKmPAeda936Cnip+FsSshpxmOnnOodWnHFqFVJ2wb+9TntxMvTr4R
	kQvWF9adikGdeiH+HHZ4MfSCGm27IClIE/JmRSB879Kv140ZegYqHDR5Nb2eqsuvoXD4y15aeWc
	I3gbxlPqITUwrcJgIKhwMvrITTUN56zpXH+h3ap41GtbrQik/b5bDH6+15DEUfpVOlGLOYU7sqM
	zgBxvuQgEa23NitFu9AAPo2PbheZgG9I1bgc5DcfYTm8qNpIjgcRT33kGumTfet0w7lzB8mLlWf
	a3XYveUxSKLMgXwP6NjmDlq1nhgZPDuxDHwDg+Fo3F+S5wYLY5PexSlMxdphWMlrCEw2S0ObLG2
	krrNq1/ApSZtJd9C4umwtZGWbTOYjq9VtBCScsg34Y1c6I9CDr/Q==
X-Received: by 2002:a05:6000:144e:b0:485:8ad5:dbbb with SMTP id ffacd0b85a97d-485907f1861mr13652195f8f.4.1788782235302;
        Mon, 07 Sep 2026 04:57:15 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm29210647f8f.34.2026.09.07.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:57:14 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:57:12 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Message-ID: <20260907115712.dg5pw4ajvrtdipey@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260907102849.w7yn43x6m3f2rnuj@skbuf>
 <ap6fcP7Oct109dkY@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap6fcP7Oct109dkY@inochi.infowork>

On Mon, Sep 07, 2026 at 07:29:49PM +0800, Inochi Amaoto wrote:
> Yes, I have one for it. This is the spacemit pcie driver.
> https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
> 
> But it only uses a few of these helpers. So should I remove all the
> things that are not directly used, and let others add these if they
> need?

How many functions would go away, and how difficult would they be to
reconstruct, if we only were to add them on an "as-needed" basis?

If the answer is "many", I suppose you could also leave a note in
phy.rst that links to v2 and mentions unimplemented functions because
they lack a user.
