Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715849B212;
	Fri,  9 Oct 2026 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537865; cv=none; b=VtzWzP8O6UkCIMZAo3lJKZr0wdmr1A6zNfEgLqoXOl6cicv+T94UFTYDnBBin1UP7fozx/ZbKNb6qfkfQevd1xkfSsexGabKsCR1XR2ztIC5hCPQeTdgK/GQsFE4LyPphnWytTguMb/2TGtdo7ETiUTaNs55sPwVofYcOmIzdMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537865; c=relaxed/simple;
	bh=/E+eLzY/FKhLYDJMYvoRUmDBdARTxkXW0xYk7worREQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTTDBCHBjKLurK62fZTGsiZWUxHyAXDiR4Z4BrCbDqNSTExIPScZKwPaQB73f7dirzfy0GdWX9V0xmauuBQvSzw8xG4YGHsx59Zt+ud3Rb7MARkOLc4C+qFFomPLyGBuilWfbEX5O/oDr1V1j51jJJCXSvksrQspapLulvy5phI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dFq8DigS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dFq8DigS"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2274A24A;
	Fri,  9 Oct 2026 11:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791537733;
	bh=/E+eLzY/FKhLYDJMYvoRUmDBdARTxkXW0xYk7worREQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dFq8DigSoDKT4Nz2pG7ovcmMG6riPyk5TqgQdx62aWtnjo+p70adyAtc9mCRtCKTt
	 22ZtO1n8vvwBF8skvTKR2UbmxyTBWQYw3EzIE6nYilOAdb4M9NRxokCVyOkj1GmFdR
	 eQuohCPliAfZu40oXjGd0tEfSYgEJ7o8Rkd/JET0=
Message-ID: <06479beb-4f83-40d0-85c7-a4545e963cbf@ideasonboard.com>
Date: Fri, 9 Oct 2026 10:24:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: ipu-bridge: Add GalaxyCore GC5035 and GC8034
To: Nicola Fiorillo <nicfio@gmail.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261009072733.39877-4-nicfio@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261009072733.39877-4-nicfio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Nicola

On 09/10/2026 08:27, Nicola Fiorillo wrote:
> Add the GC5035 and GC8034 ACPI HIDs, with the link frequencies the two
> sensors use with a 19.2 MHz external clock. Both are found on the CHUWI
> Hi10 X1.
> 
> Assisted-by: claude-opus-5-5
> Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
> ---
>   drivers/media/pci/intel/ipu-bridge.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 3739c4a2a..851096d7d 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -59,6 +59,10 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
>   };
>   
>   static const struct ipu_sensor_config ipu_supported_sensors[] = {
> +	/* GalaxyCore GC5035 */
> +	IPU_SENSOR_CONFIG("GCTI5035", 1, 422400000),
> +	/* GalaxyCore GC8034 */
> +	IPU_SENSOR_CONFIG("GCTI8034", 1, 268800000),

These entries look ok:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   	/* Himax HM1092 */
>   	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
>   	/* Himax HM11B1 */

