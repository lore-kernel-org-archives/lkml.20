Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ADD480947
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630825; cv=none; b=F/3Z/rDpmou777DTKGHHpgxfmqE6FItQ4b4J5d4UAbhRMAqqddAsL6vlCXmWjIEzdNEcdE1/I1XOPutSzuZyaljwJ1cum+G88l4VPHXtF9PGZTLJjpuuKbkpIW4K8ONHP6G6H305miLDzfLpWKbGcn9q6mTw7DqhanRV3jaDK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630825; c=relaxed/simple;
	bh=Eae0L8mQX/HKRxUW9H1daR6Qu5pY1s+6r4QDDDv3MFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6Xs/BhZF83ZjDbnXZQwCAhMUUbzMeUE+Oc3GiQdKvr9s/Xk2B0xk3Xc6g86tVljJmnhSOzBgtREunbSYmVhqHytcxp9aicPsaUIlbk1ATIYC4YFpBfoKNmDDr9ogOJr0mNW72EUmj0T6NHf0IJxwn6jKpJzPmkL3d9T8IbC6Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so133732e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630822; x=1790235622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gAuDoBRaqindrDQ1hoRg/L72SkatQaOp2VDi/OWJcsw=;
        b=jvhTfFrMDpr/KiD44LVdideJC3lhWc/Tt87artk3fL54ka2+f9v0OUwJYk3RJ0ImcC
         KPiCKnex8Y8LGNG+kBXReB5Y3F/Q83ZGqvMjl1GGinnGz9njV3qeX/xvK8EMJ8mdrwEu
         GlUHWPI/3u5no6h0jXHKvWIRf54fF6A3fJeBuZxsXRofvmtvkL2jQXqmjYXaaBb7Ov7y
         RYKjjFfxfJDsW/7TZARkuPQttS+8MLPz0ufzXh1hXwKlfo4AXwRHx0DrMGZydmmrnOWZ
         7hHADy0cX5V1WZUCPe2BNEumq2LrJeGdQV0ufF2nvDIZq3pTQWxKCKcx2a/9qV/7Mm7J
         zL/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdhJOHqVaEkzwZAydsq1+zXU+gsDtjXjOylK9JYaoQLhnDPLroQENefWEASuB3Bw7/SDA6W04TIgXShjg=@vger.kernel.org
X-Gm-Message-State: AFuF++mz0se/s9DDVk+T6WRpRUMaIlm4laFe9qSL0sGv2H4pIYAqWLoZ
	yNEggvaEtKNP9vINy0B7GcPfSKeDQ2doWpxaAMEctYNcSJGNTyjksL1HKBXKbTWUbpI=
X-Gm-Gg: AYBFou0yw5kt4hcspnFx2zW4H915JRzbpPnBh0rU4EeMacCwILOIb23t7RTZaRG6qke
	JNpMyKUdXZpLgLx5zcmpO3jmxi7SVuWnYMe1j0+AtejgB+5ZD1krub1NaJQPJg/+FkF+KVrxaAy
	ayHJF9LQe+woCiskfs9hya4p9FD/eI1UFMDFTXMWdVseeDPTxz7OeR6zoBM6qrs3F9QdmrZXNmw
	mL9IUfY4wOCamMKTZVXjlZXdNOieIQeWQStfQEiZPnsqVCuH+D7bNHslp8b++qRiWukt6UYxvSq
	Lc+9QBJpGcbgs9CavvTxPb04lYI/Dlrihin40xzQ+yn+dPqlJwDYKpbM5aFmy7Y3xnfQ0FSQRQM
	cM7AOZpV7qDVSXYglh+JgL5Cfwwf7W/MbNbrGXw15i89lfmoo9i0wpkKVxfuGg2Nr+wBOTzUOC4
	MVfgBFXmYZ6IM9dIg2/qFJOC4arfkY8VlKX0riz6uhAfRYTWF8d7ECjIrk0Wh7PsIwNf5gRa0iJ
	0JoBtSLsBpNNyG8E2u4NjkaAfTdu/XzBaCk
X-Received: by 2002:a05:6122:e184:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c99ab0ea4emr6904118e0c.1.1789630822278;
        Thu, 17 Sep 2026 00:40:22 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a5399d46sm1915242e0c.7.2026.09.17.00.40.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:40:22 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a03fe69236so193184137.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:40:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIfbsuBJsXmubEPBcucrmgRBhx2aP0/TrP/MpmjWSf/TRGjnDEGD6kTeGQBqk8Szeb3+QdKMLJOoyhgoA=@vger.kernel.org
X-Received: by 2002:a05:6102:a4e:b0:7a3:3d26:5c4c with SMTP id
 ada2fe7eead31-7a33d265f35mr120142137.22.1789630821198; Thu, 17 Sep 2026
 00:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com>
 <20260912191442.99453-3-wsa+renesas@sang-engineering.com> <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
 <CAMuHMdXcU3Eebhb3aS2PFoUdZsK=cmU6sjAFWhMRiPB9eczKhw@mail.gmail.com> <aqsMWn11lSgnNuVR@shikoro>
In-Reply-To: <aqsMWn11lSgnNuVR@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 09:40:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>
X-Gm-Features: AcwNN1Vf8usG3tBt9wHCjscRiFJe7JD7786vCcIJCLuucE8K5jh9OFuAaTGdfmI
Message-ID: <CAMuHMdXzyn2-bkky_wEC=5DdNFYo+QSroP3gEdmuZ6bhqQC0vA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 23:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I have been using this since quite a while on R-Car X5H Ironhide:
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So, this applies for patch 1 as well then?

I don't think just booting on a system with a single spinlock
counts as a full Tested-by for such a complex conversion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
