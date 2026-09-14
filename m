Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD24734F5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402335; cv=pass; b=WsYC5oUn7CdwqpLjctlXwq6BTyEQColAIU9kwtPu09dWfBDBGPnrSlJVR+HGoGNRPx7ooxWdXUIWwWfQ5Q+/ST0Vpt6UoCNpiS2ZJO/s7tcYkF++4kpfHBdHY+YHx5lkvO36A0Y9y3dYCNdUZgEf6h1lfQ4Yo5Rp2/MmOLH3aUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402335; c=relaxed/simple;
	bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBreda+fcKPPRYg1q7Rq8WzF8zCc78nYE9ep9iA+vSgDpzED9iUJmpgy2D28+wIkEUiSpf5ZiaYJ8ej80iEs4cMevUnNMCP2lkdULqII1V6txGu3KQjgUcELafYBr9ehB5qlXwmpxIYT3SK5lWc6CQjkPtmWlxwzBXT83onU/aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iPxS2JBl; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iPxS2JBl"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so27089476d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789402332; cv=none;
        d=google.com; s=arc-20260327;
        b=NVxeJRGKweLj514w+IFehWrh4nR7txB8ZsDD7ugGstWJOVKDbKoJnHcnGIG2FPZTUR
         9e7LhRLkj86arliMGVhGkw4kdgaJLzOpYAU4+DG9n4FxFDIop7chZNXSvOtAdlsDjDYi
         kVCI+WaA3CyAysdeLV7d2QqOF49fQFsPmMonefKPT+W2EFOfU1rXQ4sgd0RI2xcqqXdF
         CDCHLzTt1Gea7O3VCpLJEbZyWPmziN8FcL4RJ/7JGINoG4y94g9FNma2xCF2beuGc0N7
         qt6GsHZC/YXuBKaUcTi+6bs59rInuulEAYiiUHjHl5IxWGEPUDv4UyxRREOPqSMC7AtH
         529A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
        fh=aqsU1il7DLzxK9IjjzxLvuTMnDmSaFirBfocOwFcI3Y=;
        b=pYcYNX0cw5wBUJndnR+oIp07Gxu/9AuQKO8kmm9Apqhf8wFVtPphK/nsUSGVsUj57H
         4rPjsKPWHODe/RmDeYOCEb7hDhoZVjbrUC0zlXlArM/NV1AtgFw4IvpibfCrqDeIAy8W
         YNyS2pAO5IWJzq3g3fPanfESr6CkIIrWIyvlj+5P/4MMlQKv1pnXBdLb4vu/bkdQWdYX
         Uo3cqyT/Y1Z1IPNuVBT157iuUshrFQATESBjUVQG+qc2NIw0vstZxbZKd0i1ZibYh83A
         2UQiGjYued6hGDAzjHrdbta6TTdfTHKjU1EeGA0gccM0g9Ow0E+ARcng/Hvot5PHS5ry
         YloQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789402332; x=1790007132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
        b=iPxS2JBlCWjKkwI6vuyC+p9d0cFDovSdjWkqcQV34zbE3g9Qfs1+kZC2wXrxn4qPpb
         rKZvPsICkvKF7gbP2B0iNQezKfzeEWT03p7YNUJEgksiYi4/mEP0lAJ1lag3N8GztxnE
         RureO3rxrhakhZb3pXE2RiAncPW60A4Fo/sC+CRaL0DPjcU+hZNvDmxhTYVXVykiNrrF
         YwKNrSUZ5lRm7dA2AT2TfTxos5QZ6R/nXB0ltE8FFAHyMHMDq1fKtbHVuMZye5hWP4tK
         S+QObWjW1fAl88bR/tJKhCXpOYZppcazqEikoOtnNvF5uZWw+V4auwALmLALL87RH3cg
         Cdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402332; x=1790007132;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
        b=kG8Up6NSRrca7VCNgy4Enq2up/4hd/kLXn+I9QLlH1UxlcYmOsukq5LZABEnKH1DS9
         0RZvv4W/Hlf3F9zGlso2m/BiP88XRcHGcdRwTF4U0+FdLJ9Pn0JvS1MaQe1/5+cAL43h
         PjVv1E0LF+4u1IQEB6xF8RLCcX0rKsdoO+0RitzvdPlfFV2poZ4QheumjOpfL25EQzhb
         Qen9v76b6W05ogTPvnoZ8QTAiTL1XEFPT9RiQcPC87+DEf28VBq9mmGdVC3oa75v1sBI
         A1ctrgQOwcuZEACw6Po8N0Eb6TCPjEqCWeyK6GybJuoIhH1/3WvRtlEwy+RtZkMcPdWF
         PEcw==
X-Forwarded-Encrypted: i=1; AKwUvByvARBryqHSK89oMAQv8nWKkRcg+Ik2TCXCbCVNVT9Ihj9cwNoe3uAaxPUTsXXjPrGygjY7HEKcY7LbSEE=@vger.kernel.org
X-Gm-Message-State: AFuF++lDkEKjWh7SQt2VyOkmclFRRv3S9aSowl3FViA0vtsDQar4gRYf
	/nZQuCNx2XX9hlPI2ZDyaZ2hi+v2cgYXNBwFrPr37EEp40U3VaetXZNopLQiN/BaWebBLNprjv2
	sk0MtJcqlg8FFI/kWzrBZKUL/0ppiWzI5NY22vZrC
X-Gm-Gg: AYBFou1dnGu1Ytnmllugfoj5WsKj7Jc7vUcUOMAkkLw3GWiArGoB6rqQ+b0DexFXZsG
	SRCvtOmGJZRqSqnbQGHYuOP4/gU+mtUxIjMkvt1lDGV9CNQ9Iss9VrmgSzGeHws+PVBBg+wzrEO
	idfRBRvwzXrGo3KheJ6cDj+b23M1pyY54bPor18BY4aLTeRPHPEAA+AwBHFBa/F+SJ/zeoWFHbj
	FlH7VYmRVl6X2pRuLZDr/ky2mx66nTqFc52d8yBQ1o0LT7jeGQsvrUdmhPDM920pftR/VuCEAVy
	BtFuTqd0CJ/glK1AQKPgq8RPxkmyw7UZlDHw4uEdtuy3G+kmiNEJfvwBMSzsucAaAaj8TnJnmI5
	fQhY0uGq3CA==
X-Received: by 2002:a05:6214:4188:b0:910:3453:7d8d with SMTP id
 6a1803df08f44-9122e68cb26mr52724686d6.34.1789402330683; Mon, 14 Sep 2026
 09:12:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:12:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:12:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260911140816.3236725-1-joshua.hahnjy@gmail.com>
References: <20260911140816.3236725-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:12:09 -0700
X-Gm-Features: AcwNN1WUbkCX1sstQv0ZWJuvqOHMzCSyd9_UN_yhDwBAx0uKe7xefyFjGTdT2Vg
Message-ID: <CAEvNRgFme=qjw+T8NoKwLuhVLBGYeXGFaNM_jB9tR3WkgPLjHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: hugetlb: Track used_hpages when
 getting/putting pages from subpool
To: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> On Wed, 09 Sep 2026 14:49:26 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>
>> From: Ackerley Tng <ackerleytng@google.com>
> Hi Ackerley,
>
> Thank you for working on this fix / simplification!
>
>> HugeTLB subpools currently only track used_hpages when the user
>> configures a size limit.
>>
>> This is buggy since when there are existing allocations from the
>> subpool that would have satisfied the minimum reservations,
>> hugepage_subpool_put_pages() will still restore a reservation to the
>> subpool. See below for an example of a false reservation.
>
> I'm not sure if I see the false reservation example, could I be
> missing something here : -)
>

My bad, I copypasted from the cover letter to this commit message. Will
fix in the next revision.

See more at [1].

[1] https://lore.kernel.org/all/CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com/

>>
>> [...snip...]
>>
