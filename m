Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C757E502778
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745284; cv=none; b=qYX1Gf4jMR2mXDQnLoyMAxezWWjJj6jpgdDW2+t+ONboxQvvv0Z9Hwf/ebSvQvpMjNUH5sxbHhyvc8XECmfrq9ovg/SnfrrHN/Km3hl74bOiJN10X6qmzmX/vMCpngC70mazo0qhV8nT1/Fs6oZPowKw7bKHBoQx6IC/jQHAcTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745284; c=relaxed/simple;
	bh=/N+Wr2lqiEc14QrSYc6Mojm+2/XyhAhYfHXp8M+/36k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKQUhI6IvWgvuhc1/l5/lfbVgcZiY4fZw9oZUx0XtYTExB9EwtBRcO3X5e4ApUYca45Y94iAtw1+FFtNH/7zyQJKEiwGqpMA52iQV/lgsMylfHKv8PeT0N8D//tgizHQfAq2uJopAcUnj29H/rEFIqEpTLMQJVt4hrUl8j+6xD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9833bd5daffso160977241.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745278; x=1790350078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjakjLYspnOJ8onlNzONdcAHxzWjqeFinrALgAM9nQs=;
        b=jUBlK3aw8SLaqLenZXaqowX+R+CAB/NQNI4uS9KlyZwNhouoav+zf/nvDOOwi8jUUW
         viWhBvWUgCDQ8Qc1yABDmOUw9vtlUSExvpykgi3yZrP7ZlwlRRQQUFYLo0kfeTmyPmUe
         XDgF27vB+uR1dGB0iuVKYo+vtpAn2A0CgcScrowKhvdWNJqc86fzqeNBPNdCopoCepgJ
         DhewlJnajM898Cup8jeTSmBvP8FyVnQPQvxbu3kbgDJEds+B5QGeteXBMX8VVHrRduYX
         p+jgjgMag6QNtX1sLzzuxjB2KgcoBMC5YJ++0AuuapyEX1TfmvolPQCmcOfNCoQ/pECI
         ++ag==
X-Forwarded-Encrypted: i=1; AKwUvBwb/H2tonEprXlQDFa2/DQMX3vmTKVoefteGtYKtIIALGW2ZFpjzHYzA9BR6YIzMMHUgNeXQfoR9Nm1Ceg=@vger.kernel.org
X-Gm-Message-State: AFuF++lGBwoMUzGr7qpNjoFafvr0okn0v5nMNSP/uw7h/EQEUcp0ih3T
	x6PR7BvUYcmHuzXQHOi5g/Uo/z98ivMzCK9fACljMduhhDGkJDD1K6+qzG0Cd3qNRR4=
X-Gm-Gg: AYBFou14QGsQ1TMEOSqHxCN5NBz06CGuj3nzkAbEZc2NmXrkLv3Tsjw37F0nj9X+Sz5
	ja0FuhuXG5dGvaDM5hOLKjBtxKqu857vkZ8hx09lz9GNdemk36zvAVxPP1Rw7Oow3MWCeivLiGc
	6exS9YmC9btJajSeMmZvF3WwNtRjN7KebYo4iCxbLRWuQWYLfOAqkvoUbMplRKsX+iRB1jqks2Q
	Ew+vqmPV7PjLIuOSfaD2HVadqYvvHuVGD7/s9IiBLRUpFOhOq5V4RTjA3lvJ1j66mSSZQ5OjanL
	0Qf7eU8YSsfb5rtzuB2/ozDc0QzzAoXfgCEcw+UrYU0jwORCn+obsFYYI7gK3Jp0OkGAnPCl1Mk
	zlkP7d+s6/FIBQJUzAYSezBF0EQHuOYSleuf7gcIHKpx7eHBuocmdywvpovlcLrA9cflBdB6NA1
	AsA12jrMI7tXY733voQ3oINETwe3krAN6Ogmn3GifmK+vMoWTwc3WJXn/MFasD7ncVYaMcDtQm0
	SQc6xh1qVc+WEJ1EJsX06gVdYwRm47eDtMk
X-Received: by 2002:a05:6122:130a:b0:5bf:a179:b2be with SMTP id 71dfb90a1353d-5c9b8a8a64cmr1225369e0c.7.1789745277680;
        Fri, 18 Sep 2026 08:27:57 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98337e3835dsm1922445241.12.2026.09.18.08.27.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:27:57 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so401775e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:27:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjUbhtJu8JtNeudJJPlpWMBMgPRo+oDQKLOOiQOC9+bQwdFBlFjNX0amHULX31NVCAvHGGkdqGQm8oHA0=@vger.kernel.org
X-Received: by 2002:a05:6122:3d0c:b0:5c9:a617:5812 with SMTP id
 71dfb90a1353d-5c9b8b73530mr1233261e0c.15.1789745276684; Fri, 18 Sep 2026
 08:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918141557.3022820-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260918141557.3022820-1-peng.fan@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 17:27:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVz94+WKGzsZUhCh8t-YxWJe+991QiSTNbgm0B_DxvP4w@mail.gmail.com>
X-Gm-Features: AcwNN1XEDVdZFSroHZTnJUBYk3oywIwwiJ3nogrK7Tf7Uo1t2UiQ2DDcnuOLA4c
Message-ID: <CAMuHMdVz94+WKGzsZUhCh8t-YxWJe+991QiSTNbgm0B_DxvP4w@mail.gmail.com>
Subject: Re: [PATCH] auxdisplay: panel: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Willy Tarreau <willy@haproxy.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Miles Krause <mileskrause5200@gmail.com>, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sept 2026 at 16:18, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
