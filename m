Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845716;
	b=CC5qgquar4wlT7SSmCYL9eThfbn6WauXGr4f5OUxlX2NkScN9BZ+/xen5vW2mGFzb9d7
	 ZJi0g0CSOMRBaA6S6/t//qaam/F7YrOzZXJ4WlC5VLZqM0HOtD1HsoH78XnHGYOK2N2Gd
	 6IcGHxRjXX6DwIKSB7ia4RmnhWk0wHvr56AH5hhhS9BO/S0TLzTgEGvxQYBamok+NyD6a
	 GeWl9HzB4nKUwVhE6e9qfs8VlYdE3SVveKLbPIK4Jl7KnPfxXcCO+lDX1JMsW4+Ubh0Os
	 YVUK50IgWgg7NRVZTVBznT7Zkswmxql2HJh7JHy1jh3U0vzZoOx3uHew/fDjpzn0jyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qgPn1TU8Qzde4rDA9hSBS0Cx8PK07vtzri2WT/d9DTk=;
	b=ywcb6+QiBdNoP39bkr7DeIyCMM/ADZOYcK7CYKkGTv1nZq8Axioigi2c4MEnAF/NN9EM
	 ZISWuoXGokygaK6jo15aWF+sGnQE84jOywuSueMMTsX37Sz40mGfLXytq4jr20kHDv385
	 rvvuUXckcVW8m2jSkGmw2bSfq03m9GFcLHJP0Dpm809wD2yy99e+MBpocdqx3E/WEWWVG
	 4zzDBeBsxbR4jXzGo7cTQ9w4XlE0fErVJ1PyIRMEkmhBPP5TJ5/SqeNNpbmvcJl5hUou6
	 6vIq5Lld4vlbP4PhUalvwRrpeRltEAGKZXt7ExD/e3iPRSl6v2zeJAy/1Xy50WVgjMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NBRt4mfy;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4BC606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4BC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NBRt4mfy
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eafb65e169so873371e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793845714; x=1794450514; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qgPn1TU8Qzde4rDA9hSBS0Cx8PK07vtzri2WT/d9DTk=;
        b=NBRt4mfy4Ne0HDgR9KrLWuBscio/iQ2Z6lB6yJESMWvHsCSFujrhVnHRmw7LxuiVTn
         bAkADPLhnHAOjKkyUj0ySoS8dgCLYX8tJ+wK+WnsggQBEkxpZyu941i2c45GFwRlgW6V
         2lVJFHSQF1OrBVJsBobzbi5s43ufT4vtw01uZcOB//92NQi0uxyzkGvFCBsEbMr8VNqc
         oziO4usqeF9m82u2qDKAhTjwiORBBX9FAwgkuaq8gjXQz89jRwJ5loQboD0gH7yOUYLY
         Q0p21sILQjW+CHYhM0upBAxnbm7Db3WDHJIr7KVCnPVcY3Jp8xouiM2kEIAU1GwCyr98
         LLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845714; x=1794450514;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgPn1TU8Qzde4rDA9hSBS0Cx8PK07vtzri2WT/d9DTk=;
        b=P5G2iBRtt+q6CEy6sOrEO6ZTLLJ28txYeiY2FuggKRO5KI7WLeN3gVvE9NlGjuyQ+s
         P2uBvYHOqXWB4LeTp5ZsnZtX4+SbvoLq5NjqF9jm0nI6QutI4NMRKQ7CJTXOj6gnifzU
         uj1tKXUFijkog18beu1RWg5vRU4GKL/uMbOZ2y5y+o1ImQ6V8PS9HSso3eVAhVBCgP0K
         JnxwAU+fHW3JsMicwCysTSTn0kNtuDd/MpEDGZKHqfjLKcO2swR4L1PDV/3hgllYyZIR
         1C615iuryrTgwERGPNY8xFi5RSEA6l/I29CiXZqjiLF2LENkaYKuzePvcnZEpXd4q7bD
         i1Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxENHVGznfuKvdqU4TZ1WNlRKZ5ZSqZgNpi96hX8LJWFz+dYZ73wPdXK4ZcjQRp64EkbXo78Ai4C0AWrt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lm2vmZPmWtd//a7GY0dodfN3Wjhzqgl5LlZhcLZhmnFCcxCCu
	YxsoggBR7S0kLCSnJRiFc2j9AMlvPDAVzd+5YxqNkq/HTve5+O158UIuE7sERxtC5Lo=
X-Gm-Gg: AYBFou2mv6c4Jz0zxetlwoq//HVXNd69r6+V0ZLizowkjpckuE5jiCdaBa1FYdPPkNs
	zgAJuBYsLT942FB5h7JG0cLSMj507nRE4M29bktDgnw5vv8qevrfDCC8yzQPQNNyDI9gnZgMJhj
	CWU4ojSTWS6MuKyHBu0Tlo9EKxyfk/O6EhK4baD8EIsGbrf7BmLOvomGKre8Pw5X9UcaeJjgpvn
	HIei3H4yDPharwQYXUsbwZcGQ3ZNV2C1C+ctxbR34akdPJg91aDmUh2JfQkPieGZRMDY/IOnOvp
	UaDu/91t5IB+ZD3xeFQaSh3fVUvkn015Rt7DWByF0oKLtWC7RHS/4B9hyYLga5JQQmRiK/mi8rd
	wDd/RC44bStnLwO4SwqiCBUeIy2n3JkwKsBwOM0+B951xK5+l+lPDMbEEvk8lvViMLp0mC5euhW
	V1X4guGN1Mx2kpBOIwKLUvw6rjs8o5jNKfpgIjRiQZWcLc6frxLwk+kXVKIeG3Ym2f2+3dVQH+l
	ESJsLZAuD134zzKXgEGB4PSo8AawssqxjhB3dNYvI7O0JcRrF3o3P07YlQ/7MzCqVnfG/TH/82E
	tyIIuZ0QOBp8IEhRhldreeOTKkUKy9XI6DCYaHsBD05YhXlap0vKHKZTniVlnqhIQxTm3wl3SQt
	e1Bv5Kd8gDBWCN8O0snFqPYhatA/6d8vvbvj0/WJNfUvm
X-Received: by 2002:a05:6122:1c8b:b0:5ea:c98d:768 with SMTP id 71dfb90a1353d-5ec6871c27bmr7768958e0c.6.1793845714044;
        Wed, 04 Nov 2026 18:28:34 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8dbb17bsm3170924e0c.11.2026.11.04.18.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:28:33 -0800 (PST)
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
Subject: Re: [PATCH v2] memblock: don't allocate new reserve_mem regions on
 a KHO boot
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
 Changyuan Lyu <changyuanl@google.com>, Alexander Graf <graf@amazon.com>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org
In-Reply-To: <20261104204235.9066-1-azpijr@gmail.com>
References: <20261104204235.9066-1-azpijr@gmail.com>
Date: Wed, 04 Nov 2026 21:28:28 -0500
Message-Id: <179384570854.2089669.6686464803021518602.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=550;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=lzEbddKUD5GuDcxbx6NPlhQyO90bGHNaEl0mNdN224M=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6+nQbIa4wl9/OA85TgIcp6GUjRJ97N7P3RS65
 w/dH+wLy06JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauvp0AAKCRC7dyhM23N6
 3r6cD/4i+eGggrI9gSbQoKNbHehmvZ3DGILZLB/nlShN88F1/s3BSkAExC6VVWEMcC3UB2prAMe
 1qmdaaZsjv2/Uvifq86Kv9CWUVWlkHnoyJWKozJ7iEKfgbYRb9O6MVVGqZvt6gcDBGLapVOQORL
 N2BYhTtYvIj9j6N8vOfDgQSWnqCaU3LdOzeeMplOf3k0nRefNd4DRINPicEkKSvuJt6kgxlx5nw
 RBg/eYb1k2ki3/fW0/aQqPsWnF8xdmBf+sIDShF8msbkLqOGRC/Pbpl1ys/JZIQ2EFGm7xERkEJ
 SsFlo0Ul3MF/AKLUNZLeVwQguvXQzHFjoGV6XcEyKnkbyU82ZjGVzXVjsUxUtUTGwxgp0bGAOwE
 rMur4xHR1Un1klVmeUB7SP3LdXyUmPfNaltPEaBRVTTjoYBqi8kOlVT+quLTa8jeil3KQNhYCa4
 u1tTYYUFrP1KBfugXgtvFDpHpS0VdGexNS7KJd2Taq4bRde18lsMUvluxoPd2CjsEdxffVnwR2F
 V+aLewuq2DY7Tq/2il3FeVW2Ki4X4JCYddH9lK9F/upkQWS/TMzWhm6p9tIzT4pRlUScGIq2JHi
 +FQwVCuO7RxpxBnAZMUlg/S83bjlOVBPGxkmYFqM4Rlux4v6iJzz1MnWMt2Zbzz7+naB2qeTeaU
 JOlIW4F4aF9s9Fg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 04 Nov 2026 21:42:17 +0100, Jose A. Perez de Azpillaga <azpijr@gmail.com> wrote:
> On a KHO boot, a reserve_mem region that can't be revived is allocated
> from KHO_NOPRSRV memory, which includes the bootmem the next kernel
> boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
> then fails:
> 
>   WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
>   failed to prepare memblock FDT for KHO: -22
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

