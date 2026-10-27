Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793128790;
	b=1od63rFU7eoxCtNb6poyCJuShSQZfbngtuh/U8qAIWNK2iJMSD7gEoUbllMt8uIrm9jq
	 ef9kmYj5WEJsGa9q/LsHJ1c292OcWO4iX2Lrk8E0nBDWzoJISWBWdNGaWZt4tU36HS4BA
	 BLN3tanv1wPwePZwLqiji0p43MeMdtOEWaIO7SO3ZWsDbTeIBbjaTG9IsgB1oI4aZ6VPz
	 0g4oTtLIyvOnvKEWecYbZw+bmhXwBZDC/jRPMjuF262ZsC1L66d5HGIk5JhAX6uG/P3Ud
	 pLHrKxiwHl3AFXQs88juE3wX3ER3zDsrD2CphgjJNyu7rtI2lx/hLPvvB68wkBjVbMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
	b=QmNsoW0hD6t+qB1B19hmjaD95jaeYsf47STEX9lDy7oPpl/TaTUfmmC1LWcjQ9Sk5RHe
	 0QbimH+r9gS2sDNWMcQYp6xK6jOjy15tvptBXbluOHBtNUUSnROYVhAyDho9IUOEntekL
	 NSjgbN9m7xxhPNRWJQHgGeANudCUWbXYbAFfmkJMrIdTuuUXxRNP8GL3raXyh1YfdMLCr
	 CFUpQVzPkaItcw/XERsGomPQaBLbD5FJRG4W1wSrQ5UvA+9arGm1IgvB+afvN0JjHCUJu
	 PjsIbmUggHAfH6Gryqtc1jIe5z+WqaAGkzNsqbtqGSeCw7EviR+AjWKrqHYCX0sjdMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7OWrcee;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FA4606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79FA4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7OWrcee
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679965fb848so265781d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793128789; cv=none;
        d=google.com; s=arc-20260327;
        b=QqxC/W7LZFpSRbBfrbwEauNEtJg9yCCft2fee2zerdYBAVf3AZ3wmJ47Je9ltHxRbn
         Aaj4PRfURwzVuk8H/HMdh7FUaVCLTJk4AqydvV+obbQNHNLSw6nQoDuwLy4nVAst/a+V
         m5IdfBpLNLbw2/Rsw0Kig6SawX6cHYWoC9Z7YicXzvleBT/Iw0XZfyTl5up6xONXDlQA
         5IcD5N1jgdbVekKlHrWRkzdrtCRb2gPM9lJOLx+2HnSNQ3zzA2H5B6aqQmC7rF8M4o2H
         x0JrT9nigjVLzFum4KP61qxGhf/PIG3eSXb9o3HCnDLS9sUja7fhXtB61+ciFC9UqIEe
         ENyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        fh=hoi8xfEPzVMI0Jxpx7cshUj/g9xIfGiUfrXMb8/DtZ0=;
        b=llKbnpD3RtId5Zwqwso5l+S1Pwprx60gFYPOo21B6VTZsqhsmu4esxifm9OnRhyAYM
         qG496qwxH6k4IDAOhvgB8oKil/lxM7ziJdtr9X75WLv1R6HYvwA28bWnneP3rtNuTaNy
         4Euqvs9n9OqWahGUjqhrofRhkLpKem3gmKnX4T9Z6yLzHIIk2Taqc/NzjTjHtAhVSbpB
         /e/4/GAOh7a5izy/UrUSUvk+EmdZxHrcOyGNpAqoE6/7D/scxLb8pf87r65M883L+mhu
         cYrv1M4BqdUPPStbPtukpg8Aa0L8KBMo3QZCic+zG5zkEWaR9aI10nEqZzX+5jsMZZoc
         uW2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128789; x=1793733589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        b=B7OWrceebfcXCuh/DhLY0EOzbwxS4VXIwx+4ErbIGYhP3m6OebBZKVpVzxUm97HkC5
         RATOxwfeWslWPH/on+cse8vmweGFq+Pe7cq0tJN6X5HmrQGSM6MF/ULWw/gpdXC5i5HG
         9NkLvfNE83gBYiy7Ru5QOulO2zJWhVApeBVoR/qyGns01Jom7oclFyk96zrOU+AXkJK2
         PoweW5z+p/yrJepYOWIS1yrxxrIxyvqcLqQF0/7ufHkRXBqbpYKGGSkPRGrphfitbASs
         qiM1wCpc6/jEu7uoZS/DuWD39x5VP8sElaJBuoLijnze9E7K6anFEzu0cuTEbh8uDlrr
         dYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128789; x=1793733589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm+jYKGo9hxrg3LOVU5esHB+n0omwff5Vhuoin5XRGk=;
        b=NznDrPvk/YG5CqfWY1pA6qjD/xgIuhIvHUx71MA/JWK6LrPkyf2saom36daLLF6eVR
         Vjz7mTw+F5lQtDv64Wvv4BHIn6atv5DIfgkoYtpE7L0iSfpe0cd+3+t5J9X3dM0SwLDG
         3xOwKZNPEjSWFZ6xZW84dylyWy1mKfrYkA8iVEfTsFw7fW8izEw7EfNhokdyHPPVfabf
         RkArLihpRF//fIesAKRwaQHbXqHTZrOrsDuFZbSYpC635pIfryRPQOA1um2e8xMie49K
         tC39LvD2/I0mQhnIoBSqkihLwUhPFEgBd/Z+wsmFSxJzbsW5B6Rhrgq9a9DLzo7wJg0G
         E4Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwey3Z6fkcwKhUZC951qo2fY+jjXeOjcEEwiUOjJvQC+g0EeOOnnT+b6xW1JK6T6z7Kjkua/h6DOajDwCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC21ElXz3G36J6aqSAINGzgHZlh3rYpwJPar36nkg6eysPUr6P
	0UlIekeVrlWA64Z/jKd36HD9cocrQ4Gl7Ewi/WfOSdGxHD8AwHxrpdzqWHlsOmvOyRbJYWmXAnm
	pgtzOEDsVuyA/COUEhJl89frq06KlMas=
X-Gm-Gg: AYBFou1WWgWwxxttyK93ph+KC7I5E1S0w9e5f1v9763P3KQp/RAxMGbpypwZGBONJ07
	PQax9fBrl4uxEp39vSGUGEZNPMkwNc0idLVcQK6r4T08owvNBVnReh9kbYl4XYXhjz0l3MY3opH
	nhbNuUJ5XrQxuagyEarZ7o+BdB+Et1XjZ3ncSw9egPDFDTZA/FmyQeZ962Y191TzD+oLB/wjoUB
	t0zvTbZf3ui742lOCfSBM9BHJ1eSh+gVqnnpBATN/4LwctQ/2dBgZxLl0tsmUITvX6rxJiXr5XR
	27+BmXdl9sR6EISvK3dYVP9GIEcMmFpATpHzyQ5eRcB+tc2afnTmEwcbC8f+rQ7r6rpcbz3UcYv
	I66cr8cOnmORiKoX93pcKiaQoQfxUCIl6fP2L
X-Received: by 2002:a05:690e:589:b0:679:9afd:c0da with SMTP id
 956f58d0204a3-67a7bce2beemr237682d50.70.1793128789479; Tue, 27 Oct 2026
 12:19:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026154001.9323-1-jeff.roach0@gmail.com> <20261026154001.9323-3-jeff.roach0@gmail.com>
 <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
In-Reply-To: <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
From: Jeff Roach <jeff.roach0@gmail.com>
Date: Tue, 27 Oct 2026 14:19:38 -0500
X-Gm-Features: AclHuK8SfxQzWuTwavpktbuV6X76nKFATsMGirtAOEaQ-uUx0DzvkbTO2fqQFh4
Message-ID: <CAAnD8RbKBMaCEf8rQZdnAxMSW-oUjYR2GCqwKyVSy0pn=-CzvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:49=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> I hope you asked the agent to go through the regulator settings!
>
> Konrad

I went through them against the PMIC votes in the laptop's
ACPI tables. All match except vreg_l1f_e1, which I had copied from the
EliteBook at 880 mV; ACPI votes 904 mV for it on this board. I'll fix
that in v3. vreg_l1b_e0 (DMIC bias) isn't in the ACPI tables, so it
stays at 1.8 V like the other Glymur boards.

Jeff
