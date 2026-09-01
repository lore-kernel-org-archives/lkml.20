Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9240944064D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279610; cv=none; b=K2HhJ+ymHELlkDIzaUc7wLvzXCnxTu1fWAJw4QAdA2tw9xyFERntihNuOaTiHAbmAacedyMKHzWGTPnD/fHpzyaXprDOQT6OY1BgowetBr9pm8raRPko8X9GGZSKmQExWCzPp8Yc89nGFOpA8HVHmVyM8qI3a58S2kECOzy87hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279610; c=relaxed/simple;
	bh=Ph8PvSY4jSqoOfFA76v8Y19/URES1/E/ItNUd86GafU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V2dmbwvrrR6s3T6M0m3J5ufNJ9X3bMQtsVGhDbydsNTonUKBgA5l21RqnqiCr8Io69Byt3tb7LrTNuOz9z+HtSif3RmCm0z/irg9mjrc8pMAx3RstlnEeSEQNb1xL9cKXX+m5Ab97JLxRUuQYxFq7y5G86igXsOklePRKFQWsmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UlM36j2H; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UlM36j2H"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2020421077so756205066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1788279606; x=1788884406; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xt613ZL56XxGaY2+kHrcKG3IPyUonAahqlih7qZ2NEQ=;
        b=UlM36j2Htpj87uDzTxIa3W42+QqPM0tcZylTckJfK00n1X2/Egsf/2F2epjgMAAeW6
         X7/kkZWbDQ5F2a2B36pPnDknMaUJinACS0bMqtmfu5HU7w9frWjBLb/2M747q3/uPL7I
         9JhTItBv1UPx8CY64Cev/YsJNrWgQBZlvVuLj1/P5G566txlZy2AHgkH02cAxXh7DerV
         dowJzMUMrVPpKsaj/AmiR6AlB/TDhTtWr9IpKM8AtadL6zbbiaSVox1zx8KOgjPwUfX5
         fG7FwzuvZyRfZu+4wIsX5iTGSl3vuRe6kliVC8aMHlDsbQA4j18z8fJtdb48f5K93kzb
         dfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279606; x=1788884406;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xt613ZL56XxGaY2+kHrcKG3IPyUonAahqlih7qZ2NEQ=;
        b=ph7+HHnxllXEmYGTwCXAcGIVwYz6LSFWlEoT9KFshBLPSXYuALXCbhuaYQNuitFVpt
         ZPuG6bago21z79RuG+QzAoW2EMr2VX2JdA4wDHKNsS1y8L29pzVynmzmQNoam7rSjLY8
         0KIaGB8B6+ae83uRqu+p39htcYSrbusgRoX1pC4Ngk0U0eRDJR1f+Fb6t99ud6Iiy+ts
         PaGtTEPWUoIg4OoCcxtWgGm2gTjbMW7zCE79mceQxN6FJQMcKJS/7awnuRSavQM/RFeO
         CJvYZWLTAK4LqRY/Zu8vetOjgIm+CsTwTqVXTabIhknY86rTAdyGAfFGsqwpnsx6TSxH
         5qcw==
X-Forwarded-Encrypted: i=1; AHgh+RoNoKzq3XDdzKE8xZ6fci8wDFx8DMeLGIbpgXCu6PD2S5F2MvpfjruYpFop1VEkb9/Z5T6YTEoZx2xXdmk=@vger.kernel.org
X-Gm-Message-State: AFuF++n/FFFZzHYg2onj5CFIpbnTR6Zhtp127WzC4ARTGde0PD3d4wIP
	YOwje8x2fBm7TvuXxFRkQfD+vTTXVgUXy0Wpf1+HEJlWvtUZB5YF1tpdMeBYzKpeXq4=
X-Gm-Gg: AR+sD10ENSEbvnSM6lKQwwqYZGhftjwGFwzyWdsNASK79v0/RoGQ8YTh0EwKeJ6wBcO
	PDUyeucbxvyjpHVGJj2AIp3geX39YOR0K7W/S9cW30xzKvNXov8p3kspAo4RqZB5X8TdHQ3yxTf
	DlKL5LVT3rWUxjbXMbsXAnAQpZR7splacCGzG+Oy5O0fVVt44qnuYz4YFws84d8sfOCzs14Fmrm
	Lp/2znWJrjd0fyB+dyyysQVegMnSKRA75wBqHii64oR97+Wkrk6vpaXXsg6/PH8UijRy/lzz7K0
	XVT9VZnr7c9VkFVBT1ljJRm9Qlg9w8xOGCcKs7c3pO8B/4NXuCL9/Jx+MTvPcglkIUlO52Gf3Sl
	isGR6jy2COspVgVJMB9IRDmljC9gXsOvF5LxdHiaC4RK3ElxgihbhP2NoeFET7foFds+QSD0dpT
	ZJ8Cmw4KrKlIhY9esPTsAzrcrASNZyrQGo1X6sbU2bjOsTezj33dEPUVd4ZZMkrw==
X-Received: by 2002:a17:907:5c3:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c255741620bmr2353708366b.20.1788279606104;
        Tue, 01 Sep 2026 09:20:06 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249434sm618644366b.55.2026.09.01.09.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:20:05 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Chris J Arges <carges@cloudflare.com>
Cc: David Ahern <dsahern@kernel.org>,  Ido Schimmel <idosch@nvidia.com>,
  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  kernel-team@cloudflare.com
Subject: Re: [PATCH RFC net-next 1/3] ipv4: hash uncached routes by device
In-Reply-To: <20260826-hash-bucket-route-lists-v1-1-fa9b9f30eb74@cloudflare.com>
	(Chris J. Arges's message of "Wed, 26 Aug 2026 15:20:07 -0500")
References: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
	<20260826-hash-bucket-route-lists-v1-1-fa9b9f30eb74@cloudflare.com>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Tue, 01 Sep 2026 18:20:04 +0200
Message-ID: <87qzjd2bbf.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 26, 2026 at 03:20 PM -05, Chris J Arges wrote:
> rt_flush_dev() currently walks every per-CPU uncached route list for each
> device being removed. This repeatedly examines unrelated routes and makes
> teardown increasingly expensive as the number of devices grows.
>
> Replace each per-CPU list with 64 hash buckets keyed by the route's
> netdevice. Keep the owning-list pointer in dst_entry so route removal
> remains unchanged, while device teardown only walks the matching bucket on
> each CPU. Hash collisions are filtered by the existing device comparison.
>
> Signed-off-by: Chris J Arges <carges@cloudflare.com>
> ---
>  net/ipv4/route.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index 604cc51dfd9b..3f9bc1ec72cc 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -74,6 +74,7 @@
>  #include <linux/init.h>
>  #include <linux/skbuff.h>
>  #include <linux/inetdevice.h>
> +#include <linux/hash.h>
>  #include <linux/igmp.h>
>  #include <linux/pkt_sched.h>
>  #include <linux/mroute.h>
> @@ -1552,11 +1553,22 @@ struct uncached_list {
>  	struct list_head	head;
>  };
>  
> -static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
> +#define RT_UNCACHED_HASH_BITS	6
> +#define RT_UNCACHED_HASH_SIZE	BIT(RT_UNCACHED_HASH_BITS)


Consider making RT[6]_UNCACHED_HASH_BITS a build time tunable.
We've had a case in the past where we had to carry a custom patch [1]
because hash size was hardcoded.

[1] https://lore.kernel.org/netdev/1295041688-16550-1-git-send-email-wsommerfeld@google.com/

> +
> +struct uncached_table {
> +	struct uncached_list buckets[RT_UNCACHED_HASH_SIZE];
> +};
> +
> +static DEFINE_PER_CPU_ALIGNED(struct uncached_table, rt_uncached_table);

[...]
