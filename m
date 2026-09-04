Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8847CC96
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520296; cv=none; b=ZZgWPm397sCaZHXPAcZvrXHkvPeqims3Mz8oorS5K69KefKjCU3kjwK6lY9sKsxG22/irgtxDhvGsgT3mubdEjTHY40h96ruBIwiA8hmAKZrpNVyH0FJs+JNOCwEyhCCaBGQvocDv+52Ddp78r0jB2FBQ/wgkLyOcy3CYkt28c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520296; c=relaxed/simple;
	bh=kogY6TLSuVIt/3sC1dBhtpJjb2uFidHomRE45bNUWKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tq/GcEHkCmTvkViv3FEmGRypPNyfA4vxQN37+5msFzLAFbgz+OTeEspbPOl1ogtprU5jLRGsuu6BnRZftZIBlPhwqxrRQwYrACV+0pDd9bzxAa9eLw8+ikxlS5sX+Zo1vMMtWWRipNXg7pArfMMJweuHOjK7/AJ9w1UNXciZlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so817853e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520293; x=1789125093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEMMEYg5UPRjTvJH6bpCIIVqiRbyQhNHEX2ipUmBsbM=;
        b=a4aVO3emj01guLKShxrPIIt/KUGNiTb2GbvfLsdwynW3agFW46IytDRZO4KXS/vwAt
         5zPOJ6laWQQ+GNaiUQOQYEfff/D7wOEVzfh6eD/0r2VNvsNrAGV7hVOTtBzd2+Aj+Dep
         SqibvM65wmWPWqAyXNEL0iSW1I1wiGOcmAmfMP6f+mrW/w49f6Ddoc0trWtAcRtuRU0p
         KXcul8mOhzoE/jKd9f476FXlVWWnS7mNqv2gzWBzeAJ0M+0t9o+T8bFUlvDxZTdqKhz+
         EB/2hMN+G1hnIm7sfJJN/ozI3P1YTP8mguq2p543pgVbIlkQwxZixyml/0vqVz1AVyWY
         TuhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzATizg7OK9QSSGZTxL2NF87kofLG600l/vYZLnyTHM08GlFn6o+KRajaQUYm/2wpjZwr1qpZbK0shMAvM=@vger.kernel.org
X-Gm-Message-State: AFuF++m7WsHJikSgNEb1ftKS/DPfYxPa1l9JAcxkpUKbPCEr7Pir0sDv
	3NMJbvLOPxjSxRcoFZOy/iIuysHjNcPwpyqhNGM/QuqcfLyFsjA74Grj5f6GuHPM8AM=
X-Gm-Gg: AYBFou1H13SVR7fNjnm4YMg3EWfi7t8xxMMaIIw/EXOn2WTiOyWDcgagMWsAJIQdK5y
	VMujlYLSwyAgLVUmMiV2v5m/xCJI6mjXByOGrAaejE6qGQn7YxaK+OoL38pA2Zl6OLgESNWuvNA
	Ml1LlGfKEPZyfi5d/NZXJ3f8kcA58598PCGPgZ58Nh0JKJpwKQ9vSuJe6bruZfxMrDwS/u34GTH
	snDYVEM1d33hINmdv/Ox2ei+H42oYqtrzBEuFOPons1ZdjVeB+aVAbhWGvHv7kilysVais0ZYTY
	/PB5p7ZqtLy11bUm9rHyHv1xzZNse/f3oyuSd6OpmCmzEPzrbfgHgJK8aDJgQvRuaAJnKubkOHP
	TybXbNwApUUvo8tjRAQVxwuGA/yIf+W6uEtBfGCk8ByLV/L9HwpL5pbxkMSwMaRNcvCyVohNhE9
	ex+Erv0WCXTG0QWU/ul0E/Z87/otg9e9dWprR2pC9k95j9d28T2vy6CrXMVaweZTXtBdbmL3ck3
	Q7Cb6hXKbrQfv3btyrHEjydsw==
X-Received: by 2002:a05:6122:c9d:b0:5c7:9445:f468 with SMTP id 71dfb90a1353d-5c7ed7eb340mr2388203e0c.6.1788520292813;
        Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec366bb5sm1780910e0c.13.2026.09.04.04.11.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73720e58dafso577437137.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmch4eBuwOxDk0AU0johTLCxfzUlD0dTP+HnRJLLVuJ4RdegprWE0tTtVjmDFnXhwP3DofkDJ7fvPkXXc=@vger.kernel.org
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id
 ada2fe7eead31-78a4a6e83e9mr2237001137.2.1788520291864; Fri, 04 Sep 2026
 04:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:11:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
X-Gm-Features: AcwNN1VWCzUARGrrpc_Qo6UxK-PAKa2dMGWtQC_aDHn_mP1ls1EOnA4D533OdMw
Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car
 X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Jul 2026 at 17:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
