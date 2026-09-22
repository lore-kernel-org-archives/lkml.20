Received: from smtp75.iad3a.emailsrvr.com (smtp75.iad3a.emailsrvr.com [173.203.187.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ECA2931DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.203.187.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072805; cv=none; b=FBTqSsU2RnXNWv3hvvIqvDfk0Fe5fN7TDAUNlpt/91osDXY0DHy1g1Kp5jr5se+4pEXmoarlXPGIGQIElMAqZsCgx3aGwhHjihczMmym4Kpu1nOU/b5TRNHp/qa15cJn+mW1OF4a8HMkn2Spg81kh9Byricw1f55vn1KHapeDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072805; c=relaxed/simple;
	bh=cIKsdEqn5qUHbac4QNbLe91QlqXczcE9E8NMi1VtNTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwkyeidFQOW4bOeRxjAIl39YM1A2T4kkt7Ui1EL+ScKK5ckP4quiJkXgrOZPw4MfVIsce/q6KX2/ZmlPpsfw5273kxBYqCK4eWO+GjHyH05dT0X7KE577JxTnts1IjRY2DQsyAKU+hSGdZ17mPVVSy/sZlG/3XcGoVqFqHl4Jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=nObS85N6; arc=none smtp.client-ip=173.203.187.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="nObS85N6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1790068271;
	bh=cIKsdEqn5qUHbac4QNbLe91QlqXczcE9E8NMi1VtNTc=;
	h=Date:Subject:To:From:From;
	b=nObS85N6RmrfiitXanGidhBxLKncqMRefUJE0E0TFkPah91pRoCC2LuaddG5zs8Xk
	 1VeRQP2N9RuspxVTIBwAxsCTKEMyRxVN53zTzKotW2G3SKNCp1jpD8ZMX4H3cN/mmV
	 56Xon9edMybnojdDHgddu5zOe9zUSD+rKUlcwarc=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp26.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 94A8642BF;
	Tue, 22 Sep 2026 05:11:10 -0400 (EDT)
Message-ID: <82ccb90f-4d0f-44a9-ba3f-11c391cd4bca@mev.co.uk>
Date: Tue, 22 Sep 2026 10:11:08 +0100
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
Cc: syzkaller-bugs@googlegroups.com
References: <6ab21240.e548f532.1ca396.0018.GAE@google.com>
 <02c46315293a26169d2a3862a2047959a1651ef4.1790061387.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <02c46315293a26169d2a3862a2047959a1651ef4.1790061387.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 6b78e079-b836-403f-bd19-cf48c29e8ff6-1-1

On 2026-09-22 08:16, Pei Xiao wrote:
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

Please could you resend and Cc: Greg Kroah-Hartman 
<gregkh@linuxfoundation.org> ?  Thanks!

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

