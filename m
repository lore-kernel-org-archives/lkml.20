Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729293;
	b=p1nh6AUKAg25FrORuqDsUlohRSk+04tPlevaFWV6v5bU6dvj+PvCqRfR9J/ApgLmPRck
	 +0ZCk4UW2qlhjrewxLc9zJJvbGvPevsQ24SCw1VvADo8gRucOvipD0Vw6jtslC+0lTHu4
	 +GY10sgJw9exz3KBBVC0fPCm/oeS/li6CAJMgiGSd/hKMlVmIWDI4vEdyHpiFxBfrhnQ3
	 HaBZNptus9dZX+i/Hrf8umAw2N26e49d4gaUezp7CwCRmkUGe1K0kCyDyMUZ74Vu+NI/f
	 G1MFkF2iaEZp2jwZ7ddHJXjq4ZdHpXqE0FlZH+Wj13mKzB5EMMUp2uJlKaCAlsknlnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=XzdQYtOUXxk9uHo1ZAY0NXte1croEKcbZ0UJQV9jXv4=;
	b=Qutwe56X4HCEb2wpv+wTdO/RkWQakAFmTtgPL240plBSG0B+mlXfRylWtrJnBUN9OtYc
	 6I8Tuu1LsVCdy2U/SJna4csHn6f6GWEGVKBQ0IgDywfV45z6z+Da+RkfitDQzRkAa558c
	 1y/966sqQFyHhm1lmttkfcXltMDflNbv4C8PNpzz5fHR6DBJArA+bL21r5IlllyNJEJB/
	 GGb1nMauCk0sSdbgesmDwsfWs69iAcXiKQq27NQYjJqdz2Vtm5XA3F2goWiySLo0D8ofc
	 Fccjbx3ABJcIh/L7IgBAKECL4LgBo3DFVmggkTfI1aOWsqSP6DNVCGjHARcON3rnGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OXi3MjzM;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0592E606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0592E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OXi3MjzM
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67921b515a7so3851227d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793729292; x=1794334092; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzdQYtOUXxk9uHo1ZAY0NXte1croEKcbZ0UJQV9jXv4=;
        b=OXi3MjzMySh7jSQdyjLEj5QhGBqizkgZNt0+BFbTjgfYnWeyEoPPnTikcPJrI+RwUL
         XdzbSiTlvGCLOjnAH96UkltFPSoUbWV4/EAbK6XCPxWheBVlWSqx+/RpwZ7c0p1O0Da5
         7fYXLUTDDsxyIV+uu5QbvR0/oVpkpexuPCQaYPSmcDIFGNlCcXgASyd9lBL4iAUAFVJS
         aN0F+s4R4HcBxe9wm1ru9MTfbuOkgfKhUxolVukU5zKSsqPYrTHC0PIHsDFZjgV48Lu2
         Uayh31FOzAu6iJh5pM2gMEmc91FtXFKJud/JZRtNX+PGBH+fyPHyKf6mnuMBe/Zfb0e9
         6mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729292; x=1794334092;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzdQYtOUXxk9uHo1ZAY0NXte1croEKcbZ0UJQV9jXv4=;
        b=NUy2aTtNRyRQg3Dm6yfByIvoam//fLQ1LGAWkjyzovx+C9EVFpz9cCInCyU2Vu0P5q
         jwdi0Y9ahGobIh55NdCjNMGDSc41sCNlwTCVCd9B+fKBobxeYFP3fio3XA0bAhbQq2Zk
         NJ0Iy/wczJLTvU/TgG6wo39zxGSQ4b9s46XBB4C+7B82OZFBugEOefTxC6scCqNEnPNu
         GIKzbpA8ZYeGJFaGSew+iXuWIgHRJzabqpEyWkFZHMuukWrfaxY+ELV4x6tegciSMH57
         Nuu11O71ah1OdigVFicgPgM1JNbUck7qU7qeaYeu9rJf/1P7dLP1DTTgA8cx1xR5dGok
         hC4g==
X-Forwarded-Encrypted: i=1; AKwUvBzFHk2EoilIPOtojgOokvSa5hAC3dm/NLrLg18NXI87mMyk464ZET/3PFR4biwussEnvKmgdIiy2DmKxgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z95onYtNHgDCsLBplVyeRjHDBhldY5A3SCfo15hpc9OUCuK67sI
	Isfqs+IDNd2DYphmTjTZzmVI5OzTpB5zQyHnXflv9alHCo0plyX7UYtIVL8936TJtg==
X-Gm-Gg: AYBFou03l74sg+TNs3jLPxWLqcL7zlMhpKvceGNH/qMsv3Y1rr+zP5sI+jq9p8n7wMi
	ZBo3xWiCJ07Gu7DB6+kc7H5TJKvbQru9PiaukpaNLankCxmMThUvaSoJSFOvtCctyH0EWU521xZ
	HHRlQbMlFxp5lsRlT50gEtMb2CG887oS3fnF9nI9hsNe4APNdIsrIB/Zb2HacJOO5eGzXaXY/gI
	i6kmtzs1LLGi2kCwDTRZ//WDYlrZFd2yJKL9BG0HAfr5I2r+xJ57xRfSGVOPKP2mqFJ3e2gFSO0
	aBjmCMSTZWGToFQtHaeHOXvdF11wrPTxTxSDb+FCv62uFuJaeqIQAgSfchJy4sy4Jf6chRs9ueb
	kcttgNX/OxqzC3n6fM9eUxAClbU+4nHSiIJ/esT2U/ySEjCogbUQ5L3jSc8QFT57cSSb0YemeGG
	Jg9bBJDIHEoaViL78PBhfkb+wXs/UKq+8hLE5vTHacMEdiKn145FgzrsS+mbrMABbBcl/Jc6OrK
	69Y9s1jaUdrw/QP/UDplaQ+k1GkrWPhR4UHlgmmKq3BoATyGRgcQK2KGwQGiOZj3svfUkGVuMx8
	GEeq8FVxTO5vK+aNkQYCsV+WtVkauDfu3cIw0tu8cI4fMllO6tlFqkF113IaFrdzGBVhjH4TjIz
	FAXH6in/mBokC1KZocEgHRpQ=
X-Received: by 2002:a05:690e:4141:b0:67a:8648:a87f with SMTP id 956f58d0204a3-67ba507da19mr9462809d50.79.1793729290959;
        Tue, 03 Nov 2026 10:08:10 -0800 (PST)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3700b8sm7600510d50.23.2026.11.03.10.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:08:10 -0800 (PST)
Date: Tue, 3 Nov 2026 10:07:53 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: Hugh Dickins <hughd@google.com>, Alistair Popple <apopple@nvidia.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
    Brendan Jackman <brendan.jackman@linux.dev>, 
    Byungchul Park <byungchul@sk.com>, 
    Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
    Christoph Lameter <cl@gentwo.org>, Dave Chinner <david@fromorbit.com>, 
    David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>, 
    Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
    Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>, 
    Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
    John Hubbard <jhubbard@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
    Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
    Matthew Brost <matthew.brost@intel.com>, Miaohe Lin <linmiaohe@huawei.com>, 
    Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
    Muchun Song <muchun.song@linux.dev>, 
    Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
    Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>, 
    Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>, 
    Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
    Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
    Uladzislau Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
    Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
    Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
    Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
    Jason Gunthorpe <jgg@ziepe.ca>, Manfred Spraul <manfred@colorfullife.com>, 
    Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/7] MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
In-Reply-To: <c301fb04-1144-4ec9-a41e-3c98fb569e0b@kernel.org>
Message-ID: <e0ab5329-db66-ed89-5d6e-b57f7fdd6753@google.com>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org> <20261030-maintainers-v1-2-97278f8a5f54@kernel.org> <b04d8d01-b42d-d948-b7b8-c360f8ec6002@google.com> <c301fb04-1144-4ec9-a41e-3c98fb569e0b@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Nov 2026, David Hildenbrand (Arm) wrote:
> On 11/3/26 09:27, Hugh Dickins wrote:
...
> > "SHARED MEMORY": should ipc/shm.c be added to our list of files below,
> > as mm/memfd.c is? (Though both can also go off to hugetlbfs instead.)
> > Or do you prefer to regard ipc/shm.c more as a client of mm/shmem.c,
> > rather as drivers/gpu/drm is?
> 
> I would consider it more of a client indeed. memfd started out as a client as
> well, but things escalated a bit ... :)
> 
> I see that Andrew is assigning it its own section, is that good enough for you?

Sure, thanks.

Hugh
