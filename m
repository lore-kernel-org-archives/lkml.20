Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549417;
	b=jpDZXSgAacU+Oi7NL8F+lFnH5eHk5mW6eLwMG3V62Q6Pm6LuaXEde7u0LZ1eGjlpTQvt
	 U6pMqMoSdzBNP0Hy0Vn3mvLahkIvAyzoKnTDesaaXa734j0pEiRwhYplKUTdr/uIjyISJ
	 cVkU9t56rpCBZ5nyT8so53NUAtjHDlQeUAFlfthYcMrB1/ZFIFJe9jKUBRKmT2gE02lh+
	 rnjhp6GhL+39yFDIalYb9VtTWw33c7MUN1jFiUJazrf32zdYn+WXSkX3wFiNmgcQVYAP8
	 s6BaJQgAjqYFoZ7ehcebnQohqFUNoDhU/adpH1U+jzpJREKE3GZRG793UwMBSYtK7xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ouuFtypaEJ9ckJXUmMEhOp8/mEcn0FyKt1h6MgNlrj4=;
	b=tNCgQ7b7/9aK/bzwBav7Mn4q08yJyi/RsryeXTHMdcHJ9K7RgHBGcilIo/VsT6yWyCnn
	 IyZJR5wsDTm0Xc+/qYpgysw0UIfoSGB63dGfKHnP9ZGST+PAnC4sbBwro3RiKj0TbUHSQ
	 Rkkf19wcwYmpayrXC6RfUXC3t3LcESHcSV8QqcBoHvj0WJlj/JicUHA2VXHWXxIMcfXTC
	 6iTv9eLemeYVF4AKpbbtKIM3ItmpwP7qnQ9/AaBkdizCu217OSKZEUyuVA+jnQZRuIM53
	 7O9D/3IUdTNVsJLau0EtDmr0oC1NWgMn+92fgJLSD5OklIIkNK5G7fdWCTbJCtqHifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=mvTRJBiN;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC41C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC41C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=mvTRJBiN
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917d595138fso1939816d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792549415; x=1793154215; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouuFtypaEJ9ckJXUmMEhOp8/mEcn0FyKt1h6MgNlrj4=;
        b=mvTRJBiNayBZ832CCECJySz+ba/5fJXFzuDem1u7b+ZYvUSUNCsDV9z9w1eSMNPqOh
         wQfrXPnvUwf73h8+wZr5mR4HHDf0uwB+bzUjRXnQDDjCeoHwhrRoMviHfsKae+xXqk68
         MACjf9bd2krFLykEoKwkred2e/6I32/5xwEw7sv3wpvdXlPtzBVy9CVCMXJzsQ0vKxJK
         iL8TXTsz+O5axi5LOdJi6hdyulbqG155qB0x0UUy9QRNdXmW1UBpBPCwxML/AKOMMqlD
         /tAD7DVi+Cs7D4C8Ru4uy75DOcwvkAWYE5oFwnxtSe4AFxne9eNB4s/9ck75elf/q9GT
         7JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549415; x=1793154215;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouuFtypaEJ9ckJXUmMEhOp8/mEcn0FyKt1h6MgNlrj4=;
        b=0yVlyPyg5YtDLeAIGwgnLlkBMoqXK7ZL4UMnw4RqdIbRDeilHLXkYnuL4CVcnDYrUn
         Noh7Sf7b/fBKyI9SK2in5pMiuwHq9I9g+xY6B3kKOYYDh1XpEyAmxHvFCdN2i73j6RMv
         NjuANThSmdBtevFVHY7NsIOkffSaOSWawm4xoQ7URrsp0kSWRbiV2OsixMVPJbIjLPR9
         nDLkUQym5oM0CYGLcJySZAaasd+Nlyvayx4y3QSDlVX/8tCTuKYRHpaz/S2ADbJFsWWZ
         KIAk5pfn+03pUD1c/rjakSdBrUxxkpyrAxjUVu9GBAoFUsupUePeR6qCsFIOXr7Dl2lD
         Oi/g==
X-Forwarded-Encrypted: i=1; AKwUvBwg1a4ruaof8kRNqbVnPbRuU+8T7eQxt5rF4UMI7IfzdgSGXsYhVV57olWG/8DtwlwqxEO2uH/JqOTrnkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW8VHqv4poPXBCDeFwsFxRTBbjpH7hvq3FRsGhlPCpYFEa44BW
	+/MlPjZHS4f50xUiJngX/iQpnVVcTuC3q/na0tmAJcpLYcwoPofGQk4K4eKx47ddVulLkAXJcqg
	OPOiU
X-Gm-Gg: AYBFou33fPhoKDEH9OZmaG7Ctjh/e2SpUneI5tyDT8306BX8BFjNAyws03GZIw3aVAz
	9ewSmAeW4ABQjcEaPe0U59404GGoDSUBkdXmGD03F9mt+wJq/WmbdmZgVv2q0vgZ5H8eW8YV0Og
	V06qAttkw6F1+y4lxLYHWzDsiVzLWkVRNs+tCEK7dIXXYunHZRHb/A3p8qxZxzWKyWFRuFw7yff
	yYiKEMtPmde9fRKB4xG9BFA2x9FuNIzQNQ9a3JPMx5bJkD5+GgyaURpPPZMffKT5I+LkSJtzuyw
	8oDJVP/UlRv8HzzjouHNgoCXysuqCY24b+g/u7bXPpl162Mx21gnZfoXhlvWsFfv7p3VLDby8EP
	0rMtk4DAvquyvQckbH4SQ/8qQbogThXv7bVEjbnJDq5wRnJqdcLzKDAQnrH7Hb0roZFZEeaKLur
	RivMQlMLbRSE8ptlGcadSxgwc9N8dJxFd4lXIPwqpH2Sd6SOWks3NnaUng8kjsocaDPXU84t7n0
	I6BFHTUgx1ldyPLMZXiPp7KGJ3CqhNnC/2cV4KUO5N31q0gYaKHswI6s3d2eTuBFowuK5SbjgII
	md1mwgWeSlQ9O12AOhnb3TKJrQPG
X-Received: by 2002:a05:620a:4621:b0:93f:a7e:e0f0 with SMTP id af79cd13be357-93f57fd3b6amr186072885a.82.1792549415263;
        Tue, 20 Oct 2026 19:23:35 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56de57e8sm135743885a.25.2026.10.20.19.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:23:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v3 bpf-next 1/5] sched: fix stale get_pref_llc()
 stub for !CONFIG_SCHED_CACHE
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 eddyz87@gmail.com, memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
 juri.lelli@redhat.com, vincent.guittot@linaro.org, 
 akpm@linux-foundation.org, david@kernel.org, gourry@gourry.net, 
 tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, shakeel.butt@linux.dev, 
 roman.gushchin@linux.dev, yu.c.chen@intel.com, zhao1.liu@intel.com, 
 tim.c.chen@linux.intel.com, lizhe.67@bytedance.com, bpf@vger.kernel.org, 
 linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261019064157.29885-2-laoar.shao@gmail.com>
References: <20261019064157.29885-1-laoar.shao@gmail.com>
 <20261019064157.29885-2-laoar.shao@gmail.com>
Date: Tue, 20 Oct 2026 22:23:29 -0400
Message-Id: <179254940965.1919196.7604748267690139512.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-19 14:41 +0800, Yafang Shao wrote:
> Commit b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp
> to fix UAF") switched get_pref_llc() from taking a struct mm_struct * to
> taking the task's struct sched_cache_group *, but only updated the
> CONFIG_SCHED_CACHE definition and its caller: the stub in the
> !CONFIG_SCHED_CACHE branch kept the old mm_struct parameter.
> 
> Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp to fix UAF")
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Tim Chen <tim.c.chen@linux.intel.com>
> Cc: Chen Yu <yu.c.chen@intel.com>


Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

Please submit fixes like these separate from your series.

-- 
Gregory Price (Meta) <gourry@gourry.net>
