Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=147.102.3.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841219;
	b=DHqwZHZXRjWhyR7bCXSwr1gIuOP0atgnrPBLIycMKUIs9099EAI5MP6VReKg55AyT1gb
	 MMnhKxcCQ7KVx7COuU4ocjAkya0lJN6uiRd/ha60GHnZMasueIGO+9ZP6cGvqEsQGUZ8a
	 rP3qH765aa4IlD1bZm0acHVzJ7+OxJB5YhX2w8kkrer11bgFvCR5GiZe8KNXZ/qqLEK/Q
	 Ri3ZlF5f8qHPCZH4Yh3KgZRVAKNVm+6y0WdCEAq87IoKLa9ODpgz6rFuIFfzbhL10CVD2
	 2tpbvq7Xw1H3fmSpc9wLiQz36AlYQ+X6lKJnfqqgkVBHK7w2104uUqQMtS/T/VlgRPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841219;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SODtelJKNz5lpKljfUqqvtwJpgZo4GIqzSkNOmKgNxM=;
	b=xd3siaw8YyWm7DsEjTBqN9TWynP16HhduyeABck0HZlBdVtMPj/SVE0IPVXhUs0Y4CVY
	 O1c9GRqMjneiFbKaJZN9Is+Jz5uEg3+c+kDoCWSnjCAVvv+PLangtyoL+eNexkQk7QmtC
	 FDmFvtSa6sRg1xgA3sByH9NOgzS+d74Xl9kJjKzXyW153rhKFPLISV/wSOFOoo5gLmbmP
	 zzhNjiOe+gTx5BQlGOeEqxTzbCZ+ytW7YLJQaYQas3fuyOgWeNp5DKguNeaYv9PhdRgqM
	 J2tlN69jdgWk+1EgsJOBUNtI4jFwP3kVluir4RZsFt7lvFqDcdzIlbsw731QAnZMQnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cslab.ece.ntua.gr;
	spf=pass smtp.mailfrom=cslab.ece.ntua.gr;
	dkim=pass header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.a=rsa-sha256 header.s=smtp-cslab header.b=gyDtI9+1;
	arc=none smtp.remote-ip=147.102.3.1
Received: from danaos.cslab.ece.ntua.gr (danaos.cslab.ece.ntua.gr [147.102.3.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B414606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B414606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.a=rsa-sha256 header.s=smtp-cslab header.b=gyDtI9+1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cslab.ece.ntua.gr;
	s=smtp-cslab; t=1792841208;
	bh=XjHt8HPKu1fEim6ZRYfiWk1ofwZMfFScMlz9vo5EbY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gyDtI9+16mLjv1PQsjT5HoEL5XLArVqapqmrFV1EDs/QfMs1JEn96Do6DCOEKLo3N
	 KZUfGWVDMKq5Si/WwdWqz1m0Bq7aYWM0pwu2KnBnGGYAhU6AoREGgtEe/N6gP1t2E7
	 3NXU3enzXJEIVh9QBotS94Kk+aJJlxEuC+f9I6C4=
Received: from [192.168.1.5] (130.43.37.55.dsl.dyn.forthnet.gr [130.43.37.55])
	by danaos.cslab.ece.ntua.gr (Postfix) with ESMTPSA id 182FE120040;
	Sat, 24 Oct 2026 14:26:48 +0300 (EEST)
Message-ID: <5c05a17b-167e-4379-82f0-dbdff783d050@cslab.ece.ntua.gr>
Date: Sat, 24 Oct 2026 14:26:47 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] test_maple_tree: test maple_range_64 node in RCU
 mode
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>,
 Andrew Ballance <andrewjballance@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>
 <20261005-fix-maple-tree-range64-rcu-v3-2-ebe7fb278e20@cslab.ece.ntua.gr>
 <179276488829.1655926.9998832837982828676.b4-review@b4>
Content-Language: en-US
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
In-Reply-To: <179276488829.1655926.9998832837982828676.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/23/26 17:14, Florian Schmaus wrote:
>> This commit adds a test that builds two maple_range_64 trees in RCU
>> mode.  The first tree has a root that is a full maple_range_64 node and
>> ensures that the destruction under RCU does not misinterpret the last
>> slot as metadata. 226 insertions produce such a root on a 64-bit build.
>>
>> The second tree is a height 3 tree whose root holds 15 child pointers
>> and metadata in its last slot, so every slot is non-zero and ensures
>> that the destruction under RCU does not descend into the metadata slot.
>> 3166 insertions produce such a tree on a 64-bit build.
>>
>> Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
>>
>> diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
>> index b9367c61e8b5..fb40e193a3cb 100644
>> --- a/lib/test_maple_tree.c
>> +++ b/lib/test_maple_tree.c
>> @@ -3710,6 +3710,36 @@ static noinline void __init alloc_cyclic_testing(struct maple_tree *mt)
>>   	MT_BUG_ON(mt, ret != 1);
>>   }
>>   
>> +static noinline void __init check_range64_in_rcu(struct maple_tree *mt)
>> +{
>> +	unsigned long i;
>> +	unsigned long nr_entries = 226; /* Build a full maple_range_64 root node */
>> +
>> +	MT_BUG_ON(mt, !mtree_empty(mt));
>> +	mt_init_flags(mt, MT_FLAGS_USE_RCU);
>> +
>> +	for (i = 0; i < nr_entries; i++) {
>> +		MT_BUG_ON(mt, mtree_test_insert_range(mt, i*10, i*10 + 9,
>> +						      xa_mk_value(i)));
>> +	}
>> +
>> +	mtree_destroy(mt);
>> +	rcu_barrier();
>> +
>> +	nr_entries = 3166; /* Height 3. Root has 15 children + metadata */
>> +
>> +	MT_BUG_ON(mt, !mtree_empty(mt));
>> +	mt_init_flags(mt, MT_FLAGS_USE_RCU);
>> +
>> +	for (i = 0; i < nr_entries; i++) {
>> +		MT_BUG_ON(mt, mtree_test_insert_range(mt, i*10, i*10 + 9,
>> +						      xa_mk_value(i)));
>> +	}
>> +
>> +	mtree_destroy(mt);
>> +	rcu_barrier();
> This case passes on an unfixed kernel.
>
> The bug that exists today requires a non-root node with 15 children and a
> tree of height 4. The size-2768 test case in my series covers that. You can
> find my test at
>
> https://lore.kernel.org/all/20261015-maple-tree-fix-slab-corruption-v1-3-160d97f7304c@codasip.com/
>
> and may fold it into your check_range64_in_rcu(). It fails without your (or
> my) fix and succeed with.
Hi Florian!

KASAN catches the invalid pointer access in the first tested tree on
an unmodified kernel. The second test guards against the cause of the
second bug: a node (at least) two levels above the leaves with exactly
15 valid child pointers.

That being said, I do think that covering the case where this is an
intermediate node has its own value. After all, more testing is never
bad :-).  Feel free to send / extend the test. Since it exercises the
same underlying issue, extending check_range64_in_rcu() seems like
the right place to me.

Dimitris
