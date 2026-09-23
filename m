Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE235E1AF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182604; cv=none; b=Ze27imLQpuGgEDjPvXP+FsrpkFQPVcgnMQmroUiD9JA8SnC/8GoSBMkutMXDWFNs5Prr0bnPDlhZPe2+C7BlZFoM+pnxLUs0IlhlcQq6cEHoE+/EXRXK+bsctmBV613G5bIDxGk9dQTJBxTFQTDNGX82nibmz/5+O52Cz84z1Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182604; c=relaxed/simple;
	bh=SXLwIEv1wLDY/SjQuew2Mr9cNFckDSjzP5UQOUJn3/k=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=nJTEgG9dbHKKhQ6WDcsJrR7ysDLUrj22XD7Aym07PcHlEaa7iyoLzzcKKg/W5xaDu0XXQ7SeGu8E8Y6gHwKfAAtQtnKd6XiRKfZo/BnN7ydjhAKezbwoKBdM5FdLCwB4QbnLGW27P0pPZfyIEl/B+R2469yxi7ClOeMj1nW3QlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsqQazf7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsqQazf7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso14841425e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790182601; x=1790787401; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kr1MVzRgK4mAiK4oAoOCSLrh/zDQ2LAQZ54aeHcdQ74=;
        b=dsqQazf72wnvXYgCMRGDuI63KD7GRr/bgNVJteCUU1VCHvzL5FAujzLPeUM6o92GUj
         ChGgFB4VSC5UZcXn1LVfbZLadF+4zY2pFlSA+QKAljRgWHjB6cJwBNpOHhYBm5IJ8Od5
         lXyFtPomQiO9GhBXeOqPe68w3uP5n0wfVnddk6xLXeh6VnOn+lA/ZtTeLY932no2b1nM
         rHqAgz/OO2sFsF7rObzQRi3nISwAeCSIt0sxzLBgzINys+rHifmxY2CjuPtt8yVMXiQG
         GmoXELhwkMlHCXKnvhLwrGSVcyTJXR0FKkEOVOHd71BrYYqx2kub6OCgdsXc4RJ+gh17
         p7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182601; x=1790787401;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kr1MVzRgK4mAiK4oAoOCSLrh/zDQ2LAQZ54aeHcdQ74=;
        b=zCWGTYxDSWOP3gs7L/XInSNTDc3a7xDPXV4gYpVjN52fpkNFdfnKaEfIq05aKZ3z8v
         YYXESPadzj6NC1pMfuhaTpePXRVdBo4CBSpcpo6dDQgD+t8GN8+P2qYzJV560u12ptV9
         KF+5Dtq5MCIPFsBytod3hE18e9sbO4KXYczww2craWySJRoyDk4qUR2WxhpZeQcYEtWO
         2V0ThGQyiKI5Co9ZeO543ScUeJ/JRRZx5ksBx9u6VOj0SJswOUiz37oJSlrRn9mu9ND+
         FSNK3Xj5OnQ07t+Pbnlzd4wkfo/xlgr7N+WxTBy/+QmLm87Sl5MDjMODGMiM7EKXS400
         trBg==
X-Forwarded-Encrypted: i=1; AKwUvBxpvRCO6eJHMm44AWsjQ+Ou+4ZrXNZSXp75eKP8cRMOMjzMW7QfIllr7M3qnckr6sQ08dsnUtyrm5RuMp8=@vger.kernel.org
X-Gm-Message-State: AFuF++mofNiQFw+VQVmogI+rXn1J2+LOak9UefTGMe1cyKsePLsd/9ue
	j5/4jz6FM86owJ/V6PqNeoEKGJ66KqJ9rerZoTm3IURGzUp44fpF7ZYq
X-Gm-Gg: AYBFou1G/Xff9yqSTwafmzayYKwg26HvxTGR8jb8hfvBshPbRcoE3kqg57y7lxn/ZEW
	qASZv/rbln/bEJJLqFtfPP0Ow3MNLkwGqIi5R89IY7SP+GEQs2imV4m4U9r0qubkoe3gxXy0Wvy
	8VbVKV+Lir4Rb5/GFeoEpU6+Cd+0HcjIOa1+Gnh6cKDTrxJalj2toke38hzQUqqCbPvioYISasJ
	hERIQtNEIRXGF0rQBKYn0HovtXGmcSiJJMhphTbqpciPdaN0YSKs7nwbJtyzVQUiGmvH2vbd81F
	BDPD3CF0gpiymze5c2H7bjzNxikDC48ekIYx9bGmmMf4hZLYUqcjbBCBp2XHV2u4qkiaE5Sn2WT
	ofNK/E5/9Qalmofqm/GVhOfZQTz1PZYmfkMCbumEtFfjC+4v/9vwkdxYR/PDOTPNrVTE16dGxcC
	ltIxv+qbUL/q55z5YwCvOrrkf08Gdl5T28S100tI8r61RgnfJ78t22SuWcjTPs8wiXCR7WQJBwD
	Ejos+itHw==
X-Received: by 2002:a05:6000:710:b0:487:27f9:840 with SMTP id ffacd0b85a97d-488670a09d6mr5921753f8f.53.1790182600803;
        Wed, 23 Sep 2026 09:56:40 -0700 (PDT)
Received: from [192.168.5.15] ([161.12.45.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm7815715f8f.0.2026.09.23.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: RE: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical
 operator style
From: Bryan Chan <bchimhim15@gmail.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Bryan Chan <bchimhim15@gmail.com>, Borislav Petkov <bp@alien8.de>, 
 "open list:EDAC-SKYLAKE" <linux-edac@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <SJ1PR11MB60834A6CB20792962CE05051FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260922231854.108188-1-bchimhim15@gmail.com>
 <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <179013525089.122719.12798013417319991127.b4-reply@b4>
 <SJ1PR11MB60834A6CB20792962CE05051FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
Date: Wed, 23 Sep 2026 17:56:39 +0100
Message-Id: <179018259977.122719.1860882880972360707.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-09-23 16:35 +0000, Luck, Tony wrote:
> > Sorry for my mistake, this is not compiler warning, but warning from the
> > sparse, here is the warning message:
> > drivers/edac/skx_base.c:359:46: warning: dubious: x | !y
> 
> Ok. I updated the commit message to say "sparse warning" and pasted
> in that message.
> 
> Applied, thanks.
> 
> -Tony
Thank you Tony, I will be more careful writing discriptions in the future.

-Bryan

