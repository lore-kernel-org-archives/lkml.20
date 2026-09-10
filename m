Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB5D456E18
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036729; cv=none; b=QjJ+Sv1Ixbnu/EGMpP8TUVMxkMCgQ0dVSYB5UK6+0gj9wZgKCq8MiPTtIDYTrbdoKU7fvuL2mLDc4AoTQU5MR8CuuPKaPKLs0PMLQF6gP7cgnFJREFT6h3yYI/o5dnkyn3maXhC8FNjIycdGbLdTuqrHW4qHp16NaJVLU+fFVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036729; c=relaxed/simple;
	bh=unCScM6mPbDKppMrZLCM3FABFYfLuyU55r1WmWOxz60=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jwquUwZeEQXaFdGgkMQ2LN0KyRbQZnE6woV/ShuRwYJtescotM94mCk7X+ktLA9RABvZECbuwkoLzOoKAxQ+K8D88HV1R0Z2ehyySRC1heD7jE5qjEMzdmL6gODAfD+Cgkxs3ODwj40eyy1ZlstbiRcdrXj0GZYeEF5gkjoJQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=heWcpwBx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="heWcpwBx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so865717666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789036724; x=1789641524; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CpJbFL+rZz/M4vrqd8/z7ghAMgMKrwdsWiy44eS8/vo=;
        b=heWcpwBxX6ZcaHtxPHXSYiQGs+EJH9ozZKhadmKqG02fhIDs3JcHYqNTL9PEOD0kzV
         ao9tKClYZNK5bvVXdesVLVPxJrXccHkyp6w6yyil579G+Geau/DhDInfN/ly6g5Z+XDb
         jnQkcJM3/T11CR8zAoXmmynmCsYdgQmtFH2GbkdHPmk/fw+2u6Q+fh2YOth60Rf/CVPb
         MhoSN77qoJVwwFSlemxylEF+NXY256ggHyde8+0uKMztntUdJivV3JXbNnTesnFbq8qV
         iVV90g66kRe32aPKUutR0BZ+fj2WuW2zb62MLG+yHBDH4D4HxlqwRxvoJbWkfGk1L5a/
         S4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036724; x=1789641524;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpJbFL+rZz/M4vrqd8/z7ghAMgMKrwdsWiy44eS8/vo=;
        b=X2lAW+bXPLQQbjY5d/hihBRGlRkdPqAcWumqDp9jrS8oeU9xAjUyb3L4rVlDASvm62
         ktqAiDuKYN/DT+BrVyXLEgh4sNq1Y7NFwgu/THq42NWZzWtO//TQhl/5TolRX5TYVRQY
         EZfucn4H59/96zh6kVcoUqRRx9oA76wkKgHNprxiKVVSWmRyJ6WJmRpattyioY6EOB52
         TMpQn6vHwV9ygwMMAxedJjks9o0PaPfF8YYwXXuUuFRpdwH8stAOUv8zA1lfemJMcMzM
         OBEdZ4y7uWiNNhzKgYEtIbMqWaoY1epcPSwE4ubYEVW2053jYKX7MXKyi88D1tRF28SK
         j7ig==
X-Forwarded-Encrypted: i=1; AKwUvBx0Lyw1lO1a0BNvwyPs4EkPZJDJBb/bQih7rqRyZsBfqFRPstM4gAiKiX3LmOh7YrnqGUCFJQ69SH9kx9E=@vger.kernel.org
X-Gm-Message-State: AFuF++nWMjCvx+Fr4MT2RjjE3PraRUik7Js8Glq2gJjiesGB6lHyXBWz
	+R/pf6e9LGbpSWX5SiKA9pFGUE+eXtN0fDh/tSTvZchQ7I0RXDPW9K6pXjVR7Ko8Mmw=
X-Gm-Gg: AYBFou2+iNZBaMdEivoC7cTsVridU4CVsS+SPO5tXyudfvP5UA04CQJrap1Q/3dhNjm
	ugY4rp53QDJN2cBcDdz5xZlG32lloJ9NGDNpOSTPcFt1pbCJIFOTFAE3YpgNPMR9GlIkBXb3SdN
	tXrrImZXTmvCeOzus8ORv7JT6/dKuUW3FQw3ttcAwq/pbndTR6LBEQ1Ejj4xQShoqSxtWttcqdt
	tieLVwaiLa4iBxVsgkK/vHdcVTN/swRr6qpHSgVKCTnxMdreHpYifn3iqusrXNJMhrkHo1W26zK
	7PhsNxEvIJaZB99a9NtahAuvWjSYv8+lBscQAGuFki5Mcb1KXsw4IVx1BQ74w2CECK8Wttuq8f8
	K+0z+FN98ZOOdkcvPeiJwH95BvqEb7FxBF9U9zVS5EZrvt0Fqcl+AGRtr3DMit17saH4i7KQr4J
	sAFdcPvLvEYPcq1muelQcvJ90H9/OIYb34hLmuOVSL1QNnHd1yJ4c9BiexgYN/Zpehv6myrIWy7
	4f5Rs57TaUFo1/W/9gHrEFC2f3/Bh1LD8E3lHfXQxzf0rG1W2FywLw=
X-Received: by 2002:a17:907:c0d:b0:c12:74af:51f3 with SMTP id a640c23a62f3a-c260c7ac988mr1629919366b.6.1789036724503;
        Thu, 10 Sep 2026 03:38:44 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm911270066b.23.2026.09.10.03.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 12:38:43 +0200
Message-Id: <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for
 instances on MSM8974
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com> <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz> <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com> <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
In-Reply-To: <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>

Hi Dmitry,

On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
>> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
>> >> Hi Dmitry,
>> >>=20
>> >> Many thanks for working on this and sending this patch series!
>> >>=20
>> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
>> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display,=
 GPU,
>> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU=
 v1
>> >> > spec, however they differ from other Qualcomm platforms in the
>> >> > implementation-specific registers and also in interaction with TZ.
>> >> > Venus, MDP and VFE SMMUs are secured and require programming only o=
f
>> >> > CBs, while GPU and JPEG require full programming.
>> >> >
>> >> > This series skips IOMMUs which can't be tested right now (VFE and J=
PEG),
>> >> > and adds only MDP, GPU and Venus (although untested, it is required=
 for
>> >> > display to work) SMMU instances.
>> >>=20
>> >> I do have a patch series (sent years ago to the mailing lists as well=
)
>> >> for CAMSS so I can definitely test this in the future.
>> >
>> > Ok, let's land these first, unless VFE IOMMU blocks display on your
>> > platform (Venus was blocking display on APQ8074 DragonBoard).
>> >
>> >> > Note, to get display to work properly one fix is necessary, [1]
>> >> >
>> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf=
18d2e@oss.qualcomm.com
>> >>=20
>> >> I've applied this series on v7.2-rc7, with the extra commits between
>> >> that and linux-next for qcom_iommu.c backported so that your series
>> >> applies without conflicts.
>> >>=20
>> >> So far I'm stuck with the GPU not being able to probe, adding some
>> >> printk's shows that in msm_iommu_new() the call for
>> >> iommu_attach_device() is failing.
>> >>=20
>> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load ad=
reno gpu
>> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fd=
b00000.gpu (ops a3xx_ops [msm]): -16
>> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed:=
 -16
>> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to =
attach to DSI host
>> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-=
s6d6fa1 failed with error -16
>> >
>> > See the patch [1], it's picked up for 7.3
>>=20
>> I missed replying to you, with this patch the display lights up again!
>>=20
>> Unfortunately the GPU still seems to have issues, I don't have a log
>> right now (I think even SSH was dropping then with a bunch of log lines
>> appearing in kernel log on screen). I assume kmscube + more complex
>> workloads worked fine for you?
>
> I was mostly using kmscube, but I can try running the CTS once I get
> back to it, sorry for the delays.

Yeah, kmscube doesn't even work for me.

Bootup works to a tty with screen on (mdss doesn't seem to have any
problems for me), but then as soon as I run kmscube the device shows a
few errors on the tty0 on the screen (USB stops working apparently since
my "dmesg -w" doesn't show anything) and a few seconds later the device
reboots.

dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt

The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).

I know there are some differences for some bits between MSM8974
(Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
have? Maybe that's relevant, also since downstream splits devicetree
based on 8974 and 8974pro.

Regards
Luca
