Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B042F6FA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421195; cv=none; b=pfBlXR2vQ6YvyOtCDSMgKPw4jGhRL3M374F5/GkVuqt+R2biQiwzGu/b5gHaJNpRh+XRbBX++3tLpOb3/q1E8725ceFs/zyXZkM/bnLypQXTR5GV7VhWoNAg5C9T4+Jd8QfxdhZymgAebjjzn7ahLWnY7ngeVRyprYst+2iMcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421195; c=relaxed/simple;
	bh=DLgC3aps3XoDhJw1Zkr5LjA4E7cGsw40nQ05koVXezU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWUTyjY+4i9sEjz3qqcUtT917dRGgEx8UTXu6HWMXyPigHlLP625wvEVmWvgHTnUqjWnp/yIR/7GB+wp7lETtET+fJMLedy96Gt8fHdGxbfaFo+iJHNJBjVk3ZptPsWbbiAaQaZpMq68BoVQcA2rBMPpY2msglhv+QLbKd3oUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROKJgTLX; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROKJgTLX"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae1f2cedfso2081302a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421192; x=1791025992; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SV0LRzTvQ8p2vwhmqhzurHNmTdPATy7R4StnDd5yBSM=;
        b=ROKJgTLXymsWgzJl5Ashi+MQIs7EI8mBXazssB5N7Vd52sxpM1ft8MPerTy97i0g2R
         07qCC3Kf1mrO93cLwqh2IJxvxtpXXwaVazKrnFiN4UoQbVT4DV5H8JTud5UZHuferJJ5
         SiEp9EWcO5M/XkX7IZULIKfQHGffj98FkiXg1TxuHgQAi7eOLfi5rgQpzgsMqpP/k4zf
         mYcfs/Ev0HLKSgArAg9yENlDjCx6rnl/GK5zIvDeQQYd0PdZifv3R1e2SUFAFPLuRPcj
         YvLJg+AamFBsFykvh3Bg6Fq5oD3S0YcUGV53tE7UeRrGlYuH96jxvzY2Y3s0mT4eH/o8
         Kvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421192; x=1791025992;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SV0LRzTvQ8p2vwhmqhzurHNmTdPATy7R4StnDd5yBSM=;
        b=yOrHqfQcViUQl57/ZacYTb6QFXq+9Hen8fPzvJctyUuTogqlgoGfoSngAqz0VJlnZx
         ROKa20hOhS2XGWxGcS46PiwP26wmNbxl7PZ68d3KY4QzUUirUWIKr7goKfB1SwPd3Vus
         4vGk5T4vT3BHNhU6ACMSlI+nAWMXumTGF+BdsGolmCzFLFGdFizYeMY3tUOeIX6ZjwRD
         vpQvZcGnYkynxpykcFnGxMWBLbG9Ng/cyqrhgvlldJj2fmDZe8+7JyqZYRnkCo0laPhs
         5W8fajzinyKkxImbPflvWCfjrIbATMmGF3hKG5BFujRQVofNsOyPj1Cmc/PFbOuu/mmd
         6BMA==
X-Forwarded-Encrypted: i=1; AKwUvBxyXI3eWE1voELOpKhWoqs7AxzJAVJRjcxCdjCSwwUG9wkn8iynYhtVUbv6SIEb470kUo2ursUNOkl4zRc=@vger.kernel.org
X-Gm-Message-State: AFuF++nFqDUCBfTdnXgGj76yARWwq2pN6euU/1LFvQVzE/tYanmqJcGO
	77s7/uW5KleTNYS2v0gamZnSi5PSkBGP0y8BB2uO3cJGAWkHGQrJd7au
X-Gm-Gg: AYBFou1Fqt5ltV+KsAO3FVFoA3pLfEw2XPsEIt79Aq58kPgaYN3PYlUoEyLr9NRINEF
	KluYiB/Z21vbV9Z6DAjsOpxvkxaxsYBf2vRnTD5+abLnduD214Hef+NB2OrAlf2HTSJhHBjMvmB
	vqhysOp3bp2DbuwX36k4p7lM85jycN3iQOVJAaOFTr8fFaoJ4pBt6jX2LRZnreb3Ll1MXNwMAcu
	w3rsKYbcN0teQhoZEkyC03MGlH9I/txeuYFERQ3V1PbIlG41t1QELWwDtdpBuaFvsaoeS3aATW8
	y75K5Xqjvk2/PVBX8gjnwVAlHI+ioxdSYemDk2uVLWU2QpczKsJKcTOmxrfGB6y07DYIuvVc/Vw
	/UvyRG+esv89Sli0JXppjHUmF1T7XlPezB+1e87UAaBXWoLRXhBH5eac0INtSradUSFh08uDDG4
	W7Bo4k5RPO987lk1q3G1F1Lv8ycSXe1LY/ioaLJ84UtL9LGUZrvjwiSOq11dNW1YuYqu5q0DVLq
	Pm5S6poES104F9HaCn3BasjzeqPQOFTise43GUZrcc=
X-Received: by 2002:a05:6402:52c9:b0:6a9:984b:4c71 with SMTP id 4fb4d7f45d1cf-6aac90dca01mr6954387a12.33.1790421191787;
        Sat, 26 Sep 2026 04:13:11 -0700 (PDT)
Received: from fedora.localnet (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dd5e49sm1928651a12.19.2026.09.26.04.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:13:11 -0700 (PDT)
From: Erik =?UTF-8?B?SMOla2Fuc3Nvbg==?= <erikhakan@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Filipe =?UTF-8?B?TGHDrW5z?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Rafael Passos <rafael@rcpassos.me>,
 =?UTF-8?B?R3LDqWdvaXJl?= Stein <greyxor@protonmail.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>,
 Roman Stingler <roman.stingler@gmail.com>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 =?UTF-8?B?S2F0ZcWZaW5hIE1lZHbEm2RvdsOh?= <k8ie@mcld.eu>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: logitech-hidpp: fix Bolt hi-res wheel handling
Date: Sat, 26 Sep 2026 13:13:09 +0200
Message-ID: <2UD2rmaWS9W0wgq6AdNLxw@gmail.com>
In-Reply-To: <6UWkRWWaSvGIWNWwY_bPDw@natalenko.name>
References:
 <20260922-feature-bolt-fix-v1-0-63b0fa8da0d3@gmail.com>
 <r8QjhQUkS86zOaJsxE4nUw@gmail.com> <6UWkRWWaSvGIWNWwY_bPDw@natalenko.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi!

On Thursday, 24 September 2026 23:57:05 Central European Summer Time Oleksandr 
Natalenko wrote:

> No idea TBH. The mouse is this one:
> 
> https://www.logitech.com/en-us/shop/p/mx-master-4
> 
> I haven't seen proximity mentioned anywhere is specs. But I can try to sniff
> for these events, just let me know how.

Great, thanks, we can do some tshark capture then. That's what I did locally. 

1. First, in Solaar, make sure diversion is off.

2. Then, find what bus and device your mouse is on:

lsusb -d 046d:c548

It should give an answer like this:
Bus 005 Device 007: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver

3. And from there you get bus=5 and device=7, so do a tshark capture:
sudo tshark -i usbmon5 -Y 'usb.device_address == 7 && usb.urb_type == 0x43 && 
usb.transfer_type == 0x01 && usb.data_len > 0' -x

This should output ALL incoming data, i.e. including every little mouse 
movement, so it will be noisy.
So try to keep the mouse stationary to minimize noise and try to only touch 
the thumbwheel. Both hovering your finger very close but not quite touching, 
then a single tap, and finally just holding your finger still on the wheel.

I saw some information online though that the MX Master 4 supports touch, but 
not tap or proximity, so presumably we'll only get one of the three.

4. Please also give me the output of:
sudo lsusb -v -d 046d:c548 | grep -E 'bInterfaceNumber|bEndpointAddress'
It should list the interfaces on the Bolt receiver, which should be the two 
native HID interfaces and the HID++ interface that I think is for devices with 
touchpads.

5. If you want, you can try the same when the Solaar Divert is set to on as 
well, that would give confirmation that the mouse follows the protocol found 
online.

If you get a lot of data that you don't want to send on the LKML you can just 
send it directly to me if you want :) 

Cheers!
Erik




