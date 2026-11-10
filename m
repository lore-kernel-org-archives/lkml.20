Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794291401;
	b=0DTvt/sMhRfTnyLZ1LuoU30q4dJUeagxCHUqhHdY4pdmkAW+BdehA4MLI//qsD8G1Z7T
	 RW28GlZENAu3rWylemjg249zGm2Z4ioDKJv90vCykV20uEdwMIRYT9sLRNHFRlvLJcCsx
	 h9/xbRx+vF80Pfs7ABUV8nvDP/6C28ayXcDFwrQ/hS2kyaQ4RRJ6O4zfJeHOGTJecC/sN
	 yABvuC9Vwz1Rel50blZDU7QgjZEdXS+oAxhRkPmwBK2m2MdO+uG6ZZETLkQtn0PVZ5WZx
	 b0bP5vLOc95paSK7hH/RbIDI0s3OJKzBy2QH9TMgObJw1NdPVWxo9Yssp5Fe0Y57riQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rcGViOQt/HBMQw3WBvxyev/DtteQWbQcY0dBV/7zZ2E=;
	b=wckL9MERFfhk2tpsdbV4Mjz5tm1X6CpYvZLKK+Er/c78S8zbxEf0LLZbQIz4+PWDL3vl
	 /PguvjsyA0wUsdV/JeyanXv/JbiX0BJKwT7GRMLYGu32Cd4rgUw/Si7Ls7/+7506FjxIj
	 GVeEMoOhtEXGi5UadG3HjG8u3SlesF6vo3IlUaKUWby0CRN6HrqzYfuIGB1rOqdGN4jQT
	 Sr+AM/sDCZDiIPei+vwuMeCZwi+dyUm4TiJvLP2roypgDJqk3q9jqm0wG06M+awBwNZiw
	 1PkkNEyq33grk5EtxC0Y4xsxocqQJlylXxOoSTeoStqnXHIGdqumgm9mKjMb2qZVFDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j6S/aHdE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4008A606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4008A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j6S/aHdE
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5049f267c9so67547666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794291399; cv=none;
        d=google.com; s=arc-20260327;
        b=NokpGCnNPgFU1R79Z7IRW5wNTSr/GMcWei+vZTB4r3VbXqfnujadOKJeCYEqA7BuNq
         QZxxxOgs02YH0ASNr/2vH2evFUgI/BD4UZZyj8rcBUK1ZGPqqPEG7jdQBptBEIbEueip
         rrx11Lvo5XAWElzpQ3Ic1Yzdtfe5HwIIViPWUmlfXpYE34POzz3u+Ki115zky8+7aF6Y
         S0BKmtl/nrsm3VNCPeCjJLZ9hXlTNJ6O2j+q8sjUxr2fFONZXvIVnHCiwAHD+9EnTBOu
         U1v96WcD65bjCQmL9wey78XjJ34WHrv+GO1gfuiClY6eV5lsti3g1C9GcySdgaTxts4t
         WznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcGViOQt/HBMQw3WBvxyev/DtteQWbQcY0dBV/7zZ2E=;
        fh=3IbioI+nNCPAlKFmt6vLsQNomZWQqOzu2pO6jj+Lq9Y=;
        b=CsWilN4Q81unqeTSbm6XjhrD72smSVt8W0c4gFvs6FMqpPF+OnHF3lq6PPf6CZ7w5K
         dY029C+1gBCrV7AGQ/ditaxsy3tOUAktYVbYSCK0iQU1kp6IP2TbBZ+u4+N/gaURNHJE
         5YCANu2gvnpNJcYWucrrcvT4om6rx+HPkpSo59U1c2ap55Jaa/sGiz2ghES+ICAig2ha
         9YtckTAGz+ATaZlnmTr62hJMjazOpzONHk9ilfjgCPVZoAgyWuo4itmvHqIg8cWO93zo
         ACfxrh56SWUk5SSVon1qG7yJGmcJDCuoms5K6D7BKoyYjF3zAddVym3289F1LQUCt/Oj
         G77w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794291399; x=1794896199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcGViOQt/HBMQw3WBvxyev/DtteQWbQcY0dBV/7zZ2E=;
        b=j6S/aHdEEpvrWoU+YZ6rTgaGMTFkU3HkZHEAmoPJPbzmPRTVsG4gpxu0i2d5J+UYEo
         DE73tlQU/eaucZDJ74LEypYwpWXIIZ0c9j+W6wQc6RSv7cIFrumQYu5zFm05SvVP025v
         8d0wLY4uJ03d2IKy5V8zJ4AMbtJHi6DatVpBSzeUaR2yq4sWUS6rq3UnRrGBn+SN4ENv
         BcO0I7JlS/XbefQZeGWb5fbUG3HUawEdeOVUv7WtFy5Q3BRiEFlcynO1owiBysjqT9ZZ
         bKszw8qNkZjyT8q5dXLATUVqPp2R5J4ChCjwxB/BpJwRy9/RYeugB2o3S1GaYcwqasUY
         cBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291399; x=1794896199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcGViOQt/HBMQw3WBvxyev/DtteQWbQcY0dBV/7zZ2E=;
        b=p2OLYmShozyzpLJKD6uqK5NL3tRJg4/TntGoHxICh/37OtBu7ZpqEb35dkI/KqqVs8
         THlxflXesqs2CaPLCFVsJQ8awOcTym18107a//ALyaM/4l5DjoBENtEQ+9S+j4nHEZBw
         FGeteiEfpGM4/bOB1/yrabRZYxX+44VwpAc0HBfptxUVOQXYvvkKV59kYci+ZYMRA2r7
         /9n6LQmFJUiQorrvzj4OJ8okk2qZLher0UqibIo76Uv7RIob79xfnWgG5lE2aCjlfYgm
         3QzSirDVV/nTYvIoUXvqTV/VnBeN4y+NNeYj0hYgeZD9lpLuGM5ewRdWj5t2iUfEtxSp
         bpmA==
X-Forwarded-Encrypted: i=1; AL+hErFpV/ggqlY1eqEPEDel5vDCx9JV1JXguSCWVfzk5WCcjAhOye2vuNqHtCVb+8+5Blzd780WJfXt2TMqfII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OIHvlbKJSV5H9XYZElM2/p38qbEW4o/XXni19HiqRmFMfqLpR
	uUKhWv0/TpQerpaK8d+AWrWbnXtjqLKiCV5g32hMvcpSA/UAYFPTT4Mhf/Gg82J+jwBVT8iMr2e
	NywYeB+y68yksFr3dvGgU8QzsCJl4dZY=
X-Gm-Gg: AYBFou1gHdjVBzwixhH+u84aZX3DF3l5S9EX2au2NJLsWy5VVHKhwg8EavciyGc1pAq
	79TY8ZyFnimMjeHlumuXqA1OxrLJ2T0u0uGVQJ9faexr+pi5r4ewUAdeIzy9aIjqysIBVI518rH
	RmA4tnZ9E6PlOCSL+SUTlFC93u9giAhnqpkqXHR4NgDrfpfpaFmHkcL7SrKfPYHy2K/c9upgj7L
	s9WvzTghG5qs+u2dnHoKPJVyZbTGujE4PrtTarStHzUXd7/N9K2xS8kOM+va4/GxYl5s4kCU5yP
	J/93Q0AHG17PyGcgPTvZfjcyXWUwZwD1BYNlMkVbIwRIZLpAEmmo7OwgCflavJOUjgfwu++8xfN
	qnpiKU/NN7+iUO54yy0r4yhkQaCkVcaX2huQD3vzOsrUfEBxo1Zz2lZoJqnM+4wt2UEFm
X-Received: by 2002:a17:906:4788:b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c50491be261mr114423366b.2.1794291399333; Mon, 09 Nov 2026
 22:16:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org> <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 10 Nov 2026 14:16:02 +0800
X-Gm-Features: AclHuK9ZoNliVkmeviY3CMgdoIakPDsnDlwZO4E-oVMxBFzP5M81JDFrYFQWcJQ
Message-ID: <CAMgjq7Bcbpo8QG-43i_KHHgyUSNuVN5DN3T_fe+MxF37MnFT0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:46=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> MGLRU is currently the only MM component without a dedicated component
> maintainer. Fortunately, Kairui and Barry have been actively
> contributing to MGLRU and have volunteered to take on more responsibility
> by officially taking care of it.
>
> Given that Kairui is already an established MM component maintainer in
> a related MM component (SWAP), add him as an MGLRU maintainer right away.
>
> For Barry, the idea is to transition him towards a component maintainer
> role over the coming months, starting by moving him to the top of the
> reviewer list.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..e7ac319a570c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17635,10 +17635,10 @@ K:    (?i:vmemmap)
>
>  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
>  M:     Andrew Morton <akpm@linux-foundation.org>
> -R:     Kairui Song <kasong@tencent.com>
> +M:     Kairui Song <kasong@tencent.com>
> +R:     Barry Song <baohua@kernel.org>
>  R:     Qi Zheng <qi.zheng@linux.dev>
>  R:     Shakeel Butt <shakeel.butt@linux.dev>
> -R:     Barry Song <baohua@kernel.org>
>  R:     Axel Rasmussen <axelrasmussen@google.com>
>  R:     Yuanchu Xie <yuanchu@google.com>
>  R:     Wei Xu <weixugc@google.com>
>
> --
> 2.43.0

Thanks for the trust. Looking forward to pushing MGLRU's development
even further with Barry!

Acked-by: Kairui Song <kasong@tencent.com>
