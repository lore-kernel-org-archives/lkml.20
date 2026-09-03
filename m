Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0FB30569A;
	Thu,  3 Sep 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449495; cv=none; b=g5rantEHOQHRx46BBeMq4iiRve/yvI/nmG3gi8WFN5Wpi4Tg6n1XKGQxNjLlxwvFHchrzV7vC65xAJYhtZBj+m/fbhLrfNPhQOoEpJwdOxMu7RgPcsY2bzo3E3Uc2aZNGr8nJmQAlFSQxqtjHn4NuKCFXtF2CvoRYY0MQMN+oJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449495; c=relaxed/simple;
	bh=EyDl/FWGpYfHrWymKsn/ykHOvKhYJJifQ09CWbzilJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC5Wy+/sctiV5JGKyxZzTqqMZyzXkdXTCd92WXCTIurAfDbBLY1ERxR7+f4xAgcIdINzXp2yjz1TiRqntLaxNWGF+DFruUWJV0WcSmPGeGizBeV5sdgx6g2mNeb3E9FviC89S9P2kg4k9/bM/CWWmDDiEycud4dJ0MDzQDMcK/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHZl1nls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHZl1nls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BB41F00A3A;
	Thu,  3 Sep 2026 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449493;
	bh=/5eQMdeKRH6pLoh681oacpbkpiM7jYz3GIWcNRfH/PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FHZl1nlsmTToJJd5gnqal1dom8qN9pCsuc2R1/o+MbUr4IV/SFl3M2cmrb9M3CwHU
	 4E8I9RhK/20+L5fuUcFtG3OWG86ZjdPcjff8NBHtaajMmlONXfPG917w04YtI4s9jc
	 M9oQaoncy2bm1h+8ORXHH02A5MI/T6S3tlOTMDwN0O2zAIzd6A+IFOpQKMZYFhNUw0
	 z5oIHpOGfBemlPaXLJKLnNdCM2DHXOy8Ibre2fVfVsq1Eu90b67KqGr8nsSo8SOyc/
	 Oxd4cWN7/xJxUHhdpBC5KCqDgZdczS/APj7xUQAisClVkA3AqrV9wqsVKcx/hKBybm
	 CfIlnKORdsmBg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x29PX-00000006FLj-2jBh;
	Thu, 03 Sep 2026 17:31:31 +0200
Date: Thu, 3 Sep 2026 17:31:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Zhao Dongdong <winter91@foxmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Dongdong <zhaodongdong@kylinos.cn>
Subject: Re: [PATCH v3] USB: serial: option: add support for SIMCom SIM8260C
Message-ID: <apmS07JLY44gttFM@hovoldconsulting.com>
References: <tencent_B18DE28D9B60D11077C30C3297EDF6CF3B07@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B18DE28D9B60D11077C30C3297EDF6CF3B07@qq.com>

On Mon, Aug 17, 2026 at 03:14:27PM +0800, Zhao Dongdong wrote:
> From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> 
> Add support for SIMCom SIM8260C (1e0e:902b).
> 
> T:  Bus=08 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=1e0e ProdID=902b Rev= 5.04
> S:  Manufacturer=SIMCOM
> S:  Product=SDXLEMUR-LITE-MTP _SN:120696AB
> S:  SerialNumber=0123456789ABCDEF
> C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=896mA
> A:  FirstIf#= 5 IfCount= 3 Cls=01(audio) Sub=00 Prot=20
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan_simcom
> E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 0 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
> I:* If#= 6 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> I:  If#= 6 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> E:  Ad=05(O) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> I:* If#= 7 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=option
> I:  If#= 7 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=option

I changed these entries to read

	Driver=(none)

> E:  Ad=89(I) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> 
> Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> ---
> v3: Use USB_DEVICE_INTERFACE_CLASS.
> v2: https://lore.kernel.org/all/tencent_E58647B4DE1D2583D785AFDDE58EB278FD05@qq.com/
> v1: https://lore.kernel.org/all/tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com/

Now applied, thanks.

Johan
