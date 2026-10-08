Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C3B370ADF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465109; cv=none; b=mDRLs4+tx6opmmGAG9d7PV4OtzxDmIsBTb/3DwsTf4tWbx9zmgzEOCC05eZWQaDYBN9k08FFE+9AmMOKuuOvNk1gDG9Pp5Xj9uKi2bebJB0QghwMkBPwlOWDQmqX8GQhBvsAm+FUXI6sGAtl042rVXsaZfEl7mXnZanpLhlNuPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465109; c=relaxed/simple;
	bh=3ZUbMxUpxX0Lqzuy2UJBKxnXi5XYr9NHRVpDorwgq/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNjJ8iv50DmfKiT+8Dc7WuXhTAPc/gZNpxbYG5QKP5o3nOxqIlbIEkVn04RKc9Dl1IlJFaAADwrOsshBxVgOLZIJfy27l+Ev4mIO2xy7l59F5Sa28Kgyc73FpXrgBBqfB30zd0GCQEddWilr9u9wXg7WYCIEZSs0BQzR+5VvDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gc+Q4XJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gc+Q4XJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452D91F00899
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465108;
	bh=3ZUbMxUpxX0Lqzuy2UJBKxnXi5XYr9NHRVpDorwgq/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gc+Q4XJWclPhlbaRpo2R+ExSrEtVW6wPROlsQ4Bi7an43X87dFa3DxQ7hrqnJaPTn
	 Scn6QJ6eiOQIPr9d7Ecs/ta+OfQAIte5ICHNa7Bd1g/v4cLQPuT7ZumWBXX36Qn8sN
	 epRzgHjpC4afw3b7iGZckjkCPZL7yrkHgxcFz8fQnuhXlf6zbRY/+5HQGMwBFCHBlp
	 2OgnR1f02p7wfnu1/v6U277lnEJzxlZsUTp+Rtuxi83RlgtNB+vqMM5DKTLtbx/4GK
	 2mKj/S2Z09VDFEJKqBxv8rmmuJYtonS74KaPkhEK3TpxVS6z3aAIJ+Ut9JryjYQu0R
	 LIJNTAqfvAggA==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4911df1e196so2625119fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlJ5kkSAk5tV8lcUG5dEY65yV7ctlr9WruXJxRZVD/BR1DT/Q6nLFAadm60JGTcFBpO7PROtQqoEc7o+8=@vger.kernel.org
X-Gm-Message-State: AFuF++nDWpmQgfSf5c5vjFfMuq45IEM2A4pADTSqETxJXpTQP7/dQuEX
	vfJAR3VGHZrSkiQrEVWGRrHV5D+CIc7WAiKi+CfF3z98GeqSIa3sQXK/1iophyU2vrz/DKLHkaQ
	wt1WxTrRZ+9Mc/3/FQNjSzghLYFeBguk=
X-Received: by 2002:a05:6871:e494:b0:447:1ceb:7cc6 with SMTP id
 586e51a60fabf-4a25941a610mr4860389fac.15.1791465107628; Thu, 08 Oct 2026
 06:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com> <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com>
In-Reply-To: <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:11:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
X-Gm-Features: AclHuK9XbU-gzMmBKDUbW7UPuP5oQ_ICgGoyJeEiFkqnZtp9niPEqb7SccXKcXU
Message-ID: <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:12=E2=80=AFAM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> Hello All,
>
> Both of the following patches are ready to be picked:
>
> [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and
> size cells
> [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC
>
> Could you please pick them ?

Missing from the To: header of your mail: Bartosz, who actually maintains
Qualcomm pin control.

This is likely why it has not been picked.

Yours,
Linus Walleij
