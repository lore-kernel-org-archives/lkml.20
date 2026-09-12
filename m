Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7859A47ACFB
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216571; cv=pass; b=NIz56qe/sTkyCmn1yjdl9K8Pvfk3umJ2O6aVYCag2wjjLQfy3Sv+x8iGYyAjE8QIYOXOA7goPsvHSuTUOuJG4lQUzblRCJHycjomuApOcWaZty2VpzNynAOANYfabRaZ5B7/KRsyl2WO8Py6RxbpTbOWDk1MnqImuXZLtpS6Oa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216571; c=relaxed/simple;
	bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1zpPShlwx1rxgbPy51f85RLYPsSBe14cRRbd6OT2s5kPGCKHNERTU0XXEnzq2He7zevENKlliXFhr8P6pilZbAvhm3TKrhLhi/YfnKSbD0FRfk5deKfLfvE13Ulg0p7wn7f0M9qLNxStuvUabjR6GlEZA9MiFsvUXXu6Vu8cAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4NATHYS; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4NATHYS"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so62713666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789216564; cv=none;
        d=google.com; s=arc-20260327;
        b=gTyvxxBsCo4GuEY9tOibLmCQfUQOoxLdvzlbOmxN7weoJzWszzU9Dup7+Fr2ajZnQ+
         bfHynzuum7oFuHWwx4HZLQ6Vmt9AxkOGRL2JEV+bWPE49bcOFlxWNbPZu8gPrHxzLCuj
         6H4XZ0ACqPUucFMXhu60zC68fmo5IrugL4sY090k/yJEOZ6RVw4A+Qc0gIe7+H5zFs3M
         0mbNHDWrY8XwMxCbPAFBkr3Sa/mgS7ZWeiJ/Oyir2YRV79I6FROd++kfhMYrieAYUTfX
         gL1vp3RmneBTfUHDPbmbK/i8dq/Yu6l3/+Qd060Csx6DXMpwURqJivBhEFfp05YElFPe
         iQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        fh=ZgwGyxTIqIrrQxlwo1Q036LjppR0tHiRs8od9nZTgHI=;
        b=ODLxtHiwntcYh1IolVoIbxIrd4Du5PHvhZRFkhNEeN4Tgb5h3RUCSZRJdrG1oYFaZa
         1ZB3e0baFR+Iku2zaFXOgrCgHt1n2b6RY6EObZgto6blfGYKMNPaRb3Xxua2PVaGCec9
         UzgNV3QNw/ANIxN9yK0Vsmo4Cfe8hi9elQxpiiaZGdKjZullWmM61Sf5cvCNFPwLzRmf
         YqE1pGfWSn+GtE9NaIHFS52UM0RvCnRyJX2WpZuTLEbfgTuuuS/JBSO7mGX/xxqkNYo0
         DJiyOe3uGWdVJcLfmHDXge1UnaOjm9hmWitKiP1YqDsqnygHwyq+whUl1IP0U2OCbnsG
         r51Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216564; x=1789821364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        b=a4NATHYSu//gdtNfe8FJbiv4fpczmOX44N1TyS4O9HqKmJ4yPpfJwQ84ysnciiYHQa
         b+rqtlFe6za6BkBOjPwqDvvO7tnu3J8TbIupWyp2+uUtE6hqfiu755THqyVzUQDC79jU
         eYdXJuoglYZ7uY9KgxwvtU5WpUeCrUZWBfLpp5jjyppJO6ohRBP6wdeum74lggsKnC8z
         OvCxrVsQovikCteZtzVWnvsQ+JnkqWjTve8jeCYU0BT/ivbI4S/0b3dNNiUtfd0+7EnT
         ExpGwleMu+vltTOpj5UasIJWE+hcgFpzN96unOpI2+GFKHxfZJ7M+QZCYARFgRcGUtIP
         mJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216564; x=1789821364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wzrmrXSiNtcEbUTxdhNXsdD1Se34/pbE2Qw6kqxUyg=;
        b=lxkFMobieoVHXgqNkf0fFvT5f2rmuFvmOfVdFS1Uf2tqbjJGC2J4k4org4/pLVQngB
         Zvea777KBUbUwihxvdAzXihkgLyRdBr6InFMwk6nllC9MQyVru5hYyjmwfkb+0n0YleQ
         qEVdzjNfS7VbwvfjQxZc0/Bd/uqKYQr+POhmeG4S/KAOYWlPNxOcoJssnBfJTtggnOs7
         Uhz9rQkBVyE11Hf8Pz7WHlCdQLUnEuZE1t9ICxeETyy0iGslxQFJueLEHvhiCcXN6fIE
         X3D2m898Vhc0z70JmlpOj15IK0YxAvblQnm60EcidFnOl0jZUhp71DKvy8hUwVHLMIh4
         lgxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIj6zsceqmuA2pf6skGdXYn4fnJJjr8+wNY4YyOKvhfHWWt3XJOf2oUv7UxKaSUCQ/QdwnJqlT67DfcGE=@vger.kernel.org
X-Gm-Message-State: AFuF++nej/iapnOqXBdoK5nEkIpPfTFB36PWUSBwR0ima5+RePeI3kQJ
	mRbsxq6whhIHf65ZuxQKW4OkV1eqsR2xPlIwYyNufKx7YJkWB9Z/G5mAwe+bma46HNdS7eHMuHU
	XoxAGTLphxLLPJC6tY3Uc9djofvtpgP4=
X-Gm-Gg: AYBFou1uY4uYz5nv+NpzIdhLTtaN2C886KchIMLPQFwo+4H3Sk7c1p3a1afApNSzCJB
	qv/ScFENkX39ZFgQTN2JhnAsHfhjvecMZ3nh+jRp1b5lCypEgDQgncyvNWC8iooS7BCrfOIGMOD
	5x4NucU78QMJygVSPCmcWsEOlLBkooCVO66YlRnOHVYkaD72LnbgnO3T6YarnI8+BfuNJLzbMQq
	lKddfIrNxKX+lHn7aGo0LHy9yT4Efm3iMjGJT26mkCPynFybsXkkBz6T0AUE6Pa1iNBJaeIsj7/
	9Q9LHtnRU6HHr5lX1LzDOsEyJ4Bg4ApwkrA+XrE6Egmf+XgxsjWiMt1Yu8cDIIxShhOfUI+Xzig
	wGEv/8AszDhl2jqhmNiJrhflp6IkzLZeSW4QCXnW3jrWHG0P0ha8kmSQVyuH1owbARCKFkrEZmz
	L5EuVmk1b4QY5ck9qEFYMLZlF0VElQUJIXQL7E7JRU
X-Received: by 2002:a17:907:1c0f:b0:c29:367b:b7ba with SMTP id
 a640c23a62f3a-c29858bb1cbmr152369766b.34.1789216563540; Sat, 12 Sep 2026
 05:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
In-Reply-To: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 15:35:26 +0300
X-Gm-Features: AcwNN1UYah4FBpIaWcKb4z1tHoJBx3miuF5_P4HDrhgh_59ZX4pBct8dP13O8rk
Message-ID: <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
<ricardobarbosamscg@gmail.com> wrote:
>
> Remove an unnecessary extra blank line to clean up code style
> and fix checkpatch CHECK warning.

This is the lowest possible priority patch, if even considered. If you
want to clean up this driver, there are more interesting tasks.

--=20
With Best Regards,
Andy Shevchenko
