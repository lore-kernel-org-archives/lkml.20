Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68989383305
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805475; cv=pass; b=PnwtrQa1fMPoWX3/r0ZQ2GRiNCe8nAmTuOwdzVn5TcxxpORkV+EGIkZyjXmFtE0vn/g5gR+7bQILrEOlhD7fbevNcIRiIpgXuZjBX12hw//cuuAT+o6IPzkcztLNHKyFICQb2E213XX3GarK5m7frYhq4Yy2GAqHL4MQPwi4Yak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805475; c=relaxed/simple;
	bh=TF4gCEvN5ThIoaSNFiv7l3yYWMkjVNVbqThw5433U58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6/Gro4HlcKIsDSGJ0sH2wCMDs7xUBUa/rNCjYssHBhM5bH08/83lfX07/BoBtM3b5xrqGBBOuasoxyS8T6k1NP8eCTR3HHBjM8UWadZ/pyUK2j5nRTXRHVpf4hzqWxTt6sjn3nRG66ljzy5Uiw5wk6G+BxwuoyjEXytAb/VhCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQguqOGp; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQguqOGp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacb8416a1so16581315ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787805474; cv=none;
        d=google.com; s=arc-20260327;
        b=S0zNnxOQmMH+n884E0SCoutfcql7qHmDcCgTEDm8kJg7EnQnprOqXn/7Jq7hsSqXrg
         +7XQ+66FFcmOlu8qR+HQMwJYr4t3wlS58gY1I/pE/6xmpYm/KxdCyK+3UHhn3ZJ3ZmmZ
         smr7jG0apfCoWqLMqGlabe54tTS8lbwe0ftKhvmIi62QOoznSY+z7fymcsLcK+wazvVG
         aWE2t7K3dT0jK5zJItZKUnKDx/pkuisCitCcCgKS23HWsW+YE8KUEtiGibvcNzw1KtEZ
         fRkGuFjwCjWzcaUEfnbFsbQi6HwsjKMw8J9W/C6SwuW3pdoJQPS+VwrEZM9OvCpdYvoQ
         /NCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TF4gCEvN5ThIoaSNFiv7l3yYWMkjVNVbqThw5433U58=;
        fh=6C6N2hEe0f3QIraZbQhKt/olHrJTrmyk9WUTXj/y2K8=;
        b=DR3tt6WmYGZoF07BKYNBscPIPYdXfwNDV7G2gnrf4d36Ehiw1F2wqIQG6FE5sDbHmr
         FR5EQrvFATouAXl9fQ5xmSJp5k5k8JUI//mvg+so5cYFNxotVkIvWe6+ilNApKg08aJ3
         SA2bBk2rHN0U7qVI3YNVUOirlK3e1epgbomU80Fy7vqxvMugoOwtyDoQGkXfy627MOCQ
         0z4SuaheC8czbTduLJqOWs0Jbg62BE019cfprBz6uHOaVjKMFzMC0TzWu6GGV+G0zKAY
         zPBOMSTPNhIfw07wvkFcOKZdh9T2A08ilQoHJv7Uu1qidjzoQh8VJf2lmnixYELdbN7N
         SzkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805474; x=1788410274; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF4gCEvN5ThIoaSNFiv7l3yYWMkjVNVbqThw5433U58=;
        b=OQguqOGpKSMBKsKrggvFv/FNX5gfUzPkQt2r9lSKRoGyizlj6BecIlu6ZXY52W5S5m
         wyTpmA1ro092rIqdEU7LSGzrshonczFLZV5AlGkFu6vWWFBhVYDuYNjh7th6/M0cWRSe
         i4TKGwlqRyGHX59SoKKoAR1bzWLQbHROmjE/REci1y+D6I30+oRlP7YncTCIKnp0tS6m
         VAJZwvxvyoFTmowBKxnCEH1bpzNNs548dqF85OL8EH7FdeSlrPifYFlfSP4T45nZB9Bw
         0Mm8H0wWNO28ft+5TmULSm6Hu1C02lFrfuO+3Y34bn4PB/Ipt45QLGRjaCnsuu36grw/
         lcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805474; x=1788410274;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TF4gCEvN5ThIoaSNFiv7l3yYWMkjVNVbqThw5433U58=;
        b=stlDd/I7p6lcS8CA1jbkPJvBGuc0sbByQ/dFAFMU5IvIvw9/HwS9vNm2dpw7oF0KjL
         L/4GDHMQoY+zRnQiph/D8sJQkuOhswwR+InPLW0aBNpe8ssC7E0r8Ld5A7jCUa0LdQBr
         DTbyfax0/rNmeksR3CFIp384LO61yQ9sVE76ZFr7e7KrIO2rSWYrcv7sOBWFKmsrRvBN
         VZxtY/vyvXh5EMgc7OcX4vmsdjRe1rS+t9EY/A0Sb2IXG9pUVzjhdW0tus35QIlkkHF0
         pqxkBoOiWC+BcaHTaT9MeoDqAPdfwDcyL2Vj/Ifwvm58HIonSaeTjZ56DYnCMQfBirWn
         Dplw==
X-Forwarded-Encrypted: i=1; AHgh+RoemXTkaa+/R0wmdBPCg/vHpftUOPaGVlLLOZHVluxKecwVSmIZb2UuavT7EOcPcj5sgTc6JFZahT9RqbY=@vger.kernel.org
X-Gm-Message-State: AFuF++kRIlDwIm+Ie5909WuOr+2n4elXMXfaj7IxTAYblYPCzwQJza9o
	JXbx1+DX7begFy2LTdry+vMLFSDG1fVc1aqWHxHZMpKFthVoeBuS7ksjcVgmoB4+HW+K2dFpvuA
	JVPSX8xBX1VVdjaj8RqkXaLhyKNMASHM=
X-Gm-Gg: AR+sD13ZKGPC+vUKpWDiA14wh+MhNTZTmEaHvINAZq3MA4FPswYzMtFAj6ZTE8fAv+T
	0h/oA9qq1T4NXba/g7q6HmHbaaxcI+L/r9GDS3S4sWCnUATyQ6zhUd9bpL5alEbnScQD5yv5bWS
	Ra7XJ85Oyvl2OOkwac7tDAiqlo9oMaSKIyo7oxb7FKZ8VL/Q48xqDRPU2m+3Vahb8ROxWyIRsqV
	VOaKYlW/7dv3wIuDWOE8gx5VLy4A8oKldaDY8SgKHZBQyNx0EKMPHRpQqkiIrceKx9D9Giy6vyA
	Ge53d7kSsJs5U+ISRVr4SKziBz+Csk+tC6CnWdR2jDzFbVWwVtG4zuWNlPY9vCPbTGO1O6ukGHr
	PgAZEThn9VSJaW+3bGxRwqO/fBxkxRXFcFwDwrA3Hd0kZHVHoSWUvEerz5Skw45vqyjY=
X-Received: by 2002:a17:902:d54e:b0:2bf:27b2:4b80 with SMTP id
 d9443c01a7336-2d707c11148mr245120485ad.14.1787805473655; Wed, 26 Aug 2026
 21:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824100758.31622-1-phucduc.bui@gmail.com> <20260826124040.GB22033@horms.kernel.org>
In-Reply-To: <20260826124040.GB22033@horms.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 27 Aug 2026 11:37:42 +0700
X-Gm-Features: AcwNN1Uwq03wbJzFAkj4RVE-iN9Gvx0spZf-CcmajrHFwjhcmB8WRiI_cPvaFIw
Message-ID: <CAABR9nGKNzNygC79eaXJMnG27qRUVTjg1S8JPnD+oqDXCHe84g@mail.gmail.com>
Subject: Re: [PATCH net] net: mvpp2: Fix IRQ error handling
To: Simon Horman <horms@kernel.org>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

Thanks for clarifying.

>
> As pointed out by an AI-generated review [1], although the current
> condition is unnecessarily wide, it does correctly catch the v->irq == 0
> case.
>
> So this is a clean-up rather than a bug fix.
> And should be for net-next, without a Fixes tag, rather than net.
>
> Please also note that net-next is closed for the merge window.
> I expect it to reopen in early September. Please don't post
> patches for net-next until it reopens.
>
> [1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260824100758.31622-1-phucduc.bui%40gmail.com
>

I'll resend the patch to net-next after August 31.

Best regards,
Phuc
