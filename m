Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5653E123F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912098; cv=pass; b=sWLOB1hHfWVvecYkAFg0sY4MMIQHm+p+NTgj+Mksqf3daIX0bJ3L+ayAPHezQMfMB8HfH+Tcw7A4TgXU4j427gEp9/KQas2PZkwmpc6QFV+JPwenMwzc2utT2oCnshFUg0C4YaXvp4QZM8UvgAAuPpjSFQkU8uZpt6R+aMIYNNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912098; c=relaxed/simple;
	bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcd09BktUnhDPm+AcywNRRlL4nsvkZ4SzcZwt8kpEUQI0MKDvklakWLFL0Jv5S6RPcjGQ3921PuD4Bwrfflv4xko+h2pP6sk0u6ZrfE9XuD/3uLOIcWlTwXKK0UZoo0r2ih9we45yoYnj7gNeFrv7HySZH+q91lzoXqeybf5LuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no6m/T5B; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no6m/T5B"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c207cb16cf5so133282566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787912095; cv=none;
        d=google.com; s=arc-20260327;
        b=RK0NLq3XPn5xKvqLeOLLZ4p25pQa7UDV08RYM8XSodD6NY6PgIMU802cxnQ+p5iwTq
         XDEASABQM0R3NQZNa+XzDzRDWuRybOsLXtX1vollo10XWXc5u04M/uNWxVnsQPWSFfHS
         fCklkYGcLjJG/FXS5t82RZWNhp9dW3j4AgSj1AW5w7mdyKsI+tCJ5Z1Xia/NQ0qiPRjE
         re/BcZj78o+p4Ojb6ggDSk+8K9hbuosMgk+YlTdaxP6VxzDRl70tRMvN4i2eubpAm/i+
         9YhlBHtw/DlymWLu+IacIclTvpuuFTIvNTDKISrlR5QgYDQ45tQCfrpTnK0ZjrI0evCK
         KFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        fh=sIK6xpnNs1eEAG5rYdcEGe5rikAe0TqWj2yQIWAaIHA=;
        b=BVxRQyHtLH2wcOBAurA4s//oT2nSxAt89FpDIc4vulk0o1xVuvaBp+l+ak1fc3qzCM
         YvFOVZeAnDTpElMtUH00765Omd43DBb48TvpoHAIIH0yLHmG5nje2Z7sMQNZvw7Ivukk
         wQ4Zq1Rp6cwFIJgbK3BuyRCdI2x2YiGVyYvafLfAuymYbl6AzquqP3F7j60rXbHds76Z
         0BUltaswRzsWbOENkBg4g45uGDzMdu+5kfTnrI19jZxZOtZ17IReaVt0cI6iYcw/bYey
         LrLQ/YaMlOxXiPYaIn8TcMALyKV4gbkY9tPH0nBBbUuwT4Pjp+F8Fvrdk2Z/Pzp+DVKv
         L8CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787912095; x=1788516895; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=no6m/T5Bw8c0DLSeM5A22ornHVbSjgkRZwqR3U2HtV6WyaEpB6lcmVAz8OpqsWQn6n
         k0UFY2zZ+AAFgBlq19ptPsX5aS9Ed+lv5FaV0kFkHNi6ULX9Gz7jhCFDC8vZBR19Km12
         gosgw/9brnv0PsIRROiroFwImYB7XEyZnDc9Eo2ietqRa6WkoLoRLBBn1TrzWQYL9y5n
         7hJyzBgQsJbv87gqIiQjdo4yHX+TCZ3xBEN7KehsnhAq37TCpJK2KOuJ0NOnVsnKynq0
         zdQZ42ESzDOPfyH58UrNlbXf/pokJRApl5inRFNmWRWZJP/gF+LHckYfMy3wyAwuzNQ6
         SPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912095; x=1788516895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1v0dWB6wdPLQarMGeRV+L7km+yD5Klgx/RyILbyOSMo=;
        b=VSp8YS7K7dXz3YFRKNB9R6sLxtvGheOJqsKhF1OFnE0zdrCh6qujO04JnjV92ivDjv
         v9OKp+A59iaNzFQWt4L3SHGiKbDVA73LQqai9KEmTgRLjwtmuxsWvtHs9io+WQACbJKq
         LqyBwT9DyuIKetN2+y2fi1lN2vi2uNXa+JePazsZFfs6/5vAcHeFFtTXmpUolxlQGg6P
         NRwH/DDcxgNb4KXRAvWh49boXzQGNwH7dkw9YneKeulcBD8HOuUT0HmYXQ89GpSdfrPW
         5FPhsumSScL8ESQoOnseCbZHI5BUaMfEJQCFIQQ5qcqAEKGrVMUM46wClFhZyy8ciEoM
         /I3A==
X-Forwarded-Encrypted: i=1; AHgh+RqSDe63rsW3uLChLtF4InvQRew2PzFsWAm/5SLreRoNJnZITzwh3POOyJq/7GQmhdYyovrW4FtYDcJtFBk=@vger.kernel.org
X-Gm-Message-State: AFuF++mJE7QNbDO31oCf/NwhEjwXe7AGx7vBjD0cXxD54Qc0KtHsh04W
	cy81sfux6M+Aujvh6pj9F/vwrzYHdO+kq7aYyKh1ONxjH8a9MBoHoARcM9QXnniZt7g54GkRDds
	P/RISFn9lnvoI6aepiBAHm+QL1nC0VcY=
X-Gm-Gg: AR+sD118aDNuTcuqPknoj6KY8PBf54JvyrmDIJ18vnO+99gYLBdoHq5vfw44RAYyEPb
	Q0Ochcq3e6dzzqMjAFYtxXNd+rQdFzRLuIcLQJKoEkQQhz6Ie3Kv4lwEq6iJ7oaQHcYSnPcvgx2
	FKiXd122o5/FTd214VAYvSde2458q/EJR3TB64v5/tFKeWokPzfwAHHgnFfPVjeIrMK8wuCh+UN
	A0fYHC4HOckpOpshliMq1zLtHGyQ9TZ3JmOwqic6g6C07qEGA+3UWkH2U1NrVsUZXFaUbOC+eiL
	RG/JERw79vr80HshPBA/65OgZkwAcuG8/8a84R/t/G4OaIKe25mJ+/Re9xLE7BfIdTtQPoNnsWT
	Ohmo6
X-Received: by 2002:a17:907:d0a:b0:c25:32b0:e56c with SMTP id
 a640c23a62f3a-c2556bc8abfmr482808166b.4.1787912095085; Fri, 28 Aug 2026
 03:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com> <20260828-liberal-jumping-quokka-cff4da@quoll>
In-Reply-To: <20260828-liberal-jumping-quokka-cff4da@quoll>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 28 Aug 2026 15:44:42 +0530
X-Gm-Features: AcwNN1WwE4fV98-9nbf9QfdMe5RP3mFos-H2h5xcNNdmEyy-SXjW6DtC1QoidsA
Message-ID: <CAA-+uk+5zWvmTB5NCbWpBqHSw6MswBAaJHGHw5LnKm4SBhXcLg@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 15:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:43PM +0000, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved memory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > [PATCH v5] Link: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
>
> Please keep the previous changelogs and links.
>
> Best regards,
> Krzysztof
>

I will include changelogs and links of all previous revisions
in future revision.

Thanks,
Sreeshankar K
