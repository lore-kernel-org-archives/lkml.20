Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792850498;
	b=OwqlDwuBdSJ774HBzg5zL+UbMkf4Z4Wi6OPv+MgaOF6WDN7zvGgckU9Y48VN1+da17Tz
	 bKAtSeHjwak0fOxCxlWPTl86ocy9q3+5M7XdVYuLImUWJt6z7YEIvvBsbyv7NroIEYeVc
	 9dNfrpZSiOXFOtF0yN2s/15JaaTzZLhFvXLa9w4G970nvbVKRFcYvPyIHkQixbebrYpzQ
	 l7MyKP0tftCdLEzKROPmIDo6gFmhBfyB6/oK9nM+uwYiFR/GfciCedVa02MO/oXAudH7y
	 hYvJUpCrH6mArnZZFgjNElzc39m6wsAoaN8q/fQ8GihaTBln9r7bK6sEPxOxXDbVDQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792850498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
	b=KG8qKP7mscPbdVbu1KRZnmaLjHxVODJeYCTlXj+0/lG22Iizt9vdpCgbfsMf75+nHBOW
	 m0nXKYEyUOHiejtLJNA4ylT3+L8819HjYjUweYu8M8y5kXo8igvuHJGpQPk9czT5GrCaf
	 8/lnncodIJ0gWup61Njil5SYjDkDUPfznKcs87y1033LOHoTuAvR6Jwb2F9cNYTd1XUq4
	 TAzBQ6D304pgD2p0UX2WWonzAgX/U1eqedZV2s/PbgshAi2b8EyUEpA9HimCHKDHRmqVJ
	 yRt0WOj2HB2lXYn6WYnJLrsKiiwMoDQ+HY3BF3p0joOcDfqgD9BsZA+IE+5IYcOJBsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RIy57taI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RIy57taI
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1625530e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792850495; cv=none;
        d=google.com; s=arc-20260327;
        b=kDDbYizCrwHIivWEDtvEou+1CXZr4rDHp4Iz7qMZXJ839/YnbEk0DElftGYUKm3zY/
         GKZlqlbIYmE+QnDZgrdXmQRAF7vPhhfQvfCzzMUKtxdKjIMojFb1ceWOSWci4Vdmte11
         j3X/eGaC3dhIa2oicSnxVpUztRk70G0WhfoBPfOai7DAV8oFuo1J6CGsOeBNTXFFwsyT
         m8ldvdSrIjoPwkovF5zR1eC0UBq2kvVLdjSo+Tps/DAp7FNM3WMN3+6gxBBmjlXdCJ2l
         LT7jepRMxaWFuoaVYt498v8X3PorBdGkDDGCK1xVgAVk64WLk6c6YXX8CZMULuyZZiU+
         7pRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
        fh=cNi5eLEDMomp/4JsGVbKQ3dR3TCLCblW0d8wAafOEho=;
        b=MH3pwmRpmAE7vxS+qZ2eFWPkJ16w3OVKRczwQMPzVtgqnVDgsgTc06iajccfKLKgc3
         9THcfzM8ZznckOmzuOhuG808WSccBr5qolmsJ0dR61R2LGo4/AXeDKkCEqG/7K0ylFGu
         +I3LS3QfsnJVV7x5a2rmw3J6RAYWqVKi63AC/pYfcGL9oThiBdB/g1ar79oSiKlmaEqL
         1ANoieSM/ZZuMKmMTUlCyETO+NPadtBf7k8BY4hBby6UHtYxbQMMtpwci+KYVT8uFOaI
         4UjoFH0YRKfglXqqPnxwrMpwKiyFZrzOmMzf+621S3mv5cEb0Sa7q1K9JkiACRqjyTd4
         CYVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792850495; x=1793455295; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
        b=RIy57taIvA7vatJdScZJFnzWwk720Ygb4ewOH/fBbPbMLo4CmW4cHf6uEI4BNoQSge
         ihiWSpeanpYw10ZEjoH0PmC3W7j1YZxEyUmGoDBb7yMXEXPbGMy4/j4GBBEl0tmGtIko
         f3amjkzsWV8Ire6s9F0/0j4bg3yUuMz7ijiMxDnexnp0iwt/e7w4YrvzJ3svK/xHTqJj
         Nd1+YAdwxsZvbUFUGxcSws7WenrswcH8wBkrGzI3u0cNSHbQFQfb+JjEYo7GXxowtzz8
         3gcv+FrfbcX7VjeaZwdNCjtO0NLfMTxlNdqVq9ILg2gJ5F3yWLNyX645k490Jbo1bjUC
         5kQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792850495; x=1793455295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hs2l2qy8RZsJLMHRlnYs8TNlHuEDUdu45KHJmPnrBpM=;
        b=eoLcoXWDnslqAu5IzElgIBcRdqhaCgIE6biVxQYm8Iniek32SXLo7iiAyCSneCI3xE
         M7BMw4VcPkD+ZX6qk8IjUIDk5SL9C8Fw5Wy2vgtJxq3jX9ip6B4q6D6SwiZL3U/ST//D
         SwbRxDhHLAWjRhGcD8vrcai52aAgMvfA+gzTQQHBHaDZgYHJG7crc4VzCScWCrQvfVNM
         GSF0A5dGHO0Y8rFh+9E2fVlxuP9V3MsUdqvn6zVyWGNmn0V2L2W2UJhKN8q3HnmuTzdK
         PusXj6QTUD/ndOubhpMg5r4nyEVYHuaVVbbWMdhuYUqO2pLG8+LB8Feul2Q4mYCFCAfU
         yOJA==
X-Forwarded-Encrypted: i=1; AKwUvBxu3bNpc34rc70/hqyF+Cd6YejmGGMlDmkC5cgmjqKLsMbegS8+U4lXhZFntWubWyB5uwzeHHLkZVaxh+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWOR/tYDQ0nIK0Y2xl9bva40iba6m6a2UVSV4o/QRShMHbGny2
	YbPmEi+XUCV6uU++lIrHSecRYtldcNOYT9uOH638IQUjGlKHdryCj4VGo+LZ9vGfVfMUMobmdbl
	LTM/gfY4DEyq84juO099GWteSbp79E7A=
X-Gm-Gg: AYBFou0rbw1j2+gY4jX5Vs9Unf9SnGMgG1U5U/rs5dzgiRIe2h/+FMrvo+Zj+vv2nXG
	GIg4b2Q22mmcuWw8yVwlor7pK631c7tM4Wwfre30ZeL/u+gwznQ6vzTpQ7dMOrawJ/3Jul5G5Xw
	M/63iqcI6KDImvm5wlXm7EpoRwuHgRuyGL+iQN++wnKwEBTskYYYiEGzE4gOjybPWlC9EAEG+Cg
	tctIX3HrR2neL0BC92iaysVvOWoQWNdKX2kMI3O2ASuYukXwP3mnpYxf69yOEquDuueAgweifx1
	zsXnOOB+M1YX8ib9m/0Cb4XiX0RpMMCSXSirLXbtZpN4LguYhc6SoGOGfUdTVrAJnLzfnR0zKfc
	+lx0CBrJgdgG1+L35/ZWyFsQnGELnRtZozrH8dZkj/tmomj03d9Y24ShuKrGjXxDKyQ3OcCun9l
	Dx6Mg7DGxe96TbzhrVX1lPNhcULV3WVfIh7suSAHx9Qw94Zz7stnoq
X-Received: by 2002:a05:6512:398e:b0:5bf:b144:fd00 with SMTP id
 2adb3069b0e04-5bfb71c809dmr779570e87.13.1792850495146; Sat, 24 Oct 2026
 07:01:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260829145516.13500-3-edward.blair@gmail.com>
 <20261002082552.7084-1-ite_pd@ite.com.tw> <CAJDQNghzjreMHXTVEWTZ-Oyo1cCpzLyDUyt68EZvPD30Wp0txQ@mail.gmail.com>
In-Reply-To: <CAJDQNghzjreMHXTVEWTZ-Oyo1cCpzLyDUyt68EZvPD30Wp0txQ@mail.gmail.com>
From: Edward Blair <edward.blair@gmail.com>
Date: Sat, 24 Oct 2026 15:01:23 +0100
X-Gm-Features: AclHuK_nB-JD7Ut89NWc6ywX86lVHxDy-fHmXyTJWFi5xeriSZppXukQ1Oo5v_Q
Message-ID: <CAJDQNgiJCqAJQ+7zNLd+UD9vMuzu9e46zG5b5voKD+_gaKJcww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: add ITE885x I2C transport driver
To: Amber Kao <ite_pd@ite.com.tw>
Cc: W_Armin@gmx.de, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Amber,

Thanks for reaching out, and apologies for the slow reply.

I'm happy to drop the separate transport driver in favour of
ucsi_itepd. Would you be willing to take the lead on adding the ACPI
support and any handling needed for these ASUS boards?

Please feel free to reuse anything useful from my patches. I can help
test your changes on my ASUS ROG Strix Z790-E Gaming WiFi with ITE8853
and provide logs or ACPI tables.

The MSFT8000 enumeration fix in patch 1 is separate from the transport
driver and has Armin's Reviewed-by and Rafael's Acked-by. That should
remain part of the solution for these boards.

Thanks,
Edward


On Sat, 24 Oct 2026 at 15:00, Edward Blair <edward.blair@gmail.com> wrote:
>
> Hi Amber,
>
> Thanks for reaching out, and apologies for the slow reply.
>
> I'm happy to drop the separate transport driver in favour of
> ucsi_itepd. Would you be willing to take the lead on adding the ACPI
> support and any handling needed for these ASUS boards?
>
> Please feel free to reuse anything useful from my patches. I can help
> test your changes on my ASUS ROG Strix Z790-E Gaming WiFi with ITE8853
> and provide logs or ACPI tables.
>
> The MSFT8000 enumeration fix in patch 1 is separate from the transport
> driver and has Armin's Reviewed-by and Rafael's Acked-by. That should
> remain part of the solution for these boards.
>
> Thanks,
> Edward
>
> On Fri, 2 Oct 2026 at 09:25, Amber Kao <ite_pd@ite.com.tw> wrote:
>>
>> Hi Edward,
>>
>> On Sat, Aug 29, 2026 at 03:55:16PM +0100, Edward Blair wrote:
>> > Add a UCSI transport driver for ITE8853 and ITE8800 through ITE8805
>> > USB Type-C controllers found on desktop motherboards.
>>
>> Thanks for working on this. I'm from ITE, and I wanted to let you know
>> that we have been upstreaming a UCSI driver for the same controller
>> family. The driver was posted on 7 Aug 2026 and has Heikki's
>> Reviewed-by:
>>
>>   https://lore.kernel.org/linux-usb/20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw/
>>
>> A follow-up series extending it to the IT885x and IT527x series has
>> also been acked:
>>
>>   https://lore.kernel.org/r/20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw
>>
>> Both drivers target the same register interface (CCI at 0x84,
>> MESSAGE_IN at 0x88, CONTROL at 0x98 and the vendor interrupt registers
>> at 0xbc/0xbd), so it would be better not to have two drivers for the
>> same hardware in drivers/usb/typec/ucsi.
>>
>> Our driver currently only matches through OF and I2C IDs, so it does
>> not yet cover the ACPI-enumerated ITE8853/ITE8800-ITE8805 devices on
>> the ASUS boards you are targeting. Would you be open to adding ACPI
>> support, and any platform-specific handling those boards need, on top
>> of ucsi_itepd instead of as a separate driver? We would be happy to
>> help with review.
>>
>> Heikki, Greg, please let us know how you would prefer to proceed.
>>
>> Thanks,
>> Amber Kao <ite_pd@ite.com.tw>
