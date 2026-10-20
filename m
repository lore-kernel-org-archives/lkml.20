Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792512944;
	b=G9ZGyA2PMVAmynvGr2VFTi/koqQDKOmijzTFkA4SeMCuG8Umo3Cnl4glpjxclQhGpCRC
	 E1mizMBYDkNgrAYwR+2PLamARUA9lGbBO+738NWjDMv/W5b1wEaJIrF88ySjXeuHItbMg
	 olEcDTSNGftS6an/dr+hWPxk1qJbavhhnTD2GDDCkE/Cgp8VN+hwFRk8WVsxjli69pV9V
	 h3KEh+9dgsHMsMrHgJ5MWUmEgkeTt5786UAfnlNE1iQgt91SprEHtR4oEIGaAqgiDK/z3
	 p5aMDA6PSxB/LR75rimTrbHrTOou5IocP2KWq3XzkBEqYwa/MZqo2Bxf4VY8QMh4dZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
	b=vsc3a7g71Cr23Pywhs/YAd+HKcniD+trfUFEpYRtGpxGFKtYY857hvWdUicF85J4l1IA
	 FkxLTMiy9R1kXmFqKivBzMlZc7Kdd/ZWou5yryoSrIcdVFiq2jNhF6nNHF+T5n3btvEC3
	 0Y8pjvlFZR2jvHPQ0JRmBaxMDiBPeZ9z/Pu+mIFrem/PpagpDP7Gigirzwe5jczV9G5Tf
	 u48rzTfkZKkzX7qF0dBLyQSz+qoNlu1QIXcPvK0RFVRNt6d3geBjjdzOsEmN7KxLyEZGD
	 gjUucB4fNYpP9wrbjjGvfj9zRWeVcSi0J0WwtB0FoxlDo9gojPVHkute82FM8zajbWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPwbeMPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DE3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPwbeMPz
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba328513b9so3056769e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792512943; cv=none;
        d=google.com; s=arc-20260327;
        b=oleygz+iK9DzaiZug7T5eSSP4ztLiu29i+PGUO5d4FW5oGluOgXjmiVZ0JmOHaUhmF
         /+5kQisO5QYogt0xYMXuhVRFGWhETpfh4kPzn4krvxnduPg9TXkgigrl87XlEV9UG1LK
         ZWWRW2ku8nZkSpJWplij5xa27zEXVxTSj5HzrWpYNNJkoxBP+NXrDlu3dDZRsHhbnqpx
         vmPrb97oFc+hoPmVfWFwONeEBK8rcoPkHDSpvGGv3u/xn69LY+Q6LEJehJWirdFFOfUz
         28U/ewRXwFP/+zVQzCtxp+BIT19LvQgxFyVxea0KlyUzgkE9oo6MtPfU6VjNZ8LspYdR
         d2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        fh=pIKS3KUqDVuYx5ZbjYLL6XyZz1heL299/QPWhsG3280=;
        b=sv2wPAUupyiukw7DHw6JuCDBmI9KR0ohrblRZFhmcb0vaE/eqP5m+BcrbKcCOBSj+d
         vUjDMRfjkptSFFaKGoilNgU4GpIrntnf5ioBgW8quY6JXnzvy+h0eOrm0dSeGV4J39ct
         g65yeLfj2M7rrqXgdStnaolOfwy2JDpxq3GbHP8e+1peux+UJVS+hM7i2S9+SSUcNlAt
         ++MlCEA+KQe6MF5Jk+rm67G5qLBJiS8wE6KRY5+KskBFqGdEzadgERILB996pBUoIhNb
         vdkwphzUrz/OxA31oFAew97Ipio8OvN8dnWSXMQwFSRi9XnzbGRLzC/HyfKwvMdtxanZ
         u2IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512943; x=1793117743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        b=aPwbeMPzAdLLeNAORWON295qh9yETXyJc5a/Id43rICPN6Spi03PNjK9LcYxQJBDdB
         IrZrzj8BxqqZrDjlCJpTkSD5UTyM/53aZvsftbz7fUYKor2pNOyBIFKdFhCXP8wMnUbV
         QvsxtYuhE/JIVqy9XioMAOfY6L9gjyOxqXj8ALZXcU5bg+T3YUubiCqjlTiLVZpGxaY0
         ZzlHMlQVRJ9EbI7JOgh720G1k1xuodMFKrj5hMYsfbU4zt7L6wc8wLrIeCgFGNMzPsHg
         EqG+OmqbSuDt2Vj/ZNLsMsS0F3yTzXI/LoT/r11AcyBrGUuF5h0S6OP0W0aUeYkDUEIn
         QYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512943; x=1793117743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        b=MYjofVFO8XRfa7FBstC587OcfnR7UigwnaZ90BHCq3SYvJb0x+QCL7JsCi1vnU+qcp
         /lgdYtskAEto3yE6lT7zKAqrjAZBvtOrmSDgzNaLYhUqyUlq5WM1+bsNN19iIkZE+dug
         Hm0/O2zAtXx1OQD2R78Bb4V+pWVBj2xQDbiDtRx73i3JS/EJQvlu879rg8EiLFx+zzOS
         430gQapqGoOUPM+UvXivVYYWDjzQxkl6pT7vONHgALsN7wULH5fcvSjUgco/QYOo/qd/
         YbCa8wacYxlzV15ZskZzQoqg2pkw4fygXAAnPZ9ECMzsDdz6Vne++/9mYlziB5pfJqiJ
         cqWw==
X-Forwarded-Encrypted: i=1; AKwUvBynFALr8tCNR3YWX8quf6EHOt1ex9+r56djCDbznhn2TnVqlU4WEsQo6zWBECRMTEc7LLbf47CxSnyMbCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHO7+5ixRiEiAH5rJhshqlld5GjInE/I/JWDyBG2NFYqXVhUav
	pjWPiWKWR5FM1/7bZ8vo4wtHiQs2Tf52UHQdsOj5mzjuOaADPWL+b/EyF4ZV72bxZ+1PFG0tHze
	b2FaPWZD13PrjvYbdeAxdeCv8U9rFAyA=
X-Gm-Gg: AYBFou2iO6P4vqthn7RTC2RuxoT8FniTLD4XGU1x7i213VNKMHXP5wO1+MXBNnSqGll
	LMt+zupN2o8dSddRMM9vHBwRpHrjN5DvXJsJS62gA85Zwl/sl/iDcwTdrUTGSx7bIhD8h9Er1Pn
	LXXerjitHMpUzh6FUrXBZ3bOnWMpI9rIcMnkA6vgU8ske9Lq0CVuJSb8r6keQN6ovu5xm5YPkwB
	Is9Aq+BYWcypR3oET5E8nA2Xnb1ArB0w+vQJtqAcvPsAAdq0HzLhXfG3iFTSdgEIvvLiFMg0DHO
	NwEazNrSvhGnmFHTgxIPMei3SA3d3g+xd06GUOH9kmxzo0VDl145HaB05NYHMxICGPQ97AWC4/A
	pOXsfZctEe2Y=
X-Received: by 2002:a05:6512:1289:b0:5bc:b375:9dbe with SMTP id
 2adb3069b0e04-5be50a6b0d2mr3742796e87.45.1792512942267; Tue, 20 Oct 2026
 09:15:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com> <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
In-Reply-To: <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Tue, 20 Oct 2026 13:15:02 -0300
X-Gm-Features: AclHuK_1LQ0hgYaSfB-TfSrT7gWRZXqvLPPkmi6DcPVVcEYrpgEnBAEw1acmmg8
Message-ID: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Martin Botka <martin.botka@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/15/26 3:51 PM, Konrad Dybcio wrote:
> I threw an LLM at the downstream tree and it decoded the states to:
>
> C2D, no cluster state    2        0x00000002
> C3, no cluster state    3        0x40000003
> pwr/perf L2 D2D + C2D    L2 2        0x01000022
> pwr/perf L2 D2D + C3    L2 2        0x41000023
> pwr/perf L2 D2E + C3    L2 3        0x41000033
> pwr/perf L2 D4 + C3    L2 4        0x41000043
> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>
> sorry for getting it wrong years ago!

Thanks! I had decoded the same values, but I didn't just put them in
place of the old ones. This firmware supports OS-initiated mode and
refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
may only be requested by the last running CPU of the cluster, which a
flat cpu-idle-states list cannot express. I tried it: with 0x41000043
in the flat list the firmware returns DENIED to nearly every request,
accepting only the few that come from a cluster's last running CPU,
and the idle CPUs spin on it again, at about twice the battery current.
Linux runs OSI only with the CPUs described as PSCI power domains,
with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
system power collapse above them. I'm working on that, but I'm not
sure yet when it will be ready, so this is not a placeholder for a
replacement coming right behind it.

Dropping the states is not the complete fix, but it helps now, because
as they are they do harm: cpuidle records no successful entry into any
of them, and since the deepest of them is what an idle CPU picks, each
failed request is retried instead of sleeping. On the Moto X4
that is about 133,000 failed entries per second with the screen off,
and the battery current goes from 277 mA to about 115 mA without them.

Is dropping them first OK with you?
