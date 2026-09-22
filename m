Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA6541457;
	Tue, 22 Sep 2026 12:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081686; cv=pass; b=T2PMzPAzJw2M3KrH856k4IubN1kI2nB9qn1Di7JwmJ7e+17zg4VdUdb7klQiE+JyrtfV14E2OPwIHCb0N3XliLFJ5IuiSKFDjoOzjqDmHdOuHT/NuF9SnAjt0qsuPP6EhjyML5p6QuZUPfQpaiyRO8jKZo8WcGmMpw3O34BDfDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081686; c=relaxed/simple;
	bh=V7n/BWIDft/I9Kb77ciqUg+GjefkKTbkrHkQz6W3acw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHFUqOzzvw+DfEukAIncpEjpVmiLB7Y0SN17Brusng8oivtgfvjES6BKrefQibs1S+TQaClwKj022y2FIJeYQYwwDy5OBVWqmlvUjQjwThtnRkUY1eLZAamPClNQ1bCVKX2U0JATMwD0gFAt5PK5Uz8Q7n4/TxY9aqtZMwx+5R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=UgvDnQ6c; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="UgvDnQ6c"
ARC-Seal: i=1; a=rsa-sha256; t=1790081661; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LuSUVOg/+8pcIKCevoCknlwy/aWHw+OmaIJCJJVc15Z1M77ZnU5kpg5lPIU8NTPIZ6eCiWxCsUDg+1AOprD1KLxbP55CoNuHwmhEaxRIi+x/yJRVVLlZShWqzssD1vFPWzYvbGv+nhENFnPrfcBoTtAxdsnCl8o/1bg7OW+WQic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790081661; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mn/0dr+CmdV7IW05BdMO9xyGBz9iDvT3WGL6gg15rrs=; 
	b=F3afXiXWlePHFBwLwIMdCQKDBv603r8I2m9Na0z9gOZaKBXGGuPiogLsyYVBYEp2R5H90B9c+oHEzdKKsuZb9MEhBkMwKFMrEjYKhGEc3M9JNRgm4CyZbSisD/i9fXrXlPFjJCOdpwzhGOx8yCGAxCQE3QKMJOpkyaaAOfinPao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790081661;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mn/0dr+CmdV7IW05BdMO9xyGBz9iDvT3WGL6gg15rrs=;
	b=UgvDnQ6cuunmn+SxkojZHuPozaKHqRg3I0VU1gbA99Dr77SENCAMDWLxrZRdmK9n
	R9c1dxuB3Unmkd4bdWraaHlXvzUToWNMwVHN4t30MKRse1m3jKsSyBdZ4snajxeBgUP
	rbI65mVFM3YWjq7tP/Eywh+pwtoAWYJlApcp29hk=
Received: by smtp.zohomail.com with SMTPS id 1790081659597820.7490283033937;
	Tue, 22 Sep 2026 05:54:19 -0700 (PDT)
Message-ID: <b636eebe-552c-404d-8cea-3ae2d29ce4b8@collabora.com>
Date: Tue, 22 Sep 2026 15:54:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: synopsys: hdmirx: stop logging a missing
 signal at error level
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20260921-hdmirx-fixes-v1-0-495be0beaf93@pengutronix.de>
 <20260921-hdmirx-fixes-v1-3-495be0beaf93@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260921-hdmirx-fixes-v1-3-495be0beaf93@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/21/26 10:15, Sascha Hauer wrote:
> hdmirx_query_dv_timings() refuses with -ENOLINK while the source is not
> driving the connector's +5V line and with -ENOLCK while the receiver has
> not locked, and prints both at v4l2_err level. Neither is a driver error.
> They are the two states a receiver sits in whenever nothing is plugged
> in, and the way userspace waits for a source is to poll until they clear,
> so an application doing the expected thing fills the kernel log.
> 
> Both states are now reported through VIDIOC_ENUMINPUT as
> V4L2_IN_ST_NO_POWER and V4L2_IN_ST_NO_SIGNAL, from the same two helpers,
> so the prints no longer carry anything userspace cannot ask for. Drop
> them to v4l2_dbg level 1, where the other non-error outcome of this
> function, timings out of range, already is.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 75576a9366fd0..41f6112ec8123 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -502,12 +502,12 @@ static int hdmirx_query_dv_timings(struct file *file, void *priv,
>  	int ret;
>  
>  	if (port_no_link(hdmirx_dev)) {
> -		v4l2_err(v4l2_dev, "%s: port has no link\n", __func__);
> +		v4l2_dbg(1, debug, v4l2_dev, "%s: port has no link\n", __func__);
>  		return -ENOLINK;
>  	}
>  
>  	if (signal_not_lock(hdmirx_dev)) {
> -		v4l2_err(v4l2_dev, "%s: signal is not locked\n", __func__);
> +		v4l2_dbg(1, debug, v4l2_dev, "%s: signal is not locked\n", __func__);
>  		return -ENOLCK;
>  	}
>  
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
