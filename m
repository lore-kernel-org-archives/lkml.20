Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604134848AC;
	Mon, 19 Oct 2026 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403324; cv=none; b=BLLInjKfwVOXzQdPP4BuX/4ik7ui+CTV5FWm8FjzfdbLuxg+DfC0qJNphk8C0rhemvk3mLePimHDcFbtawT2REkIoxrFJEOOBPFsxz4iHHl9hK9clmu6QrkdCxhULXmPtykY9o0Km51WCGtTWLOBOrh2iFtPc1C2h/Nh4V2SSmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403324; c=relaxed/simple;
	bh=y38c6Wh+JrRWNLBK/e115pdKqMSFQP0EX+kdXPPe+yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0oAIzdYwIREFI9QCKmTXAGlHrbyB0hY7DvPdFUI/QndrCmpvM/OohhYfhKOH433b+EnOy013ejowU9Xj63uoENF5cW0G7KMnuw3a2CPnpx7ApcO0aGRjxc4dVvHv/u5YtEN/pLi+hJWRwGbVrlGOQ0rdU7OE9Yce4cINam0D5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUVqNXuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUVqNXuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD83F1F000C4;
	Mon, 19 Oct 2026 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403323;
	bh=kxYpOKeNE1GtVJhZEKyHa5DQN9VTfVaw7R5GeyyShr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUVqNXuhw67wpa517IY0Ef+gOzCTXJ9z1qfR4Gv4/xhOdzusCmOvJA82ZVuskQbq6
	 a8z2NHGfBT2msPVz1fYsqVrThrWLS2M+za1Au2Rn0bVNv4bXdoshiw2oB+2LTq1dYd
	 bsU55W/HjQdKjERA/34g/zOUFrvZsN8NRKs0w0dtkuGtOLEKcB7ozGIHz8abA2YIMg
	 /g/bsloLYWA9WdusRAOlKTL3GKa1JknAnfkp7THoN16OAGbgOpJg4NlM27baLp3Czc
	 fydllsmnjtJqd6p3Sq4geid0d7rpA0T/IUhbpQiA5uYJ+Aoe/5K466zpyDt4qGZYTt
	 mxT7ECqLVpkpQ==
Date: Mon, 19 Oct 2026 11:48:39 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation
 producers
Message-ID: <atXYWrNAI5pmyMHD@solitude>
References: <20261016013918.3492835-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016013918.3492835-1-mhun512@gmail.com>

Acked-by: Marek Behún <kabel@kernel.org>

This makes sense.

But I wonder whether the devm_delayed_work_drop() from devm-helpers.h
should not be changed to use disable_delayed_work_sync() instead of
cancel_delayed_work_sync().

In this case the initialization function in devm-helpers should be called
devm_delayed_work_autodisable() instead of devm_delayed_work_autocancel(),
though.

On Thu, Oct 15, 2026 at 09:39:18PM -0400, Myeonghun Pak wrote:
> The legacy MCU IRQ thread can requeue button-release emulation work
> after its managed cleanup has canceled it. Since the IRQ is still active
> at that point, the newly queued work can outlive device teardown and
> access freed MCU state.
> 
> Use disable_delayed_work_sync() to prevent further queueing and drain
> the worker before the IRQ action is released. Keep the parent IRQ active
> while the worker completes. devm_add_action_or_reset() also drains the
> work if action registration fails.
> 
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
> 
> Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> index 4e430d6c3fc4..8f43bfa92373 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> @@ -11,7 +11,6 @@
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
>  #include <linux/device.h>
> -#include <linux/devm-helpers.h>
>  #include <linux/errno.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> @@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_struct *work)
>  	generic_handle_irq_safe(mcu->client->irq);
>  }
>  
> +static void omnia_disable_button_release_work(void *data)
> +{
> +	struct delayed_work *work = data;
> +
> +	/*
> +	 * The IRQ thread may requeue this work while the IRQ remains active.
> +	 * Disable and drain it before releasing the IRQ action and the MCU
> +	 * state used by the worker.
> +	 */
> +	disable_delayed_work_sync(work);
> +}
> +
>  static void
>  fill_int_from_sts(unsigned long *rising, unsigned long *falling,
>  		  unsigned long rising_sts, unsigned long falling_sts,
> @@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
>  		return dev_err_probe(dev, err, "Cannot request IRQ\n");
>  
>  	if (!new_api) {
> -		/*
> -		 * The button_release_emul_work has to be initialized before the
> -		 * thread is requested, and on driver remove it needs to be
> -		 * canceled before the thread is freed. Therefore we can't use
> -		 * devm_delayed_work_autocancel() directly, because the order
> -		 *   devm_delayed_work_autocancel();
> -		 *   devm_request_threaded_irq();
> -		 * would cause improper release order:
> -		 *   free_irq();
> -		 *   cancel_delayed_work_sync();
> -		 * Instead we first initialize the work above, and only now
> -		 * after IRQ is requested we add the work devm action.
> -		 */
> -		err = devm_add_action(dev, devm_delayed_work_drop,
> -				      &mcu->button_release_emul_work);
> +		err = devm_add_action_or_reset(dev,
> +					       omnia_disable_button_release_work,
> +					       &mcu->button_release_emul_work);
>  		if (err)
>  			return err;
>  	}
