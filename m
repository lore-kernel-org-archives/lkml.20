Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955756;
	b=RGNUkjrZpORNb22/j5mu/KjgIQNsxLe5QtpXbgSMx0IMaQHZeRiMpPzOJkrM5Mdu9p5z
	 2Qpz/7+otK8WD08Dk4DD7aTO8b4dvM2iR3L1undNlmOuY30f+QD83jEysQ3ekib9Dmn6q
	 NLkP3iWy46IcRYMr1dNdX2fL5hH4axdJXvuyhMYRqOn9khtEK43bn/6otP7kh+OjITPnD
	 zZPHkQ9p7XA0gULbNy0TdjW5k6FBHnLjrUBVpPUHJcWOtE2SDEnDUYbZFg98HRX1lgnBG
	 8lwBG+4CptqMCBmROEXqZp2USp6p7G59HgTBpvEqrOS+CV+oOb4qvst3oDlOSt5G9og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jnOKRaAII88X9ElxIuGyL9YIaom8N/anVTOLnZNdzHE=;
	b=g7ohXuxVdbIQeymUinevti6EoB/1wWbO7lkiiXnw8S/DCqZ2YY0wVtuN5UvLU2p4R3HS
	 6/PeO0gl6Z5Ledz1jvFj92XiBj8AsokUdxEIA+eeeiNHdblT0KfY3+/MgqMhBZMM7mM+D
	 TEcgqfEUE8Ml5RcI9qlTIwn69YT83EpKli6bH86Opn8SR8ezOfMAXdjX8c6f88x/ERYgH
	 P7CyuFMc/urUPs38QxODtFE9imhnI6z9FSgR5ZfuRato8yZ6N7swUyjjZ+TVj0BJoZoKN
	 +j7swFGqodnGJXZ162tRkQi1Mg6aKBm0dZ7AKzb8/e5lRZJHi286fczBInK+yfOyE3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UxTV6It3;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76983606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76983606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UxTV6It3
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53397554beaso28980921cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955755; x=1793560555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnOKRaAII88X9ElxIuGyL9YIaom8N/anVTOLnZNdzHE=;
        b=UxTV6It3jXVjD3oVGMY5goBRy1ytdu/b3h7rYnkkk7CX3v4yuaU/pgSq+GwaiVB+q7
         DaMqCvfHWFGZBPSIVEvS+7xt+xnNgS+RUq3NdE5jcwJQ7+3ysUq6Zyaig3l8ConK7zBj
         PDafMnMUOaV9TwlxwvT+fp86q7SqsWTsluVRlKEF9zqhhmlqz/J+pqxxYCXzOoBgqhwR
         loa7JndHccNAhWHWUUmnhm6urCKwWzqs58qHH0539UuSCygzxTic29F4Sra9CFlbkwJI
         /P8njtvpsRxQvdMFTz/ArlEVV97zYXnR49io+rOgVNdXS9IO775XvDUjVhxPEhaiLv+Q
         UNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955755; x=1793560555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnOKRaAII88X9ElxIuGyL9YIaom8N/anVTOLnZNdzHE=;
        b=JHL+00maofCc+FM17VEkT+aOGsSoDxsn9NuJHAr/SBzYkvcEsUD1/IxvptmvrQgmyh
         ZLpdXfESD3BiIcvxHPvN84rEbG0jwV/yuJPvgshRplLlvBXose+GC4U9XM1YU2uVkR/l
         kY9K3QTEO4RgsMtLjn90NwMQ8EyEVV8ZljpfXFhSjW1/qYllJVaAvlrwhZgq12CoLo+Q
         5TSs7lEmlAeLKngF6Ozoy4pzDsc7ZOv/4lfUySm+6AoVmA6sIUQbgSnLDHGCNFRIMLQ3
         9qrRacwXP5o3IDw59qclbsSzoqFOByJCIZA5y/suUn9hULQBkW7BVcGyQmhx42/R0fQk
         Gx2g==
X-Forwarded-Encrypted: i=1; AKwUvBygo9+1O3Q9m766ZZ2+RzPTIMD06DZ1QjZs0/icvm3CKRIW+eGdgo5xHfkeW1idZEkhRS7FlBK5qWftJnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsTM06WfMH+Xe2RDmT7sXtlg9re44bPbKnY2bdtMOPqfJk+BFE
	14Usi3zvrHCelDfHNC6W1dsjHqE6xoxIDpunDr2NIGYNkTxRNQX9+igh0i7me/9fpIw=
X-Gm-Gg: AYBFou1GvtgS/97KGV2hW64qDDEniT2oP+3cGHLeshiL4SQmiYrewcyrKBFAoszcAsG
	M3x5QLp5Tws+4PR+NAz2+fCiZU6VuyZ40wzVC+OR9P6n1N6kUCl+M24FbOgoscJ/agBfYwbKnJt
	1UjyG+0JYGYGlR93L7wcb7uwHYf3Pt0Og3WgoSiNMYre89xFtLOLTSC0Ke2Op9i0MZffUiRzem7
	nC7J55yIsCJ8jlhB5ur+RirH+l7sLC7+65juH+/R3vs0baxXlhuNFc+F35Xp7Mqb3mSKCX4zIlk
	ZQwJpguKP+HinPokXwn4S1zfvHa5XUC966N/qy7GQdKp9k3kyOkdc6xU3yRChcz53JDAgXAgGS9
	b0e0XMYdWRecEq/YTh5yOaUumBjduo1K3UcaZfhvLslMFGDV/JWDPAYrSGaUdKrqv2+SSebdJ96
	YabZakfRjfq/xVlcFPtRWTHk5AWDVnTx9dMi9LvFJ37cfY+HEPK9Y2rBeLN0AHPmdc70JjNGsXz
	zyEQyDMihdmJ9B5AmEQ5d4uCmoRHBokHNdq8n19o8+2yyiDX6zLqXyMb5XsahWgJh8Bd3ha2SYM
	axn3WycewMJR3HRPdZObmGmCZnlXO2g=
X-Received: by 2002:ac8:6f11:0:b0:535:855e:6d15 with SMTP id d75a77b69052e-5383b4ef5c1mr78362381cf.30.1792955755510;
        Sun, 25 Oct 2026 12:15:55 -0700 (PDT)
Received: from [192.168.60.8] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c53fdcsm52343606d6.27.2026.10.25.12.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 12:15:55 -0700 (PDT)
Message-ID: <18bdb633-f168-428c-b3b4-dd8f91cbb9fc@gmail.com>
Date: Mon, 26 Oct 2026 03:15:51 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3] platform/x86: panasonic-laptop: Add
 platform_profile support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <20261007190446.38862-1-alexyeo362@gmail.com>
 <31bc2c6d-5d06-e278-a701-0bd4138598f9@linux.intel.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <31bc2c6d-5d06-e278-a701-0bd4138598f9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for taking the time to do a code review for this patch. I have 
incorporated the revisions for v4.

v4: 
https://lore.kernel.org/platform-driver-x86/20261025191300.1259541-1-alexyeo362@gmail.com/

> Multiple of these look exact duplicates. In such cases, we try to reuse
> the same struct even if we cannot then exactly match the name with the
> model.
> 

Understood. QV9, RZ6 and SV8 now all share one quirk_default with the 
SR4 keeping its own table. The DMI rows still say which model gets which 
struct.


