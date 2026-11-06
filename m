Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953082;
	b=MfJYPJt7Mwh+GhHpvk3zp8wtY+oDvVQgUUPzwpLDWWzeIFG05h53CxORiiLGjbDFjvK7
	 ir1t0GOgB+y5CjbDeMXifw/GRhZwwQSP3GdRt17O4JlGSCoVZRITE2aO9f8xG8pmjx4Uf
	 KuIB8kCod7F2P29f79CvCA7mKEnaY6iJRpsR/Prwcv2Tz2eIjlJbKCiiba0/KgUpuhjmM
	 dS+QUKLP9zPCta4Msvoebvu8Boh22TXQWX9x1DoB2K1nWkPzsEI9QEd6195mF6RTy1daf
	 4zwyQkb8bO1BHYwbm3kNEsyEh+hDvvoMFgU+zHNhpO3+wKuxSHYQYVVfHWS9SZ9ULmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IhoDejnLT0dqcygxtJi6cYqFmAuk66FRNmBCl2akNUM=;
	b=zeopz4jGSSyZaIUXtSw2GXG0s6laBMExPo0p1W1yT33xNnw+QQnlGe36BiTdc9RLhi4f
	 vRg49mAcId9Y7b1CKd1pfo+eOCgVa3FfTMbxtO/LFjyqRCvsF7+WvEx+9XRxUdL3L/FW6
	 R5srxGYeB2sl8qDSWhk58yHzPsQNJfu6lgmP3qK5XbKQQgpdBoytZkqqFRWnxxZQPzg8w
	 sHmajNyl5O2hPdh2QbbcMpWMmTs5BT2KHzZlDCuIYZ3i+P4vGbTgqFB1ygxMMgguHCsu+
	 SJFVBVaoliNEljwfAn1YTeVNfwYH3ZF+xCUJUEa0++2OyGagZbX9i259GwNtn2Kvdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urmPU7lK;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910EC606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910EC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urmPU7lK
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2052515e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953081; x=1794557881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhoDejnLT0dqcygxtJi6cYqFmAuk66FRNmBCl2akNUM=;
        b=urmPU7lKCRuR/zE5gSzypnBu2L7s2A7Am1JVkWuaOrfp+GaQq3jk253zvk1SL0aH0x
         ooZS2EcI9Mpo6733mc1+7mCNDfARa347IINKr+SQfxcxy3dAtN3+8K2HqCJC/+RNIXO1
         MU42yp1Zg6AOKeowdYqXm9G3jzJPpuOvT+g+jY9+QxKoLpsi9M9HhEZ+qrO6jl4m+SyX
         IuKIISK3/jprJuwVbyJBQAo2D/hSVUXrEvuwO9fHjEqhEj4NENAlGHLl4z9IdNL/EwuN
         g8Dwn5X81UuMC9GD/C0vQzi3aMejrGY0taakbzimzFDuC6rXLgoIfg9hLhS3Xcy8LRlK
         SusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953081; x=1794557881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhoDejnLT0dqcygxtJi6cYqFmAuk66FRNmBCl2akNUM=;
        b=LRY9yD6Qo7SejhiP4bZv3waIZiPtgPmY413O2gLswWyOYo809n42dOavSBP/Iw6riS
         EG92UZa5f9YgU6MjhTNaIhTpu82B4DRDvqeW3TlqOew3OfK2+opJdqwFkIAyeoaIknR8
         IgnIrdiijUIcZDgoxzC4EE2JYZnXR9LLBFL3a7ezAFDyg0mqn1muym5gOmFV6Dh/laI9
         ZMzsD350mtAwMattVSMGOKdH7ru/x+m/5QkDbEIctMUp/BhYpN19Gidan+PYPEPstIq5
         gLDSofKkLUzfJzY5/zniv0rmxokQ+OkgQVgrxixiH1NQd7/kUn94O19ShsUqOc0NiRov
         2s0w==
X-Forwarded-Encrypted: i=1; AKwUvBxRJhTb52LDQrrJ45coci8iRBiiWGoiao7Lzg2N6BKy+qIpaEx3We6KizJb8o06jGR3/PH5QUtUHnGsOCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dwIoHJqjXLj1UkBX/C3vVgMjPcf2ScHVHBkLVv/OjS3eLEiyy
	txTfoc8aDJBsc8BAO3acNvnsq3/Pq6tQSn0wOHi+me77R2YLyLWOmj+j
X-Gm-Gg: AYBFou2GhNzMZKPblagay2SGuc1zYu6B0R/PAcRQ64Pd2nEO8BWFXrvHx/1zZzxXS+Q
	B1fN+u+/lNIwdW9NpnQv//gBt2ud5ODgVz2EGESeZ3UvWJ1boUIZ/8hkeQG4uo+oSgBm4FiLEhv
	b7PTSuagE04zOhEQOThG/qUwzoZtzFqfEcKJPiVEZCZKWaiXDeHu50lPf8n8WnBKtXaV2udAJCC
	XbrGDFoQasEzZFgoWqNv0Ym94IcDGYW3FxvqgcnZ/jHsS694glSc1P613VSptYMnDYRS5aGzuZN
	94jAe5zTHum7yZkxTuCgiOS4qNO6V+0XM1kFNAJujQIWKNpcMqT+sv1zAb4qm2ZQauf1qckZHx5
	MFZGOr0x1dEHF2BqhYIPpzKO7yQin5xkFLPBloRsPiYyt+JKsnBEtkCOba9SdLHccReJNEliCvM
	2re7gND4zUtsOGOtJgbmlklss3xHTuNgRS/IpecVM3Uva6nC1Hs1byXMNDbQnbKbfeqyQi8QjPM
	/jlA5WpwRmsGVERQIwafv7f4DrXILhYlrB0CjEkj/UsAXZ+zRXDrtZdgGmZnotmTWQqA/XbMoSV
	0bbpwx7OJcJofV48ylm+ENu9AWkwA9nD4Q+BvfI=
X-Received: by 2002:a05:600c:6992:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4b6de4a6c7amr23740735e9.16.1793953080551;
        Fri, 06 Nov 2026 00:18:00 -0800 (PST)
Received: from [10.44.66.133] ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7402d84a8sm23501215e9.5.2026.11.06.00.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:17:59 -0800 (PST)
Message-ID: <d909ed3e-8613-4a9d-ab59-f59187d734df@gmail.com>
Date: Fri, 6 Nov 2026 08:17:58 +0000
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
Subject: Re: [PATCH net-next] net: phy: add driver for the ZTE ZX279128S
 internal Gigabit PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261105-phy-submit-v1-1-eb382681a76a@gmail.com>
 <b38a7a97-c88c-44fa-ab0f-89d1e809e21e@lunn.ch>
Content-Language: en-US
From: Agustin <isasmendi.agus@gmail.com>
In-Reply-To: <b38a7a97-c88c-44fa-ab0f-89d1e809e21e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the review.

Before sending a v2 I went back to the bench, and the result changes the 
picture, with the generic PHY driver and only what the boot firmware 
sets up, the four LAN PHYs link and pass traffic at 1000, 100 and 10 
Mb/s with no errors, across cold and warm boots and repeated renegotiation.

The TX DAC registers already hold the values this driver writes, and the 
PHY adjusts them itself with the link speed. It turned out to be a bug 
in our MAC driver (frames were sent to the wrong egress port), not 
anything in the PHY. That leaves only an LDO level and one undocumented 
register, with no measured benefit, so I'm withdrawing this patch. This 
is also consistent with Navid's ZX279128S series, which uses the generic 
driver for these PHYs. If I find a case where the vendor settings make a 
difference, I'll come back with data.

Sorry for the noise, and thanks again.

On 11/5/26 15:07, Andrew Lunn wrote:
>> +static int zte_gephy_config_init(struct phy_device *phydev)
>> +{
>> +	int ret, i, ldo;
> Given how minimal this driver is, there are some potential traps we
> could fall into later when we find out more about the device. To
> reduce the risk a bit, please could you add a test here:
>
>         if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
>           	  return -EINVAL;
>
>> +static struct phy_driver zte_gephy_driver[] = {
>> +	{
>> +		PHY_ID_MATCH_MODEL(ZTE_GEPHY_PHY_ID),
>> +		.name			= "ZTE ZX279128S Gigabit PHY",
>> +		.flags			= PHY_IS_INTERNAL,
>> +		.config_init		= zte_gephy_config_init,
>> +		/* The boot firmware hands over with BMCR_PDOWN set. No
>> +		 * .suspend: powering the analog domain down and up at runtime
>> +		 * has not been tested.
>> +		 */
>> +		.resume			= genphy_resume,
> It looks odd with just resume, it makes it look like a workaround.
>
> Why not have config_init() take it out of power down?
>
>      Andrew
