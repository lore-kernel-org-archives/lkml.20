Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970F51AFE6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754521; cv=none; b=XsofG3CeyybqRdmRmmWca2ZUSFR7k8OiJSNVl94cQgOAz72yYAn+9n+gTU97qA+yuXpKp3kTmVfxnwCbMSqAV6Ep/a7/yRyQ/dKG10hDKdRGqmj56rFzYpUgPgv7dhvNJ4NgYpUc2Kng1HAzIFsLXzqmubx92A7TAgN741PSaog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754521; c=relaxed/simple;
	bh=vzHRl2fIPJx9LZ1L3hJNpSp/FYA4853N42Bv8nFDNus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3xzBsahpZwHbLTL3+BOrprFVuKEoUcpduyQVOnsCTeYu0YrP/ZSBzlV8+HJnCSocY89ggJbrjozq9jD/w4FyEl4byIw/W5AcEThfFmSIXZ289RveC+kWlIYfhjfLm4IRhDHrCC5Y9iazscCEZX35O0GanwXQjt9hJEU+vHHkhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6U+Pnlh; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6U+Pnlh"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1419325e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754514; x=1790359314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0vuR5V82Y+Qb6AE6xYu5ugAq0TM6WhXlM05nO0jW+c=;
        b=A6U+PnlhMwvmFLxtI/ZUJYLgaU9s7+dwTBz5O3Yny0sR8FaL+sOQ6Dj6GQtpdvikyX
         355A0ry6To9P/aQlbI3rs5RQy2XcwWItqsjl5z+QBCKxUk/Qg2v6OtOxfvCIHDw5keh7
         jABOInpsiYtA/0PUBs9JcWdP6UVPnhJ3I7meli+xr7AIqJ/Jf1KxuN+V9NauR5H1Lg7/
         GLEMibhni37cRRJbpDUr8XNV1kfPC3GlRZ6hhqNpl8i7c+lhQe9rGJq7cUqk2PYfRU2i
         o1lGmQbMUivbAJfwF2nNUkdSDXRn4ZKAxdHs4hqMRyACAbF+IW00NOciESLeQvYSvarO
         H5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754514; x=1790359314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0vuR5V82Y+Qb6AE6xYu5ugAq0TM6WhXlM05nO0jW+c=;
        b=YCY+n66qBZE7mjYuZqioFzzx5LrsWXgTsb8gEQY2bXz2JANNV3V6Z9izsJ2RCWIBfj
         Ot5WTDmGiP4tUDnRYd8kNNEN3ac8xve2J2BJ+VLPhX7Qc+R319QV1wfg4aB7XC6jQg4y
         bHWK7e3fk/blT/7lX/RFJ+7+FhggPh/8Z4Ht2e0mHlXl48h5G2qryy0JrSIYy7Q6mexo
         ZIsPv2ePYs/TGm/bty5zdcz2ygI01ZeN00TrfL5rhFs+TXy3NyiHgzO1ZFa7czbN19O6
         Kw+UWOQZnKTY4koWYeUuj9ddKce75d6xbnxlnaBs6dKSxQNqBAKRCET+45R3gw8/s3Jm
         oiqA==
X-Forwarded-Encrypted: i=1; AKwUvBzNSv0bk4v+ZhUEQtZPtlVMDSn/LlZzSqHvzOH291vzMZMzjUvr/ZT5oTxW2U3ocPj0Tm10UgRJvugcYyI=@vger.kernel.org
X-Gm-Message-State: AFuF++kpcs6bXNwQvu3xq8uz5AvpzR1lmkKYV4qZz8iSAMbDPRZw5tn+
	lGB8foCMlhDsnZxb+VuPhxjMTxsUH8y+4YKJShZlaUm3Ix5LhmcxVwyvMdezXIPUrLU=
X-Gm-Gg: AYBFou0YhtX0zuX5TG+t36R/2NUT6RQ931Ljw/DOzrQKK796QI3AHDv5FqTsMt7obok
	rwrEiPex8KLQzpLxiz9uiU6/+vl/IhQbuNbxHDqGhTLQMk3NYpv6KyDHeAxLdDlXEU5yIXrNTWL
	2+BEc+QK9nU0Pw4UWtkhylkujnypxkGikBDiU2Nm0dZ7eALnQ99WAdDJNuZ9PbQf3Qv4X4rcntx
	emEDfx8U5boA1k11ABD7sA4zNtKBLVa3k3rsX6CokDYNtbnGdKBOqZKfP0wgxk+kARahEM5RzzK
	JNji+qobX9UmUyMXtZaLHb65uqcy3eXy+BIFTqT38c0LmQzaIMeM1gZFFcSbBg0nMUqwIU1xQ7J
	XxNeN6NCSdUwkcs67TrW67UfKCZdceD5UhlRNERt8XebQLX9KB/LJNWboiXu2yWh+CXwqyQcdIv
	Ne0OdNgBw2JLrwsxnqbTIk5KD8wirWIJHhYNy3KNY9WC0alVUHoor8LquwOb47WtRGhgUjZaWnk
	fQpoA==
X-Received: by 2002:a05:6512:1322:b0:5ae:b887:bb33 with SMTP id 2adb3069b0e04-5b8c17f5d99mr1030983e87.1.1789754514170;
        Fri, 18 Sep 2026 11:01:54 -0700 (PDT)
Received: from [194.95.0.0] ([104.28.232.201])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c64a5bcesm165153e87.31.2026.09.18.11.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 11:01:53 -0700 (PDT)
Message-ID: <33a7c239-ede5-4091-ba72-ff429d97013c@gmail.com>
Date: Fri, 18 Sep 2026 21:01:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] HID: multitouch: add support for Goodix GXTP7863
 touchpad
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260814171247.16707-1-daminovruzal7@gmail.com>
 <20260819123326.3242-1-daminovruzal7@gmail.com> <aquWNXpJuQr8HLBU@beelink>
 <51055e02-5bf1-4b1e-b430-382d00d3d004@gmail.com> <aqwUYWPz_nORoFr6@beelink>
Content-Language: en-US
From: Ruzal <daminovruzal7@gmail.com>
In-Reply-To: <aqwUYWPz_nORoFr6@beelink>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/18/26 7:18 PM, Benjamin Tissoires wrote:

> On Sep 17 2026, Ruzal wrote:
>> On 9/17/26 10:30 AM, Benjamin Tissoires wrote:
>>> Hi,
>>>
>>> sorry it looks like this one fell through the cracks.
>>>
>>> On Aug 19 2026, Ruzal Daminov wrote:
>>>> The Goodix GXTP7863 touchpad controller (VID: 0x27c6, PID: 0x01e0)
>>>> found on Honor MagicBook laptops (e.g. FMI-76 / X14 Plus)
>>>> was missing from the mt_devices[] table.
>>>>
> [...]
>>>>  
>>>> +	/* Goodix GXTP7863 Touchpad */
>>>> +	{ .driver_data = MT_CLS_WIN_8,
>>>> +	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
>>> I'm puzzled here: HID_GROUP_ANY? How can this even be working with hid-multitouch?
>>>
>>> Are you sure the touchpad part is not already handled by hid-multitouch, but only
>>> the telemetry/phantom event gets assigned to hid-generic?
>>>
>>> Can you share the report descriptors of all nodes with hid-recorder so I
>>> can understand why we suddenly have to map to non multitouch devices.
>>>
>>> Cheers,
>>> Benjamin
>> Hi Benjamin,
>>
>> Thanks for pointing that out. You were completely right, and I apologize
>> for the inaccurate explanation in my previous commit messages.
> no need to apologize, we can make mistakes, and that's our job as
> maintainers to catch them :)
>
>> I re-checked the device binding: the touchpad is indeed claimed by
>> hid-multitouch out of the box under HID_GROUP_MULTITOUCH_WIN_8 (using
>> MT_CLS_WIN_8). It was never claimed by hid-generic.
> Well, I guess it was the first time you started the laptop, until
> hid-multitouch gets loaded.
>
>> The actual root cause is that MT_CLS_WIN_8 sets `.export_all_inputs = true`.
>> Because of this, hid-multitouch exports the vendor application collection
>> (Usage Page 0xFF01, Usage 0x01, Report ID 8) to an input node.
> Actually, it's even worse than that.
>
> Because some vendors are not using standard HID usages, we do have a
> `HID_UP_HPVENDOR2` definition of (Usage Page 0xFF01). And hid-input.c
> considers that this is only used by HP laptops/keyboards, and then we
> have some fancy mapping of non standard usages.
>
> The real fix would be to actually ensure this mapping is only triggered
> for:
> - keyboards
> - HP platforms
>
> But, there is always a but, `HID_UP_HPVENDOR` was there since the origin
> of time (git conversion IIRC), and `HID_UP_HPVENDOR2` appeared in 2012.
>
> We do have some info on the affected devices (VID/PID) but nothing else
> like the report descriptor. So it's the typical case of "damn, we can't
> fix this without possibly regressing a lot of existing hardware".
>
>> As captured in the hid-recorder trace below, the firmware sends a 1-Hz
>> heartbeat packet on Report ID 8:
>>   E: 000000.000000 30 08 ab 00 00 2a ...
>>   E: 000001.006503 30 08 ab 00 00 2a ...
>>   E: 000002.012748 30 08 ab 00 00 2a ...
>>
>> hid-input interprets these changing payload bytes as key events, resulting
>> in the endless KEY_BRIGHTNESSUP autorepeat loop.
>>
>> So, adding the device entry with HID_GROUP_ANY to mt_devices[] is indeed
>> completely redundant. The only thing needed is to ignore the 0xFF01 vendor
>> collection so that no phantom input node is created for it.
>>
>> Here is the report descriptor and event recording from hid-recorder:
>>
>> # GXTP7863:00 27C6:01E0
>> # 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
>> # 0x09, 0x02,                    // Usage (Mouse)                       2
> [...]
>> # 0xc0,                          // End Collection                      624
>> # 0x06, 0x01, 0xff,              // Usage Page (Vendor Usage Page 0xff01) 625
>> # 0x09, 0x01,                    // Usage (Vendor Usage 0x01)           628
>> # 0xa1, 0x01,                    // Collection (Application)            630
>> # 0x85, 0x08,                    //  Report ID (8)                      632
>> # 0x09, 0x01,                    //  Usage (Vendor Usage 0x01)          634
>> # 0x19, 0x00,                    //  Usage Minimum (0)                  636
>> # 0x29, 0xff,                    //  Usage Maximum (255)                638
>> # 0x15, 0x00,                    //  Logical Minimum (0)                640
>> # 0x25, 0xff,                    //  Logical Maximum (255)              642
>> # 0x95, 0x40,                    //  Report Count (64)                  644
>> # 0x75, 0x08,                    //  Report Size (8)                    646
>> # 0x91, 0x02,                    //  Output (Data,Var,Abs)              648
>> # 0x09, 0x01,                    //  Usage (Vendor Usage 0x01)          650
>> # 0x19, 0x00,                    //  Usage Minimum (0)                  652
> Technically, we could simply convert these 0x01 and 0x00 into 0x05 and
> this would make the mapping ignored by hid-input.c
>
> However, when changing those bytes in the hid-recorder output and
> replaying the device this creates a 10 seconds freeze on my desktop
> because some component is not happy about the empty input node it creates.
>
> I'm trying to investigate what is going on, without much success. I'll
> continue working on it on Monday.
>
>> # 0x29, 0xff,                    //  Usage Maximum (255)                654
>> # 0x15, 0x00,                    //  Logical Minimum (0)                656
>> # 0x25, 0xff,                    //  Logical Maximum (255)              658
>> # 0x95, 0x1d,                    //  Report Count (29)                  660
>> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               662
>> # 0xc0,                          // End Collection                      664
> [...]
>> Would you prefer handling this by simply dropping the 0xff010001 collection
>> in mt_input_mapping() in hid-multitouch, or should this device quirk be
>> implemented via HID-BPF instead?
> So:
> - mt_input_mapping() in hid-multitouch -> probably not. Having such
>   quirk in the hid-multitouch code would be better handled with a proper
>   quirk, not a random check in mt_input_mapping().
> - HID-BPF: so far, if it weren't for that 10s freeze, I would have said
>   yes, go for it. But right now there is something fishy in the code
>   that creates empty input devices that are not properly cleaned up by
>   hid-input and that messes up userspace.
>  
> Ideally we should fix the generic mapping, but that has a strong chance
> of regressing existing HW, which is a PITA.
>
> And to add to the bucket, when replaying your device, I see that fwupd
> is trying to communicate with the device, so we should be sure to not
> break this as well :(
>
> Hopefully I'll have a better understanding next week.
>
> Cheers,
> Benjamin
Hi Benjamin,

I did some testing to investigate the freeze you
experienced.

I tried two different descriptor modifications to see how userspace reacts:

1. Test A (Your approach: changing Usage Page 0xFF01 to 0xFF05):
   Changing the usage page indeed strips the keyboard keys
   (KEY_BRIGHTNESSUP/DOWN disappear), but hid-input still registers the
   third input node ("GXTP7863:00 27C6:01E0 UNKNOWN").

   Checking /proc/bus/input/devices during the replay shows that this node
   is created with an anomalous capability set:
     N: Name="GXTP7863:00 27C6:01E0 UNKNOWN"
     H: Handlers=event15
     B: PROP=0
     B: EV=9 (EV_SYN | EV_ABS)
     B: ABS=10000000000 (ABS_MISC only, zero keys, no X/Y axes)

   This triggered the desktop freeze for ~15 seconds until the timeout
   expired and the system recovered.

2. Test B (Changing the 29-byte payload to Constant/Padding):
   I also tried keeping the original Usage Page 0xFF01 but changing
   `Input (Data,Var,Abs)` (0x81, 0x02) to `Input (Cnst,Var,Abs)` (0x81, 0x03)
   in Report ID 8, hoping hid-input would ignore the fields.

   Running `libinput debug-events` during this test captured the exact
   watchdog trace during the stall:
     event13  DEVICE_ADDED                 GXTP7863:00 27C6:01E0 Mouse
     client bug: timer event6 keyboard: scheduled expiry is in the past (-14747ms), your system is too slow
     client bug: timer event6 hold: scheduled expiry is in the past (-14396ms), your system is too slow
     client bug: timer event6 hold: scheduled expiry is in the past (-14389ms), your system is too slow
     client bug: timer event6 hold: scheduled expiry is in the past (-14369ms), your system is too slow
     event14  DEVICE_ADDED                 GXTP7863:00 27C6:01E0 Touchpad

   libinput explicitly confirms that the compositor's event loop was
   completely blocked for 14,747 ms (~15 seconds) during enumeration.
   Notice that the third node (UNKNOWN) is never even announced as
   DEVICE_ADDED.

Conclusion:
Both descriptor-level approaches confirm what you suspected: modifying the
descriptor still leaves the application collection instantiated as an empty/
broken input node, which trips up libinput and blocks the compositor event
loop for ~15 seconds.

Hope this empirical data helps you track down the hid-input cleanup issue on
Monday!

Cheers,
Ruzal
