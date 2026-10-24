Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792803559;
	b=a6dwa8sRZfJ9KAASNXFhLppU8+8MO/RhD9RFKkz9YpfuMjJOTfnL7MOGl7LZJwW3E5wt
	 WxKzZHcDSLPYNWXmX3/w+E0SR/eSkzx0hmfYSTEXWnMCzLtNT78AXjukYO5NbVoLydJZk
	 Z/c7rvoP0HhZCDk2e7DFivISPHvbyqSlXoKly6pyJ/pIlnmFPij4QG7RVowCUKCjYPu+z
	 2s2DDUxfMXQmnxvyhqlQbyrDpNAIbGm56wvRvyy7PtCR5BQomfShCQAiSCICf7pbpBrsJ
	 W2CkqFcqBUzMR9vsZm4WlycMx6GaXIWyGYGeqZpEP8f61M6cfKjhx5VngtHWKiPwXIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
	b=NKiK7wzDe8PbTX3ZDQQdOFXZw9eHzf7axJwoTUdb1N4xrSBQA1NKfxs5RpdWOElx2qfs
	 +DZr6j9SDlQbN9ZlS2uy5XFfrYRyeaoGs3vrgDG6UJlMifoedwS4RZT6BiphxJ4MrP+Eo
	 mnchjJA1g6qlLSg+JFXNBgOSHflEpJ4Puev7E00jOCDx4tHExIdZrlw8aysAQFbVJ1/Db
	 LyawnwNFt7SWfr+uuUu8Snyw3aykCNTlZABokTX9uN8xbGHbPSK0wfdKe9szXMf/ef9IG
	 zARBhCNEiE41GK1i67xJxBkfI+nnRVHOkGtkTMpbhEGOdoHcTl4XwXq1wGJ7slJBVmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvNnJ2qJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3655606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3655606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvNnJ2qJ
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-16079d54c17so2916703c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792803558; cv=none;
        d=google.com; s=arc-20260327;
        b=c0PqJaxhj0j+LjhaiJBjSMfd19FtAMT2DezF+ps/B3hC3Pof81ESuto7T+Rvyh3ioZ
         lIOi4hyYalOwjRiqjiSUdnpAUIzjcbkaIVSpeBib5zk7CmXi0ecpxtRP0M6uPa9wV9zG
         YJPsq9A0tF5c8AyKRczqZFboNPa1TkbUzTQbwi5qOkdsOQ7pUMEZMCmuRi06VtG/2Gcl
         9fh33rSXm//+zhLTPeLVPfLZQjESdVdKh2j3/eKUKNSs5YZbVkVS0UFLEKVmz2+4ucD3
         QWLV4ML3hK8hVB2IswxA/y93en+v/MvXPU3BsRE56zc4/5m/ZubZg9csdYE9E7x1KujA
         1Jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        fh=yg9/hLc1mjPvHkhy8VQbtnTDD2fs9yo4V9xcXA8Mshk=;
        b=TBu2B7bBGV6/emmz1WD6WBT1PFV51lPOMk1n1LujAjyREEnJ+6Ygp671fyfLeWNsWt
         w6MG86go3+PuATx6ZqG7IrG4eV/YpmC/jMOtX44WLHsb65/iKwaKiq4KBg6L5KWs9vui
         vLIEtBcWl4iWDm6LFZ8zLXWHvQMEHNiSzXKPqEhVkkzn0EFIB/Ms8KFU6/oTmpl6MHT3
         TGbeN49lXH/ybVUgw5O7YFcMqrhQ5KMxOTLqGvQzbGkSvUdHCwP+nh4fFvQo3MpExGqm
         VTY3A65S2u3EmOZj9GwnAa8ipIAQXDJz6fueNxNrkxiBVM0u2rMPeybLCP5ATVloCyZk
         DhOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792803558; x=1793408358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=BvNnJ2qJiKNYx+kMqLstZUfLbZO3SWFMHIFNvg5PlmWaoOBd1ZXExM66HZnXjTCi4S
         unE6rjajRqY8/A7SPEfI+4LBAuyuJiZmoG6Q0Fq7Y+tQ9wmZa108XB9h2/Ng2vW0Xp/b
         AuD3gZTSlSYuSougzvuYb2iXNty1CyVxCSA205hal/Jtbnmth7kFubu1V8Iv8Z9fKKNc
         jNTDfuf7/PVrPtMco3654bq7gxYWtmwWshbc7A+9XOhzjwvfjRy6RUeLptR0GdzXx5k2
         Z19S16Xi3RX+FXqQpE5fkAoh5JaAMd13ZeR4cQZkBBCyl5sEOlwgR5aS2wARVCM7yyxc
         16ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803558; x=1793408358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZo8YGXipFDOPlk5LjrlXEXfuFOOoXy5+FZD35r1Kog=;
        b=WMBD1eY66ieP3eyS00Fomi2+zqN5bJ6GEnjPMzIhATzMy53St3g8JTrIWK5v3eX6a4
         rCz/ar+25nj+7VhA66QFQg5ax9vt5Xa2j3alswgdId7JhE4SDSeAJfG+SJXEV0FW68rM
         L1o4A66AnKLZUFV91V3z0t7gEWapxDxmCmctLnWvVd8mRErTzaMs/XacqAKArMZULJlb
         j0WDKVEen3Pn5uzjDWtY4UEhizy4Uu3uRM/t/i3IT7ret1XYthmExrtrTyriviUXlRgR
         DLRR5Toz7qCqsdz24Fh3cCMooVo0pnNCpwhTLsjsWZd7BhE5SWpyZIOrfqDie/464C4x
         FQoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY9v5VrnYv6FJAOE0FM7iCLEL/Ipgv0SZz6t10FNAj9Ypis0qZXlrNMBkML4kqYSqsd25npbzL4qlsbCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVFdLvpLXIy2cbd/yNTixrtaL39TWcmp/1qf9nQoEuOB1Uldvr
	c0qIjpsBo/2jKsvPA0erYHsqWOIL9i3IIm8G5RyFP3OBETHl/y3F+63uCxih6OhWxCI0twJDHPu
	Wk5a5Zc7BEyRe89xSk4TjKgKALXNWbzA=
X-Gm-Gg: AYBFou3uskhTRPLhrGlVrXC2ON6VI/Ladp+Rr1iBCE3kLDEe0buKIVwr4LQmAr2sl5D
	Q6ccM75oB6r7tKFtyi2Y3kexjQyopQQG8NqT1fNw8xTmHX7UhLKo7VnBEl+UMqpRhxQfPU6Ukak
	1kZ6u8Y5R354fMGVweOZ/Q6ScRFxliz2fifotD/wFO+V1QzTIs0Ckt/4l/trjLBJZoFcAnTUKOw
	d7SjRHH6vvLLYkVLFrwMHvejKijSs5CNOnt6qN3rbyposjZgea0hR3HgnFwcO9ijhPC/9FTPIfu
	V6vRveihEhv0SEr87bgtAR26+okjkR6NN8JpLgVYAayfSxHRgnyrU6uFMQsnikguLFuw5JmiQNG
	e2NJk4kIU1YKVBw3y5KQ7VowASL/0pYRTgslgoM7CHTjXw9KYKArQVn1J6Fv3zqJFBdeZ
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id
 a92af1059eb24-1992a250624mr874553c88.1.1792803557836; Fri, 23 Oct 2026
 17:59:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com> <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
In-Reply-To: <e0becea2-c5a1-46d4-932e-50517311fb96@oss.qualcomm.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 24 Oct 2026 07:59:06 +0700
X-Gm-Features: AclHuK805OtpEX04XfOwa7m3QcwJPrF0jSlDAfdHBuylNxB6UZKJYqAFi9tMyjQ
Message-ID: <CAAq9HC7EdA3proF75D9kKa0QFJswV-bFp284u2vUfJi-dcj2_Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:14=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/22/26 11:41 AM, Reza Kurniawan wrote:
> > MSM8917 is a single cluster SoC, so powering down the cluster means
> > powering down the whole system. This causes two problems:
> >
> > 1. The system becomes unresponsive, even to common interrupts. Waking i=
t
> >    requires an interrupt from the MPM (MSM Power Manager) or scheduling
> >    the MPM to wake the system later. Linux currently has no way of doin=
g
> >    the latter, so the cluster may never resume operation.
> >
> > 2. Entering power collapse blanks the screen. When the state is entered
> >    and exited repeatedly, this shows up as visible flicker.
> >
> > Even if MPM scheduling were implemented, the second problem would remai=
n
> > and it wouldn't fix the system being unresponsive at idle.
> >
> > Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> > is less aggressive and can wake up from conventional interrupt sources.
> >
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
>
>
> https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.=
qualcomm.com/
>
> and
>
> https://lore.kernel.org/lkml/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0=
d5638@oss.qualcomm.com/
>
> are in flight, you may want to integrate/test them locally!

Thanks for the tip!

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
