Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A437443C39;
	Mon, 14 Sep 2026 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385012; cv=none; b=fBkgt+kPNWG3u6vvJ017BjvsQChVOb9+zCrQ1kAj2lr0p1WqN13W5vLhne3J6YyaAkAuYxR6dh5uJBzuUIKdQP02jmAvu+vbs8N/+VgK2335FJWah0gbAzYYdPu3FpGx8C/Ra3i1e2kVhqTKrM76jN/kkZ+kJSBYAstZRGl0fCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385012; c=relaxed/simple;
	bh=5CNt0QGx4zLWnjgEbjHZLHCAoTVd/ttj8A2ZBQRrnM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j541nzW0FBVSfT6LjsqDZtELMlpkiYOqlv6kdw8SSppv8FtT6thj9NkXdq6M77NZ8/UvsorKGnMZoMDoehhZheyGpv2urmKabLLlUheWSH4QQOsEf1cJq4BIYUVu3HWH3xwF1BbUBqk2v8ftk/aqRfvgGFu2qMHiCf93PiEEt0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=YqX/jw3r; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="YqX/jw3r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NZYiYb0vHx2G4AzcO3FiZ8Swm2+PzG9tiyea+bzLK38=; b=YqX/jw3r2oulYcxoxyP5KPPl1p
	hltJx/pEjC38GXjBXFyIncNRr+wla3YpqFmDpMEIvWjz/mwFrWGwPDXD/T22Raugxgcn1PhYPgb85
	IIJu/N+6ftqNwoX5meC1crBT0l3hOiEZj5gsvMXEgdHTi++fohPeQXUubW1pTYSeKDmE=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x64mI-00000009erv-2tIe;
	Mon, 14 Sep 2026 14:23:15 +0300
Message-ID: <e31204a8-d4a8-47e6-85b8-084f5b2e8c2c@minlexx.ru>
Date: Mon, 14 Sep 2026 14:23:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panel: novatek-nt36672a: Add panel for Asus
 Zenfone Max Pro M1
To: David Heidelberg <david@ixit.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, iAboothahir <aboothahirpkd@gmail.com>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
 <20260913-nt36672a-panels-v1-8-ce097402c6ea@minlexx.ru>
 <757d826a-739c-42f5-9671-9348a1480951@ixit.cz>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <757d826a-739c-42f5-9671-9348a1480951@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.09.2026 15:47, David Heidelberg wrote:
> On 13/09/2026 07:36, Alexey Minnekhanov wrote:
>> Add support for TXD TXDI600YANPA-43V3 video mode panel based on
>> Novatek NT36672A, used in Asus Zenfone Max Pro M1 smartphone
>> (asus-x00td).
>>
>> Co-developed-by: iAboothahir<aboothahirpkd@gmail.com>
>> Signed-off-by: iAboothahir<aboothahirpkd@gmail.com>
>> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
>> ---
>>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 281 +++++++++++++++ 
>> ++++++++++
>>   1 file changed, 281 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/ 
>> gpu/drm/panel/panel-novatek-nt36672a.c
>> index 1bfa808365874..954ab24c9d00a 100644
>> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>> @@ -468,6 +468,252 @@ static void tianma_jasmine_init_cmds(struct 
>> mipi_dsi_multi_context *dsi_ctx)
>>       usleep_range(5000, 6000);
>>   }
>> +static void txd_x00td_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>> +{
>> +    mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x20);
>> +    mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> 
> Just for a start,
> 
> 0xff -> CMD2_P0, datasheet page 6
> 
> 0xfb -> Set non-reload MTP commad, page 12
> 
> This driver has amazing datasheet, so the driver could look like a real 
> driver instead of dump of the register sequence :)
> 
> David

Yes, perhaps, this can be done similarly to how it was done in
neighboring panel-novatek-nt36672e.c driver, but I though that
this patch-set is already big enough and explaining commands
can be done later.

--
Regards,
Alexey Minnekhanov
