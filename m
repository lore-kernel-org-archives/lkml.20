Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753039;
	b=Qxa6qMg/LapbC8sgiblHt7lbxP7Jt7F7usN1eCI56Ca3kzpnpqyqUAR/kcNuWa1z/d/l
	 +GJz1SufP3C2Vr4/+qnKhHxtcVyFEZcnqeXocGQLWQ/J5JRkmnZu2viv9CEjUeUAlXE1F
	 v662/AJQS6gL1AbsTwf2V2WKYKrK74O3XeJD6Yqu86aN+JETAGcxSL0c/nZR1hBc1Vt6O
	 Isiaxqvr7jzlfBDL7RhmsLX6jRemk8NU61TiM7dHEKL3jCzzwggvhPJb9nYnYmYyIAFlS
	 yIgJ0nGvVQDufjZnyW9MGeTDfzrRfZb4yu6EFE1ac/dy3qiau/rqfeZ8hjS+AgVOvbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1jCvTwZL8MS+SjFAQ29LXN2yWrpb5Y2gngTvzYEqhZ4=;
	b=s89iZogMkwynWbRI2O2KjoImEs9B0tH9MeeUyJUAXtUz8qpjF0P3jMRkrEX1xLN0v5k5
	 cUep9lvCtM5Ffr22VK0ugno1p6VxvVPEvTbfJbop+X4K80dq8uMkN9hST1d7tSTnvxcLy
	 TYeKZ3y0W/wtpvTSdZzzlwSbFpDlFQKPJNerqpSO3R0D+/Nf29TdzRHoiDK08QNEWxCyk
	 01HTMK+nf4zUnue48rHkbDK/08+zg89RwoXqYZteX4cLIvmuPLhWIVomMsh6zCqLsbj9K
	 j7tkkJ9I9ZBHC5e7fELy2PiO88/M2aXhgcSpWMeDmSm4Yy+BQhEwupHnTaMEi9RaQCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="g5NDz/C1";
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE1606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8DE1606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=g5NDz/C1
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so43111137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793753038; x=1794357838; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jCvTwZL8MS+SjFAQ29LXN2yWrpb5Y2gngTvzYEqhZ4=;
        b=g5NDz/C1NgO7qdNHV0g6Pc+ihYOYw6llkbuPyOfMiLLrRIbZ4/7girC5Al70pkJVcM
         lKM0GU+iyym0MtqjHoRZCQ0kh96fMfT7cZmZqgrUyWjsS42hqfBrz//rm7OFdqSTLJBI
         ztDbzt6y7Fn7HGj8W8pJh0lW4DvoTQOjrBJ1pgllXShYT6fLc6snFBCpYwEGiOqHSY1S
         fpzfVJpRg14CX3n/mqn9RGi5hL7bzJPAqNKntI/PN93FkPr1DMJeYLQZ29YO/7sRnwOR
         X0zYunmlA05MRfOY1Phjkf3CwFzB5Cj/HFyYEMVOOjfOEy8baTgC68zW5TPuSysRQ18k
         7y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753038; x=1794357838;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jCvTwZL8MS+SjFAQ29LXN2yWrpb5Y2gngTvzYEqhZ4=;
        b=KQWXg8WAGSYxTDKnESOXlVRsgQ7rUchj5eCjo6cLlxpWH6zKHDJY1jpPlo2cinLcuF
         iFWhcOq/sq3rH9EBx5jOyr2c9lHFzjP1AKvgMEfx7Lq9EQJDf9x9if239KOe0qk08B9C
         v7fD/zDzrOUfAC02yWP9cv95AY0Tm+iqZKpci23DcKeMPvK8yxHEKT6JwR6ltINkrJ0e
         0MkipFszy2S2rD0e+viopx9Rn7Pk67x4SyQ1I5uz/W6go/7c8u/140fZbxCQT6n5buMV
         9oernwjwedbZDjD+yak9yJjim3tFMwVXhkzXzBMO/Xb4eFJdytVD6BYrgnEfjI2fo0NV
         qxew==
X-Forwarded-Encrypted: i=1; AKwUvBzMwrUPkPmHs5arFtzukiFlfs3AgT3ou6kojJvBn2IOUvi+rUKvo6hqXq4C4KiAeaHMP95Qon3PNj1CJRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bl11/i4HaL4R/JUbS24eFLiD+CJaxONeEe5ONhOmJGwBcb+7o
	ZLO4EVJ49Ylx2zsmKQ9VYOBFcl8uvJ+QwkBB0u088XIjt9RrJdJiha008OTo5tQuQJA=
X-Gm-Gg: AYBFou2TGhNFS4PIW/EaDhB/Rq2LIg7p4YVzU3mB2hUpGUD7DsQhvrVCbb7Z5hIcOu/
	Bri9uyxa1Kut2zGFimgxalduJBCWwBxvG6aHLwOjfOMV4cRz2rKRqlO1VDU8UV10Rs4Z9tgBIPk
	fOvwF0h9pj1RJMFSTYPEvScIVyRnilT4zo0ff2twOTDwia85Z40snm8n2zg8zqSjeD6bJm2XDq3
	RjqXhRhlP7niOZ0Zpev/FAWkLKxax/GqjIvq4Ky8c3ogutNdY2gM2UxE6iQzWzO4Xf0t4NtQqE8
	uf/9/1S8ODXldnPh+966QINNjYTyROQHfWVG7zp53g+qTksxGCYzkRPduNmx3AUzRVqI9gfpTzJ
	X90Uz7qiJPckUWa6sul/VSWhNcx5DBbwfXum24JO1HYgWdYViPzcu3bs9zzQtOl4eoGAoABaTE+
	HczXjFM0gItXtJ3y4jzurTjce9M8T06qId1nn/yOqy0iTZSNVdADoqXIMU/aaQCMmwaHLvKBGjU
	oMvHdn+umvxo6E/dYC2MQBQzrvSJKRtX6FbFxR/epQ+ZmtmmIN75R8w9eyrskBGPjC103miZkJT
	iMnFr8TQc4RFKXWt/2K/tJjit8sGuSLt1XLfMRQzo/XZ20lbRIEv1ogIGts2zNLi7x5Vhf0FCBI
	OmNJtRenPefz+4aUcC8h9UXhKUAImSgVn1LsngenzXgl1
X-Received: by 2002:a05:6102:358a:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7d072719913mr4878960137.33.1793753037717;
        Tue, 03 Nov 2026 16:43:57 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm527432137.11.2026.11.03.16.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:57 -0800 (PST)
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
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for
 preserving tmpfs files
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Christian Brauner <brauner@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261103010216.3447716-11-dmatlack@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-11-dmatlack@google.com>
Date: Tue, 03 Nov 2026 19:43:45 -0500
Message-Id: <179375302575.727293.18102345692701869647.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3188;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=1Sz+eMhTI1TOTbxgSk7ZOC8CrCJdIfx3Ze9Zg3ES4c8=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6n/FzIqSwYCXrxsnr7zksMS5TfAEmFOQUj9PS
 7XxUL7XYFyJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaup/xQAKCRC7dyhM23N6
 3nTOEACAI6TfigjjQvteQKuwVbfhXqGx6bxoozDfCeoenFpsOHHU2tRSPDHrF2LinhmG2pyX3Q8
 IdNQ59F6clZBMmDb/eOe07rYUzfUWj1TUdh5D/SLuP13olwOUmaakHONOrG2Uaporgy7rW/JvCo
 H2L7Jk9k9ONnqREnNjgeAzTwu/zmxI3kBLYcpoEe4e/qloHN2LAqn6iVZB5b6I/duQg+0sSKEgp
 qF4OBNh/aIA1foatwzOu597LOjO9yQGRV3iBJJYo51P6K86O3J78ymlKWGJLCLMOMPk2DZUnR8M
 jLp931wUPz3YeNyDlYE5pYInd4W0IpRLQkJs6piLRVQ/conGIWbGkL4KSSoQd/2jep3AT+iLZxT
 nQX3w7DUGKtNX41lNlBN5hBRLIL7IBK7aadPhrKz90SJNGH9ZPSeFVaGtwJRjGCWrPppwaO06yR
 VysyPyy9uNhOKJSHmwBYeXEJddw81NZYJIjeslUtu59vWS+R+q3usDK/yK5jNy6E0h6vvuwyhuI
 gmJeftNu95dEGsoOiTdU/+eZlCgissKpCpGEEx1LCEbcoV5iULkM6cczYHziRUNy4WEnse6TYs5
 JiM5brFJchE2M/+FwTTI00ZLZVJRSQ+PZmsg6nEdtwTUZDUhsHCd0cXftsjhObL8a8SsH7szZ7X
 ktyDeGGGs1LNQ6Q==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Add luo_tmpfs, a kexec test for preserving tmpfs files and memfds, and
> for retrieving tmpfs files onto a tmpfs mount with struct
> liveupdate_shmem_retrieve_arg.
> 
> Stage 1 preserves the source files of each test case. Stage 2 runs
> each test case in its own directory, with its own tmpfs mounts, so that
> block usage can be checked exactly with statfs() and st_blocks. The test
> cases cover:
> 
>  - The restored file: contents, size, position, seals and holes, for
>    linked and unlinked source files.
> 
>  - Creating the file: it is created like with open(O_TMPFILE), with the
>    requested mode minus the umask, owned by the caller, and not linked
>    until userspace links it, unless it asked for O_EXCL. Also O_RDONLY
>    and O_WRONLY files, other open() flags such as O_APPEND, O_NONBLOCK
>    and O_CLOEXEC, read-only mounts, and directories that the caller
>    can't write to.
> 
>  - Preserving files that can't be written to: a binary while it is
>    executed, through a read-only fd, files on read-only mounts and
>    superblocks, and immutable files, including sparse ones, whose holes
>    are filled. Preserving someone else's file that the caller can't
>    write to fails, and so does preserving a file through a write-only
>    fd or an append-only file.
> 
>  - Executing restored binaries: a restored binary can be executed
>    before the session is finished if it was retrieved with O_RDONLY, but
>    not if it was retrieved for writing, since LUO keeps the file open
>    until then. These test cases execute copies of the test binary.
> 
>  - Block accounting: the file fits a mount of exactly its size, and a
>    large folio that extends past the end of the file is charged in full.
>    Running out of space, or hitting the memcg limit, fails permanently,
>    and leaves nothing charged to the mount or the memcg. The session can
>    still be finished.
> 
>  - memfds: they are only retrieved as memfds, with their seals, and
>    files from tmpfs mounts only onto a tmpfs mount.
> 
>  - Interactions with LUO: invalid arguments, which can be retried,
>    retrieving a token twice, and outgoing sessions.
> 
> Also check that the size of a preserved file is frozen, and that the
> test doesn't trigger kernel warnings.
> 
> Enable CONFIG_TRANSPARENT_HUGEPAGE for the large folio test cases,
> CONFIG_MEMCG for the memcg test case and CONFIG_TMPFS_XATTR for
> FS_IOC_SETFLAGS. Those test cases are skipped without them.
> 
> tmpfs quotas are not tested, since the test runs as root, which is not
> subject to quota limits.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261103010216.3447716-11-dmatlack@google.com

Overall, I like the series. As a follow-up, it would also be nice to add 
non-kexec tests to liveupdate.c covering preserve/unpreserve/freeze and 
restrictions on various tmpfs files without rebooting. 
While that won't test retrieval, liveupdate.c runs as part 
of regular kselftest by pretty much everyone, unlike the much heavier 
vmtest.sh run.

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

