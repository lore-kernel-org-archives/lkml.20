Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825714;
	b=ucQh+6IAxhrUV2uOhRRg07ipn7Ib+dScGFlSqtYBN9iiJitrLY6BQ/wwnLyv2rqLPfr3
	 I+0O+4jzE1ppL9TDQosXLC7O3Oy/VieACA4mAW8kY25JuCFnHV45sXFCmj/tk+MkbIS/T
	 yLhkv/19imhMwSpPx/RmEk3J2rv0VfyD0iONCAT1kkPF2TgcDxLRtNiB+G4EgY9/xMhiE
	 0ICsYv3KcaWFp0yvb2/yjoT1iWL0V+BO9rrlU7hBxm/mVuj9vdZK/quhpP3Y62aW2sk02
	 LCf4W6OhyN4wn3IYdju9CzqlBX3U5sA436EEKBPWdRpXnMCMOyss0+WaL/a54a/hJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aqgdpi7gCkH60Z/isUI3USxyApBzH2FtqkjwxCL88mU=;
	b=xAiEODsSt8Syx4FClI98ZWMm9hd3IfbtqJ2UfN4YFmSmHaRoyk3L+M0hznZVHpTDVp7c
	 F7MgWj+6h2tYMAdpVB9tQSjgbFl9JZAdiqo9aoADiO1rB8zNx+nOAuCLTQPmWJFxdmm4g
	 +ccPRZXDOVCacjvLBzjo3Vcy7080E7225rp/907PQ+W+SzqEo3eDrL/IijUGfAQqOmCfr
	 oWzFFCaH4/vLjHZ+gq7mDQCvLVPC6d2jV9Ghvdiy7C7PjcVj7YRxdnO9C/fYJy7Q4ZH/b
	 hxbnI5XxE6aCKr8EIopU7V1E/i64vufhZUEzOAFqrjN+90mLwO7m9/NG/xDIRe0J7qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lIxdpSXq;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F46606C91F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F46606C91F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lIxdpSXq
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eabf243d05so450827e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793825712; x=1794430512; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aqgdpi7gCkH60Z/isUI3USxyApBzH2FtqkjwxCL88mU=;
        b=lIxdpSXq99VIDdIspVd0gvVCb9wifiaAaBabNkI3DNaT5bDXiy55j/4xixTchm1whp
         8ZLL4TgdchoDv8orlXL9QS+bgV4oDBnLcdYj/VGFOblzSWo6w30F106Egm3+783xfAT7
         i86F/uF2eQGH/frDgusZv4asfiu22TbWXX1VGMMvlhGluo8NsdzCJi1MNldPWXTLG3BO
         Ycrm4AS6mEzoPvtyWlJOXgs2q6PBox20Vw/5tzOaF8FPWt+Hzm8KFgvzjAGmzMjxl1Zy
         uLchhyqaQZhykH9v8Gr4WqsFa7vL9j6u4MXkFp50/o7J9bJHRSlMOV9GT9AAq09N3Awt
         Q4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825712; x=1794430512;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqgdpi7gCkH60Z/isUI3USxyApBzH2FtqkjwxCL88mU=;
        b=0Xc/waVDornu/c0PSFpZHzwWRpfFJIunBvs+89k9f69T5aAwCOLu+mV+1ygkFbd2UZ
         tM19ZuboCMrObNzhhNbe/4QUVI93gUEDHN7UXX2pyGHGG+vrR2d6VXcWrv7vFT2uJhsW
         KYYQm+XC4+KL6YByR8RNKV/43aA0VAbZf60Q+vZ7lyEE48riYaLvqJog+HofBd8h3SWQ
         A9DT6JEE1zEtCilfTOtzxK7Tn1q57F1zCQGbcvWDPDt4dIuQ0BXz6R886b0rwCrWLDSJ
         WDhmUdTYoA2Bwv6ooPNW9IYv8O9OmTfjYY+Hrs9sFMR1VcyZu9mlGvDYav9HQaa0L85v
         x6yw==
X-Forwarded-Encrypted: i=1; AKwUvBzNwpu+r5zOHdNZg3yVnx5wtmWaGeyqgIhdVtEhooc3C8yJ8SZRihu0XpmjrVhg4igYWoA0eL1qEMH/hgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mQ0HAaJ5zB3t+u0+MpTMW+882NzFnnNzsWCVXwL1rJbIL/BKH
	JRvegVf+ZeM1FiwNjGQ10vIAkB2WrsGWf6NP49FaAE1tuk1XSjDz1BKzoag46nxB58w=
X-Gm-Gg: AYBFou3v20SzCtuvZscozjXOrJnek9UmTqc0Oa9NlMyViTdY9XLz6QfE38fO8b6DG6V
	nLwREAENdr9LPLX91KkjHBJHaCayIcK80Rv3+F28QU+hHzQ3b2f3FOkqawCxTD+piRv4KAsHB6n
	ej3BLGyqNE7FPAH5IUd4Z1OXYyZ+H/4BCqiw71OJW40y5NCbFo+6a2C3STmqON/xWv6785n8WAB
	VGxO/nIQlZBt24Xevdj8TFyU/dxVvbuxYlExyN/pl4U9dYN92aA4I57ddbXnrmUjUh5Q9mXP/BV
	KLIHGF+m1w8YnKUA2TIJeTsNbVB43GKVQmbuUueehM7L2FA7dsKEzG02iYOscqqkpHj38l5B+Kj
	s6X7b2Me12u/siDm9U13NlUye0Py8FerSGwjZBpu6WBqRqW/a5w2PYjSpiG2cAdYSpMtCsn1WsB
	hivb+7/PqUMB2gR5UYo3AiWQGnGwxuiDBvUJwc00Mxu61Ntuqgk2qGULNRNasPXEaZJobQZHdbe
	/ivnxMGNJcdG03HKcCG1Rzz1pT53QTqa0HnO9Z0x1dgJhoGLBnUY7wOsdQYRjDvx719NkWHHxVL
	7lokW/8TbXZCVJYUYYpyqWFAtg8yfvewk153wQQHJoJO9StF1fcNzNc8yviT0CSJbCuL672faM0
	EAuop29rqbshLh25fT2Ogy7O/PntcDfTo16bN/HyfbLizGr8=
X-Received: by 2002:a05:6102:1623:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d072c2ba18mr6112103137.14.1793825707582;
        Wed, 04 Nov 2026 12:55:07 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d212bsm2888015241.6.2026.11.04.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:55:07 -0800 (PST)
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
Subject: Re: [PATCH v2] kho: Remove redundant 0x prefixes
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Changyuan Lyu <changyuanl@google.com>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104162352.140836-3-blum@kernel.org>
References: <20261104162352.140836-3-blum@kernel.org>
Date: Wed, 04 Nov 2026 15:55:04 -0500
Message-Id: <179382570401.2089669.6201187990672133004.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=nf/pbrG/3HMY+E3Xb9PYIXXf5eFKpBebgul3T9w7Tns=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq65uqenFbBMaztBsCNPi+5jP4Gy+jdHDzzMCE0
 AC8artOAtiJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauubqgAKCRC7dyhM23N6
 3g6FEACxKJFKSeWDmcpF4MW+HdGHBych9VYleOaeLks4H5Jobe5OdO4PZ1BxPgjlf33ihIu0Cvy
 qUJll+5ee/BP7ue8XHEoKp+bs5J7/hJbsqiU9RBst4yORNBrHOTl8M1xUhUG2mLxA8t+3Q1zQqc
 JqLug6dfJmV22HOKmvtZZ5KnHz9hvhbXBWMpwgnBkg/9/dW/Cy7pZSeouW9JY8018P0hAAl7yET
 Gffrvg4Q952YZhd2yBktR7RjQ7nwTM/ntrpQLek4b7CLUg8NpCezTuNXXvkpi3ijzsJyluEzX9P
 SbLmD14CRvA8bQtgoW9rAKf+h7aRMxeemVftJ6EuV9Rr+ydhlygMqW9NTLTEHVEH+j8L8ULw9ZT
 tYXpnXcjNN6SUxD1WAhZd3UWDlSb5i4VemuPUjoaMgTp0Pxy4gbnkg+w/KZl/ytltxii7mMBjmv
 oaY/iz6jEO3XpHdRGNVCENGOesj1my4WTYt4aJikQngaKQyZzTdPzxjJFB0tllSy8LZ5yeojFbG
 1kTU5jsSvUOmJTifsIPYsrapvlZMhaLTP4t9nS5qGAGYwORWKAoHe46sW01S9FfU+PUhpjv2ZXU
 D2jgjT+p1VLkkOI59RjeZ1Hi1YLkfqzORCz1Tgxqtk+R7Rl6ZcZ7RZxA0J/I3d4mzxn0+gtKhfS
 04eqDdxWL00PXFg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> The %pa format specifier already includes the 0x prefix. Remove the
> redundant prefixes to avoid printing 0x0x.
> 
> Use phys_addr_t for size to match the expected type.
> 
> Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
> Signed-off-by: Thorsten Blum <blum@kernel.org>
>
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..6a7600a0a7d5 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -2010,16 +2010,16 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
>  	 */
>  	for (int i = 0; i < bootmem_cnt; i++) {
>  		struct kho_bootmem *area = &bootmem[i];
> -		u64 size = area->size;
> +		phys_addr_t size = area->size;

I am not sure; having a variable size of type phys_addr_t looks strange 
to me. Furthermore, KHO only works on 64-bit platforms because of how 
our radix tree is designed, and we do not plan to add support for 32-bit 
systems.

I would keep u64, or if using %pa for u64 is still an eyesore, use 
0x%llx for the size field.

-- 
Pasha

