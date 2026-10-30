Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793378150;
	b=AOKl1xqQxALcxSD93vyGeg1LCyO5RO0CHnidAl/s00tvlP0jvEQEGRBzb+oabeYSQjyZ
	 KNrm8PnDpLEO1g/yd7E9ZNQ3YOzNdCg34GCU5ApAmSnB86H97Ame17HSdKs6TlRlA4f4I
	 lJNoI83Pahb+pLn1nI0vJQIWuPUxKjb3wXEE4qAIljmMOLwGqvLs45J/rEdQm8tYB00IL
	 DXW64tKX1NaRJmLgl12h9N7B6IN9YSQXktpw33c3QB/YpCe77WdXev2TZI/UV3ndXbSDh
	 19v7FCFeB6yEEpIoEAjl6xTXXnLBczneIJX+4GAKm5+gCmtKpQ/Q3LwhNwN2Im2DsOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BMm2o25mhTZ/C2HIIR1IZKofC9feViQ2U4GTb8F8Udo=;
	b=IyMDdKxXAnGP5VzbIlepPplrbmGsTDFVjM7Gmz31vvhCJhvs5WYvvnSrtk2Ec9lgTm2v
	 8dd/LBCvOUL/0T/+sbKUB7cwg5XxUOLHDVE/x1QyPuqz1hbvlyQ1mQZLm+aQe4bMD7q2J
	 gkrMUkmdjgAZmU8kRPenKWAged5UXRYc1zC1Ym42cjr9H3mO6nHG5bmMTqO0MgrMi8lxC
	 Vxc7oPWxdm0nWRw1X/9K5vxOR2wlQ79W2jqod2BDjj4AYUFHAXcjigFWWEzaMJhABnkEZ
	 HZi3Tcmu/ezxTRjD1WCcoiCTDRlDcVgihoTVrOTKshqjO7ENG1hXauB0deyjLyXYe5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSb0SO8d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EBC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSb0SO8d
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so775048e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793378149; cv=none;
        d=google.com; s=arc-20260327;
        b=TVdpSYlv1q3mzs6B9FERQuia7IRIAI0b6/aO+R4dDUcmqHnqJWiySJLEnPVos31W74
         nZxMxMUTmKXH5rRFIXyg9COEhL+zXFDhOFI5Hr9OkXlvx7vPB5ECtFaJqPfNCpjHynt1
         rkqjwJH693Trsvk/0r0rXsh9ncjOSLky6wc/xMdtZCdO0v6V7Qh+nxOU3aXAPDIt7Rm5
         XwT0lj+b6CylvN0228ugdKJd3i8YD038ZCBw94geNdACC3KQ8CYPjYSJyXmoMjB8Gwwg
         8Jvnwa73jakRIZB2Sg3oIHON7B4ZIP1xsgngMUZBus2Fi8QGd1GMoVKejRVYLAFCbGgQ
         XzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BMm2o25mhTZ/C2HIIR1IZKofC9feViQ2U4GTb8F8Udo=;
        fh=aD1crJT9wi0MJkMR/lRwgHCYHO7gyFB379J2OmZhrYw=;
        b=rz3QAIoZyJDvG24FKyotVNZONi8Rw9v5tRVftaUe2fVZD55XcohP+G9yCNdP45Jqc2
         aRx8/YL4CXv1g1SWBwFj6QIYcEzwVcQBt4KqMd8PtGeTrkU2SAQAFfgyRO/yFsMYU7t+
         gCU3I1GgLOrFMmnhiOyM7DDVYrQldLaO2xcY2M1x6bvJMgkc+hYWNM4Is6QOfygaj+XR
         c1/Inw1CQCXJKEeScW5fX8fzlIask0/feJyUpbdUXUfOla7FLMDIKUhlPngvo1nXSWy8
         EAeE2YJwm0AaZWUzGVv/F0ByS6SLhn4olalcME7UiXqIsjam4HwEuHcqErQBFlbYBSiZ
         wdZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378149; x=1793982949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMm2o25mhTZ/C2HIIR1IZKofC9feViQ2U4GTb8F8Udo=;
        b=FSb0SO8dEzCjBzxj7XFmH/MJsHgEJiwSmwxWPyGw885/RWyW7qIx+3sO8H0mMTs3TL
         ietozhtYd/jmOxRok9faH7M/85JDhno+5t64t4hTHRQjs7+VK7hIJeNy1IIBpZoQ+Zl4
         X747RH8dvqIGlEM5E+h8kuwNapJnRPdE+UTh9zJ0C99drP+nxy6g4PCWZ4cSuMneLnPW
         e0WnuN6JMdjBpOCrSao+8e9g2FfZvwu7wnm8yV9TB5sZDQ9rRBcYvhZVB6n2uXqlSoYy
         J48Mci865JW2w+IFFOjhXVW4hpLirTiX4InI1rBIWwXCnA0Mj629v5nw6T1e+HlmLYET
         SdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378149; x=1793982949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMm2o25mhTZ/C2HIIR1IZKofC9feViQ2U4GTb8F8Udo=;
        b=J6+0bEUD3h9Gz93V256nPmvbbcKN/1xck22YkFYTv97NPf6/btviYvnwz8M1oE1epP
         JS+7DVNOMzFgdkvZKk+92g+uWjyUDliktqyOK2KkUwBI+v++PXO650YVGVriUW7MrIIF
         ghM74cBKjnSchv0uxkOn/VuQFV8xqkTyTZq6apbv8XgGz8A70K5/jsX3RQrcWJqEuOEu
         cq9aClU+XBGuouJ8SfxhUaJvq1N+ub+idYtpkhcP4QqlXGeMEqlcSuXiU39GtBhyoXKZ
         jQuA7ekh91i7e4FUoT1ZVL3W/BgBRWvg6sAI/YSVfJOUEUwmR7qhCfGCUMkxdObVtDOT
         3Dzw==
X-Forwarded-Encrypted: i=1; AKwUvBz1vd1Y7q4wQozxS8h0RD6acItiTGNfXYDkwPw09yjn7UEjeLrQk+mmTLQT9uOCZJEBomCCjaME3CEVu8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYK//PKJnzxiMGDrTnYo20KZxRVaCtiRiC8uF7Zr0dBzi1ILPwsv
	jVpZLdhlbOS03ImU+uwgTQNQhewf9hGu8XIzsShHzaOPMzBrT/aDKORiu0uXXKIRxz6SM4KBGRJ
	gOhkdz4wo/7tWZWr6UF06BjVio4s2jwY=
X-Gm-Gg: AYBFou1HjWMVMiDgcSNRFlLR/LkXyvTkrgp6lHY5KDt3fmhpRpWiEQnNjpidAJc/8tP
	ARZqvU+9wrMH53fzV+4y1AYqbzyY65OXGFNxm7QNXpOKSH+DmmhwctBlnQ7VG5YNPZ3+YdCf/zD
	+C7WPXv0O8aDk3n+R4QcSWIYp+f7sAYvihyZaCBnLlWuCfPUsUlM4IUG/l+1NJPOzcEPBYwBDtB
	kLSV7PiwRQOCVdCzOGJKaY7IJ7rGCpGOB00E/LLfA2SV3XkYcJ7Husq0rcs2WuFEIoMWTLfcgvj
	dqfWVJnnClrC23C7G+/YzuWpvG94x6h6gH705FqxR6CZbHRJ5QUpynwMa1KPxyD5z3wgMUCVQ0s
	27b/t+tpOl4scHrm/OYSN+XaOA2nWNaFD6QroFVLBlDrMnaA6TWADXUEkCKyGz7FRz/f184lfXz
	72z/rItKhe
X-Received: by 2002:a05:6122:1822:b0:5ea:9843:fc3e with SMTP id
 71dfb90a1353d-5ec68978ff7mr1643923e0c.19.1793378149125; Fri, 30 Oct 2026
 09:35:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030161234.1505367-1-gourry@gourry.net>
In-Reply-To: <20261030161234.1505367-1-gourry@gourry.net>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Fri, 30 Oct 2026 12:35:38 -0400
X-Gm-Features: AclHuK9W6RlBHbspzEKRUiw6R1UQQGsojPWuAYuMETiBtEJzcKWSFyDZ9UWEpL0
Message-ID: <CAN+CAwN+OPMPpVdBA+XtQvFpDy+EOY2TAiusxMjYR+r0F+MPhw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mempolicy: recompute automatic interleave weights
 on memory hotplug
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, harry@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:12=E2=80=AFPM Gregory Price (Meta) <gourry@gourr=
y.net> wrote:
>
> In auto mode, weighted interleave derives each node's weight from its
> bandwidth, reduced over the nodes in N_MEMORY. HMAT and CXL report a
> node's bandwidth once, when the node first gains memory, and nothing
> else on the hotplug path recomputes the weights.
>
> This can result in a major skew in distribution and overload tiers
> with more data than their respective bandwidth can support, resulting
> in a performance regression.
>
> With HMAT bandwidths of 100G for nodes 0-3, and 50G and 25G for kmem
> nodes 4 and 5, weighted_interleave/nodeN reads:
>
>   event             node 0-3   node 4   node 5
>   node 4 online         7         3        -
>   node 4 removed        7         -        -
>   node 5 online         7         -        1
>   node 4 back           7         1        1
>   Expected:             6         3        1
>
> Toggling auto off and on generates the correct result, but we should
> detect this and fix it during hotplug. Recompute the weights from the
> recorded bandwidth whenever a node gains/loses its first/last memory.
>
> The notifier cannot fail the hotplug, which has already happened, so
> warn once if the new weights cannot be allocated. The next recompute
> starts from the full bandwidth table and corrects them.
>
> mempolicy_set_node_perf() now only records the bandwidth and calls the
> same helper, so the bandwidth is kept even if allocating the new weights
> fails. wi_state_lock is dropped between the two steps, which should be
> safe because racing writer simply causes it to run with newer state.
>
> Fixes: e341f9c3c841 ("mm/mempolicy: Weighted Interleave Auto-tuning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Hello Gregory,

I think you may have dropped my review tag from the previous
version!!! I believe the only thing that changes is the warn, so
please feel free to add:
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
