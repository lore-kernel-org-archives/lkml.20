Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923416;
	b=a1CMP3Lk/dNhJOkwzAZNDQDjJ8JPXryOqCEzPcaIQU5zRVK2KpYka3vcuPDukKowWmJ/
	 o9XK9LYRjSv93fhOzrSeoOMB9lneEJ9X9Xcy8TDF3IEoco+CTtAyH4gDfzX6MJ1Rc4f1V
	 Il5zwljb9RjLK5+1pE6/gSSjJTFzFByN3w4nKh9tRRX4QSt5fyM8wOsTl5IvwW+802qiK
	 dkcms3NtyZahjL4bniqqtFy24m8JfAyQ5l1oKb3UVHSmcnn8NxmZLiQ3kcDw6JO3bxZO8
	 fgPEVBtgMXeufz26Wy5+PWpT/HBJY3f7g5XWdTXvfezblxw+YHV2P1VOU9bp/U2qoDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923416;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Fg1ahS80Ypguquz/bjrktsf7/I4p55tudPwBHjm0cAU=;
	b=vcGJ5cB832EfkRnvF9C398yguPZhN0VAZIb2S63oQN5E+3k0U8jCHDzdRl1W8Zzyq4Y4
	 0n2KzolkheJAZi8doSpNUhBshnhBf3aIRXdpeO/deRwBAmtfIlYZb4fki6veUfpp6rV2U
	 ZkkwX24mgX/ywPa5bfpuqLqo3li6hVvrSOtttqxxjFDcFJy2eSoe/1lqd7F78K08Wx0Ah
	 RIr8sIsv1g3Dq6C92mRl7wUgAy4OMDuWuc3axEE7zirDO7ITdI4d2oton0J68IPtOuRKI
	 6A6TjwVcrhpiZp799Eb9pNSDyi85hx7yM51SO4gA7tUuljdVlye6SZaimxNhGw9lcUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vbjosgl+;
	arc=none smtp.remote-ip=95.215.58.251
Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DBE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DBE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vbjosgl+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Fg1ahS80Ypguquz/bjrktsf7/I4p55tudPwBHjm0cAU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793923406; v=1; x=1794528206;
 b=vbjosgl+dNptKED1W7jYGM5Yql2Zgf5LGH2qe7IATFLp0BQY24Xgjtl05GM/rZArI4APdifB
 d8b/O/vzyemoU2plTK8R58XJs+D6AoHiUFiz9Jr/oKUW0/961nC5wb7xSswVFv2NbsDpM4w8Ke1
 iV/YY0Yh7Tg5agXOosOHc1ig=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67ccb14cf52d417d;
	Fri, 06 Nov 2026 00:03:26 +0000
X-Mizu-Trace-ID: 67ccb14cf52d417d
X-Migadu-Flow: FLOW_OUT
Message-ID: <546fd97f-bbd6-4867-b86c-9a4a44ca44c6@linux.dev>
Date: Fri, 6 Nov 2026 01:03:25 +0100
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
Subject: Re: [PATCH v5 0/2] HID: flydigi: add support for vader 5 pro
To: MIrian Shilakadze <mirian@msh.ge>, 'Jiri Kosina' <jikos@kernel.org>
Cc: 'Benjamin Tissoires' <bentiss@kernel.org>,
 'Dmitry Torokhov' <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Derek J. Clark" <derekjohn.clark@gmail.com>
References: <befcd715-ecc8-463d-9617-a269dc7c62cf@msh.ge>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <befcd715-ecc8-463d-9617-a269dc7c62cf@msh.ge>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/6/26 00:51, MIrian Shilakadze wrote:
> On 9/15/26 9:14 PM, Denis Benato wrote:
>> To make optimal use of this device the xpad driver should not
>> bind to the controller, and this is the case for more than just
>> this controller as Derek told me, so I added some basic infrastructure
>> to use the best available driver for the device.
> Hi Denis,
Hi Mirian,

Thanks for your intrest!
> I gave v5 a try with a Flydigi Apex 5 (37d7:2501, wired, firmware
> 0x7045). It uses the same protocol as the Vader 5 Pro, as far as I can
> tell. The difference I found is the report ID: 0x03 for output and 0x04
> for input. SDL already handles this.

That's easy enough, we can do it.

> One thing came up that probably affects the Vader too. The driver
> ignores the third-party flag in the status reply (the "Allow third-party
> apps to take over mappings" setting in Space Station). SDL checks it for
> all V2 pads, the Vader 5 Pro included. On my Apex 5, with the flag off,
> acquire is ACKed but no 0xef reports come and nothing tells the user
> why. After setting it with 0x11 (ff ff ff ff 01), the stream starts and
> M1-M4 work. It stays on after a USB replug. I tested this by hand over
> hidraw.
>
> Should the driver check the flag and warn or turn it on itself with 0x11?

I think it should have a sysfs property allowing to change it and also set
the most reasonable value at probe.

> Supporting the Apex 5 looks small from what I have seen so far.
> raw_event already skips the report ID. The descriptor check would need
> to learn this layout (output ID 0x03), plus the ID in the hid and xpad
> tables. Would you like that as part of this series or as a separate
> patch later? I'm happy to write and test it.

I have actually a better idea: the friend of mine with the actual hardware
has discovered that a recent firmware update changed things and he
tasked an llm to properly handle the apex 6.

Since you two have the whole range of hardware and SDL has working
code why don't you take over? It would surely be better than me making
the bridge since you do own hardware and care about it.

Let me know if you are interested and I will be more than happy to
make that happen!

Best regards,
Denis

> Thanks,
> Mirian Shilakadze
>
