Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4031F99A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273251; cv=none; b=p0hU2p7t7LHUYmuGZF6mA51tlfWlToPbhl5ik62AM/GN2u9wh4BQo0rYkBCT7874UblRRWIPYhI/J/MNMrtwCtMOKuVScsYan/GQX2H57lvGnBePA0r2E7QuIuUMJhJeMXMoGglPDzWmHxArx6YUV8USZzoNLe8HYJfhu7QHCS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273251; c=relaxed/simple;
	bh=pKJj/9Wwtc4TG4Knbq09oNmo8hoqs+7fYuFsxQmFjxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=md+LG5BBJJsACXldH2VIVWnvrMpxmep4HUlgY3KmmoDnmhIh18ZewZSYLae0ZdsIVGx6/49Odxb8x1TuhJJI5zwyxxHyDgWrsqG1BkJRKGoGgFRXcKj5VYPqHPS4J1E6S6sRsvy0+nTGu7VVEkg3vPgFzxNokOuBsoc5vgw0d1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net; spf=none smtp.mailfrom=nilk.net; dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.b=AiGQCGYz; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.b="AiGQCGYz"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6c8f6a53fabso1990082eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1792273248; x=1792878048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKJj/9Wwtc4TG4Knbq09oNmo8hoqs+7fYuFsxQmFjxU=;
        b=AiGQCGYzw+m72q4Vz08BsR1KPD7/BsdBs04MY3EjSVVbd770bqCr5ceRdGRtFYkBXk
         pJdegYF62jHwo1C9i3NhOPOaTp5GXOpZ4q4mRCtmmmrcS2sfDKMMXtUqLbfNPw4IZ5FT
         wfzls4OPcekmyvCLFHmaSwADsV25CyXYMY8NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792273248; x=1792878048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKJj/9Wwtc4TG4Knbq09oNmo8hoqs+7fYuFsxQmFjxU=;
        b=1jbJQmdhAS36bD9bnhg4TeCYIFAqVYM2GVi43gtDhaU8uqx1dVUNROr2I7aTvKdxlh
         99+LN49rCuUApffDNmIygzUnSFbL5Kvq8zY3h00zEbwAAMcIXbSLNXqOo9lpJRmDkfWv
         JENyqqnkEK2UpKG5F2Up5E2g9Mj+aC2DXyDbzZeHAUUoR4UeGyd1mzyCX4CqXKg7IJHa
         47qZBwwP/wF6RqafbDggwX1Rj5CZjh7JL9G4/4jYs6J1Rg1xpEBy1KyBHhrQadOHQ5Qx
         fW1AVSvg108vryaGiTRn3Z4se05Skq7uCx6cKltR7K+xN0nlLIRkzVgTNxc7ZXWZeYMZ
         Iz2A==
X-Forwarded-Encrypted: i=1; AKwUvBw2ZvAYNxpyDzs2l+HnBKrh6Gs2LoFuE/iIm9Ex3p8gJEHMOmFknkIhq/YEtC0XTaZeriAgnOKheXQGhac=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv1lwEosICHDbuYMxwXdppiC/g7/Ze1Y1cbmHAanpJ0XSStjfs
	8Bj0zxlgN6S9V2iV2u7VbGnYC2nqzK7ftd/puuvUUeLjNioIhvbGO1TDW0L/C7rGTw==
X-Gm-Gg: AYBFou3t6vol+RteiPCNWK244EEnLL2Xs28sOu7C2THiGMgbjk45eUKGB2f3iJC5S+9
	Ebd+WodL8wLtfWaR3jJ2oyjTKt2L6PnyQ2cnCISyzPzyUC+XnKK9txDsUBK2Q4LKmKgRRI2Asjl
	0GnlmoBKEpObvau0LT0zHtsPJzXkFDEr/AQKJhItpWF/ms1Wt9H5P4g29KF76ciNwHaXX5/N2PB
	CMw0Lawy/1ChDE2sBh4CxvqWj2yjVDTvC/huhrMjGXRFIww4Our3v/y6wu7xjPYYLqWv8sOul5t
	i1W7bPbnFmi8evJJ09qIlb4A8tDN/qaqDoSAQEt3tTl3ohnBUteIkVvsYN/embclatsImvX4psE
	OyAQrTekEJDwEw2NzkEfKg2vP221HzMn7/zABE8TAq0iV55zE55qehGgiLZd4RYLBBg5WhVFyXN
	9zU76/iCopCCfJq9gnK64mHDWmU9XF0tSt4HepZ39d6fTCHNfr1uJDh2d0lLcgJ2gWPWcBtZTIz
	mSdn3ahqdiL4zmg1ym9zIyJX5cQ/jxIW1MO46f8/2c/J1v2dLKPTYvT9BBvsgAb8xh8cnFr0LO5
	sXDfwVNf2VcJtnPlIWs+XFKJWsP43g+ntBPx5TFPJKJ6mkY+bFUOiAWV+G4I3XiA9YWpfSaIDY8
	r8ODxCL4zfRPgu3cIfXj0uaXMvpnpV4ZKRL8ppN0C8kdKhMsVuWo=
X-Received: by 2002:a05:6820:4df8:b0:6f5:a844:b12 with SMTP id 006d021491bc7-70116e4a975mr3984515eaf.57.1792273248461;
        Sat, 17 Oct 2026 14:40:48 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.252.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12e06sm5109596a34.22.2026.10.17.14.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 14:40:47 -0700 (PDT)
Message-ID: <02feb114-960b-46e4-a126-9b8659fc4394@nilk.net>
Date: Sat, 17 Oct 2026 15:40:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: dw9719: power down on detection errors
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260913041828.28430-1-mhun512@gmail.com>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20260913041828.28430-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 13 Sep 2026 00:18:28 -0400, Myeonghun Pak wrote:
> Moving chip detection into dw9719_power_up() introduced direct returns
> after the regulator has been enabled. An INFO register read failure or
> an unrecognized ID bypasses the power-down path, while probe only
> cleans up the media entity and controls after a power-up error.

I found the same leak independently while adding DW9800W support for
the Surface Pro 9, and wrote the same change.

I tested both error paths on a Surface Pro 9 (DW9800W, ACPI, a 7.2.11
distro kernel with the linux-surface patches), forcing them with a
test-only hook: an unknown INFO id, and a failed INFO read. Without your
patch, each failed probe hit the WARN_ON(regulator->enable_count) in
_regulator_put(), reported as regulator_put() because it is inlined
there, and the (dummy) supply's num_users stayed one higher. With your
patch, neither happened. An equivalent change in my tree also runs fine
through the normal path, including runtime and system suspend.

Reviewed-by: Chris Simpson <chris@nilk.net>
Tested-by: Chris Simpson <chris@nilk.net>

The patch still applies cleanly to the media-committers next branch.

Thanks,
Chris

Made with AI assistance. Written by Claude Opus 5.5 (drafting), with
review by Claude Fable 5.1 and testing by Claude Opus 5.5, under the
direction of Chris Simpson <chris@nilk.net>, who reviewed and approved
it.
