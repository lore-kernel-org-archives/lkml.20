Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475624E66AC;
	Thu,  3 Sep 2026 15:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450486; cv=none; b=usvgW6oL3lo0QSXayaUki6SurGEuUaA8Hl+GUts4/TIS9A6HuMcKqPqu1fptsR3arsIyuotFXkyZQbRrdWpvX9ekJRKZ7qciHSnYtEIl/NVBl8vVTDkoWLq2OQgg5aLBEYxHKVU/DVpT10xSs+7OM9PZ0YMrg7ZsJozRHGEG87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450486; c=relaxed/simple;
	bh=68omhZZv7tw9Z3jihvPUbkGOwyWouY4dE7v6dISx4zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+D8T8QYjVCgjfuyPJmkX5iwL53JdkED9B0HHyTJl9E1GG2DJbT4rtDZBX5nF41VJxFfyuM0tIKPlNJRi/2EdIzI/Nj1377ecDU/NO7Vkk0PYqA10iyxdAwHZcPd7Lyo9XVllsN3jPohmbsJgldHhOwPyLAxaZaBm65Urtzgb8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Em8TPzSl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Em8TPzSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3681F00A3D;
	Thu,  3 Sep 2026 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788450485;
	bh=r+Dme+DqySO/dMQmJAeW94fKi3TwJHhBJFHCa0CbHQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Em8TPzSllEy7+hP/lU6tY9QlOwfWh1FlX3u7FkGah9RyPn8MrqO9Lw5Xurj3nacUO
	 zuFiGyCL0L9AauoVDuj4BAaD1J+k7pdqsruMLDay5ZLtV04DBD0Vw1NVORVcXR8xOK
	 JXGBQEqZNInR8HJxEI+85s+7vTmmZ4SRlZdYufz+cLMefNifsLkmhMEPNVaD6a6eJD
	 2H7VfzqIgpj0rFMAckFwVmjf05PJXg6JUsxMbkPLXHOq62CphzHRo8o/osJSm6wyUZ
	 3TNeUWrYiGFbdysHcfvdRtG5BBZgpKsPqZyAJDUDYn08JLrbuGIrWtwXOHn1ivnpef
	 2JM4l/wiwklNQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x29fX-00000006GT2-04zi;
	Thu, 03 Sep 2026 17:48:03 +0200
Date: Thu, 3 Sep 2026 17:48:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Ian Lin <jisayme@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: option: add Compal EXM-G1x support
Message-ID: <apmWs9qXa3lrpMpV@hovoldconsulting.com>
References: <20260831084405.65506-1-jisayme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831084405.65506-1-jisayme@gmail.com>

On Mon, Aug 31, 2026 at 04:44:05PM +0800, Ian Lin wrote:
> The Compal EXM-G1x is a Qualcomm SDX12-based LTE modem. Add support for
> its vendor-specific serial interfaces with protocols 0x30, 0x40, and
> 0x60.
> 
> Relevant output from usb-devices:
> 
> T:  Bus=04 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  1
> P:  Vendor=04b7 ProdID=8217 Rev=05.04
> S:  Manufacturer=COMPAL
> S:  Product=EXM-G1x
> C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> I:  If#= 8 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
> 
> Tested on a Compal EXM-G1x modem.
> 
> Assisted-by: Codex:GPT-5
> Signed-off-by: Ian Lin <jisayme@gmail.com>
> ---
> v3:
>   - base on usb-next
>   - add AI assistance attribution
>   - post as a fresh thread
> v2: https://lore.kernel.org/20260828082645.13018-1-jisayme@gmail.com/
>   - split USB serial support into a separate patch
>   - identify the Qualcomm SDX12 chipset and include usb-devices output
>   - keep the device entries sorted and add the product name
> v1: https://lore.kernel.org/20260828075644.6228-1-jisayme@gmail.com/

Thanks for the update, now applied.

Johan
