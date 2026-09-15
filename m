Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3A3C1085
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482977; cv=none; b=p2HotcHfck9w3mbUAw2M73Nn2iRiCsS95uu7ouu22ZysgtThBwgHdrolNdMNL70lgx21rlEAGSAuRAn8eLdVa16Kglrdt6n3ghhb+ij8gNroULk0mydfa82O4RK0c045YQHYP3eRF5sdm31MgPlLOxU2tvpru6uBym075rFZ29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482977; c=relaxed/simple;
	bh=MblToBcYYgmgdT6UmpQJj9tdgLpNgAAY8EtZbBl/0k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qLFCCWkVHKpLZ0HsS2vNXQCvbniEIAqMdWh7gwgi3X+Kup3PRN1r/A6SbI2OddtOX2idwauSCfWLVGWGigllUq3e/vfLFbmSQJx9svgEj8pXL7QqHpGI0X8Q97tbi45SPW0vVXymQfimLVNSVAOr+kVX0ovMOdUNy0feLK6kft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIHJJsE9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIHJJsE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A411F000FF;
	Tue, 15 Sep 2026 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482976;
	bh=RAsHdbLHF1e4B1dAQMVldXSWHNxc4CP1MuEmgFhauxc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=dIHJJsE9rNR52YpLPAoiWcUX4FDfX5fFouwTw69mos1eo3pFcpzIihOUCUe7T17Rh
	 ScPLWCxDeB4uKu85MZ3LXS1j/cUSCwt+Jzn0DB/IifWCacjV2L6AkY+6WjfHJQKecZ
	 A592/w1p6j2gvc2jEFrvIAni9Tp5uCihqmWALNszm4WOwfhm3/LOOUigyxzM6qK53+
	 ClTNfXqqSGRzH3IfO+R6eFGLMNSoq3klcO+iOAXG/g287bi5vSNINyqs+ome18twag
	 6JxQR3bP5ym/kBMsg25xAbrRS889kXfNcK+ydOYOd1eUAO3Ezxwj33g5YHa4SlFREW
	 snXKZBlmph4OQ==
Message-ID: <55d97bc5-3b4f-4a1a-a91d-e0a4d77e754a@kernel.org>
Date: Tue, 15 Sep 2026 09:36:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: stratix10-svc: populate kaddr1 from config
 status response
Content-Language: en-US
To: adrian.ho.yin.ng@altera.com, linux-kernel@vger.kernel.org
References: <2d8af331c37fcdd8a6f3dccdb6cc6cd903f0c4cd.1788972469.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <2d8af331c37fcdd8a6f3dccdb6cc6cd903f0c4cd.1788972469.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/26 03:44, adrian.ho.yin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> Set kaddr1 from res.a1 when the configuration status completes, matching
> the existing error path and allowing callers to retrieve firmware-returned
> status details through the standard kaddr1 interface.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
> Changes in v2:
> - Drop the callback-data lifetime / dangling-pointer changes.
> - Reduce the series to this standalone patch. Set kaddr1 with &res.a1
>    on the completed path, matching the existing error path.
> 
> v1 patch link:
> https://lore.kernel.org/all/cover.1779780223.git.adrian.ho.yin.ng@altera.com/
> ---
>   drivers/firmware/stratix10-svc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
> index 34c591d7fd58..2333ea31e741 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
> @@ -444,6 +444,7 @@ static void svc_thread_cmd_config_status(struct stratix10_svc_controller *ctrl,
>   		cb_data->status = BIT(SVC_STATUS_BUSY);
>   	} else if (res.a0 == INTEL_SIP_SMC_STATUS_OK) {
>   		cb_data->status = BIT(SVC_STATUS_COMPLETED);
> +		cb_data->kaddr1 = &res.a1;
>   		cb_data->kaddr2 = (res.a2) ?
>   				  svc_pa_to_va(res.a2) : NULL;
>   		cb_data->kaddr3 = (res.a3) ? &res.a3 : NULL;

Applied!

Thanks,
Dinh

