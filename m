Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2D730C179
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787839348; cv=none; b=aKGynil5P6shk0ecDXFIM9+kzn6vs5TGjwlaambyF/YsstV9AdUZZpUhgvAizL4yyk20vSiZZuWO6MXwqeFC8RF6p7qe/aOaqSz0RrInRbYxknAk5JYDQySwHOY8W7fqs+AlCy3J9hGtMIgv+k4Z9jpcdSKp147jE1X5GelotOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787839348; c=relaxed/simple;
	bh=svxFq16jhgUwujetnMHf4NGpGV3nz/ISyT60/BUazac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvES9d5Zzofd0hSJ+eJdHL25kH865ZV8PZwFm3vRW1dZPMmku07z+tTG/iCIzVYXPdyv9Ro7qXr+OlXw5rVSq9xEV+FDZCL/Ucy1N0YY9WXEMlCzKtxl/gjmePuB3r3Lkb6O0wo3KiU/r3nUsYm8uUo8ltgTqqkgMXoANpxyjTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUJ6aqgd; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUJ6aqgd"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2991007a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787839344; x=1788444144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eDQwLy7w6jGmaKdMCoLcam164nOHb3RGtOUt5TvcQcg=;
        b=aUJ6aqgdc7lB0MYT97zhFm3BKF4VbtAUUU+rIIKwxCq5DLh0YDVTxydMjSS98jsuz0
         igirDowxj076/mH1COYePoY1V9FOv/WRBYZzKhBL0q9uprhWrdk64lHN2wBlJHEYFJtu
         i9Pz/9Qn8rWil2mCwxv8yfFBsPmFU4njR6d7QKzkue2zZ0OHTveI4Vr6eFcMmvWDOd6J
         2gxaf7A0wg5vHnX/zUxkVbtGlpob0Omfv8nuKdyLfCZtbyqff2413FvB/Nwb2pd0Ijbs
         ZSohLWE//HNMvVy018tgKtob6dL9zUzRgmhaO38WMaSBZTFxOTGAkXarbvEjBwAJyh03
         zoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787839344; x=1788444144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDQwLy7w6jGmaKdMCoLcam164nOHb3RGtOUt5TvcQcg=;
        b=NMq6CpNV5n6S5on7Nu2E+RdWVByYGtcfXfDRGCKDgaYVk9pUhypAGFHmS3x5ULJZXp
         /jUZVvOrjYl0icqmizDDnO+q4+IQ1XvKThCUbbaT4Z5zbH9qc3ZwM0V7pOi+R7wkMwrL
         qSWy2ohoV3FTjJffFKK1stoiuvg7Qq3XHlpbwhW3MhoD6/qGoZhSfezFodJP2KQVAnvr
         SWFCYwQNdhjL1xv1JfbGV5s4BoF/iZDqiKh3TAW99zMSp/arxQWIhGrjbf0IGxkSksOB
         8ZGRMzzsvbhUAjIt8cEBGVVP3hMlsuvAphaGGyxnifbgZV7DrstcLwgU7zFq5zT+y5k/
         +QAw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7E72Nfsh0XvVOxfIcwx3pAEaJSoRp709lRdwPUIUE8KoWKhc2lk6wr1TzfSpPGc100mvuk/Pl6tcF9TM=@vger.kernel.org
X-Gm-Message-State: AFuF++nNQeMgF8IyJaI1WqrO6nkAz5Z3/xA2Ci62JgOlRx3VkjqyYgkU
	OY3SjOCVY7QJzFwRmWN3wlgwAkFWEekXBb9Z6vcYQnuWHYm+s8fN4kgm
X-Gm-Gg: AR+sD11IobpJCmkB9ZXCFfbAc9LQ9qs9DeCiYjxOEq+ZClsfLgdCpxdXVgGH2bpMnvK
	Eie10CchuY8N514491nQQHEI+7i0MmjKybCTCRYX8TQYljpG6u8YjASB+r1ijGhiA/gtmakRmiG
	0MgXmCmAM+h2M9Z0niiKi9HqlbAAxpBBZJCdjsQKFay44ZOyPr9V/dERfK62477eY3YpQEG6o86
	0ZOea/CNZgWGnnpQpDRWc74ZmcF2M+jBcvZw0xtyIjvr9vPVZ7FMCVQasKrv2gZW3mZsFZ8ZUr3
	+Rppg3EPisa7t7nuJhShyEQkG1my49IviqeowAMj68efWF7HNWd67qwM3rkD/gchLxOvDN8u0KC
	eOzwl04JO10um6de2n6ROAAYSmcfFmo1tG+Q0q3Cvbd17BA7ox6fsiuCK6lLIqnf+ZJCKySJGcL
	82vK8vJsfsul6NnRxSpPG8+/F74YKfdY00PXVV8pBRQuV4bnG9qUkOF9QKqUb0mTDkpCbIMbqhH
	g==
X-Received: by 2002:a17:90b:4c8d:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3966d1443a1mr31804030a91.3.1787839344389;
        Thu, 27 Aug 2026 07:02:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396759cab6esm2023470a91.4.2026.08.27.07.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:02:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Aug 2026 07:02:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add
 CPG/MSSR syscon support
Message-ID: <9c9982cf-6fe9-4904-b75b-c0725db5073a@roeck-us.net>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Aug 17, 2026 at 08:25:37PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the CPG/MSSR block rather than the WDT address space
> itself.
> 
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the CPG/MSSR
> block consists of two distinct regions (0x80280000 and 0x81280000) that
> contain registers for multiple peripheral blocks.
> 
> Since the CPG/MSSR block is a multi-function block, introduce the
> "renesas,sysc" phandle-array property to allow the WDT driver to access
> its control register via this shared regmap.
> 
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter
