Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873437;
	b=Ep/7rwuw5VQXB2mfiZqZRaMKj4YKwwM0jmZk/6fFTWtwfPFeYZpquX83MYRhcGbeTAu2
	 VfwjwHxq90gzitNHh4XxHSSfVqPlGp1zwWkPXNHQwA03Ve2ez2QOuzZNG+JIfol6Ne477
	 0kJgBR35zhhRRVh/bogXzjq9hD8iDazGMKMAmCtFOQL1FXyQvZmHdKe1+7klFgMU2JMde
	 C3RUEErd1Efrduq2SCUZ3obwgba6tuPFx11QXiVY9KoUJSy4o48udyJEUBLBlqrBi27DM
	 m9C/zWEOxTUE+8412Fpf43GuoYvpU7NYZNbGRBDhWPsXb1dYEKnRK8e3Uwznfh379xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u6nBBrzH+5QZg/x9FmxPN7BmlpA5oRt3HSD2i+J03io=;
	b=QbiY5zIXjwV5ZMU4PLg+VqpzqA5USnHtA1sy+6cnCYX6SFJmirPLo2sRjYPfk77sQeN6
	 HAQuug1JKfk8O+yzZkk+u7m8AxV3p018anCk8zsatraSeaACRaVenk8iEcbfJv6q1bUpg
	 MWX1Xo0EvthPRTD7j3YDMhhz1PWkWYGl6BLT/56AU/wlw/JDMsSdWy367Po26EzyYe11p
	 NMCOhi3mGfj0F9Af4Qr1yH1O8s+1XrvlOwLQq0NHxYj0itqF07Ozsxn1MCTXH8QKWAey8
	 1rFICpEFVEv88m/U15I0AKm8AN/q5lQtCwTRq7QrqqYMqR3d/Y+IgvLvX1mEzfSCSDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+3YcT2G;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69759606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69759606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+3YcT2G
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so12786425e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873436; x=1793478236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6nBBrzH+5QZg/x9FmxPN7BmlpA5oRt3HSD2i+J03io=;
        b=J+3YcT2G0CMbs2UizMx+Tftg1P/7M0ifAtvD9x77/zjipLjxJiNTRt9dPn1mH9W2rX
         BbAM5jOyP2de8EE4Lc7Y4l2giU8Rk3NG5w7AlY9V7GGmrT3RhP/g/xVRUhNFibxY37fA
         pkmUpKFmrUDpBJAi/9q3G5aeKlrxMY1AZ7+tg4mR9EmF3y46Ihs0nnLpsf2q44C1FrPp
         kZ9zRhD9zl6MnHqDTFW+P+3sHbwqDcSQVc7HUQDkWnVpZT+59Y/nkFVp/7SUREustatY
         ngLlnHetj9LXJrqacKwsgvZXisETavzqVjIBVbKWTLGxtT5rAdqOl0WJJmt4XvrNMVaS
         XvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873436; x=1793478236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6nBBrzH+5QZg/x9FmxPN7BmlpA5oRt3HSD2i+J03io=;
        b=phjyIEGnT7hH6aXwd8YuLEcrK6i+gZlhVxnbhdVzn7i9RW81ebZ52zhKRKvq6/v3V0
         pV3/Ru2xf/C+/n7y0xUe/bvK4JFXsmzqetWWE0zZgf7ASkOf4yXsYDyiqsdCTw2J3i+G
         WQSf+OH3X4BEVVQ6l872akFZ5QgBXxpOrX8fvj5dq21aieO5Fm9ofk5RIVvOzQds7wCl
         LcaZHcqhMCRKGl86YGS1SO+wzWc7AQjrBtfk6w7sBJghC9hVvV5CHlUJsqbTasyzfQsE
         +51xRPMyLVFc5NYhHOIJ4R5nneAbxH39i7C2E8hysvZ3gakQZOg7AZjBE+8CysxorWzn
         vtoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhg26b+OA4xAE7BFJ5qp+o6XkO6IpI66iA//oVIlHQreeTRcoRV8b+bE679VHGp/xqeYAR3gl3cd8Xonc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGayz90GRmt5zJd4SMZQ5VqSJmM75KZHbzNEpyyjCe8d2IMZKu
	UjNUiqUw84o3RPTo4wdhJzJUWlEpP3SBIe5StwTo6ztQIj0ee9cxNRdb
X-Gm-Gg: AYBFou0TKD8VsqUzFOVwHKbPCgtVeyD028iMzFVphY0uJz/iJ4jxXuXvK/zAuYo66bw
	Jvk81YAPwV/U4An7nhcLXxtKuBT3dtux1N/mE8UKV+i82T9BGJ/exKQz3NyYJuhpRJOYnZMd3N4
	OXK3pdAdW4fCbH8v9u5Mfs8Dsg2J01btv0HlNv5qlUPzSNXomfH2DF0EH//czkH1JzLvECKKH1j
	aOwkqHHaJ9e73m336OOkNLVwd9uuRmjVj+NSYqiMQJ6SR2vatMkoLm966BmmK9t2lmPuhJTtS+k
	IWu7UaKSSE4B5Gg0Uz+CSCt/NYLFBXIOSRfciMkfmoGS4iyqOwvTCceLEJ0uj3VygBlzIFKMMf2
	PkkYvKfCzRwKLvREng00M/3OuGxHrR/+rHPxkOobm+2BfEyHy1rqdi1477NYmH90QaV8AoxpZo4
	6OqnWRbaNCDkHV0FB3SQDwzErc0CQgRdEVmJo8IIgGE1Wdx0ahDyXAm8XdLCXnvZdSs9v826PAR
	5Z1QJg5oJFzC0B2OPyCa+I31YIsZL9rVrFGPE9jL8CFrWSIaVm71CHga41Hrve7mA6xoh3JLKin
	79xcMayX/A==
X-Received: by 2002:a05:600c:3b96:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a35ac8dd4fmr54691375e9.12.1792873435759;
        Sat, 24 Oct 2026 13:23:55 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm93522995e9.1.2026.10.24.13.23.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 24 Oct 2026 13:23:55 -0700 (PDT)
Date: Sat, 24 Oct 2026 22:23:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Bayless
 <steve_bayless@keysight.com>, Guido Kiener <guido@kiener-muenchen.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 0/4] usb: usbtmc: fix undersized high-speed bulk packets
 on xHCI
Message-ID: <20261024222351.396b0c8c.michal.pecio@gmail.com>
In-Reply-To: <bc5865736052c55683b2d3f2eeca0e01@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
	<20261020184244.69b78d5e.michal.pecio@gmail.com>
	<a642dbc2e4ba0efc381c69e26821762a@tipi-net.de>
	<20261021005654.23517441.michal.pecio@gmail.com>
	<cae2e837872be0560f7f46e13651059b@tipi-net.de>
	<20261023202645.7bf4827a.michal.pecio@gmail.com>
	<bc5865736052c55683b2d3f2eeca0e01@tipi-net.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 13:17:11 +0200, Nicolai Buchwitz wrote:
> On 23.10.2026 20:26, Michal Pecio wrote:
> > I don't have any out of spec device, so I tunned a Cypress FX2 into
> > one - it exactly replays every received packet back to the host. I
> > found that power of two sizes from 1 to 512 work, except on Etron
> > HCs which only take 512. Guess we could have an exception for those.
> > 
> > So this seems very viable. I will turn it into a proper patch and
> > see what the maintainers think. Seems better than patching class
> > drivers.  
> 
> Thanks! If you need something testing with the devices I have at
> hand, please let me know.

Hmm, I blamed existing code and found that it actually solved some
reported compatibility issues. Devices that specify bogus packet size
(that they don't really care about) do exist. Somebody had a problem
similar to what I see with Etron (maybe it was Etron), somebody's AMD
chip didn't like packet size of 4. Using legal sizes helped them.

I think I will restrict this to plausible values and default to 512.

Testing which could help is to check various xHCI controllers if they
support those 64 byte endpoints or not. Just because Microsoft and
Chinese TE vendors do something doesn't necessarily mean it's good ;)

The Etron issue is real and Windows seems to have no solution for it
(instant yellow exclamation mark on connection). Better to avoid such
drama with devices that don't care. Hopefully it's unique to Etron.

Regards,
Michal
