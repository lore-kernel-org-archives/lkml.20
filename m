Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC1627466A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795883; cv=none; b=gkxlHnjL3qyzQY5BcQgTt7YIZery02rrLjkbZWXlvBM9HYZOEfVnnz2tUATDZDmNR1cHNrkG8XoipBzrhcpqP3qV4c5Ji4cGQpqLR/2t7svRa/vc+KeBIW//pcvPumwkzbPuygPjiuJNDpbR1VLP4poVKS7oqRzXG8sJ6+K6Zk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795883; c=relaxed/simple;
	bh=5DogGEaqmhYD22fTJ2ycLzK1jSJrSXPn3ttiHz5f6RU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfSZLBQ0rPjOE1YRTO0fT3+gMOGk0liVLmuhFdWrQmgmacqM6v3QavSivd9GnZUkR0r3rri/tXwzUMJMxZ5ksdlSPBB0qMbsKKw8n4ChF8BMizSrFPeb2t//xIUJrOzb+uI2An7TCQypGlubVaiTUs/KhtD+y7T/VK37WI7rqRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YS4ZW0Bz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YS4ZW0Bz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so1056598f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795880; x=1790400680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DogGEaqmhYD22fTJ2ycLzK1jSJrSXPn3ttiHz5f6RU=;
        b=YS4ZW0Bz7FGbNDNS0D1kfClE3LHfGctchbpbnKJLsTKgX5ObBaBjotQvH25r8Xg+dF
         we2vnbZoXSTNGtxoB4RNtVjkeIC3PtkuHlh58ZPvn6mD0kn2+zA8vIQY43lZlMXkLzmu
         YU/9/t6aeGIr4w/gLBqTSqnFU4FdfUzsRx6rGnwJ0Ym7aTTyfHR2OOCj7JCcK3UDhAkA
         q6GWI85FbcTBI3luG7LhO5bGS6xKOXgLm4SoJW8N//IVCTYh1/I9wdgfXUU52+2I3pJB
         tpQ5BpdReyqzOJlE2WOa98MKMwRnm/5wfDXJVudPlw/X9xB0o1vzhJntOlwKdKKV/yJR
         gwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795880; x=1790400680;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DogGEaqmhYD22fTJ2ycLzK1jSJrSXPn3ttiHz5f6RU=;
        b=Bx82Nd/8pkqJ6T/KiD+oReXmXohr4eC6J3Txd6MHdKh64rdhNjfsM5MdYnAB5uMbUQ
         JIYCMXI/yPWn3bkqsMNTmCqE0tOxhWmGx8hjSLbxNJ5KPaw5/5cqn3riZNSOA4pl14eK
         374FjpKXT23W/WvucFacJp0+MObfVE6jkhomxWpMKOUHbxKM72OoTI3twvUtX9Er6OoR
         P3EhcR+WsYW/quhq78kqexmZsu4+AzZvvdvKyT4O7XcdzDl7gthYiQWLauT9Fh1PoXHg
         MAqvgiVNTFR5jPQQuiLkTEHI9A57NO/KTseRCDNgQwP3izlFQzfV/1kxM1uJrv5uwATg
         UEQw==
X-Forwarded-Encrypted: i=1; AKwUvBwmCpo4lBWCR96zjTC9bLCl70KfbuKWajPtCH0L4vQE57GjKpm0qmoV9uRRfNRWaLqCQFA8sFPMP31hhJw=@vger.kernel.org
X-Gm-Message-State: AFuF++kqceFf8s15uQGPQUKU1IApeFs4yPoT3pACRISGi69BDp1H4T5O
	zAmSpR98K+B4n04t0rP8mL7LUG026NSnDsjF4+Esum0ntNAPIix6PiQcsET339Y+
X-Gm-Gg: AYBFou1RVrHfWfm8J6Ps8UbsA/kBjeqBkc6oQH6/I6r/MI0wugollyMjdTsL6G4qHOY
	cdzy2PlQO0R0YKCITLjMDrTZUoXrRsra0sFwY1YVmnbUH6rWFJ5iNtBB7e5YykKWsWmemz2ylQg
	6zNa1QPcXYWKYRAZcgZrwtFxVD5Pk0UXhMtH/i1pZ6NuM8JPkDY5P+w8HNVGsUckmGnMjJ942Yp
	rG4HJthD/63QRB7hCv1P0QUneAcYxScS8of+9iKXzqxYbWdE4boveQmBsLrn1+poynLrgm7cdAc
	mEUz+aYRVBElaEtm/IViOhB0VkrTKcx2VFYGtDigpZHiDmq+f7lqvVHN54CE6lGE538fYMzlfRa
	Kw/f1EPfIE6OqeoUyfsr9jMoV2CtqIDRaNL6Ojh0rqzLDNc1TVmDGQAiMcG4qmZTUqACmuqdKiD
	TQebKu/vn9D1wnwN/OJA+1WssjPKhSEMRqxyC/6KxMwMUPeIm3LwaTbyks5EYAcYdoJt75DyvLK
	N0/KAcngrPM8f1nwxOsCzxzjBEF7DKDvSJF/vVgWilib/ym2abSWPKbmvX9PCzHPhgNl8VvbZ1C
	iPCkV+pqJDbg0ZeQtk1aMPMofm0IjN+15a1Sd84wTc2bHUL5pWAEnx13Y7+efCn4dQSYeG4xD8h
	6ag1a/qPM5u4BMXYvNVK+SYYVBQM=
X-Received: by 2002:a05:6000:186d:b0:485:c240:20f7 with SMTP id ffacd0b85a97d-4871e379cccmr6707033f8f.53.1789795880116;
        Fri, 18 Sep 2026 22:31:20 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872442263fsm4056075f8f.1.2026.09.18.22.31.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:31:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Rashmica Gupta <rashmica.g@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: Fix powerpc memtrace Kconfig symbol
Date: Sat, 19 Sep 2026 07:31:17 +0200
Message-Id: <20260919053117.26219-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822081253.86256-1-kmehltretter@gmail.com>
References: <20260822081253.86256-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 10:12:53 +0200, I wrote:
> The memtrace interface is controlled by CONFIG_PPC_MEMTRACE. The
> documented CONFIG_PPC64_HARDWARE_TRACING symbol does not exist.

Friendly ping on this documentation fix. Could you take a look when
you have a chance?

Thanks,
Karl
