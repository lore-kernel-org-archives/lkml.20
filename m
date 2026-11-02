Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643700;
	b=ZZLp3zyHaiGY9JYm3bMk35JoO1wrv7uTd+v/cktVV+O8tlJEeRd4umAs5r1pZY3FDBs0
	 h1OU2LW75NkqWd1tzTJ3jE9EnJuPwxztrBy6Km5k4g6sh0BrTu4agspWgzQIV0IWskLsu
	 qc33aeVA3yY+EyUTDCPLG9zbOziS8SXlwrXof3GrLkYa35TSxA2ZyM9kTJVcKailv4ZRo
	 Ou9edEa3Bo2kzEVrjXm5R7lNByrnJ87ahR7rIY+DHZR60sUTHnGBFmS+7NSrgprihpYMK
	 8XuVNCr/sDHutz1IMofXvL07NvLCtURLwOmJxnFINW8v/WGMMZoyUxz0hf70W8LntRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643700;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=q38foqS/OazfldD7BEXLdEUQlWAMNGGt9K+t6KPtZ1o=;
	b=ZdMsgZJsqXc4Uhlb/Y0kO0eI4X4KpCLvzuuQQBpnRgCeFfjfgITRx1KC7xqh0z8Um8zG
	 aW8MDPschahi621PAKljSLzYpQRFczbtQ+ia6pHIvnGs29mtP6E1ur+tXKuc2+Nze9uuC
	 E3vAdSRZT1NiJEV/OJF24VZ0oMcsjk0lr23Tx+lDXgOS97ZBPR9IFHjxlceG6ptM0vtlM
	 wv4XD+qzMYmIq55FnSjeQ0o77Z297jgBAwT/sndP8yrTIvNIBK73TVkhKUywPEovo/75x
	 vwQQyQR3w/Go3/J4LIckVY2uB+HwVNgfXkdKUNHJcygQGovYEEuT4De7j2h4j5a742A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dawidwrobel.com;
	spf=pass smtp.mailfrom=dawidwrobel.com;
	arc=none smtp.remote-ip=185.70.43.98
Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852E9606A324;
	Mon,  2 Nov 2026 18:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 852E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dawidwrobel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dawidwrobel.com;
	s=protonmail2; t=1793643691; x=1793902891;
	bh=q38foqS/OazfldD7BEXLdEUQlWAMNGGt9K+t6KPtZ1o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=myS9S/bnwzIWpy2ZMDwxF1uTrSsALMSpeSmNqxJABojSIHe4S++7fAekSYsRgs7GD
	 ixSlyzwBKNP90JViSVmuD12nNzFyeh1/hsvt2+CDSiX9UzRCNBaTbx5muaGICydlmH
	 bTYjNmvfgxtotGg34/POn2w703G4Gefmr9xEW09ykeIWlvnma42UVf7+IPXtwKEo2C
	 7jwayPqhhO/vpa5zn3n2Or/oZEpafmSU0X67RthHV3TuwXEtnEXPVAsr8trc22V4u7
	 vI87aUjrysmLEYSI1llK6tl6zqQWTFLx7KwGy4D4Af7TjJ6L5FS+gyaAYsp3LGs7jG
	 XuMwpxC4YTUhg==
Date: Mon, 02 Nov 2026 18:21:26 +0000
To: Haozhen Li <dezige131@foxmail.com>
From: Dawid Wrobel <me@dawidwrobel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Sam Day <me@samcday.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] firmware: qcom: scm: QSEECOM app loading and listener support
Message-ID: <cbc71671-3254-4096-a2c4-e441fa445582@dawidwrobel.com>
In-Reply-To: <tencent_9E79DCEBAC253B8EB7DE779D4180A77F7D0A@qq.com>
References: <6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com> <tencent_9E79DCEBAC253B8EB7DE779D4180A77F7D0A@qq.com>
Feedback-ID: 173987960:user:proton
X-Pm-Message-ID: 9a7ed31cb7ac231be9b74a522a6e3c31693cf72c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2.11.2026 17:27, Haozhen Li wrote:
> Hi Dawid,
>=20
> I owe you a sincere apology.

Hi Haozhen. None are needed, but appreciated. I may have come on too
strong but still expected this to turn out to be a mere misunderstanding.


> I would be honored to contribute back to your tree, entirely at your
> discretion:
>=20
>  - A PR adding defensive checks for image and listener shared buffers
>    above the 4 GiB physical mark, using the overflow-safe comparison
>    Konrad suggested [2]. For what it is worth, I probed this on
>    sc8280xp by OR-ing bit 32 into an otherwise valid image address:
>    the firmware rejected the APP_START call with an explicit error
>    rather than silently truncating the address, so this is strictly
>    defensive hardening, not a fix for a universal firmware defect.

Absolutely. I did apply a hopefully more idiomatic approach, which
considers the QSEE version, as suggested by Konrad, and sets a
dma_set_coherent_mask(scm->dev, DMA_BIT_MASK(32)) on QSEE older than
TZ.BF.4.0, following what downstream Android qseecom driver does.

>  - Testing on different silicon: I have exercised this transport on
>    sc8280xp with a FocalTech fingerprint TA through repeated
>    load/shutdown cycles and enroll/verify transactions, and would
>    gladly run your tree on this hardware before you file your RFC and
>    provide a Tested-by.

Absolutely and testing on more silicon is what I hoped for before filing
an RFC here, so this is still very much welcome and appreciated.

> On the userspace side, I also maintain an independent D-Bus daemon
> implementing net.reactivated.Fprint directly, without patching fprintd
> or libfprint. Happy to compare notes if that is ever a useful data
> point for the wider fingerprint ecosystem.

Absolutely, let's take it of the ML to reduce the noise and switch to my
repo.

> Thank you for your candid feedback, for CC-ing Sam, and above all for
> the groundwork that made my device bring-up possible in the first
> place.

Appreciate it.

--=20
With Kind Regards,
Dawid Wrobel


