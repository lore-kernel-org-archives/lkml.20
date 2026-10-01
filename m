Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313351C35A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887103; cv=none; b=ODrR6TqTlX1as0hoFuXWBoaDhj8SWHZiyC+KN0BKV/sR48SRxco0oCSvRGENZ32n9s8WAsSlbcknHOA3m8qqOofcyVWCKtcEoHx8ST6GcLJCAAyzKe+tbL1N1QVWeF8EVkf07Q05FxL2AcTn1Y8XleDmYZtHgWPsbtcuSS3gCKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887103; c=relaxed/simple;
	bh=pIo1tgaaINM3a3WYKaO6yshb5UUg8B/f5DzqFKT7IZo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=H6uMsmWERgrorsf+cc8/iGVRlaoytpA6puMkzDgGNOgPtTj52PRMUQc2bqACtOeTXTv9CY7EQdwBCUFZZ//2gAyyoPGGNeOkPUHKlqgdDRjn/gHUyG/UbTodNq5d0NSbs48KQvoRoAW8sbvdowPmU8Q2MjqdZWV12ryfEeAJhJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgCsyZ59; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgCsyZ59"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso2732574a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790887097; x=1791491897; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VIRDdFryvNABkvTz90F+SziqY6Mo856UvSO3Z/Ye4Ro=;
        b=qgCsyZ59vKIFzQ/Z37mA1Niu3be5KDI26XlGMWqawuHVUPt1fCWe/tCIX+fDFPLwyC
         qx5sPWNomh67SLBtie4GJTa1lZMfAFXVFqHPfx4iZ/Qiexz5vS1FbWVBayPKKp2GfEUi
         EqKAPL5ECRwki0nc/JT/K/H4JfTm+G5drwZgu8McHEyte5m7JjMc8+i8EskinHmb/xyo
         lMwi1FmTl5WOwAeFwZYe5L8u56jiuqYXkXknZDm8aiBahDxzym6EHoGTc7AN7bT5dfN0
         RF2B0U2E5O9PcCtyfVXyJLnF853Z19mdIpuJEbw4L8l1ps/Wj3Q5gupAd5VxgdoyWNYF
         zTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887097; x=1791491897;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIRDdFryvNABkvTz90F+SziqY6Mo856UvSO3Z/Ye4Ro=;
        b=G12lNLxUnHoeeh5q52lKXbsnzAYIxgW84D6+ktxlzwUhoNYsVoqH0Y6s76QwA1+daB
         3DbhdN0fcsH9fXhJXmSv96wjTST1BPWJ73TFZCep1t1ar52heRkZO7o/iNPnd97x7kWv
         Oil1q+pZ7zeqr88Q6eJdhp5A9Xc2JJKVMg0sPOKcNK3aqLqV0CBBhw+lWN6dOhZjGWGL
         0P9ubvoA5r/C77b8ojefM/nrp0arW4TlAdkLGMXDY2OMUAxaOAMUoaYyY/9Ad8SazYBA
         6wUh68douK4G/uzxkX1FoNeCDokJ3fT0wVc3eIjrFxybKMLlBHss4bSXOBJXaNYjDwvl
         /fFA==
X-Forwarded-Encrypted: i=1; AKwUvByx8bRXSdVkESv44/CTkt8lvHmrYVFf4uuOYvn2axeaksAb1iN3cm4hjWk+DQ9cYK6UIFqh7Iw8MbYW2ZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3QKPfmjACZ/29uGNuAqytxGZY34i2rq2IYPbP26J7PvgEiugj
	5ld6FNQE3ZXMZqD6zNMxLszftcbmnELDEQg080ooa0EuvemhDUZQr5fy
X-Gm-Gg: AYBFou1YrNr/OACCYi0TX3VbtdPNAvUFDc8v2QG849DJ6D+5eeEyifHovbE1q0IIDUL
	N9mbyQMi4zs9zL7AtKJ+pGAyOulp5VPv2Orvy+Z2L/K2yYFNFKGqrl9uGUgBT5xxI7Ni+WOJpsu
	YalzSDACqGc5WLuDwDTiJiUlZfXFhZCs9qf37nRrjTSlm5/mYn2DSmd/DnnBb6q7Ueqaddlq5Ww
	IEQjW1BNRYnBhcgDkb05FJWlpkJR1v8OX7n/jO9H4QgXrT7t2hd+FuYvy66r08eIhqzaKMI6vv3
	AfYLpurMDNAKVwDMKy9pvLaHTjL+3ldzXs8OuOEq3REkyrLBkOOIqxHtgLwCQQ0TA+mFsPoiPHU
	mjcmnz5BtdLYJB32peYHZCvXS2WRWUznuusdmPHrINYbEPItZHfKet3gCCWhuFB3e6kS8za8hDd
	nclxs3Nn/+pggdI8NUNNM0qSJutK0h0tcqDvJdNDLuM1LMVKVStUqfSvzZ7lw95DnJtXTE5iPVi
	3LBNLKTu2QNOW2D0yL/1IwiNTeL62kfPMj4lZFOQNI9MxgeVcUvwVOc2lCOvDrFX+KJqIjODiUT
	9eFT3aVvr+PeNdRlcBiQgeUC/yMqiLk2DeFmx/A8KA5H0chPiweeeQI3Ya4=
X-Received: by 2002:a17:90b:2583:b0:3a4:a850:6982 with SMTP id 98e67ed59e1d1-3a6cec53ff9mr594696a91.26.1790887097188;
        Thu, 01 Oct 2026 13:38:17 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcdac9f7sm89248a91.1.2026.10.01.13.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 13:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 13:38:15 -0700
Message-Id: <DLTSHPPY40S4.1G7I24UTEFX9C@gmail.com>
Subject: Re: [PATCH] serial: cpm_uart: use irq variable for
 platform_get_irq()
From: "Rosen Penev" <rosenp@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rosen Penev"
 <rosenp@gmail.com>
Cc: <linux-serial@vger.kernel.org>, "Jiri Slaby" <jirislaby@kernel.org>,
 "open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260925181530.52953-1-rosenp@gmail.com>
 <2026100157-unleash-anime-e2cf@gregkh>
In-Reply-To: <2026100157-unleash-anime-e2cf@gregkh>

On Thu Oct 1, 2026 at 1:46 AM PDT, Greg Kroah-Hartman wrote:
> On Fri, Sep 25, 2026 at 11:15:30AM -0700, Rosen Penev wrote:
>> struct uart_port has its irq member as an unsigned int, which does not
>> work when platform_get_irq() returns an error.
>>
>> Use a local irq variable to handle this and write to struct uart_port's
>> irq member when platform_get_irq() succeeds. On success, it returns an
>> IRQ >=3D 0, which is representable by unsigned int.
>>
>> Fixes: 831603b3e8aa ("serial: cpm_uart: replace irq_of_parse_and_map wit=
h platform_get_irq")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609251916.1XlVHLwd-lkp@=
intel.com/
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>  drivers/tty/serial/cpm_uart.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/tty/serial/cpm_uart.c b/drivers/tty/serial/cpm_uart=
.c
>> index 39f54bb7b485..ca0acccd3dd8 100644
>> --- a/drivers/tty/serial/cpm_uart.c
>> +++ b/drivers/tty/serial/cpm_uart.c
>> @@ -1517,6 +1517,7 @@ static int cpm_uart_probe(struct platform_device *=
ofdev)
>>  {
>>  	int index =3D probe_index++;
>>  	struct uart_cpm_port *pinfo =3D &cpm_uart_ports[index];
>> +	int irq;
>>  	int ret;
>>
>>  	pinfo->port.line =3D index;
>> @@ -1524,14 +1525,15 @@ static int cpm_uart_probe(struct platform_device=
 *ofdev)
>>  	if (index >=3D UART_NR)
>>  		return -ENODEV;
>>
>> +	irq =3D platform_get_irq(ofdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>>  	platform_set_drvdata(ofdev, pinfo);
>>
>>  	/* initialize the device pointer for the port */
>>  	pinfo->port.dev =3D &ofdev->dev;
>> -
>> -	pinfo->port.irq =3D platform_get_irq(ofdev, 0);
>> -	if (pinfo->port.irq < 0)
>> -		return pinfo->port.irq;
>> +	pinfo->port.irq =3D irq;
>
> Why did you move where platform_get_irq() is called?

So that platform_set_drvdata does not get called on failure.

>
> thanks,
>
> greg k-h


