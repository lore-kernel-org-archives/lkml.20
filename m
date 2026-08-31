Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF53E1729
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170453; cv=none; b=OmOovjlvgWbWpogBoLhPlFXMLbTRiKX6vmaQn6sHeSSymnRIFjz3jgn9g7WPDHdtP3QU6btQ97yqM/EFW7Vl2bkbVBJ0rVv2gTrnoqq/hcyUQwK/OAA2a/8jv9pbnoZMj5ceL9uoZE78S2W2bXcMBBF28LUTXy8niZU921jkOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170453; c=relaxed/simple;
	bh=e502PeZHGUnKXvSuRWWsiCQrGsJANAUwucP/32hEB6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzkTq5o0oZHI2ouQ/IdNT7UPaXo6DRplczMLxDEPJpxe2MaBnNvyhLlsVeH54NOPbC9puhayf1QrzALOfL+67HMpS4Hp4oBrjfPpNscObFHPkVtl8JWz3JT2doEYTMTx4YJNidob+gRFw7S6poVszhpD4SAwH2nB6EGOSpLlGD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6eQ7hL6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6eQ7hL6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d712281f8bso36198005ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170451; x=1788775251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qrQTjIOkpT8zIVKPBnb0BW8F6n+G9iLSS3jQwYKHHM=;
        b=c6eQ7hL6Mo+s1qyk/jBTO1l8NI5a2gtrT7UptiSeO0YWkJvUE++ktxV1dMpTcBlQxD
         4vpbKSEFzMK6DxcrGYGMTqqV2g9hVWDYK7h2hGME8EA0nnQcZ7twLUz/FOPVMhJbBjxu
         etEOpm8ltFMfTaFb3eNTGax+w06Ph8pDDmlZxpXurDARU7S7VxqYU7ACZI9l2IxiB824
         OUtDzyZb1Ytse4QzwmhqK0rleLDeyoRVSFPX0vv1G1IXxVaCx9V2ayee6JhLY1lLjfIm
         MlSyWaE7xN0Rjxw/nao5S/a9dEWqk0n6/oJ14OsiSAKA8a7FPtsOtRN2rvpnj4KDvY0p
         Ofyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170451; x=1788775251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qrQTjIOkpT8zIVKPBnb0BW8F6n+G9iLSS3jQwYKHHM=;
        b=cW0xa/mrKVvYnkPSuWfOz/u5r+47z0Gcf/Z2PpDcJmzJMccQeK8B+PEdVYdr1SYLxi
         CuNIQQAXhy/4WQUB8nrdH0qGEH6ozOwSt6hypzZBtQkiI8VTV6/vQSchHlnL/NGM1vkZ
         EhnwL5Lw5V6NAIT8Y6LxqWAkSf6qb09ChDEPhatvHVvOOYIbmWcG/070uTpTGR9QH33W
         8lrnBBO32ZKGTAuzb+ZqkvbT59DwZxw7hfYqynWMGN9Rx1z3KH8Kd7MDwL13pKPQjCzj
         6sizn42uNQtPK/l3dBS88B8M6s57KjLjSMgTphwb4QkflP1720YquhgMwsOD13GzsdQU
         N/2w==
X-Forwarded-Encrypted: i=1; AKwUvBxO2PjEvio1XhLL9VxI5+SDsaVzcwd1YldTsLRukOCLf7DTg9vIlbxpZrX/RvymoU4SbQdf5ayUhXHA7ww=@vger.kernel.org
X-Gm-Message-State: AFuF++lk9czVedTAzmZ48njaaMRr7OHT7EkskH28w1S05qIMWOY/dZY+
	V4Z5sVdg/F0LVu2Rg1lfey+yA2vz6nSiymSg/dTPCW3QJJuYR7EFAjgA
X-Gm-Gg: AYBFou1haqyORcItCCUYtPWvHRGXOFn7JEuYpaP3oGw+FhYq/9eutLe7bS71eSkFWJ2
	5f/l2vz11Y1vRBhlBESFfQsEwy1BIoMQ4g06WosrgC1Bjsm4u57eLZF0PMBoTbPBqUfCB2sonvY
	d//ehrYWiifNBoIKIV5J7KpoT+EQKHoYRAiAS5ri9BF6aOzKfCkykKr6F+ZZCoHrYY/RgzKTta4
	BXgOi5altydt62BHxyOdfc8mNRrtUNXi02sds7KK41TRIb4mujc0npJiUWVtm7nMqv1HT37vpYB
	+WhdUdnfnUAZdsQqwb1yHF7mJIgeet0clbR7c62wBu/Y3CYkfdny+3qRDybVoqN6nwZNjSKyoPj
	R2IS+PbIrFZWohxwZK+JstzVQw93Eoy+fFvtCCkvtHVruAseL0GnKAXQpwq7/DN2kotchIEn9/r
	NaXYxeZStCzRKuBwgk4pRcwruGkZC9O3V9vDI8KW0POgRSgQkEE28nYRdePfo=
X-Received: by 2002:a17:902:fc84:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d93f9f9d7amr34369695ad.12.1788170451338;
        Mon, 31 Aug 2026 03:00:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75963a250sm32609235ad.31.2026.08.31.03.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:00:50 -0700 (PDT)
Date: Mon, 31 Aug 2026 18:00:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] phy: core: Add phy bulk data helper functions
Message-ID: <apVOES6c42e_NBbe@inochi.infowork>
References: <20260831025319.94886-1-inochiama@gmail.com>
 <20260831025506.95548-1-inochiama@gmail.com>
 <20260831025506.95548-3-inochiama@gmail.com>
 <apVJW6H8_y0uiVtj@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apVJW6H8_y0uiVtj@ashevche-desk.local>

On Mon, Aug 31, 2026 at 12:28:59PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 31, 2026 at 10:55:05AM +0800, Inochi Amaoto wrote:
> > Add several helper functions that allow drivers to get several phy
> > consumers in one operation. If any of the phy cannot be acquired then
> > any phys that were got will be put before returning to the caller.
> > 
> > This can relieve the driver owners' life who needs to handle many phys,
> > as well as each phy error reporting.
> 
> ...
> 
> > +/**
> > + * of_phy_get_parent_count() - Get the number of phys of a device node
> > + * @np: device_node for which to get the phy
> > + *
> > + * Return: the phy count if successful, 0 if no phy handle is found,
> > + * negative error value if error occurs.
> 
> Just for the reference, here is the correct format of the kernel-doc!
> 
> > + */
> > +static int of_phy_get_parent_count(const struct device_node *np)
> > +{
> > +	int count;
> > +
> > +	count = of_count_phandle_with_args(np, "phys", "#phy-cells");
> 
> > +	if (count == -ENOENT)
> > +		return 0;
> 
> Why? And if so, the function perhaps needs to return unsigned type. Also
> kernel-doc says about negative error codes.
> 

There is a special reason for -ENOENT is the of_count_phandle_with_args()
return -ENOENT if is can not find "phys" property. I think it is the case
that there is no phy required for this device. So I judge it and return
0. For other errors, they should not be translated so return them as they
are.

> > +	return count;
> > +}
> 
> ...
> 
> > +void phy_bulk_put(struct device *dev, int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	if (!phys)
> > +		return;
> 
> > +	while (--num_phys >= 0) {
> 
> It's hard to follow.
> 
> 	while (num_phys--) {
> 
> will do the job. Ditto for other similar cases.
> 

Thanks.

> > +		if (phys[num_phys].phy)
> > +			phy_put(dev, phys[num_phys].phy);
> > +		phys[num_phys].phy = NULL;
> > +	}
> > +}
> 
> ...
> 
> > +static int __phy_bulk_get(struct device *dev, int num_phys,
> > +			  struct phy_bulk_data *phys, bool optional)
> > +{
> > +	int ret;
> 
> > +	int i;
> 
> Do you expect num_phys to be negative?
> 
> static int __phy_bulk_get(struct device *dev, unsigned int num_phys,
> ...
> 	unsigned int i;
> 
> Same comment to the rest of the similar changes.
> 

No, all should be postive, this is a mistake I have made, thanks
for pointing out.

> > +
> > +	for (i = 0; i < num_phys; i++)
> > +		phys[i].phy = NULL;
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		phys[i].phy = phy_get(dev, phys[i].id);
> 
> 		ret = PTR_ERR_OR_ZERO(...);
> 
> > +		if (IS_ERR(phys[i].phy)) {
> 
> 		if (ret) {
> 
> > +			ret = PTR_ERR(phys[i].phy);
> > +			phys[i].phy = NULL;
> > +
> > +			if (ret == -ENODEV && optional)
> > +				continue;
> > +
> > +			dev_err_probe(dev, ret,
> > +				      "Failed to get phy: (%s)\n",
> 
> There is room on the previous line.
> 
> > +				      phys[i].id);
> > +			goto err;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	phy_bulk_put(dev, i, phys);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > + * Return: %0 if successful, a negative error code otherwise
> 
> Note, the reference to 0 is inconsistent with the previous changes.
> Make it there [of_phy_get_parent_count()] to follow.
> 

Thanks for this information.

> ...
> 
> > +static int of_phy_bulk_get_by_index(struct device_node *np, int num_phys,
> > +				    struct phy_bulk_data *phys)
> > +{
> > +	int ret, i;
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		phys[i].id = NULL;
> > +		phys[i].phy = NULL;
> > +	}
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		of_property_read_string_index(np, "phy-names", i,
> > +					      &phys[i].id);
> 
> The line limit is exactly 80, please fix your editor and double check that you
> use as much room as available (with the correction on the logical splits where
> it makes sense).
> 

Yes, you are right, I misjudge this as my completion plugin output the
arguments name. I will change that.

> > +
> > +		phys[i].phy = of_phy_get_by_index(np, i);
> 
> 		ret = PTR_ERR_OR_ZERO(...);
> 
> ?
> 

Right, I missed this.

> > +		if (IS_ERR(phys[i].phy)) {
> > +			ret = PTR_ERR(phys[i].phy);
> > +			phys[i].phy = NULL;
> > +			goto err;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	of_phy_bulk_put(i, phys);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +int of_phy_bulk_get_all(struct device_node *np, struct phy_bulk_data **phys)
> > +{
> > +	struct phy_bulk_data *phy_bulk;
> > +	int num_phys;
> > +	int ret;
> > +
> > +	*phys = NULL;
> 
> > +	if (!np)
> > +		return 0;
> 
> Dup check? The OF APIs are usually NULL-aware.
> Same Q to the ress of the code.
> 

Thanks, I will remove them.

> > +	num_phys = of_phy_get_parent_count(np);
> > +	if (num_phys <= 0)
> > +		return num_phys;
> > +
> > +	phy_bulk = kmalloc_objs(*phy_bulk, num_phys);
> > +	if (!phy_bulk)
> > +		return -ENOMEM;
> > +
> > +	ret = of_phy_bulk_get_by_index(np, num_phys, phy_bulk);
> > +	if (ret) {
> > +		kfree(phy_bulk);
> > +		return ret;
> > +	}
> > +
> > +	*phys = phy_bulk;
> > +
> > +	return num_phys;
> > +}
> 
> ...
> 
> > +struct phy_bulk_devres {
> > +	struct phy_bulk_data *phys;
> > +	int num_phys;
> 
> Why signed?
> 

My mistake. It always needs to be unsigned.

> > +	bool free_phys;
> > +};
> 
> ...
> 
> I stopped here. It's too many stuff in a single patch. Please, split to two for
> a starter:
> - non-devm additions
> - devm coverage
> 

Sorry for a bad time, I will do a better check and fix them. And I will split
the patch into two in the next version.

Regards,
Inochi
