Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579AB37F732
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200536; cv=none; b=ZuspDoHJTsbO6YVnp4XJ3tMROonINmsmKxYsKP7LJeYifEH9QcJEHxcVdCXNl6QyklhMHf940qUYAfvUw2vobV59B5kPJb00xZ2+V+4+uJyGqIOxZukWEYdY2YyHz3VXfm4U3IXenehyBv4BB9uIT/vEO+tWW6+WrIHx57A4S+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200536; c=relaxed/simple;
	bh=EsJYQCUWbvm2nmNI0mfMjSHnb9dJV9+mgnWBHLI/hFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7r7wgkYcZuzv2e532IN2VPN5MvECt0nuz1O3PEK01kOufKm7VOWaTFWJ1mh2I65T/Z1L7AIeE/8oJvQMEc60ftWlzTStwFBTE9P6ev20/96Ge7Q3qecCjJBeuXUav7CDaKNlvMuqsa9f0tsC8hE++SugB74i9eIQj15wOrX+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhE6gBRq; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhE6gBRq"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc502d509c0so465996a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791200534; x=1791805334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4vqyfelfFGSwkjEBG7zfjrJS3enkPtGtmBJ59OEhynQ=;
        b=GhE6gBRqOfZuMR3djqMYNrAyQXueVVCd4vokbl+/8P+AZHQ7xUOx0w1GO10ysbMZrs
         t37oITeRg7twV3acIlZVp0VGaC5El52YWybKArCi2M6eIhdViXpjV35WWyJMRUfzTlAy
         f5uSz31bSqtuT88+o1hzKVV6Mt0LUR+7l8MUjZv3iulN9dncJo2vwMAd1KOZTUch6BAn
         q48yAkVIebTT1UkEhrfxdjhO3fmBsZ3xyfDmFFwps0NN7foUa7L3+iHH8XJ0R+Smrpvf
         FcecSkct1CjXT37gdSHMnwfTfiwNCbIj4/CIVGDYKl41nUJyDisGEGICT8Qqv9twGN52
         qwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200534; x=1791805334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vqyfelfFGSwkjEBG7zfjrJS3enkPtGtmBJ59OEhynQ=;
        b=WjfvAlE9tZTwAwd8PtdIBNywZBFfbgimITsNi5OqbOyOFK9N+eCAOVcmA58EI7VUIH
         dpDaFbVHBMKlrPCeaFPxjogCm1nzIVvYAMU7YvoCnvZWsBN2cftzby/JYKlH8dxEX7rP
         ZYQ1rctE8xoJQ+7mdwxvjuBuZ2O77xf+oFxKgrKedFAIlyjznPmJo+XwVt2elbW7v5Ac
         jo6MGR1s1qXQ2/KQmT2pw2D1yOEkVTWlOtJbQbPup9gJpO9O6qEuSiEfZzQr9o3r4Y44
         YQqlSTMFp2gmsTSj6Bw+Mw7V34PFXAJAj+3I234xkWipenVv7heM2Xu9QTnZRwMZYA7q
         mrqg==
X-Forwarded-Encrypted: i=1; AKwUvByiKV+mjG62EnJ6hPba7mqsBjLS6vGDpD0hPdKIrs2vgg92q6pRID0D54vqaTOBj4BcoD+eE8GadV4w1tc=@vger.kernel.org
X-Gm-Message-State: AFuF++kYesxe2ULCuTsvJz7Peb96DBwboGOWCV9nwAKwCbUXAiCzBnYj
	gD4WgMB5CVMWTWoxkXLS/ddlVDgFlZA3D1HdqLgL6zVdgCyZ/chF1His
X-Gm-Gg: AYBFou0z+M1n42ldxbjfrj7e5qDLs2/h8VuXI27QjGm3rJxBZdkk1k8nn09khc+4gxs
	RnBXDoPTTpPUoroTkkVTTA7z8rX3lAjSfvmHbUPCqsJN/cMD0uKv4JwVT19bzBcgrkbh9p2okzd
	AszQeQO6MfzPnPKHnn9cr9jctoDodBk/CxNt2hsLAFUrJe4VSENsEFQcSIcrjzQp2NQODf/1q8B
	qdx6qiJlmfzfW/43iFKNXOi0tkx3yqs9TWIiJ1ehiYxLvSe8L3uAk2gKCvDvK9FW0MM1mV5PDaC
	6JxDrXzDPXPEK6MyAvwk3+ka1d1kg8qs/Fqo4JWVmHqOq2n1XmGt6H+VAwp/yNYIe8LFlsGTSEh
	toeQrqgVYjvKgcsoe8qzP2dlBndaNkICRpkLv/MUtBmMCuuzl/Rms44aNW8WGxCLf+2S/VvYjFO
	f8ZxoduuAA7XMYHY579WTPILvi7caRLQAcwr7OEgTJQq2ki9Dqxy8VmVj3hVRGrDf5nZwH
X-Received: by 2002:a05:6a21:6e92:b0:3df:c9eb:126a with SMTP id adf61e73a8af0-3e0d6cdd667mr6604767637.45.1791200533496;
        Mon, 05 Oct 2026 04:42:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm3327875b3a.28.2026.10.05.04.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:42:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 19:41:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <asOMP3uJJmdpfvtt@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
 <asN4I1cpVb5HLNu7@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asN4I1cpVb5HLNu7@parshuram>

On Mon, Oct 05, 2026 at 12:12:51PM +0200, Vinod Koul wrote:
> On 29-09-26, 16:52, Inochi Amaoto wrote:
> > Add several helper functions that allow drivers to get several phy
> > consumers in one operation. If any of the phy cannot be acquired then
> > any phys that were got will be put before returning to the caller.
> 
> Do we have many such examples? Phy is not a many resource like
> clock/regulators... Do we really need this. How many in kernel users
> will benefit from this API?
> 


I guess the following driver may benefit from bulk api. Most of them
are PCIe drivers....

drivers/ata/ahci_imx.c
drivers/pci/controller/cadence/pcie-cadence.c
drivers/pci/controller/dwc/pci-dra7xx.c
drivers/pci/controller/dwc/pcie-tegra194.c
drivers/pci/controller/pcie-rockchip.c
drivers/pci/controller/dwc/pcie-qcom.c

Note: I mean the bulk api, not just the things I added. I guess many
may want devm_phy_bulk_get() or devm_of_phy_bulk_get() instead of
devm_phy_bulk_get_all().

Regards,
Inochi

> > 
> > This can relieve the driver owners' life who needs to handle many phys,
> > as well as each phy error reporting.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/phy/phy-core.c  | 253 ++++++++++++++++++++++++++++++++++++++++
> >  include/linux/phy/phy.h |  55 +++++++++
> >  2 files changed, 308 insertions(+)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 8fbaea003b90..5b76c006575b 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -1004,6 +1004,259 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
> >  }
> >  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
> >  
> > +/**
> > + * of_phy_get_count() - Get the number of phys of a device node
> > + * @np: device_node for which to get the phy
> > + *
> > + * Return: the phy count if successful, %0 if no phy handle is found,
> > + * negative error value if error occurs.
> > + */
> > +static int of_phy_get_count(const struct device_node *np)
> > +{
> > +	int count;
> > +
> > +	count = of_count_phandle_with_args(np, "phys", "#phy-cells");
> > +
> > +	if (count == -ENOENT)
> > +		return 0;
> > +
> > +	return count;
> > +}
> > +
> > +/**
> > + * phy_bulk_put() - release a set of PHYs
> > + * @dev: device that acquired the PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data with PHYs set
> > + *
> > + * Releases the PHY references in reverse order and clears the PHY pointer in
> > + * each entry. The caller owns the phys array and is responsible for freeing it
> > + * if necessary.
> > + */
> > +static void phy_bulk_put(struct device *dev, unsigned int num_phys,
> > +			 struct phy_bulk_data *phys)
> > +{
> > +	while (num_phys--) {
> > +		if (!IS_ERR_OR_NULL(phys[num_phys].phy))
> > +			phy_put(dev, phys[num_phys].phy);
> > +		phys[num_phys].phy = NULL;
> > +	}
> > +}
> > +
> > +/**
> > + * of_phy_bulk_put() - release a set of PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data with PHYs set
> > + *
> > + * Releases the PHY references in reverse order and clears the PHY pointer in
> > + * each entry. The caller owns the phys array and is responsible for freeing it
> > + * if necessary.
> > + */
> > +static void of_phy_bulk_put(unsigned int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	while (num_phys--) {
> > +		of_phy_put(phys[num_phys].phy);
> > +		phys[num_phys].phy = NULL;
> > +	}
> > +}
> > +
> > +static int of_phy_bulk_get_by_index(struct device_node *np,
> > +				    unsigned int num_phys,
> > +				    struct phy_bulk_data *phys)
> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		phys[i].id = NULL;
> > +		phys[i].phy = NULL;
> > +	}
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		of_property_read_string_index(np, "phy-names", i, &phys[i].id);
> > +
> > +		phys[i].phy = of_phy_get_by_index(np, i);
> > +
> > +		ret = PTR_ERR_OR_ZERO(phys[i].phy);
> > +		if (ret) {
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
> > +
> > +/**
> > + * of_phy_bulk_get_all() - obtain all PHYs from a device node
> > + * @np: device node containing the PHY references
> > + * @phys: pointer to store the allocated array of struct phy_bulk_data
> > + *
> > + * Gets every PHY referenced by the phys property in index order. PHY names are
> > + * read from phy-names when present.
> > + *
> > + * Return: the number of PHYs on success, %0 if no PHYs are found, or a
> > + * negative error code otherwise
> > + */
> > +static int of_phy_bulk_get_all(struct device_node *np,
> > +			       struct phy_bulk_data **phys)
> > +{
> > +	struct phy_bulk_data *phy_bulk;
> > +	int num_phys;
> > +	int ret;
> > +
> > +	num_phys = of_phy_get_count(np);
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
> > +
> > +/**
> > + * phy_bulk_put_all() - release and free PHYs
> > + * @dev: device that acquired the PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data to release and free
> > + */
> > +static void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
> > +			     struct phy_bulk_data *phys)
> > +{
> > +	if (IS_ERR_OR_NULL(phys))
> > +		return;
> > +
> > +	phy_bulk_put(dev, num_phys, phys);
> > +	kfree(phys);
> > +}
> > +
> > +/**
> > + * phy_bulk_init() - initialize multiple PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data to initialize
> > + *
> > + * Initializes the PHYs in array order. If an initialization fails, all PHYs
> > + * initialized by this call are exited in reverse order.
> > + *
> > + * Return: %0 if successful, a negative error code otherwise
> > + */
> > +int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		ret = phy_init(phys[i].phy);
> > +		if (ret)
> > +			goto err;
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	while (i--)
> > +		phy_exit(phys[i].phy);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_bulk_init);
> > +
> > +/**
> > + * phy_bulk_exit() - exit multiple PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data to exit
> > + *
> > + * Exits the PHYs in reverse array order. All PHYs are processed even if an
> > + * error occurs.
> > + *
> > + * Return: %0 if successful, the first negative error code otherwise
> > + */
> > +int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	int ret = 0;
> > +	int err;
> > +
> > +	while (num_phys--) {
> > +		err = phy_exit(phys[num_phys].phy);
> > +		if (err && !ret)
> > +			ret = err;
> > +	}
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_bulk_exit);
> > +
> > +/**
> > + * phy_bulk_power_on() - power on multiple PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data to power on
> > + *
> > + * Powers on the PHYs in array order. If a power-on operation fails, all PHYs
> > + * powered on by this call are powered off in reverse order.
> > + *
> > + * Return: %0 if successful, a negative error code otherwise
> > + */
> > +int phy_bulk_power_on(unsigned int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < num_phys; i++) {
> > +		ret = phy_power_on(phys[i].phy);
> > +		if (ret)
> > +			goto err;
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	while (i--)
> > +		phy_power_off(phys[i].phy);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_bulk_power_on);
> > +
> > +/**
> > + * phy_bulk_power_off() - power off multiple PHYs
> > + * @num_phys: number of entries in the phys array
> > + * @phys: array of struct phy_bulk_data to power off
> > + *
> > + * Powers off the PHYs in reverse array order. All PHYs are processed even if
> > + * an error occurs.
> > + *
> > + * Return: %0 if successful, the first negative error code otherwise
> > + */
> > +int phy_bulk_power_off(unsigned int num_phys, struct phy_bulk_data *phys)
> > +{
> > +	int ret = 0;
> > +	int err;
> > +
> > +	while (num_phys--) {
> > +		err = phy_power_off(phys[num_phys].phy);
> > +		if (err && !ret)
> > +			ret = err;
> > +	}
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_bulk_power_off);
> > +
> >  /**
> >   * phy_create() - create a new phy
> >   * @dev: device that is creating the new phy
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index ea47975e288a..77d9d74682b7 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -81,6 +81,18 @@ union phy_configure_opts {
> >  	struct phy_configure_opts_hdmi		hdmi;
> >  };
> >  
> > +/**
> > + * struct phy_bulk_data - Data used for bulk phy operations.
> > + *
> > + * @id: phy consumer ID
> > + */
> > +struct phy_bulk_data {
> > +	const char	*id;
> > +
> > +	/* private: Internal use */
> > +	struct phy	*phy;
> > +};
> > +
> >  /**
> >   * struct phy_ops - set of function pointers for performing phy operations
> >   * @init: operation to be performed for initializing phy
> > @@ -309,6 +321,12 @@ void devm_of_phy_provider_unregister(struct device *dev,
> >  	struct phy_provider *phy_provider);
> >  int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
> >  void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
> > +
> > +int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys);
> > +int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys);
> > +int phy_bulk_power_on(unsigned int num_phys, struct phy_bulk_data *phys);
> > +int phy_bulk_power_off(unsigned int num_phys, struct phy_bulk_data *phys);
> > +
> >  #else
> >  static inline int phy_pm_runtime_get(struct phy *phy)
> >  {
> > @@ -493,6 +511,43 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
> >  	return ERR_PTR(-ENOSYS);
> >  }
> >  
> > +static inline int phy_bulk_check_disabled(unsigned int num_phys,
> > +					  struct phy_bulk_data *phys)
> > +{
> > +	if (!phys)
> > +		return 0;
> > +
> > +	for (unsigned int i = 0; i < num_phys; i++)
> > +		if (phys[i].phy)
> > +			return -EOPNOTSUPP;
> > +
> > +	return 0;
> > +}
> > +
> > +static inline int phy_bulk_init(unsigned int num_phys,
> > +				struct phy_bulk_data *phys)
> > +{
> > +	return phy_bulk_check_disabled(num_phys, phys);
> > +}
> > +
> > +static inline int phy_bulk_exit(unsigned int num_phys,
> > +				struct phy_bulk_data *phys)
> > +{
> > +	return phy_bulk_check_disabled(num_phys, phys);
> > +}
> > +
> > +static inline int phy_bulk_power_on(unsigned int num_phys,
> > +				    struct phy_bulk_data *phys)
> > +{
> > +	return phy_bulk_check_disabled(num_phys, phys);
> > +}
> > +
> > +static inline int phy_bulk_power_off(unsigned int num_phys,
> > +				     struct phy_bulk_data *phys)
> > +{
> > +	return phy_bulk_check_disabled(num_phys, phys);
> > +}
> > +
> >  static inline void of_phy_put(struct phy *phy)
> >  {
> >  }
> > -- 
> > 2.55.0
> 
> -- 
> ~Vinod
