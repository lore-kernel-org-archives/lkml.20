Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916986;
	b=SZSoIloYoWorXh65Ul4SdOOQaacNwucvN0PuoB/XBMEWjtW0989sX9iL1DBmDCEwx8kh
	 lraQQnvs6QEWqRgEsErOZf1jrG0roILbQPvQa7pnH30LZp8wI41HIz6MlrvRxnqmm9Ti5
	 hAO5/wc+a40Azitt97RZvAFLHPLn3YLJwr384RAxbEca7BMSn69A9rviSGiVp3EzE3WBs
	 PxEM6Kcts3T0KzpfpwGVF5T98E2EJuEW2bP8t5alv0imVEt+gGtdiCdRmpkVPCnh1ZG//
	 3NdBJM7ZdWXgIMdUc0xj9rFX5pU0eLk2vxARCjL33OJsomgBsI9tcOXZE7HQFT8rO5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916986;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=glwmp6Wt0ZywbdvqLSKD8OeatctRSa5oSVbjqeZCrk8=;
	b=qSvE0BOI+qHZXxhygEuJ/WL71Kp9Ryn2xR1GiRWBhZ8tx/hE6F6OUgkPIL9pmnWaCeTg
	 PdTSfTVlDxVdlZY9KH5Iv2ivEGYd/rKCMCZRUgNupCQcZro2mAXvUmZ05yPE+WsnC5Ste
	 7PwWHzoggW0a0nhWIC2kD/5dVepTaULzBT+n+ahxaDgg+NMLw+ECddLoCFvO6KwSqTp2Y
	 dGncIyzW8i/dJbtSux2bBht3vEQV/dXfRJJ39BMTOe824U2SABgYy33fVoXvNpHLfkfP1
	 1rFV4hFZBPwkaDd3RxfduKpr9mb4jTTn+DOgf0EpD/0e1CfrCIQEXIJ7MBXAixfuvEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ha62NL8J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A1606A32F;
	Tue, 17 Nov 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ha62NL8J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D1D1F000C6;
	Tue, 17 Nov 2026 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916986;
	bh=glwmp6Wt0ZywbdvqLSKD8OeatctRSa5oSVbjqeZCrk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ha62NL8JC/zw7Rgv/M2nrASWphQ15y6DFDbiOWoit9rey3hJe4MJfoJM81Amj8v3n
	 6V2cAD/qD0QqQfQTh1KLK6O2iN8QmhqcRtfcHHzB0ZrleFSP3oAisd+KEpnKnA8KzG
	 4dB8DfZEBr3ev3+adGArKli8H9cG6v0qghNIQBBdCwwtuFzWZZW6lYahvaXVnywvq6
	 RTimmCu40wEw/LFEEiPEEj3I2dgfAd8yOOnJqJJ19ySHT7NXE2VnCDV31ZRqw/XZ9m
	 crivrWu82PO1Ox4N9ByfuT1mEunPl5IP8iJU2sW3FIwdHQKPKeviGUV4+vhobhWNMW
	 x5S1rlcxCoVZA==
Message-ID: <3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
Date: Tue, 17 Nov 2026 13:03:03 +0100
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
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jacob Procee <sn125164@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20261112113005.16418-1-sn125164@gmail.com>
 <avw1kOqmrUii-msr@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <avw1kOqmrUii-msr@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17.11.26 12:08, Heikki Krogerus wrote:
> On Thu, Nov 12, 2026 at 12:30:05PM +0100, Jacob Procee wrote:
>> On Apple Silicon the Type-C PHY and the dwc3 controller behind a CD321x
>> port lose their state during s2idle while the plug stays connected, and
>> the CD321x does not raise an interrupt on resume. xhci notices the lost
>> state and re-initializes the host controller:
>>
>>    xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>>    usb usb1: root hub lost power or was reset
>>    usb 1-1: USB disconnect, device number 2
>>
>> but the PHY is only ever programmed from typec_mux_set(), so a device
>> left plugged in (here a FIDO2 security key) never comes back until it is
>> unplugged and plugged in again.
>>
>> Re-initializing only dwc3 after resume does not work: tearing dwc3 down
>> also powers off the PHY, and nothing turns it back on, so xhci then
>> times out ("Host halt failed, -110", "can't setup: -110").
>>
>> Instead, make cd321x replay the plug on resume when a partner was
>> connected: mark the plug as changed and queue the update work, which
>> then goes through the same sequence as a real replug (role none, mux
>> safe, mux back to the partner's mode, role back on). Queue it on
>> system_freezable_wq so it runs only after all devices have resumed.
>>
>> Tested on a 14" MacBook Pro (M1 Pro, j314s) with a backport of this
>> change to the Asahi 7.3.3 kernel: a USB-C security key left plugged in
>> re-enumerates right after "PM: suspend exit", where it previously stayed
>> gone until replugged. Unplugging the device while the system is asleep
>> also works: after resume the role goes to none, nothing is brought back
>> up, and replugging it later enumerates normally. This mainline version
>> was build-tested only (W=1, checkpatch --strict clean).
>>
>> Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
>> Assisted-by: LLM
>> Signed-off-by: Jacob Procee <sn125164@gmail.com>
> 
> Looks okay to me, but as this is a fix, you should CC stable:
> https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

So I really don't think it's a good idea to work around a symptom here 
and effectively fake a unplug/plug on each suspend.

XHCI is already capable of putting individual ports into a low power 
state and it should already try to do that during suspend. Resume just 
doesn't seem to work correctly for some reason on this platform.
I suspect we're just missing the proper suspend/resume work in the PHY 
itself to put it into a low power state. Or maybe we need to keep an 
additional power domain enabled so that the PHY doesn't lose all state 
and keeps working in a lower power mode.

When using XNU it's possible to wake the machine with e.g. a usb 
keyboard and it doesn't re-enumerate everything on resume and that 
should be possible here on Linux as well. And I really don't think 
that's going to be more complex than this patch here.


> 
> Sven, would you be interested, or would you have time, to maintain
> this driver?

Sure, I can help.


Thanks,


Sven



