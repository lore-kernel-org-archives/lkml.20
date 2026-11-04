Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754799;
	b=AqxzbyAY2azPISpsBMPDr+en4gUeDaaqHHoJ4hPOfPwwK0DlsQBfiXtH1FhszYACqpSJ
	 HvjguHUQIP5qqiL2AjA9ADn9bNcPa5R3H4VsPJBUJoChQEiiGCGndlgt+/nMu6fMVTfHc
	 6PuhkwMbLqiiSUCZpfZC9D7Z0rSDJMN01z9NEsCrLLW+58pXkzkp7iQv24nmYKYg89rN1
	 eqk0YDMbuwV6Oef6t4pDwLfXwMYjcq2CtL4GJ75t5MrzY9zEHkHeNIDx0S+NzDcGaQoWB
	 rraC3aBpc6j40OXJGOVkMfWoueYduyT5laIDhuXygs2WbiA/+HbKdPK66YYXPICeWdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754799;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vwbcQIwB267pHTmSt0jnh3pxTtGhLg1+VlZbhQMQ1KM=;
	b=FH44scOamdUfh62iYk1iFzox3rjoklJ17KIlyrCE2ETa8xVSBgAEPD58kLF4CVBs19Mu
	 PCrejmFaQAq4hzJCTkpqaCpdFncesqszpjTfZPL0mxVYCbTaOeEUeQ8+ycxhh+AUnJp65
	 F9Mkf/dfCR0IyQqijlAQKYsdeB22PT8r4BE7FDDxXLIIuOMdMsAUmkYzQa0DczQ7nBmhG
	 msEY/j3QwtYZobHSfQ3vfF6tDV9ZDeRr57wbiAvfkYLz0xol+0PmfSdCq2eaapXFA/Tck
	 oKqEgP/lScqzhiFCiRCQfKiaiKKflQFYgrIZPc6RVx4Q653uzy3qUYv9Dckjt2EyfaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BALtcfcD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A2606A31B;
	Wed,  4 Nov 2026 01:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BALtcfcD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95E21F000C1;
	Wed,  4 Nov 2026 01:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793754799;
	bh=vwbcQIwB267pHTmSt0jnh3pxTtGhLg1+VlZbhQMQ1KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BALtcfcD5tIOlthWwqWIItV6g+5EEVkKAV4lTEXjEd6xtU64XxExaHXJ6zJOXAowo
	 ij8/MgAKQrWi64RPhYdtMJsZNEYx/CSJdPsMMOgY2uZbiiPKh/dEBnxAxq9BWel1uA
	 MpeHAaVoZeTgkCvatdqVz8IO2U9N4qI0jlx8ADE8oq5OZN6sdeY2C+XrK1Fp1FuwyC
	 NKyEu24W6zB9+Wq4f0BT+BAaJt8HzrzJCko88vMev5tb6AxRjDfJwW0qMpDpPOYrq+
	 RepXDMnpZXlrRCBX+K3K/h3PGrqf1NGa8OSD47yxCyoL32DSRBEmAkVOy70bt/G15N
	 GDQB/+cS59akA==
Date: Tue, 3 Nov 2026 17:13:17 -0800
From: "Peter Chen (Qualcomm)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: otg: avoid workqueue resource leak if otg
 fsm init fail
Message-ID: <auqGrXyD9Dn4kaML@hu-petche-lv.qualcomm.com>
References: <20261030072130.276679-1-xu.yang_2@oss.nxp.com>
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
In-Reply-To: <20261030072130.276679-1-xu.yang_2@oss.nxp.com>

On 26-10-30 15:21:30, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> If ci_hdrc_otg_fsm_init() fail, error propagates to ci_hdrc_probe(), which
> jumps to the deinit_gadget label, bypassing the deinit_otg label where the
> ci_otg_wq workqueue would normally be destroyed. Finally it cause resource
> leak on previous created workqueue.
> 
> Fixes: 57677be5ef83 ("usb: chipidea: usb OTG fsm initialization.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/otg.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 5eb3b32c2e87..89a6a37815f0 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -246,6 +246,8 @@ static void ci_otg_work(struct work_struct *work)
>   */
>  int ci_hdrc_otg_init(struct ci_hdrc *ci)
>  {
> +	int ret;
> +
>  	INIT_WORK(&ci->work, ci_otg_work);
>  	ci->wq = create_freezable_workqueue("ci_otg");
>  	if (!ci->wq) {
> @@ -253,8 +255,13 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
>  		return -ENODEV;
>  	}
>  
> -	if (ci_otg_is_fsm_mode(ci))
> -		return ci_hdrc_otg_fsm_init(ci);
> +	if (ci_otg_is_fsm_mode(ci)) {
> +		ret = ci_hdrc_otg_fsm_init(ci);
> +		if (ret < 0) {
> +			destroy_workqueue(ci->wq);
> +			return ret;
> +		}
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
