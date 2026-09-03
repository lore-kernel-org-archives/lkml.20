Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600E4B0C84
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442206; cv=pass; b=FRJnIYbK0rhE/SaMGI6Bksm0VZ9OlRRy0C6I1kgjKBYxYcX91Zb5MYlr/dv2ky9suMcCgEPfVygbEa839krrNFxT1LM25oaaatRa8sBVS6mxObgWpXz3HsoVXBSC/4sYl/12OtuLTo9EvFrJ0AoNFrpmzCfwwGUlXcnKwbHjRy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442206; c=relaxed/simple;
	bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvO0QTedAZruUeD+2QRa2UAbSNasu279UHmCJMW0OJKm73hJPLjZYob4dvhZsIT67paU66cnPE+dIpUzttBvcb8Vupw52CQPs8HDSiG0RgzzM0KYq3kTm83lopSHaenpw1D0GtMZEgY/H98zK7yRRvEkzDKHb9GT6BXcEwtHT6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLHpuPUy; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLHpuPUy"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-861feb6d61bso26339517b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788442198; cv=none;
        d=google.com; s=arc-20260327;
        b=oy19Nysbz3AzCLmi2fP4I64qjXBW7OKkNzTgXs23Z4hw/bczZjZALlA8UarBsde6kL
         JkRHlxsDMD1Tc47tZoS2CeO6W7kPw6LBZ2kFFp22WvH5e7qmoWOnQKGJ6YyTyFlv8r6l
         8VxASFNZzz95WYpMam3gpfp7Mg2hOQugN8kBPQOy9dsMmjg8u7NJShTQ4iWBq9mIblYZ
         Z7r/bJXwak+6EHEf/EbBeBemXm8pV9mseqo+b5HxQumIVkw24gDk9GccSh9IhUGGMVLX
         onHX+Ls2C8XElqUvTIoyXHVZtEdqkmTt/JdT6JchKkLrqe1a1sEN/1IswwR2o+UmK6xB
         25KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
        fh=Iq5DlT9z5e5MeZydAKQ+qq89jA8D6C3yUcDHFvF7dYc=;
        b=bgQIROhLQFDG/598hzJJqpjEEpVRWa6uBWTS8bZXA3Fge41H82DOxaaMPJkxsPbJp7
         x5GBT/akKUphrJnlsvEWkIOr6kt5Q/q0wXQ23yKafnoq6GiDT/BEwX/3soqlEstfe05u
         hH/tqadTdRSVGbMxqTzweSGIoKlB4tObrgPTLozKKG9djc+ZdFgd7lxLq5DL0WEcORX3
         VJr/M7ytJIWwYJoEdAWLjSXvypptvaaiU0zZCQc0MDxs6JPzewCvWs/m6ZBGrYFzRCEw
         kuJPKRO/7NqZV3TVSRz6llQIjJAJsjHMOAihNhT//7t2cSZOssieRnZRceR3KejtT8A2
         1BYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788442198; x=1789046998; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
        b=aLHpuPUy/NxDyZcvUuacMPPN8mftF+5tWukHrgLnUwyycIh2eoyENtUg2eViwRGDXE
         fs1cVc9crSD9zI7DqtRbCPgitjsckIqRIHspn3UIYm9S7I6Bbedwi00ej4bd3r2s6USy
         21evlCs/JzJRnXnEJb/Hzy4nd9PwltwM42zSqG599c8KDzlQuQ2PGYKb/gcrL0AxgFOA
         Ei2TImYVxyW9H3yoiD63exPNx2spUTCBc8+TZUr5K91gWWbcAp0lzelfwBtAdb3iDsCx
         w+cgkTC9olsTXoRWxPI3Vuz4ZFWU5wO904n+3/DWEpl88JK8cUgjsyDPPcWrt6i46Pbr
         o9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442198; x=1789046998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
        b=M6k42AwvSmJnuhen1ROMr3/pE4SIqyS+evD5qAxBrilOunrksidJY/dazKHCj/JO9N
         BjCImA21MDypOqImD5uhLwoYKl6Nko/4BuIPseIT/aJU/EaeFGUhLpJsjTLsh17ySDgS
         +5a65kuZakvvEPcc3HbZd1yPsg8tqla6SvoK+5hXCYbKNZD6R/yY8i3PZLty3+T5BJJ9
         iMxvwYXWkpFredlv56Mby6szWRYeNILaHQx4IFqQDfGsjXNbzyDwpsLxS4nzvF1EceDi
         CiaBKehvRKmgKi9STkpgGfpPggbKgV1eob2OU1QZw072yJ/rk+7L+7UxQTHUBjke7Ll8
         2eqQ==
X-Forwarded-Encrypted: i=1; AKwUvByv0mynW2bxPx044XaAYnvhFaoHLGqyH6kCr0Q1JUdYAPz0QKkbyFy3kg9AAvwjTJ4c0ypfnTCdYuPDbM0=@vger.kernel.org
X-Gm-Message-State: AFuF++lrGVusOfP+Ta7+YOJ1wxHHabNOiUYI3PHa6wzeyNvEsIBUs2lI
	rARxZawvWMeIjsEwCxyFr149hLDvgyQ6RLdzF0AxN5ieyKAYKew7+1IVoY9vmirEAIGx9FqhxXW
	qo1mXM7A/fgS9BwlRSsrm5VjAF5hXOhpUg6GzxVc=
X-Gm-Gg: AYBFou3Y2Epa7/VXF5x2RX416pGvC9dDfy3YoeXj1EBygN0fqAbirrW7iIUJwtS04/1
	6utSs5ar0s0rym8c0DnKvGX+wRpFaCtXPhqDPvV9/36KlgVvFAaDbZ3kFHvs+g6aLukYROnZP7i
	TRtBHfFodggjb/zIjjHMcNoxs7YkcdjwLNE7KlrLxtubaTmWyYwuJB21PGMIGVHMXVoyH8yZs7E
	b7/R//5vlqemWxJhpmzJRIWGbsBku4hpW69sTftNF16Zita/FMPukMqgBx/wzqO1tHPolvilqa5
	MGCsr4Jqz5Qat+67P+vbjGVhUFDwH62UFchREKJ2tdpQemDA/XAANM4Hy9tme851eGJXiQg37W6
	1aCI=
X-Received: by 2002:a05:690c:6e87:b0:81e:f5ac:e40 with SMTP id
 00721157ae682-86c51486d45mr52226857b3.20.1788442198498; Thu, 03 Sep 2026
 06:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901172055.53889-1-godanaemiru@gmail.com> <2026090351-trickily-churn-6635@gregkh>
In-Reply-To: <2026090351-trickily-churn-6635@gregkh>
From: Godana Emiru <godanaemiru@gmail.com>
Date: Thu, 3 Sep 2026 16:29:46 +0300
X-Gm-Features: AcwNN1XYP2Te-2BOmPlDnFSd4ysvl0QLMBXWTqT0ifU2nimM-5TExyVN70CqDQA
Message-ID: <CAKODxtuWpgpXqS5N6SS9Qu4Ng0gD83aAVCbg7J3S0ojXrGn5RA@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: document the locks in struct most_video_dev
To: Greg KH <gregkh@linuxfoundation.org>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,
I used an LLM (Claude) to help trace the locking and draft the changelog
for this patch. I reviewed it and sent it under my own Signed-off-by, but
I failed to add the "Assisted-by: LLM" tag required by
Documentation/process/coding-assistants.rst. The same applies to my
earlier rtl8723bs patch. I apologize for the omission.

I'm happy to resend with the correct tags if the patches are otherwise
useful, or drop them if you prefer.

thanks,
Godana
