Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19017385D90;
	Tue,  1 Sep 2026 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252490; cv=none; b=JTkdUBuIQ776MExhyUplHTMZr7alBYF0bOcaPiRfxzTz9R2KEmNm/k7ZrFsQhTV0TAbAGzDX3IEqp5chckn8WSZrrRfreK6tOvqQxtZEL+7wX5W3Ng9+dZMINX+H3UkTCNU+QyMTqloq+1eDMfH5lnNpzgnUyv8TlpfFCZ+ot+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252490; c=relaxed/simple;
	bh=vKNhSQ2KYcaUOtuQBgsj1j9mWaFB4IaP4yx80H7ljDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nD2Me5XMVhM/gfkCihzqeQj3bmqO9PNwuOl/sxWAwlWkdKMvjmqZ3c6JS+/5ShIhhMFvsy0CI2PBJx/VYDdtR8YevfR4Kk4SfcxBPyJTueayfIz8vQ17SD57dpSjjxL4ad/9TvrCPBaCTmDUAc8cMh2KKnuv8ORKKkdQvdx9Fyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVhrCZTE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVhrCZTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788252488; x=1819788488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vKNhSQ2KYcaUOtuQBgsj1j9mWaFB4IaP4yx80H7ljDc=;
  b=ZVhrCZTE3+nt7mecp88EaCTa1miOHd9J+4nAH8m7NPmaS5mbt9Wb2Im/
   e6NOpcqC0qbpPlZUngne7uLqQwtpp504UpB2nUFwKqDm6MXKo8GVgCAjL
   /MnAfNKYDDo/McVHZ6qAkPftXJMmTIZ/wFPOjcE8Ap2Xfn/Uvw6xWKm9C
   3D8qfUAN76I0UFZ0LgjnD+NdDh4/lqrhnPSafE2FB+iCxkZRphtPDuWJh
   fVKpQ6qWgEiMs4qmKD6bgU4PjXntXTNBSK4tOPDEij3mjB8xslK3bY0au
   JksJonBweavmcI0/znTZFLUe2P09Yyo1itZwmZ9CUi94077wsdVFJqU/i
   Q==;
X-CSE-ConnectionGUID: oOy47XU9S+CNitPKbX5lxA==
X-CSE-MsgGUID: 2N615yA0RO6VsjgBM0lE4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88434009"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88434009"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 01:48:08 -0700
X-CSE-ConnectionGUID: WdsnewkQS9yOAp9UxZs+qw==
X-CSE-MsgGUID: Pm49jRiJTYiFtkP/MJltEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="270981162"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 01 Sep 2026 01:48:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A858C99; Tue, 01 Sep 2026 10:48:02 +0200 (CEST)
Date: Tue, 1 Sep 2026 10:48:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/19] thunderbolt: Try reading host DROM from device
 tree first
Message-ID: <20260901084802.GB106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-6-44bc9348683c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-6-44bc9348683c@kernel.org>

Hi,

On Sun, Aug 30, 2026 at 10:19:24PM +0200, Sven Peter wrote:
> On Apple Silicon SoCs the DROM is provided by a device tree property.
> Try reading from that property first.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/eeprom.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> index 2a13fa6888ba..389de7df84f6 100644
> --- a/drivers/thunderbolt/eeprom.c
> +++ b/drivers/thunderbolt/eeprom.c
> @@ -468,14 +468,14 @@ static void tb_switch_drom_free(struct tb_switch *sw)
>  }
>  
>  /*
> - * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
> + * tb_drom_copy_property - copy drom from a device property if present

tb_drom_copy_property() - Copy DROM from ..

Ditto for the other kernel-doc comments. If it is static trivial function
you don't need to add them.

>   */
> -static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
> +static int tb_drom_copy_property(struct tb_switch *sw, const char *name, u16 *size)

I think this should be split into two lines.

>  {
>  	struct device *dev = sw->tb->nhi->dev;
>  	int len, res;
>  
> -	len = device_property_count_u8(dev, "ThunderboltDROM");
> +	len = device_property_count_u8(dev, name);
>  	if (len < 0 || len < sizeof(struct tb_drom_header))
>  		return -EINVAL;
>  
> @@ -483,8 +483,7 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
>  	if (res)
>  		return res;
>  
> -	res = device_property_read_u8_array(dev, "ThunderboltDROM", sw->drom,
> -									len);
> +	res = device_property_read_u8_array(dev, name, sw->drom, len);
>  	if (res)
>  		goto err;
>  
> @@ -500,6 +499,22 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
>  	return -EINVAL;
>  }
>  
> +/*
> + * tb_drom_copy_of_apple - copy drom supplied by the device tree for Apple Silicon to sw->drom.

Like these, not really useful comments you can drop.

> + */
> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}
> +
> +/*
> + * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
> + */
> +static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "ThunderboltDROM", size);
> +}
> +
>  static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)
>  {
>  	u16 drom_offset;
> @@ -675,6 +690,13 @@ static int tb_drom_host_read(struct tb_switch *sw)
>  {
>  	u16 size;
>  
> +	/*
> +	 * Apple Silicon machines always get their host DROM from the Device Tree,
> +	 * so make sure to try reading it first before any other method.
> +	 */
> +	if (!tb_drom_copy_of_apple(sw, &size))
> +		return tb_drom_parse(sw, size);
> +
>  	if (tb_switch_is_usb4(sw)) {
>  		usb4_switch_read_uid(sw, &sw->uid);
>  		if (!usb4_copy_drom(sw, &size))
> 
> -- 
> 2.55.0
> 
