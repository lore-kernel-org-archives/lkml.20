Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6121A33A014
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968028; cv=none; b=SyH9Kn45Sbo53vPsC1wRcYJptDuFKFjHpDlR6F7v9QkvCIc8hFJFoTzxY5LxLAWet+D8uWDsQsEYCx3mYGTqX+gbawqphhK7t9nP6om26kHhJRq7U9bWftnfP7SjLWFiVVVdHWii1H9j0Dgf/yU0HCyCVkr5vtixk7YvvEiujK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968028; c=relaxed/simple;
	bh=NMIEtDYycWmV484GpSBkjLc+PGlo5yjc2c6VK3ydHI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIz5gmIpFc77s3gIF+Ip9yuAsrRNxBzEP/rbzWGb4yw1bHk4JBPLn33QQ6IQodcTRWZaqSpDmsgtqcBmMq/x8CV0WVqxIRNqKLbE8QaWgpWnLpB/RQY3isYKIUnmkEQ77CFQWfhcvHXDW9utHEeSyCMIJ38a7LO9hI7WQgnp5CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c7afda4515so3410117e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968026; x=1789572826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=seHJEHV+vbkaWfT2PmVXZhUQLZRva7SU7v2d3J1NVwM=;
        b=RltxA7z3rnuKVrzz/aOJVKnLYvrgAN1pfXt7m1NO8iFh/u8CUSBPlbtKeUW/gpiPiy
         wLC1hxU9HqdJ8kUVVMgkgHpygW4uwM53mTGBO5TbvXUfZYJZHlpXxYS8u8FjoOXJO64E
         YJi7yYXRGogo8BdA+cSLY2q5gDoDm5na5fmFCkARID0Ek15fB8VIEq5EHYMV3WwVhm4P
         29wlApM354UNWXahOQKLpz7oCcKkM/1vhxzamiQg9YmY04UpCnnsnIi1oFQqrjldn9Y6
         xWjQQCZlsH3+bDn85rm4cqu4M0Z5NwZ7mtoz9hZGP7NL4/t9SLltm7J/bDAm3PnmTVvb
         bGPw==
X-Forwarded-Encrypted: i=1; AKwUvByglLtpHM0ojF13Cq+Efovg/j1dmH6M5S0hYMnAZCT1mQ+lrs9zHMnE9pNTrl/h73Rvs8mQQpEPRRFa39w=@vger.kernel.org
X-Gm-Message-State: AFuF++mmBICU9SlR7tjwuOSFtd0BD0jAPSuIbZYRqHCn+O+PuCLGfd+a
	/isSVPaQzxg8PRmLOOx0AUjysTMvAWMnmbBsFCp0FzjzGEiI0otoSPwD9bTKxXxM/ho=
X-Gm-Gg: AYBFou2CYfrN5YQVMf2w24oJtOG3bEY4O6kvOtCBylYOGtPqAzHbhfhk6i2TBaA8Adp
	biA799b+UoRUAVYi3TIF3Eyga/XaIuEJc0FMvt6JRClYVDVo2wUHOMGQ8CutsnZ5aRqDbyIVbTV
	wf0f9T9/A24EHBq2EdY+ANYYD9wjnSo0PbTzJv0MPa9zgeNyIONCsjEdClZtPwVoPZ/OOPdJk+Z
	qOX42yPaMP6x7dXdGlwCXgFvF5S3Ilrlyp3VbMyTF5LjGuZmjaFlw/kycOCPsLvm/QfT7QLbHyA
	+fPJNTWfRAgMjNTGDonPFigvILCtApmpi6qj0jxHUsW6iD4t/KqjBfKRdYrgn9/LLHnBQBA0V6c
	9nbppzsWy85QyVh2xVYTZom3s5yOAsRYPGuVGFLux42Xk23YTXDPi5lEng/7ToApw/UsXiiPv01
	ErOSFM8n/jIFTfZ/paE6WjE985NUJEQd6W3sAZTvpNo9v/CtCTnKbm7lpDB68oTCXK2DBo3Hylj
	1a4UCIQJW3eTAehKzO+JYufYjBuf8eKVY1igPvO
X-Received: by 2002:a05:6122:32d6:b0:5c7:a3a3:a4bd with SMTP id 71dfb90a1353d-5c7ed3a528fmr18545879e0c.4.1788968010123;
        Wed, 09 Sep 2026 08:33:30 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm12789853e0c.18.2026.09.09.08.33.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:33:26 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c7afda4515so3409794e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:33:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdOW/wVWwjS74AgSYRiTZowFO+Ee6kuX8slUwiyAwafVlHLgwBAL8w1pu1Fn7whQ7QbsA1KEkLGjiisHM=@vger.kernel.org
X-Received: by 2002:a05:6122:4f82:b0:5c2:ac92:eb18 with SMTP id
 71dfb90a1353d-5c7ed3f6d2bmr14626613e0c.7.1788968005930; Wed, 09 Sep 2026
 08:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:33:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
X-Gm-Features: AcwNN1UdM4cUGYydPQaEaeecPmIzkWQH4nuP4PrjWCOhXFLM5sncau6pHe3OeUM
Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 18:23, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fill in missing #msi-cells = <1> into the GIC ITS node, update
> its-parent phandles and fill in 1:1 msi-map .
>
> Fixes: 7fe73a3a3f2c ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the original commit is not yet in soc, I will fold this fix into
the original while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
