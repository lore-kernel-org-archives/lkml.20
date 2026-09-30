Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F52035CB91;
	Wed, 30 Sep 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782331; cv=none; b=l5ggT1Wnm6XfwGWleY86PEwnnP/qdHD7CHEeFcfDedFqwogNurgcfLwrPeCLwhfFpj3gblKRhYKlDtlTenpPEE6IezQ2Lrxlf7KJUnKr2JBPZxpw+UU5KDa585SaHXgC5S71IE4UaoqzoC6Fscmyc82DIoRgaaM4Gj0bNV0gVto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782331; c=relaxed/simple;
	bh=Em3vcwagAyAWSmwoDtG8wFY3snq8SkqpquR1qt+m92A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gY+bq8HXpA250qOuvmtQwy2fgdfsGJZQywRtvOAijMd22ImzfWuwhSdi52eONpJLpRh0/gg5IFO19pz+AAE04NT+YxBsjjKIfoLMii/pDU0wj5HjMhnnT8B48SBxzDgAPGEmVxEZD5CJd1x898tAKXsim6eWWDqZSOg+a5kn9wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJAR54No; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJAR54No"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9284F1F008A1;
	Wed, 30 Sep 2026 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782319;
	bh=BZRI8hlbTu+2JkqknH2WafbyhYLKE2FcuAneqESOJos=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=AJAR54NondsF73cYPh3uLjUH4JpKIcYiDBzUfngvQCZpjujwZ9i+WPzHdPGpDEuYm
	 eJfCqjQWI7XQPnBpt4SgdcvWOwJi9WuawQ4SpVCDLT7CKh08apfuoxJfVXZhmVNzsG
	 JIX0Gv062YhX97SAcOYCOIEP/j1xSVLdhLsiFGDXg+mgp6cqOIj9ZFmi5zgWbkKmkY
	 4VYhfbZN9agduprAU2kVBaDL90Y53iuvDp1m8PR+I5wIIMnlhPRzo4Ic+o7CwXIoYp
	 /hJ9PyCZ7hiGbpREkAyHQSXpvvkMEKAXD2rNGnkA4kcxTYuv1t7hvy+oc+9QXEudwp
	 NLK+YQ2UbFbow==
Message-ID: <79ef6399-36bb-42d2-be7f-fded840866c7@kernel.org>
Date: Wed, 30 Sep 2026 17:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 05/21] media: i2c: it6625: drop stale GCC < 4.4.6
 workaround
To: Hermes.wu@ite.com.tw, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
 <20260930-upstream-it6625-follow-up-patch-v2-5-e353f887e7fa@ite.com.tw>
Content-Language: en-US, nl
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-5-e353f887e7fa@ite.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2026 08:41, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The kernel-wide minimum GCC version is 8.1 (scripts/min-tool-version.sh),
> so the explicit .reserved = { 0 } initializer kept for GCC < 4.4.6 is no
> longer needed in either v4l2_dv_timings_cap initializer.

FYI: I'm dropping this patch. It might be OK against the oldest gcc version,
but for the oldest llvm version this is still needed.

Regards,

	Hans

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/media/i2c/it6625.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index b09b331b20364a8e169429bb309d1112ec83d919..b747c08e092c7b35994cb36bb5bf7b99495282cb 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c
> @@ -331,8 +331,6 @@ static const s64 it6625_link_freq[] = {
>   */
>  static const struct v4l2_dv_timings_cap it6625_timings_cap = {
>  	.type = V4L2_DV_BT_656_1120,
> -	/* keep this initialization for compatibility with GCC < 4.4.6 */
> -	.reserved = { 0 },
>  
>  	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 300000000,
>  			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
> @@ -347,7 +345,6 @@ static const struct v4l2_dv_timings_cap it6625_timings_cap = {
>   */
>  static const struct v4l2_dv_timings_cap it6626_cphy_3trio_timings_cap = {
>  	.type = V4L2_DV_BT_656_1120,
> -	.reserved = { 0 },
>  
>  	V4L2_INIT_BT_TIMINGS(640, 3840, 480, 2160, 27000000, 594000000,
>  			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
> 

