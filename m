Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B030DECE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040927; cv=none; b=Yg3e6ABXpKfzMs6YXpGWiOXZckmtXep3k/r8T+7aQAsAhyc82hVLl7pVxyYpb+SEMYuIAO+78p1/qU/l+BNsK+B6geLEtXNxdaZikSE5EiP47VnovJU6+0CU93a7SzPPmV5/CojEoIhnFEB79bjuSp+O+L8aMfEXwLX1ORSYwgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040927; c=relaxed/simple;
	bh=U/NTrRgaiUwgbbozDoLtiBGfqv6ruBsIk6QhpZvUTDM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uLqb+JknJA1XSZ8IoX0pfyV0uOd5XBu4zMleaheuKkQm8OYd/C/FaXjF9pR3wSs4feYmpAv1gMyzCCLbQsAMnIEqd0LgqZrOqleQZlPrCCoKMEoCpH+yuBX7PCLRY57QndiICOgjnRFlp4o8cj0DXRKOaT/TAbkQkvxvtSV5iSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auP8fysx; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auP8fysx"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35829219da8so1660877eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040925; x=1792645725; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U/NTrRgaiUwgbbozDoLtiBGfqv6ruBsIk6QhpZvUTDM=;
        b=auP8fysxuAUgx3sE1y9c61VzcZ4V2X0kDMQPGECAetRb5fY6lsOQQXmDPecaFPeCrz
         vYRlyaJm+5Im2syIx77wfpB4ApXr0v9Oi4dBTD8SrMGOuamHK8AkYYI3NH83pdXfrzvz
         rc98yEIYstjERbJXXLmg1wuFX18yuOtnIAx+Whd3oLRCoutgLvmZ9N/S7qLmbklxSY2r
         gQvN1vUWVjP6GWvkLmNpIsezSQMN4xKE+Not0KxkTdrGzaG0hvIKP+AlBjJ+KpCEV1QD
         VMoVUYiUiJ5agbf2kXBUnjRzIv49d8vLwNIV3ORycgs2n24Zm3PPBG7Yek1FQ4najU6k
         wwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040925; x=1792645725;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/NTrRgaiUwgbbozDoLtiBGfqv6ruBsIk6QhpZvUTDM=;
        b=Qq+/resLvZA8Y9Gwh8A8H/gZWtkFb5vSDNx1PNrPIriFLaRxQpQQlS8mMgwewjL7ZU
         h/6qPAu2S+GQ2pBQeq6DAUiMXtikRVAtvumVQD4L+VBn6I5nts66iZeT3joTJXPOTzqW
         eTSW25hcjgeohIurcpVPKpF4iNXsq84s0q70YokMRZD11Eusg3Svjyw4TQCE/NWR+Dhx
         QYOMjMDyLkeZbBKwN/uUFHbAdMJTVUbJc0pm0JyKVMwGMALPjVj1jtkr7T0R+JIvNe/c
         bJ/S86aKx/j126XEjsRWUGRKm2YpbAC7uJshQ9yaPkZPRqNszpvG43HwfAeJxvtrxl6F
         padA==
X-Forwarded-Encrypted: i=1; AKwUvBwZJ/4C3N6FvJFu+f0Uz+2MRbvtacagkDDnScN8n4bma+hf1QTSnkkdCOsoJhPN0AdAZXOkGi6ytvOLXfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx3jjo5fWFZ8fh1yS2qHr02yA2Pm1uQuSc2cBHJcq2v/3tJWsm
	qGTQ5prbu7pUpvljq9/ByQ3SJZm/lM9A++C1QaK/lbx0QTMLUhdTh+3P
X-Gm-Gg: AYBFou3mZ4YJgJT/Xjp8RIyui0PkOoxg47V0ZxSvQAKSTF07xy7+tgBOGghGP+3oh0Z
	5nfNfNlDxtIQGC9007T5Hfp8fI3knusEBgKfT36qaVeR/BJ0XlCVBe0BYnczE3CpisH4iDk7AP5
	t0xPpuAyEComacPVm5wqcuE2ydjrE1EZjTeXoOy9TxIOClZOUzaMX/LZZkEVPtvUdN9tGXyB6FJ
	gSEvY6ESpNx2jXJsZH8RZomS4CQBI0dMGk4P3YJA1P5Cks6gDGKQ0WSw/CCMFdpQdm+Je45pd61
	Ss7v3KsizwSv4sij1V7SzrPr9YYxOC32mOUzUNApgTXwIqI7ArTShWg/GLRlgKYTXIaJEL/f0UC
	dQSqEUZZk/OOVaczugin+IM05fqvWjmwxdaEUE47XKIGIJYGYKNq/l6GDqZJYQ0VFWG04+C6ZC8
	fR19GC+J5xDQU0S6HE5OBylNCMPyvHwlVL2DR7TDfFe/EKhXN/8NFgnRW4ZB7l
X-Received: by 2002:a05:693c:821a:b0:357:ee3a:267a with SMTP id 5a478bee46e88-357ee3a2dd9mr22021855eec.2.1792040924891;
        Wed, 14 Oct 2026 22:08:44 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm53695749eec.6.2026.10.14.22.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 02:08:41 -0300
Message-Id: <DM55HM3TYCHT.1F7FX19ORJPG@gmail.com>
Cc: <sre@kernel.org>, <bryan.odonoghue@linaro.org>,
 <platform-driver-x86@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, <stephan.gerhold@linaro.org>
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust
 thermal trip with platform profile
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, "Mario Limonciello"
 <mario.limonciello@amd.com>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
 <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
 <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>
In-Reply-To: <36418d4e-ba34-4c31-b676-1e636cfb8a7a@oss.qualcomm.com>

On Wed Oct 14, 2026 at 10:03 AM -03, Daniel Lezcano wrote:
> On 10/14/26 12:19, Ilpo J=C3=A4rvinen wrote:
>> + more people.

Hi all,

>>=20
>> On Thu, 1 Oct 2026, Daniel Lezcano wrote:
>>=20
>>> Tie the keyboard thermal mitigation temperature to the platform profile
>>> selected through the ThinkPad embedded controller.
>>>
>>> The EC reports Fn+L, Fn+M and Fn+H events corresponding to low-power,
>>> balanced and performance operating modes. Use these events to update th=
e
>>> passive trip point of the "keyboard-thermal" zone to 49.85=C2=B0C, 57.8=
5=C2=B0C
>>> and 59.85=C2=B0C respectively.
>>>
>>> These thresholds match the thermal mitigation temperatures used by the
>>> platform for the corresponding operating profiles.
>>>
>>> Look up the keyboard thermal zone at probe time and locate the passive
>>> trip named "keyboard-ec-alert". The trip name is used deliberately so
>>> the EC driver can identify the device-tree trip associated with the
>>> platform thermal profile without depending on its position in the trip
>>> table.
>>>
>>> Initialize the thermal mitigation threshold to the balanced profile,
>>> matching the default platform behaviour, and update the thermal zone
>>> whenever a profile change event is reported by the EC so that the new
>>> mitigation temperature takes effect immediately.
>>>
>>> Using the platform_profile API would provide a more appropriate interfa=
ce
>>> for exposing and managing these operating modes. However, while the API
>>> itself is generic, the platform profile core implementation currently
>>> lives under the ACPI framework. Making it available to device-tree base=
d
>>> platforms requires separating the generic infrastructure from ACPI,
>>> which is a larger and independent piece of work.
>>=20
>> So the only problem is that platform profile resides underneath acpi
>> namespace in sysfs?
>
> Yes but I have a series I'm about to send decoupling the=20
> platform_profile from ACPI

The platform-profile already has a platform agnostic interface at
/sys/class/platform-profile-N. Unless I'm missing something, I believe
that interface should already cover your use case and its also the
recommended way to expose interfaces to user-space.

I was not around here when this functionality was exposed to
/sys/firmware/acpi so I don't really know the context, but I personally
don't see a reason to duplicate this at /sys/firmware/devicetree or
something like that.

--=20
Thanks,
 ~ Kurt
