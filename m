Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7C28150F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987266; cv=none; b=ugiChZXjN7lDvYE/yEnuPB9F6u0l4jfgDwS+5LlXwWns5VAiJjanlQq6O7t+ky1yWHSdRn+dfTsKkdpE+kqAYCavn+kmdvJC8eO5a70Lt9K+1nosAdcgSlF0SpC2q2gerSswMB1o7Bxb2hEf6DRUmu/52IvInggpycIQ5hc8IdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987266; c=relaxed/simple;
	bh=/GXn4dQlSTFYkZKQfZ2Pd9kQ8BIokZtO0D7dCrKHVB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxkG4w4XQIPZNTzVwXl5lJMUx3gfPCs8liuNnEPdd5CrfAYfBk5F2dRyFakpWahEd+YTqDUIc7R6oXNEfpn1+Mo/WsmRyqkyM3DVCUEl/hzNYwAFSwGk5sN90yzfQN7CDpld95UHS+83IxxH5QdZKZ+NPTN5XKGz63fMpuZYao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z9LDNVPb; arc=none smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z9LDNVPb"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so4616a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790987260; x=1791592060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CyHDFt4DMiCfxal6/XACZnlAIAoB/klZYpEIKNjeAu0=;
        b=Z9LDNVPbPYO6r6Bj9NcGj0IVwuhawZ2L+2ZncKvJTL6yoFjzf3VnJphPKxpXIbsNA1
         wHOTru0FfMT88OJk1ZPqDUVg3IB6q7Mpu5vQ50VEoefVM2bobYCoaueWI3Yjzm16pj0N
         LicDP38WQpJM4KZe7GZP334Hd+9ZLFOmZiTHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987260; x=1791592060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyHDFt4DMiCfxal6/XACZnlAIAoB/klZYpEIKNjeAu0=;
        b=TYepnJ5k168lq2Y32+zLVdX6P11fho1+ql7jazyionaEmhCXpSufJoFHoJ7NFMQSJK
         /xQ9Wc8F0K45GMdu8WaZWoKBFVTPt9XU0uMLHt7G0dMzhtge0ZIPujYPK6KCQ8wzkIgL
         mp7kczymRopVFfXNK27xyUf1jnYGdDprxRq/C03uMIU471H/vHTUyHKP5v0uhb1iK/QN
         e2GEZt26NYACXHPSm0mJavr2Ym88vsSjeTHX/LoiizaqOzVi5Y825hLI5UmnSFsDWB3j
         4LLTt9DghwRFNP+XUxteDQRBtPJVuPFaV4NymDZWwvrxyrw+29snjYbgJ4AUU04U4/Zb
         9oAQ==
X-Forwarded-Encrypted: i=1; AKwUvByziU1G99Y3fX1ywFzwFmHNeXgcEEIfliCV2exRoczD/1qR4YQAy2rli3nzZ3C8QBHKUG++8B0QYZnPgXY=@vger.kernel.org
X-Gm-Message-State: AFuF++mgJEHptoBtJaHVd2oP/LCU6kRJKAOYmbyvX9NWtySw33oF3v2L
	GAKZ6owjyCF3hhTbJ42n3zUOAASC+RAaLz1Pg0V1xFcUkg7By8fEPUWQ3bvHT7lNyiEk39m11bP
	vdjs=
X-Gm-Gg: AYBFou0GT6egZFPCav/BnwyfE3M04onNdylNwDf50h91aGgeg683/wxIYtStoRyBPr1
	rizrftDI8wbvFcIzUEQmNL3HpSZ0dpoVNGK+jI1MqVaWgumVSUUN6V7Xp4/77EhGt6MZYuVC/nu
	ki6xVtp/QhKcyAF39NGuFtEJr419zI2Wo/XG+UHyDwQQXLtWElXTYwPrCFQYbVFvlSHUx23omvS
	3q9Y0oiSyA8tLzDgSy6dpBZftLXW0xpI27eTMjRPoCWuyc8LxTN5KRqj3RoSpiEjg97PoxuyprM
	myM+fLm2trPWa0UackGzpkLpjYdDs4drXnHivAFFtky1pDodkH75SQPIAEZgABoHOgb55n+sxKw
	p07r5BnDce+q86BbR1B8m9W2uJMZqUCXXJMuYjuP+rw+AXrSiuMslIt/u/ApXhvrDL4K8wXi5mr
	bUOapOwfanOpcanK3N45FKlcay8ezvTtGYKm8f5Qi5ioRKyqijNhZDXAaCvHVkTh+KnjFYvmLCR
	k3eF8tofoXlZIdt49TaWuNWWlLuwhux6PSS6g==
X-Received: by 2002:a17:907:1888:b0:c2e:4742:4c91 with SMTP id a640c23a62f3a-c2e4ae35f2amr335676166b.35.1790987259762;
        Fri, 02 Oct 2026 17:27:39 -0700 (PDT)
Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com. [74.125.225.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd05f64sm141947266b.22.2026.10.02.17.27.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 17:27:39 -0700 (PDT)
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so3161f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypDlK0pAj4dzu32v5DCiyPkogDLaK4KlyXEEvTYvWoyC4uD9ZxY8g7Hw+JCnK5SkKo7x6C4UboQarXOa8=@vger.kernel.org
X-Received: by 2002:a05:6000:240e:b0:48c:455b:6625 with SMTP id
 ffacd0b85a97d-48c455b66e9mr3660895f8f.19.1790987255739; Fri, 02 Oct 2026
 17:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929184729.2346769-1-briannorris@chromium.org> <20260929114714.2.Id0a3276d23d30e0b5fd4d6dca730be0f9d8fe018@changeid>
In-Reply-To: <20260929114714.2.Id0a3276d23d30e0b5fd4d6dca730be0f9d8fe018@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Oct 2026 17:27:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPohx1seYHdw0Mi=5xh8XCWvh23ie03+ePXQgTixGzOw@mail.gmail.com>
X-Gm-Features: AclHuK8j_7wUYw2uhi7CBehoDliA72XQiK-9p0LnmY5FpnefuRpK2XROhBPZAS0
Message-ID: <CAD=FV=WPohx1seYHdw0Mi=5xh8XCWvh23ie03+ePXQgTixGzOw@mail.gmail.com>
Subject: Re: [PATCH 2/5] PM: runtime: Avoid racy clock checks for autosuspend-retry
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 11:47=E2=80=AFAM Brian Norris <briannorris@chromium=
.org> wrote:
>
> @@ -242,7 +242,12 @@ static inline bool pm_runtime_has_no_callbacks(struc=
t device *dev)
>   */
>  static inline void pm_runtime_mark_last_busy(struct device *dev)
>  {
> -       WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
> +       u64 now =3D ktime_get_mono_fast_ns();
> +
> +       if (now =3D=3D READ_ONCE(dev->power.last_busy))
> +               now++;
> +
> +       WRITE_ONCE(dev->power.last_busy, now);

While we definitely want to fix the problem identified in this patch,
the proposed logic doesn't sit right with me. Let's say that
'power.last_busy" starts out as a given value, let's say "1020". Now,
while the clock hasn't ticked you call pm_runtime_mark_last_busy(). It
detects that 1020 =3D=3D 1020 so it sets the time to 1021 so it's
different. Now you call pm_runtime_mark_last_busy() again when the
clock hasn't ticked. Now 1020 !=3D 1021, so it goes back to 1020. This
could cause the whole heuristic to fail, can't it?

Maybe I'm just worrying about something that can't happen, but the
logic still seems odd.

It felt to me like we could just have a "bool". We set it to false
before we call runtime_suspend() and we check it after
runtime_suspend() returns. If the bool is set then we know they called
pm_runtime_mark_last_busy(). There shouldn't even be any weird
problems with weakly ordered memory since this boolean should always
be cleared, set, and checked in the same thread, right?

-Doug
