Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEDB3E63AA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894231; cv=none; b=qeuie3A24+uqLAna81fWXv75V8aZj/C6DdvHM1Ny+0cy6yEj/7MAoPSgk8W+sAgfjNWYt4RYQ3ra87TUWiqyMupB7nr8fhLkV7sgYUp6wEy9moOX6VCSaR/Fqo0SFRiHGytOxopFXnrZoOAXFCv6UCOfCSbVqaLqUN4zfv2SJrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894231; c=relaxed/simple;
	bh=iCUng4f3T0nDNQc4sKdrpTiB2T2kWXa+Jf/ISOIUt7Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VqrSIqFImq9YLRGb7vaVrgEYJUTBKFuczj6VgihS20n/9tv3tLrHGLQ/QjCVYWO9wlTskbptl5QMztvzFebuK6QraQkawzjrW1uBFui47HaJ/oKyDZk4sTiUWX3Kh3wq0P4G9yatplV4EgYL7E3aIsJJiz5aqBi8WIzs9+GDsHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UiJzafmk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UiJzafmk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so11049925e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789894227; x=1790499027; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehp9Aplx73w0kxknx9H3QmiLQowjGYfxL4eGXjvfQCY=;
        b=UiJzafmk79UBeyDXVbR69Dndr2vjVRP7LC1qBQN+Q5eO2SXwlVIYO/iKwUxL7qCmZS
         LxbREqTBbgAzyM7BMWn8388hgU/UrrLsJ0erq1HoF50fBdMcKwvcQc01JdXO67ABfawV
         0lAFyu9uj5orMqKRMP/aEOeFmU11/lNBw0ByMR1xs8DwtrPoSRsKre3tJhngT64vdL1F
         M4Twb9acvnvGysgA0fAZ1vkVi/YbFotgUfCu1GtvZDgY363HknQ1LO8Msl70FNfKmI8M
         KMBuTvQXdIFYJxUjiR2N5dgdOvyu1Gf2Uo3+W4dxwJVEJwBa50nRx/8bM1SSKX6Od+1L
         I+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894227; x=1790499027;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehp9Aplx73w0kxknx9H3QmiLQowjGYfxL4eGXjvfQCY=;
        b=C0FsRN/KbC3dpuWbTtSAY/D/3UYKvRvuTQYcG9TwadeAI0zbQel0C2EjMGPr81vGRl
         1tiIeE/2NmH9mB2lOSSF1MOHGmbt4ihQBHO6OmL2Eu94rPH9KmqhW8mn+lCddP2W+slG
         QjLdPIBUfNMY5ZT4llQCXgtyNabqfEDG1LNwR0OAWYFv6Qbg0hMtgNkyJUEKlpEvYxIX
         8yMnAFCYgbh7YOJNcDledraEVD1xHER6+jkg8xXOUOJX7xI+0YrBD/cf7YPJ/MG0XrnL
         JllY7wJYTy+Tuuc7bybqSWgT+tiCVNF3nKIxhHSLfy8v+5S6NXOfXKdvKOyAXqwHQjL9
         AcqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9pVRCfuyu/XD5waaIYmLkA29INi/jTDfrKbri3rL8L0rwBwXZp1JOi7BtQeO3awjeXyE82OgXbtKRP2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n3K9mmRafPT945XrSOiXsAp9OVyRxlF2YWKBjVTtlhbrQiiq9I
	gvK49WtWAcVLupS261bpzuAGMLl223qvLLAln6zQA09ITp6gn1Da6fueGfK/G51RbyE=
X-Gm-Gg: AYBFou1aQ/mrbsU8QsgRuP0SI4fQbI174fYxkLNMGxj9u8FdeOq2bQahbJIEV6aM6IK
	hJmm3twmOM/6h3q3TNqwUDLbi7+a2h8Rs7F8lacShdgvaq38fGpn6amyjIZ5CcAji3B77S5K2De
	wPu4+7wKwRvTKukleFhVKgS7R1TsinaXtfIN1UkDkc6zpOC/qB7fo8+ddOlew2Lkw/spx6JXJiK
	W5GlUoUVkcmNiwGdp89PxA09vKYcasn2QsgvRZ0hoWDuO6tg6x12zNHFaI4FTnvs74mxRxQFkhf
	a5IhYKQm6CgdVjwS6gpHFWzMrXPRLLa/g2HktnrJfu9oqLfp5xXYHJXSSJMny/La95nz49TOxM1
	RqWxdJmMHNWYusFiQgDeI5QSRrYYlM3aEa8Q46UVxhjK0+RJTkSSE7N7x1AYTxGsH1Y8ln+lYda
	GiIKu6rrp2PC9s3sr0W577exwlmiCBwVYHt1K3m7jiPErbqEYgGOOPUy8uj12N0BdQyPg68yWaY
	NzUal9f1Un3wyZHUQ==
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr130966755e9.13.1789894227775;
        Sun, 20 Sep 2026 01:50:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm67312145e9.2.2026.09.20.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:50:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
 <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
 <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
 <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
 <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
Date: Sun, 20 Sep 2026 10:50:12 +0200
Message-ID: <1jo6dscnnf.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On dim. 20 sept. 2026 at 16:22, Jian Hu <jian.hu@amlogic.com> wrote:
>
> Regarding the suggestion to remove N from the DCO and make it a separate 
> prescaler,
>
> I have a local draft for this change. Would you like me to send it as a 
> follow-up patch,

an RFC would be great, yes

>
> or are you planning to address it?
>

-- 
Jerome
