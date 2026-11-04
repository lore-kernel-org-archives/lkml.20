Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793811109;
	b=2WAApfnPSSt00p2KRpRNI+z/qWC5KmIAYJVxGPpBYjg+F9DB+T1xGqlmiGxqnFEcIuLd
	 pIEpVlJk2smWeBAmalQNx0WV6i9xqj641JJ7opCpIfBairoj9fjW9j70omNDrFlvwOQld
	 PmXojE9duKFD0l62goQKV5WGxega7TRHStkaJZER7WmibpJTQzgr2iswzHj/v0IgQv7Bo
	 p/c2QZku4ng4GxkpKRatoBOIKexh9TrPAtwig4L97S0+7NeJltK1zYpLWKVKGKvezFgOn
	 8gx5I5/Vs4rmrn5lQN/8jucr6oXf6ajVIp3UqEi/x1H55BMno2YB8Y8y/Uk/mZ4gL3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RolwxRoQLA4mJin9vBdQpf3oG/PEdLsxtoKEj0r9vc8=;
	b=rvlw8BOd7fbTegFlIV/SWtBiFqxcUSU8vsc7/ZV/53rzEay2hE3ATeXNNcelUBu+3/nd
	 b7F8jywuOnLo7VN78im/h09fIDKADFFqKTLKZfxOy/WGXkG/ZQLEw3lylyx236erCdlOy
	 UBTKzfxoa8tp1toTKrKB2+JawsYcbxgkD3cKMNDNl2UUDwBMG+jyWX8aZmy8Y8bEVGC06
	 fvB65lmJ8W0f/e+yRpBRtDF8hDHYATqUBQ844+7RqxMAU5x1298KsAr6yrmLDyfBWOBsQ
	 oFCjj5EEkj9V8kZOV0HYb4IDAslbR7uoDa0lKJ6sQG3uWGZOoqVx1jYAj/IEYqiFy+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUiapWpU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AB9606EE8C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29AB9606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUiapWpU
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab53a99771so7899191fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:51:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793811107; cv=none;
        d=google.com; s=arc-20260327;
        b=JSk9zC/rn07gG1uAYZlKRiJkDN2ZmsxKPqvSMpYYNUtyjaCEnu5mCtFKI664U5StVv
         vSl7VTu08C9Z1UQLv/o85PMb50tN3mrYNQYUSIlTcsgKfxieaOXxnKzwbTPh+BE24p13
         7fwvivY3XVKoxAnWtfuv7k+F0r19U9oZzUcq7dN41Y+fRIfigbo4s52bg95At6sLgllh
         aJYNmU01YTB/8VIbNMpXTAHvfLsNl9n75dzlBVSDeU9O9HGqTYXHMr3AFJAlnbq1C2nt
         mQ8fN45sPJdmyna2uchpd1bYCFeYiZl9wpRLWJY2S95tYlKupU1Rq92WgP/IeaFu18bC
         I1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RolwxRoQLA4mJin9vBdQpf3oG/PEdLsxtoKEj0r9vc8=;
        fh=lQcAHO6D8heBT3EtoDECTumoN28GyBHLqZzzpker2kc=;
        b=fGKmhyUgv7Um7HsVjfr9zLouZy9WbkYysjVwsG1jk6gpRvhiaDn/SCGrE/CF0vQmp+
         40PFzFij7dGcqiemIdNUHiSC8wNF1PFN21qD9uu14KqHAXMKCzg8n2psq372vG2b7jsx
         hdpeEbt+BZyy4DCPRcXzZ6Rb/wW/fwdcPExZ3AzA5j+C9Ey0Q9ZG74NkKdcUFkXjPMOt
         VCSxKcjMYyzCWy/1gFdakeeBUf50cIIhCy8lkyxmZfEzHkukHWr8w1XWRD2IsUP/Qc0Q
         +iK9sMrlraWgrOjJd4xOOH0T3g+JmI9+2fbztnNVhoYfQU4LIg2ZXmTDHQtmE4+noQc8
         ivIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811107; x=1794415907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RolwxRoQLA4mJin9vBdQpf3oG/PEdLsxtoKEj0r9vc8=;
        b=sUiapWpU33bD3PNfwz+SBizdNBHjR8BaT2fJ+5L6GKHpvy4cePKi0+JskuCdR5R2XV
         O8PcNGys79ueKjGy9WV3w8+Tfi/I0LG5OG92ifyrQiqmjmiu5DujThDT4ncnuivMWGPk
         tzsqX4w1JkWt/TSznuHAkoayvQaBA5ItudR2uVMIkkPUUTXutnNzYlG7VmplIceW92iU
         8CApQT1241sCxEXZ8HrmApcO2i4ouqe7QGrvQsy+avtrB3OlKBKZQMStrS7OSDcXjaJP
         fIuZh2Ghw9Bav09F9QN7W1Ecttt5+QxLEHs9wHvPRvsslhr0QG4WcMrq63TN7+Jr9s2i
         C9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811107; x=1794415907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RolwxRoQLA4mJin9vBdQpf3oG/PEdLsxtoKEj0r9vc8=;
        b=pV4LBKvK8WQYOaEE8P9dw/YHwKFNWWi2JZwcxgASqB0rrjL6hAazgQzg8Kbp+TNMaK
         P6X/t7/STRKQUte9egkmoZrUUvTctrmaSkSLJQSgej+BanVhkpRKxLCDdBp4MUJpwAha
         CVkl1oDKv3WkJ2IG+z4mTGLQsS1bncxVgrsLOCDfkFINxzbW9qCPo3E8W+sCRMZTSCwT
         LkjkgzJvlY+lYqewVyY2To8TYR19YTtKA5AVhwK4u2W2RJj1QiLsKWBFpSguuHv9ii2J
         JhbjWkXYsbd9Qw4nCUYTBkllZAuh2hFt2aOyhQtYLHNsldVB8kmpYsKBqgsdECXy/0ch
         r1XA==
X-Forwarded-Encrypted: i=1; AKwUvBxvhzqwvy6NhvlgCuMAWuQo32QCyjKPvRWFAgu6+MA2izR5oY6r0AprEuc3mV6MvaxbB4sGWwmCJP4u/GI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Aan6UNF9FacrCA1jdEdKNNot3PHg9EXUPoth+kqKjDI4QIqcv
	YKX3WQRMuPIs/n6ilSZn83eRUsP+JQJJYKmIzCHA6TNgZL9w9s+75K80gYeZjoA/csbq9QDLe8Q
	ZkuUPUTtFGPmdoj7EvH44mygu9qhrt1U=
X-Gm-Gg: AYBFou25blD/TDrD2aYPX6NN9iYkRGyDODUDpnjtzb1R1htex4vYHolkoqb4jc6U0An
	ugpqNEwKVxzGJ91t14NV3LRzNVVamHgIzuz2PYtMMKNmBdLhPP4FLx/7IP3KXp8T4C2lth/O6Rh
	Jmfm09+DM79XRF/ZlHkqb+cGFBoGFB5A2V5yVMOp7r3F0SgyB1Eb0DB0igCc4NC335n9AvxHTj8
	Jp+TJr6T6q4bwwjmBUC6LFVudhsVyPoM1fu+QlbPH/0sENsJvNqieO5ocbtiKrYgZS8Da0c0ApY
	PaIi0bpNj6FRV00q2PG/rufvZbYH2Yuu3Xnw6Apqaha3K8V58DFluhGkuCWNiEflWuigzMj1W2b
	CSbn8VSksA3lNecPdw08OlB/rGfbTYLvyk6YpfGbB0RZ0VnUg9URFYCizib5K
X-Received: by 2002:a2e:8a88:0:b0:3ab:4014:885f with SMTP id
 38308e7fff4ca-3acb7ad2de7mr37137611fa.23.1793811106978; Wed, 04 Nov 2026
 08:51:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104013139.1341582-1-bobby.prani@gmail.com>
 <750560f3-4c5a-44fe-b72a-0611be383f32@kernel.org> <CAJhHMCCu8ehOU37_4UpExNO3U8YPygjnht+2S+axkxTwY8bx2w@mail.gmail.com>
 <287698ab-76dc-4aee-8e6c-db1f5d18974c@kernel.org> <aus4ag1KxpuBNSP1@gremlin>
In-Reply-To: <aus4ag1KxpuBNSP1@gremlin>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Wed, 4 Nov 2026 08:51:20 -0800
X-Gm-Features: AclHuK8lUkRtT9DIM2v6hdb2JEoHz8N8QglBfCOcEbvQSbdRZXUQbv2xSsHG0dQ
Message-ID: <CAJhHMCChBTH3QWBFS1Hp17zj5HepN6KFucvG_5tVdpaB4fjCYg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/rmap: use release ordering for small-folio
 mapcount removal
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, 
	"open list:MEMORY MANAGEMENT - CORE" <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

On Wed, Nov 4, 2026 at 5:55=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> On Wed, Nov 04, 2026 at 02:37:39PM +0100, David Hildenbrand (Arm) wrote:
>
> I mean 1.54%, theoretically is even less convincing for me :)

With reducing the strength of one barrier, I think this is a non-trivial ga=
in.

>
>
> In any case for something touching a sensitive memory barrier operation t=
o have
> a stronger argument put forward for release ordering being suitable than =
simply
> stating it's fine in the commit message and updating a comment.
>

Can you please explain what information is missing? I think the commit
message has all the details of why release is sufficient instead of
full barrier.

Thanks,
--
Pranith
