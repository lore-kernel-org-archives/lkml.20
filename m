Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794193208;
	b=bwAuX8/IB/hhST7VQYPlQTRpiqlCLQ9tyfOFKmBuyYPRU5TTSmusPDJWjVPvn9YUsw8e
	 1jLBbG9IdjUvR8wm1fLm/DQsSiY+ICktip4Kgnp6DGAZ4ns/fg8cTS8x+PRb0FmVl7jWs
	 2THLrQVL5CZg3dGHD7/PxWJcwYBk7HpvPQaj67Zt+nNyYTVdGnIpoYcx64TXo+nzbOm5O
	 ASUn7Hl/ESlP2hZ+In9jFl3//U/0r47dt1uVlzoXUEsV/x1s9IrZ1eOzVsOhj9TxlXiL+
	 /kBKTiJR7plENyRe0vyb8bevMtMo712SIEbLSNX4Dg7/qpyTs3Eoko8ppOF9ZawDhzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
	b=EoTqkAw2A53XRpRaD+GRsouhXCnCdhR3BHKCIbxW8+rXhSD+SOn9Q7k+NTR8AUwCmyGa
	 sg30blg+vObSR042lDFJDUWjOSS9Jj5TV+qQdBMLG3TXy3mwyhApEaWIJzmreGo1jQZ6Q
	 FLQ+EK/c6TgTSu/r44DArZ/uZBFa9xgFgzM8xplG0AhZ9eNtZ5W/A9Wb4hb7nTHviBF5A
	 uaQ0WtR53aqIXak3dCuUPgbyTEbjew1ICxsqQZbEqSQgR/lov1/0FgKQ/7blbn8bCw8S2
	 Uk2+WcQKlzQtH6He1sH8kXPyDd/ZBWSzApUSSVifVI+d+8t+cg/8SlkQ4OPjpcq0jRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+bxX3ai;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E288F606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E288F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+bxX3ai
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc751eddf25so130116a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794193207; cv=none;
        d=google.com; s=arc-20260327;
        b=puCymARixMJOHEFkgyAxhkqRdyyCZfn+aP0QkP1fbIrvllLTzPf2dQF7PuIBO16sAo
         Hhtyf1JpVClqhxA7rd0TPq59v0X+8VoWqXO56Ft7oD/HmOTc+9StNQyEvTaObOWUQCJu
         VTJLApppu96E/X4WEmZbB8Om7dpCOz0c8h5mHTNX+65y8Nc7WckQgBZtiHFNeQlbAuQf
         9EQ4FTU3DJxEO1GtXJJ8sESSiRoTOMkneCIBeKpFtmpR6bIZ1QcLRs8gezgM6GEbfE0N
         M0FpMnmCrIM+3jZTJ1fFEwy92DAr55C9u3eOV3KUXcvKAnwZYuyMxVTVUf80ctax5pJr
         bjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
        fh=fJ+xJEpQDIjMYpCQ0L6+tLCcaGT8QSVFepFwDeci7GM=;
        b=CpEFIW6P/VTB4zKp6VOIl9zeI4obRyDEcOulpdH3FQYzk1ODCQ1T+9SfguSE3PgGzT
         bfdw0103g72+1yllqUfXe7hSFvgQIrtn1kBYU4ww777Id38cN1E2cQkpxg39Qob/vapL
         4gDMtlKr5MOMmjjDMLx5OaPkJfTXL4JDCWpkG3O/T+kFnV5J7y4bhW9uhBy9s1mPpzj3
         zOGvVgn0k8ikDx12g1gvvUBnCCjhJyAjcoRc/Cl6XrOT0BrneA5n947FBAORBJS7ABC+
         mOo0ezDPKvOY3QEObq1fY2+Z8V0GS5I0ba3Y7bS9Xl1uqgwKzmdEaMCLvpy4ZLfhpHti
         VS+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794193207; x=1794798007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
        b=y+bxX3ai8KYCE9IW7qhTIeqvh8yZXrVeP8UrGj46bPBWwcXc5ZOkAUGW0mAPRy+I7e
         i6Tb4VArI6CNG1olUo1HP/UHqD47hHUSBqYBT8DOyB7XBisnHRN6+A8pD/ZfgvlrkR0B
         oIWUS4lAdz375d12AlfUja6O6qDKXqIrtehFAnTuax4/FYOvKh1xAzso6556z4DfUeuN
         QlTKHvim4RVupkWk0FNqFlX5WV5XSkY3KHWxK/5Rs/jHJF9hV+/HQbaBAawwjSINZBlt
         PFXew8hIfwijS7sXuw/c8MPeph+Wpz6Zx48R28eHeewi7/k8e7eaNksVaOVZZ7lFopp5
         3nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794193207; x=1794798007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TlmCUuo4T1P4idhHIQPo0RgjG6MwQs/177OBBGHplIo=;
        b=cdhX0d1QiWqrApr8KXfvnk0aKIYdYxoy2QipRtcm1cMgaGyf2tzPjlQGxXQt3k7rvq
         qveXLtMYfHKt+8OdzT+yavoqRdgA96i4q05xQTczXSzt4lgJlaraX6KM3cwC57yNX6Dg
         vVxAloqxHJ0MnAvqkaZ82gBIZBybPNxYJA6jh2Wo4lVEF2oPu26rVD6Y1THCD/IegSh6
         6r4U84lTyaepOQKN/I3AnUFNfuKQPrf+HptEKQhWcqyhfonhVzO1JdzIntwhc524Yc3J
         dMEVDjU+Nm3eMQXXDjTpaEyDmKOwOl7hRK9ZMsOPGrxeuGBUy3UhtPaPqyOXqff1I5js
         +Vhw==
X-Forwarded-Encrypted: i=1; AL+hErGQZU2NltWxPrUBzoUKceTjP7d0dP2/t3lksV6DUp6xLC4HmfkGd+s5jeGfXc58mx17KPFreWGRQHf6hUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p/ect10PegWwOqPpjrw+CrmYSdkAkP4xS3dwyfLRW3RaOo+3a
	8WHjUBzW933pv/4J7T5F87AI64/pv9cEm8XtI62xC5DJVUDUfoSOdoPol4h7mNUmULtp1ZwfrIL
	QKCCVZSvAsp3kIfploKqcYMMWr4PFAvY=
X-Gm-Gg: AYBFou3RojbB1fI0wUT3uXiNg8jmZeip1Nf9aEKkcSn8ooH0PZRu5HwCB02EB6W0I7Q
	fXnjHlgG8hGmE6QQDfMY03ZsrQgxJULN/7j9iBqxP3UPsJrZX43JXLtl8dyfqQxY7QuLMhPRRh+
	yesTcZCsX6csHnTCzrdKEkRtQs3XSsRtkJluOFD3bYXTm9hrNCO0n17JVhLBjrwRXWb+UqVyb+B
	BSuLJINJAgnOEAobhrarTEzhjLdzh6c5uZyQ7uXaifQUfBSSD+ggrBQgAGiV7AXDdlIDRF7g9Cr
	HYOX/oCu6myZKWSntGxIHG8nGW+F1xhFspC8mtRAdpOhVYx6zzAAO6MRI8o2zBQ4/bH2i+pjrWL
	fbdBI1vn0Bu/lVbYYiWrQbKBKR8fNLw2I0uY6NGxe2sdw3UpvT1AEIw5j2q/FPwGPM02xLkew3B
	lAEgLBe3/aw2GE47zMTRaA2Evs9b5kPeL4MytV3YVMtLepBB95
X-Received: by 2002:a05:6a21:4d91:b0:3e8:b7fd:6288 with SMTP id
 adf61e73a8af0-3eed4abf08dmr2669803637.41.1794193207119; Sun, 08 Nov 2026
 19:00:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-6-phucduc.bui@gmail.com>
 <179414671638.3711751.18312173137946049928.b4-review@b4>
In-Reply-To: <179414671638.3711751.18312173137946049928.b4-review@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 09:59:56 +0700
X-Gm-Features: AclHuK-EvGw9XekZUddhG8nuhu6eLUFFK5k4EYs7hzNBjaDq8KztxIaIawGbN0E
Message-ID: <CAABR9nHWkQdXi=wN8eADuCPhuwURgJ86CuwNiieJvUOBV6xw0w@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Jackson <Andrew.Jackson@arm.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, 
	Tim Bird <tim.bird@sony.com>, Yuri Zaporozhets <yuriz@vodafonemail.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

>
> > The underlying functions already report these errors deeper in
> > the call chain, making the additional dev_err_probe() and
> > dev_err() calls unnecessary.
>
> >               ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
> >                               pdev->name, dev);
> > -             if (ret < 0) {
> > -                     dev_err(&pdev->dev, "failed to request irq\n");
> > +             if (ret < 0)
> >                       goto err_assert_reset;
>
> request_irq() logs some failures, but not those where the interrupt is
> just missing.


I understand.
With platform_get_irq_optional(), a missing IRQ is not considered an error,
so no error message is expected in that case.

To handle other IRQ retrieval errors explicitly, I'll update the code
as follows:

------------------------------------------------------------------------------------------
irq = platform_get_irq_optional(pdev, 0);
if (irq < 0 && irq != -ENXIO)
        return dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");

if (irq > 0) {
        ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
                                               pdev->name, dev);
        if (ret)
                goto err_assert_reset;
}
-------------------------------------------------------------------------------------------

Best regards,
Phuc
