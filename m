Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53A3C1D7E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104323; cv=none; b=HXPlTGj05wZavT0O+7eYuyvVAmCs9TyD2d++o3n/8THlmICaHSnqk23qqQyCXtrH5zPp53QSQIRfY+1swO0TBirVM8SuNGhfLf9sMYvGtwTNra/NPhgs66RnjTSNewgRBjtWY6H+OWZBfjm/TwuiRblK/UzCHN4qe+HUajEzskg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104323; c=relaxed/simple;
	bh=y2KF3ZhyumX/N9xLDKf/q5HexEN5l/tSOMG56r2+bbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p3fLe2jDhB9dNP4PM4On1s8JYTHAlA4PuFKM0tnNmK+VhQ+2dMst+TrloNPkz8LCxogg4rfBt1Mn5AoB7p8o3gIAxDaY/VLz+cRisrfeeQT2rZJ8/4IbQM7nlRNTrCKgoQaHHzWGpecT6hyQjTo+YD/qc8w4KDAYwTrid33GHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qNEs080/; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qNEs080/"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2e77b7742dso760707966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792104320; x=1792709120; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8xIcAcbBHZy1mi8Rb1UegUyeiD956DGbti3HZCArR0=;
        b=qNEs080/mRvzbuO/K1lNgEbI3gjtMUg/Rd1PQDRwMRi61CMkGxp/6k6YyP7GAnA0Fn
         uHAyuTmfPjpkDaRzvBa6qacv9J43cbUHFnrQT8MpWFFm0hjsevCAZrWr86ex55sbS3FS
         p1XRlZtCD8u8biCzTmLoM7U0HtzwUioAiV5zqtOaRIrEjyRKHJTDjH+z7p+o68shG6Kh
         LUiRgBdg9IeSgJkfWh4yoEeG51OqqFeuIEr4uZi3OMR/CjzumBIkxkT82fcA91Sb5rlN
         SbcHqNfemuISGgkumz4aN2/Db3DRDH6bB5P4A9zR4M5vVXDHi6AjEPbNym2WDpyAGlvQ
         3faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792104320; x=1792709120;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8xIcAcbBHZy1mi8Rb1UegUyeiD956DGbti3HZCArR0=;
        b=hzn1Tfhd9o0iZ9p6V39aALI5T4vYwWLZ4E2mCm043DSTzjPf0IP7Qr663R3s61CwTI
         6HlIXxDlFz5Q9Df3ft+m8Fk+qmkmK5y+SZVvYGjel/cq4APgF4l6HsqPU2/NipjnhSiC
         1OTVchoKcJjbXwRqiINMuvtaVYrDg8YxfeQjguhjFsOWzdzomtud2+LkvWY6VO3RYnZn
         sdY3mqC67HK1DMloJ5C3aD+ZyPNTskmdjvQlYpMyTUqh1kdtSuEEITQnvUqVZJ1nm1Wy
         Hznxvi5mocHZAKsjV0n9BlfHs4SeFVnMIzpPm/oC2b5hfP9O5I4NvvQLLSf/ihOJWnNA
         3TQA==
X-Forwarded-Encrypted: i=1; AKwUvBzg4DH0XYkRgv697DDHLo+yuXb55zx8VQkr7ndbam6jfN3z4+ZWHZSUiuLetTN2TunUaeZnRJEFi396pgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZLO7HDddghNnNqeUea6FmG75J/MnBIIxPPGaKjA74HINmgqrx
	urHUvSC/LXiijr1QMeqSBhzaIs3Zc4hjCeiFNdu8zgAmKoGWYLbCU1WElcpChJspTRq99c1Hrc3
	Yl0RL1Z+2sp2QX3vG9A==
X-Received: from ejyb15.prod.google.com ([2002:a17:906:834f:b0:c39:4b00:1781])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9801:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c31a9fcf521mr1847005866b.13.1792104319385;
 Thu, 15 Oct 2026 15:45:19 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:45:18 +0000
In-Reply-To: <atB1uG8kLfmZyLIH@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261008190828.3221718-1-tarunsahu@google.com>
 <as4EcgiBH5jjww42@kernel.org> <9huzecdt633e.fsf@tarunix.c.googlers.com> <atB1uG8kLfmZyLIH@kernel.org>
Message-ID: <9huzo6cuinwh.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 1/2] memblock: drop for_each_memblock_type() and open
 code its users
From: tarunsahu@google.com
To: Mike Rapoport <rppt@kernel.org>
Cc: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pratyush Yadav <pratyush@kernel.org>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Mike Rapoport <rppt@kernel.org> writes:

> On Tue, Oct 13, 2026 at 03:18:45PM +0000, tarunsahu@google.com wrote:
>> Mike Rapoport <rppt@kernel.org> writes:
>> 
>> > Hi Tarun,
>> >
>> > Please for the next time add the cover-letter when sending more than one
>> > patch.
>> 
>> Thanks Mike for piking up the patches.
>> 
>> Sure, I will take care of adding the cover-letter.
>> 
>> You had some nit change suggestion, Let me know if you want
>> me send v5 or it is alright.
>
> I fixed some of it when applying and some right now, no need for v5

Thanks Mike!

>  
>> ~Tarun
>> 
>> 
>> >
>> > On Thu, Oct 08, 2026 at 07:08:27PM +0000, Tarun Sahu wrote:
>> >> for_each_memblock_type() always starts the iteration at index 0 and its
>> >> body is a trivial 'for' loop, so it hides very little. It also gets in
>> >> the way of iterating from an arbitrary index, which the next patch
>> >> needs.
>> >> 
>> >> Remove the macro and open code its three users: memblock_add_range(),
>> >> memblock_isolate_range() and memblock_dump(). While at it, move the
>> >> region pointer into the loop body scope.
>> >> 
>> >> No functional change.
>> >> 
>> >> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>> >> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> >> ---
>> >>  mm/memblock.c | 17 ++++++-----------
>> >>  1 file changed, 6 insertions(+), 11 deletions(-)
>> >> 
>> >> diff --git a/mm/memblock.c b/mm/memblock.c
>> >> index f5aaa38cfa31..59dda7d085f3 100644
>> >> --- a/mm/memblock.c
>> >> +++ b/mm/memblock.c
>> >> @@ -155,11 +155,6 @@ struct memblock_type physmem = {
>> >>   */
>> >>  static __refdata struct memblock_type *memblock_memory = &memblock.memory;
>> >>  
>> >> -#define for_each_memblock_type(i, memblock_type, rgn)			\
>> >> -	for (i = 0, rgn = &memblock_type->regions[0];			\
>> >> -	     i < memblock_type->cnt;					\
>> >> -	     i++, rgn = &memblock_type->regions[i])
>> >> -
>> >>  #define memblock_dbg(fmt, ...)						\
>> >>  	do {								\
>> >>  		if (memblock_debug)					\
>> >> @@ -615,7 +610,6 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>> >>  	phys_addr_t obase = base;
>> >>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>> >>  	int idx, nr_new, start_rgn = -1, end_rgn;
>> >> -	struct memblock_region *rgn;
>> >>  
>> >>  	if (!size)
>> >>  		return 0;
>> >> @@ -651,7 +645,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>> >>  	base = obase;
>> >>  	nr_new = 0;
>> >>  
>> >> -	for_each_memblock_type(idx, type, rgn) {
>> >> +	for (idx = 0; idx < type->cnt; idx++) {
>> >> +		struct memblock_region *rgn = &type->regions[idx];
>> >>  		phys_addr_t rbase = rgn->base;
>> >>  		phys_addr_t rend = rbase + rgn->size;
>> >>  
>> >> @@ -815,7 +810,6 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>> >>  {
>> >>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>> >>  	int idx;
>> >> -	struct memblock_region *rgn;
>> >>  
>> >>  	*start_rgn = *end_rgn = 0;
>> >>  
>> >> @@ -827,7 +821,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>> >>  		if (memblock_double_array(type, base, size) < 0)
>> >>  			return -ENOMEM;
>> >>  
>> >> -	for_each_memblock_type(idx, type, rgn) {
>> >> +	for (idx = 0; idx < type->cnt; idx++) {
>> >> +		struct memblock_region *rgn = &type->regions[idx];
>> >>  		phys_addr_t rbase = rgn->base;
>> >>  		phys_addr_t rend = rbase + rgn->size;
>> >>  
>> >> @@ -2194,11 +2189,11 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
>> >>  	phys_addr_t base, end, size;
>> >>  	enum memblock_flags flags;
>> >>  	int idx;
>> >> -	struct memblock_region *rgn;
>> >>  
>> >>  	pr_info(" %s.cnt  = 0x%lx\n", type->name, type->cnt);
>> >>  
>> >> -	for_each_memblock_type(idx, type, rgn) {
>> >> +	for (idx = 0; idx < type->cnt; idx++) {
>> >> +		struct memblock_region *rgn = &type->regions[idx];
>> >>  		char nid_buf[32] = "";
>> >>  
>> >>  		base = rgn->base;
>> >> -- 
>> >> 2.56.0.385.gd3acb90ef8-goog
>> >> 
>> >
>> > -- 
>> > Sincerely yours,
>> > Mike.
>
> -- 
> Sincerely yours,
> Mike.
