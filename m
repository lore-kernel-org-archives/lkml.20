Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575467;
	b=UpH0IcTJ1HNYhr1ApYhhbMFnJOYXrxpVuvgRcepb73DOyrmYl0INVfL2YBudfcR904OQ
	 TyTsyIfAia8+MfKVOj+NYAtfzuvXpmmH74a3YjjGOwH5OIWFOT36Y7Sczsi0lanNT0y8p
	 JkqWTa6brmrSuo4k2yzzkZi/4As5Lc7XBlCL/n81pa13yTEbR/52xzdIFKiviIwJyhLOc
	 k1Ns0Sk6jHOWu5eWeFY83avW608EM+x0W5EBcrVgjLe+t7pZ9S+EUY0r25gqY1wGYaBek
	 UtslMd3cqQKVIII/9Qe46oTu+wxkc49+uXjpX2tvdSZkQS5X9gHu6OsTgkxs7LZ/Maw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
	b=XTqbFG1n0GTByhE5aCdJIyEi/UcEMVgKgPbCBwLbdGazXA3uFwv0JFODCqiBHs0EfxXh
	 lSkwDBtACdYuipeIxpnPdIJ+bhqsqFoEgqY4X2+G1uMzGHpIfzoffTpXn2WbikTGkKCKu
	 DoiEGI4kUGrj5UXvXVJfKND/xIaGnRnqf4w9mq06Y7CTF57dRYMCx/3ZYqCQSJsCjGWt0
	 nQ9rhQv0jSCRpNvaqacnabelCVp4JuLFcwB0NWtIRHVakZimWiagD6Fzemz0sfIawo4rA
	 jhDhF8uiFUxgbZYpsyME6uSt9BOXh6SNR/B+LDu0bvG2gYBrDqo1q+wbpfID2nxaTEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AfU/hl7w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6E606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D6E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfU/hl7w
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e946155442so14502685ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575466; cv=none;
        d=google.com; s=arc-20260327;
        b=QP/oxSt9brCAtekLHc+qumQHPNj4lSOYbpksi7nEUYR+X8wpgyBSwCDj36VcxaOWaD
         dx9C+ggkZniaRdaEf+mmZrNUYk9eZM5x1eYW2eK/oZ65M2AUPk1l3dmG2s8yy4NKRmtu
         WtKXsJZu4yRwYx1NCVTqu+ai4aekqVfiW3CteZBIdwO0HkNVjhVZhOJpLhRZ9+RJbAQj
         Sw/enn485ptao11cE4KlJ9ka4+otO73rNd/cqVRipP6H+AQQnOkZhHT0GSGBBgHV8Be9
         kVoL5tnQ8l7I4qwQNRbx/FUz9CzsrXoAJxkGewdHkLCiGP+b0utApyHF8evUJ7/K05FB
         yy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
        fh=ykWV0A9bPiZjer+BzLtEq06uMC+Gxw8rehUSSO6WGfM=;
        b=qWqPpH83J5YgyerHqcuNnfMQbk67f+CJrwCvL90vJ+rGA6TgN4cgP16fJkhwmBVkn9
         4yxxYBswQ1Fa6ht5BsX2uLou2roFnNNZMavX94bfwPrHVd8CH33M+OzqqTDFg1Is04o4
         anBlEYySi+jEnwlzfSrlE7Kl9Xf/JVfKXdDzIToeKCqtBLalGCRYxemoeBspvjJ2HmkJ
         b5hb26XwVKO2bNVYFKi1e86/hzEUs9EUEM75fKEp6+m3WHdhtrbnTG86jQmNJJEN+VHP
         D9EGUswZHZTHk26r6ymgJVVMr07NVZSHHj1ZUTMhpjwbUIxoVDskAIQ875HVxma9nTWM
         s6TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575466; x=1795180266; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
        b=AfU/hl7w5UnA6r6MFc4vCpTbJ8iXugoSKtKGfvL9TlPJUbJVAZoDpuE6Q7tzICMYTp
         y3K01h+7zlBnGuN4np/gTkAM8FycVZnIJ+p1hiDpvdz1R9zQ20WViOqkOl8mZfqWtrJI
         XuGyrfZLDgmoOiVQ7U2YV39vDQNjKJZHIZuHoVSK3aEnZbItNejJnGXgCVcFf115hEGo
         NgfItMzTb4UzIpLQ0NebOxnQYWLE8iFOTKRruC4HbxGeFiS0qXMsg1VZKvzxh687iEs6
         EnFFdZ1SNaVjdV/LXGqixxvcgFxjlwltMmcuKSydj3gjjyyvyuJd1WwemfJgaYVAZKXA
         ir2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575466; x=1795180266;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
        b=uhjmASdb76nI3USoQCl56d+O6AdJG56J2K4E6e7/DkE6mHAIvmYsce3myGaSd66vZH
         9q+IeZ0r13y5hquM+IqPbz/3T/3XiZkUhg3Q3xp+VHUmaIhC8z/7T5FjmEy0wwIEOkQC
         DKVvgM6nPgfdZuj/cKJ/bRHq7Nc+r74Hyu28BdHPpVOJRskOyfWw7iBFaKtt4PjxOZJ2
         i8wm7Bv4raQ5w/3pPn4bKe1wMNitqEs4hwuUWUXn/ZhfPOcCHXcVdEtOf15aLz5tTBSG
         rCXZ0QEt777BlR0Z2sB5jYu49MYiM+fmF4t5c3uZs+E/FpYgIHIkQRwVfPuik/Rxik5x
         cRuw==
X-Forwarded-Encrypted: i=1; AL+hErFt8Udl1Nx+mIy/lrB5r8PCIKU9Ld91iuIR3JlwkH9/GMjVBtbkMbapPbg7+gW79tSydAjH7I20DAZPr/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eayc2/ZXPG+EGePb2YHTmsHiNKe2utNVzTfse3JWtci1cyzHU
	MPxhoyddz7DSyFVpNQn6vqxNveeiG3aD9myRYk6rqTRz0QjA368Qdkh0eCKpl+uyCmhKY5d2+S6
	zAeiIcaK5NNp+7upb07NW3AWDG2dbBA==
X-Gm-Gg: AYBFou3olXADhca9bO8KvO2FGFIWj3kBbuil2hBovZhJGV76fYoaCP+0Bwvx+DmNELy
	o7WSaQ2gX4qp+UFnHdhePPAXIk1ihFMjc64VEsgTe6+eGj4G7g4r26ck6jTWauCu65hiFx/5sfG
	JguASe4uz3Y6LFpU6uQAxrRDEkIQLVIpjrxVMFDq99N0I219c2byQIzkiICx8NuDguxOcnhwY8f
	5OkK1CNt7s0dbQC4f6N2+UDz0K1Jr/aANj2bJ+JpjPLwkQodwdg03WiLgoC0Gt5947IPGO/cd4o
	vWWQ1H1TYokSXSr4ycT6sNIA7Z0DsSeqd6BAw0yQHAwD89iuraUoht1mRUbN/UQBrGWq385l6gG
	K5OqvyVZAVmv5Mc1zGOp+JdsyyMINP8mwboxc
X-Received: by 2002:a17:902:f683:b0:2e9:776c:d52e with SMTP id
 d9443c01a7336-2ee0dcc305bmr25926855ad.52.1794575466293; Fri, 13 Nov 2026
 05:11:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>
 <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com> <20261113-fuzzy-awesome-shellfish-2d93c0@quoll>
In-Reply-To: <20261113-fuzzy-awesome-shellfish-2d93c0@quoll>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Fri, 13 Nov 2026 15:10:54 +0200
X-Gm-Features: AclHuK8kGqcZvYySC7U7ZlVIw1LS4Jh4WgXC2LRiX4VpQIIOmS6OUnujk91mNpY
Message-ID: <CAARotke5983-NFonNAnLbpzhEU2QZ=mt9CSNi=CdBxVshcpD_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for looking at it. As far as I can see, this series
(<20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>) was sent
only once, on Nov 11, and I could not find an earlier posting of the
SM5714 binding or driver on lore. Could you point me to the one you
mean? If I missed it, sorry for the noise.

Best regards,
Asdlerto
