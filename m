Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477968;
	b=v8f/nhd8mqyrLODfl/v8AjrDjkQp5rDqHQHsdq4+oUj171HEE+lyyCmkoSFhoVTb9qL8
	 4fHKep0oE9j2+3opQPpNf4/B3WDnjW5RxWOt41QmK/P4h7voWxUeVH9nzT33C92Q2Nxbx
	 eVntnSFxx0EgVOmXh0CUBfQRE24gJtGEmi2AlHm0Mi8j5TcJ6QQcBWlNPeMm0y71Ovhn9
	 AiHyowJlWuTpjftg4f/UdyW8dpUU+p+GqV2Ts6CeG26d51GA5Z8+TCV8mE81AHInejuGI
	 mD25/g6vNk3LGBg50BeIIcoZlGYMHm3uxYjylk+4Z7VKYsVmAHXhipboh09dQanDIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=KwqEOHogSWf29GMTvbcaDBvWnXtsNEWUuQTRLlnKv3Q=;
	b=hota5Qr4tqq1MOdtjs3SZ/FFPTpVUFH564hv/ODZ8ZMVknzUUQ+SUWLUK6NK6gDQ3I6q
	 f0mIOvb7M5y+ZXkAnzO/YXR92xCyEJ6sGM23m4lEHP4XmL+6DeBBPy61JmF8RzcTl9dAp
	 gJXaFPLaTVm7hAurVeTFnurjJbGj1ygLljgRXOqUZUMoPU/0fMCdz3WxVjT2TntdXnCdM
	 AwDnoEUWJsBKagEvFDlDCnQ5wCQZWjJ773ApriV6HWyafk23hMEVYCFXJOTetBMKdbNbw
	 1oMqMigexsDfvaZNVKsukd36inSQF/iNffHhp7mwmbFc3a0XjRN71p9kFKICKlAxzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kUkHdNHq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AC606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kUkHdNHq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA01F00A05;
	Thu, 12 Nov 2026 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477967;
	bh=KwqEOHogSWf29GMTvbcaDBvWnXtsNEWUuQTRLlnKv3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUkHdNHqa/8UOtYlysZtF0KFLAjhEFo/5to8EELIoPLiwm6VmR3IIA260N8CNGaky
	 KkDiBeU3h0Nn2vYbZPllEeda3T6N5g11mPKNl/1Jb5vHSVIqfbsY0d/b08Ry7r0LvB
	 T1T6TACqDbRtokbhdJvctY+41oDq+BKsiSgJ9JG69gMfZHmyX2O7bupBt6zaX993eW
	 EoaBOx5ODQyok7TlKjgHJddYKIYisbKSvioby4lqOq2mNX1iEJh92SeWnzSDAtercv
	 CEBk6h/ndNQrTBOMgteCIH4u6ed+BiF6254VR1/dEAT2mG1XTagp0uQVZuBmrrWoVS
	 eCo5IxoBK9mpQ==
Date: Thu, 12 Nov 2026 10:06:03 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, dario.binacchi@amarulasolutions.com,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in
 PC mode
Message-ID: <20261112-illegal-slick-rottweiler-bdc9ea@sudeepholla>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
 <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
 <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>

On Fri, Oct 30, 2026 at 11:04:51AM +0100, Patrick DELAUNAY wrote:
> Hi,
> 
> On 10/30/26 09:32, Sudeep Holla wrote:
> > On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
> > > The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
> > > returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
> > > mode, Linux can assume that PC mode is in effect. Treat this response
> > > as success so PSCI power-domain providers can initialize when firmware
> > > does not support OS-initiated (OSI) mode.
> > > 
> > > Continue to report an error when OSI mode is requested but
> > > SET_SUSPEND_MODE is not supported.
> > > 
> > So, your platform advertises the presence/support for OSI mode and yet
> > opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
> > firmware bug as reported.
> > 
> 
> I think it is no realy a platform bug but a too strict management in Linux
> kernel, for PSCI power domain.
> The OSI mode is not yet supported by the STM32MP25 platform in Linux at
> upstream but I introduce PSCI domains in device tree (but without idle power
> domain) just to prepare this activation in next steps.
>

Fair enough, that shouldn't be a problem.

> As the PSCI support is not activated in Firmware (TF-A BL31), the firmware
> correctly expose its capacities (PSCI_OS_INIT_MODE =0) => PSCI feature
> indicate that OSI is not supported (FF_SUPPORTS_OS_INIT_MODE = 0) =>
> PSCI_SET_SUSPEND_MODE function is not supported (optional when OSI
> is not supported)
> 
> in Linux side, the power domain driver
> (drivers/cpuidle/cpuidle-psci-domain.c)
> 
> correctly check the support of OSI:
>     bool use_osi = psci_has_osi_support();
> 
> in STM32MP25 platform use_osi = false, so the driver request
> Plafrom Cooordinated mode (PC mode) as expected
> But here  the GENPD driver try to use optional function to set mode:
> 
>     /* let's try to enable OSI. */
>     ret = psci_set_osi_mode(use_osi);
>     if (ret)
>         goto remove_pd;
> 

IMO we should make this psci_set_osi_mode() call only when use_osi == true
above. If it is passing false, it is setting PC mode but as comments states
it may be assuming OSI mode and proceeding further which is completely wrong.
I would bail out of psci_cpuidle_domain_probe() early if use_osi is false.

> And the problem occurs here because the optional function is called but the
> normal use case is not handled (OSI mode not supported / PSCI_SET_SUSPEND_MODE
> not supported)
> 

Agreed, but I would check before calling here. The proposed fix hides
PSCI_RET_NOT_SUPPORTED error for PC-mode setting. So clear NACK for that.

> 
> With the proposed patch, the Linux kernel can have PSCI domain in device
> tree even when PSCI OSI support is deactivated in PSCI firmware (or not yet
> activated): the domain are always ON (GENPD_FLAG_ALWAYS_ON).
> 

Do you see any issue failing in psci_cpuidle_domain_probe() instead ?

> NB: I hesitate between the current patch and a patch in PSCI power domain
> driver:
> 
>     /* let's try to enable OSI. */
>     ret = psci_set_osi_mode(use_osi);
> + if (ret == -EOPNOTSUPP && !use_osi)
> +    ret = 0;
> 
>     if (ret)
>         goto remove_pd;
> 

See above, if the driver is assuming OSI mode is set after the call like the
comment states, it better check if use_osi = true.

> but I patch PSCI firmware driver because I think it is a more generic place
> to handle optional PSCI function.
> 

If we have to handle it in the psci, I would rather not make a call to the
firmware if PSCI_FEATURES(PSCI_1_0_FN_SET_SUSPEND_MODE) returns not supported.
That is the expectation for any ABI the firmware said it doesn't support.
Making unsupported ABI call to the firmware may result in unexpected behaviour
and must be avoided.

-- 
Regards,
Sudeep
