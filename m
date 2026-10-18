Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D903D7D77
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353186; cv=none; b=clv6w0yfjG/4y3kShICz8L0/9Pel41qUWW9OyWHmFf/kexAAdXSuCC8GgupQqtK0vBfAyaxt9SUpfLr7ZLOg7jAMTFQr6RSFv4phdT6krRfln80JND9Ouq7ucK3LaEOxY9d/tgZQOlCR55qnnMfzMa8Jk1HjTPwXgU7X6koKsqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353186; c=relaxed/simple;
	bh=OYatXJ25PGBn/IK2IFH7QyggHeIOnTh0kghBv6Ci/cU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fuJQgiXmVU/0d3fOHGiULgxmK8kfeZ8P/a0rrt89nnIAY9/D2JT38dt9L1ViNVnGm/fB4Uja3b6EC9xRE4b0GkzGPSQfoNojsbLOeih2W8Go9AW2BWwYx4+687iVo5oE6KdGgDy6MoQYfUYiTMx6IuxAB9VDWLGKn5S5TXInD6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EehsdJgM; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EehsdJgM"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9906110d39cso30569241.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792353183; x=1792957983; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wr/MzixbYBwaR8lJPphPBtNkVbR0d9HoMIeGuuWB7w8=;
        b=EehsdJgMMz2l76vHB7gG4J41/zwcG8j7nZH4+BWeAFCFabY+/JLZCMziYxKSxkso8l
         +M/OiYX6NJ6PZZrzp9frZv2imfrLdSAHmMJ42LwQP/5nkcLgvxfY4Mh3zRDCwKm+rRTx
         xFPRh7sZwWzglHX2WeCMrEmZJRX2Mt0zDQQkJChfI5a9Mi2Sd6rcFGQp8TetqG2jiPOs
         mpJUNSlY0/RbJRHS4sQg8kKttvp9msgOdbE0tZcMTDnTkxBmnAZlguisbQP8UHoZynPW
         x8E2aA5FFlBS1K/JzTODaM0VcE1xx8sofjtEWrNwA8btV6CcwgAB1oZMa1ylE1CPBsun
         smPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792353183; x=1792957983;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr/MzixbYBwaR8lJPphPBtNkVbR0d9HoMIeGuuWB7w8=;
        b=Q5SefWWyq7zptDKl1yTFJW40DNLpdEY4hnqGIodBONQ0W65POzMoGTdG/29kuf6JRh
         lWfrqb7ac68YbcJdzvbko43R7Yltr/UgijtB9L5kiwViqVgEjiLQxC9B9jAbVYnzieXV
         LrMSdr23MXZbKa7cLDo7xfB0mvzo5DZq9VDgJ4a6Sr/I1ZON0k/LuiV0NSp222dLPqKV
         lB9JuVEwfeC3SFBFMjp2Fro/PDsc+i/1G/Oap6NGdrmJOgpA4JcYqyCtTx0uDIQbtH5Y
         QwixnKJdUWaMMMTJmDGf0/Dw1hT2xRUYCtnmvU6dT75TRg+dphu0AoMVFbv9f9tqYsTZ
         K/xg==
X-Forwarded-Encrypted: i=1; AKwUvBzuaRTpD5F1PpqMfmtq4LsxSLJfvpRYWihRXAuFrSB3T+Ah7lPh78EsU96AkWOuwYkQbv09pp7kLM+Ez5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaD4P/4pZz/V7nJamklG7V6LweHBb3MjeB6QLg6av/nxYSh0g6
	V6gLWQYbzLO4HBIK16P2Qsr5fv08TL/8/cWQLQTeztVdXycCRMf6OvAx
X-Gm-Gg: AYBFou1pzL3wdhE01TAvhCQSM5RyIlWzCdN2ypXzomGVGkoog+nIqicWN0HB2akHRXp
	RZPylANGWBJPpywmub+/lZjP8zQ3LLuVdNn4wHFhv+7t/PKVdKJf69RH9fda3nfsZYy8RyWq8h+
	cZmoPpIcAVdGT0KL8Lv0+wgfWlKF7DByrFZMLsnEI784185oj81P4BDTWCShwM0Va/jc3ef6QJr
	g36tx0n3Xb/mC1v9T6GD52uGZyG0ptC9nSxz+V9WlTH9ENZkhBRT0TG9Pv0buUBIiIdUdXCLF1F
	RIXKNIT/h9T5j7c4OBd++Lpg98PnZSIxD2ZGBayrgtfc0GBwrvHN+ELSuNZQEWLhcx6ur+Zd+Hh
	6YgbWygjoWU7/pWd+DNUXeCka8xNDon7fOFthJ/+MLvow1FYm4k6R+eXWENJsSa0kVZPgfIB8D3
	Wh9s4yRKI7qbWkxgYTq87e/aKG90EarPjgWkFZSc3sEgRDWtrvKJtFU1akYGsK7dDP
X-Received: by 2002:a05:6102:418f:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc3675493amr1035152137.1.1792353182908;
        Sun, 18 Oct 2026 12:53:02 -0700 (PDT)
Received: from localhost ([2802:8012:9f:dd00:109f:2ff4:4712:873])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc1987900fsm8043946137.10.2026.10.18.12.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 12:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 16:52:55 -0300
Message-Id: <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>
In-Reply-To: <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>

On Fri Oct 16, 2026 at 6:00 AM -03, Martin Wetterwald wrote:
> On Thu, Oct 15, 2026 at 11:25=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.c=
om> wrote:
>> Hi,
>>
>> For Raspberry Pi Zero v1.3:
>>
>> Tested-by: Gaston Gonzalez <gascoar@gmail.com>
>>
>> Test setup:
>>
>> - Branch: patch manually applied in staging-next over commit ec1ecf4f23c=
5
>> - Setup: RPi Zero v1.3 connected to a HDMI monitor
>> - OS: standard raspbian with the desktop environment enabled
>> - Driver built both as a module and built-in.
>> - The following command was run to test the sound: 'speaker-test -t wav =
-c 2'
>> - Result: Both HDMI audio channels worked correctly
>
> Hello Gaston,
> Thanks very much for your test!
> It's great to have variety in tests because I don't have the Pi Zero, and=
 I
> didn't test it through HDMI, I tested through the Headphones jack (which
> doesn't exist on the Pi Zero).
>
> Did you also also reproduce the bug without adding my patch?
> If the bug is present, cat /proc/asound/cards should reveal bcm2835_hdmi =
and
> bcm2835_headphones are both not present. And you should see this in the d=
mesg:
>> Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus' =
because the bus was not initialized.
>
> Regarding your test: there are two ways for the sound to go through the H=
DMI
> port:
> - One is through the bcm2835-audio driver (using VCHIQ)
> - The other way is through the vc4-hdmi (bypassing VCHIQ)
>
>   # cat /proc/asound/cards
>    0 [vc4hdmi        ]: vc4-hdmi - vc4-hdmi
>                         vc4-hdmi
>    1 [HDMI           ]: bcm2835_hdmi - bcm2835 HDMI
>                         bcm2835 HDMI
>    2 [Headphones     ]: bcm2835_headpho - bcm2835 Headphones
>                         bcm2835 Headphones
>
Hi Martin,

cat /proc/asound/cards shows only 'vc4-hdmi'.

After adding the kernel command line you pointed out, the bcm2835_hdmi
interface now appears.

The default interface seems to be vc4-hdmi. I could switch to bcm2835 in
alsamixer, and repeating the test in that conditions works. However,
speaker-test seems to take the vc4-hdmi interface nevertheless.

Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
thinks seem not to be working with that interface.

Im trying to debug what happens in that condition; I will need a couple
of days I guess. So far, this is what I could check.

Any feedback on the test or debugging would be appreciated.

Regards,

Gaston


> Can you make sure that your HDMI sound is really using bcm2835_hdmi ?
> If your sound happens to actually go through vc4-hdmi, then you are not t=
esting
> my patch. If you can't see the bcm2835_hdmi, you just need to add:
>
>   snd_bcm2835.enable_hdmi=3D1
>
> to your kernel command line if the driver is built in, or to the modprobe
> command as module parameter.
>
>> I=E2=80=99d be happy to run any additional tests if needed.
>
> It would be interesting to test other "clients" of the VCHIQ bus (because=
 I
> only tested bcm2835-audio).
> But I've just noticed that bcm2835-camera doesn't exist anymore (it was u=
sing
> VCHIQ via VCHIQ_MMAL).
> If I understand correctly, if VCHIQ_MMAL is still there, it's because the
> bcm2835-isp and bcm2835-codec drivers will be upstreamed in the future, b=
ut
> there is not current "client" in the kernel as far as I understand.
>
> The only remaining thing I can think of is /dev/vchiq (CONFIG_VCHIQ_CDEV)=
.
>
> Thanks again for the tests!
> Martin

