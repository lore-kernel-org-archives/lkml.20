Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340882;
	b=vPlknfx2cMnmG+hvwCTG9A0CSdSiio0+WAXs7OfoxniOntxo1xQ3UVHofnlEyMh6nL+y
	 arXOw+td7JyPdRjxGTkHBmX6YXxJxdNMAVXcqsorV9fitP456ObTmdKKJ6eErLXGdHkGk
	 ZrFb8En299EBD87SbtDs5rRQrRWk+xVypZF7DtXVhTfTmGDg6qfYGjv4xwtyTyTivUnhy
	 a7JQ6ADoyydlNVNCHAqrP+JYrH3DYO14ilz3+gpyRVb4s44wTl4jEbb4r+ds0tbfwMCJk
	 rSw5NfKjrWPs9LHS/Y3oUYnA9Lt6qURynUCi8yINyLZSRj4ZTkibn6JgY0Ds772kqEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340882;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D9z0hUJMabcU8YBNpOYZdchyxPfKbVjxxRlkMtSmlg0=;
	b=N9tstoGR5J5a2/u1gHwCllG+74bNqTP297VnkO/BbU39vqqUOANpxkxyCN7Ygfo8YULN
	 ov32qT+mTehuz1ZzO5HIxWCRmIMC/36jhkg98MhYWpZATfO2nqGNfqcKv8MbAmcoz2MWx
	 teE6tjaTQXqMIDWWqyaUH2mKr2ZLaeYdp4kdXwEBHJtwi3HQpCCHoTNygInfS3VfB8ql1
	 dmstPgI925yB6pMMiJegawU/yFuUwmsmTOG3qRtpeP+aMXdWkJaLYYhLjYffRldn6oeBQ
	 NJdo/EbhYLTHzjrJUHykbV2bxq04C1MZO7ZM02iiQeRos1jNOHa0f+OvHncAc/ilu0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OzKn+XqP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A94606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OzKn+XqP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A811F0089F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794340881;
	bh=D9z0hUJMabcU8YBNpOYZdchyxPfKbVjxxRlkMtSmlg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OzKn+XqPRV92FvSgh7X5useqpv/drr9LaxR30eVR951fjBgEdDLvJAWk9ugstA2WC
	 O72uRQE43XNW9wtsRHxjR6Z4pIM3WAKJxF1z7ZnCQMd1GO6HP1oyUZCdeuj4j3Ua/I
	 7iKC+jfrEUQWD2vY4wuLZJ7UzIe/alwNvE/NreUEQoGN8oX3zplJl2dJQRfE69zv9e
	 n0DYdZYrMHbPTIwTCdqkik3bFHpt4Qs64Klj/Yc+UjBHbtdmMtmnm9ByyGUkLqRrwG
	 rTx8D7M6KrF4j0M2r0BoZpDb4FW86GRhWOw8LbrzV6Hb+X7ZRxN6n1XhVW8OSFyGlJ
	 EASdQyix8Uz6g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2497973e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:01:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEQdGC1JpKmpdZTwdHPcjxU45wmB1qFFAeCHajoJu0B4QC33D6XKlqxUfnQFGa/l/kCVK6hfqF/eiujbVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7zi69KQcN3q6tezV+ukjesmP/1r87GBgRTMIhFKXg79qrX05B
	UtSMtsNMnUEdVexCKGmmknGSEv1o/GysKDA6Sd63VIX8+WPTJs+yMFS3K/vEfwfjzPndaGoRRgh
	AQ3EQY4uobNpdwyalz3Vnm7YwseFkIVk=
X-Received: by 2002:ac2:5686:0:b0:5bf:b994:5f91 with SMTP id
 2adb3069b0e04-5c15d643ba1mr49174e87.15.1794340879856; Tue, 10 Nov 2026
 12:01:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106184008.1728-1-lirongqing@baidu.com>
In-Reply-To: <20261106184008.1728-1-lirongqing@baidu.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 21:01:07 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gHXCKvvHPXevx4U5WSVsS91Z3WuiMCwiYSQzQBEB5jNw@mail.gmail.com>
X-Gm-Features: AclHuK8yAa0We67mGYcCmtxqAz4cYCS5W1KgeKUgqW5tPPUQLUeK9Og0fALrKm4
Message-ID: <CAJZ5v0gHXCKvvHPXevx4U5WSVsS91Z3WuiMCwiYSQzQBEB5jNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] cpufreq: acpi-cpufreq: fix P-state index mismatch
 between perf->states[] and freq_table[]
To: lirongqing <lirongqing@baidu.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:40=E2=80=AFPM lirongqing <lirongqing@baidu.com> wr=
ote:
>
> From: Li RongQing <lirongqing@baidu.com>
>
> policy->freq_table is built by filtering out _PSS entries that are not
> lower in frequency than the previous one, and the original ACPI P-state
> index of each remaining entry is kept in freq_table[].driver_data.  The
> index spaces of perf->states[] and freq_table[] therefore differ, and
> mixing them up leads to the frequency of one P-state being attributed to
> another.
>
> Patch 1/2 is unchanged from v4 and fixes the cached frequency used by
> get_cur_freq_on_cpu() to detect a firmware frequency change behind the
> OS's back.
>
> Patch 2/2 is new in v5.  As Rafael pointed out, Sashiko observed that
> the extract_msr() fallback interferes with 1/2 and can render it
> ineffective: when the status read from the hardware matches no
> freq_table entry, extract_msr() returns freq_table[0].frequency instead
> of reporting the status as unknown.  If the OS is already at the P-state
> corresponding to freq_table[0], a firmware switch to a filtered-out
> P-state then compares equal to the cached frequency, data->resume is
> left clear and the next ->target() call does not rewrite the control
> register.  So 1/2 alone does not make the detection work in that case,
> and the two patches are posted together rather than separately as I had
> suggested earlier.
>
> v4: https://lkml.iu.edu/2609.1/07369.html
>
> Changes since v4:
>  - Drop "cpufreq: acpi-cpufreq: fix P-state index mismatch in
>    extract_io()", which has been applied.  This series is based on top
>    of it.
>  - Add 2/2 to stop extract_msr() from masking firmware P-state changes,
>    as reported by Sashiko, and note the dependency in 1/2's changelog.

So Sashiko has feedback on this one now:

https://sashiko.dev/#/message/20261106184008.1728-2-lirongqing%40baidu.com

>  - 1/2: no functional change; changelog extended to say that it fixes
>    only the cached side of the comparison, and a duplicate
>    Signed-off-by was removed.
>
> Li RongQing (2):
>   cpufreq: acpi-cpufreq: fix P-state index mismatch in
>     get_cur_freq_on_cpu()
>   cpufreq: acpi-cpufreq: don't mask firmware P-state changes
>
>  drivers/cpufreq/acpi-cpufreq.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> --
> 2.9.4
>
