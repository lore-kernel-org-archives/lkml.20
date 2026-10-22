Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682254;
	b=j697Js/1xkWrvDYCtfYmFppVES7BZZ8lqgRifX+tYAhjpIVKL4VKCgD3bo9TURVV97Iu
	 ToXOwuoDCn7FEbYyI+a8lhkVH88II+ZnNsG4rRIjnPevpIX7P2/6+TLD0FF/yY9ErHW7O
	 ErruVosIs8/6vpKy4/LRTpBzfS2hWyuzSfEFJCb8D+eaWR3ZSK81mdOYriKDINN6dLbuy
	 jfVl8sVkboJWx+9MM0d3GbSARtie3Eia55G5uyv5NWMQf8Jn9qxxoNYRYNpaQGCzzgBMf
	 O9PEPeVRCCvxiVqVL6lVuaBCPGFpxGhwaXb9LbBIGSJY92M1eliEaJKTyryyxMp0MbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=nw86MTT9QYJNuk6B5SLe4LXpcyaG0CYCN6se45mv/xk=;
	b=SFQE3KtJHIHgx8x1gtGn9uoVyd+ck2kS5PNrU4nMGc8shOZBxLxdWtbHCEtI6BfR8zh1
	 527iPdW7Ssn1jo/LJ+wo+rDX8rj4jmSBps2lHLmgsyUx/poYDEDWrzRi2bo6O//DqDIK9
	 /gEGwRGKRrtVKa/PVELtnTbN6YxCqimZKpqpdsW3KAiqAHWsFqEbFQ3yVlRfvsDwXUAMw
	 6hyh/6+DyH9HkdknsXzzxGldmyNPzaWTMtNhR3wAyw9SJ5kbhiXjTUgPay29sOahRFkQ5
	 ehNJLgp+B00WYbNIsEvrKO8zIyWf0v/8TFwMkxhGVd1O/LmhWemfKYa/ETYy1ZzCXdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ggwPTk0p;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320B606BE53
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D320B606BE53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ggwPTk0p
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53394bffe0fso11408601cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792682253; x=1793287053; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nw86MTT9QYJNuk6B5SLe4LXpcyaG0CYCN6se45mv/xk=;
        b=ggwPTk0pasWSGURpBXG+Hx0NtC9nfHdt9/oYX4WsjDNReWfInHOmWAb/eE6uvhDCUi
         rlfJ/BCp/WYeix0KpUBdKO3FiSMHjH8uXlLmQabFvoarhqVu9yRrIXAO2SdpDaW1fOpv
         9bLsrnCgfGoQQ7KzECxILLPbbArhuCddZ4uiFuRFX/RW1r0SaXRaSipo1RV79FoiUAG/
         JwD45Nu3Lbcv/J/HoPUUXj6hvpsVik4SuAl0iOHnUpWBtkIZ0S2e+ZJ8+hGDzJ4JLCBA
         GGjWawyBWfTS4oikfDwN8f8StP64GX6h29tsgi2sKy3sZr4XZ+EBAQ7BHRdJHjr8aJYw
         DpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682253; x=1793287053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nw86MTT9QYJNuk6B5SLe4LXpcyaG0CYCN6se45mv/xk=;
        b=a/SMr9CF12wKBSEghnt9wa4emZN+UK3KMqMAJDHYBCr8oksvmr7pt4I4FHy3aDrxCB
         evRskOstYv3hr0VsEb+cWptpqh7uW8ES5POzPJiFmWB1J7walWLUu89JweH7KjQ11Y8F
         QSOvflPoKyB2AX8MX33EakRYcaPhRoVextPSgkMyR2EAq2pBoRGRZciuaaVksA6WjAak
         341YHDQPA3T97HQXCqonaodQE04HyG/OAeHhCwc1lgPdvIkucnMEiXDG/XXCP4wEhbyE
         5MG1kYmwSDFcWVaTGttf/0cX5QUjET7YCTEk3oZzX5mW1LbtBiq38TxiSOv1+/hZMhOP
         Mn4A==
X-Forwarded-Encrypted: i=1; AKwUvBzuiMFQ9kLEdkyq//lmFo3fnZpsBtn5hJMZk5vBDDscse4AFRVX0uAgZurocZBzAtmo8RDzV5EFX8+Cggc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKor25rmIvJE39QZubh/g2wn7Euuop+xCgT7f455om4WhD7guJ4
	JAhDDjV81mQ3Xl7M6nY8d12WxywWxKaHx83ZvMeiqBl9jWGuh+IEWDznbXSLFWb8LnY=
X-Gm-Gg: AYBFou0CXyJjdnZmyAn7n7DS5FWzdABIHzcczYm538bM4blJFNFwdwFx7KTxksHXwDu
	doXVzm5eavPF3MG3ALdvBAthJ+TW13Ij6IrhOtuFpW6h9Dh/hiG3i0PrjpVneXmWA8HNCTCzSC3
	1R2oYW9ZJG5R5SdSEBkmyW54BmHlDYVydjSwkfMtndkbQFTOdUw874Mo4dQaIi0xUDOIt2+oXbB
	mhosAWTkBcydCyvdVVg94gk7hSL2G5uMf48y1LjJhtWQZcw4h5qVW6Xgxw58CTBOThntTPzNwpr
	TNWxFLZrNxPyZldH51BV4UmEq2iSdUfsNmjFDlAiT/IpdHrNuioVvAtdQOFvjetd5ia31p7hAJ4
	n918GnH09C77fcuFTP8jubq1486m6IJDa5JbRPz/xSalLebIAqHLFwszZTttLKYynO8M04VLS/S
	zv7lKyyi+Ssv8/BNgYNfU/t4qUDJvEfeKSxrk24vfGMrq2S2sAelRLqTYL7d3eMuULZl0dzdNmS
	anDJs1NASWuMHuX5x1nCsHY53Gfi7BA7JWEiL8GeY4QZS84hQH7Z8O8JesI25MIa1eKhUcapXMB
	w3JFOzpB+W0lG0vvqOqd+Gy/9VqDOBcSisAGzGgibvipqDX/
X-Received: by 2002:a05:622a:4084:b0:536:18c0:ab9c with SMTP id d75a77b69052e-536ae2086edmr43246221cf.43.1792682252769;
        Thu, 22 Oct 2026 08:17:32 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10beb7eesm53022736d6.28.2026.10.22.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:17:32 -0700 (PDT)
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
Subject: Re: [PATCH v3] selftests/mm: merge: keep the far mremap() targets
 in the carveout
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Gregory Price <gourry@gourry.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022121837.28723-1-danishkhateeb03@gmail.com>
References: <20261022121837.28723-1-danishkhateeb03@gmail.com>
Date: Thu, 22 Oct 2026 11:17:31 -0400
Message-Id: <179268225123.3943303.2482161052665688188.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-22 07:18 -0500, Danish Khateeb wrote:
> The merge tests map their areas at fixed addresses within a 30-page
> PROT_NONE carveout. Several mremap() tests move an area 1000 or 2000
> pages away to separate it from the others, but those targets are outside
> the carveout, and MREMAP_FIXED unmaps whatever is mapped there.
> 
> Under virtme-ng, the shared libraries are packed right above the
> carveout and the dynamic linker starts about 4 MiB above it. The moves
> then replace part of its text with an anonymous mapping, and the test
> crashes in its next lazily bound call:
> 
>   merge[6980]: segfault at 7f7ebb3c1e60 ip 00007f7ebb3c1e60 sp 00007ffd35fbaec8 error 14
> 
> Two to four of the mremap() tests then fail with "Test terminated
> unexpectedly by signal 11", depending on the exact layout. On a host
> where libc is mapped at a 2 MiB aligned address, the targets happen to
> land above the dynamic linker and the tests pass.
> 
> Since the areas are all within the first 30 pages, moving one by 30
> pages is enough to keep it apart from the others. Add FAR_PAGES for
> that distance, move areas by FAR_PAGES or 2 * FAR_PAGES pages, and make
> the carveout 3 * FAR_PAGES pages so that it covers every target.
> 
> Fixes: 4e25f85b9f85 ("tools/testing/selftests: add mremap() unfaulted/faulted test cases")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

