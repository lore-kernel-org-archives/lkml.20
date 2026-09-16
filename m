Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6DC49B465
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580102; cv=none; b=d8Dlg//Bj8P10ln+GaxS2TciPzSenW5lqw3mvrAoHX08+cvYZDUYqbxAfGTxmYoFAP8Gbf7cHQ+oDheEghH9lRNs0CzCborGF2+nP/X0SjydHcwkj77ili4mwXv0No3uljvdK5vxr+Kj0elEWNI++FTrQIUS8R4RxTsqj30o7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580102; c=relaxed/simple;
	bh=Kmxozl0qKuXng/ZzxSp/PLsFMCZDIjd8TEUgFJcMZgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTOKt7EIUUCdEFEVoKxdBEDYBciP5i8moqRnretlRPzGp2WmKdmRoyvBaqd6Ue98KmfsAnhwTRJP+eB/DUfEY9Fgm99QFlg0qsTtPDcYA+bGy3qe9qtM6INYqh6Lb/DozwM71gX6sEqwgqgGDTf5UdBjTadijGg87iuEmORkhy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWZgoE8M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWZgoE8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D1F1F00893
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789580080;
	bh=Kmxozl0qKuXng/ZzxSp/PLsFMCZDIjd8TEUgFJcMZgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NWZgoE8MnS+5zuawTwxJ9hFmjkFzg+dKExWJBLVgU73GBRvSNqkjrCvUsNa4v1duI
	 hlXJxjzVzaUK9SPBV+DG6FgKP/cgE3vjmfPYxH34h6AtJS6Bf0TvqYLIt6QUvLda4m
	 NivcLpxIUMX0lW/FH8BU6DgH2RQ4HmqVAyyfCCGdLYNiPGiLWqxQX5WSfAAThgCIlo
	 XQt5YyNin3EV3w8NN+WjRPRYViud3QBy6BBoj1YDg9K0+mSF4+i4ASEv6MbrrHFWTK
	 LTdlSHdKozFMgTYhriZAsmcV4iorwqN++sS3w/kykIa6H0TyNQ4+YeWUBEOcAqLmWF
	 YffotFTkMxoBA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso1857135e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:34:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVzrAiP2+rGO+HLp5wFDAireM7SJvZLAuoejwE0oIIE8XSlRjIr2BS7NJpg9gL5IFi9cIKU/zE6dAKUqg=@vger.kernel.org
X-Gm-Message-State: AFuF++mYkLcYMzZBNoO7xx+YPD82VZr5gtZKs0NjV1ehU3YFJxQIidvi
	knSY6x9sGstD250oxsyzsGZfR6iiWYHG2ubYE1PpnMuGM1ehKEjFwrkRm+JOpv63FKpFlDVX+Ek
	a/9Bvk25tBd66bYib9fexdGM8JjSdlgU=
X-Received: by 2002:a05:6512:238a:b0:5b3:420:884d with SMTP id
 2adb3069b0e04-5b8b6615dd6mr1009628e87.18.1789580079608; Wed, 16 Sep 2026
 10:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916162949.2083791-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916162949.2083791-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:34:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLk9Pc9UM8ovJRFGe5fzjr2ci=yTQmp+RXTsugW+qiPsEQ@mail.gmail.com>
X-Gm-Features: AcwNN1WrGklsU7RbsJ6ysUI41c2hLLzkBaXx_VRIeVKzN0WXlEhxnMgj-5D6nCU
Message-ID: <CAD++jLk9Pc9UM8ovJRFGe5fzjr2ci=yTQmp+RXTsugW+qiPsEQ@mail.gmail.com>
Subject: Re: [PATCH] iio: gyro: mpu3050: Fix runtime PM leak in mpu3050_drdy_trigger_set_state()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:30=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> The enable path of the trigger state callback called
> pm_runtime_get_sync() and returned early on every following register
> access failure without releasing the runtime PM reference, leaving
> the device powered permanently. Use pm_runtime_resume_and_get() to
> propagate resume errors without bumping the usage count, and release
> the reference on all error paths before returning.
>
> Fixes: 3904b28efb2c ("iio: gyro: Add driver for the MPU-3050 gyroscope")
> Cc: stable@vger.kernel.org

No stable material.

> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
