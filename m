Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559920;
	b=JxjqEuWnTwmf8EMb8Gj018uizDAnJvuC6YIadi9tnXUXSpUC754dCzGQg8xs6Ncc5U6S
	 k0JzG2mIlVH/6T/J5oKFQo1iDEcTrYuTMDNkxVuT0ou2yfvxUW+LHQiSeT0kbTvif/YG0
	 CGchxoyTfv4VLpeRIJw3zIGyiiqLmA1fqNFPhPagYjUrwrlaZeOTYvPl8Z67pPikV0r54
	 csBZkG0c9vS59fqxmzHV2Mo37Ke+L9bOC2E38NZ9E8JW8NrbYnpKdfsSEr7sLHcOLzbD0
	 YFR3tCRbRIryHiF7tA3F5Rz/T6dQgpYuzGSIlFOaJXRd4/DQzs55HkCLPk16HLXLqcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=d8ixB8K8R172rrdk/LmhJTXU2lsskw0hIUmehvKI8Xk=;
	b=j0m2uu+jQULGP1O+/Fk6HK9a/YIy98laiLjxWWeNpGmfasR21zJnpLlKVmYBFJD+GSe/
	 CBV7w7UOx3RLTaeW2gAT2sbXut0ByqZp1hxGVvV03HmCWiygYwNHHVX8VrXk5+5u2RkJC
	 MUaNwxBTexN5U9CF2ujJfGfaE4ZksTkoVtQX0Fg14FcVhhUUYpezLzkiQeuBOJ0an+7As
	 QJmXEy8wuW8zO0fJ91cWyP0WRozO8Qzc9FwZEMG9xyxFZNtZINDwIqL26j6SCaqaklbFb
	 Pj8TiuCRrdc02stIT0XBjQbjXaY3Pi+egZ7z3swWGVQ50WU7iQj7IQsG3mL4Qi0gK1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wo3tKroa;
	arc=none smtp.remote-ip=74.125.227.196
Received: from mail-pi2-f4.google.com (mail-pi2-f4.google.com [74.125.227.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E31606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E31606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wo3tKroa
Received: by mail-pi2-f4.google.com with SMTP id 41be03b00d2f7-cdd8c1fdf4aso209256a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559919; x=1795164719; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d8ixB8K8R172rrdk/LmhJTXU2lsskw0hIUmehvKI8Xk=;
        b=wo3tKroanTXQku0Q5OnfqMKYq9yZNuO+X2W6SNK/K+KqSIfeJq373T/eDUMzD8F+qW
         OTb5E8QNC8pMyltEE9uat7XEZhHW3BimWbhRUIriZmN9YvErn51CndJIq1p4y/4bQBll
         TE99QnuUYAnr6Qc5BzQga+/sZqg5s55Lntf3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559919; x=1795164719;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8ixB8K8R172rrdk/LmhJTXU2lsskw0hIUmehvKI8Xk=;
        b=0KKASeBGnbcR6B9g6whNWgOulZYudNcI3GF48yADZH4T9TDB8EVjyhwTmywzUo/yjp
         zshyUNHzKYrBMBCGnimYuumi/KJ4+6Z1XCWJWbGxKv/IxB/4LPYHK76Mo2nv98Bgl/8T
         1/wKt/amL9UQeAu/55uYTIO5WffklQeTahwdosPoJunDiK1ORKGjrBDVfExopBHU5Eju
         zr5dmHWaV1WngWk93R2EqGj8NQEAHtIvIhF+WDAkTiG4Pnlw59j/+ScwmVWjMBaytHLy
         uIgCo+7jxW0MlZknEpf3oHPXiVlHXWlQeMF8yCJs6Hqaprkmc+fl23/aI650ohArlDQz
         /Qcg==
X-Forwarded-Encrypted: i=1; AL+hErHm/QHNIOzOWMB6WNBvLftbMmUVA6RC/KrWd/JdNT3jP+VIxTq5GEywb7hUtz+WVrlMRkv1H1kYGPKMPqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pjTZDN+CHm/JFsygM3zH0EbZxEI7bbIv9EMtD5UEDwarfYKHT
	2FmE4xTvwgmWWjKxm+W4eKQzp4+imB8wwUVp+slM5QK68KG2vd39wj4OYF6VJFl2Ey4=
X-Gm-Gg: AYBFou3CDxO018LOOafW2pTcUpCBuVymle21FYdJ7yehD/6xdTejifuDfCE8yUMCY36
	QmvGRDaVKr0fcRkz+C4r8d8KfbNwgPt9FwnkQLgXq5tmzqux3KFRcvjnvloZFEIrK31vV2Aj6zA
	PALdGU+qU6p33E0a9/YkOX7ZFpVjU+UoQRrvXRBRh7hEOYaxkctOcG6B/taCABe9K8dmW+t0gJ0
	/FjarCeYUuGhnkgEPAcbPgUXdUmiQjsIv+XWw6fLXxg4eKtrMhwcbIB9o4VUUAOf4fbrSCJwmyq
	tSY9illJhPw/UnyRTjq2iuq+RoIg+rPG2Q6UuJCTOprzCmdub/gLX0qsD/09ano03owjV2i6zNs
	5dfql/m3ijABmlEH+nP/15ZBDyliYYsDOWk+n2698NKlsJe403gPINjp09lcmkcDEK4FZGYb+9k
	yQXiTDTB7KFsnDqGy0G2zp3FWaBmkUg2lDFOFYpH/lhtha2AqVadwVz//zUfVomoMJVnJKXe9PF
	dhZd75X9ODIUvKeZlpvPS/QP8ofU0I/9Pn1B6Hm5tiJ1U0GexZzfFvFhsO0vd2WbMUpO/SlWEln
	Q8nMoOyfpbCJfuy7LjNrhYw7AgL9CEkcDwUtmFRieSBFFuxJX4DclCveFqHzotisIpJq3bVUeVu
	ey2t37GlVMsMjAfmTzdA79LoQ+qZVrl7+Pn7ZBCak2o0dJ8AwBcMz3c8RO7e0XjrQ12k4asI30V
	0ylMBDTeaNxRSDqWoF/PLUfKohgNYeSnN80lvjTd03tXmA5lTCNvcZPoP+q2c=
X-Received: by 2002:a05:6a21:798f:b0:3e2:1a24:fb85 with SMTP id adf61e73a8af0-3f7a4dbd84bmr1333192637.1.1794559919456;
        Fri, 13 Nov 2026 00:51:59 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186f472sm907794a12.6.2026.11.13.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:58 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:54 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 2/6] mm/slab: Enable SLAB_FREELIST_RANDOM by default
In-Reply-To: <202610302113.FB347BE5@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <6bdc161bd869ead04b3b9a651ef6a83882ecbea3.1793253633.git.chris@chrisdown.name> <202610302113.FB347BE5@keescook>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005154.79ad6432034bf65c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>Again, just like it should be. I wonder, though, don't these 2 changes
>undercut the goal of making these boot-time selectable?

I don't think so. The goal is to stop needing separate images for hosts
with different needs. It was never to make every option switchable for
its own sake. For these two, the only real argument for leaving them out
was CPU cost, and with sheaves that cost doesn't show up at the system
level [1]. So turning them on everywhere removes the reason to build
without them at all. Anyone who still wants them off can still say n at
build time.

SLAB_BUCKETS and KMALLOC_PARTITION_CACHES are different. Their cost is
memory, which is real and doesn't go away with sheaves, so those are the
ones where a boot time switch makes sense.

[1] https://lore.kernel.org/r/auITixAJMfLtfa7i@chrisdown.name

Thanks for the review!

Chris
