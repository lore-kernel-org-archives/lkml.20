Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546510;
	b=HMEEu8gsX6leByuxtUDzXk/6l+zAamF2mTPrEMq4Ojyt62XfMy5G3mSGNVtZhBylmkNV
	 1+UYtj7obNwGKn/nb8p03nEBNpb+nmZ8BN/f0aKF/6ppPpoIV4Blhz8fu227P8zR5XmTP
	 LArtkDxmtoT774D5oRDhfAhuf+zsJ+VS/XhLLTc1IEpk3vYXdkp7WhQYZfj0zmHrIMCFs
	 P4SJnZswlzjU+8cFM+3+uCxKMqBZIW2mWHcrLhMkO9GsrylB+faMzU4iMt6OV6ZDN4Y0d
	 rlQZDoba89nmds587DhnvRcVPS7W1p9SJ19ueuaCA+LVSmMlm8GFkG1ncI2GG9CuIlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=LmFjzwEPLh1WnvAWN35VH6q9XGy6Q88rO7whGWc3zyY=;
	b=J7G7WEa5/6bdi7tJCXzfXLnGGPGd4rSMvlND8IeQ7MBrPew+A4/hu/VkESoPKdxLKITi
	 KnLl34pK7MfJ/NGSFU6krPvBtZ4wA3OEdkzl1BVUURXdAnZ855iueZC5LgXXKKwH0IYTK
	 EpsrGNVCf4qY8nVVl1aQA8W7xFqG7TIbNJC1eWUktv+sEpm8W6nPBUoHOFYgnfKVFZbTQ
	 QUNLjRmdPHVNOUrePnhlXTo8k8kqejcv0lih6ptsIAuojd0X1JJFvjTftmn6uZ5B/jXcQ
	 q5Zug8fQmz4QSJxf7B7fBAxjIkV4cUZG5624yuu8ICb57CrYwA8fbOvptugDzJ3uMng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=iKzF8SE4;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94791606A88F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94791606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=iKzF8SE4
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f20b304c0so83970385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794546508; x=1795151308; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmFjzwEPLh1WnvAWN35VH6q9XGy6Q88rO7whGWc3zyY=;
        b=iKzF8SE4igTO5PjE/vkTiUA/wc411ldVAWTTtqWvysMLBnScY6X1rKvxfKsCnViAp/
         h8cj5pP2Qw9AjaHlKmiDrNdR1fGFREemtkoKNcCZhqvK+xjqQXJJAo9yPRqD0Q6oPhzF
         2ypLTwvEiWk13ynC86wAHvvfOpEWGCghPcpUHfjIvhStdVf8ckeiIUQU61sKG5PRsQiX
         HPrPhqTkkWFXxcHMe7pu/LTzpgdlHxHAFVRZr7LJ5npL2CnVw2QBII4GZ0pZcUBMK4VF
         rMtA3e9cW2ujyEuULVSYOEA6g5bWxbvWPmz5g8zhiHKhVy0HsrI5+9L4G1ubVt19UN+M
         SMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546508; x=1795151308;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmFjzwEPLh1WnvAWN35VH6q9XGy6Q88rO7whGWc3zyY=;
        b=poF9pLdcNT2oLuMX1g4AGiQmFVP+cDE6Vl8hib8PFuBhvYoVzfaH0oJa8Ln+dRldJc
         j8Okaahes+9v636///xZ7G/swrsZXrDKPXh4RDZ9cGIBiiPfbj/vYvx/XjTJgk3iM6DB
         kmkljmDtLwfPyLJK/eUBdcOn9hilE2bZ4ia4rzEmsZYazzepjxD5I7e4KJkNzLA0I9t0
         GdiM7v/0O05EjvyCuP0Idzc31/BCk3OanIXFqafbpunEciZ5XHUw7hUqobC4UzX31mcM
         E/TBICVbbeV9kDuQC2xHMaxIzU0FMkteNifXXKlqyYmTSJElFhf1wcNYxxxaLTGGtFLw
         dzaQ==
X-Forwarded-Encrypted: i=1; AL+hErHHPJ8BlNWwedSnRjh7U1jzXsPNPcBOx1rWveMl1LgpYJiO5AKk98cj0qZ4dmvcWn10V4NicZXEm9pflKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bo9UJWULNj762ShCjwnbPPH7US4c+4eniIZmbjz1a+5ZDQSnc
	xyl6DaObvydA0FuR85h56TF+mahL6ZYM4CuUoNPXbLZDIa7SNvPax10vTIPcTC3iHfY=
X-Gm-Gg: AYBFou3lyGoDHgRSKF62vO75lkNmvAXRmG4wUEG5+YFOU4mMuWDiiqWZWYt/X6MOFAF
	m253gX7y582wWltGdvGhv10u/TSNRFnvJAdy69PRrTvgESIR3NYqkk+6NXayS3ySQhF7pp2e47W
	9IJUQXR36V6Nc1sQx5MGrGDCKtCt14eqkFLSOPb7Aj0GgUYwxVKyzOhwPNOIAcwEcb5BIAMNkcD
	MrgMQQI52fFp2AvXbhBETDW1ps1RIg+A/ztXAqfTZE5OHO5NRudBK0nn7YPrppyi6WLGhhLVrYw
	9XmMoxIR5qPSd8WTr+rkE+mSsy9xa7OIEGR6nRK0GbX1KsrW17ud8ua+HVLvzFEP31B7iVVeC9O
	2ErPayiNY8uJ9qwQ+gSYD9qMeS1SG+MtXlwrzsKDBEfNPkP7zWpyMILrhEjGFn1oq/6fThq9yas
	elBXBhKkNvisqRbCTzhBgEgnNGgnrGXHdhpdudt8e9ga8QcG4uWzSHD87049CyJMMcPB49+G7P2
	hsgTybSnuhAo0Cf6kdudjStbTIV/sUbwFn7xccHY7UIOeh/AiIkrUFkl/OY6DAAkLVDLs6JOTzd
	xjqN+5MtwdfctuUwsGjb34uXedEcpq4SGXnqZt+xMX+jJHLV0M9kCnmaFtz7VOpUMDdGyDs8P2x
	UkQYRyXfxlX4BIKtUiM8ZMh0w7Qichw==
X-Received: by 2002:a05:620a:2987:b0:93f:2a56:2772 with SMTP id af79cd13be357-9494bcbc465mr254819685a.78.1794546508039;
        Thu, 12 Nov 2026 21:08:28 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d452b0sm12300596d6.11.2026.11.12.21.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:27 -0800 (PST)
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
Subject: Re: [PATCH 05/12] fs/proc/task_mmu: write-protect device-private
 THPs in PAGEMAP_SCAN
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Tal Zussman <tz2294@columbia.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>, 
 Andrea Arcangeli <aarcange@redhat.com>, 
 Suren Baghdasaryan <surenb@google.com>, Balbir Singh <balbirs@nvidia.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Andrei Vagin <avagin@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Arnd Bergmann <arnd@arndb.de>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>, 
 Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org
In-Reply-To: <avYQteUm963AKJQ7@gremlin>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-5-00713d368976@columbia.edu>
 <avYQteUm963AKJQ7@gremlin>
Date: Fri, 13 Nov 2026 00:08:26 -0500
Message-Id: <179454650651.482102.17667443707760097412.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-12 19:34 +0000, Lorenzo Stoakes (ARM) wrote:
> On Wed, Nov 11, 2026 at 12:55:13PM -0500, Tal Zussman wrote:
> > but does nothing for a device-private THP. The PMD never gets the uffd
> > bit.
> 
> Sigh yeah. Device-private feels like another 'just have to happen to know to
> update X million open-coded parts of the code'.
> 
> We really need to find a way to abstract this stuff.
>

I've poked at it a bit, but zone device creates this issue in many
places. The core issue is really that softleaf can mean 20 things,
and the number of things has been piled on heavily.

I don't know how we solve this, it's just a rats nest of complexity
at this point.

-- 
~Gregory

