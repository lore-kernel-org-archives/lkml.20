Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5317397E85
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466685; cv=none; b=KgZNKZusC9Uj6HcFhX5VC9OkEakvQ7fooShyd7peHJohe0TCuclk0QuVPIGAZyWF1blMEGKtLE5sCLUEpeZvS9ViZlMy4Xqs+7RwTm+orKejKpoKPmRgEGP2/rneO8HKTm04Iump7uQm3/nf7eU9Z+D39lf+z/xhfLHEUyR9B1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466685; c=relaxed/simple;
	bh=eGS9ZAELcTkTuNTgyKM0hpB2EjXGms+wAcOSiSmEqTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtjwTe5MvJO7yR69m60/5xxIA24jzaifH/+SUixrcmLlDuhCMw6ZBtjYPUijTI1ZuAtIzGXqr/jafRCEyl0awvsa8FT+u8fIQ/TBfvdEo6YlbuuTueNC5axKll/EW+azIuXm6nJEYo/jJ9x6JUjPaXUnTPZbR4dTv5hHGm52zNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RUcrgGR5; arc=none smtp.client-ip=91.218.175.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RUcrgGR5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eGS9ZAELcTkTuNTgyKM0hpB2EjXGms+wAcOSiSmEqTU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789466680; v=1; x=1790071480;
 b=RUcrgGR5/w7lDRvia7/zzut2KnW5AR2QO+VucAT7YrxEz86l2Refpz2PGrE3CNMxSsL39tjO
 wMr2vLZP8ortLPbC0Xlznx8tBsJhwUGnvjghV9sbQB8cT9RblzfpN79LA3rwCbw+Lp2lZWxIWSa
 +eS7Z18TCYDwTEJ0EYx6z6SQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9f2fa1e2b7fe676f;
	Tue, 15 Sep 2026 10:04:40 +0000
X-Mizu-Trace-ID: 9f2fa1e2b7fe676f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so3757e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:04:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaYMMJUNmpVBuM2Iv+wIQM+acw2z1JqNlnTM+RNCv+NK6FqhSLilg52cn2quknH9QTZ/OqoPddZjzIUow=@vger.kernel.org
X-Gm-Message-State: AFuF++lUdOl2KSI563eX5cooMmEAUqSWQaV49u7t/wAVYie26GqvI3k2
	SVP17LL3ovDdN6vUkSsRFfs0idbsiS2WdMaO5+h3QkDgg+fBeE+XfiTemEfI+Qs15ONYXMMbDVI
	hkmTmEqsRjcoxNGzViPYCHEClHpVSuXvhbgUoSb+C
X-Received: by 2002:a05:6512:2251:b0:5b6:bcb:26c4 with SMTP id
 2adb3069b0e04-5b8b2d57c88mr125735e87.16.1789466675623; Tue, 15 Sep 2026
 03:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-2-fuad.tabba@linux.dev> <aqj1GKamuBraiub0@google.com>
In-Reply-To: <aqj1GKamuBraiub0@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 11:03:59 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxujn0EwJM49FaAuXjbyTWmvgzk89orO+8WLSn63u8WtQ@mail.gmail.com>
X-Gm-Features: AcwNN1VTCK-3nqI9-Q-RK2JyK41FQVwFdhMt-rabRiLORS8vzlwPjlPh4CVwNWw
Message-ID: <CA+EHjTxujn0EwJM49FaAuXjbyTWmvgzk89orO+8WLSn63u8WtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Validate the host vCPU's VM before
 reading it under pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 08:34, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> Beside those nits:
>
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Nits addressed, and I'll respin this as part of a consolidated series,
as requested by Marc.

Thanks for the review!
/fuad

> --
> Vincent
