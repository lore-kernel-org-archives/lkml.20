Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753033;
	b=fo8/VarHN9KS1F2IgYLsFBpBD4P24pN73PI3XXCG7Ngdrp4Gh5MIG9EfoxSTVeeZgKu6
	 jL7N+DOK5ts/7KKBfJAP75KtrktScjX/8iZw/XBtx+BOszUIdrulXMRho03Pl9eLNMX8y
	 k4CR29uDVlgXhVS0m32r9yXfSfZWq14PKaA/cWt7iMb0GoMz4OEgUxTQyOjgeYH5GFeBr
	 FmyIVtaroToZlGhbZxh5GzrwNVIyV9boHu+WOv2N2Dp8Sk3bhcwsXeqwaZoSZmK+XNnUb
	 du2YLSYphwimg9YmgwHIvRnT3UcJaKGU49tfDk02GEggehiAdD72AuCbNdj7fx+7DkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KRXI5AlbB9KpB+65wVIGCYZD4BhZazr9WIMOqzWe5bM=;
	b=E+tnlIeyt6d6sSiQkEHBi3bTHmpoI0boNEv0C8aftAS9mUKpYWlGkThrtyr5BPw+uaDw
	 z95syxio49cg5/YSalPqIYEHnxp7xiZUwRxeIJnLNC/Wj1miFKJU+Cr0J3aVYUW30hvcG
	 W6a/XQX2DNOJzJa3+P+f7fFUXSy58aeNKpXaK7b+93boxRRxB0iTAI5rRJMqlCMjbC9eQ
	 Knp1DTTZ9+Cb1NbjzZgV5Xz5TeCapSOC+y19QvlcgvpVl6lDUAyLuURQRQhBJJKqbvGhE
	 ADtPsa5TVzJxYD9HCHyuHiYgUPwMxqdyu+4ePBOXg6zOJUILKxWtPYZB2HZ4vpCXbPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="byuKBb6/";
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676C606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E676C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=byuKBb6/
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-998318396ecso52362241.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793753032; x=1794357832; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRXI5AlbB9KpB+65wVIGCYZD4BhZazr9WIMOqzWe5bM=;
        b=byuKBb6/8WaYdK9ZN5JosQguOh0zfqttOB9yRf0V4UuM1awfQ2TVzBP96+ASY1APxu
         qIXdn/+Ihqq3ANCZus/7buB+EvxOAxJafkes9lTBv8qjXlOXBS6R8wtL4p8emNJ07JRB
         yCIkOaT7t5KVyBqVJwgfL5ImUqDzfu4Ehf28G4leLzrbbQbd9mBIglO0OwL0+FVGXosV
         XKKBTNqN30hc6Mkenrapw3TRZnwIJkEtginPUKUoB02DNWsCmX3tOTBvlZCWvNkq3iYk
         ZYUxHQGR9NENxo0jOZmJ5x1dIxKdufKn/6LKvI7Qto4bzWHPCq72NVS0ytaf1nGsbX3+
         ov2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753032; x=1794357832;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRXI5AlbB9KpB+65wVIGCYZD4BhZazr9WIMOqzWe5bM=;
        b=EkeQSRoe9tMoP+tFVSNlpf4psaFzTvagS0iWenxcbMggu8nKMpQ3yEVycvSklr9Szx
         8Bz5MD5vHqCLZUtPVomrFMsxTIIl9pdS5uSi6Ol/5Fefs9flq6cLfTT/pysjanqx+88H
         iIVGO9rODP+kol2GgurpVwGIYjGmCHkIA0MmPq/XQi3fRoSCzdE95ZCebcP6G3/ekY8z
         WKhaCGCMLuuXsSE8YwKzQBo95X7SovSCrxOHFiMuO8bdXEej60mnP64LCIx9WERxUv+S
         XvaGBrFKtFKI/zEM/g8ZaMtrIL5QzkZLrKCSUZ1CoaBtiv8M3h+1htHKJ9wtUg79LoZR
         Fy1w==
X-Forwarded-Encrypted: i=1; AKwUvBzDSdNn5D+2HhGwl5q1TlaPRMuGFt3pgmmycJK8D89CNP6cZa0+Tobz4GxTe7LEaEvDCdvpocR8zJrP4Us=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GKVOLt702qUv2V/1wR2KIEklSPn5x0LhugkBHPk3BHG2mcFuk
	EgkTS/BCTPwBdCk977LV9zk+funG3LMxyVzVMMrNXr987nVQ/t1UPUDExSucuUHA6Uo=
X-Gm-Gg: AYBFou2jREq1owEP0K5m2VRLTLfJOrsgY7sPpqpCWkeZsqg9To2ZDdW0qqc3AdLE31I
	uu3LfZs0ldGyGKH/7oIR1xTmRzrlxL0MFX9HIA6K203u/WdhLeckmKdStvSzzmbTiqq1mSQNztq
	U5qzvaJpveSG0BG82m6j59+jzLeANsbaQMECFwemlcV2KfNXTi47iWX70fH4fGplGvw2UgMxLZA
	dzOIej4f3zQLo1WUfZ6SqNU7iSxIZBcAr16GdFL25JzcePOxPVNDawrZ2UTGTWf/H+OJIBWXX9P
	SQOQcP2Jz8SPmjSTq6Souu4tBwUDNHgTNuMXFu3L7VUjbEeq+4dI9DJPG3lJG7i4BLqDY0ZQqyx
	tyd+8JJro25RPJJA62ES8us47AOk81zbrVfBvD3rH/cqRvKJYjxze2Dt7PdZHZhTBcCW/ZJMTWU
	sUGprKvo326H8ueqIa7p/SfefMY7tA18pBM1k+DbxFX3y1bYp7oSFISJflvCxuW81E923fi+JfK
	PlEabbz3c24XogcUZtLH+lGXjH/W49dxVrDobdyyNWusx7HpHssUSugGyDZLN7WCPvRDRigWZ0V
	WVgcJ6SDzywpby++La/HwAALQqhIZ/dtjn2IEX+NyRPeCSsSQH12aT00VwMykNVXdLXRE7WhBgY
	OlHnqF551/eJSIwQE59Wq+AwCFb8ZtzQLcmLRBhZOKr98
X-Received: by 2002:a05:6102:4a53:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d276b006bamr791137.9.1793753031752;
        Tue, 03 Nov 2026 16:43:51 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm527432137.11.2026.11.03.16.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:51 -0800 (PST)
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
Subject: Re: [PATCH v3 07/10] mm/shmem_luo: Retrieve tmpfs files onto a
 tmpfs mount chosen by userspace
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
In-Reply-To: <20261103010216.3447716-8-dmatlack@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-8-dmatlack@google.com>
Date: Tue, 03 Nov 2026 19:43:45 -0500
Message-Id: <179375302574.727293.14537040566857910268.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2542;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=vqAe2yDDLEwKgdF25FVv1O+wpJlIipaSEL5hDK2VqOY=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq6n/ET4OO45vZ6StOR902DLzVLY6Bj7770P8sb
 nnjgwQuckuJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaup/xAAKCRC7dyhM23N6
 3jnJEAC0kky9VSu9xkI04nj8RiMbjwZNaipgbM8c84yf/wc4An6yU8htiqArYikDHsF3LbfOPIu
 ZJUI96h+M87DI496Gg92JK+uzFrY3uJjoyYr6us6+nUjcMcRYRWUS14WbhTxF7LoVgCU7SpDi1V
 MK7oieNjQXNfVgW/NL+Slwq5olNJUkvSgPFiAU8xQjVJxJHLYJmIJIXxc5vrbOVfL7YzAy7OxvD
 NuTg0ha8GM19+ZVxhZjYxkwGpmHD/eqTqJKoDVST6z17DZBoHHTbkpvXEHEsHmPCJhdTnBwejzX
 hbQEnk5/nzD5A3xC2edrsjyws0b8KclIaBJ4mNo4RtHUlelIO/ETzlvNcSmgpx/32KI74IwNr0z
 V4G6BxZrPeQ2TvjDEOTsCOP/lKsVlCx5YHTZYdhgmlBgR//QxXA76UCWPPpy0P1U4kNlZyNH6XV
 e3oMwZs1iPhhtd9+roQtAfbc6IPf+TbFCwI0KxQyxKaJvIxQQl98TA9L1QxJK3Eu32Hg8sqs8ED
 afWk9iPUD+ACfrf9HgHLFHlyw6RWtNm1UGEI9lvbzR1iPJesYxMSuVxfAANKfyZIR1g/hjH50H+
 OTddQgi8QtOA6wOiO+tOIvWJWdjD706Y4+8m7qxO6a0u8szavw1N/NXcclT2ViuQIaOrPcVya3z
 1YbZ7UGOm90VVsA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> Retrieve files that were preserved from a tmpfs mount onto a tmpfs mount
> chosen by userspace, instead of as memfds on the internal tmpfs mount.
> Add struct liveupdate_shmem_retrieve_arg, which userspace passes as the
> retrieve argument of LIVEUPDATE_SESSION_RETRIEVE_FD to choose the mount.
> Record which mount a file was on with a new SHMEM_LUO_FLAG_TMPFS flag in
> struct shmem_luo_ser, based on the superblock of the file.
> 
> shmem_luo already accepts unlinked tmpfs files, such as files created
> with O_TMPFILE, and a following commit also accepts linked ones. The
> mount such a file was on doesn't exist in the new kernel, and userspace
> may want to put the file elsewhere anyway.
> 
> Model struct liveupdate_shmem_retrieve_arg on open(): The kernel creates
> a new file as if by openat(dirfd, ".", O_TMPFILE | flags, mode), so the
> file gets the owner, permission checks and security labels of any new
> file in that directory, and is charged to that mount. The kernel then
> fills the file with the preserved contents, size, position and seals
> before returning it, so nothing else can access the file before it is
> complete. Userspace links the file at the path it wants with linkat(),
> or passes O_EXCL to keep it unlinked. Neither the path nor any other
> inode attribute of the file is part of the preserved state, which keeps
> them out of the KHO ABI.
> 
> Pass the flags from userspace to file_open_root(), so that the VFS
> checks them like for open(). file_open_root() silently ignores unknown
> flags and mode bits, so reject those like openat2() does. Also reject
> O_PATH, with which file_open_root() would ignore O_TMPFILE and open the
> directory.
> 
> Keep the type of the file: memfds can only be retrieved as memfds, and
> files on tmpfs mounts only onto tmpfs mounts, so that e.g. a file
> can't be moved off the mount whose size limit and quotas it was subject
> to. Passing the argument when retrieving a memfd, or not passing it when
> retrieving a file from a tmpfs mount, fails with -EINVAL. Unlinked tmpfs
> files were retrieved as memfds until now, but nothing relies on that, as
> the LUO uAPI is not stable yet.
> 
> Like the other failures before the folios are restored, problems with
> the argument and with creating the file can be retried.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Link: https://patch.msgid.link/20261103010216.3447716-8-dmatlack@google.com

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

