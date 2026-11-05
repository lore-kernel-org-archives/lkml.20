Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912806;
	b=ZOzBmfb+M9PJVkr0esbUa6E8YlxbJIWzyxntRfGKhlWOHnX9gYw8iJYLE1ZMd1amkzYN
	 DCvPBIKRly1SZW+cuUHbD8dlZ513qeSRX1VbHRd5akQEUFffVUMfmimLS2uM8H9vBo5Lm
	 ZktJZoqbAed1d4Jm4YwVfdaDVl54Y7ffcoZxT+kRuZqqrCK9NTPnmePfrJsqnVrpmVYrK
	 W4tlpAdkHxqTgOh02gq0QiwpdxxQtoRXNdtaqbVbLdyU+5h3oJPIUtLD2L0Ml7g7A6oaA
	 eZ8DLclyUYC2760yq1+OZzyszY8PyC0XGRlaHru1gL/eHxG8N/WTNoRvCKLEuO/1PZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PQ5xrz6/5W9B/AU5YTZ4/YsX+i9J+WP+jzQ06aUOz0I=;
	b=p76bSHZPFi7KnUNZX/A3WXPecORipYMXMrRH13/6RT5LdF185Iz6M4tMGA8CDW+ZIT9z
	 HF8X7r7iqsF6KVIAEAq/jvIo+wM2aCKmN997H3Gco8tBhh6fVG6VhGzwc3gXQx9hD6Snh
	 u/akQAy8Owoc92FwjZ/2n19GU9VBkZzwfiG+zs8++j5cle0jCMV/0kpn5+vpltUmqADlE
	 irNwjSIt3vKZ1AzgcdG45pzqKDWo/euML4F5u/kLkkpUa6lQCJNz+MhJOhtCqC+bOFTRb
	 5jy07zX3j5YpmespSD+c/ExInz5rmLPXVIVftWxRe/ZnS0dZpnFSSPpRKeuZ+G5w+/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwJ76Ks5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F71606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F71606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MwJ76Ks5
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49134c8509fso7848f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912804; cv=none;
        d=google.com; s=arc-20260327;
        b=mZrIDux4LTycHFet1ydHQuYTCuAV1rOGKiZGmaVl0Mt8aso1vmCpuS9TGQpr7EqGRD
         ZWTLlb37XcVo9bT312BUW4sZQ+kHnGmfH09qF2gOy4EbaslJPCpr4r0+vsoW7G/kv3W9
         uniu9HEn1sEiqwPX0yqNBhZWfLS1zSHP/bpci96cnv+jUjGyxVd/w9l/imn0gOq36mXJ
         mdyxZa0AubqXxlENQ4wxOmJHEVRoNcnW6UhUCZckvJbPGGDjfJuqBdI2+I+R2mYdA9Ln
         yu9OnFwGBlKN0X1cvkV+jf1IiDnBq5opI0BBmcL6fdoFWKP2LixtB1fAwCwI/9cpJxIW
         5ePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=PQ5xrz6/5W9B/AU5YTZ4/YsX+i9J+WP+jzQ06aUOz0I=;
        fh=9lEuzK8g/hjcpGO4XjT5fAtMH0lBMNBOb8MdObwDM+8=;
        b=hzvXeW5iN2THoUEd78S5qiAc4j5LrygKPe4yDDwrncOR2j9qs/pKNLUIZ3Zy7suh7y
         l5yhGQwWfRCLH6HDiQQzHe2UftSQpSXJOrIXV+MQITvuC/6uqYSIpWwOfdZqTa4EpOh3
         Jj70foiiqjy0cvKK6MXQ62sbAsWLcYOhmfcvJ7mcjUmiBz4i4Ks/vUvBYWjVL5JjGmL1
         nAjH7romGpQw5S/Q45Etdoq2s6dfjp+F9Wi5IuthIH8TMG3RtHgn8+zAIypfPfWf2K01
         z1RnNF/cEzV9RVHcEhVYoap2bcoM6tYUHs5rpTcD7300ctaJxf+N9S7E1wHWzdfe/+8v
         YvWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912804; x=1794517604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQ5xrz6/5W9B/AU5YTZ4/YsX+i9J+WP+jzQ06aUOz0I=;
        b=MwJ76Ks5Y+rKs77nfkcWgGGIm90efC1A+MzQ+8wZ3Hi9xf1bd4nsNC7HWcgOPZ7FZg
         yu54ZNROcPfiNnVTY6hcmbKqOTu21bEKggFBcVHJM+tDzLsJanQQkMruevgqEqFQ9m9b
         9Okrho5OhtlFmvCVeQwSmsdSvH1UZ3wZ06hHH75dUUoCbMAdmWEOgok0pbVFs/FgEkKG
         5b7CgmRYgVNxIIj49pasfL3Qz8teKSM5+X6pMqe6PiBQVUltaxwnLdbAbeEn5iY7EZOw
         MImujzfSruFsGdab0k1HbDIPF+nWQipw4z/7b27A7MIBv4HUFubKWVhEU8kTJ6eZwyNV
         T8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912804; x=1794517604;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PQ5xrz6/5W9B/AU5YTZ4/YsX+i9J+WP+jzQ06aUOz0I=;
        b=ApcmK/PQA+74j7kHmOZ7ed+bjpDN/7Tf5LYVffBfxNVdzC72t+LFGLUNmZKfowqRfR
         /Ojv3WpcZYAV4Q4O18wwSAhPW0RS9SVY9ZArzM7pYC+uXoVSGLR6Xr5chqgtoqPIZU1U
         AsGS5L5uR4J6CqMQVpmLjorMU6Nzwj7efwPA5CPezedKGFJmZpc/IoOrFBuCk8fZxw3E
         oQN5Hvs3DAtn13wgZUXoXfaGwhT78zM9R8RlQ8wQD6iBnMQZzkgETm5vbbodwwICgnIB
         iMqs+1JR0dU9Wqw2v962fMBZAmHS6APBNFDUW0ulwXBtKGDHeDzeyi2laoPlCaCEQJkE
         wu2g==
X-Forwarded-Encrypted: i=1; AKwUvBx/C44Ei+h7xjrmc66JG+x4Ta5psV0tNQUJBgpDLlJ7sHhH9sgfNezpPdZL7BhlCJ8D4rryx4Ajl2bsIu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B/ZcWI7VJa4LUcJJaS2iAtIBNK8wiyKb1CRGGkLUfvz147lLa
	uyaQAei6vOdIo0qfVlc4n0tZW8fOOtBGjThmCn5SIlsQbRybA6v2CP1A6VGwLq6yAmX8nfr+Ri4
	1dShxWq/9t4p4Nzuog90TuhmU6O39rPQ=
X-Gm-Gg: AYBFou0tlTYF2TyJC7SIsaXrKf17I4tfxmanMXyr8RrRauM5vSot/98ucHAbwnHyTfu
	zlvKWDMmC6mf7Jxat/svLXNQTZDntvD7LVaqX7MfOW6v7BwZvtABZbu7EIyOLZQH4gPhwbwwdWy
	SVgPz0TwlQqca9K2c9l+6iEZ1IBVgkiVOGuldNZZ9oSHqSFYMmVglBaZbAzvzOUIvJXMhmhpxNs
	CgISiFMzYjmsDPdjpOHHbmdzvimmH61kr7dWbPA2CPG2l95fB9wl2MCLiBsgNzNQopcJjVJkLyP
	ZHNC/w+ZSwXH8t7RzGVMhBWJkjAc1gQCDAEvCllt4jX/G4a76SKd2fFMXVps7LgP3bzBkj+mN0Q
	15dmUnPQlmVYvCGsrp+FKFhnQK5H/8oppVllSeZO/1rSdyZ8plwD5LsUqUP1jky4Z/7AMe9gfdL
	gW7uYrOxjpeCswDxsn3405z5kx6u9HnvxkNUVLXlAxHoE9MiQmUV1J
X-Received: by 2002:a05:6000:2510:b0:48d:f488:f32a with SMTP id
 ffacd0b85a97d-492775f23a9mr1599167f8f.56.1793912803834; Thu, 05 Nov 2026
 13:06:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 5 Nov 2026 14:06:32 -0700
X-Gm-Features: AclHuK8Cjd9cUW2LR9znWEJxOp10JF8kDZifUXejaVPmbKzhx3QybC-mp6UtYl8
Message-ID: <CAKEwX=NXSwSiuY65EV5nqFocMLd6-afsiJfgy_ahB2v_MDmcng@mail.gmail.com>
Subject: Virtual Swap Sync
To: "David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Gregory Price <gourry@gourry.net>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rik van Riel <riel@surriel.com>, Wei Xu <weixugc@google.com>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

Sorry for the delay in scheduling. I also figured it was not a good
time with all the merge activity + the big list of issues that needs
urgent attention :)

Since no one responded to the last email, I took the liberty to do
some timezone math and create the meeting myself :) How does this
sound?

Thursday Nov 12, 2026 =E2=8B=85 5pm - 6pm (Pacific Time (Canada))

which translates to:

Vancouver: Thursday November 12, 5PM PT
US west coast: Thursday November 12 4:00pm PST
US east coast: Thursday November 12 7:00pm EST
Europe: 1:00am Friday November 13 CET
Beijing: 8:00am Friday November 13 CST

Folks, can you double check the invitation, and please let me know if
I missed you in the invite :)

Best,
Nhat
