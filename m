Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792531224;
	b=Sb13FV2Ug0S5cjMJH6YhU8WaCSxfoGf8jzD9LDi4K26jY5PO78hqdKO5OB+4x9QR6X1J
	 Svx9vKJ3z+HmrO4oVREyCm1lxdvIvPibJwGVTykNAQ8lWH9+4X4fK2dIaLBEDbN+N+5gq
	 /ZpOoeGDMuw8q/8aeGDlcZvIKwmArGVQYv/3RETUlI0kgJvoOP5KVPEG0XQqjOlADX6oR
	 KCAfO4zK+wr/ZZ8LVY4rnNl1dXtF7f3tHAPfW3UAt1u3UnGzpliCDQbDTV6Xn3L2RiTIa
	 jiEdD5lQWGWp39Pr8G3U/1+P4ApMhLoHVMcgOC/Id5DlAO0AhkfJsZa+kU3IzY/5n2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=chw8LHvkOCiuA9Bl9ETjtRb0/vjR44eNojF89t5j3yU=;
	b=Dmj3d9FcNMPT4nuXzbLQGILxZ1yv6iMY0w5oEq2m4QE7FLSHoCccVOBTFXZ/BTaY51BW
	 LzW/QcFzdPilY5sPLK04EgV7Wb58Y9gudcfwrX5th7hde9UKVHZdGAUEyArB3m9hBDZLf
	 PNNQUVT9XVgj0XNCzXH185NltXNOFeWV7i53Ch4NZ1WhJPNegaCu9HiRvS41gCgM/KBAG
	 uhXyD3iesXUIKTK6RRBDuTY2aUyaCXcq4WER9DTfcoUUCpxdrzXDpyzdvg6YcpSf7wglX
	 DKvoe++KIhb1KtRCQpqAKBR8zsN6OiXf/2UNAwBN85gsV8jU5RN8Zcj3+G1tyioThMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3860606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3860606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43fbcb4393so380596866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792531217; x=1793136017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chw8LHvkOCiuA9Bl9ETjtRb0/vjR44eNojF89t5j3yU=;
        b=iJ2e9dzH6OpWDdX+9gqIEd/HZKVJOmAqQud7/hVj43pwto8oZzIKBVKLCHPE39Bhho
         U2FF4W94J/XxEKDUht8kVtqZRiM8d478n52IhEt0mRxLJy1Hv+ZWBVNt8gCBvL7KK4lg
         APL/1ePJyNbvV1PdsY9/6WJOSfoYdmVhh8kmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531217; x=1793136017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=chw8LHvkOCiuA9Bl9ETjtRb0/vjR44eNojF89t5j3yU=;
        b=ktb+DCDnFRnrZ58RGsS9kJLzU9BtLCST2G5M/piRBCUBemeJduYNpK8EH0UURWCj5n
         mJTsOvyOuvWX60ovTNZECBVfLYM5mkhSqxX6F+L2YvtSmOYd7AD6J0cqHn5Npy6MUYH6
         eXwpg6B31M2TnBBifd93RB3PZV+Eg1XdoRtyCJIeP2Wngv1n2cm0YTltCULG/8x5OK3u
         pwK+M0kR6f19rObkqYb1oopkWsPtMt+0ARKeq7b2nt57TVRsP+u14tpT5q6LMq0kEPp7
         T8lUAXNYPTUjcnaR+lxSW1mD8j/F1FmgbDAFpIRRBoqWLsFspcbcDmxjkTZtrir2tGoG
         ovUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpqpWezTEMaPJ33N7JjRyEqGlp6OoRCp3Pc8y/1H5w9UiTjeUtxusH1dqUK7GJVTjXyyXXTj1Xm85Lqmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsHTSFuo+6a/PM6z0kvDo8/y7kx6Y4fnT03ID9GVCjaNjbZ3en
	zafaX9jf0XkH3XFAm4wZgQcMTd8PhAFMtsQAh70V7TbfmPqIfox2enENvALKcw76gqZIyBRM/wY
	HsPJudPVqlQ==
X-Gm-Gg: AYBFou0GSbcoq1y+poVTjBkkftnS8v5pmZKn/390xed2+iEO4KBNZoO2DgyMQ6c/L3Y
	IZaqXu5xKyUhgrrLIfJKAwhlm6S/xddkNVC5yGF+b5NUPZEWCIf35R1kGBsvJgxJOzWluClIfox
	cXqde1bLk6+j6LpzgjFncR1z+BzBJjL1AFIHl1DIksyiAjkO8e1J165vGeZHq+x4i5hVqZq3i9m
	1ruG/bDqnBUSAwOmt5HSnUiKcXBu6FpAhhccBzNuoRchVxPVWQ/B2yRJbS7tmta7QpSBwWLdVRP
	JDAZ9M+vxW1AdbthaQTXESW9HbCmSPomoZCtsCfTeuy97CZnpe2qq2y9Vb8sh2n173OJdkEYs3n
	mnzBLE7ErODfbATCkXCTAHkrmjTPgoq+ba5VGppgMigVsmRNnHB3OsWjbVVhe1lnXshAKToa7u0
	4ZcEOaEqXBd+DrHDV5mAjlL4/t47zHr7gmgOp+J/wUQjMx4ICzsPNTyL8dBxCP9BCScT+kpbH4u
	4WXvwFBIayGxsrFc3k/+Ex0LPGT+I0Z8UJgZgSV1BTIl/CZ
X-Received: by 2002:a17:907:96aa:b0:c2e:513a:e964 with SMTP id a640c23a62f3a-c467977f48fmr23335066b.49.1792531217002;
        Tue, 20 Oct 2026 14:20:17 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7cc2csm13743766b.24.2026.10.20.14.20.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:20:16 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso509352166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByemunl7PVvb+doLGyfO5+Pn0lJuGF0aUw8+R4KLyr7D8UVr9xACjY/PhUBaLwHHEvaUOO+6hvbvDu/K4U=@vger.kernel.org
X-Received: by 2002:a17:906:99ca:b0:c3e:cb50:b7c8 with SMTP id
 a640c23a62f3a-c467959382dmr29830166b.12.1792531216713; Tue, 20 Oct 2026
 14:20:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019154913.1765974-1-kas@kernel.org> <20261019154913.1765974-14-kas@kernel.org>
In-Reply-To: <20261019154913.1765974-14-kas@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Oct 2026 11:20:00 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjJpuLXt5BHieXV1qBE-uoWDXKugcfGgR+DiVGVZQ8RvA@mail.gmail.com>
X-Gm-Features: AclHuK9tJ1qytK1OXr-yTM9eIoQeaSqd6mgYmdK2yrKkOU8FofcfrEV39uaS5Ds
Message-ID: <CAHk-=wjJpuLXt5BHieXV1qBE-uoWDXKugcfGgR+DiVGVZQ8RvA@mail.gmail.com>
Subject: Re: [RFC PATCH 13/18] mm/filemap: store the end of a read in f_ra
 only when it changes
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Harry Yoo <harry@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 05:50, Kiryl Shutsemau (Meta) <kas@kernel.org> wrote:
>
> filemap_read() writes the end of every read to file->f_ra.prev_pos.
> Threads that read through one open file all write that cache line, on
> every read.  The value often stays the same, as for reads that start at
> the same offset each time.

This seems silly. That "often stays the same" is only true for the
pointless benchmark, no?

I don't think it's ever true in any real load.

            Linus
