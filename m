Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E730F4D5985
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471962; cv=none; b=HZpHJBVrMmzK+ME0P7PJ3k6tWN1L00myL4J3yMvGxvmtCr9IU9DQtGn0CHpCOnyN1x5dLSO2YZhzCEDxCXwEHyCJ5wum0OI5okpwRLsR/ruFYUr19VypJLxtG3RG5NG7xxTJ3y/jx+fe3p4AI7prERH6s/edkI+iQztumM5IWdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471962; c=relaxed/simple;
	bh=M3eh+eqPsqcE5YvVl5FSV9uki97nCFfIXkAkKL28Dxc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJ+v4IuKVeW0GayQIq1Lg37kPHI+T7qeF8U27HntXhen3KJw963Tj1n3oWV+7K820Q0mpUj0ENPUTwoe6g7EE0B9WBS+rwdUdUikK98V/NH8TZoicTwox7Oh4EhF8q1mEgzc713g+lgB0cbCKjjLZpMIGcoTG8PTYg2HzN13wOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZye8FHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZye8FHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3941F0089B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791471959;
	bh=M3eh+eqPsqcE5YvVl5FSV9uki97nCFfIXkAkKL28Dxc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JZye8FHsMGO+Vhak768IyEeJ7EKz1SQUH8yovlQE0RC+CJfM6kyzx7gtXKzSUDJtT
	 lw2phsBV2qzm/emoM9GUXUs1ZAz47wNKvWCR2GPMGq4q5G1j7j+UakCqBZp99h0gNk
	 Ta6y2LRBQCiAoWgMqMl5iCXq3ajFAEhyuxLRkLtpeYqaK4gYaLaaGEcr399vTsDbl8
	 O9n9wvIoLO2y6U7CA5G5enfSsELTRPH/H3wVyeDgK9UMyLU2WK6jGLe0auIXpE09PM
	 lctSvIo87BT3yzTrAzGAfD6rKrK3J3LQI8OX7NX7UaWwdncf50p2bDlEO8oR8pwO5G
	 vgWtxHHI6waVQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a9761758adso25142331fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjOpaQXqLd05p6xy0ednOEouTzsqBCy1BlMtjaRrl8eyHKoyQ+s6uycRVDYqAMsD/A5nbpH6SbHtXyT3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNLPo1tM+0R1HCHSRpbnCu1rfPXxp7tM1B84dhfcfjErZx19hq
	nWye2bn8riw7otplH5tglqxoIaSj5cWHagGyuzPNK3umZiGPJnevpi26yAj/Cmb/5+bA56Sr6ZC
	oClCWmkAWJ/Av3U3GhRnWKBI2lDl2Ksfi3vEX6CI7Ug==
X-Received: by 2002:a2e:b8c9:0:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3a9a2d0dc0cmr14079951fa.20.1791471958269; Thu, 08 Oct 2026
 08:05:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 17:05:56 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 17:05:56 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com> <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
Date: Thu, 8 Oct 2026 17:05:56 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdTYic6qG+gnnOExXWhfgbjygi-hR0Rr-FKVAhBkw1C8w@mail.gmail.com>
X-Gm-Features: AclHuK_vfKWdSTRB1YkJ3uHKdqAfTiQySmCCqB7eRtdQW3xirznTZ4Z9gYURvgY
Message-ID: <CAMRc=MdTYic6qG+gnnOExXWhfgbjygi-hR0Rr-FKVAhBkw1C8w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Oct 2026 15:11:31 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Oct 8, 2026 at 5:12=E2=80=AFAM Hardeep Sharma
> <hardeep.sharma@oss.qualcomm.com> wrote:
>
>> Hello All,
>>
>> Both of the following patches are ready to be picked:
>>
>> [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and
>> size cells
>> [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC
>>
>> Could you please pick them ?
>
> Missing from the To: header of your mail: Bartosz, who actually maintains
> Qualcomm pin control.
>
> This is likely why it has not been picked.
>

Devicetree sources are Bjorn's territory. DT bindings should have probably
been sent separately though. In any case, we're at rc6 now, so that ship ha=
s
sailed. Please resend after v7.4-rc1 is tagged.

Bartosz
