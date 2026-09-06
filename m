Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727733C4B6F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666770; cv=none; b=NmE1UVD0ruHe5yhEOja22LpevvEGcezmk00Ar4OXrXHzzcFcIvCUMPT2JVVNaxkNZl8sFd9zH+syUlAs2+aW5hjRDBOE6woZcvjnOObsUSgyarkyh1CFoGugEq6MBVIP5RApaH7WYPxiVULckUKSW6yVtd/6iegoxxK+9jRXmYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666770; c=relaxed/simple;
	bh=3bGhMHfEuoItVVo+y9fgGnM5o9T7HJfIkrsubX8ZnU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKcPv1Rxr7oegwSe6cNfk4WDjegLZI2yRzwbbPhvCbtzM0lgVfI60gMhoczwk5ra3H5ZUECoUWX+/ldcx1REOMasOZbgrIrPHMBY9FPNSwkh2BjaspwkZclQWBz9mCM7uM8ooszN5SGDGpGgitAUvEb709yTG+39KXP/1xZYWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KNKZBzLv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KNKZBzLv"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a63667b78aso3818310a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788666765; x=1789271565; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSerb53rcqZbsooBPLkO5s2hB/Spl+K+lkIDPV42RAs=;
        b=KNKZBzLvRiXgFaGWQcrdWKjXES1HipsAKdbeMWxKRjBBxUITMLpSfXRvlhqc2lE8gr
         qrqxaXHsWjXmIel1REk5vsSeMHvYoTe07N9g7gWShXrfN4S8o6nBbjl/0cQfcL85i/xT
         SSS4/FO2LZxhPl2wdIf8+suUBmOqHjtWW2xPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788666765; x=1789271565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSerb53rcqZbsooBPLkO5s2hB/Spl+K+lkIDPV42RAs=;
        b=TyEZUVv8K/fgdUEW3QkO1RDjS/j4OY4dFYSPbqPg0Af35x8eP6lL9Bep3vXYut/j6+
         4iGKR5/AwXrPs/sfdbDZEEzNc8bq6lL2fZZ738lD3qh9E8a6H6YM4z/AKw5vmB5Z1DAz
         tW3AEklAuI0Qp3M5nouFDQMI1gAkUy6T/jQogDEo7tv5nAh62ogzylOm2LT//TPHk+D5
         QegrOvz3gyyUVEcw/szy2ZDgu/p9NxPFoxiNOW7kGTUYpn7CMWZ1APxNmvsbLsJArXEG
         UVKUh+KQWullI05iFo4Xl5eAxy7DtrcLeuOBSI8TrW0535zrn+M0uiCeitU9XwoBqQh7
         YekQ==
X-Gm-Message-State: AFuF++leB6+H+Dish5gj7vw7Dy2esW+Ia8ulYeGYkKb27hHZZgWg4Off
	AadxtNz7pymRsmS9m8vqrQ45qUWCAj15uEB+AgUxBzx8lz/pREYyYHGT81jocSjnvIWG/+FCd+S
	mlT+x51w=
X-Gm-Gg: AYBFou2w+ryvxoH74LR75B7eBF18gQHfQUkC+uKUyLp8A6bZDCZRbTLX1K7CgI138yj
	uuRH1Eflht/sFQkTGcgHGLceG4psuk4VOSZDQk3oj/B8OADsZ0VfCcPF5ZtlbDHFsDTiGSB/jnt
	vp50L/UZ2e8uPj8ioA0A8PhuHM2TxKYGTDm5mgLoGrn8S19+El3ox9Pr4Rsm3Z0tabatNkyfAcy
	tD4ho7Rlay5h1W6/SEqlWFORgk+E4B/xozgNBTKuHEms7U/VI8hEWoB97eGBRg8+BB+sJzWofrB
	n5k1deck9JceD1A9Zoc7zb8mo66C8XvjSlSjJzB1q8orIBoZUB9aaS+wc7cJfTHYTtEaGGfp/pO
	7oFWdRWag1qEO62puQgyR19f//ZV1chuGQlLFFs4/r2j9tQQewqQ0SBPa1yfHMmhKcs/2NO+ZR/
	i5dEUV92d7EwaPDXwsK/tFoQ2H+KLn2cNloh85HpNIX3/lyNO4uGgSItP7uGimwyeIvrKK65XAH
	sjQUy7oSSHgwGHjwllMCScJMPZSO/1x498lEw==
X-Received: by 2002:a05:6402:2549:b0:6a6:32f5:ff3f with SMTP id 4fb4d7f45d1cf-6a7e8f99a8fmr5350777a12.19.1788666765196;
        Sat, 05 Sep 2026 20:52:45 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6beesm2976699a12.8.2026.09.05.20.52.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 20:52:44 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c255c58156bso450493366b.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 20:52:44 -0700 (PDT)
X-Received: by 2002:a17:907:6092:b0:c25:64ea:4d70 with SMTP id
 a640c23a62f3a-c260c65c251mr611771966b.1.1788666764559; Sat, 05 Sep 2026
 20:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609042302.CE61BD262@keescook>
In-Reply-To: <202609042302.CE61BD262@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Sep 2026 20:52:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2B4maExxSmm6eO1aw9VGyK=Twswwb63Fdm6=KiOZbTw@mail.gmail.com>
X-Gm-Features: AcwNN1Vk3nfrsHDG-4r0mHaxhZr_TrvzmLKY7OvoNGt6cIy4utAnm2ONKUn-ouA
Message-ID: <CAHk-=wg2B4maExxSmm6eO1aw9VGyK=Twswwb63Fdm6=KiOZbTw@mail.gmail.com>
Subject: Re: [GIT PULL] kmalloc_obj() conversions for v7.3-rc2
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Kees Cook <kees+treewide@kernel.org>, Manuel Ebner <manuelebnerli@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 23:13, Kees Cook <kees@kernel.org> wrote:
>
> If this is too late in the cycle, no worries, I'll wait and do it in the
> second week of the v7.4 merge window for its -rc1.

Ok, I waffled a bit about this, but I suspect this kind of thing works
best early in the release cycle, but after -rc1.

So I'd rather have done it earlier this week, but "this week" is
probably still better than "next merge window".

So I've pulled it,

               Linus
