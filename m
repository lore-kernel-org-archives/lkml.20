Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC549AA4B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357235; cv=none; b=NBuw58FqFd3ybes/BHxytgU0kbhqj4VD/3dqmLwqmgdfZycS2zat93Kjl3kTuIfQ8bvocfNFZYBlIIIuAGcMKPHtF8N28tTx3z7+L9b4p2JHDnboKlRV9UfyLFc1MggrvUAakKSasW2kxsd8HfEdyUK7NN9mr4ihF/F2t8DtD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357235; c=relaxed/simple;
	bh=lmuebTtapyafAqg/MZz1PoSj/pPTFJ0VaRJlQ3t8Yhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHr/4UQ4xBQLYJxmXf9OBoIUNr2RTM0L8VDGVUV8wyk0tf7yD80UQOAU6cz+lVvUzJy4i4AQRx8YbKwZ60BBSpC21Y1WVl7WALL1Ms7B8bwfwfnj+oS/mPCutFQ0lS8YAoVf56Jml5Bq9h/rPs8Se/26BSfhp1ySyhX3PSKk0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtMp+ymR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtMp+ymR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B601C1F000C5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792357232;
	bh=lmuebTtapyafAqg/MZz1PoSj/pPTFJ0VaRJlQ3t8Yhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YtMp+ymRPWyQ7hmja30jNOBaDQwwuI1782ArVM54H4yDKQ6vMlbBrHJh9/j6vMCQQ
	 kkco7+IJ6KuhBq32eHqDCuhf/pnUgjT5WjSoyw2mx1CvBY8c/O1pd7fbbu+pz8Gbpo
	 fsemPDeRIRM9iAV7f6WJTkBihbhI2yTu6UL/ipU4htWwMjc5qYWa9kme+ZCZxjvncS
	 hVbikVC+fQn1oX/BSOxrsTtOLfupRHkKOezACijZhgQ9BZ5on7HtqMMFVCLL0ENf62
	 5BSBjb3zwB53tvC7eFeQgKKS4ExHk+UfqDwodHlxgTa7+A16pPA2DcE6hO+Rince/1
	 uGyNY5Cyi87Sg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1682317e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygKKHZb4c5P56aS91La9Ckdl4XIPW3dQfFbU0EB8mvPOhK8GuPg7kMnyzQet41JC8vvt/iEPkLl7/IH+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTY3taiy+9wrLhFywESQFETfrVNyVOVlVXeuyCj+bi1nkJxJQv
	Ugc0KLIchgxES+qTrwcjhFWn1nT84E1kYXIL58dIEADXYus11E+JmSpaimPjbEakbwkhMTmicOm
	Ago3hjN+b9Mb0ApDJ72SxvNERDX7RLNY=
X-Received: by 2002:a05:6512:3d8c:b0:5b6:4ae:d87 with SMTP id
 2adb3069b0e04-5be50a655e4mr2028129e87.27.1792357231440; Sun, 18 Oct 2026
 14:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018040724.534641-1-yaojiale02@163.com> <20261018040724.534641-8-yaojiale02@163.com>
In-Reply-To: <20261018040724.534641-8-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 18 Oct 2026 23:00:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=DqXggfdAq6yU8=OBm5atks77CcQ4AnuR9RcAS6QQsrg@mail.gmail.com>
X-Gm-Features: AclHuK-3fui0U03t7CAaiKHddUwpmQ1nyZ2GG7y4wk-UNeVfMtV2nvH5lucn1Ag
Message-ID: <CAD++jL=DqXggfdAq6yU8=OBm5atks77CcQ4AnuR9RcAS6QQsrg@mail.gmail.com>
Subject: Re: [PATCH 7/7] dmaengine: ste_dma40: synchronize tasklet when
 releasing a channel
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dan Williams <djbw@kernel.org>, Srinidh Kasagar <srinidhi.kasagar@stericsson.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:07=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> DMA completion handling schedules a per-channel tasklet that processes
> completed descriptors and invokes client callbacks. Channel release
> terminates and frees the descriptor state without draining a tasklet
> that was already queued.
>
> After d40_free_dma() removes the channel from the interrupt lookup
> tables, kill the tasklet before returning the channel to the DMAengine
> core.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3"=
)
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

This makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
