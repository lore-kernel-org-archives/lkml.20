Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE5499F0E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436066; cv=none; b=XxEnoeRfvUH9wRfE9mwU52wkO1Jld4JUrNo4oS/glVDZmpGmqgkYOXKUf7T/HSnD1UIxMv7agWA7vofXi/1eaZ8IeLfvzqTIQAuDefbUuGkwGomoLULxeuyXAGrQEAUXXye2lM3fiVkClcr24BfnSYqpGJiQtRSwqS2W6naTZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436066; c=relaxed/simple;
	bh=+s2INz6KGsVUJjNjvbU1HzwMMGxHCop4VMaKJX3lZt8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JfvAprT5Bn60fLHNDIzSlIRiNdotIxXZwEJ2arRic6pdKEAJz4lyHcbnqWJUgRSzk6B26Y1MDkyYgSr07lAbwkxyGFQ3PT925H44c91M6lMc9sexNbWbLiJ5pf1hOQWZQMTcV+cVNwhFXLTvqbsKQ1j/JT78Uwd7GocevX5kkeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyCbimCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyCbimCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A231F00A3A;
	Thu,  3 Sep 2026 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788436058;
	bh=0Rq55btV07BKDLxPY8G973y+u9p8ZNSKyga4ctHIRVM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=SyCbimCTSlS8spIogrmOe+BiJEdC0pJ+ZoEzlh+rSPrQ/YMGYfAmGCY5ds4tOFd8T
	 GTo5qeCgaqdSqur9SZdUXyeldU3jjPQLOcXsHWMiiC5PAxDnHbku7lLhHlxFIRfQOw
	 lhITqWzltImtaZSD8g19qxmuIxoAUV7TonVGJ/FKCZAib+RSWPPXIle96aiGgUu6AF
	 IbwicfwLHNVhC+OZ6uZUt9N2tDLRP21/nyu3BMioiqfaDEPxaJ8u5WHt+3vBtubewQ
	 1lq71Iec3AMDllLgXOvvyhWkF5ds7/Hz+eg4EtbOZf6uXcA4PM6owvLBuZV/6WcdR3
	 ILfvs91gKBwoQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 33B821980050;
	Thu,  3 Sep 2026 07:47:36 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 03 Sep 2026 07:47:36 -0400
X-ME-Sender: <xms:Vl6ZakHfuVlMTqKqEmUpbNBeEyw1NYMQ9v9PTBZGykZBJWK1nkxwZg>
    <xme:Vl6ZaoJIMzyc9MyHfm1a_FddUqwu2VYmDEEvHZSmRYAGBpPcqLBNYHXbC77t5aYYD
    14bPI88B84PQmNMTZotnN0KG1L1KRITrFvH8w4fMQGgikX2tXOIdCBPiw>
X-ME-Proxy-Cause: dmFkZTEFo4PYYADGkmcQIrJJxvCUaHyG5yGOrn2WkhoAuaJ5cKcCCkoKLhj3QuivDwhMO/
    J7UcfuVhAvyS3QXICEmWxCd30eaTTzX6i4fadGMNDJk/sT2ib4ZZTTR6U0WWKwvV4tSen3
    SD7xVhm9RW2LYD8aTLwJ7CZ7nlP1/1ly1Ay0qYG7KIu4sW5rA2Qm7i1E8EvLIwVO8sIFPz
    3KDjNzLJdrRFfzoJpF7/GeAGHd0Ohnm04CSNl9H3EkcnmNtcrjU6wWmyUQNtSq4tP2GxQ/
    RFov2rSNt6xg3Tint9EoXiUGI1voG3Sch4jSF485lpna77dLg/4pLK25I8m8ZGC7iyCRd3
    eoiKZrHE/daRh6O5qzUFxW9zRr8QAF6ioLJEmCIzXZm/a1jmIcBzPzr1sLcpSybwxVW994
    mauB19nOu482WDPWtrmtjTtYPw7zSeMe/Ti0uYrqiD6AbqGTxBVxZ6mHOp5vkjXZ/DgTeK
    KRCyGh5zS/15GgsFaFVdqfTLG9UZxRloXSv2NfqJqQZY/+0ll/61iMRrOeFctd02nnYckk
    fEjI3isMYl6v+8tn6Q0tm0IP91HXlpbr2sOwl1t+IteuTKZ1CEa2bYWckkkVpxFCrD1y7p
    Cg4KixEEa9CWW1iAWf/9fRrTLWie+kTARoejg9IQwtDxjRSd3Ugkrc2itgVg
X-ME-Proxy: <xmx:WF6ZaqkvHDjK74g0P-sGJkhNiARDh1JGEpDn8YebYc_2TXY55sL7oA>
    <xmx:WF6Zasw_zkOfN3yQZVQXVhEHnSzXRqNy3JLj2MWXo521Qeli1aBU6Q>
    <xmx:WF6ZanroOvLX-y8-uoc5CWmxYyzxdY80m3cHeuZlMg02BgLp5AiW7w>
    <xmx:WF6Zaj6cOCsCdi3Z9u__RoTqjTD_gYHCjSUtlvfAylLHjA031xBY7w>
    <xmx:WF6ZamcW5vsxX_wsxfsL9tdn8uk-cRSALKpobJvoWMmYjabXEKA-Ta54>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D8EACF8007B; Thu,  3 Sep 2026 07:47:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 13:47:14 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Breno Leitao" <leitao@debian.org>,
 "sami.mujawar@arm.com" <Sami.Mujawar@arm.com>
Message-Id: <960e985e-b338-4648-a29b-1f8a31e00599@app.fastmail.com>
In-Reply-To: <20260903113238.2291844-1-yeoreum.yun@arm.com>
References: <20260903113238.2291844-1-yeoreum.yun@arm.com>
Subject: Re: [PATCH] firmware: efi: add a separate timeout for UpdateCapsule()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Yeoreum Yun,

On Thu, 3 Sep 2026, at 13:32, Yeoreum Yun wrote:
> On platforms that allows to update firmware in runtime, UpdateCapsule()
> may immediately write a firmware image to persistent storage.
> This operation can take longer than EFI_RTS_TIMEOUT.
>
> Use a separate timeout for the UpdateCapsule() runtime service. By
> default, wait indefinitely to avoid interrupting an ongoing firmware
> update. Administrators may configure an appropriate timeout, in seconds,
> through /sys/firmware/efi/capsule_update_timeout.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/firmware/efi/efi.c              | 41 +++++++++++++++++++++++++
>  drivers/firmware/efi/runtime-wrappers.c | 14 +++------
>  include/linux/efi.h                     | 10 ++++++
>  3 files changed, 55 insertions(+), 10 deletions(-)
>

Given that UpdateCapsule() is rarely used these days at runtime, I
wonder if we should just call it synchronously instead of via the
EFI workqueue.

I assume that would also solve the timeout issue?


> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index 0327a39d31fa..aef0ba170e3c 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -63,6 +63,18 @@ static unsigned long __initdata mem_reserve = 
> EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata rt_prop = EFI_INVALID_TABLE_ADDR;
>  static unsigned long __initdata initrd = EFI_INVALID_TABLE_ADDR;
> 
> +/*
> + * Depending on the platform, UpdateCapsule() may update the firmware
> + * immediately if the platform allows to update the firmware while in 
> runtime.
> + * In this case, writing the image to firmware storage may take longer 
> than
> + * EFI_RTS_TIMEOUT (120 seconds).
> + *
> + * To handle this, use a separate timeout for the UpdateCapsule() 
> runtime
> + * service. Wait indefinitely by default, and allow administrators to 
> set
> + * an appropriate timeout in seconds through 
> /sys/firmware/efi/capsule_update_timeout.
> + */
> +unsigned long efi_capsule_update_timeout = MAX_SCHEDULE_TIMEOUT;
> +
>  extern unsigned long primary_display_table;
> 
>  struct mm_struct efi_mm = {
> @@ -163,15 +175,44 @@ static ssize_t fw_platform_size_show(struct kobject *kobj,
>  	return sprintf(buf, "%d\n", efi_enabled(EFI_64BIT) ? 64 : 32);
>  }
> 
> +static ssize_t capsule_update_timeout_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%lu\n", efi_capsule_update_timeout / HZ);
> +}
> +
> +static ssize_t capsule_update_timeout_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	int ret;
> +	unsigned long secs, timeout;
> +
> +	ret = kstrtoul(buf, 0, &secs);
> +	if (ret)
> +		return ret;
> +	if (check_mul_overflow(secs, HZ, &timeout))
> +		timeout = MAX_SCHEDULE_TIMEOUT;
> +	if (timeout < EFI_RTS_TIMEOUT)
> +		timeout = EFI_RTS_TIMEOUT;
> +
> +	efi_capsule_update_timeout = timeout;
> +
> +	return count;
> +}
> +
>  extern __weak struct kobj_attribute efi_attr_fw_vendor;
>  extern __weak struct kobj_attribute efi_attr_runtime;
>  extern __weak struct kobj_attribute efi_attr_config_table;
>  static struct kobj_attribute efi_attr_fw_platform_size =
>  	__ATTR_RO(fw_platform_size);
> +static struct kobj_attribute efi_attr_capsule_update_timeout =
> +	__ATTR_RW_MODE(capsule_update_timeout, 0600);
> 
>  static struct attribute *efi_subsys_attrs[] = {
>  	&efi_attr_systab.attr,
>  	&efi_attr_fw_platform_size.attr,
> +	&efi_attr_capsule_update_timeout.attr,
>  	&efi_attr_fw_vendor.attr,
>  	&efi_attr_runtime.attr,
>  	&efi_attr_config_table.attr,
> diff --git a/drivers/firmware/efi/runtime-wrappers.c 
> b/drivers/firmware/efi/runtime-wrappers.c
> index 2344b9d1e81f..b0f867f828c1 100644
> --- a/drivers/firmware/efi/runtime-wrappers.c
> +++ b/drivers/firmware/efi/runtime-wrappers.c
> @@ -118,14 +118,6 @@ union efi_rts_args {
> 
>  struct efi_runtime_work efi_rts_work;
> 
> -/*
> - * Upper bound on how long we wait for a single EFI runtime service
> - * call to finish before declaring firmware wedged. Chosen to be longer
> - * than any plausible legitimate call (including UpdateCapsule on slow
> - * SPI-NOR) while still bounding userspace wait time.
> - */
> -#define EFI_RTS_TIMEOUT		(120 * HZ)
> -
>  /*
>   * efi_queue_work:	Queue EFI runtime service call and wait for completion
>   * @_rts:		EFI runtime service function identifier
> @@ -347,6 +339,8 @@ static void __nocfi efi_call_rts(struct work_struct *work)
>  static efi_status_t __efi_queue_work(enum efi_rts_ids id,
>  				     union efi_rts_args *args)
>  {
> +	unsigned long timeout;
> +
>  	if (!efi_enabled(EFI_RUNTIME_SERVICES)) {
>  		pr_warn_once("EFI Runtime Services are disabled!\n");
>  		return EFI_DEVICE_ERROR;
> @@ -369,8 +363,8 @@ static efi_status_t __efi_queue_work(enum efi_rts_ids id,
>  		goto exit;
>  	}
> 
> -	if (!wait_for_completion_timeout(&efi_rts_work.efi_rts_comp,
> -					 EFI_RTS_TIMEOUT)) {
> +	timeout = (id == EFI_UPDATE_CAPSULE) ? efi_capsule_update_timeout : 
> EFI_RTS_TIMEOUT;
> +	if (!wait_for_completion_timeout(&efi_rts_work.efi_rts_comp, 
> timeout)) {
>  		pr_err("EFI runtime service %d wedged in firmware; disabling EFI 
> runtime services\n",
>  		       id);
>  		clear_bit(EFI_RUNTIME_SERVICES, &efi.flags);
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index aa15ff88539b..8e14ca5e57de 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -1345,4 +1345,14 @@ extern struct blocking_notifier_head 
> efivar_ops_nh;
>  void efivars_generic_ops_register(void);
>  void efivars_generic_ops_unregister(void);
> 
> +/*
> + * Upper bound on how long we wait for a single EFI runtime service
> + * call to finish before declaring firmware wedged. Chosen to be longer
> + * than any plausible legitimate call (excluding UpdateCapsule() while
> + * still bounding userspace wait time.
> + */
> +#define EFI_RTS_TIMEOUT		(120 * HZ)
> +
> +extern unsigned long efi_capsule_update_timeout;
> +
>  #endif /* _LINUX_EFI_H */
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
