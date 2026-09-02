Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BFA477985
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348970; cv=none; b=c9n9R9ZvUijQGCmK9r1UytpfMrbzxBSSG1YVG5LMJSiTxzL/y4XJbCTk0avjjf+oAmdvBN2igNmV+mPqlufLleXtvHwzBgRFc83ti30Zv1W78wVQxrjWhTKxwKaZbPmAHk9XFvBWIIayXDYNlisvRli2+W60fiYIO2vRhjNoNQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348970; c=relaxed/simple;
	bh=wyPHokR3tqR3MR269liqtkoSqy7tkjxLQyug1Wc7V4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lESRuuqNQVXAhwlz9PvkjxNlrDgeKLm8wUgprkYw+RfAiRF8IsLaBZI3+jXzpO3QYwPZTVG3WCc0u6Aedv5DFccOdgwMiQGkFjIE27ROgO9PTlRfk3RuwuTIEV7lNkPb6VJUpTg5m3jicxHEdzEq5lHhIWq+WyB+T1ZgwbiAg04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-966e7380109so507092241.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348960; x=1788953760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wG2vzYUiYB5Is79tPSwDBrckmDl3YMELkXESRZoQU1g=;
        b=LSosberTfFMo33Mr6uK6GcpR2A97lo98gh4AajI5N4Cy9GcUEtSmZZmVwbgXHPTX5d
         Sg20CLSm5Gi+dpUa0JNpLX1byjIc1mVKznix/5nAodW66SY9Dyxa1q0QFzulS2OILaHE
         MOdk4hX6EodMOH+WySsGnT7exc2T5RmDnyLRerY18JM4jOvY5wdXjbkH48xt1aI5ZM/P
         s/vS3mZApJrc7K7ODmY0T77ebA/srdKmZj5cOi1PvyCFME4zOrMUsQF2f0OnZGbZpCAE
         0u/uBFnGBJjkOPl430GM47oonBhzlNkbDmjekOumx/FHI89mjUmmpRuSW8TzbhS/WsH+
         oM+w==
X-Forwarded-Encrypted: i=1; AKwUvBxTklkz/awDBhPun9yNOggYwVt+2OIg3aapsvdhmDns+Z4XsrHebmBeHAvtEB9Zul0RWvStGIOAvhiP13o=@vger.kernel.org
X-Gm-Message-State: AFuF++k7W5XwaAGdy6I8DN1zPRLvNz4VnAW8rTU4ELWhdK2FczXowt6L
	9cDF01J2jSptwZPznUEZ4D3REEBaJjzGkEq8ZJLNll/aksfurdgQLYWU48etIgik
X-Gm-Gg: AYBFou1lJpdFqXdeAuA2iUdCL3Q+pK1Oj+iXbwmrnesxoAhDTXQrozY8HKlHfV8Ttz7
	IIH2ftGHlSqMHO2gzJls/2JAuWS9Y+vSUODdGAgbacM52lpr5VhaQ9HH0tRw+AD75oZAMvJ2yz+
	1E042/0R4jWkRbeucRLWgAutEhYPWU7llMxoCSIuS51KmXBVIeEsbZV8XY9nbeTHeeRQ0omfk/Q
	/hPZLraw0OuXHGU06vkuCNakfnCT6t79L722MZY8EIWiDbGVCjoM5jS4eCP8N2Ao7NrTETlBNP6
	rKBYh9p1UKf38l4oNYL/vO+Jx42TVnqEOrm5v+tAclNsn77NXp1lSJqNUoNY+pitk1vp/F4UO2X
	nqLiP1XBCFt5UYPPt7+DdyvAE107y+1hcaUMznTFP20Oy+J71ISP70TEFQN0/mI0nMjdhZFDfKA
	E9RYV/9dAiCITHPNWx2kXU4boJJcvKH9k3mmNbgvNJ75/qgcJxxcIltgnj3sPRqiOufMM72bg3j
	rRmwfeq+b7eWMlVtqm23KHKtQOEww==
X-Received: by 2002:a05:6102:f8e:b0:789:100e:3d0c with SMTP id ada2fe7eead31-78a1f437ba4mr1595210137.8.1788348959707;
        Wed, 02 Sep 2026 04:35:59 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a251ca6sm1889821137.4.2026.09.02.04.35.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:35:59 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso702049e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxgKkdyuImlQXw8RoWSHohPDDJ8XabDuKbCxheLZsUUNTr9xXDHOkM7xjamDK9UMW/fxPDPVQkTBzpIDaQ=@vger.kernel.org
X-Received: by 2002:a05:6122:489b:b0:5c7:98a9:cf95 with SMTP id
 71dfb90a1353d-5c7d27e3ce2mr1779605e0c.4.1788348958056; Wed, 02 Sep 2026
 04:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:35:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3POZVM4YmSN8r4rewPd9+GSnUvyL2F8oSqHzjk97Dbg@mail.gmail.com>
X-Gm-Features: AcwNN1UdAkMRtSpVoWeT4pt6w2QrIFGJ2Ah_h0QXalst1ZeOOfhDZh72790D8vw
Message-ID: <CAMuHMdU3POZVM4YmSN8r4rewPd9+GSnUvyL2F8oSqHzjk97Dbg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix GBETH TX scheduling policy for RZ/{V2H, V2N, G3E,
 T2H, N2H}
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Wed, 22 Jul 2026 at 10:54, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> This series switches the GBETH TX scheduling policy to
> Weighted-Round-Robin (WRR) on RZ/V2H, RZ/V2N, RZ/G3E, RZ/T2H and RZ/N2H
> SoCs.
>
> Since the GBETH nodes don't currently specify a TX scheduling policy,
> stmmac falls back to Strict Priority. In that configuration the highest
> priority queue gets all the traffic and starves the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation showed that only the highest priority queue advances while
> the others stall for more than 5 seconds, causing the netdev watchdog
> reset.

FTR. fast-tracking to fixes for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
