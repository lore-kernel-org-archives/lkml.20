Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB4243900F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447523; cv=pass; b=k37YFTZACohOau4WofdipuG+JjB9EmpaOWUUEPzSl8rJjOR358SMI8ZUWQuEy7262z01tQmWQI+nKOwtcLVryQZnI8uOrTcWB/1U+SZsP/B0FPRKMqG2Fow2/KTIvvDK/sXnPR5fs0XaQmrjFzX9eU+zIpyYJB+eNa5Jxr+rLdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447523; c=relaxed/simple;
	bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIKlblm7dPP26ysTuLGmpErcK7NTdp2Stk9kIESwZn9N13iyynZBCVIuX+6H5Flw++Mx2eG+Pogf/SrTgPNfe6NP+G60BEx4sbnncRMXPAmL1a4KTaA8ZLbLT9e9A0gnwuQ8V6VdPS1x9t0DQweIdSl5hhT3WnIHZiNhI71h2Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmCAew7o; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmCAew7o"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so465142366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447520; cv=none;
        d=google.com; s=arc-20260327;
        b=T53RYlbDQ3HWvRaCNQK3fZaTEsJNFqM+A9oTwFhZD9YhpBepYmfGo9TAaDanEDQLdc
         /6QfrXBE4pc/ua94auejctrSWYL+CfLMGrYVje2njDFDG7LLRyyj37ZLcOjKPu1BODeA
         2yQHiFFerH2k1cAXYJXaN0wdIaMhaftYTAb5vwQOlKDpd02XsVeHjPrvtYssQs/UPgTm
         zt2o+j27dSGyQ2fS96UFiDfODoqCktUEcLTmeUgo3k7IxuTSjgo5FCvtOkgLoQFTEUGw
         PNh3BxLbfvEFx7TuUOpbRrVC8intJRSXo08ctxnvECKYoW1jJogkWUL5p0aaYe6NG3nb
         V5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        fh=YF6oqkaoOeERl0Q/AGrYDRL/GnMpGpQi9h8TxY3lNXU=;
        b=IzGLj3KLrOs8b3sRJHkKnrD9ikD2opkwQV/ZawmNPVybEJv8NSR7aNafksKuEBRiTk
         YX+VRRcAeUPmAPocFarekSD8uHCG90ZCKPaWepWpRrA64hVTqITxsup1xIWI7GqTsoTf
         OelYk+lUZtTqIziofmJDde5bcJbExEp89gYwv5yVQvbNoyKxjktpdVSby1tVCdNIiV4v
         lxrShWP6JZJd4FjPqfN+JHumG6LIXPLgLQFML8Z/H1xWeQyZDu4U/i9U6KXgP9nO14gi
         qSCWN0cwgGJ064BzI1Y7HQdCoZHN37Gj+wkguB9tN/m38lpcHCDrly+v04O5G3S4eJM+
         bBHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447520; x=1790052320; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        b=CmCAew7oGSIiROxNY4a4SIyUoXgYoX64btMSKyEAlSAD1OWObKj3xwLX/lEEpSrg/Q
         A0OUZ/Cu/2gvLy1i4OGAPEeuBjSTS8qYGQ80vO8P3btG0ZjmrI3OBf3bD8c85WkWTIkn
         owXGWJcUfYJ2VmHEUZd3FkEnw2yLdXi1gs26PJgrqoq1I9JYqO0Hmc1AV21zyuvNT1gQ
         bwrWTyPvE7LVw+4YZ+3MhHHC48G2vA+09ePw6XMZEmdArvrVjqDHvV+qUL/nBx4oC2XU
         Sg+0rx5P2WMVVcASS8hWRR8934LZGLlN+iq9W0qD1t6XWV/BoBPfx8gTujCCTTEdTGv4
         C8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447520; x=1790052320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1fCyBztB56Mbm6pG1VzHl6tMEqvrCbAMMCDlWGNMGAw=;
        b=BtjiKTOLYyeyp5sgx6IFhtJAP90GFme/Ysch/6DttrOm7ZfIbnU5Xed62fAxgLv8fK
         JTgXeEKFL+cjFUEx/rx+M+ak0O++a3J+FSrOup9vakkraYJHP4QNKIrMisHlkfAGnycn
         SpLLftByZy0DeWkWiyZR7jBfrfK3QiNfS652pRmMO0jM9SSCWW/O6Rde7Igj5at+XvlS
         uNgv2/lGPLS+s+V5tDSxqHFuxgP3n+01Jo+KzIG1kmoPq9nwE9kdMSV3ZBYjLEBZrJHl
         4JPLfNcrznaZO2AvF/wZBMMe0kEeMKd8csQ7GWhaucwn7gVJYz/8XXPPrwElFbkayIP8
         QRng==
X-Forwarded-Encrypted: i=1; AKwUvBzM+ahgOVxejiMVDLePjWWBmghuQmBAdppWlctIIL2a74lah+8Wyenhev1QZ7gkrHz/h48155eIqydoC20=@vger.kernel.org
X-Gm-Message-State: AFuF++mIk/myclnMjEPw0KDxIJvAbStio8oBG23b5qq++fU4rc/FXKfq
	xNEEf0msmZ7mM+qRGYZ6dSNAdq00jjK5ohAZY+0XoUDQnpS1wKMG6mo97A4s3DX5tMn11GiVIyx
	XqLYIZsXJEW8QVKkyT/DoBUsJ0OewL4c=
X-Gm-Gg: AYBFou3NymQb7lUIQm8Z7twsKLz1W/YsQ5AOCQsF/BoElpj1+n9GBvlGZzGEx/1OR+t
	gsyuQ503i22UPW7OgFhAE9LyvrOjgA+WOh9n5xQMCYmPhhLRU18e71rBPINRk1mUxGWeO4KOONu
	MTi4RpjKhQDaR6JbeSf1wQGLEWPtcvS4RMiCdahdwxGXdiBv2VUmAw70TIWNTdB3Sa1uV0MroWD
	ufwa0SN3fWYZBgEhKQ5hi+yxKwD6iCCqFVmEN4VAZYmiExclGctK8Xu7J4bJtaUfijwiDFjh+VZ
	S/o88GeW65K53ha29+Zz8UGR41Bmc8jgJXzaG/zj9Y5RAPeft3692Q==
X-Received: by 2002:a17:907:7b85:b0:c26:36c4:858e with SMTP id
 a640c23a62f3a-c29b8726f8fmr326120966b.25.1789447519950; Mon, 14 Sep 2026
 21:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-4-linux.amoon@gmail.com>
 <a835cdf1-b0b5-4719-8b5e-226fee78b856@kernel.org>
In-Reply-To: <a835cdf1-b0b5-4719-8b5e-226fee78b856@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:15:03 +0530
X-Gm-Features: AcwNN1X6uQRHhT6qwboNgDZri63s8FVYRlQvpJVAgezJWpeLkP8LX7XyBkGQ7dE
Message-ID: <CANAwSgRETNrPmwGvv2z8Q8EF--W19u6iB1goNZHUzKp64s3_Fg@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] thermal/drivers/exynos: Handle optional triminfo
 clock correctly
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > The triminfo clock is obtained using devm_clk_get_optional_prepared(),
>
> No, it is not. It is devm_clk_get().
>
The data->clk_sec checks were changed to handle the NULL return
 from devm_clk_get_optional_prepared() its only used by Exynos5420.
> Order your patches correctly or do not introduce bugs in patch #1 which
> you then fixup in next patch.
>
I will reorder / fix the series so that the clock API conversion and
the error NULL
handling are introduced together.
>
> Best regards,
> Krzysztof
Thanks
-Anand
