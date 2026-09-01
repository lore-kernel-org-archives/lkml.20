Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E34A1E17;
	Tue,  1 Sep 2026 18:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288800; cv=none; b=d1aBYxXJSY/KLQ68taKJZMQZu2p3/BJV6G4u92qdyiHSoExflLkK+1kKtyhZqJRSeYKMNmjvVQQcVpHcxj5c1OsnjfToFLt8WbvgmUmHr/kgdW1e9Eb1kSOIirLw3hA16Uox9IXXRe5efVU8p8L3OI59wwHxtW07vyXNLJvUf38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288800; c=relaxed/simple;
	bh=BKj1b1KNDHMXWwM1uQ3zWXzUvWvLlqbaYTeVi9tVg+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pY6/wMucJJ3neYawJRmYJRCfNQAU5xsG13AdZKxwhla86BIfcKs0ia9fhPPBw/+fIkf98bdi4bJ41LL5nP3XFrM9gNHDxeGwTw4+27uWLOyPSkQJbo1YYd9cBeA9d1JR8r0MrD3SmUuG1VTTcZOu0P61p9zWW93AYFkIkqncbzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lgi41B19; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lgi41B19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0FA1F00A3F;
	Tue,  1 Sep 2026 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788288796;
	bh=6hy0E/ezwSdd6yfoO7/lSW22XS0mfjgDyq2kZCgxDkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Lgi41B19SdUfJXJ66su8/5/5+V4L6xeprIRUzsEiHI4CpXfXKr0AexXn3E6fh8b2k
	 geMB1LeTkPHIHzdBVcc8hdnmojf7fZ2XfrHOx94QypDIj3X3nJuVbfeLj+gTNCUCBg
	 zirXjZd3i5ErVJ6MO9s0VZFk7xQO+NoIxJgHnzdo9+wBJJZoenmkfSMUXxVsSHo7ZT
	 yk3XbYOb1r0jT/nnk3Oc32jBPAFs6kVfdlsz46ROHEuTUsLeWXu/r5PrevgtCVVgAn
	 ZWI84MTayR7M7A9ceqdbR2Ayb+2XQPcKNUhZJRDJR+tg5XvNGTe2PwXZ4zgzeA/XiK
	 DDZgdzpDSeg8w==
Message-ID: <4d84884d-9848-46fb-b751-074c3cba8ffb@kernel.org>
Date: Tue, 1 Sep 2026 20:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] usb: typec: Add thunderbolt switch
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>
 <apa0Ypc4xpaeHTBb@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <apa0Ypc4xpaeHTBb@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heikki,

On 9/1/26 13:17, Heikki Krogerus wrote:
> Hi Sven,
>
> On Sun, Aug 30, 2026 at 10:19:20PM +0200, Sven Peter wrote:
>> On Apple Silicon the USB4/Thunderbolt host router can only be brought
>> up after the Type-C PHY has been configured and requires cable details
>> known only to the Type-C port controller.
>>
>> The existing orientation switch only forwards the cable orientation.
>> The mode switch also forwards most of the required details but
>> represents devices which configure or route the Type-C signal path. The
>> ACIO host router is a consumer of that path and has additional ordering
>> requirements: it has to be started after the PHY has been configured
>> and stopped again before the PHY is disabled.
>>
>> The mode switch code calls all handlers in the same order both when
>> entering and leaving a mode and cannot express this reverse teardown
>> order. Treating ACIO as another mode switch could therefore leave the
>> NHI active after its PHY has been disabled, which can result in an
>> asynchronous SError or a SoC watchdog reset.
>>
>> Add a separate Thunderbolt switch which Type-C port drivers can use to
>> forward the negotiated Thunderbolt or USB4 cable details and explicitly
>> order host router setup and teardown around the mode switch. This is
>> similar to a USB role switch: each connection has exactly one host
>> router and the callback controls the lifetime of that functional
>> controller instead of configuring a signal mux.
> You are bypassing and duplicating things that are already supported in
> the typec bus.
>
> Your typec port driver probable does not register the partner altmode
> that you need, so you just need to fix that. After that you should be
> able to get the details you need simply by registering a typec bus
> notifier in the thunderbolt driver. We can add a helper for that if
> needed - the DRM subsystem will use the same notifier with the DP
> altmode soon.

Thanks for the pointer, I think that can indeed work out just fine. The 
bus notifier isn't enough though, I need a notification specifically 
when typec_altmode_update_active() happens (and not when the partner is 
registered as a possible altmode) and that only triggers a sysfs_notify 
and a kobject_uevent unless I'm missing something. Adding a simple 
notifier call chain should be possible there though.


>
> USB4 is meant to be handled as an altmode too, but it looks like it is
> not supported yet - I need to check the status with that. This may
> still need to be fixed, but that should not be a problem.

It isn't, but that indeed should not be hard to add.

Best,


Sven

