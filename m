Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858155;
	b=lKnJ3hNw3FGq7aJK5XEN9nR99JyZbkGaOaYmAqXaEQO90Jsf5cZISUhookJebIUD0uCX
	 E4i/21iJw6ne2jKf7EYMr96CY3uJtvk4ctJkNOdCY1cVpzssPhH0sUrdQqqcmNC39XIMy
	 hNnh7g8FyMuqS4Rlm56+BIXKgULcsxv1nxeYd+3ofj/HUNPfhiR2tSGdTOneORCHtNm75
	 vL27NaDrVHkNOM0wTu3bdYhaKO+ZMYZMlDnpOY+cR1shRGBfn2gfO/6wkRcSTAwifyduu
	 v/tRfOaHM2jfSxeonR2PWUaaGnm1vES9nrTSAA60u0+fVITPYvG7QijpF5dLKKoBH9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rsV5fz/GetvcK4qfUxJCgNAEtXbvKRxmLJMOtlw7few=;
	b=dtoJi9VJ6k4Fp6O9nllwgZk9s9nZoEgQgghXhg/dyjlcImpZOF8TcejYFyPqlaLNqL0E
	 S1ZQ/vtzvzPlxyAAW2DL5Xswy8x4vhkqA9+Db3Y7thQ/sav4oBq6visG0MVIlmM5vyz4x
	 o51B5P5dH6UzwO2dsJMR/Y+AneNV3WJHgBx/6Sx//QtpjY1nMPc7mMyn0jNqzIbTkNvyD
	 iMhWGACWkiOi2k+mf3fdOZVuWIDq6MR6clk/1KKh/lEZtEa18fCkxUbxf3YQaIgJ1hxdd
	 JzhzHKXl65/3EHZM3/bEnYXuNtPhvhHzL8EV/n6hOuW1ACU+Le1Ow2dyTAVprdwrcHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=eQYdpnhS;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=skdAqn6+;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984CA606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=eQYdpnhS;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=skdAqn6+
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXYhT1467753
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=rsV5
	fz/GetvcK4qfUxJCgNAEtXbvKRxmLJMOtlw7few=; b=eQYdpnhStgsz1ZARwYMw
	SZWyfH21wyxWchOhNuaMT/qOqp8F0Sq7t8jp/0r9X7F3mRHMF+0MVkFz746vxSXx
	PQmB/g95c/MwKXZVcERW2Ybproa6R2b4vCyPIIXNVljQvMytOl6A8DqWTrqe/+c/
	n8Ff5v9HqrDSXmN3eaRr3Tx6UqpMRKu66pJrFj6GiHOZb5PYMux9dkYdkprCQvbR
	4Nj15DuO+H5ZTUschfW84UQCrh7xYhDlZxqic+Opf/dS+q4kNZrn7Pgyn3nwQUBt
	pgg6Xke2UK/hPbEDGSNDCgzH+w6q0PGkq6ji/1Z809wtugK+T5lsOiURv6bB/Nyh
	Zw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059hhrr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:42:33 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961ed97d6so36839785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794858152; x=1795462952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsV5fz/GetvcK4qfUxJCgNAEtXbvKRxmLJMOtlw7few=;
        b=skdAqn6+lVdny994UpQiVpqzjf46sIrloRidKaSfY86WwJraoAuq3yCE9DNIFbHzzL
         8qqJAjwFxerZQ06F8pLh1zG8K3RJ8RFmYaS0YLq5YLYW2Y9Uz22PpXUGYJzc8e9r69U+
         r45m7NvnTXv1j5C8yZWfW+1+Mb6IALpJdSuhjvRXRoTw7y7jHxm1p7V+J4p4ICoTvWtC
         En+F4kdSzz1LSQJz1VHTacgjJ4a8eGLy343Pfs06YMXatu0eoSrMUJH2PXXyOwZivlMa
         dhMJIxXKzYDJwLtW8EBFl0kdPmHCMecFwrQVrfkKRqM/sz6ECh5Y/h/xTrmTnMi++5d+
         t+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858152; x=1795462952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsV5fz/GetvcK4qfUxJCgNAEtXbvKRxmLJMOtlw7few=;
        b=Oa3TlRhqCXfs8jKoSIJpPuAEuKXePa0BTNfekFj8p/P3hpuwd6zndLcdxABYfiuwVa
         UU8FMwCkdNMZxcLF7SAiDa5ayasCerIlaTGHR9ePU/4NieDwRTT5nmMGKQmDK65QFBm9
         nqui3ZcAcplkH+UfmeFLXPX8XEWcjt9m4VjdXdLVxqP4JEAc2PD5ATcAHg4J+ewOjj1L
         Wfk8z+1gYVWOatg6TZm2adrJPj2jDMmS1Oe1zSZYamSmV9RFTq93gnqqC0TE0AzRSxfb
         uQsjc8zonQa9B7pGuMcCVNoGdsLhuc1DawQAocopk5cBaGUzZv1eQrp2AYLBX6YzWtn+
         twLA==
X-Forwarded-Encrypted: i=1; AL+hErHLqWVejQSjZsmG8nKPOOgmYw/MG8eZHgXOxGu3gcKVduHlQCrDR6LYjkIWKZX3BzcQvqoZgJeU1p+PseE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+moYmft7UrjCph7SyZATN8ZLJ9IqPcRs+kwqF9LJUZ+S/XtPDS
	NkKg7LqmgpFxf0802+D1I9c9naPHtvaydBktd8DFdo6w/dUCOdJBEWGcCFLYFrSLYeohJHjsoCc
	1ln6g5MtB3lj0FSf/v5jRAVoYFHBWg7aGCBJUOArYLnleOWVtvsW15WbUZUmEBg==
X-Gm-Gg: AYBFou0Zh6kskXzRymnkrkUl0W68Ua15LumZmC1btjBmC1Lcezhae7am94uG0G41CTz
	hqnONP/p5Z+ejjpu0MY3KthrMQVOqdcNMy8mmVKoZZtTGNL16rgfhg2w+1Zek+zjy1EuS+izZj9
	v/6dHEKUVo7KhtkUfKILkOrXUPucPK5bg2DeI0mmrk88BzzOgcjnwBLZVdQxsZ6mzNdxIN6tilK
	qKTYwiT3TZdyR/UaQiYBd0VkaO1z61Tzvh1HO/H7rsPDWW8Q12L3ithQ2CrfnibfyLBfoG50460
	czrT1y7pzC+qagDV4hPbtPIKysNy/sr/IHrbuEylQISe5UTqykgSQMd9V79inpXzTjCFkd9XM7f
	y3RNQ9r4MQZqr0qxGO3lmcAM6EpHQuAl1cUbvThTSBLIlhDB3P6FHb8YL5Q/VEdRAaAqSav8Pv/
	O6qyDboiIbblRbCm0w+xvSUw0z
X-Received: by 2002:a05:620a:8018:b0:93e:5677:317b with SMTP id af79cd13be357-9498b91adc0mr77552785a.25.1794858152272;
        Mon, 16 Nov 2026 11:42:32 -0800 (PST)
X-Received: by 2002:a05:620a:8018:b0:93e:5677:317b with SMTP id af79cd13be357-9498b91adc0mr77547785a.25.1794858151779;
        Mon, 16 Nov 2026 11:42:31 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm23147293f8f.42.2026.11.16.11.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 11:42:30 -0800 (PST)
Message-ID: <c2f81bbb-ea3e-46d9-9c07-6786bd186797@columbia.edu>
Date: Mon, 16 Nov 2026 14:42:25 -0500
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
Subject: Re: [PATCH 04/12] mm/migrate: keep the uffd bit when restoring a
 writable migration entry
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, leitao@debian.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport
 <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
        James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang
 <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
        Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-4-00713d368976@columbia.edu>
 <avYG7CtQ52v3I8tF@gremlin>
 <f28dc841-f664-4f97-9dd7-bffd2825115e@columbia.edu>
 <avsV68cP0rp5mWSf@gremlin>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <avsV68cP0rp5mWSf@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mOCWv8M3jOJNQbBUBIrGYAsEUnEtWM0h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NyBTYWx0ZWRfX37YD4ECBixQx
 WgfZ/y+rXi2X3VWHPn3NHOfEqHewRCHNLmY6VPZfxW4xAMUXseEfPvrzdBnVFRw8WeQiDd7ZPzA
 WRblMcUwKFIIiM73ixKAB75TUk7lApabd1hwxX+QoqpVjHyuzLTF
X-Proofpoint-GUID: mOCWv8M3jOJNQbBUBIrGYAsEUnEtWM0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NyBTYWx0ZWRfX2rHU0TSeHBE5
 VHDbyMxyi9ruPLO79lf7tVQ0jGSwDohy4JwFHJES4jrQYASqdDWrGcRM05B/CPn87nHDF6VK2sn
 5hy8YgnA0pMJrb3GwE6+NKCGUcLmCr2wXT+P2BCVanAmuNrQgeXK7F/1FPDfHx31gjFu+p8il6Q
 Bqft9k6v7WZsKUwAEkQNIWN1NDBxr+EzOqLc1/oAxpRsOyFp4Q1lbuucTJ+UgMAg7zDSs4Lyne9
 Y3Xh3S4ZQ+16MbxlTIbALtL3WikaVFW/yEaRZZ9c3Rh/NKP2JtzQmrWyKwn81dbV4xtpZQ9jhJm
 XE858CYSbaOZjt2hF2TndKiSEgDZ0FQfnrwGAt3nPsLO5CaFgsWUGXTV0EapGkRGPOFYz3CiSjX
 iTAd3AR7abplNSI6ZDaPnj1NLZlgqDKr7KhKFZPqbTMZ+Erwf584fqaEv1HnkLIeVsLFDsdftMM
 IJtRRR2uYZBrWore7xA==
X-Authority-Analysis: v=2.4 cv=NLlAaE6g c=1 sm=1 tr=0 ts=6afb5ca9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=eaRlbwK1kuk26zd7Q68A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=10 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160077

On 11/16/26 9:41 AM, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 13, 2026 at 04:59:39PM -0500, Tal Zussman wrote:
>> On 11/12/26 1:44 PM, Lorenzo Stoakes (ARM) wrote:
>> > On Wed, Nov 11, 2026 at 12:55:12PM -0500, Tal Zussman wrote:
>> >> remove_migration_pte() makes the restored PTE writable for a writable
>> >> migration entry, and only looks at the uffd bit of the entry otherwise.
>> >> A writable migration entry that has the uffd bit set is therefore
>> >> restored as a writable PTE without the uffd bit, and the page is no
>> >> longer write-protected.
>> >
>> > The UFFD WP bit is such a terrible, invasive, broken piece
>> > of... engineering :)
>> >
>> > Notice, again, the hallmark of an utterly broken abstraction - every user
>> > just has to happen to know to handle each of your weird edge cases every
>> > single time they happen to interact with anything that touches it.
>> >
>> > I do hope we never merge something as bad as this again.
>> >
>> >>
>> >> An entry with the uffd bit set must be restored write-protected, whether
>> >> the entry is writable or not. remove_migration_pmd() gets this right: it
>> >
>> > Sigh :)
>> >
>> >> makes the PMD writable and sets the uffd bit as two independent steps,
>> >> and pmd_mkuffd() write-protects the result. To fix it, do the same at
>> >> the PTE level, where pte_mkuffd() write-protects the PTE as well.
>> >>
>> >> The only known path that created such entries is PAGEMAP_SCAN. Now that
>> >
>> > Wait what? :)
>> >
>> > How does a read-only scan of entries create softleaf entries?
>> >
>> > I think this should be explained in the commit message :)
>> >
>>
>> Will add a sentence... unfortunately not a read-only scan...
> 
> Thanks! Yeah I realised later the true horrors of what PAGEMAP_SCAN can do
> with uffd flags (ugh).
> 
>>
>> >> PAGEMAP_SCAN downgrades them like change_protection() does, we should no
>> >> longer see them, so this change alone should not be visible to
>> >> userspace. If another path ever creates a writable migration entry with
>> >> the uffd bit set, the page now stays write-protected instead of losing
>> >> the uffd bit.
>> >>
>> >> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
>> >
>> > This seems like a super-weird fixes target.
>> >
>>
>> So this piece of code was added in f45ec5ff16a7, but the issue derives
>> from PAGEMAP_SCAN, which is the commit above. I think 52526ca7fdb9 is
>> the right target, but can change it.
>>
>> > BTW I've noticed you've not been cc'ing stable, is that on purpose? No
>> > autosel in mm so we do need to do that on stuff intended to get backported.
>> > :)
>> >
>>
>> I added stable for patches 1 and 2, but for this one and the previous patch
>> the impact is PAGEMAP_SCAN reporting a page as written when it wasn't, which
>> over-reports but doesn't lose anything, so I left it off. Maybe I'm being
>> too conservative though.
> 
> No that's fine, if it's sensible not to then let's not.
> 
> Was just checking to make sure it was intentional ;)
> 

Looks like Breno hit the warning fixed by patch 3:

https://lore.kernel.org/linux-mm/avNEgmvYdoukt6MS@gmail.com/

So I think Cc stable it is.

>>
>> >> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> >
>> > The change itself seems reasonable, as cursed as the reason for it is, so
>> > with the fixes target confirmed + commit message updated:
>> >
>> > Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> >
>> >> ---
>> >>  mm/migrate.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/mm/migrate.c b/mm/migrate.c
>> >> index 28a8d7734735..d200f64b5f98 100644
>> >> --- a/mm/migrate.c
>> >> +++ b/mm/migrate.c
>> >> @@ -399,7 +399,7 @@ static bool remove_migration_pte(struct folio *folio,
>> >>
>> >>  		if (softleaf_is_migration_write(entry))
>> >>  			pte = pte_mkwrite(pte, vma);
>> >> -		else if (pte_swp_uffd(old_pte))
>> >> +		if (pte_swp_uffd(old_pte))
>> >>  			pte = pte_mkuffd(pte);
>> >>
>> >>  		/* See do_swap_page(): restore PAGE_NONE for RWP */
>> >>
>> >> --
>> >> 2.39.5
>> >>
>> >
>> > --
>> > Cheers, Lorenzo
>> >
>>
> 
> --
> Cheers, Lorenzo
> 

