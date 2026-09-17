Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C0525A97
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651429; cv=none; b=I3VUy9kfbfJOAx/wGJUJSHrozSIMncCZWPdLK1TMFWlzpmVnCcmSqqXbNo/kXkN/BqmGGj0L/d6IEN+6arQ1K01jvKsaqEPIC57af+nPmYfbAVM/y7S4oCX12/LKsCWOC4N0FBIE3UuHaMaWM9ZGIAJ72rWUaBWpHdMoYlB4J7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651429; c=relaxed/simple;
	bh=UwR4EnR2P6r2criarI36QIvF6ZP1tZBnh+pnESvF5oc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwNWa5NOYd8+sZaMeiSCILuOI4nNmWK2QcuDvTDgf3TrjSBBlHQwMOA0dpslmdHX7V/t/Odgqdyggoi+zQIuTHx92+RKcSzFbo5etLKtNK7qWoPsBH7qIfqAomZ3qY9FFa6oLIxB2EfWlW+nF0VwqgSEBmAtd9ZZLqCt1c7kFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0wShByO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0wShByO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2551405e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789651422; x=1790256222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wlR+1A8pVxSkzEFR/sTLjE5ojiMsY5zMSc9uTNA86D8=;
        b=n0wShByOqfhcTnft7l0JAwg+DLqDXCJVL0AUc9jGIU1vXBzRr8APOjQRG8ZYXQgXaB
         GCVoQoQ8wpyzS64w77MmbJR+p5qBBW5bRvurhvNk2mSgg2uc76+IG6o9opoJIgt/hveh
         edgmwvFAKhSdksqEMpGrz5/QhdGTmXCE5Cg4sGXm38VKMeAk8N2VwLruWleq3XKWd5/p
         wErhVG9/QUf9hLjDv7U1d/RfrR9qtBbV7fNnUaXsZXSKZ/OFVhdlnFsKVxWBxbbj7nGT
         PgSkOjS60Cp3tHNR0llIWn4xA5G3uiFWEJZM4vCPvvop3/wrrO8gXNCRmm3Hp2bIRNT+
         K32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651422; x=1790256222;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlR+1A8pVxSkzEFR/sTLjE5ojiMsY5zMSc9uTNA86D8=;
        b=PPu3wF9lfD0KBj2v/x8WU1yZ7ZGWnKKW/Kf6EAXAmaUNpDE8ewan9RSJTwcL1F/2sY
         ndazoLVqbjAkzG16PvoFzaWHtonhpLlLfWUKjjqBoa8QN+HOjqNROlcMiksm/ARLbxul
         ayGLt3/J1FpJqLmm4l5KWR12hwpuj6TfG+60MxtmcfjeXrgzOu+5WFqsoOloQ83Kb9Py
         IDo7vQojnkitj32KhehuH9ie59UGe5HFzKDwfBX1oioG4/ufuID3dmBaH/d53Qzt4qFK
         SB7iTzUybZ4Gdnx8Mh/vPX+aAGmJL5WxVkDfRN6Pk3llzZfxotUbcQqJQ4Dkxadbexhp
         C6VQ==
X-Forwarded-Encrypted: i=1; AKwUvByWNg3PLXCzC3WJINKk+20sB3MiSJIYLvpB31UPbdFSFzNRMdnUuNoVy25a+ao3I3gZ3n8XE4Z8oZUx7ZM=@vger.kernel.org
X-Gm-Message-State: AFuF++l/eNlAsOxkLe3OaLWaVfLe4QT5exzcmH+EMy37XB6qyuRNzOxs
	4xdexr4hTvoIlKU6yILk3DdrhGHCBxIZjPw10EpRAjj1arqyhzVUfbGu
X-Gm-Gg: AYBFou2IhwNhG5u2aIRQ+RJARXPTN5/waRaWlusBbiNKRfziPZdZj5lOmmAUauFH1b/
	NlOhB4Gq2APen82MAEK7TrMWYZuxK2mx33cgYaUynodXBsx31dS9j41ilKj4qeURMcLgmIcpxo1
	qymQxkFG0XpQ0AgzhK7Qp0O13KRgacg5i/4gUtvkuRsR5kgCvroJ4MklDkWRVZzCd3cqq3YxvNg
	rr6DNYPFi2nfOyUj5qWDsNhieMd1IVc8gLrTE6i6ezpnycZ8w6cu+AeWABxgsxDZ1YTS35BFBd0
	p+ycYv/U6k194rvgpP/TbWyprojqoxo4EgsftIdbmVdkESs5hbEdRNR+85tQ0d7OHet68NuFJk5
	pUYLQgF9ldh+xlTbVSiV3GcjtNQdAgc/ncNF/3/Yw2s7NFRjd2qdQyvnkApwq8qL+lPEWrOUM9R
	/i6c4+mkyJ1Lgv78IvlQ/kGYmgCOEZDH4K2deppDWHjMl9mQuFL0D5EMtPPeP6ECE+wAxnKQjRD
	muhPJN5rpXtCWHpLFMCCu0m4nla5E6Cr8SnhAZPX4S8RHnjv7Q+FR/JRu7ybbYuLN7/J44dq/N2
	s8SULrqOQLlKZ0v5ZRd526ZdnLU9Ric8Xl/0sxqDc2gshqB5kflxUAaSqrGaWQL/hGAT0Nr0FEr
	kHeWu2cjqrMJIAGjYlvUpCvpgEtInSjy/m8lg88R+eKnO9d6q0c8dss0ylRhUCRWZapOXhEtaal
	JO70Br
X-Received: by 2002:a05:600c:3491:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fbd1befe1mr52916965e9.5.1789651421842;
        Thu, 17 Sep 2026 06:23:41 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd32c5e1sm108045795e9.5.2026.09.17.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:23:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 15:23:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: proximity: isl29501: Fix return type of
 isl29501_register_write
Message-ID: <20260917152339.00004fd4@gmail.com>
In-Reply-To: <20260917130052.636055-1-salah.triki@gmail.com>
References: <20260917130052.636055-1-salah.triki@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 14:00:52 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> isl29501_register_write() was returning a u32 instead of an int.
> Since the function returns negative error codes (such as -ERANGE or
> return values from i2c_smbus_write_byte_data()), returning an unsigned
> integer type prevents callers from correctly checking for negative error
> conditions.
> 
> Fix this by changing the function return type from u32 to int.
> 
> This was found through manual code review.
> 
> Fixes: 1c28799257bc ("iio: light: isl29501: Add support for the ISL29501 ToF sensor.")
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---

Makes sense. I'd mark this for stable.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
