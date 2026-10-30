Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385548;
	b=cVBZkT7HzrwqIMF367W6x3HfnEVnrQYqKtBLAJignP2KR4d+xhMF5vVZLkZ6hLpfTfoh
	 qLJ04rF2x1ojhFp4PXv9sjxaqep1CygxMtIZR8c+A8IcYbzBhnnng4rp8rfGqMWKWZ7eW
	 /WT/dAPxxrINNmBSjSN39lnYRrcpI5X5XInoXnudPJhyc3nrnjIn4OcUhJyValIVbUl+S
	 w66X+VUx4BDPnMsX282VZtNoV0Mi1QI6NtrpzrOJJWXGG4zndOf6S8+w9nM3gWITdRO0q
	 Q/PkAGyK+YCwX0FW15i86Y0jkm9Gn9hh1S6otny+MMYQkn5kM9s16DOuzqOPAjfyhhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cM+BvkDxP8fM78hQZg5AYrn5YUAQx7WN9vYLoZ70OUo=;
	b=rH09Pn5NnI0N49Eu1eB4tXRD0moAO0RzCvVa3AFyCecsGhLQatwCysS9Du41ZaudPMXI
	 PpcvPxPGEkkh8GOr30AkUrnJd/Qlmlf411LR+jFaAGtMJbkfIs0SDAqJpC+0k+gktBdu1
	 hxLqaoq6THVLvQ0gtopo7DpqdUVde7VuXVjoGhvnxJuC22uXUrv+tvNWSxQLx7quC7cxn
	 CwHasfmSVnq5KECce1fcGHS3ldaSL7B3RnI8qZw+Evb/BDH7xIgZiLG/6S/eCrjfbL3NL
	 7QQrXz7vb1ffyFDb3EWSmZO8L9TLf7wWMVYF4FcM4c0mBXGK27iZqMFWj3BAqk1aP0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0jDxw+g;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DFD2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0jDxw+g
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so1338455c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385547; x=1793990347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cM+BvkDxP8fM78hQZg5AYrn5YUAQx7WN9vYLoZ70OUo=;
        b=t0jDxw+gwG9FlkDiEEVKvJaGAMnA0fNNcq4vgNLzqnEQ0wgefhM8hHDjvJHbU4urig
         ZK/LbzZbDDXFxa5we+5dvRUq34ibd/Er8cHs3w5LD2Cc6ZnLoMubT9It4w7KF20N5xY4
         itU//CqLRqBco9eTk66evHlYiF0s7qxOhR8cm1Js5PMWBoAT6KS6LYbAl1EKBW2is0IB
         1hvxsNSEXCXS+Cf5IZsGZWIoongcTVYTGGsIJ+KrgT8eDM+Ylb29+k0yvtbpGPAGwrAl
         SDQVoEbP+vAn4gtgCUB0JeUzIR99YqVXZTy+YbU0AQ8TI2VqBAgGqI1Cof9PYQGgOwLA
         D4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385547; x=1793990347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cM+BvkDxP8fM78hQZg5AYrn5YUAQx7WN9vYLoZ70OUo=;
        b=AwhNfU4Et2gIN5GPzV2L420PLfXianRp67Lg9heWbB0o8ClcH5RdmoscgFtNDpd+9Y
         j14glWXzlkRcvljmntqDDT7uvuC0jvvIJMgd813cwZCMTumt5TMMGXy2mHMhgfqTFADq
         V2KrcnjBYMBv1yPVG2ARuco0LpJfpwMIGFduALuUxp3WMFIFxJvNga8fu10HZutELqRy
         3Hk6vbBFcYbrcwxZhhi1xnh3MsShxncZ8DjV/dA94DCOZ6UarN7Fw/5uU3TXDukT+rHl
         qh92Ips8SRr9DagMYvIrO58lq0zGZRNQlzoJd/g8AJ8fe0K5nUKp5uHr/bR9xMnW9swW
         o1+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwuOGB8sS1TAI5UVV3ocFRl5IHhO4ECdBdKptsy/+MCLzZjOIT4fbWT79VjD/qBdv1Vfj8olh6nfm313ig=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMcANd8ACefUBvFIW9C0tuziXYETWWdScS8sFNgNw6kDrEY4CE
	QZE9Er2kGwhMWLres756JlUDdgSv3sxsD6Z+x4bBZggEHJjGcbuhNSIa
X-Gm-Gg: AYBFou2lzM4Oa2wKSCyFTao89h1VgMEkXrdXaCPKAAMBFUlTX0/a55mB9L8fv0p/l7G
	Sm8cuodzXI72lhSulzEVXD3r6uy8aDRXtdYYMz4kpx5RTc9yYZXK6/aZ2Imu3jwS1CuzFJSyfGh
	VL9sgj3v12eDg6f3+MCpD7i+Md7mAWHudJigas1tCg3XBI1NIWRKTe18QRMpyHSzJmKfTcB6dPu
	/up6imeJeC31HgfYIGE8AHv0TxuzYhhklbagUN8Ed+Hoo4JgOn0Bc/Lu8WjPnPB0PbMHcQBFfAb
	ZDoEtmwA9nci0AFbOs6pshBSV9uhTpIsWuBmfUx4Hec9SaTEtzRMySywfIkczc7ocFdsLgv+TQQ
	6Rk90H+Y8cyxG5BH2pwJPYdkJR44kvzj96/sTjIiG4lbJ17WJb+0XsXZfivy7Mc8K8E4AyqdrXU
	zPPsWLxAYRturZyhS7ocMOGDgO51V67CnNcBNUdhLuQqfquo27WRmVGwOt8LC7POuUZSK3eH0ip
	+HZM2yPH76muBbAyNRFSyvgihtmoDU3+k4YiopjUktw4QPKKoUFSTBUEjs43OfJAJ+5lvAukbGZ
	afL4bsd0YK1iau8eYOdTSF8Qo/QnORiVwHeQXkteapAelHj2HIfA8jkiEwvsEbatP0igAg6JpTO
	M
X-Received: by 2002:a05:701b:4213:10b0:1a4:fac9:aeee with SMTP id a92af1059eb24-1ac56d95c0amr4153882c88.4.1793385547176;
        Fri, 30 Oct 2026 11:39:07 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1151:15:c56:221b:35d5:85f? ([2620:10d:c090:500::4:2e7d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9886300c88.13.2026.10.30.11.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:39:06 -0700 (PDT)
Message-ID: <7cd99851-5bc0-4db8-a44c-a664c3f824b1@gmail.com>
Date: Fri, 30 Oct 2026 11:39:05 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] selftests: drv-net: pause: Skip support tests without
 link autonegotiation
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
 <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/30/26 10:54 AM, Maxime Chevallier wrote:
> Hi,
> 
> On 10/30/26 18:35, Mohsin Bashir wrote:
>> From: Mohsin Bashir <hmohsin@meta.com>
>>
>> Devices without link autonegotiation support may reject both link-setting
>> requests in pause_test_support(). On fbnic, all four variants then fail
>> in cleanup when the deferred restore of unchanged link settings returns
>> EOPNOTSUPP. Removing the restore alone would report PASS without running
>> any pause checks.
>>
>> Fix this by calling require_link_autoneg() before pause_setup() to skip
>> the test when either interface lacks link autonegotiation support. This
>> also skips devices that support only forced link configuration.
>>
>> The issue was observed in the fbnic CI/CD pipeline. It was reproduced and
>> the fix was tested on a local fbnic device.
>>
>> Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
>> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> ---
>>   tools/testing/selftests/drivers/net/hw/pause.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
>> index ca4a55e59c30..1537f88e0e77 100755
>> --- a/tools/testing/selftests/drivers/net/hw/pause.py
>> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
>> @@ -466,6 +466,7 @@ def pause_test_support(cfg, pauseparams):
>>       supported fields.
>>       """
>>   
>> +    require_link_autoneg(cfg)
> 
> This helper checks if the remote supports aneg too, so it's too restrictive.
> 
> The goal of this test is to check the local device's behaviour, without too
> much dependencies on the remote, so that we can at least have it test some of
> the local driver behaviour even when it's connected to a dumb remote or a switch.
> 

Right, it may be too restrictive however cleanup handling is still 
required on both interfaces even when the DUT accepts the configuration 
and runs its checks, the remote can reject the deferred restore and fail 
the test. Ideally, this test should not depend on remote config in the 
first place.

> Maybe the sane thing to do is to allows the defer() calls in pause_setup() to
> fail silently with "fail=False" ?
> 

IMO using fail=False would also suppress genuine restoration errors when 
settings actually changed and can leaving the interface in an unexpected 
configuration. No?


> Or maybe a bit more clever, have a quick check to see if the device accepts
> an ethtool -s XXX command ? looks like fbnic will refuse all of'em as it
> doesn't have a .set_link_ksettings.
> 

Yes, checking whether the DUT accepts ethtool -s is one options. We 
could reuse the existing autonegotiated and forced-link attempts, and 
report SKIP if neither allows pause checks to run. Alternatively, we can 
add a remote arg to require_link_autoneg(), default to True, and pass 
False for this test so it checks only the DUT’s autonegotiation support.
