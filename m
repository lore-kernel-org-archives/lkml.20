Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A58A3A1A3F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262473; cv=none; b=Zv/SIBxCmt/7Z2W3uNv0sdpq9WRTrsMwZtzdzj+cJPpZhY305qh0JxMRrbFNbW9c7/0IT7AgtuEoyOHln9ffxBIc5s146j9bKue9ApgllTZhhKNUxKzcQyvX3msZ5521Epq+T6VRUTCzj3RM0r9Y4uMUuPRGh69qgnc+AHV5aFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262473; c=relaxed/simple;
	bh=TIKzMnSfHRfSJi0cG52yB5rABDj86WRUi+nwa0bIuTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZmJbvOSKKFMeaPA2PILoHlLfnBnGzohFyrZcYQ2aGMA+QGBpkKEvlHeFg1HWvmZfoJzZ59i+y7hFkhF3Ul1LSOznX3O0qWH4gT6Q3HhMYcr0/eKTOut+KRXUAcL9002cU1/5h10CVlgQpY/w2EOYB95Ct4tWrDeReQ1DT3i8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOJj5ikz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOJj5ikz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1df146015so2465195e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792262471; x=1792867271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5FNedh0SyvKi+ARXY2mJft6/hxvUajq1URxM9wpjPw=;
        b=AOJj5ikzDiqhoRtyzGHFK5sbtZN0T87Tfpm4gwYVLpBhFS+tlCSNzFrVqHJZMFUYjG
         G9LJ9fSbVwvhaNW3O+gCmxnA8K41U/IjAT7TuPx7poznnEkAYl7o0gIxEXqBYo79RpeG
         Hs+IEJYC4+/N01Xha3tYnti4PFrleZRkiTDultfkwKHzFgfGteeXmPl4Fl+g8u0N3nAX
         YiVtpR5bQuI7rCTxsqFT+5mDwHZhbfImn+hAzkXaISzg5vN4zfFrir72/Rl2MSRuaGDB
         LtpHctFobsthWfIWjQoWEwVIXw1VaWnp7XM4LGKToyOnBsDsX5Mqjvbx9AI9CSykh1Gl
         eDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792262471; x=1792867271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5FNedh0SyvKi+ARXY2mJft6/hxvUajq1URxM9wpjPw=;
        b=C+1P0BpeJI+POosoEH5Oc3D4zMSMwSkAqp+nTN4us8nqWhqd9xeE+cCTseCNS8FBCw
         KSHslmkyBLT1ggA3ik+5w9/4QtP3UEkN5+145mGpKCF8a3SYWNaZZH9XQtdgjzKsYPaK
         5hfkhrIX6gOM69WENjJqHVoQClevwxSWyo9BezRtTpl7NiZe+lDUJ81fptESJXH7mb8n
         fRG0Ta6cXJ8ZxrHN2V18vm2ob6IDYhbXriUdH0eVi4iaDdkmjS4tO9XhRUxTsfpE7swG
         xbhzmR283vBbaM1PBpaQkrcf63uJHrv5Zsi7+in7Rcoa6Ll12nLZ8Rtgqsnmu8vu8ZR2
         fRvA==
X-Forwarded-Encrypted: i=1; AKwUvBySgRtVDVkWBPQXNCQsp156baWdO24qOLwWMh2MBQ0VhlR2H4s0rjHTzdsBYFiGpPsSIyVaqOArYvBEN78=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX9yraCr75K1MWr54VSBy2nloEJ7rlr+B1ayBoBn233I9E7Cos
	HmmihjRP/rWa7A6m6+bMytlCMPDRVynoTeAykbacP0syzSBDwb4l4Mq9
X-Gm-Gg: AYBFou3RFRKf5+LOq4SKaR39jHknsvZYaw2sAEugVdZrqSH5h9RyDdTqKwvnP+Drwxe
	oQv18ScikXcIFnHsc9lixjiqkYHYS+Dlv5bfvghcf2z2nZyuvw83UmGRc5Pp/pyc3oyqJm70/wX
	E4jNnoFwYBla2LkXhZ9QljBUznobh4D70P9LRLZK0NOyd4ReupQcuYoZsnacnUeDLIJUoww5H1e
	ACBYtv5vyZGqs0NMeMQda3eRvdMv17h8zDxT4Ql3HOVMjXToGBqyW5ZbncJSd8DwYLV5EjmLsN+
	0oNx1+LRoskAOluJVsT/jEkAFO1SqPm6QF5ZNbN8hLI3UmVgWAijMLzT/r3gxTN2s/tvDBAnS0w
	chVPCRBQsZgHYqZgRz+YlgpyZZ9F5nHto6CeYI2EnXoPHKizpIj7Wh3PhaC5oIkZoihhzc00MqB
	QGRAoHeD61qMOMyUD5Up061+G2Fbqrs9TEsHQaCXDqpRsHYWRGwZgRpMD4ihhBkKRYyw==
X-Received: by 2002:a05:600c:1f8d:b0:4a0:1b14:d00c with SMTP id 5b1f17b1804b1-4a1d75ab306mr81479515e9.3.1792262470338;
        Sat, 17 Oct 2026 11:41:10 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm49895585e9.5.2026.10.17.11.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 11:41:08 -0700 (PDT)
Message-ID: <ac34f212-2e51-4298-a281-9380fb0d073c@gmail.com>
Date: Sat, 17 Oct 2026 20:41:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mm: hugetlb: track CMA reservations by page order
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <57cd5cac5e2749cba24c502bcd9682ad8b9f2bcd.1792136742.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <57cd5cac5e2749cba24c502bcd9682ad8b9f2bcd.1792136742.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 12:07 PM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Prepare for a separate CMA pool for PMD-sized HugeTLB pages by organizing
> CMA areas and reservation parameters into pools identified by page order.
> 
> Select the corresponding pool for allocation, CMA-only checks and
> boot-time allocation decisions. Release folios through the CMA area that
> owns their physical memory, including after demotion.
> 
> Record each pool's successfully reserved capacity. Remove
> hugetlb_cma_validate_params(), since the per-pool CMA-only check already
> handles missing or empty pools.
> 
> Continue accepting only the architecture's existing CMA page size and
> preserve the default pool's use by all gigantic sizes. PMD-sized pool
> support will be added in a subsequent patch.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

[snip]

> +static struct hugetlb_cma_pool hugetlb_cma[HUGE_MAX_HSTATE] __ro_after_init;
> +static struct hugetlb_cma_config hugetlb_cma_config[HUGE_MAX_HSTATE] __initdata;
> +static unsigned int hugetlb_cma_nr __ro_after_init;

the commit message prepares for one more pool, the PMD one, and
hugetlb_cma_pool() folds every gigantic order into the default pool.
would a fixed pair work instead of an order-keyed array?

-- 
cheers,
jose a. p-a
