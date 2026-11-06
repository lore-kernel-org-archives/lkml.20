Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000106;
	b=C/DMdkS7eJW4ceqAL0ZRX/F0xoBSt94oc7pV1OwI42/b1pKIa6PXQmECsooH2JZLImZq
	 8atIqZRrSn+YL/bk7yh+xP3IpcL46ElODvE99caz85wMMGPCB9g2aCBeY8CLHL1Hdn+Cq
	 wvmmeymNPj1GYV9XxIwNcrFpe3pPVh9zVkmX9hiBEE/L3dZZ6I112VB0Rl/vHIuMklCf0
	 GDEG0D35k4OHu2cXgdDCHXjhu+24K4nyLsvqhVYpG6lG32aXD4h0NRzKl5W1PljMm/uf3
	 oQQcXuIFK8CbiCTV/FjtY74EJZR+XKSBgxyn4SEz5ad4bTC5wf79NhUl7WhlWPpOGyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=75ws0aWOAn7zVEkFYFw2d43XUpDpA+pOyY+p9nhXJYk=;
	b=yFbHlYxSxV4yTCl6mwUVtB7NW/BYMi2i7vZwfA3uB7OwZFD4o31/dGDQIKcBMSTqT3lw
	 +6JZjbSoUaZcBzNPZOwdOMF9ZpWR9QVJeXcpBICkFb85ghOOcqu1wP37CD/pWR2APksDr
	 DGGRrI3LQxX6uKDe63MSQmL02KENlL3cqJuoRsWxUrt2JgT30GmSK86TOIn5zu3wriAFJ
	 Q3wi/zEBruqdRWoHggZia48Br1kba7rr9cQqgVBOOVnnpzFgfmfsc6OEhvYfACuQmhJpI
	 fXraTfRriPIT57+LAGJnmeczdj8sEM6EjUkeE547veBzVef1OeUvKmFB/QGCYyZbzdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.228.133
Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B0606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5B0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c46872a230eso67166566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000098; x=1794604898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=75ws0aWOAn7zVEkFYFw2d43XUpDpA+pOyY+p9nhXJYk=;
        b=avLUNoP/0mGQDa9n2tUDRUgALD8TkKdkdCBOeoRvyiDf52Q7vEJlZib1bBZdhuW1gv
         NKc/9lXikFMgz5ISJxvSdzNoqCGivMBwW3jh1+D3gl0UxRa/zSU8az086+qw0OkFkqQq
         oahgwUu5/8sBeX1ZJH1R2uuzCmCihHnyhOZOvQxI58zji5DPmvTv1nQpHpvxGD6XNecj
         P/H7ZYYkBWEt0eCYOXRTY2S5VvoJZtYWmVsy9+gpdmmulG1XObgwOCAS7QOIxw33gxC0
         Hk5e6o8Xuy9nwKX5rhHn0Kgb9HVAVIN+KAKjvWncgtlMEXRx7HRRL9HEfOwmNui8I/im
         O2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000098; x=1794604898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75ws0aWOAn7zVEkFYFw2d43XUpDpA+pOyY+p9nhXJYk=;
        b=ZwYcFT9L5oDmcizGMkWJUSL5CxmLdZt/3yvj3NQ+gAsAYCu+GipbT0jeN0o21KsCLq
         LfggDxrc9n7nrKdMPHNr4arfnaDTp0xEgwggzelDzRHkzHy823KHG5Jn6oyDTvbsA/JH
         8f1qlAq87Oy8ZYAk7ipfdxCKP104q6HF2zHt5UvQBAAHUFfnhlQTGdLDFUwxbip76MVz
         P00Vqrak+ZTcE/KzjrImJbEkqTNC73mLzJXNW35RtXgZJ0IUydXfSpEhxKPrEBYQXfvU
         ivk8jvMIypeAX3nJiH8OQiJYmy5sUE22fc5q1jdiAikoNyVa82SsO2xctPIl0l/1TpQI
         ZV2A==
X-Forwarded-Encrypted: i=1; AKwUvByeF0mtT/aFF4bOsWxtUpyRh6E5zd5s7RXzjEX2fn77+r++DGAoX+OGdFOY9O57xrMwrD/J1GPqnXkDs+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+65EdSOySLeKOWGlC9bEVzc1K0/NQTHaHD5qcJaBqoJS4L5mFh
	dAIyfvmYDPuk2ys5cq9c+3bv5UX8jYwH8ViqXx+9woMgdXhavWCz9B1O
X-Gm-Gg: AYBFou1XTwCRfcPp8zhS8QeWuli0TWFwftsO9b/ifZw5ZYpmo0IXm4rLBr2gQdFTNpW
	CNBRGS4SXH/p/lUKQKc0I2GI2JRhpuB5eT00ZrP2UJFpjHYHUSBnxnUEnY7tmyZKNzDSUVOcz0T
	TRhMXi/F6ajdxZcsJQIgGPm866jxkdBKc6Gw9NUvK/uuudC48xjNJmA1ZEnMCPqaANRfwgVLktx
	RjmtPJL694EhDw1QeHvvWuHsMnFR23BcrsPXQ7byWaN/IHiQlTb05v0+theSOtl20Ih1w5FuUix
	HmXt19nP2mqnqhgwjgkS1cZGcd2HoMFVXxbc/I5HD7MXl5Ss1w5LklQFgRvrpO3PuJjMwX/t41z
	SiZUHQi4gaw0xdLcpLmeRhZ1085IZKFAi7zOYe+ySjRMljDHZkwBT3Q/O+bkS0g6bLM5s9De7A5
	8QSedPZZfBYyBRfPT5o5/5fodXFzhjfUWxIPXPJBGCcMlKKxXV1gQfpsFiTNDRf9fAa9wRn7ye7
	otHGV9cIQreeNcb0aX9dE2QDyKAsc74EdCchX9hKQ/+c2LLOAt/XGXhCiNI6fuXgRayDk5i+Gul
	RxC43r9f+1auOuOTBxKFi8m1i4vlUfEQaYbC03lbLYdZwGNESUfodYxWXL4r/2mloXKW+SHZtTV
	oI/vSrpdeHbEt28N8dPevH+w8adhYRC2lCYA4o2mSW8uA269TlM88Bbg=
X-Received: by 2002:a17:907:3d94:b0:c2a:b1cc:158d with SMTP id a640c23a62f3a-c4d35554748mr318528866b.32.1794000097799;
        Fri, 06 Nov 2026 13:21:37 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b6e82bc5d7sm849953a12.13.2026.11.06.13.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:21:35 -0800 (PST)
Date: Fri, 6 Nov 2026 22:21:30 +0100
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux@armlinux.org.uk, hkallweit1@gmail.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v1 1/1] net: phylink: keep initial advertising
 settings
Message-ID: <au5E2qilAsVuUOgx@thi-server.fritz.box>
References: <20261104125509.3221743-1-thi.zirnstein@gmail.com>
 <fb28453b-9df6-49a1-8c01-543e7bfceeab@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb28453b-9df6-49a1-8c01-543e7bfceeab@lunn.ch>

Hi Andrew,

Thanks for your feedback,

On Fri, Nov 06, 2026 at 02:51:18PM +0100, Andrew Lunn wrote:
...
> > The mode of action is as follows:
> > 
> > * The link was not up yet - no phy connected
> > * the user configures the advertisement of the interface
> > * the mac driver delegates the call to phylink_ethtool_ksettings_set
> >     * here we are not configuring the phy - it does not exist yet
> 
> If it does not exist, it is not possible to validate the user request
> is actually supported by the PHY.

I think my description was a bit misleading.
The mode of action describes how the phy is attached by some
net driver and what the program flow is and why there is a problem.

Typically the device driver does not set/clear any advertisment bits
during device bring up. As least what I have seen so far.
It attaches the phy and brings up the link.

> 
> > * the user set up the interface
> > * the mac drivers calls phylink_connect_phy
> 
> At this point, is the previously configured value sanitised by what
> the PHY can actually do?
> 
> Take the example of a MAC which can do up to 2500BaseX, but it is
> connected to a PHY which only supports SGMII. Before up, the user
> could request 2.5GBaseT, but at admin up that needs to be reduced down
> to 1G.

Good example, with this patch applied this will advertise 1G,
if the user does not configure exclusive 2.5G prior attaching the phy.
If the user configures exclusive 2.5G (2.5G only) the advertisment is empty.
I think this is fine because the user missconfigured the link, but maybe
i am to restrictive.

I wrote a little table for a better overview. I am not 100% sure
how your example behaves because 2.5G uses another interface then SGMII.
I have tested with a sgmii 1G half/full duplex link.

Without patch

without phy (user):     phy caps        link up advertisement
1G FD+HD                1G FD+HD        1G FD+HD
1G FD                   1G FD+HD        1G FD+HD <= bad
1G FD+HD                1G FD           1G FD

With patch

without phy (user):     phy caps    link up advertisement
1G FD+HD                1G FD+HD    1G FD+HD   
1G FD                   1G FD+HD    1G FD <= good
1G FD+HD                1G FD       1G FD

> 	Andrew

Thilo
