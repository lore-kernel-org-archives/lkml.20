Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306088;
	b=HWO9iZv5Vch4ILbQ4Ghf+GP8hXi1yNOuzt2LuUYK9xQf2L88v8ymjwMKPFChbtYLOc2i
	 dZdagDq16kQNbDRGQ2lzn8wcOW0qcDiUOsJd9FWQz0Tdv3zmeVsa1f3j5dt+xbjOzE4n6
	 VOO89ZITN2NLBbOB45FCPFvAfvZPJvSRmKg8N6C55lJnWyfmG6Eccw7ns4wQdmHijpgbo
	 xGiKH/+IT9u0LenYgbJPS8ZCFw4qbTtyFtaZnuiYBMlg8KbihznBBmRiEvLKbJImDxFH7
	 44diqLsKhEJzQCY1ZX7enIU8z2pOIjD1OXhuA1ZX80xBcb7i2RdZ4Fdv6+TJ7UFOSwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306088;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=q9Ko14fZ0oB2r+3VQCFyGunfijRF7UqfgRXvYxJLn8Q=;
	b=u5tHRBRvVPCicEii7KQJy/KJ/XV0QXqP+ubPHMxTod47C10vH6v/ogpflgxirtHFc0h7
	 Kh0krBiS7BtQVvybDQmo/lw8mnCA6MfaJQnpu1LX0B76CjDcfrK5HbGzXP6vFCKUGvPM8
	 hlpaK+e5/rqP9ASvKKuFfjSNBmKt7K1vkDMTPCR9OX41YOngwtHoTJAMOlhpLnrD6rMW7
	 4QS1uBabGiJATkp95tAvTVoWMa3d+fNK/2Zjigri4beNvmo3yspg7Lky6ardc45llZ9O3
	 mluKhWfyAo93x3sRlRQVNT6dTyiGFMkD3/7PeCUHA7JW6Ki+ZBGrjbQUBXgl7H7YBbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=tpzxhh+Y;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51F606A40F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E51F606A40F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=tpzxhh+Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794306070; x=1794910870; i=wahrenst@gmx.net;
	bh=q9Ko14fZ0oB2r+3VQCFyGunfijRF7UqfgRXvYxJLn8Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tpzxhh+Yml6eUX4hqcH7aTaLAF2b2BXgkzbIEIiGrUgNVEIb7cQudkjFMtQnHNQr
	 EyK/THzzw0i7wnmWJiJ7nC3p3xZ/LcZTSvNQ+MPELgUaMi579aS6WXPVyJhZ6L2tN
	 Caluy0hZtvz4rxMf2DbslQcm4MTv06uKGBxhRrQ/qIf27atM7FqSAwJE8TsyGMziu
	 KZLs5ozp349ai8DTyhWTNHTY6hHutkzyLSFtQHix29hsvYByEdz02LmMcRl8/DRkH
	 MQWHGk3s62i6UXgPRzQiGf73UqwCu72aWES1HxtbTkLnMUeR12TeaeEwPNkYjzd2q
	 yQaJTRnAOCnU1QcAsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHXFx-1xDkYB0edV-00CixX; Tue, 10
 Nov 2026 11:21:10 +0100
Message-ID: <cb7fdfc5-1690-4d41-b599-5381727c5f11@gmx.net>
Date: Tue, 10 Nov 2026 11:21:08 +0100
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
Subject: Re: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in
 struct rpi_firmware
To: Sander Speetjens <sander.speetjens@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
 <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
 <63ecdac3-f8b3-4d44-9b0a-37346568d326@gmx.net>
 <17b8daee-c5df-4b03-a839-38b5ef3edf3e@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <17b8daee-c5df-4b03-a839-38b5ef3edf3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fx+R12LIAi3FfJm32MyQo1+Z8ga8UVeSXJAHniptDk7GsFasa7g
 LhOG/vds5pU0rasZr4MDseNZulxJ+wKPUDqgHXW8iBYU4Xed2OecJUU7wQPo5VizApLnLA+
 NhSoQliWUK7UBRtmwEVbtxD7gew4msZmP8wfmGREqWh+JzbG6IrDBzabaxs0BXsb+fBr/7c
 lF3PfPv0vSlM2Wq7nZL7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pbsSd/YX8u8=;cx0vgWawM4I6YOMn7mbg2TQbnue
 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
 jVsmLiMaOECxwW6Q6V3rLc=

Hi,

Am 09.11.26 um 06:55 schrieb Sander Speetjens:
> Hi Stefan,
>
> On 11/8/26 22:06, Stefan Wahren wrote:
>> Hi Sander,
>>
>> Am 07.11.26 um 19:21 schrieb Sander Speetjens:
>>> The hwmon and clock platform devices were kept in global variables.
>>> Move them into struct rpi_firmware so each instance owns its own
>>> children and their lifetimes are correctly paired with the parent.
>>>
>>> Also check the return value of platform_device_register_data() so that
>>> an error pointer is never stored.=C2=A0 The child devices are optional=
; do
>>> not propagate registration failures so the main firmware interface
>>> remains available.
>>>
>>> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
>>
>> the first version of this patch contained fixes tags, but they were=20
>> dropped without mention it in the cover letter.=20
>
> I was not 100% sure if the commit needed them. If you say that it is=20
> needed, I will add it again.

imo the problem with the commit message is that it's not clear this=20
change is a bugfix or a improvement. Please try to focus on the why and=20
not what is changed.

In case this change fixes a real bug than it needs fixes tag.

Best regards

>
> Kind regards
> Sander Speetjens
