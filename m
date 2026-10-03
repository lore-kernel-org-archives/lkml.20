Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE57137C927
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009715; cv=none; b=Yr3VKQ+/2AMVL1OMLQGVE93LeExd8VbxEVpDLLVSa7/ZGbENaIgMZj2m/FgV42NTnS8o4tOTDQxLwhDFDRp1r9vgabkngENDKuzbgJpeeN7Cw5nPGJS9wjgtKyt446oENJOWiC0B7wZDkjm9jUyPxG/2dWR/6uozgiVP0Z3ikLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009715; c=relaxed/simple;
	bh=Ft/2WnP2ps3/fBEuFcw7OdRkXuXboIYNtyZxDWWK5UQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=H5pXHy6cEzoV85DaKmelpJz16J6VLyfi9lztpTAGgdJUYC1GPXf2sl4dRw40gONb1X7DPqfC97b8sLFpoxpByEYl2O9vio1QHycZW3yP5dKgk8NVZXaj3kGELNr8RAqoRtfS3pJDQ1XawPn4Bi2r7t5tN0T/VeI0xeBtf2ePKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGeVVoxp; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGeVVoxp"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso42551a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 23:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791009709; x=1791614509; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVG6AlODq7cmQhMYgJzsMhMHRGmznwDk8B1ECX83RpE=;
        b=XGeVVoxpOiXYZtYGqG2yU2GxkPlaJskUAPh9fd+fTTtkhO/CiXOUeP7vrTtwweqegv
         Ljmt/9il3LgQJk6CajihNmrwh0E70LRStYzdv7PnpZUe8h2V6HejSTM7CZQNqgcvIZsI
         AcbU5Ri+BcVw08rxjTuH+vVLhxKSlGFpSxiDzv4oQIGydsYjLCD+/e+8EK1xm7FVq7T5
         1hR/soVkKp6K6bkZUF6OM9RWrt23cVJ+mDLXjylGf7pnrclIfO9Ayw55JqqhkYITfoNJ
         oAcXeji8Iu0lj+dlrcqVXl+BhPpKdHwQ5Hh65K3R2l3TvLIpjcA69NwXsYN7URlDQ5QZ
         xS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791009709; x=1791614509;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVG6AlODq7cmQhMYgJzsMhMHRGmznwDk8B1ECX83RpE=;
        b=t/yCrdU6YDDOLLZizabObVMfeGKJrDvJEjq5n17cst9y5c+GCxf8T5gwTW7z+kVVbQ
         b7q+29N9BQ5TIcg5HydccQnxByME6/R6c01GSVWskhX8oz8oyia4kjT1lRIH7MTmJpqB
         NHwIgicm6teHfVY8O584ZAWcUQcUVsX0T+rwrxdIKNS4a+erzNfbPiGbacFCq9RZvHRv
         LdHzFUxvTw49mT+PcqYwWZ3qXI1p2OYmynrx2/5QxbX6Nu0RpGv7TgX+dCCCVZ3TGbdi
         G85ewi1daI/DE/RCo4+uOiq8RZBil2GmnTvAyqH5MrmmiAOwRfWhz2pKkRk18kY2MEiN
         gejQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhN6vyCgylkJtfEC41ny9qcWkI7ZBblk8poRzROBb1pd7kfMegDPbWPvAU1XzFNj/Xi5VoXmQMw0DYyhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBdsv8tD8F4LYHwinipftckGBF9uG2v35GSrYLBwU6LUmK3j3Y
	Svn+QV73NbNoqYTLHDrDhAxo5xJczngRjWVPMbnUmGGXrTGPtPtqJwEW
X-Gm-Gg: AYBFou2r7fNtVpZWop9661ijJhVT9d+5vh9iDg3A/St2A1gnfCNl7O8pSGGK2ZfTe4K
	QG/uhGZ3O7ciUhXU+r9JwMmCt/YfeXWz1G16maZDdTTw4w2cmMQYjD9Ewppom/DSl9RW4vAFajx
	kFAYwhkR+gSM/PtdKMG/eYHD/pY8cbAa5nGPvA6eA9yBI9ZL9Dlteh46QH33BHBZ+hXmh/ie6Iu
	fye1sdmT/ZWYVpErTQBKx4mBFdTNAZHF1TG73Lpja8TQI3fE8zLBOM2CPqK8Ve9mWRa5nCI7Z55
	1wQVgSFHXo4l2sIJeJK7rwONTklk3mffWcqRKF7ioPpKIFF6iULTNxt7ALUCUi5yOvBKEgHyb+O
	ADDCJwEM6oavDHuAI6FFctFZqsJ5PnZTz0sileuppfrLcsvMG5MLys2ERYrDd5MWfR13+2+tM29
	xcI4A07j2OBKTNksMgsIIIckBzj4BLPNXnphrb57IRcbEX/Y+sPdSSR4l4LkTPBt3/tZ8AKjKo6
	8dyTUx31PmE8vg2nQluzxYvsvROvFcQlK5+xm15Vx74LJHqo/I/c1fNiYnfr3TAe6JbrRWpq0II
	QUg=
X-Received: by 2002:a17:90b:3ec7:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a6cec20416mr3084840a91.29.1791009709004;
        Fri, 02 Oct 2026 23:41:49 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d65d85csm1772623a91.4.2026.10.02.23.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 23:41:48 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 06:41:48 +0000
Message-Id: <DLUZYDAX6849.KKV543CJGGXH@gmail.com>
Subject: Re: [PATCH bpf-next v8 2/2] bpf: htab: Reduce elem_size by 8 bytes
 for small key sizes
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <mykyta.yatsenko5@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20261002161738.621133-3-tjmercier@google.com>
References: <20261002161738.621133-1-tjmercier@google.com> <20261002161738.621133-3-tjmercier@google.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 02, 2026 at 09:17 AM T.J. Mercier <tjmercier@google.com> wrote:
> +static __always_inline struct htab_elem *
> +__lookup_elem_raw(struct bpf_htab *htab, struct hlist_nulls_head *head,
> +		  u32 hash, void *key, u32 key_size,
> +		  struct hlist_nulls_node **out_n)
>  {
>  	struct hlist_nulls_node *n;
>  	struct htab_elem *l;
>
> -	hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
> -		if (l->hash == hash && !memcmp(&l->key, key, key_size))
> -			return l;
> +	if (htab_has_hash(htab)) {

[...]

> +		unsigned long k = 0;
> +
> +		memcpy(&k, key, key_size);

My bot is saying that this will break 32-bit builds with FORTIFY_SOURCE.
__htab_map_lookup_elem_u64() inlines all of it with key_size == 8.
has_hash is a run-time load, so the compiler has to keep this branch
and it's a memcpy of 8 bytes into 4 byte 'k'.
fortify_memcpy_chk() will hit __write_overflow_field().
That's a build error in i386 and arm allmodconfig.

has_hash is a compile time constant in __htab_map_lookup_elem_u32()
and _u64(), just like key_size.
Only htab_map_gen_lookup() emits them, so the map is BPF_MAP_TYPE_HASH,
never LRU.
Don't read it from htab in these two.

pw-bot: cr
