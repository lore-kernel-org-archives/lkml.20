Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20FE54A7E7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081703; cv=none; b=VYSn+8DKtzbXbaDzbyKmJm2GBBGZSlFfRqwlFYEDYjqZEVI3EpYYLSUstm/WqSSaMObwps+iHodLHBgSC+DwlNCO9D+t9rE603+DJ+T7lJDiaen2en4bpH6pzge+F0K2fTZxnAiVnqRTOaVfKxx7T2RiJbj21c11ds4Fy2ywtf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081703; c=relaxed/simple;
	bh=VZN2fb2ga+rAimb+At5lfyPZ8DXcR0GMUzzVA+d4nj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHihGUHBrZQf04rm3zcvnu/cVGoceqPBFrhWz1YuFWGIukK54rYiOhOAvZVIFl33Sn7IDNBFjYbfzm7Ie3dS3JmCQpX2t7O6RceQxa1bJr36UkB3a8TulHNUqIjgsRL4LiidSC/hgX0HWny+ewIattWPNn54HnklRs6VNI5UHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jiCSaMqW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jiCSaMqW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1087301f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792081679; x=1792686479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KR4i4KxOGzdvwjOBg3czI4/01caQ5A7Fc1JHBGRwQTE=;
        b=jiCSaMqWSm1g8TUDWxYHPti+M55ELsQiQrxtKGP52uFYZYTYxdWuJvy81ogtK4/FYH
         eYojlAa9dNruOToL9q262x9QBLNiVycTqn3TTSI3JFsAeAb4ODZu+wXQHE3j7ViOo7W6
         fxtmkQ9pmF9KFAxg/uO2SfrLvQ5tuNw0SciiITkvWBL5V12hqTvAx5EraDBAkCFzvS0N
         HXtx4kiTdAVQcBTy3QUt9vPheKm0E1hMBujlQiYuDjVvNrYGeXsCYUX4er3OV0xafbPu
         JazdYEL4mLksOGzfczVxBEMnd/hEQ169hWVoLk9jNZ9OvWW5Knir9hn+dMFIdbnCHG8a
         T9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081679; x=1792686479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KR4i4KxOGzdvwjOBg3czI4/01caQ5A7Fc1JHBGRwQTE=;
        b=0SwGpBwNfPz3lM6twejCs1raZGe5QoqVLBy6m5NjGNfc+X3XYM0ySgMpPKsLz5AxwC
         phGTEo6y/4m3/V+ui1mKfi/7qZ14k4stNfO68EU1wz4FvnPHRr4O0nOcM7mOAePGicMm
         ccp8u1HCnC/dMuLfpxwSeQ4HRmHZPDr1PkcTpAlXOeVX9K/GZF45+NUfItB9f0CX077/
         +rjFWOw8ZQEdrS2kJKexGBfLgnAMZ+l4i/af2+OcAC068nbdjUYUvipxvsPtwGzZpwId
         Tbuc7i7k0xkipt3tqhKymJRAZbJPDLPOlMNbA3i1VAe6AKLIeDm6zMHVK20+zt3sjl7G
         dpYg==
X-Forwarded-Encrypted: i=1; AKwUvBwRM2IFD9D8bXLRIgqBk3JWwB6ywMcpre9SAXdM5Uzipv9yp3xrlDupIKULqXDo0+O/rp5Gh8WEmEuMrGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7gO8+Mv/vLYEAkYG3F3QVgr86KVV8qRogcHuTCxQluzGhecUb
	PrqfZpZC0SK1S0htzFr6oqEQZ3uOfRs8md0yDoSqKpAHfxR+KahcSl8OArZzZjO00so=
X-Gm-Gg: AYBFou0Q+DYcwEBpm44oxRQgK7ri0SUJvnRZDFCXZBdEpGjPDh4jJ/zh+Kr8yGGTkPR
	eqV4Iw4LeDayHDwMSn9xY3VeAtORCMOfiMWXWE67r4Z4Zpj/AS8ygBiCWiYFvu9jFxm5amvAK9a
	xmeP/B6vzls4kFD5r6+zpKOSN1S5tlMllsUlnXIW9SiPpXza6ytolOFsbVQBQKrplOzqAJ1x0nx
	v85BjKqQO7Ce/XExUKTWxgz/YCDfbxD0Q6NgXaur08F8WLbb/PKWy3Qk7ZFXKEEVAyu01gCl71n
	cgS47dUl82MzLXiXHbPs0+J5l3nDizniuhsGI+517hxGaBuPxlcV0F6lQ0QB4IkNep+mBwTxGGv
	LfpoMKSATCnCFafyyQDYehxOBbtR/IYNvJl0Bm9mu8aKUPabGhGSJ1I9AquT68e31gYVCYgOYds
	GUM/j/RxhTzoOGtuDgrLeSUX+4hySKFJIdZe+rvD6AYFVOd8yCts+qB5HNa/EvDOTD+rdU/t9y+
	AttYSh+wKsJA05hy3uCzA==
X-Received: by 2002:adf:f341:0:b0:487:197a:5c1f with SMTP id ffacd0b85a97d-48dbaae84e0mr31568707f8f.49.1792081678765;
        Thu, 15 Oct 2026 09:27:58 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:7bdc:6c2a:a8d2:6ad3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm19545964f8f.20.2026.10.15.09.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:27:58 -0700 (PDT)
Date: Thu, 15 Oct 2026 18:27:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
Message-ID: <atD_AjZKaF5UtSUB@linaro.org>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 04:02:38PM +0300, Abel Vesa wrote:
> This is an RFC: I do not expect it to be merged as-is, it is sent to get
> feedback on the approach.
> 
> Some values a platform needs (for example the WLAN and Bluetooth MAC
> addresses on the Qualcomm laptops) are not always available to the kernel
> in a convenient form. They may live in firmware-owned SPI-NOR storage
> (e.g. a DPP partition) for which there is no straightforward, universally
> working way to read them from the non-secure world.
> 
> As an alternative, this series allows such values to be provisioned once
> into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
> provider that exposes the contents of a UEFI variable as an NVMEM device,
> so the data can be consumed through the standard nvmem-cells bindings.
> MAC addresses are just the motivating use case; the provider itself is
> generic.
> 
> The first two patches are the actual proposal:
> 
>   - dt-bindings: nvmem: Add UEFI variable NVMEM provider
>   - nvmem: Add UEFI variable NVMEM provider
> 
> The remaining three patches are included only to illustrate how a
> consumer would use the provider; they are not meant for merging as part
> of this series:
> 
>   - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
>   - wifi: ath12k: consume a "mac-address" cell
>   - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable
> 
> glymur-crd is used here only as a convenient example for the consumer
> patches.
> 
> Feedback on the provider, and on whether sourcing such values from a UEFI
> variable is a reasonable approach when they cannot be read from the
> SPI-NOR directly, is very welcome.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

In general, I think the idea to take NVMEM information from a UEFI
variable is reasonable. However, at the end the usability of this
approach depends on vendors actually provisioning the UEFI variable.

Is that the case for your "MacAddresses" example on Glymur laptops?
Is any of these laptops shipping with this UEFI variable provisioned?

I can't really imagine end users manually provisioning this variable.
We have too much manual setup required already to be able to use these
laptops with Linux. Ideally, we should take the information from
wherever Windows is taking it and make it work out of the box.

For existing Qualcomm laptops with the DPP partition on SPI-NOR, there
is prior work that could be extended. I would expect you only need:

 1. SCM SPI-NOR storage support from
    https://lore.kernel.org/linux-arm-msm/20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com/
 2. GPT partition parser (not sure if that exists for MTD but the format
    is certainly well documented and supported already in Linux for
    normal block devices)
 3. DPP parser from
    https://github.com/TravMurav/dtbloader/blob/main/src/qcom.c
 4. Some way to hook it up in the device tree

See discussion in
https://lore.kernel.org/linux-arm-msm/de081bdc-4b10-4cbe-9b09-4652b63bc4b9@packett.cool/

The universal approach implemented here would obviously be cleaner, but
in my opinion it depends on vendors provisioning this variable before
shipping devices to customers.

Thanks,
Stephan
