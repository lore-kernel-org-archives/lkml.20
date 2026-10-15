Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666EE369D61
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028795; cv=none; b=eUEmxN5n2xESxDvlMNbjNYGIVEZLhoicpprEthYQuakYAOHGHtzE6ffj/1sk1o6WZ8XUeHaeciPBZWWVBLR0XXFSSY0W7tpdUe1AXiyo5iuBPw3UUIgfpCFAv9i7Hxo8BUhSbMD/MGatQwmcygBMyt7bEtDoi5xdTQ7+xAs7CYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028795; c=relaxed/simple;
	bh=EFOBIQx39hn4IdpmejLwwduo/pRrDSed8OK05SczX0o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E9fSEMePBaAyzEGaTs67XqBNHZY5Vwkmj17tfvrfB52CQMBFVLjUbXjH5Yv8oSKlPBgt4rp+e2566i8TEgoITU3n4ewMxE9QwuJfgvDwevpRdlVbpShvpMMmPtfChmnoEdOouBGaDaB+/qhdqq4NR0XL+Qmnb2652EL50336Mvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=g5D4wAnT; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="g5D4wAnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=u05+yKXp6RgL31FqkS85j2BujAsYRF3+srZ9/VzNFOg=;
  b=g5D4wAnTh+1oXVlcOPswGPm8jluIsF1YjKMYYvRxrnHNI9SFDWdx0cO9
   BVg41DwzeFVi00awI8+kgZPrVrMSprNwBkYYqxKIzG0/sIycSNA9JswiO
   uOg7gaFReL6DamZPrxxB/1SXtf82Js98aixEIRGf7lGTLt7U427/ShhRQ
   U=;
X-CSE-ConnectionGUID: 3izEqYtiS/iqeyZwlpt9kA==
X-CSE-MsgGUID: eIbLjIpJQMKAhdJD/43IXQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,158,1787004000"; 
   d="scan'208";a="300260240"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:46:26 +0200
Date: Wed, 14 Oct 2026 21:46:24 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Dean Clifton <deaner92@yahoo.com>
cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
    Alex Elder <elder@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: Remove unused header declaration
 to_fw_mgmt_connection
In-Reply-To: <20261014174248.97561-1-deaner92@yahoo.com>
Message-ID: <2d2106c-a2d2-2bec-b368-c03850cba9a7@inria.fr>
References: <20261014174248.97561-1-deaner92.ref@yahoo.com> <20261014174248.97561-1-deaner92@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 14 Oct 2026, Jeremy Dean Clifton wrote:

> Previous commit removing a function definition did not remove the
> function prototype.

Please use proper English.

The commit 3228900f80c2 ("staging: greybus: Remove unused function
'to_fw_mgmt_connection'") removing a function definition did not remove
the function prototype.

>
> commit 3228900f80c2 ("staging: greybus: Remove unused function
> 'to_fw_mgmt_connection'")
>
> Function header declaration needs to be removed after definition
> removal.

This is saying what you did.  It should be in the imperative:

Remove the prototype.

> There is no definition of this function nor is there any place where it
> is called.

Not sure this is needed, since the definition was removed previously.

julia

> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
> ---
> v2: Fix grammar and spelling in commit message.
>
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
