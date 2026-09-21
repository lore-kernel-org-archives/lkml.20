Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1858457E69
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980565; cv=none; b=WgxOtXi+MnyKmJLwVPQ/KDqQHrZ7x41sTFN8j62Pg2ANP0wsOXXZppWw7kgSfn3a12lN/dmMbJKFQ/Y0TyPMdbbjeLyrlcS90koSkd5dhi1uR9iC0CUnkxQWS5p+dBuCCHGLnwLL+RWQRujRockzvCh9e4ShEyswu/XVHle8VEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980565; c=relaxed/simple;
	bh=aXXI6qZSftnDBB7pW8dlkQ9ZZoW9xYpm7SSjOgSUseQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEaBXNZvm3SzjrJku2yzjzorOsmf9W5Zgb5MOVE0jCB9xzff8aQJ362gqkrbU/rwBL6YjYITZkOUHi1JwUlsx+Rkpt7yi4FVI6jsN1J227YHUNpPZnXiSUzmdXyRdxeep8v07A5A1Y2RVs/VbzPdrtGfGD+EnJZKo2oxG/MMpZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMpWgVBg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMpWgVBg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EED91F008A1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789980563;
	bh=aXXI6qZSftnDBB7pW8dlkQ9ZZoW9xYpm7SSjOgSUseQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fMpWgVBgHck8dBXN5bKZKgffwIdD8KGLQ0hoY26Ac53WUVKzx1JO6NNPWlbRTjLzL
	 f6DU3uDyPQPRxJ4aYjB6L+LIkcj1eqb3gSGHos2SZs5Q+7zAybPvF7Osv8yuPg9QwK
	 yGfaCzEYV8ZtrxYFSKxHxbx1XiAYpwzXlsgTk1s+wvLRMBwd8PgxlOEylpLVjvlXP9
	 JSyqj1Hvs/ZOQEFZ+5pGy2EXohd4QemZyK2dHl2ayU1ITBFEPE67iSR2rmRxEXZ793
	 2O+3JdVHa92x+j/+mYMltj/FwyAvWXdLkghZSMFnNyfHUp2dGiqjI/ShRAaCzYEV5L
	 lJlJkJ6gkcc/A==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a30521ef15so18748141fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:49:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOQav0rkWGqYolq3Xe6u29owfssyJJFvseOg7Gnr0FByRtYJI35AlTmtqlUR6Xr0en2vIHS9DhbWtu0U0=@vger.kernel.org
X-Gm-Message-State: AFuF++mWERg1nPAmCKE2VAMcAus6HReRBKj+cI1pZ0oAiKxwEtj4OD/X
	cheGmA1VAO9ISeH6pJBplNBaS+q/J8PQSCD4PnvbfB/PbBf9fxXPsKVRc6PudYOf3gIw1td5njH
	IWjLNZ/A091dg5SNnj4atcg0m5NoCYbrqkEjj3wMrUg==
X-Received: by 2002:a2e:a988:0:b0:3a5:e541:4236 with SMTP id
 38308e7fff4ca-3a5fc04b1edmr22125741fa.13.1789980561976; Mon, 21 Sep 2026
 01:49:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 04:49:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 04:49:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 04:49:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfYX9HNThU-iKz96E=SuxYrbzvnBvydgFg5Zzm4W6DYAQ@mail.gmail.com>
X-Gm-Features: AcwNN1VIOtGi4TX6sjrvBFG4FgjRzIpJ4aFRqseFcwaJ7cYCEj9KFQALR3b9B-c
Message-ID: <CAMRc=MfYX9HNThU-iKz96E=SuxYrbzvnBvydgFg5Zzm4W6DYAQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sep 2026 10:10:49 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
>
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.

The last bit should be dropped?

>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz
