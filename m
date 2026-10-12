Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48335AC1C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798108; cv=pass; b=JeLrVASCh05FQL2uZlhZgdseI8JqE1FfJjp6VExJ5MPJEJn45M0SyLVN78HfS5VsjCjuetVBHUC7IEeypJPl4wSvFbWn2L20aM+rsEyT1XwWHYqrRrUYICkxGbx8Y4rTmENxkRcYhKpg/vnzV9rK5EB396/MUOqpfEw0jMRu/ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798108; c=relaxed/simple;
	bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUWZOe4s/6/FlQWEzFA/EW+O2fW9OgdrYBVfVrTYT56OFpXC4pvGARPf35n0RsFg46+mXRIQ+qJIeIKI+CwmiRt8L+Nz5Y2AMGqWug4gH4BVoTF/Pl8r2UShQRR4W4Orl+FC+t69+NPdwlz4Bd3lVMvI4ue/4u1mXiaisHfOVx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuKKuUMK; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuKKuUMK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6e954afbdso6592425ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791798107; cv=none;
        d=google.com; s=arc-20260327;
        b=L9hxL91dXhsWBFHfSUhwMVrjXtvLjdqDs9p8Pd8AKRgsNtMVbPFzIa90MkEfcTNyOq
         p5id3JfXvkcrB+Q9VvsnmPf3f4fybZULnSIwGpkIDLl3Rl4NzyqoQNlnNYTJWqIhVI43
         dFBkfn7dlo9ETjm26WldfjY+Wocg1Dto/7/1Qxz5TQdodUgMwmrfwieiyg9cIEM7GNfK
         iOJ7BRmrXZ6OxkRijS74T8PWF9m32dW2Grr4j47bLl0xhYUOmYPv5DkyoAVNpfWtJR2e
         Z1mprX99n2YYYyw5rvruGp3QMj7a5nJ0oF1ONspjFsaBCn5DDSQAmTqqknn8uHuyeU7j
         E8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
        fh=rJQlV+GmEyxleqlJHPYBE7IDQy/da5+XDyzfsk/H+Xs=;
        b=FQM2ZHoqCMOiY5/3P0xrb63Q8NN6S8BQe/+Hp76P5xuZKuY4C5uH3QbBecnqfg9b2p
         u5vkxN6IiRp9kVOl0J04E3EZ3+dwKecOoJoeNWDIGCIbrYWOFRYA9DtmQVJvED5vVos+
         k74w2OJneIDK/N4k5cDzXSOzQYPuApKEcKzlXw4XaDg+X+E9n0uCLooSBiQT/wche8CX
         /Hq07hQY+KH2TO0L9iHCIhBo0D69gbsr7QGjDRaKbe9Ll5vA1e4RsQLjPlTx8baDx54c
         XzcIlHkz4Txz8hu3lDemZU26aA2HFR345vMmeA8FC+Sxu27LNz8H/x+0qSfe/uB3IeZe
         4Ktg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798107; x=1792402907; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
        b=PuKKuUMK7FCJUAqsNN/uQwQCgRErWKIhsMxoKp882vmKUQTdu3xdKt36TnJZsiHhOS
         cJKJRAEqgILInj2M2mXOQoB+SCen3fdSti0NwTTIH2ISuBcZcLSsAp+yFpSSpAc/+zvT
         y6wvcoe7OQi/KmcSJ4MATVjHHidXPMIU6TTiFT+m7aL5YqWWMAFqZ2cDgk+AuTgChUm0
         rAgbdsAN8tc/BIctNRK6Of8M2zROy+/LfhJfZTzthlYFgIWfk4PQ+oHzHtCC/YiCF9v9
         EGnkhgvEmlz95jpsmsiU20OUfMXocVsGtKmFE51uAUT5A8HA3j5anP8bpRA3KuqsAsk7
         q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798107; x=1792402907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
        b=d1alCrAWDtgM0J5NXu5Xen4mPMCVYG1Ri593b6KrH0u7BQ7QDctEdmM+lHZv85CjZT
         k4Ds6AiFVYRwZXBvy6XpLIoUe2hr/6CZeftJuAK7wgIlptCCwGecGgIxqLkZHL0UL9uH
         T43vOP9s8XY9H8SObZeZ72SiD9XJbR4FUqc3LPZjT21rIU6rFtlSssNT146Wxw6KikGc
         qRIXA/7OUR6mZHZmir6PpEu5QF72ETJgg18EhX9I2lRPInsr+0nTMy4h0rwT4VAOZr3N
         8uiRJkWlXxSYEMOA8NkEE99tC/bm19BQ93+itMVs3Q3WO8DIrLKt/BSd12oqkJ7yIxgb
         ytGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCFzKAYzUoCuWt9EoU58TwJvLeR8QBRuHZFcDCKRwQolcri04zUaZ2usAdE/S3sCQELWChbkp1P+unfv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0lyCMZHBHVFk/kuBSFkqxs4Sb2yTHKpXXJM9sDfWhxf47I51k
	CyBtI0nxwmvWuCL10XIJnuYZVJoVwAVcAz00H0wJ5rS/7TggI7SVqNsxCob1d84c2lMaufSDoPN
	5CDupj8dH6mBrh8hKp0ljqOqw/WJU+CU=
X-Gm-Gg: AYBFou0EGC9/D0AyKLunKmvlCWeW1SugFx43Q3ZizZqEAHbjwAnSRC5FqAzS+s3WuGh
	ZVORP2nnGDMI04RaBp1wjnwZkJojL1WbCWyLUspCnifKJMJgi7GKE/fGxnfzV7Sj+LBVCWZ76KW
	Za/LqU1PpuXILbs/6Iea2orhU/JBiQHvpFieuHxU8Vklri0/XPKo5EkQiAKiu9yBgkleuJFIEnk
	8fhNcbRWvBWq8Lkcv1z4+UtqI/po/shINBrp5sI1AALh3xMvRv2k0Ayl/hOy7K+6qLxTUg6vf36
	273V0L1Xk58cUEL4ELYJsC8WHMYAwmBRt0gHjFsm1GYVlzZsbtCtkp1lm0dqSH7/1VhAhpSTVGw
	cGBASYLVkvQM2sS92wfK2ZSB1msw7/oNbrf4EEfag6a+NNNRVr1lBa4IoLOgOY6O1gmE=
X-Received: by 2002:a17:902:d2c8:b0:2cf:afa5:b19a with SMTP id
 d9443c01a7336-2e842ab812bmr74647105ad.11.1791798106721; Mon, 12 Oct 2026
 02:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104847.507776-1-phucduc.bui@gmail.com>
 <20261007104847.507776-2-phucduc.bui@gmail.com> <923d7875-69f7-4c87-869a-fc66727c70a8@nvidia.com>
In-Reply-To: <923d7875-69f7-4c87-869a-fc66727c70a8@nvidia.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 16:41:35 +0700
X-Gm-Features: AclHuK--qfWr1I67rnpFbrjIRtXfOWVmS6fI1rNM14DuFuibSj-EIqraNUcYF84
Message-ID: <CAABR9nEk0dm4Lghcp8-ej=-0jAUFqvi0dYBBEYg3uY+6YdEZ0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: tegra194: propagate REFCLK select GPIO errors
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>, Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Manikanta,

Thanks for pointing this out. I wasn't aware that you had already
posted a similar patch.

> I published similar patch
> https://patchwork.kernel.org/project/linux-pci/patch/20260923072237.1139013-2-mmaddireddy@nvidia.com/
>
> I am OK if this patch is merged, I will drop from my series.
>
> With the subject line capitalization style fix,
> Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>

I'll update the subject line capitalization and send v2 shortly.
Thanks for the review.

Best regards,
Phuc
