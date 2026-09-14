Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B719E3DEFFA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396708; cv=none; b=FFZyr98YxkwWMVaxfP8CwRQhedwtRQysmsKq/gdFAIuKOjymLw6x8EmNl6Qn+i8/N5kRq1gh44c7Hi35yEc+2stbA+9bgggwFlBq16Ot4t4WXXwyiGKIqNXXJ86bg2FzQQgaOpXEtqtsmmmbIe+B2PE96xoG4+NgpmkRiuM+gxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396708; c=relaxed/simple;
	bh=TtHTqL+UFORJacBemcx0LNXtW0Z0/+7lM+21HB24SRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqzU7aAESA0+D7njBuKpF9KThuYeQ46CRFV6eObpN17Vl7WvPO6JuoSPqnRzSeUEApLispsSaD2tUuMgGyVCKRgwXqculS6+zE8+HZ767SOkCZuHmtIYP75ogbD/gVo3F4bJBE/2yhbnecwRDes/Jsuy5z8yQsjTpDUep6V53K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Daqay4nY; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Daqay4nY"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so23952406d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789396704; x=1790001504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtHTqL+UFORJacBemcx0LNXtW0Z0/+7lM+21HB24SRA=;
        b=Daqay4nY2s6tbkXzJ0vN4Ka+1kIEYnajThgzwV8fysYG7Ac7jm5swh6CAppt8rsTAe
         Vaf8nCTJFAqGhnjETEJJMQFpJuT4qkhJmO6wzJD32l5KyWMhGELxeiyezO9n4BwAjFxH
         dlWYGyZDjxzh4kCWEMQhKIMJdp2zFU1wzoPRmccHq5ILsT23a6B64PfTZKgjuz97F1wi
         9M9BBJF2ne4kR0x/+5qikJ87Gwv5TQuhx94YmcwSdHO5lCTsMKxzpA3ks6ZnYiYzSKlo
         v/hkI7yMQy20vYVOze/cYbbJGyN//+9EjrQX6qqq4ro4EiJUvybo1ZNh+qwcfmXF0sIN
         DUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396704; x=1790001504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtHTqL+UFORJacBemcx0LNXtW0Z0/+7lM+21HB24SRA=;
        b=d7ruf41u4eAmaErnuEIs3wbT34yDE825cC+xeluTK0VcgTCoScBqAM+E+ymHqm5N+1
         BUq/jOdVflnBW5Ass3LymNQlL08BFqaj9dc79L45TWrzyqHkqwISXCBP+Azzr62DELxN
         J2vp8t4JiY/Mx2py2B6KLcGxF2eOSUOdVSuQWkfCUAhlxAsqwp2VFRp9uF/Zf9quajSt
         nl9j+ZwvtBKsiRTNpSm3+Vlw42iZcFr2FJcM2QuvT7tc4xSO7HcOCmZwthOMMtjcSP7k
         jt2xkERU2T3kCE8RIGAI8fcStOnXXLKdb7HiFomVRqUZa1JOdxOimXfBp2OMjXrmqRse
         Jivw==
X-Forwarded-Encrypted: i=1; AKwUvBxjMqwyvdQ36dpwQ0AzoWgwtK3WM3QiqL7TpVF59JQAmSzbvs9/tsfrF7aOpVsaYxTJTiKS/O07mDo10Iw=@vger.kernel.org
X-Gm-Message-State: AFuF++kTpSXHj9ww6i9zn5hu14BwNmHrnQ5qGRI7xfJZUN45CPpBW0XS
	RfJu49Gs0cw3p6fauT4TAApyKOKQDQe2eLqlxw1j6gFZ1QaPz8UiT2FmtZ/0BDcU8Z8=
X-Gm-Gg: AYBFou3ftU/0ofkx+vWNWGP4kt4RIJLE9KbmTMFolpRhJxlcgGqqFVNwTkv5lvKVkHW
	EU414UJo3Gp3hslaS7kSPNoxL025tw3FzZ+3PXwfpMtsNgc+mvhIlS2QoKgQs699wEpB9uZwOnP
	1xvrj995Y4CPV14PlNunEp6/IS9QiUBq1EdHQOdz1L7gHprshNhO+I+m0Z0FAMopdHCNG7wMgO4
	ZVmu7QTTXb89qN6szPCbdrKbVtFbasIHn+1jdYu5Jc2jFC9SL7MBJSBM5DswbKOParLjFLzTvdc
	viR/H91Nb0sY3GiXJkQXm7ip33IVqXFLIgaKFl0aPcF5Dgwbn6lw4zqsjnHBlTduUxdFGOm6rkz
	hcar8GonEnW3WHrTA8X+feTNaQf4OBaMSI5Ub7Uhe6MLxwRdzveVvy8LCg6jzYPZ1fXEc5WGaw5
	QETPnNUhKbKKM8RI/ehYdpxbZaCKB1s5Z9ImmfoTM3qmzOPtCE7XOU9I5J4l8/Z1756SwA3u8rc
	O2+GX8oV5fm2YwfOdd1MG2AeqFGPxKOckUww41shxCsadoLJ+hJ/bk=
X-Received: by 2002:a05:6214:8613:b0:912:12cc:33d with SMTP id 6a1803df08f44-9122e552dadmr42040046d6.23.1789396704371;
        Mon, 14 Sep 2026 07:38:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d389esm95618176d6.42.2026.09.14.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:38:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:22 -0400
From: Gregory Price <gourry@gourry.net>
To: "Zimo.Lu" <louis2665573906@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm/memory_hotplug: use public nodes for migration
 targets
Message-ID: <aqgGVIJwV9wt8gon@gourry-fedora-PF4VCD3F>
References: <20260914074323.3567923-1-louis2665573906@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914074323.3567923-1-louis2665573906@gmail.com>

On Mon, Sep 14, 2026 at 03:43:22PM +0800, Zimo.Lu wrote:
> base-commit: 38c7f48162aa282dc6a9edfb7011378594057c10

This commit is a random github hash from my v6 working branch that no
one cares to (or should) know about.

I haven't even RFC'd this to the list yet.

I'm happy to work with you if you have feedback, but you're getting well
ahead of the work here.

~Gregory
