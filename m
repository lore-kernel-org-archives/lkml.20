Received: from smtp68.ord1d.emailsrvr.com (smtp68.ord1d.emailsrvr.com [184.106.54.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5735B3E0C4A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171808; cv=none; b=Fws/YdW3fmu3/XjrHVkS2yaNyIfVRuvzO+CoB1CxelzFQ7Z9zlqWSWh03ffYyM0rhGP7Nd+fqYH6L7zfyNTnGE1YpaxbR6lD/s97958bKqrWRRVZJNiMYDE4iv5iVcetboUKVM2aN9YKmXY+GD1JHCoNDiRmg0J38Ritzg1GVuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171808; c=relaxed/simple;
	bh=rJbi9HnWJ6hsy9VsgD0sXvgSN820WQPgudLb959hP70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSA2hwCrVxs1rI5AOQZavLEdwLNqpuQrl6SKve9R0Z0rZ8tovUvPZCnPjT89pDrwcBfCyH6WsNMcku9u7pN63aGkayLJovrURwzkLYYyxMgi/vMuN35WG7lf02DPlgkRyiSGYX8ty7cz7azeN1OAjZyiujUi9vH6m6WeSGvtfMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=H55e12z9; arc=none smtp.client-ip=184.106.54.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="H55e12z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1790154693;
	bh=rJbi9HnWJ6hsy9VsgD0sXvgSN820WQPgudLb959hP70=;
	h=Date:Subject:To:From:From;
	b=H55e12z9yWI3m1ng6GDUFTi2euQkrSF4UTZSHY94n4EbjEAXaS4OWxsl1hnmNBLsK
	 lwCiTBUUXO28NNjMrsj0TcvJ5MX5PiJQfuCelThtJReX2DIjBUdxyyVky6NQfBw6qE
	 wFrpZlLWZ5hSJiGtg+8fx4K9qDLrqxf6m1co9f40=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 44A0040215;
	Wed, 23 Sep 2026 05:11:32 -0400 (EDT)
Message-ID: <21bad709-afa0-4864-b1ce-c0b4427b91f0@mev.co.uk>
Date: Wed, 23 Sep 2026 10:11:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] comedi: dt2811: fix shift-out-of-bounds in IRQ check
To: Pei Xiao <xiaopei01@kylinos.cn>, hsweeten@visionengravers.com,
 linux-kernel@vger.kernel.org,
 syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org
References: <6ab21240.e548f532.1ca396.0018.GAE@google.com>
 <02c46315293a26169d2a3862a2047959a1651ef4.1790061387.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <02c46315293a26169d2a3862a2047959a1651ef4.1790061387.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 7ba2016a-fe11-449d-9d2d-ccca2bcaafb3-1-1

On 2026-09-22 10:19, Pei Xiao wrote:
> The IRQ number passed via comedi_devconfig->options[1] is a signed int
> that comes from userspace.  The check `it->options[1] <= 7` does not
> reject negative values, so a negative IRQ number reaches
> `BIT(it->options[1])`, which is undefined behavior and triggers a UBSAN
> shift-out-of-bounds warning:
> 
>    UBSAN: shift-out-of-bounds in drivers/comedi/drivers/dt2811.c:570:31
>    shift exponent -251 is negative
> 
> Add an explicit lower bound check (`it->options[1] >= 0`) so that only
> valid IRQ numbers 0..7 are accepted before the shift.
> 
> Fixes: f2975a9b2ab9 ("staging: comedi: dt2811: add async command support for AI subdevice")
> Reported-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6ab21240.e548f532.1ca396.0018.GAE@google.com/#R
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/comedi/drivers/dt2811.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/comedi/drivers/dt2811.c b/drivers/comedi/drivers/dt2811.c
> index 0438b8c90e44..53cb17993ae7 100644
> --- a/drivers/comedi/drivers/dt2811.c
> +++ b/drivers/comedi/drivers/dt2811.c
> @@ -567,7 +567,7 @@ static int dt2811_attach(struct comedi_device *dev, struct comedi_devconfig *it)
>   	dt2811_reset(dev);
>   
>   	/* IRQ's 2,3,5,7 are valid for async command support */
> -	if (it->options[1] <= 7  && (BIT(it->options[1]) & 0xac)) {
> +	if (it->options[1] >= 0 && it->options[1] <= 7 && (BIT(it->options[1]) & 0xac)) {
>   		ret = request_irq(it->options[1], dt2811_interrupt, 0,
>   				  dev->board_name, dev);
>   		if (ret == 0)

Looks good, thanks!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

