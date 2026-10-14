Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E63E024B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005245; cv=none; b=uPsTQTw2R6+t+v8W5fTDeUrLg0ATUDnMzC3FLfX9f7tqJnsSluYfjYMlHDASPdlhCC1Tv3rcVYxxAJKahmd0IxQ/pFoZu7H/fGFopCl2Sf++WqIxS2V6+Twi2A5kcQwn5pcI4E5QbP+BndPhPT93jZ9WW9EMZhXwUTXDPY0IVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005245; c=relaxed/simple;
	bh=5/QJ98KYPE0a7nBWrjH4cOW1aV6TKro/1XWWVOZhT8c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RCOmqPmcJzL6u9D6tyREKP4oa5iW/YwAA87qHlIAZzvgRK9x+Rc3SFa8gVA4gQgy1zw6V8EtvlBIYLp5go6QOaEdENGyRestpgGk0T01AdRZBlxPAOP1eidELouGO+Xq+2JqFjY9kPKpa3o8lqIGo2Cb29eJUehg5B18G0mQrE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=hchTF0Qh; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="hchTF0Qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jEKZVf5UjTHrAA2sDaeoyhdrG/YWIzgeZA7wBiLvde0=;
  b=hchTF0QhuqaU5H2jV81WMpyO5ZJq8/iFzIWKBwH/lgOv3CNlXKW5M59o
   +cT1duUySsPUjb9Tvg38liCBOnRgG6mdRlKutFk7COAyX2Myj0xMP+Oc/
   fm0UH1ibxmTYcAIOwYWaIoAcdJykpXcyfELEjNkgw66PXooI7aGlOkDGa
   4=;
X-CSE-ConnectionGUID: ufffbtJxTEK5eSPtbUvLHA==
X-CSE-MsgGUID: 8Kr4xvZVSe6LpXCsOtQdSw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,158,1787004000"; 
   d="scan'208";a="300237416"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 21:13:50 +0200
Date: Wed, 14 Oct 2026 15:13:48 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Dean Clifton <deaner92@yahoo.com>
cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
    Alex Elder <elder@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Remove unused header declaration
 to_fw_mgmt_connection
In-Reply-To: <20261014171342.97160-1-deaner92@yahoo.com>
Message-ID: <377d4e4f-93bd-6634-c3c5-1113f5057e2@inria.fr>
References: <20261014171342.97160-1-deaner92.ref@yahoo.com> <20261014171342.97160-1-deaner92@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 14 Oct 2026, Jeremy Dean Clifton wrote:

> commit 3228900f80c2
> ("staging: greybus: Remove unused function 'to_fw_mgmt_connection'")

What is this?

>
> Function header declaration needs to be removed after it's declaration.

it's -> its

But I don't really understand the sentence.

julia

> There is no declaration of this function nor is there any place where it
> is called.
>
> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
> ---
>  drivers/staging/greybus/firmware.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/firmware.h b/drivers/staging/greybus/firmware.h
> index 5d2564462ffc..04a67d2d5b8f 100644
> --- a/drivers/staging/greybus/firmware.h
> +++ b/drivers/staging/greybus/firmware.h
> @@ -22,7 +22,6 @@
>  /* Firmware Management Protocol specific functions */
>  int fw_mgmt_init(void);
>  void fw_mgmt_exit(void);
> -struct gb_connection *to_fw_mgmt_connection(struct device *dev);
>  int gb_fw_mgmt_request_handler(struct gb_operation *op);
>  int gb_fw_mgmt_connection_init(struct gb_connection *connection);
>  void gb_fw_mgmt_connection_exit(struct gb_connection *connection);
> --
> 2.43.0
>
>
>
