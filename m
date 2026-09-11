Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B7348CD54
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141222; cv=none; b=rDjjRyep3RuMiUzcEH5XWxr132q4+bFA56lpQhBMVO8UVIXj4bkvllyxk/ZF3D1fUfMe5tbckdAgdkCmUpPyy291fGcohTrAif2oerrQBp8rnNY6RxVY0oWtZBe28K0xAzVWhIdQVRORg8lYfUkvIl5dWaEelUbZiilVzAFMELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141222; c=relaxed/simple;
	bh=Q0vgRXzKh6plrRXrapH2xFdwdpT2ymocQGbsOauCRNY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=E7bchY9xFTwqehr4l8AT2juqnZkAB7ExhnVtiuqNejsXXr3N9vJKcrLFx+h0lXICBUZFaTHB7r/v/IdD2boj5wMVIi1ybrvznwuMntuslOcFWB2QHJvDLPChuK/m58NMKoRDrnWa0Y2bLarsVQ7XK3nYmdzujCd7Xeq4TJAvQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kwgc2R9J; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kwgc2R9J"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8016ab5f277so1045781a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789141206; x=1789746006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YmUqkl8h973bYn5aQCd4ratDwQJ6p2rUAcsUSgd645w=;
        b=Kwgc2R9JBbGLqAxcQp4Uhah+GdLpF5Qtvy+htqZHhkpOY4Fy1e6g3+/+QwESSXd+9Z
         w5QE4fF5irGuMbjcwogOk/Eu1Phooqav6VFYDpkDSKAgEmciC+en5t+/PGjjBiqAKAXX
         Ur32wcNx5secC/KE6NMYXI3X8EHhzZb2BlQaRZAds4hSInRerJ/ioCVALhZ+zg3rSnt6
         CTC6tnr6bjoCLWKfKi/ubTOXIs7uH2Wx7JRr1qZAeHQ6kxzl07B4loN2n6spHI8kx95+
         XmTwRu6NvLRUQzcow3R4AsBS39ixPmp57ljpjVzf6Ni+47gWwaRCI9A64fM/2FBOvn7z
         Zabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141206; x=1789746006;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmUqkl8h973bYn5aQCd4ratDwQJ6p2rUAcsUSgd645w=;
        b=IQXH4FmBRQYzpUlHwS5BfsewNjckXf/sHZ7cFEo7RBuBURFzrTzZNWlfF8uE6jUMic
         Cb6Hokf0emf6QJyjAFXwRNBkE6jAu17U4IxHjj4nRvl3aREvAgDxWMdGqHn1jxPW5sLe
         XAbVJIYpr2el2Gb/8Dg5IZo9oazcpb9eZC0cB3xF/ymCT0yuUb3qYPPMjM2aX7OIYXUk
         WhgQjMZ+eAGicVslI/TPOyy3pIXh4GVY6vcup3uKUS0U9EfHLCLz6kyc68tIXBA61CTA
         pv6j/fCdgmHZsYo6jdBZw7GxQOrm+DCSbs/M8354OPw11V8j49xSX9QlkdaJJtyJjII2
         5soA==
X-Forwarded-Encrypted: i=1; AKwUvBzIr7yGvUfRuPLjO/sMStjbomnZy6L9ofVyr2DfvlvtkacXK5scIsvpkoCFpb+oHghqaLqVBaY20puJbog=@vger.kernel.org
X-Gm-Message-State: AFuF++m9VVGYzf2Edr9A2idkyO0RuwhOArkeQNUVFiW39/ZYdLCzcStZ
	7k7RyFEN+IN5eyjvNeQb21hlaWAKdxNaGxOVLm4mIktQDfDglKR552RS
X-Gm-Gg: AYBFou29lvDKI6SXg48IJ1gDXf/z77LOwX3KcrrEstG++1mmZb0+n0qgSc22SZIEXZq
	9TDNSFZOQir8yTWhYsIk/tj6/QU8Zh/RuxyFRl2jURdKsAEzkHMVF/g6vDVp7rI1c+8Ni4BSbOg
	A6m/mvC0I8sPkFC8wLQBSfhowgOm+ZDpq2jIZ0qs9XRmR5oyUGmK4HIFb3aBEV/aYtumCFGzQ6c
	fAmiC9METfqBXI+Xpo7he1wrXBKwlKnQyRWVkOEx3jsr3VmrFoFYUQ4e1zGY6AwRVJyuhs4rqvN
	peUBIgu+/gOoh2hSkOhNmEeUMdnv4q/mLiu2VWHX7gd/CqO/kElhjJDQg6DtYCz8ZAtRgsfJNcB
	80RVrPwLuIGTVkySNnDTAPrG0lj9JG+eGXbewomjHFQXjVIdy+8aZdfTvUSEGJ6I+WO/EQbITgN
	ZoTKHZfYsW+61kToYOiZ1oBF3vvEeuEObw9sb5mZR/cOitiYYSi2Q61bjDsEFaxX9tdVoRm3ER4
	cDo9k2VX/uqJxMHxQ==
X-Received: by 2002:a05:6820:7086:20b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6c0bc8bf63amr2618612eaf.39.1789141206167;
        Fri, 11 Sep 2026 08:40:06 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb91:1be9:b272:ad3:f458:6adc:9388])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0990cc05fsm2864524eaf.3.2026.09.11.08.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:40:05 -0700 (PDT)
Date: Fri, 11 Sep 2026 08:39:58 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Denis Benato <denis.benato@linux.dev>, Jiri Kosina <jikos@kernel.org>
CC: 'Benjamin Tissoires' <bentiss@kernel.org>,
 'Dmitry Torokhov' <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/2=5D_Input=3A_xpad_-_intr?=
 =?US-ASCII?Q?oduce_a_static_table_to_ignore_devices?=
User-Agent: Thunderbird for Android
In-Reply-To: <91447a15-eea8-4f21-abd6-2d79b5c647bb@linux.dev>
References: <20260811125856.1692045-1-denis.benato@linux.dev> <20260811125856.1692045-3-denis.benato@linux.dev> <6598sn1p-p330-1r7o-q43p-r1rnr7nn0022@xreary.bet> <91447a15-eea8-4f21-abd6-2d79b5c647bb@linux.dev>
Message-ID: <F4BC32F9-792B-48C3-A1EF-65BC4E2534C5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 11, 2026 8:12:02 AM PDT, Denis Benato <denis=2Ebenato@linux=2E=
dev> wrote:
>
>On 9/11/26 16:11, Jiri Kosina wrote:
>> On Tue, 11 Aug 2026, Denis Benato wrote:
>>
>>> Certain devices can work both as HID and as an xpad device: binding bo=
th
>>> would duplicate inputs causing userspace to receive double inputs; at =
the
>>> same time if a HID device is available it is to be preferred as it can
>>> support additional features such as integrated IMU and additional butt=
ons
>>> and more, depending on the specific driver, therefore allow only the
>>> best driver available to bind the device=2E
>>>
>>> Suggested-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>>> Signed-off-by: Denis Benato <denis=2Ebenato@linux=2Edev>
>> I'd like to have Dmitry's Ack on this one before taking the Flydigi=20
>> support through the HID tree=2E
>Hi Jiri,
>
>Sure thing! While we wait I will get a v4 going that is reported working =
better
>and having battery reporting too by Adolfo=2E
>
>This new table will be used by Derek too for some trustmaster (I think) h=
e's
>working on that is in the same situation=2E
>

Hi Denis,

I'm waiting for Vicky's GIP driver to land before I do that because I'll n=
eed to add a similar table to that driver and I want to avoid getting in th=
eir way=2E

Cheers,
Derek

>Best regards,
>Denis Benato=C2=A0
>> Thanks=2E
>>
>>> ---
>>>  drivers/input/joystick/xpad=2Ec | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/drivers/input/joystick/xpad=2Ec b/drivers/input/joystick/=
xpad=2Ec
>>> index feb8f368f834=2E=2E545119a4fb36 100644
>>> --- a/drivers/input/joystick/xpad=2Ec
>>> +++ b/drivers/input/joystick/xpad=2Ec
>>> @@ -406,6 +406,18 @@ static const struct xpad_device {
>>>  	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
>>>  };
>>> =20
>>> +#define XPAD_SUBSTITUTE(_vid, _pid, _enabled) \
>>> +	{ =2Evid =3D (_vid), =2Epid =3D (_pid), =2Eenabled =3D (_enabled) }
>>> +
>>> +static const struct xpad_excluded_device {
>>> +	u16 vid;
>>> +	u16 pid;
>>> +	bool enabled;
>>> +} xpad_excluded_devices[] =3D {
>>> +	XPAD_SUBSTITUTE(0x37d7, 0x2401, IS_ENABLED(CONFIG_HID_FLYDIGI)),
>>> +	{ }
>>> +};
>>> +
>>>  /* buttons shared with xbox and xbox360 */
>>>  static const signed short xpad_common_btn[] =3D {
>>>  	BTN_A, BTN_B, BTN_X, BTN_Y,			/* "analog" buttons */
>>> @@ -2044,11 +2056,23 @@ static int xpad_probe(struct usb_interface *in=
tf, const struct usb_device_id *id
>>>  	struct usb_device *udev =3D interface_to_usbdev(intf);
>>>  	struct usb_xpad *xpad;
>>>  	struct usb_endpoint_descriptor *ep_irq_in, *ep_irq_out;
>>> +	const struct xpad_excluded_device *excluded;
>>>  	int i, error;
>>> =20
>>>  	if (intf->cur_altsetting->desc=2EbNumEndpoints !=3D 2)
>>>  		return -ENODEV;
>>> =20
>>> +	for (excluded =3D xpad_excluded_devices;
>>> +	     excluded->vid || excluded->pid;
>>> +	     excluded++) {
>>> +		if (!excluded->enabled)
>>> +			continue;
>>> +
>>> +		if (le16_to_cpu(udev->descriptor=2EidVendor) =3D=3D excluded->vid &=
&
>>> +		    le16_to_cpu(udev->descriptor=2EidProduct) =3D=3D excluded->pid)
>>> +			return -ENODEV;
>>> +	}
>>> +
>>>  	for (i =3D 0; xpad_device[i]=2EidVendor; i++) {
>>>  		if ((le16_to_cpu(udev->descriptor=2EidVendor) =3D=3D xpad_device[i]=
=2EidVendor) &&
>>>  		    (le16_to_cpu(udev->descriptor=2EidProduct) =3D=3D xpad_device[i=
]=2EidProduct))
>>> --=20
>>> 2=2E47=2E3
>>>

