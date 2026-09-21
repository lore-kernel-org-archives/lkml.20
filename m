Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5A0499F25;
	Mon, 21 Sep 2026 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006649; cv=none; b=b9mbDF1mqQ7r93C7n2QhvK+0aKsu+N3CCy6vhE0CSIp30gjcANdRASGyRXwhRY5+720E7EozSs1jkqn+R6F0zyDKr1+ZiSwn/JS0YEEdH0HyF8ANTvwpKXrnDxtc00dm8CkKzSwQi9meDrmNvBOlOA8Mxgmby6Yydvlm8yDaklU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006649; c=relaxed/simple;
	bh=WxHKmuPlyqXl5ZLFByhGHztObAVNEI+Mzf2YcIgIkWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbN7ut1V1WZJ7lUul6PE14ZJxo59bZ6GTAqZqXxkChNC4zMWlGAoNUjEOnW2F+IJmmdv9h2bor25DADWBnYuLtsRgzo20RUfUXekETiM5C9gkM6botj7Ud8fVW0Yx18d8zNwMCjMalE0ntZ9ytxRGTPXaP+6W/RODEAbXiDAX8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiPeRDXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiPeRDXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682771F000FF;
	Mon, 21 Sep 2026 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006647;
	bh=PJtudqNQATXSC5gOLqR15Av+yGq1Ilm01aKR2BkHfvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kiPeRDXqlsBGX8xSWU0uaG1b198NJqe5Z2Q8ky1rgKCeE0iKEezdR+vsfxtNkMmTW
	 0OBmRPNYrZ2vgX1fpigDEPU7MJaU7SUPl7xDwMYfM6UZznny8oCiF1YzAAqxDLJYu7
	 JwwQD05sp4tMF/xSQh1uOLXEc0VyqDx0tWfCg6zuaG+0zCTiL0qEbuLCyfKomyWfeh
	 5Wjcn6n1TWPj0MfqliJLAvJFN2WWfSHWZhVYge45AN+hQ9Xad7UHkJQHuZev9cqosm
	 sO4SXBapQesg3uchrFN2ovdsJe4vchgXNdEeebXtwF4Yp8ET1I9veJd3H+hMYpQy7/
	 PuBeUTfmW662w==
Date: Mon, 21 Sep 2026 17:04:03 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/8] firmware: smccc: lfa: Register ACPI notification
Message-ID: <20260921-smiling-rare-salamander-6c442d@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-5-andre.przywara@arm.com>

On Fri, Sep 18, 2026 at 04:11:07PM +0200, Andre Przywara wrote:
> From: Vedashree Vidwans <vvidwans@nvidia.com>
> 
> The Arm LFA spec describes an ACPI notification mechanism, where the
> platform (firmware) can notify an LFA client about newly available
> firmware imag updates ("pending images" in LFA terms).
> 
> Add a faux device after discovering the existence of an LFA agent via
> the SMCCC discovery mechnism, and use that device to check for the ACPI
> notification description. Register this when one is provided.
> 
> The notification just conveys the fact that at least one firmware image
> has now a pending update, it doesn't say which, also there could be more
> than one pending. Loop through all images to find every which needs to
> be activated, and trigger the activation. We need to do this is a loop,
> since an activation might change the number and the status of available
> images.
> 
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> [Andre: convert from platform driver to smccc bus]
> Signed-off-by: Andre Przywara <andre.przywar@arm.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 122 +++++++++++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index b6ce478d3fc01..bb89fffde6856 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -3,12 +3,14 @@
>   * Copyright (C) 2025 Arm Limited
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/arm-smccc-bus.h>
>  #include <linux/array_size.h>
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/init.h>
> +#include <linux/kernel.h>
>  #include <linux/kobject.h>
>  #include <linux/ktime.h>
>  #include <linux/list.h>
> @@ -18,11 +20,13 @@
>  #include <linux/stop_machine.h>
>  #include <linux/string.h>
>  #include <linux/sysfs.h>
> +#include <linux/types.h>
>  #include <linux/uuid.h>
>  #include <linux/workqueue.h>
>  
>  #include <uapi/linux/psci.h>
>  
> +#define DRIVER_NAME	"ARM_LFA"
>  #undef pr_fmt
>  #define pr_fmt(fmt) "Arm LFA: " fmt
>  
> @@ -733,6 +737,112 @@ static int update_fw_images_tree(void)
>  	return 0;
>  }
>  
> +/*
> + * Go through all FW images in a loop and trigger activation
> + * of all activatible and pending images.
> + * We have to restart enumeration after every triggered activation,
> + * since the firmware images might have changed during the activation.
> + */
> +static int activate_pending_image(void)
> +{
> +	struct kobject *kobj;
> +	bool found_pending = false;
> +	struct fw_image *image;
> +	int ret;
> +
> +	spin_lock(&lfa_kset->list_lock);
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {
> +		image = kobj_to_fw_image(kobj);
> +
> +		if (image->fw_seq_id == -1)
> +			continue; /* Invalid FW component */
> +
> +		update_fw_image_pending(image);
> +		if (image->activation_capable && image->activation_pending) {
> +			found_pending = true;
> +			break;
> +		}
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +
> +	if (!found_pending)
> +		return -ENOENT;
> +
> +	ret = prime_fw_image(image);
> +	if (ret)
> +		return ret;
>
> +	ret = activate_fw_image(image);
> +	if (ret)
> +		return ret;
> +
> +	pr_info("%s: automatic activation succeeded\n", get_image_name(image));
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_ACPI
> +static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void *data)
> +{
> +	int ret;
> +

DEN0147, Appendix "LFA updates", assigns notification value 0x80 to new
LFA updates. The handler should ignore all events other than 0x80 before
attempting automatic activation.

> +	while (!(ret = activate_pending_image()))
> +		;

Some timeout mechanism needed ? Otherwise can we loop for ever if there is
a firmware bug ?

> +
> +	if (ret != -ENOENT)
> +		pr_warn("notified image activation failed: %d\n", ret);
> +}
> +
> +static int lfa_register_acpi(struct device *dev)
> +{
> +	struct acpi_device *acpi_dev;
> +	acpi_handle handle;
> +	acpi_status status;
> +
> +	acpi_dev = acpi_dev_get_first_match_dev("ARML0003", NULL, -1);
> +	if (!acpi_dev)
> +		return -ENODEV;
> +	handle = acpi_device_handle(acpi_dev);
> +	if (!handle) {
> +		acpi_dev_put(acpi_dev);
> +		return -ENODEV;
> +	}
> +
> +	/* Register notify handler that indicates LFA updates are available */
> +	status = acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,
> +					     lfa_acpi_notify_handler, NULL);
> +	if (ACPI_FAILURE(status)) {
> +		acpi_dev_put(acpi_dev);
> +		return -EIO;
> +	}
> +
> +	ACPI_COMPANION_SET(dev, acpi_dev);
> +
> +	return 0;
> +}
> +
> +static void lfa_remove_acpi(struct device *dev)
> +{
> +	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
> +	acpi_handle handle = acpi_device_handle(acpi_dev);
> +
> +	if (handle)
> +		acpi_remove_notify_handler(handle,
> +					   ACPI_DEVICE_NOTIFY,
> +					   lfa_acpi_notify_handler);
> +	acpi_dev_put(acpi_dev);
> +}
> +#else	/* !CONFIG_ACPI */
> +static int lfa_register_acpi(struct device *dev)
> +{
> +	return -ENODEV;
> +}
> +
> +static void lfa_remove_acpi(struct device *dev)
> +{
> +}
> +#endif
> +
>  static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>  {
>  	struct arm_smccc_1_2_regs reg = { 0 };
> @@ -769,11 +879,21 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>  		destroy_workqueue(fw_images_update_wq);
>  	}
>  
Looks like if update_fw_images_tree() failed, the kset and workqueue will be
destroyed. The ACPI init below overwrites err, and both a successful
registration and -ENODEV reach return 0(not sure if that is expected).
Driver removal or a later notification or any activity will then use
the destroyed global objects happily.

> -	return err;
> +	if (!acpi_disabled) {
> +		err = lfa_register_acpi(&sdev->dev);

There is also no cleanup when lfa_register_acpi() returns another error after
inventory setup succeeded. The probe needs some unwind path that returns
the original enumeration error and releases the kset and workqueue on every
later probe failure. How come the LLMs have not pointed out these issues
already ? I see sashiko is unable to review this because of the way you have
expressed the dependency. Or make SMCCC patches part of the series for review
purposes.

-- 
Regards,
Sudeep
