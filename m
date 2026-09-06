Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE761FCE;
	Sun,  6 Sep 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788692572; cv=none; b=W6eeVBo72T/nVx2zlMH04o/8d/7nfWcd71J2P3K8TujB/XZ2xQ7NkB9Sjiq+HVfg8Bvz+tMNwukvRTflDfp83QLKxMubiYQzMdwzhkLeNzmn+NPHPk8wRVSDXVffRBNrokzSHmenu8/mGxZllm7QmVsJqMTfERDaUBfn/Xl+pME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788692572; c=relaxed/simple;
	bh=gQ7F2XAmG40vhtfTXqEGzKaleN7TiW7wxdd9n6FtiQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qE0NSsHWsXoRdQPi0+YxoPkj44ylOmi8zk5WjxNF8YG1E3mN15G4KC4CNRJkz1PJcdM0kn2OT1Oe2kL1LlYWKSB/mfPmNbyCzTrvC7KZw3WY8LaKbffmkLC7FL6Do9XYimkssFa1cNkdbE9CHnOmTjk1mEjXJG84umDA5q51560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=winischhofer.net; spf=pass smtp.mailfrom=winischhofer.net; dkim=pass (2048-bit key) header.d=winischhofer.net header.i=@winischhofer.net header.b=iEmLUVCd; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=winischhofer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=winischhofer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=winischhofer.net header.i=@winischhofer.net header.b="iEmLUVCd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EB583E95D;
	Sun,  6 Sep 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=winischhofer.net;
	s=gm1; t=1788692560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XPpsSvpp2RB4Qp0cbCfclENFYpW+anShDks5RU85H1w=;
	b=iEmLUVCdN5v21qVWMmNkQKCIxncdjnFfOdkEw2/7jSbanvNsSHLhqwKr0i8qVoKYle3sIY
	uRGSvbwj3WJD9htRiZRIAanIK/Dobi5uUAzQuCHxjjCNe8B21D/cdF1dMp9JnvWC5erkgC
	TY3Jwf+oaqK9xz0QwI44IFGnWoQtWhNlGaZ/GsixDltHTKdmntu197HFP7v1GEFvJ4wCYq
	GH2y+IUMdu3luVhaDN0sUmJVS/bLoEEjpYJ0baC3GbmpYMmbTapSVbx1y1P9NkMpFNg2dx
	8Tft4xuDrCZnJLNNcUm5rLHuEj/4hI04ZXXHAOnr9dTVWNrJ4OOl76IYCuh6HA==
Message-ID: <3aaeb58f-1a6c-4c90-bd29-2d4c0d7f5963@winischhofer.net>
Date: Sun, 6 Sep 2026 13:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] USB: sisusbvga: avoid initializing device in open
To: Michal Pecio <michal.pecio@gmail.com>, Ayush <ayush37735@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
References: <20260905193634.160600-1-ayush37735@gmail.com>
 <20260906081032.5ef81315.michal.pecio@gmail.com>
Content-Language: en-US
From: Thomas Winischhofer <thomas@winischhofer.net>
In-Reply-To: <20260906081032.5ef81315.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas@winischhofer.net
X-GND-Score: -100
X-GND-Cause: dmFkZTEGProMmK8mFkN83ZpUTf5upJyHV1+WexxplM+Tk/nu+HGv3hDI5k9HzuvQ1J0wXhPpdiwyCxv5Ci0k30Grhhdr6e7uKZNTHmZDZH8xy6TegOCLDsPvWaBMAFK2QUFIQOxk2HQP5rOvMxFeftJRY0jT8Inmx1oWtdsaCovWNFGfE1LkuTidnfwGHleCO5S+E9TWLC1PK7yT8vdOb/ZCDgwiRf2NfTNUiPycbC0rzKflZHTQUFWr7rd8oslgvuEN4+mCAXbi347OUy7zsjWsRz8oYa39amcO4ivgLazvYkLRhfpdwm3lTjJpGCX/Xfbc5vLE3UnjWAt8D1Px62SVk8zPfT58bJFBEcvfdqJCPHeYs+WqFK0OVo0ZrPeDDy8hjOrH2/5yKAIfY1rA+wY/6SjHBucPy9b61CFNnN2XhF71O1dSW/bfvgxgKfRgS5XJ4U4M/sZA1vqGmitRulNHTxHZxYjlaeITgJEa4kYVQUibIu/1byotQ//ONNOSnw5wnw12EfBMWBEHM7rtl5dWb6GvKY+YQXt9g9vwo2c0ZLXORd0hhRoxOmi3SY4u3ftuGXKwARj73zD/aQug3OCdneyfnH+meLgYJ6Tx6GmrxATeBr7BdYmI706uPcJYMsNI34x8h1d/wy1nMi2gM4wA/5MF3cnvZhAPc5rpRIn4WBGBRg
X-GND-State: clean


Sorry guys, wrote this more than 20 years ago, no longer have the 
hardware, nor the knowledge about modern kernels to be of any help.

/Thomas

On 06.09.26 08:10, Michal Pecio wrote:
> On Sun,  6 Sep 2026 01:06:34 +0530, Ayush wrote:
>> The USB core holds minor_rwsem while invoking a USB character
>> device's open callback. sisusb_open() can currently initialize the
>> device while holding sisusb->lock, and that initialization performs
>> synchronous USB I/O.
>>
>> High-speed devices are already initialized during probe. Treat a
>> probe-time initialization failure as a probe failure instead of
>> retrying initialization from open, so the open callback no longer
>> performs blocking device initialization.
>>
>> Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b
> 
> Does this even fix the repro? I see no syzbot test requests there.
> 
> It seems that even if you delete this code, sisusb_open() will simply
> wait on mutex_lock() before it even reaches this point.
> 
> The root cause is isusb_init_gfxdevice(), called by probe() and from
> here, taking 10 minutes to complete on nonresponsive device. This is
> the second time (that I know of) syzbot ran into this recently.
> 
> 
> Thomas, do you still have this HW and a will to improve the driver,
> or test / comment on patches? I suspect that those timeouts and retries
> in the init routine are vastly excessive.
> 
>> Signed-off-by: Ayush <ayush37735@gmail.com>
>> ---
>>   drivers/usb/misc/sisusbvga/sisusbvga.c | 29 ++++++++++++--------------
>>   1 file changed, 13 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
>> index 3e75a7c24828..6723a65b12b8 100644
>> --- a/drivers/usb/misc/sisusbvga/sisusbvga.c
>> +++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
>> @@ -2223,20 +2223,10 @@ static int sisusb_open(struct inode *inode, struct file *file)
>>   	}
>>   
>>   	if (!sisusb->devinit) {
>> -		if (sisusb->sisusb_dev->speed == USB_SPEED_HIGH ||
>> -				sisusb->sisusb_dev->speed >= USB_SPEED_SUPER) {
>> -			if (sisusb_init_gfxdevice(sisusb, 0)) {
>> -				mutex_unlock(&sisusb->lock);
>> -				dev_err(&sisusb->sisusb_dev->dev,
>> -						"Failed to initialize device\n");
>> -				return -EIO;
>> -			}
>> -		} else {
>> -			mutex_unlock(&sisusb->lock);
>> -			dev_err(&sisusb->sisusb_dev->dev,
>> -					"Device not attached to USB 2.0 hub\n");
>> -			return -EIO;
>> -		}
>> +		mutex_unlock(&sisusb->lock);
>> +		dev_err(&sisusb->sisusb_dev->dev,
>> +			"Device not initialized\n");
>> +		return -EIO;
> 
> Not sure if we really want to log every failure to open some device.
> 
> Not sure if EIO is the right code to retun from open(), particularly
> after probe failure.
> 
> And really, are we opening the device after probe failed (see below)?
> Seems weird...
> 
>>   	}
>>   
>>   	/* Increment usage count for our sisusb */
>> @@ -2880,9 +2870,16 @@ static int sisusb_probe(struct usb_interface *intf,
>>   
>>   	if (dev->speed == USB_SPEED_HIGH || dev->speed >= USB_SPEED_SUPER) {
>>   		int initscreen = 1;
>> -		if (sisusb_init_gfxdevice(sisusb, initscreen))
>> +
>> +		if (sisusb_init_gfxdevice(sisusb, initscreen)) {
>>   			dev_err(&sisusb->sisusb_dev->dev,
>> -					"Failed to early initialize device\n");
>> +				"Failed to early initialize device\n");
>> +			sisusb->present = 0;
>> +			usb_set_intfdata(intf, NULL);
>> +			usb_put_dev(sisusb->sisusb_dev);
>> +			retval = -EIO;
>> +			goto error_4;
>> +		}
>>   
>>   	} else
>>   		dev_info(&sisusb->sisusb_dev->dev,
>> -- 
>> 2.53.0
>>
> 

