Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614385;
	b=R3Rrgnd4HveH/nUkjAA4aMhKtTAV9ga4yRGK7UcyQ9g1UyBaUq882jW5dkP9u2NDtWyF
	 3vooysxv7pokNjaHXBz13KvwnELfPYa/hIJ+n3DzDesjPXnr5X8AUlrGcEPyHSbjyQCSl
	 M9a25bitaFHYs6jSf/DwldsEt0BDC6fF7jmgxCFYRZ/nwvvuubuM3hwJo1blp/oZZ9oQk
	 QU8e6KFC8n95BMcK+kMwEeJYhfpT+A/WKV8V1wsuP9G7lzTD2t18ec2H/1E7C7+9lGkXx
	 QCLPEwYLdpYqC83Gl19T3oVdOvz1VJ/C+DOBq1M2hTPa0mWiUzT8pcXUtfqrqlmyizA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=C/rEuinMCfbUrXPWZJGbZBm6SE6/AvXvnmCXC2u+vkI=;
	b=MTopGyR1Pm2QNshT5Cu5/pTyMPPP8o8BOAOVUQZW2Sl19/HquTv6YzE2X0zWzVOMSbC0
	 kGZ8kTARw+pATWDLq/IrO/Ua5upr+fLThcTemlrGxo6+7hiUJftsdATh9SsMfEYhQupg6
	 duAT4wHhCMRilHfc4Hz78fLgihoiYUbz5EnDmlE61UtJdvju0vtkpXtwImNp0lLyJGsV9
	 uSqmHV4/8InFV1QuWXtVZbWRT5QNMJrpFyfZhxLuQ5xJK54BZplLjfCJrUcvrp3YUqE8y
	 pUjH9ZAoOmIIOiwAi9umaHqVHFiMaTzA9uaF3MetQZd8/Q9aFRPdlLDAIv0nhdE4WAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asncqXBl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C420E606A334;
	Mon,  2 Nov 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asncqXBl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AA81F0093A;
	Mon,  2 Nov 2026 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614384;
	bh=C/rEuinMCfbUrXPWZJGbZBm6SE6/AvXvnmCXC2u+vkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asncqXBlegDWEwCbD6PaXtPtQsNKAqjrkIKsLqMX1ZfPlLb3jdvIMYu0cPqXvrAWn
	 sA5KZfFiXMSq2iWOkKDZyMFzttewzenYvU90UP5v4vhFSYWDSBOCYa5U/+RM049UWv
	 k9kd3MvD7vsB3ke8BVj9bv4C6msCZ1OoR4h9lY5teE56xDECXWpjwskSV9URXtyaQU
	 lk/i3okYymeZqrLG63RsvOhaqR+uyhYhm/KVBZMuoKGmDP0Ycs01qf3gRJPj2Gqpkg
	 Xw94ilnGWvUhozS3k/aackHEZ4JUorHGVEBOEZItoPeEp+HLR5/DrScbwpXnDd6HJt
	 WySZphCC5fwHA==
Date: Mon, 2 Nov 2026 10:13:01 +0000
From: Lee Jones <lee@kernel.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: ejona86@gmail.com, mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical
 section
Message-ID: <20261102101301.GC13023@google.com>
References: <20261029192223.462367-1-paskripkin@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029192223.462367-1-paskripkin@gmail.com>

Nit for when you resubmit this.

The subject line does not match the expected format for the subsystem.

<end>

On Thu, 29 Oct 2026, Pavel Skripkin wrote:

> SPI does not support atomic transfers, so it's dangerous to call from
> atomic notif chains, since it can cause stall during reboot on
> orangepi5 (see trace below).
> 
> Commit 128115b520c6 ("mfd: rk8xx: Register poweroff handler in atomic phase")
> moved shutdown methods to atomic notif chain, since i2c transfer didn't
> work during PREPARE step. I don't have an access to rk3288 based boards and
> patch reasoning is not completely clear.
> 
> That's why this patch hacks notifier registration only for SPI based
> PMICs.
> 
> 66.145226] reboot: Power down
> [  266.145581] ------------[ cut here ]------------
> [  266.145986] Voluntary context switch within RCU read-side critical section!
> [  266.146007] WARNING: kernel/rcu/tree_plugin.h:330 at rcu_note_context_switch+0x3dc/0x5d8, CPU#0: systemd-shutdow/1
> [  266.147525] Modules linked in:
> [  266.147800] CPU: 0 UID: 0 PID: 1 Comm: systemd-shutdow Not tainted 7.3.0-opi5-test+ #2 PREEMPT
> [  266.148560] Hardware name: Xunlong Orange Pi 5 (DT)
> [  266.148987] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  266.149596] pc : rcu_note_context_switch+0x3dc/0x5d8
> [  266.150034] lr : rcu_note_context_switch+0x3dc/0x5d8
> [  266.150472] sp : ffff80008005b4e0
> [  266.150764] x29: ffff80008005b4e0 x28: ffff000100903000 x27: ffffc7018d616000
> [  266.151393] x26: 0000c4fe4deb68c0 x25: ffffc7018d639260 x24: 0000000000000000
> [  266.152021] x23: ffff000100903000 x22: ffff0002fee4ef80 x21: ffffc7018d616f80
> [  266.152649] x20: 0000000000000000 x19: ffff000100903000 x18: 0000000000000000
> [  266.153277] x17: ffff80008005b8b8 x16: 0000000000000000 x15: 0000000000000000
> [  266.153904] x14: 0000000000000a37 x13: ffffc7018d82a478 x12: ffff390171838000
> [  266.154532] x11: ffff0002fee3a198 x10: 0000000000000001 x9 : ffffc7018d6642d0
> [  266.155161] x8 : 0000000100000001 x7 : 0000000000000000 x6 : 7261746e756c6f56
> [  266.155789] x5 : ffffc7018d93e807 x4 : ffffc7018cd48369 x3 : ffff80008005b058
> [  266.156416] x2 : 00000000000002a8 x1 : 0000000000000001 x0 : 000000000000003f
> [  266.157044] Call trace:
> [  266.157262]  rcu_note_context_switch+0x3dc/0x5d8 (P)
> [  266.157703]  __schedule+0x80/0x1540
> [  266.158015]  schedule+0x5c/0xe0
> [  266.158296]  schedule_timeout+0x7c/0xe8
> [  266.158636]  wait_for_common+0xbc/0x188
> [  266.158977]  wait_for_completion_timeout+0x1c/0x30
> [  266.159401]  spi_transfer_one_message+0x2c0/0x838
> [  266.159819]  __spi_pump_transfer_message+0x1f0/0x448
> [  266.160258]  __spi_sync+0x224/0x450
> [  266.160569]  spi_write_then_read+0x134/0x1b8
> [  266.160947]  rk806_spi_bus_read+0x4c/0x70
> [  266.161304]  _regmap_raw_read+0x1a0/0x368
> [  266.161661]  _regmap_bus_read+0x48/0x88
> [  266.162001]  _regmap_read+0x17c/0x260
> [  266.162326]  _regmap_update_bits+0x7c/0x138
> [  266.162696]  regmap_update_bits_base+0x6c/0xa8
> [  266.163089]  rk808_power_off+0xec/0x120
> [  266.163429]  sys_off_notify+0x34/0x50
> [  266.163756]  atomic_notifier_call_chain+0x78/0x170
> [  266.164178]  do_kernel_power_off+0xf0/0x170
> [  266.164549]  machine_power_off+0x20/0x38
> [  266.164900]  kernel_power_off+0xf4/0x110
> [  266.165248]  __arm64_sys_reboot+0x27c/0x290
> [  266.165619]  invoke_syscall+0x4c/0xf8
> [  266.165944]  el0_svc_common+0x94/0xe8
> [  266.166268]  do_el0_svc+0x24/0x38
> [  266.166562]  el0_svc+0x34/0x90
> [  266.166833]  el0t_64_sync_handler+0x68/0xe0
> [  266.167203]  el0t_64_sync+0x17c/0x180
> [  266.167528] ---[ end trace 0000000000000000 ]---
> 
> CC: Eric Anderson <ejona86@gmail.com>
> Fixes: 128115b520c6 ("mfd: rk8xx: Register poweroff handler in atomic phase")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
> 
> Hey Eric!
> 
> I don't have rk3288 board to test. However, I strongly suspect that
> patch does not affect your case.
> 
> I've tried to track down root cause of i2c hung, but no luck. Based on
> FDT i2c is directly connected to GIC, so IRQs must be enabled during
> PREPARE step.
> 
> Would be great if you test that patch.
> 
> ---
>  drivers/mfd/rk8xx-core.c  | 19 ++++++++++++++++---
>  drivers/mfd/rk8xx-i2c.c   |  2 +-
>  drivers/mfd/rk8xx-spi.c   |  2 +-
>  include/linux/mfd/rk808.h |  2 +-
>  4 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 21182df45d1b..c4c5907c9fcd 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -761,7 +761,7 @@ void rk8xx_shutdown(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(rk8xx_shutdown);
>  
> -int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap)
> +int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap, bool spi)
>  {
>  	struct rk808 *rk808;
>  	const struct rk808_reg_data *pre_init_reg;
> @@ -874,8 +874,21 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  
>  	if (device_property_read_bool(dev, "system-power-controller") ||
>  	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
> +		/* There is no support for atomic SPI transfers (yet?). Thus it's not possible to
> +		 * perform SPI i/o during atomic notify handler.
> +		 *
> +		 * Patch 128115b520c6 claims that i2c does not work during _PREPARE state, so be
> +		 * extra careful while changing modes here.
> +		 */
> +		enum sys_off_mode off_mode =
> +			spi ? SYS_OFF_MODE_POWER_OFF_PREPARE :
> +			      SYS_OFF_MODE_POWER_OFF;
> +		enum sys_off_mode restart_mode =
> +			spi ? SYS_OFF_MODE_RESTART_PREPARE :
> +			      SYS_OFF_MODE_RESTART;
> +
>  		ret = devm_register_sys_off_handler(dev,
> -				    SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_HIGH,
> +				    off_mode, SYS_OFF_PRIO_HIGH,
>  				    &rk808_power_off, rk808);
>  		if (ret)
>  			return dev_err_probe(dev, ret,
> @@ -885,7 +898,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  		case RK809_ID:
>  		case RK817_ID:
>  			ret = devm_register_sys_off_handler(dev,
> -							    SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
> +							    restart_mode, SYS_OFF_PRIO_HIGH,
>  							    &rk808_restart, rk808);
>  			if (ret)
>  				dev_warn(dev, "failed to register rst handler, %d\n", ret);
> diff --git a/drivers/mfd/rk8xx-i2c.c b/drivers/mfd/rk8xx-i2c.c
> index 161b25fbe146..f6e137ba394f 100644
> --- a/drivers/mfd/rk8xx-i2c.c
> +++ b/drivers/mfd/rk8xx-i2c.c
> @@ -243,7 +243,7 @@ static int rk8xx_i2c_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, PTR_ERR(regmap),
>  				     "regmap initialization failed\n");
>  
> -	return rk8xx_probe(&client->dev, data->variant, client->irq, regmap);
> +	return rk8xx_probe(&client->dev, data->variant, client->irq, regmap, false);
>  }
>  
>  static void rk8xx_i2c_shutdown(struct i2c_client *client)
> diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
> index bb85fe60518f..fba4b0582c8b 100644
> --- a/drivers/mfd/rk8xx-spi.c
> +++ b/drivers/mfd/rk8xx-spi.c
> @@ -94,7 +94,7 @@ static int rk8xx_spi_probe(struct spi_device *spi)
>  		return dev_err_probe(&spi->dev, PTR_ERR(regmap),
>  				     "Failed to init regmap\n");
>  
> -	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap);
> +	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap, true);
>  }
>  
>  static const struct of_device_id rk8xx_spi_of_match[] = {
> diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
> index 7ffc904c864c..c55aa2effd18 100644
> --- a/include/linux/mfd/rk808.h
> +++ b/include/linux/mfd/rk808.h
> @@ -1469,7 +1469,7 @@ struct rk808 {
>  };
>  
>  void rk8xx_shutdown(struct device *dev);
> -int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap);
> +int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap, bool spi);
>  int rk8xx_suspend(struct device *dev);
>  int rk8xx_resume(struct device *dev);
>  
> -- 
> 2.55.0
> 

-- 
Lee Jones
