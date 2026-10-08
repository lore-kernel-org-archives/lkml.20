Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBF844B68B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459465; cv=none; b=GPU7sFsWiFC+EhX4Nq8bgDilEmolkASiu8+E80wWscAKjASsB7F0U3uOMnORXp9OUfCmDbKKPZBF3OuULsEdpy09djXZsziMfJjcGpIfSa263E+sKpG1o5iegz/jrDRqVgNxgi7RhvLgechxihaHL8q7ACYH53ZpApLVb437ww8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459465; c=relaxed/simple;
	bh=L8I56akpEoe8FKdFyxPLmt1JKe0R87kKxS1/9O+zajQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0kBqNmVsSKcbuWGTD/EwtVsXIr3JCxRHXsIam6wDXUJghyGN4fPQh7cJ2HZ8+DtvYZX1TVv7W4G3ocfP1L7dRojl+eTzfb+pm/79MQMChRt9EpjP1gq63+PDFVEXqBo9/HbOEmzlupnNXusqFo2eyhSrFER7kjtS9h1EicmALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C19BDD/L; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C19BDD/L"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e36c3478aso757675866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791459462; x=1792064262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AmYNxcjXaMSgu6cnxXXfU644d2akjis4dLwuHYMs4Aw=;
        b=C19BDD/LealFeGPO1+r+iUc/YDSpXv5ca3MoTbJ2z6NAnepk3nV6ZE+ctuuWiuhNmm
         9UAo7HJnCYSC6ZV2PeVTQX1JIfUPazIU64zBye4AXQUnUdL6XyedzUz2e8ssHZameevb
         Csy20VSCnOx2c6riNzShzACGCRAMj7azM5fiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459462; x=1792064262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmYNxcjXaMSgu6cnxXXfU644d2akjis4dLwuHYMs4Aw=;
        b=m3HOpZwg/llTA1iLb0DZeX2KO23kfq6u+jP1mcdIrETo7U/X6dPa0hKP9N87lY0E3x
         OLLuUTk+Jf3KoLwEkgqUD1dvegxTNzVyzpPNk8DAssK0Qxgk2m+jqdh1rSfiSmmYG8Cz
         UtOxIgaihWs7wj/2Hey+QPxK/OWINgVMh53ANY3xfh3O8YJqoppRHZs2vWtAZQV2Hsoo
         V9beSDp0iO7LlP3sgVfN8RgxzLkoO12AU361VSUCc+Rpr2bcuxRKPrc0o6iTbmOChV15
         2v8+yZ6l7UJPwNDminhivMbhBgNaMa0sHwX/LzyX5RaFhgtAfikEj7+l2DjeULUgjsK4
         tz2w==
X-Forwarded-Encrypted: i=1; AKwUvByqm30U/qvXXK/lx4t34qiUNm/54lu/MS2Nw1Pu+BPDa8HJpNAIX2fBiLqk7yT1gGPODC/939UHj5ZGp64=@vger.kernel.org
X-Gm-Message-State: AFuF++nR+eThxjYuScz8UiPDT5VzImc/T/th24UroPjyzl8pQcLroBN6
	WiKkYI6pWatyEdbBKa8PLvBZOhiLd7AMQkgR91x7hq+qKRXZ6xpNUqyAJ0eiVm+zMP8owOUL+Db
	B43TgE8C0
X-Gm-Gg: AYBFou1xD+X7/KSXuJHPQqpz2RwBbbk3vifOdaWvYjupypxohTIwuSS+4Vfv4gBjbYE
	B7pcDCnDWlo3Je9aMEwuI0EVk2hTKR1SNk1A/vh22T+/jTRIpxu4u+e6ucR+UYnBV7OE30O2DQC
	resESfZjiPJYGYq7sJ7lQWQOA+0KDq17rZtsmg67+AZG0YSP70943wbjAxQh6qtg84d5YmQyvHD
	16EDlECZhOOWFfGoi2mYRkRDPMugWEXHLSVhJu9Y6u+ymsQKg/Nid/78F/aOGwaIs++O1Sl5DpD
	0xLP7/jY9urHzMmQweVheAAr9YmEUdgSzZ5dI0BF+WtebsNliStLJlaK5i5f5Ufl++GqCaLhL92
	ej5cidN3cE01wJAz9Hpab58eotEjwIhuQGFmjaY8dpnxyxIxF4+hVpRfpg/4kyMd21NbJ9WRruP
	vhVT9ukcsx2fbX3NhZasvmZXh8Ks/a+P+cEiccXxu/8PRP74mNk2xPkSmwX9bk/A9do52gRrjLT
	nsS3zH+gXvPr/AEIGlJbxO6dv+rCldI2S7xbMw=
X-Received: by 2002:a17:907:3e93:b0:c29:3d59:7072 with SMTP id a640c23a62f3a-c317bd5b6e0mr517341966b.16.1791459462005;
        Thu, 08 Oct 2026 04:37:42 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c1c66f0sm206790866b.43.2026.10.08.04.37.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:37:40 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b35bso5026058f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2FzPIsRd9h0ZhpaWKfSiiEy4QjebbAYfN2XVQFhwEdOPN0IHGswtB/V13DwWpEC8qVoUfkBBoqXEKqPI=@vger.kernel.org
X-Received: by 2002:a05:6000:4813:b0:488:57ad:d5c8 with SMTP id
 ffacd0b85a97d-48c727289e2mr10284468f8f.3.1791459459962; Thu, 08 Oct 2026
 04:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007051726.4154849-1-tzungbi@kernel.org>
In-Reply-To: <20261007051726.4154849-1-tzungbi@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Oct 2026 04:37:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UD=j=_WfWUdJCWxVt7pRC7niJGQiRa-3pwDNAEqvCVhw@mail.gmail.com>
X-Gm-Features: AclHuK9mrmML9QNDDlY7TCLqSLB2eXgW390Fs_499uphvNRX1RfqtCvHOaIcfuU
Message-ID: <CAD=FV=UD=j=_WfWUdJCWxVt7pRC7niJGQiRa-3pwDNAEqvCVhw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: Force console verbose when reporting lockups
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 6, 2026 at 10:17=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> When a hard or soft lockup is detected, the watchdog prints a header at
> KERN_EMERG (<0>), followed by diagnostic details (modules, registers,
> and backtraces) at KERN_WARNING/KERN_DEFAULT (<4>) and KERN_INFO (<6>).
> If console_loglevel is quiet (<=3D 4), the console skips those <4>/<6>
> diagnostic messages before vpanic() has a chance to call
> console_verbose().  With the buddy detector, this leaves only the
> detector CPU's panic stack on the console and nothing about the locked
> CPU:
>
>   <0>[ 1535.991833][    C6] watchdog: Watchdog detected hard LOCKUP on cp=
u 7
>   <0>[ 1535.995960][    C6] Kernel panic - not syncing: Hard LOCKUP
>   <4>[ 1535.995970][    C6] CPU: 6 UID: 0 PID: 0 Comm: swapper/6 ...
>   <4>[ 1535.995997][    C6] Call trace:
>   ...
>   <4>[ 1535.996063][    C6]  watchdog_hardlockup_check+0x1e0/0x288
>   <4>[ 1535.996075][    C6]  watchdog_buddy_check_hardlockup+0xb4/0xc0
>
> Similar to commit 168e06f7937d ("kernel/hung_task.c: force console
> verbose before panic"), call console_verbose() before printing the
> lockup report so the diagnostic output is not suppressed.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  kernel/watchdog.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
