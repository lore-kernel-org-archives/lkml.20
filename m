Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EBC46AF00
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404795; cv=none; b=DuSfTP1XXuT6MpeTFmiQA0Q/Ahpr2wrf1exlJ8+jiwElf2XWL/P0uDAdzZ9iFlSQ836og+NGLDkxiKveNUaO9gTcOTLjyJVn7p8UBjp3WJCmKgi1xV7Ah5KMYDfmaYjozOMkQbb1LO7P8vwsxm6SODjRMEQivEUQ2lGZ+CW5Jbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404795; c=relaxed/simple;
	bh=MHRL5BbXVh3Yy4fuiiJxCc1O6s3ax5adZDowYCUDKEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXMYzBExbxM/0R/NOu/7mq/UAPLY1OqMALiiJCZ6iE0MYWm5EW3HTP6s57CEOabvDGSuXxRezPK1QDO4sYEn82p6KgHUAbTDXugPwz9LitqpQpPg11tOQhIHcZknzmo2BFK4enz32HgvCYfyMC1oS+Hq/hhmYAF7lZSs1ddnNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso566086e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404793; x=1790009593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NfxIiMuQDiqgQaAeq2yHqZdFbQc/UNrumMADff4NP9I=;
        b=THRfr2OdSsp3g7wf4S0yRiRWXRPZoGeG/BEybhLZ/4uMm5vcm49wPRIWBhIG/p2EcH
         evwbF/OYSqqDBwgyBxBl/LcVHgbCURJ+uGf1d03Tg2DfsFVCJzbYRwzStujrisvo1eOe
         j1hs1n5pAbcfClkYbv1sLSb/k6fyrsjYZxjV5K1ixu4Q7z8r1IBRHarq72tTANm0n1qF
         YXbnsvTXf240Yk4mUdQ5HRmAiOjrZfx4KKnpdV/atfQ+Hj45j160A3lUbV/Od4kuwg42
         0/PEaEhKKwU7iMI7B3U+sUexbDHc3RFpG4fIITyBM5vKmL8f0TomcnUdFwoT548nPxwp
         drPA==
X-Forwarded-Encrypted: i=1; AKwUvBz1VTIzA/8YkiN9IsNASFwUFlktkejcHXM/E7uRN/fP3K32s/DZLGuDjA9KWjOnYy4cDsdT9BrumEcmqVY=@vger.kernel.org
X-Gm-Message-State: AFuF++mzur//UnyxqjsQyoBik89iJc3ueu3XYnRZ3yEX54wz77kB9Gis
	ocEoHV1SEM4K85Nt+4Mf0M2mR6tuBqNskdyOMx1j0xE0Me0xWBu/eAxjfA814UJG
X-Gm-Gg: AYBFou2sCLbDZ6comcyu0PHuGr+0NNmfL8pQzdkT/ndr6Yz5a4j4k6NDFo/KcYx9GQm
	31BorFLXX/MaO4i3ntjOYtQI16fFgRULsM+ujEQfopoZGMq2itEV4jvwSZKJoLb7IBUo9vuY3+G
	YusmXbEIGU4hXvg/goFxTbaGo26cBdlvA26SQFgRQplC2j6mlWSnW69LXL53Efjm4tO/khkyJLU
	VlxdD9B9k3xlYk1d1H6A1LBZFNzEvSslCPL3lxbu3Lvh73Ub4fp6vxoFnbC7OSfiwrt0VeeG5YF
	PK/be9Wm3Ed1/sFjsG7bwLM+PV1jC3mm20KFqPHV1jLCrL33caLWk+U3f5P0UNvL4h6Em+15S7t
	vcAzFzwgIoQtEjf7+TGogNB9GfTA11uT3dIJEAOGFxYDKhdXXDSLLJe2oBl8gOFcVtAZJjRRbWZ
	Mi5g66vOL+RyveuVI/2a3S9spYHy9/8Ry0PemkBvLwLKDfjed1bv/1TRrJqtzAl1CwdWBkH4Y8i
	nmdeCY+H414+YdIoRDRCJpqufkOMaHPaiks
X-Received: by 2002:a05:6122:616b:b0:5c6:5daf:52ea with SMTP id 71dfb90a1353d-5c9820dac02mr4351582e0c.6.1789404792626;
        Mon, 14 Sep 2026 09:53:12 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c846e05523sm13544012e0c.0.2026.09.14.09.53.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:53:12 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso566073e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByXMUh9ZOa3ErCDfLP6RYaIfe4D3siThjCjBk7a6vcOqeofxKPixsIwCIfbK/ZYzuqWZfV+sk97oHQCLKw=@vger.kernel.org
X-Received: by 2002:a05:6122:d21:b0:5c8:2dc9:f8d2 with SMTP id
 71dfb90a1353d-5c981898b18mr4839334e0c.0.1789404791699; Mon, 14 Sep 2026
 09:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:52:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8oHnOZtaZEhT6ARw4jv8E8TCW1oj3=-st=H5DGYP0Qg@mail.gmail.com>
X-Gm-Features: AcwNN1VTw_3ezXn2Sdyot4rz-bUBb_2ZP2fpOPg3aubUSTj19P58---m_IGsxkg
Message-ID: <CAMuHMdW8oHnOZtaZEhT6ARw4jv8E8TCW1oj3=-st=H5DGYP0Qg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] pinctrl: renesas: rzt2h: reuse helpers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The PMCm peripheral-mode test, the PINm input read, the PMm write, and
> the PMm read are open-coded in several places.
>
> Reuse the already existing helpers.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * move the PFC read helper reusal to a later patch
>
> V2:
>  * pick up Geert's Reviewed-by

Thanks, will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
