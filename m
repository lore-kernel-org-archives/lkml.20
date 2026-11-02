Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624570;
	b=EYs73UTJVIr05eIZIZ1J2O+WOxegFRNAfec8AR8lfjfGJvec/Hvd091HZfN3FWZ3vsIm
	 b3cUScJyXTtL3aOahx20vQf/CbhfA1DAuTMLOSr9vMkuMgZNO/ru0aBTvnn8csVMhQbpc
	 ZtPe68zt+Hxl7cKG8LwYnZnCafR892wuhetTSPiF+I/9SsutrsHvOdO3xgQY90zzXBWOa
	 NYZcXaK82CesKltV1+hn7CmXZXQJDegCGXzNMVeez1TSI/GzjdjFu1KYwwY4+T0c4HREu
	 BsZao4wT5Wj34kGzY7ZtX49wbkvBa/bB33GUBZxtsUVaT1T076IPqlmklz+a5iGV2iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
	b=z9hszdjJvlntuca225fI4LAgnXQn4hFdbeUWe3ad2zDlU/e6Gh1H+3xIwXe8uAGou+8g
	 /6VJaDGql9E9MsXYOHqgmBmgLuwRMhHKtYoEaYFRr+3Jez5qV4p3CsD6NUO5xDQxpgwjG
	 wOvhQlwNWsW0mslt5eWsBqj5Lee2Qqv6y3JHPngfd1SeEAe/BRveMb4ocCN6LfRhYH45v
	 YABOwXkLnz/DUNB3l5KeW4Xe2rQ80dwA9/AAwUm4upThOeoWjsV1jlIxwW7ZmOZnonS6N
	 Zf+u3VFnK45PPjDLI0dji/51uQXdCx15GQEkIHNV+Xb+qP3dTz4SN6fPAvQ3V6M2iKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJsQCXJF;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F440606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F440606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJsQCXJF
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e538951d07so29853275ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624569; x=1794229369; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=wJsQCXJFRWh2ve+HWhDOpjQOdlRDBfvJKdhwPhWQIWhwYEzH8Kol6MroShdJfHbRuy
         dlneoiPJOZzcvfFBrx073sUxp7iKwFRxUAzGxV4z0yD6imt13l/qOSUeerUH+PGM0h4B
         l+TJGfAUTMJ5Iah6psdlD8bLpKljdsz4lugF9Om7wZbj66ZsMac1gdZZMCNRRM22AQVf
         0UUsD1ConCLu34Yas1nA+xONN1JRfdOcqmpgBzKxrBhW0UBewaRNqAXNY3xpWqYFQf7h
         ubzQgR/UOgJZNAkgBQsb7w/hfVptEG8vTEEQV95lLHbahNQLGympw3hLEoET54u+FSTI
         uyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624569; x=1794229369;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=W00xjGu0r3qngNw3x/XJsO3Edj4RaYh/s2boTuF79K75aU8354LU5xn1OISK4qZBgB
         u2GXHvVrYiDQYClhUtaEevbOIK5fLd14OU/Ue2n1+2nuNCAm1q9vA9KR+uYYmT/PwT/1
         yYENeUP1+q9FVzQeeJpvFwEMuiHDkYdfiJjfBRfc8jn7SaaAvj64QWu95b/otOyxjJ0b
         7KZaysIAzG1gf+DWQ+TNTlKyM1cIg2XP+09cpeqr+0V+Ly0yvsSO1KTGhtFuo5g4+bwi
         VjiFt2NIVSKjFM0h10kd8uc4RU8OVrpzg949y9QV5ym6t7XAReUrIGTyRSJaK+V8EKJ1
         oOfg==
X-Forwarded-Encrypted: i=1; AKwUvByuZt6D2/SIq/zYaxweRJqEYo39PIaBrVhPRAYjlA442Pae9sar5nzOCVYiGc0XOJJ5nduuYg+7LWT69GI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gNCuVl2M+idic7UvqeBtGk9Gq52vlT14uTPrwzzIFoeUO84ck
	7CquvIZoGg6WtXOjH4xPsilSGBgoYB/DjPg//EYC00zLH0b/7OMvq3b/
X-Gm-Gg: AYBFou2ib5LEZhVtv6hZfKeYWfP7bIpFhb0lcyUZBdzlcp4cFepazQODct7JVXehOpi
	9MvdvBKwK3uwatxUNWtXgCFfKlXM+sLHhuOoK0f2J8j5hU7mRytxn8tH+DNzacUagNyF8hR3FNS
	nrs1Bpn36BMosnpfa12Qn1ZKI0h3C7Ps2PrqnoQMQ3x4SHCzaaZsKXc6sMvyuclcGqcm1TSsSiU
	3jONusHlnBpA9/48bCbtKXbG72DcBGeKIKyeMJTR6gqQLF4Fb+bSYjk5K3mgHUYxvWzNC5BpHHg
	Q+hwraJTq5MqKhqxkmQmIFwdHQLMRQzGFnehnFGSvNJCJY4B7rrPX88O++SPz0iZMpbMBnWkvmC
	NrXADVf9JEWm4IMajw9dUwIOsH9Md33/f9Tf6KNnhuF8m9Gk4cm/kA18tqS0VhkY1YR91tvA0ra
	+uJRIO7BzIt1yXYo4e+W38H8dhxiblFK1fRlcRnnKH4ctmYkVjRQmVBz/ydKmieeol4ZKD6MiA7
	owmlsvmwEYykthOL95Jjdz3YNSGSMek0I8dh4I60+4juYQITQicgoykM6WOoadT4WT2ysdb4paJ
	jGfBEKhuvBUtkOYC4tARyJk53Sbb3CbsufOfHQ14MQM39BAOQVvVwJAQ1mxJROz2p3x/EixYJ4r
	1or0zaIDCXFJG21UTPQyQWUEzWK2fOL/2AeM2ruax3FOxvQ8XOr9cnPA=
X-Received: by 2002:a17:902:db01:b0:2e9:8b2f:3561 with SMTP id d9443c01a7336-2eb3650034amr96629035ad.54.1793624569079;
        Mon, 02 Nov 2026 05:02:49 -0800 (PST)
Received: from [10.131.7.109] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm27542985ad.25.2026.11.02.05.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:02:48 -0800 (PST)
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
Subject: Re: [PATCH] mm/hmm: honor write requests for owned device-private
 pages
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 02 Nov 2026 23:23:28 +1100
Message-Id: <179362220860.2958105.9509793190720553695.b4-reply@b4>
To: Jason Gunthorpe <jgg@ziepe.ca>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Danilo Krummrich <dakr@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 dri-devel@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>, Christoph Hellwig <hch@lst.de>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Honglei Huang <honghuan@amd.com>, Jann Horn <jannh@google.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Leon Romanovsky <leon@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Matthew Brost <matthew.brost@intel.com>, Michal Hocko <mhocko@suse.com>, 
 Nico Pache <nico.pache@linux.dev>, nouveau@lists.freedesktop.org, 
 Pedro Falcato <pfalcato@suse.de>, Philip Yang <Philip.Yang@amd.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Simona Vetter <simona@ffwll.ch>, 
 Shuah Khan <skhan@linuxfoundation.org>, Sunil Khatri <sunil.khatri@amd.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Zi Yan <ziy@nvidia.com>
In-Reply-To: <179352350180.2.12918668886938034091.b4-reply@b4>
References: <179343062238.2.2773026701442863377@gmail.com>
 <sashiko-outbox-192310@kernel.org>
 <179352350180.2.12918668886938034091.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi all,

On Sun, 01 Nov 2026 19:58:21 +1100 Aveline Noir wrote:

> Oh, I missed that. I'll try to fix it.

While working on this, I found that the fix reaches well beyond
mm/hmm.c and would likely need rework in several subsystems, so I'd
like to hear your views before going further. v1 shouldn't be applied
as is.

amdkfd holds svms->lock and prange->migrate_mutex across
hmm_range_fault(), and svm_migrate_to_ram() needs both, so it can't
migrate the page for the validating task. Migrating under those locks
can deadlock, since do_swap_page() waits for the device page lock, which
a concurrent CPU fault can hold while waiting for svms->lock. From
reading the code, amdkfd also maps such read-only pages writable today,
as it takes GPU write permission from the VMA rather than from
HMM_PFN_WRITE, so GPU writes after fork() would be visible to the child.
I haven't been able to confirm this on hardware.

One option I tried is an opt-in HMM flag that returns -EDEADLK and the
page address instead of faulting, so amdkfd can drop its locks, fault
the page and validate again. It works with test_hmm, but the amdkfd
side grew to about 550 lines across the GPU fault handler, the restore
worker and svm_range_set_attr(), and is only compile-tested. Read-only
entries also come from NUMA hinting scans and mprotect(), so pages that
aren't shared would be moved out of VRAM too, and Xe and nouveau would
see their pages migrated in the same cases.

Would you prefer an opt-in interface like this, a change to the amdkfd
locking so that migrate_to_ram() can run during validation, or
something else? I can post the amdkfd part as an RFC if that helps.

I also found a few smaller related issues, and I'll send fixes for them
separately.

Thanks,
Aveline Noir
