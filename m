Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235344BEE23
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826576; cv=none; b=SxbXRdsFWSFGQzARa4Q7qmQWrqzufgucBXwn2ROGt18lGqo41lqrBOXHbimY0de6cHWFl6oganAbtVdxDQH6wFZEVqToYpPbLfDPNgsKWyq9vBwkZ/CgE11zfFgiAyf9fYX2xYSb2YsBzI+9Ecf7NhZxfD3PP6I41F9OgTSsHw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826576; c=relaxed/simple;
	bh=R8EeE7l7yGHjB6CHEYlgtujYryT9v0EaKRM0+8EF93o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNU9Eq0iNY7bGeD8GvKaWfmx0kK7Ojhm7edvZWeilidPENpZCyIJeIL/BANThPPgUrBGDl3FBnqNLGpICttNc9+PnPpujaZ3PzkW2qPEoj397aJelxniczg9W9lBCKWgQ3i6pBfBjOzLuK927qyrPGFRqLD2Na8e1d4w7bSNk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSBD/lsj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSBD/lsj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46EF1F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791826574;
	bh=PMF8ozn9ZW6fxlEoYIFtmrl5gAuD46WkyHLX4zSJAzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dSBD/lsjjkD6N19/TIYwjEbSZbZ+hsTnT7gA1ATgDjyffizbtkih6T8v4m7x9YMGD
	 Sx0Hh8rNXG1IBxDZW1pRL1hO0GMSbSTW3OC3cbRabMOkOv2MX1RQlo9n3Huto8GF00
	 ZInNhNBM49tVDS5cXByuMwC6RCoOKUEMfA4IBiKVcUiDDxH5mivLxcp71N5syIKecR
	 kVQnZJ5K3om2trzNGq2ITt3Hmv31AEcHQq/8vWVqfrukwD9sZVNH1EgTQ4nsBRFnqF
	 WP1yBvhjRjoa7wVOWRhCbAXT5KbgDtobSE1+9Hr2PdMnU51Tx4unD9C9kfTANF33OA
	 dV9dWoRjWPVkw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso2506338e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:36:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxWSKxBciztJWHJKZjTL0Sgaqsiu2ChAQHP+2n61YU/y66Kl372+FbcjAhqN/Wv4jn2l+gZPJ5Lch6Ya9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8inKK63li4od9VF5aS7w5IoCs7POSYkp4xijyYH8Rzo/TIaDh
	eDeCfC+Nomr3V319yMSDkOCPRGPGU5pxirGJdGJXfFI7BQ1o9Xae1f4D7nm4c6UDnzyPco6nnUM
	74OX/dr9VHDexTOWdPn924EnWQ6rD/gw=
X-Received: by 2002:a05:6512:33c9:b0:5b8:ec96:3bea with SMTP id
 2adb3069b0e04-5bcde6bf74bmr3610495e87.20.1791826573195; Mon, 12 Oct 2026
 10:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008212832.354382-1-christian.loehle@arm.com>
In-Reply-To: <20261008212832.354382-1-christian.loehle@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 19:34:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iW==OmyA=ZbJNS0jXrCYRaSRS2at2twnW0gBV-rsnW0A@mail.gmail.com>
X-Gm-Features: AclHuK9WGyJH3mzjeL_bNNS33d3gzQtOOUEtys8LIhYn5vd7zFcJlEqZH0fmeoY
Message-ID: <CAJZ5v0iW==OmyA=ZbJNS0jXrCYRaSRS2at2twnW0gBV-rsnW0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] MAINTAINERS: Update CPPC responsibilities
To: Christian Loehle <christian.loehle@arm.com>
Cc: rafael@kernel.org, zhenglifeng1@huawei.com, zhongqiu.han@oss.qualcomm.com, 
	viresh.kumar@linaro.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mario Limonciello <mario.limonciello@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>, 
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>, Shubhang Kaushik <sh@gentwo.org>, 
	Pierre Gondois <pierre.gondois@arm.com>, Beata Michalska <beata.michalska@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Jeremy Linton <jeremy.linton@arm.com>, jonathanh@nvidia.com, zhanjie9@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Thu, Oct 8, 2026 at 11:28=E2=80=AFPM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> Hi Rafael,
>
> This series replaces Pierre with me as a reviewer for cppc_cpufreq and
> adds a dedicated ACPI CPPC entry with you and me as maintainers.
>
> The separate entry should help direct CPPC changes to people familiar
> with its performance control semantics, register access mechanisms and
> the platforms implementing it.
>
> Thanks to Pierre for his work on CPPC.

Thanks for stepping up!

> Christian Loehle (2):
>   MAINTAINERS: cpufreq: Replace CPPC reviewer
>   MAINTAINERS: ACPI: Add a separate CPPC entry
>
>  MAINTAINERS | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Both patches applied as 7.4 material, thanks!
