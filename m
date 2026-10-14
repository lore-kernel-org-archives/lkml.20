Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D98548EC74
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009831; cv=none; b=CNxJp29wuHjXavq03z8T0/6JQcsBMxe2mR1Riu0ffGl2V4u6Eunkkv3wX8yp34vbM1WEaTg3P+AvkTGgnuRYfFLqVmPhRh2BgeJOn3RNfgB1gIpulA+1GZQG1/g6BaXK3KXWgKURCbVR0/FF9phbrYku33M/bA+9r8e310zs/fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009831; c=relaxed/simple;
	bh=m13NBzcveU+SKQE3j2uf1MErjWzIeo/6YD0bhzhmMlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjYd7ujnfq8Ykq13Zdp1JmZLBypiuwLhps3YrlIyTc9JeD13zkcvWStGBw6yRMQaIuuOFKYPqF3Av9mr2ywesdff60wGEVPBkfPVdltw8w0nI3SlK9AamSG5P/Qy24FCslokLlZSq2bWrS4DkojlXu6khBLsARRnA1Jiv8Q/S5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=RVMXw0fL; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="RVMXw0fL"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e4c00d71aso349031085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792009829; x=1792614629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaoYiNsU7mJl5B1XUBRs0KY4FNWwAjLp6a5fD5J3icY=;
        b=RVMXw0fLh1vBFhHveKnAXQ6Hz+mLSbomQhj7r1PIYaBj2UQwe96OfhsykcALNTowpR
         aRXmLe7k4Fek2ZYTki9CQHjVtpgQPLWjnDUAoA0FFIzCzuGBhgEFHknq5jMeiPWn6G0k
         Ne2ZPz/YBumkl4IGhplpfHxovg0H4KCG0jdIYNPHvY7Z0zywYBY8Yu0KHAKbNar0Qcy3
         GTfYL+FnlhAlc7Za09zm92vc96rdkKIefX8FYBgo+6LpPJrQLhiqB8sd8pdAHAFlxQoE
         Rf7qKQiBAVgXwdWpDsWC/5p0rZbyxDtusTjutolKLdIJkRL2gR3i3QKU4x2KSfNXbxm7
         7HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009829; x=1792614629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaoYiNsU7mJl5B1XUBRs0KY4FNWwAjLp6a5fD5J3icY=;
        b=EjhL2GUvoD9yRpOEVDhXVyarIdZlyHBEsO8rxyUPkbqSaamm16m+/x3n0OwN40WZ4w
         u6JaLpyJTjcK7KU4/f5Zt6aGuSNNlWb8UKxrqzGJ0XuVVWQuGbMY4NO2XvbRdC6nH9QP
         C9HLTHhSR2Ox2wiLg4HKGuRkB53b9mooTjkARYNPD0FGVnUU+e1oh4DEK9KpWO4kF9GA
         2N70cXyBUskEant1MjHOyAywYO/u/bpDnnlFOpVnq4kIf+fNsNQeVlkyq9t/ePiXmh00
         YwnD1rpUU2XrW/Crr4I+X2fFcffm/9gEMXp2U38MP3H7wASbDnYuHc/TWTua9+XC4M46
         3QSw==
X-Forwarded-Encrypted: i=1; AKwUvBwmWG0C1Q5eVIUL2rGdwM4l5L4uoSAES2G8ne9kDLhuNLWIEz32AW72tDxy3UP8EQJDESZAAbMhH10E0H8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbBYNQWgF3brKE/E2vx/X1M1sAok+60S9MW9z75zegI1Lw7/IU
	4xtFlb1qk4iNJpKV3NHZ6rTUcBqihVPBsT5/UscLHtz6XMXnIn+rf80GyL5wQsgqhjp5knxgVqa
	nl0E3
X-Gm-Gg: AYBFou1nUbhQSSm0NlopT/34hfMrO2/KRNXp8cUSxyKIjsZpIuCj1PVmnLm9MZQsuLs
	Wcp4dsCpleyoRi5PZAaqIXQ4OTLezcfkU0JUOb/T70Q7/Wj8yDndADUzupQZ705Now3iqyveaoV
	o9bPJQpKQWGV4lovbSIYhjHYTVkzuGlSjn6TahM0Z+ICz4jSNi91scrcpMsDMVdoqDRNdVWOLH5
	Hnm/OPHlXCQjxyLgkqZNWFZjAjopRSdqPvc0QpqfpqF3q0J6yRgfS0bT7cjRRq6R61yedGZ+AMS
	2F12LbCPFFvpZJ6oyucgoU31ekEpVoT0o1RTwdojlN9T1Iw8rylpncuLOQ+ji81cq7/rXfpzSaM
	Jb94mhu6nOE/2sjeb9WIWHSeyGGMu224mZvdcoe5sClwVCvw7KPcLw6HNfnipE8eh+X5XzMtOAR
	l7Ay9lb3yoCZZGyzQjM0XEUIR2bEsNqDSnyfk7/n7vpO5FFmvByi1ProMs2ABZKISEdpH+
X-Received: by 2002:a05:620a:26a6:b0:93a:c102:1123 with SMTP id af79cd13be357-93ebd1bb363mr2748648785a.15.1792009828985;
        Wed, 14 Oct 2026 13:30:28 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f0cfac145sm64291685a.31.2026.10.14.13.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:30:28 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:30:27 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: memcontrol: remove mod_memcg_page_state()
Message-ID: <20261014203027.GD371161@cmpxchg.org>
References: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
 <20261014-memcg-unused-page-helpers-v1-1-240b37c53831@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-memcg-unused-page-helpers-v1-1-240b37c53831@columbia.edu>

On Wed, Oct 14, 2026 at 01:08:20PM -0400, Tal Zussman wrote:
> The last caller was removed in commit c466412c73c3 ("mm: memcontrol:
> switch to native NR_VMALLOC vmstat counter"). Remove it.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

Thanks Tal
