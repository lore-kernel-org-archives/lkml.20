Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952E47426E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191526; cv=pass; b=huupKmnDak4AsVS347WT16ewkfZMvaF5oKDBR++0NUfhfl53wsgsnMNHroF3XURvpnfgs6MbfEhbSIAF/E2rii2480hwDcuIlYot+PtiyTKbt1vY+n9dGNEOCGb0mkcdC9n4JUx15/ep+9Os2iy6zkkb4sTeBpLzX5c2e4A3f8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191526; c=relaxed/simple;
	bh=yIMH67iFY/zDCqJa0/kWLUzmpSflEFAoQKZH6A3GiNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjB/Xv/0ykPj6LAgyXuE17xvSdXz9flMx0vbJ2J8CWSVpCOmyGpP4PGU/ZLM85gzWp4VHo4fVpy4jZs9hy16tNBiOu4hjf1bdErfstIlU29x5QDW0bCEaTwG6kgsKUeaVPyzU9m6NanJwY+zbABBelZphCL31aZKBJE4M0pt0jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY8a6GUf; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY8a6GUf"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b128dd0cb1so1052141eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788191523; cv=none;
        d=google.com; s=arc-20260327;
        b=YTo/6idUv+oIHxZw1CPWSfsujTxvcsAK85/slawqSfWubwtlGLESlRuwNvO6jWOsgF
         rEtyLYKqOQgiJAzrfxq7fvPDhyfVi5qm2LrTxuAD6nJLxSk4SvfYaQ7WQM7Zpdek70he
         OM5MchvjuS9hez4ueobrxQv3wutPuGTieNb5W4MVOCK5jyv2AvxCVUaKWWVJN0OIXPlg
         jcTml2zDb20xmLL2S7Pk/LhmDSA2lWR3gZIbrReMM33sOePgapRSxt/iFGs0bAJSTGk3
         A+oNlK2KcbrL94bHfD/XHPwl7GS+oAweJZ55D/uJ2x+MtTxaK15zG0nrMSQXnBMlXyPc
         wN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        fh=QJ+ADE7ML8Q1HKMD1uSgD8K06ThW7Ixx4Jg62unpDMI=;
        b=azRfbOK5zT2qyLS7rZGQ4wY7fsbJTZfnfjrS6WBFJMukuQ0fr0W8qO3MWt+tlx7Pql
         DHByODBLSTQRKWoTWIYLJ8ZazHWcq7g4ur/LtSHv3IeUehXeYKjUeS1OMZ25HoAkg/+b
         9BfbYFSOwzNKYnL4wnOIcmjsBUGOiQuXNKNc4oKf7Q4o6c/PXZybuGN3dX8h13bbVOVU
         RRMvyqK+Y6fmAecdABChgKQME0AoSFqLQaP//RFaBfCP94OrChm47nxa0Z17UqjGy6Ul
         1znhcZnAPiMv89I++jmDxLpVjLajbZ53tCsUGYJeQx0J40Hygy/qyewn/nZER9Gb5UUV
         5xGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191523; x=1788796323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        b=LY8a6GUfSW1WuFwgiGseITvQUyDv8nqvd9hLvP0fLzH0DI4shTBICIQ9YsUow0bfUE
         mreHwf1uGsittObwK++MrBy+qpEdTTaZDx6znpbNsW0/wcKsnfUx8xBg0LFJN8JwzqaK
         6NzE6uCNTIClKSkWqLDsZ+QMyIHQnX74YsZJ2SzP7z7NBvuzeqLFGMucTApIYR14nYFc
         frlC7RegaEBS+0jutVcp4eYSmVTGaVO2EuQB3lXFeGeSTxASHKH8OYSTJayVxJWSR2MU
         KH+gvr7m97b7j1cGJ6euZwddyGeJrjOPE6j5zkAWJx+inu3Uk+wBw3VHY21ccT1E5vcP
         OArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191523; x=1788796323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gv8LTcghy3tRcsgV2tnBunUotldPm+945vyb/VPcFy4=;
        b=rTYjsF+daLj/Kg+dfNyNFes0NeYIfSz1Ll+WT7e3UBTWBt+UDoFonzgj6vQTBgA32M
         jKv2Lw5KNi8IcYUSNCK7Ydju4WcriaHRZcUQ5GC0tfe4EFrV02BTlQI/LKgCwb1qNh/u
         BiBvtP4QVArrhFfeu6qRIc31hjMx3eTXLsj2ZfaXXg41WbalfmLY+vBXd1eMN6jeYm/C
         0PQ3ylLmQrbpS0j3Udjqye2UK0dzQIri3/o8+yVYjv7m8TQW6os/5ll1fGGedCOERDvA
         HOtsrtMzavZFGERXpNEK1my5Ctht1M1ngGk8sFeXpe7PkMJjc3NlAeH0jwulALvnR28f
         6FiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLwnH8CoDMxEiTIa3drFx5bB552bfTtJ97LYPcny0wL9E0rq5hRCwjXsYi1QRdybfXrdaB7BuENfyi3G4=@vger.kernel.org
X-Gm-Message-State: AFuF++n0AM0NJfGI5Y5nuDTucImF2OJaBKLfvGKkIR96tm2K0z4puoOx
	+pHvN0z7P3s7URm/DuVnlYxGDONANRZpTTX7ewxOwiD478R5O1HKdNg4NSImFt4hjYd9gx/LJbh
	WbaHMS54E/S2BzZAcyZy2TLRp931Q8FE=
X-Gm-Gg: AR+sD129HODDt75xWZFmJ0RYNXpzwTvzOXqQ/ZOOHUY2RaIUH1Nqhyv8rHgaE00b6hc
	ym6BZnvzs7JuQzx24MFu+ioEmfeG8OJVk7Z0HKCrnf6C9D0S/wgX6vItZ0u+EM2Hod18tRH3o4y
	olnjN4yBdd5gDrxmxCKtJ3bm5uGYA4bZvuUcbURnFtV+rI4XEJLGMU/AV4GSxjoWiHmU1XEjV0p
	UAuG0gwuLiqqCMI+TWxEgZyg6wboz/lGjq7OrkQ/U0Zm0Yr6A9+nm4y+kF0m10w96NmUyunsvx3
	1og59/yIQN7x9jfNw9Zo1M+MR1Vl0YDrNiIL0rSKdnpy1Am6u2IxDYZkxeRWziRu9Iy3LPf2/By
	F
X-Received: by 2002:a4a:d1f9:0:b0:6b1:a667:f0f5 with SMTP id
 006d021491bc7-6b1c673c239mr19248427eaf.20.1788191523257; Mon, 31 Aug 2026
 08:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
 <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
In-Reply-To: <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 31 Aug 2026 16:51:26 +0100
X-Gm-Features: AcwNN1VVfkTEW1Bwp9Kuf4cVK9-fWlNN-1KBCKmFxG5U1PmIDQuPO0voL3CHcBo
Message-ID: <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 08:13, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> Let's order the pin nodes by their gpio number
>
> otherwise:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

(Resending as plain text, apologies)

Thank you Konrad - how about the gpio-keys { } section, should we
re-order them to:

key-vol-up   { pm8550 6 }
key-vol-down { pm8850 8 }
switch-lid   { tlmm 2 }

Cheers,
Dale
