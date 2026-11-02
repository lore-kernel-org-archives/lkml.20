Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637148;
	b=5m1/tvnaWUkrfPIx5e+2a/jtrrivznDEitZzaXpTXAb5zvOHMGtCx14sxq0gj/fXpt/G
	 y69twPMcnt3TpBtSZwAr+EN3s1Dz0sSmLWK/ieRmukvu/rtliIRp1WwD3WXM1heqy7vGq
	 Lc+JxBL4XMLQnTZrEJBIg3nRD13O9Uf/hy4vURG/6hSmDKAbqDPenLVXcZjrWQ9xTFZt4
	 WfNDM2nVWa4sgCbrhwd/vnzofKyhtFzE9I5ydkYXL9XgasBcf7l9d4/cqO7c4+tdzetxx
	 nVKByZQ126YBGQ+1bUTKKjI09Z0hYOwdQ28975OTqXkTw9RMtSjRMdc8g3dp0kItqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637148;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nPU/b/fRrGFWjTF7wyffZ8NB+VPLw6oTBV3Tou13Kjk=;
	b=0Lye/CS2IShGovWlHX62vjfdqVD7fmu3Fk60sUNRsTwDmb0eo5SPau3fsHtBRzE/733/
	 WWp1iog2rGuVN50HIfHgWPsvvGMPpnYYNY+tZ3cUy70qNhwGpWDvpBvni5WAmnv8wdL2s
	 KzRb+qwff21ZfgjqTYJK6/89ckWKMe8D5epAmnO0LwVFmp4aXMZsjeVaVJ8EgxxaE70i7
	 /3CKuBaoDWKi4CArLREmXN1rJvQSA8cxRSlA0xoiZV4ZcEmi1G2Wst2RksC+lYABMnNMO
	 NL3AqUlTKMkMgysxurWGzVfLCtkVLuU845z/BkNbvvceJeFabsiTMtovzxdqXZ7ZnhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gz4AbbDz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZoskNSoX;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE46072C4D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CE46072C4D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gz4AbbDz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZoskNSoX
Date: Mon, 2 Nov 2026 17:32:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793637145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPU/b/fRrGFWjTF7wyffZ8NB+VPLw6oTBV3Tou13Kjk=;
	b=Gz4AbbDzmFTUeKb+PI/scrv/zERqv9qLJs7cTD7S3OIgnXufwqmdnN3iKi4PcM4SBUgGX8
	UtoedaI7ms+aqqgeGgaOwkuaM9oZPK1lAyLZ6lQGZWiTwYQuUTyyoDbbxPWcdUvwlimDMM
	nKuLkgIQwbjOv/HntyT94oCvnYfjMGyG9hyAxFU3pvoE33erUhjWen46AI+gKZglTluvqH
	l07HR2MsG1L1qGp2HisKbq+oqi0sKfcBaQwe8Jxb4y4/WHCaY0Klpv1L8NEWSXNo9pIF6d
	xZfu3WkS+hZ1OGza0VfSell/3biHiXfUPyIrULIq7Zxfr0YpHfhlvCFO8bG3XA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793637145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPU/b/fRrGFWjTF7wyffZ8NB+VPLw6oTBV3Tou13Kjk=;
	b=ZoskNSoX7Zkzpqco8O3SZSFK670KaNvvzb/nguzZGQ/JTzhhn+43jzf2QQUP5q9Kddgtra
	/dFG6WtLnwEglODA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Palmer <daniel@0x0f.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/powermac: Always close the timebase-sync i2c bus
Message-ID: <20261102163223.qV85cD1R@linutronix.de>
References: <20261030232418.1145779-1-daniel@0x0f.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030232418.1145779-1-daniel@0x0f.com>

On 2026-10-31 08:24:18 [+0900], Daniel Palmer wrote:
> smp_core99_cpu_prepare() opens an i2c bus for "tb sync" and that is
> closed again in smp_core99_cpu_online().
> 
> If a processor module is dysfunctional, not seated correctly or
> otherwise fails to come online smp_core99_cpu_online() is not called
> and the bus stays open.
> 
> On some G5s (tested PowerMac7,3) this i2c bus also has the CPU
> temperature sensor and fan controller connected to it so not closing
> the bus stops the kernel from making sure the working CPU doesn't
> roast itself to death.
> 
> Rename smp_core99_cpu_online() to smp_core99_cpu_online_prepare_down()
> and wire it up to get called when onlining fails as well so the
> bus is closed and the working CPU stays working.

"and the I2C bus remains accessible by the i2c-driver."

The `smp_core99_host_open' makes sure it does not get closed twice so
that works.

> Fixes: 68e694dcef24 ("powerpc/powermac: Convert to hotplug state machine")

So the old CPU_UP_CANCELED case would have close it and I forgot to copy
that part.

> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  arch/powerpc/platforms/powermac/smp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
> index 88e92af8acf9..e310b6fbbede 100644
> --- a/arch/powerpc/platforms/powermac/smp.c
> +++ b/arch/powerpc/platforms/powermac/smp.c
> @@ -865,7 +865,7 @@ static int smp_core99_cpu_prepare(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int smp_core99_cpu_online(unsigned int cpu)
> +static int smp_core99_cpu_online_prepare_down(unsigned int cpu)
>  {
>  	/* Close i2c bus if it was used for tb sync */
>  	if (pmac_tb_clock_chip_host && smp_core99_host_open) {
> @@ -893,9 +893,9 @@ static void __init smp_core99_bringup_done(void)
>  #ifdef CONFIG_HOTPLUG_CPU
>  	cpuhp_setup_state_nocalls(CPUHP_POWERPC_PMAC_PREPARE,
>  				  "powerpc/pmac:prepare", smp_core99_cpu_prepare,
> -				  NULL);
> +				  smp_core99_cpu_online_prepare_down);
>  	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "powerpc/pmac:online",
> -				  smp_core99_cpu_online, NULL);
> +				  smp_core99_cpu_online_prepare_down, NULL);

I don't think it is needed to rename the function as such.  OpenBUS/
CloseBUS would be more matching than to the sate it runs in me think.
But it is not my call. For the "adding the function to the prepare
notifier" part:

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

>  #endif
>  
>  	if (ppc_md.progress)

Sebastian
