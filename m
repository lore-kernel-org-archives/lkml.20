Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04334F30E7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646894; cv=none; b=Wj4NZ+Gt73DAzJzr+0HeX7lLmsvEEfp0Hns6aLuwc2pAESTjOB5EdauMDmOghFVfKrTZUcw2Bwmrd7YOrCS5Oh7z5svjdqwAcLD1J1ea8BeLza5bkp8qD+B/395OPOcD1Jp0PxpszKuf/FS/aA1Y3TlKju4yPsb1b3LTb5o/G+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646894; c=relaxed/simple;
	bh=qGEEwGPLJZyTx9/fJ99JJxZZqNqLvVtpP+tTRW/DsX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3dCDvrfbvPr3JBidnMSnyASxKTh+nqOvhbAeXn4ceBO08y26QKj/dB8F4MHs6dVXbOLXcCx/1kn2DGQSwNvYSYE0SEZ8WNPB66zp/R71RLxHEp3SMW0LlHivcRf4BDLTv1C1dRY0tj3y4Z4WxAM9H0axlC1J4grKG0xBBh/9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EauUUTBn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ipj2Ybuf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EauUUTBn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ipj2Ybuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789646880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zYSbCs0dChsICRMByZbNTA3bHhmkFa+zStPmUptq2c=;
	b=EauUUTBn44hNi/LHdWhLjOc7PaT46V7F5pCAhfBNgwmw/IJm04YVELJ0jOfgelkWaiUMw+
	O1roEtigdDDBmW4NeV8OPBAo2vg2ELGkXufO7U4Ck7wcG+BxeVlSouITiaiuSBeaseNrzK
	ZdSEY4SQggVtSBnmqCmrGQVA4Bof5iU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-5Gc45cE1MsCxsWGA6aGLQw-1; Thu, 17 Sep 2026 08:07:58 -0400
X-MC-Unique: 5Gc45cE1MsCxsWGA6aGLQw-1
X-Mimecast-MFC-AGG-ID: 5Gc45cE1MsCxsWGA6aGLQw_1789646878
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6862e924so5861845e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789646878; x=1790251678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zYSbCs0dChsICRMByZbNTA3bHhmkFa+zStPmUptq2c=;
        b=Ipj2YbufbpYeje5gOy4kugDcqzh5jXVZw5pc9fe1Ym3aBM0r2kwbkuaeCt/K9pwhT3
         MT871EwI/ngKfzchZecX8CYib2mFrwC0SaVSNyK/T92bHAzqI0WnGgtQhUf0pHlVDvsO
         VRNaXN96VV4vs9OY0On5vOBvBYy821W6ucppUqvs5/ICU9p/uecNnvyIsItt3U8q2plC
         ksX6h4woji3LYBDOW6zjQU4B11y1H2Jlq/rvpZ+SAic+qzpuA2K5q8paNcXMpJHBlJBZ
         KUpAOU6e03INqfT2nJHbWajPUzufFs+SeOnreIiFpjsVjC9XKDpm1bHVTstzHxQRU8tw
         WW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646878; x=1790251678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zYSbCs0dChsICRMByZbNTA3bHhmkFa+zStPmUptq2c=;
        b=cs/mM21GZp8JuuKZ7sgIdLQOcMO12I/DN+5FQsV9KI9ggJlP1kljqwxnqMoBM58z8w
         Jbl0mNZzSHqysD7BP1o6+jZKj3T8DOAJF/e3DLycTYHAW4JGDB0h3ZiqZZN4hbjTSoTM
         VcNfkyfH2x3SvjFljT81XPgd8eX2gjHpf1WqnG4q1ZyUn3gAhdcDTtO6mV4wdIPwvKDF
         E0grs3JpNL0oUK9TyfWk8Yrl8O9xhrhi5zuc39JUHzo4PKLIoiObCgE7kp6Z+JnHGNG+
         ohHSjWPOXCJJdizgj1pzRDHaCzPpumLpjHHJkbz6CyFsnpqaUThRHy6Zsh7O5tyGK1uY
         8VEA==
X-Forwarded-Encrypted: i=1; AKwUvBwP757zurjuECQ8PB7uwSHsgwaRpUu7kh5eTeGi4RotvvcwuilqpE7g30BXCCPS8I5qJUPcsz6A5dTQOd0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRPmXxPFIikxFxGn9XThqVZFpzoW3AhVRzwDiNYAjM0LR8w0mB
	yJqAWQtW0mXth17F8AHT20dXU1WwTekdjxndgrmE2NMwReZgHznEooAToX9aFgxDSfO9EM7+YsG
	Ph4G/oGpgDqaxow7s4Af87+uNnlhD0alpvPGYyHVcBX2xm1gtS7uWUAhTCSZzgqZ5HA==
X-Gm-Gg: AYBFou3X3s3qW03G8niaUC1x7bt67W5NZlRWDDtJ3cW4CosZwztqp5BdepTFpNj3Y6l
	5w24dJPibhpUTc3BAHSlapqNJVyraiVsvtclY770oAnYyqzkKa10sPIHPgCve8eXMGL9l29zpdj
	XkAbsv2tghFPbLTmIJnXG5N7ACS0Icrw84I999d/mRtcS4GCZMP17m4WTzqPInfp0mZ5aoD2CyM
	OuzsQcESoYorb8HLFqVMc6saaOpa9WTMiYFB2lCy9OIjvwgM3n/rXvBKnjYw3Dt4l52ZPdvy35w
	qTOlg3qZ9DHlTFoBPGDGjGxi5CV6H80LhU5pBoLnH9BYYqOtTdmHC3LV+HbTQ4R9ISP6t9DwXyc
	t+vRRKkI3DiSeJYL7GDbYvEPwr3OgxSTafFoQj/GGhxc7mvnQhgWIcJD52AnKRPTDa7gKQ0BZ2g
	==
X-Received: by 2002:a05:600c:4691:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49eb733cb1amr79199905e9.25.1789646877637;
        Thu, 17 Sep 2026 05:07:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4691:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49eb733cb1amr79199445e9.25.1789646877231;
        Thu, 17 Sep 2026 05:07:57 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm71394955e9.1.2026.09.17.05.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:07:56 -0700 (PDT)
Message-ID: <c308f5b2-05bd-470e-bc60-bdf7038b8b65@redhat.com>
Date: Thu, 17 Sep 2026 14:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] ch9200: return error on failed register writes in
 ch9200_bind()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>, netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org
References: <20260914202503.52920-1-s.shtylyov@auroraos.dev>
 <178951445003.22033.8083675025384414442@kernel.org>
 <9fad10fc-dcd9-437e-b422-018638524632@auroraos.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <9fad10fc-dcd9-437e-b422-018638524632@auroraos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/16/26 18:58, Sergey Shtylyov wrote:
> On 9/16/26 2:20 AM, netdev-bot+sashiko@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider:
>>
>> Critical: 0 · High: 1 · Medium: 0 · Low: 0
>>
>> - [High] Ineffective fix: the six newly added `if (retval < 0) return
>>    retval;` checks in ch9200_bind() (drivers/net/usb/ch9200.c) cannot…
>>
>> --
>>
>> ch9200: return error on failed register writes in ch9200_bind()
>>
>> The patch adds error checks after the six control_write() calls in
>> ch9200_bind() so that a failed vendor register write aborts the bind
>> instead of being ignored.  It carries a Fixes tag for the original driver
>> commit 4a476bd6d1d9.
>>
>>> diff --git a/drivers/net/usb/ch9200.c b/drivers/net/usb/ch9200.c
>>> index a206ffa76f1b9..ab3cd3902ed72 100644
>>> --- a/drivers/net/usb/ch9200.c
>>> +++ b/drivers/net/usb/ch9200.c
>>> @@ -360,32 +360,44 @@ static int ch9200_bind(struct usbnet *dev, struct usb_interface *intf)
>>>        data[1] = 0x0F;
>>>        retval = control_write(dev, REQUEST_WRITE, 0, MAC_REG_THRESHOLD, data,
>>>                               0x02, CONTROL_TIMEOUT_MS);
>>> +     if (retval < 0)
>>> +             return retval;
>>
>> [Severity: High]
> 
>     But why? 8-)
> 
>> Can these new checks ever observe a failed register write?  control_write()
>> in the same file discards the USB transfer status on its normal path:
> 
>     By "failed register write" I meant any error in control_write(), including
> kmemdup() failure (which precludes the USB request from being sent at all)...
> 
>> drivers/net/usb/ch9200.c:control_write() {
>>          ...
>>          err = usb_control_msg(dev->udev,
>>                                usb_sndctrlpipe(dev->udev, 0),
>>                                request, request_type, value, index, buf, size,
>>                                timeout);
>>          if (err >= 0 && err < size)
>>                  err = -EINVAL;
>>          kfree(buf);
>>
>>          return 0;
>>
>> err_out:
>>          return err;
>> }
>>
>> The only return err; is at err_out:, which is reached solely from the
>> kmemdup() -ENOMEM branch.  All six patched call sites pass a non-NULL
>> 2-byte data buffer, so the only negative value the new checks can see is
>> -ENOMEM from that allocation.
> 
>     I kinda noticed. :-)
> 
> [...]
> 
>> The sibling helper control_read() already returns err on its normal path,
>> and ch9200_mdio_read() checks it with if (ret < 0), so the convention
>> control_write() is expected to follow already exists in this file.
> 
>     And I'm extending it to control_write(), but in another patch...
> 
>> Would it make more sense to change control_write() to return err after
>> kfree(buf) instead of (or in addition to) adding the caller-side checks?
>> As it stands the commit message claim that this makes the driver "bail out
>> of ch9200_bind() on failed writes" does not seem to hold for actual
>> transfer failures.
> 
>     I'm getting bored...
>     If any *human* maintainer insists that I merge the 2 patches, I surely
> will... Or maybe I should resubmit both against net.git (net-next.git?) as
> a series?
IMHO the patches are so strictly interconnected that should land into 
the same (net-next) series. No fixes tags in net-next patches.

Thanks,

Paolo

