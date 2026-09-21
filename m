Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15909457E42
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981744; cv=none; b=qMuknYk0Owx8y5aI3KPd1GuGgMvwgP9IkqJjdoWpElp+cbTd+J863PbkO/6zDkWFk1l9FjWOmWai5xUITWAwZ2WcKsbqM+HMPP7aWfiT0/eGuPY76YHYlATtZWAI0NUeq4DisSniyuN+0SzWCDo4e5tIzM/+2Kuq+ZENDpoAuho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981744; c=relaxed/simple;
	bh=6jCtNbzvAFfnCkQvIJdZvE2yI4m1pEyatz+z0ebGt7Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8QHLeaHYZPa2dbuQBB7hbNVoFZ8+Lu3fVv67iv+eOOu8gybCme+o+hTuOUW/VgVlwc/seiu8XJZKpeGH+Bgnrmzg4VgmrrztcP9cGr/+fMLEChpjKvyFIBGBcJXbTxEB2uyit7DA0defTj8WTvv57WMeVwIcdrCtTAVAxLCCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjmuDHjb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjmuDHjb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3E71F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981741;
	bh=6jCtNbzvAFfnCkQvIJdZvE2yI4m1pEyatz+z0ebGt7Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LjmuDHjbkOR3/7rHtGdfeVrBzYXeLYJMOatv4fto1oYsMSduTQ6p1BSpZrkjSNqjU
	 aJ4ezS/BKOdfPGlMC8sErOlNKw2hszGXbpCXglYmJibp1wO5Po/QqueVB9r8IWKbJN
	 NP/2cvqPuJzJ2ZEr2B/EPZ3Yae3TvFmf8JtJ3SHC5FQIEuORjcxxh1VyQ9IypER/me
	 EfXbH9DQl0mSnMfXO5ErytVrwpDzx5Zb9VHM1FPkSfuYY8lEv9HxN6XMHgdZUwrTCC
	 GsCXfYfy1wrtgSWgCyx1qpHxfy9e+PrcIumAClL/EysBcVu+5RplzLy5U2cYh77mY1
	 VOgQs63lmwlAg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso2389600e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:09:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZer4iHc09syQSi9MJiT5MyX2KMeoPffounL3FA8NKmLdCwRBzo4qYt6ux0m80M9ARO/lmG8f/YzPltLA=@vger.kernel.org
X-Gm-Message-State: AFuF++l9a/EBvdVrRcaH5NkVdtIdGHHNymA3MDFu//hRZ6MWjyd9J3U7
	8Cl6+NatKMupex8TAAz5DZbkS1SahhYq3fEB2ws5DFBMsrU6UzcVsOE0EFPEJxB6T11A7spkf8S
	24sjCQzu2ebA3CtR2ARtI0GsE1zAvyWgYb2sP+YjxxA==
X-Received: by 2002:ac2:4e15:0:b0:5b8:bc5e:b580 with SMTP id
 2adb3069b0e04-5b8c19583a7mr3502274e87.56.1789981740260; Mon, 21 Sep 2026
 02:09:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:08:58 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:08:58 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <p2qiwwig7ap74puja6mgnz37lofljhexiapmpp6y3xmwkhs2dn@v2mxawoivkn4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-pci-m2-bt-rework-v1-0-3c7d9cf9c010@oss.qualcomm.com>
 <20260915-pci-m2-bt-rework-v1-3-3c7d9cf9c010@oss.qualcomm.com>
 <CAMRc=MdJgXDUb-Uac0TRB8u1WUpLng51C4yMH6iMEMoK56tQYA@mail.gmail.com> <p2qiwwig7ap74puja6mgnz37lofljhexiapmpp6y3xmwkhs2dn@v2mxawoivkn4>
Date: Mon, 21 Sep 2026 05:08:58 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdHy6M9cY-ZqMXP_F6yLuVuipDkZwHoBF0D9W3A5VkOSQ@mail.gmail.com>
X-Gm-Features: AcwNN1WxEae6jjegpliI2fL_J2GC3AMnE_px_o8YJ5SvWUKC9-5ouNBZ6FP8184
Message-ID: <CAMRc=MdHy6M9cY-ZqMXP_F6yLuVuipDkZwHoBF0D9W3A5VkOSQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] power: sequencing: pcie-m2: Create auxiliary device
 for the M.2 BT interface
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rahul Samana <rahul.samana@oss.qualcomm.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Amitkumar Karwar <amitkumar.karwar@nxp.com>, 
	Neeraj Kale <neeraj.sanjaykale@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 09:58:27 +0200, Manivannan Sadhasivam
<mani@kernel.org> said:
> On Wed, Sep 16, 2026 at 04:19:16AM -0500, Bartosz Golaszewski wrote:
>> On Tue, 15 Sep 2026 16:24:04 +0200, Manivannan Sadhasivam via B4 Relay
>> <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
>> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> >
>> > Currently, the driver instantiates the BT interface of the WCN6855 and
>> > WCN7850 combo modules by creating a devicetree node at runtime using an
>> > of_changeset, with the compatible passed through the PCI ID table. But this
>> > method of creating a devicetree node just for matching with the driver is
>> > not recommended.
>> >
>> > So create an auxiliary device for the BT interface instead. The serdev
>> > transport is still allocated here and handed over to the Bluetooth driver
>> > through the auxiliary device, along with the power sequencing target used
>> > to power up the controller. Also extend the provider match so that the
>> > auxiliary device created for this connector is matched as its power
>> > sequencing consumer.
>> >
>> > Since the runtime node creation is now gone, select AUXILIARY_BUS in
>> > place of OF_DYNAMIC.
>> >
>> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> > ---
>>
>> That's some nice stuff, thanks for doing it!
>>
>> It looks like there's no build-time dependency on this, only run-time? Can I
>> take it independently?
>>
>
> Yeah sure!
>

Nevermind that, it still needs is_controllable().

Bart
