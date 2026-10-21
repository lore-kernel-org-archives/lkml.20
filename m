Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792579485;
	b=hKpl3GKzeQ8Hsczi8C2STUKjhc2xIcW3VXfqyJa/1GuXqvqQ1LS6bEWOqTEbVcjmXXnD
	 snhBszphpdeOCcscBVOWRED9K5rYHslIQYhO0mnzyf47is4DJd0G3puYKLRKJ8oRg/2zO
	 AupZgkM+XdOjhhMFgYllhCrtEgQ4UAlsi1bdAwkSz49IZER1wLuIJl2j+vrEgOwzAeaMz
	 KMlU05V7VRRBYZQc+RgLAq8cCiVDnIzNJDkidDKbroueskKi65sQwxG8ZHHpOgRIE2OAM
	 F+Tjib4RaveO7mEai98b4dWKUeXsloHmby3LWsfZFtNKxV9eV+tcF8/X7pnnqHEvffg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
	b=aY9LgC2G4vRnlkmQ11g4WM/MviiqSTaqCjLx9rvjA3yOEljLPKRU1PJ8TUBnALNkO2eS
	 kJ1Pzjlf0zCMtzqo/eXt9lLBlvh77ZzQ11crJFmF+LAmWFWbUdlEN1siXqvz9II617viH
	 +yZ+TSB1Qgg+1TRo0X7ICnD/0Olu2yZzz5OjC/HPMqe6Jhs2wqGkZDSZCXp9kX8aAFoTB
	 LzoLave7xObhl7XWraQ6DGSmTyO2RDUWaKbqVuQfNLnHjo8hAjcFdHAgzEfIH2vf3WaI7
	 zzQVGEQUTVA4++359gCEflqD/kb3zwQKWZHjXN+QaRPyeSIawyChKM5w0tRugogXr9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EMJ2b1Mf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EMJ2b1Mf
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso418072e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792579484; cv=none;
        d=google.com; s=arc-20260327;
        b=ENd11nrFG0FD4mhOaJxJBo5ik22ZVszAwW/GtOFb5PRbQ5fWHFoOLUTvkkPWhGSIq4
         IDqVwJ5GHojFQgHggHW+5rOZY7Fi93TjLsVvlm7dq5IGpgKgtSwR+hv13umA6VGsTW30
         Y7jlqsR7JWKaBBuDvR/0WmOng/jE8MXH86uppCzJX3hjxCCnqoRZ4beMULB+EhSfpvJy
         nB2eU0NCppL1dPgNVZQo7+TgjuoMNuaETPRA+lRR4Tl7WMpsHQoIte+YEC9Yztdmhuf4
         UP/h2GBoor7HPWErFfDe8OMgojQFJExOxF2yQoX5nI4tHJgWTG7SPnDjjMJjaPF4zoxV
         Y2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
        fh=KBADYZdmpyUj6VL6GksrPUvDO6sAO9Fh5MQsvqhPea4=;
        b=QfYpdGTrzv6kfXn4NbvNKIY5Dks7ykiMSWZHAcBJbDLkdwlEPhQXI1fTWBpA8++lzF
         ZAmtcWU9lDKMwBo62raO9tSTiigUbXaeJ1dAyAQwTyBSuUdbvVXWtBldEqc+sWVerc6I
         Lt8ch27ylfqr/q/VVqmiCg0Tzzq2Lu7HLFbCEZhQMQSOjauXYHD/Q5gkqOxl3orADsh1
         qtRIcyiKTVvqz1HuGHw8Ae1VJ798TQbY6/kyw+2+hYD6mL2UWiI71+DC1CuQu7IvVnup
         m8Di3T9sNi3QWUTtBafAUggI4Js++OgrYjKOhUpqiplh7MnCrIkqN6zGZDi8TYH8xLbe
         74oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579484; x=1793184284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
        b=EMJ2b1Mfsr3z531uo4PbTQcnTiI1V6QP2j5RPccaDPxAHktd9HynIpimNpp3Seb44d
         dsnZSu24RsiD1Ks8D84LeNAS6pJL8bWtjZerKwun5BXvUwNGyxGGXot1ISBjBaelgNWb
         +LsiBG3i+1rd2dbFbheMbr8XhypCxbMgaV6YqM7xJmr0A6EhAAIIaRAWbMN/NPY/BODc
         BCFbyAj3A1UEcGi6L+CouAWi/U+85lD9TRk45mfBdIk4o2Hk6O3GAD0V/DT6h5+fMwhB
         HDu/WXCbJOx9fw8q3qCmbhmO4OLj0UJdhHDMNfw0tSpNpbOvILJCArJ7ODv+AMQ9ddWI
         UNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579484; x=1793184284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+Zu9D+KgKA9DXJq7rrfhDe7h3krW5LnH7aKJrVEA3Y=;
        b=QgXc6ggoBtXBnUCbsJWOB6HpACN7UC1u/OZb+huDeteOAmNS7hz+KbgMgb5O4M3O47
         FbLiaaL9h0VaCnubKI2pWC8/C6zNTJHoe1vICOqEafiVAcjHSfHSeQsZUsxFkZEZz7+J
         FB+o/u9UWg8QC70idkY7dDIVZKHzOOi8F4Dvot2tKd0fEgxNQrkNaORhWQh3nXiqo4N+
         R3R/tPgthHxflyRbn2i8EFcEIJnieyRLCs6ZA6JkoLV4NqMCf82IgT/ttPv7GeW5yNPm
         NYPDnpyhh+8fy+LqqEBIvqzetRD5gSx/Hevbjwc8f17Sc9k7JuhRoojt8brV95D481x3
         Q/Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxRAfwVMIKhVtX1hcBQWDry6Oe5H0loiFZCEUFHBAvgolxZMuG3zPoT6qWMtZuA+kaaIA7Gi8/ji2gsTAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcnSUWQTxUo/oYt+0BkCleEqkan76zhlyl2bICFhLHhVCoaz2v
	HtqV19HUK3Q8p5D4v4F6IV1Hwb7mAlK9/MGAG3w4WrsBpsNWt5bOYNH98a3+tGihwZ+yBjYM6oE
	dLFgBW2N67WweOcMzqHUjL3wxvUDCVyc=
X-Gm-Gg: AYBFou1ptKeNJXp49QAOIzbImUu2yCbOcoREE6QyOZe/jLTWiciA44en/56YCglagI1
	+V62OBVysd+pDaTPzb4Y8PrbdwNjaNTPhC13tlvk8oaQY7QVLnZGt9efKIXIejJ1oM5Lh8eQs/b
	6DhZ8dD8c+7JdO0BUwrbeIMU7zCV4o+I7vYfzNTRG81Zs23nMl4KSerp/2N6r7bfJnLSip3CUtz
	h/dLLGLDWFN3VgEt6wYbyhxlqh334Iroc2W+O705Wkbhbn/Mr1A9EEiYHgwlpQ4C5EpwS9e+lJe
	VOlDr9vY8yBS5MszR5BenipZLCEEDB2Se9VJseC7Edmv2ctQKW+bPP3QHGq9Ra9BLHZopvcQXBQ
	auu1irs4j3bMr7ApCxPa4aZiwgKHdKnqJdVrwJqxEVIWtsiAODP6e0E6uaFcuGtoc2IMa
X-Received: by 2002:a05:6512:158b:b0:5be:50d6:af8a with SMTP id
 2adb3069b0e04-5bfa1ceb37cmr564734e87.33.1792579483402; Wed, 21 Oct 2026
 03:44:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
 <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com> <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
 <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com> <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
 <d3a1b219-84da-4ed8-9d87-5619e74bd1f5@redhat.com>
In-Reply-To: <d3a1b219-84da-4ed8-9d87-5619e74bd1f5@redhat.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 21 Oct 2026 19:44:35 +0900
X-Gm-Features: AclHuK-rJH5v9EVEYVeh2aYcnbIBH6iiXDeQCmZP7VNDudjBotFAAvZQy4bP1zQ
Message-ID: <CA+7S2vKt_n5MyyiG0wf01wyzTW-SUzyyRSw+eui3CL5rx0Zavw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, ajay.kathat@microchip.com, 
	aleksandr.loktionov@intel.com, andrew+netdev@lunn.ch, 
	claudiu.beznea@tuxon.dev, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, johannes@sipsolutions.net, 
	kees@kernel.org, kory.maincent@bootlin.com, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, sd@queasysnail.net, 
	shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	vadim.fedorenko@linux.dev, willemb@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> TL;DR: please include the relevant information in later revisions, at
> least as a reference link.

Understood, thanks for mentioning the background, next time I will
make sure to include all relevant information in the cover-letter.

Thanks,
Yuyang
