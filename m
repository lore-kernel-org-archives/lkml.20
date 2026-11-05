Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902807;
	b=PwCLxtKLXlq3OIiikd7bUXKaWffWsfeR93uPUIutwcPMYCoMcBec/yK2CYFFkrEmxHSw
	 iU3HQI7OwxDj8h+KjHGCoD+fh9Ed2b8tSIVWfq4jXry6R2IuErVfSEMnD3U9ZVkaHzcQB
	 pe42wzJbSiWj3Pn93oAHciqMXhS0t1S3JhFjXNOdP97qo+WF2vMNZEEu8ogSRRF4dtYJA
	 FASztF65Do6N14vQSOn8bfVQSn16nyXBcC5NcytgXXS85oly3u5Yt36PVeXaGw3PLbqVC
	 qDdw1KMPy1DxLVtnx24uBL7zGj1nG0QgVnfuvrvQMhkh761aC02ClceGjT6WjCVntdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S7hj5IUwU45EoNiJJ8q3pSrU93RHrB/ZKc42uzrWOgM=;
	b=mDiSYn2uHl3ZumakjWFGGzLxyimec3N0XHvkLeLDw5PGjWudlBeHlpUbFl/nmdQurT7b
	 3pXxMlMgxJkbVYze0Qaw4dwDF14auMZWMXf15/iWxSZcgB7Behzz8RtRr8i6AUmx1gLtv
	 pLBq2nPPrE5MqvgkdjvYhoKuo5lxotN2Ha8ODb2Ll0sh2ARE3XpYmuS8XqfpbTWhHEwOm
	 2q665+VYqLmSor6dDmOoFQ6u4fF2IsleyJ//d66Q7n7TeuDJ4WFSuuq3FxydwfLnQxfNt
	 YZM8d6uGa73QR8ZoGs8ZV7l0cKy6iJMv1HIUXDxWVnMq7Q5N1cz1NGRIIl/hTMN8tZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ncsu.edu;
	spf=pass smtp.mailfrom=ncsu.edu;
	dkim=pass header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b=E5N+MLD8;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84518606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84518606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b=E5N+MLD8
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d126f631so24074787b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1793902805; x=1794507605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7hj5IUwU45EoNiJJ8q3pSrU93RHrB/ZKc42uzrWOgM=;
        b=E5N+MLD8KSeXdtLJO03duIvY8c+Lv45BtyaKgic2DOLTUYCqdgrjFHCdUnJwwRRe2b
         j1X697LIcShGJ5Uwx10gYfVNQ9WGMtFjFF6Z2s8C+8GYrjkdxZwGba8rNowK6Jyula5B
         /1bbei+z/hjm30wnkp9ScajQ5Da8f8/+2gS6K92TyZw8o546veXZognqus7vS7yplAIB
         i3h0rXoCIz7PmLzn85etH/G2GygajEHU9fkr0xPkHtH42kK3wMkrDlQF9CwhFtrNIxCS
         tVWmqLGBl/XvYx3ojGyZgb6oiwyLGmpvT83Aiup8HucQb+CL6cxuHh/EN20bWyQBt+/w
         azqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902805; x=1794507605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7hj5IUwU45EoNiJJ8q3pSrU93RHrB/ZKc42uzrWOgM=;
        b=mfmHl1DDWs87p3sAVJ91cIlcXvp+ox+mni8l2yLG9WUlITK5pk6qmAq988BxFCZa16
         0ln8gBHyaqIbn/dP4GM24U64c0V1Q5wom7lNQRLWUNRgDSTNazNw1hC8w+1LBMP8ec7c
         OzXpJg3NFKtMjJz1d0MrdLCUM4nTTlnYDgZB1lcaYeyootZbe7g4goOkbifVbnQ2XGV+
         xv0zJn3v5FWY76TLNMHDHMGeC37dnzJXMryp+Sf7D8Y7eWhF5KxBw6JLtYJKhQx5B7JX
         6UTyzrsWtNSzZnS9g5CUojcjzlZtwJI6b2HLkIPe56A+mWlsuc19aTWS7WCj+txfExO2
         Mxjg==
X-Forwarded-Encrypted: i=1; AL+hErE0sA8s2rGHTQFoXJT6oYtzzjn8suRI8IeRiRZ6RswHNkHSMkgJ2EvAIfxtgiWb6lXGaJaElXBAyHW4s70=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1bd/SvCB5Mi6hK1m6URtkbes5PacRvZuLdeCSUCXeQv1pbIhj
	bl0i5wrIB4qqfb4yPVTOpCYWlEal2AuYQxSFFDVncGgrBSMNgg83BHRQnGHmVoLgDg==
X-Gm-Gg: AYBFou3IB3IiL2PahjhUS2yPEKzksM9WUPbLO6K2pYrOWZEXliWgqzAsSUcKJGteWBE
	PQGOaV6Gy0ltm32emAn61s9EEMm+T/QfmePZxRVrN0qJuK9XpY7SINtOQR48l/A2d71wbAxLyt/
	wEZ5vKuOOZ4jfeLM8xaYdkOFJAMqiEmbNi+hEGC3zsEEdhsDh7X04VVzS8BBq8m2f0nnozrDZjG
	9BVyZDXPsu4XSF3WjipLT38QkYPBzM9KCdk043C4RtHGydQFzMG4iozdlL338TcMdBRF7nJdh9i
	nCPhOQlRLaC6LNgOszUkHepBl73s50bRu80EPPS0xkSLEQg9S+fJ/H/e/ies2h2lkiyEUyUbGfk
	F0HcQlYzo9+Fle05QqEKqm2gEZDEo8oPowuBIWiYMRdkLQMWK5Klbvinuy+L9FXA7WOwVisnqbd
	ZIt9kUplKVAfo+oQq3dAZobsWGLZGuTho+rpda7s3i5N8LXjOMLY+raxruGn5v2VC5ZPUCU5o9e
	BQqDCBQ7wbcGw0NbC+yEiHBdI9VvgO3HtQQ/feqq5tY+x5B59wTJTtC2wHsMM2HQSxiTKybRdrg
	fvg9b4+WyIUAG/Eq3xCzdljAh7K9L2/CqtbErLqsi6qyBSgLqjtAzixez6QYvpMpErFJeKHJhcH
	X2m3v0KihhfHg0Z7pdc8Q
X-Received: by 2002:a05:690c:c50d:b0:8b0:97f5:a855 with SMTP id 00721157ae682-8b2b66c4e73mr156797057b3.22.1793902805038;
        Thu, 05 Nov 2026 10:20:05 -0800 (PST)
Received: from flag-System-Product-Name.tail132f98.ts.net ([136.61.118.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2d5dsm1492287b3.2.2026.11.05.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:20:03 -0800 (PST)
From: Yanbo Zhao <yzhao62@ncsu.edu>
To: Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Kan Liang <kan.liang@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Zecheng Li <zli94@ncsu.edu>,
	Xu Liu <xliuprof@google.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yanbo Zhao <yzhao62@ncsu.edu>
Subject: [PATCH v5 1/3] perf dwarf-aux: Add die_is_compound_type() to handle C++ class types
Date: Thu,  5 Nov 2026 13:19:47 -0500
Message-ID: <20261105181949.43198-2-yzhao62@ncsu.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105181949.43198-1-yzhao62@ncsu.edu>
References: <20261105181949.43198-1-yzhao62@ncsu.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the die_is_compound_type() helper which checks for
DW_TAG_structure_type, DW_TAG_union_type, and DW_TAG_class_type, and
convert the existing open-coded struct/union tag checks to use it:
- die_get_member_type() in dwarf-aux.c.
- is_compound_type() and set_stack_state() in annotate-data.c.

The switch in __add_member_cb() also handles unions and the nesting
limit, so DW_TAG_class_type is just added there as another case.

Also accept DW_TAG_inheritance in the member lookup callbacks
(__die_find_member_offset_cb() and __add_member_cb()) so that member
lookup by offset descends into C++ base class subobjects.

In DWARF, a base class subobject is described by a DW_TAG_inheritance
child of the derived class DIE.  It sits next to the DW_TAG_member
children and carries the same DW_AT_type and DW_AT_data_member_location
attributes, so it can be treated like an unnamed member whose type is
the base class.  Members inherited from the base are not repeated in
the derived class DIE; they can only be reached through the
DW_TAG_inheritance entry.

For example, with the following classes (GCC 15, -O2 -g):

  struct Base  { long a; virtual long get(long x); };
  struct Other { long c; virtual long hi(); };
  struct Multi : Base, Other { long d; ... };

the DWARF looks like this (subprogram DIEs omitted):

  <1><2f>: Abbrev Number: 15 (DW_TAG_structure_type)
     <30>   DW_AT_name        : Multi
     <34>   DW_AT_byte_size   : 40
  <2><3e>: Abbrev Number: 20 (DW_TAG_inheritance)
     <3f>   DW_AT_type        : <0x10b>
     <43>   DW_AT_data_member_location: 0
  <2><44>: Abbrev Number: 20 (DW_TAG_inheritance)
     <45>   DW_AT_type        : <0x1d0>
     <49>   DW_AT_data_member_location: 16
  <2><99>: Abbrev Number: 16 (DW_TAG_member)
     <9a>   DW_AT_name        : d
     <a1>   DW_AT_data_member_location: 32
  ...
  <1><10b>: Abbrev Number: 15 (DW_TAG_structure_type)
     <10c>   DW_AT_name        : Base
     <110>   DW_AT_byte_size   : 16
  <2><14d>: Abbrev Number: 25 (DW_TAG_member)
     <14e>   DW_AT_name        : _vptr.Base
     <156>   DW_AT_data_member_location: 0
  <2><156>: Abbrev Number: 16 (DW_TAG_member)
     <157>   DW_AT_name        : a
     <15e>   DW_AT_data_member_location: 8
  ...
  <1><1d0>: Abbrev Number: 15 (DW_TAG_structure_type)
     <1d1>   DW_AT_name        : Other
     <1d5>   DW_AT_byte_size   : 16
  <2><245>: Abbrev Number: 25 (DW_TAG_member)
     <246>   DW_AT_name        : _vptr.Other
     <24e>   DW_AT_data_member_location: 0
  <2><24e>: Abbrev Number: 16 (DW_TAG_member)
     <24f>   DW_AT_name        : c
     <256>   DW_AT_data_member_location: 8

An access to 'struct Multi' at offset 0x8 is Base::a, and one at
offset 0x18 is Other::c.  Neither of them is a DW_TAG_member of Multi.
With DW_TAG_inheritance accepted in __die_find_member_offset_cb(),
die_get_member_type() finds the DW_TAG_inheritance at offset 0 (size
16, covering 0x8), follows its DW_AT_type to Base, and then resolves
'a' at offset 0x8 within Base.  Likewise offset 0x18 goes through the
second DW_TAG_inheritance at 16 and resolves to 'c' at offset 0x8 in
Other.  The same applies to __add_member_cb() which builds the member
tree used to print 'Data Type Offset' names.

Note that this is only about the layout of data members: a base class
subobject is looked up in the same way regardless of how many base
classes the class has.  Resolving virtual function calls through the
vtable of a class with multiple base classes is a separate matter and
is described in the following patches.

Note that GCC emits DW_TAG_structure_type for a C++ 'struct' even when
it has virtual functions, and DW_TAG_class_type for 'class', so both
tags need to be treated as compound types.

A base class subobject differs from a member in three ways that need
care:

1. It can take less space than the size of the base class type.  An
   empty base occupies no bytes (empty base optimization) although the
   DW_AT_byte_size of the base type is 1, and a member of the derived
   class can be placed in the tail padding of the base:

     struct Empty {};
     struct EboD : Empty { long x; };         // Empty at 0, x at 0

     struct B { long a; int b; B(); };        // sizeof(B) == 16
     struct TailD : B { int c; };             // B at 0, c at 12

   The DW_TAG_inheritance comes before the DW_TAG_member in DWARF, so
   an offset-based lookup would match the base first and then fail to
   find the member in it.  To handle this, __die_find_member_offset_cb()
   only matches a DW_TAG_inheritance if the base class actually has a
   member at the offset, and fill_member_name() continues with the next
   sibling when an anonymous child (a base class or an anonymous
   struct/union) has nothing at the offset.

2. A virtual base class has a DW_AT_data_member_location that is a
   location expression evaluated at runtime with the vtable:

     struct V { long v; };
     struct VirtD : virtual V { long d; };

     <2><5d>: Abbrev Number: 13 (DW_TAG_inheritance)
        <5e>   DW_AT_type        : <0x2f>
        <62>   DW_AT_data_member_location: 6 byte block: 12 6 48 1c 6 22
                 (DW_OP_dup; DW_OP_deref; DW_OP_lit24; DW_OP_minus;
                  DW_OP_deref; DW_OP_plus)
        <69>   DW_AT_virtuality  : 1        (virtual)

   Its offset cannot be resolved statically, so such an entry is
   skipped in both __die_find_member_offset_cb() and __add_member_cb()
   instead of falling back to offset 0 which would shadow the vtable
   pointer of the derived class.

3. DW_TAG_inheritance has no DW_AT_name.  It's added to the member
   tree as an anonymous entry with the base class as its type name,
   so 'Data Type Offset' shows the member name without the base class,
   like 'struct Multi +0x8 (a)'.

The recursion into base classes in __die_find_member_offset_cb() is
bounded by MAX_TYPE_CHASE like the other type chasing code, in case of
broken debug info with cyclic inheritance.  The callback argument
carries the nesting depth and an overflow flag which stops the search
and makes the callers fail instead of returning a wrong DIE.

With this, accesses through pointers to the types above are resolved
as below, where the first two were reported as '(no field)' before:

  struct EboD  +0    (x)
  struct TailD +0xc  (c)
  struct VirtD +0x8  (d)

This extends the existing member type resolution and data type
profiling state handling to C++ classes with inheritance without
changing behavior for C struct/union types.

Signed-off-by: Yanbo Zhao <yzhao62@ncsu.edu>
---
Changes in v5:
- Bound the recursion into base classes with MAX_TYPE_CHASE (Sashiko,
  Namhyung).  The callback argument of __die_find_member_offset_cb()
  is now a struct with the offset, the nesting depth and an overflow
  flag.  When the limit is reached, the search stops and
  die_get_member_type() returns NULL instead of a wrong DIE.
- Drop the Reviewed-by because of the change.

Changes in v4:
- No change (rebased).  Add Reviewed-by from Namhyung.

Changes in v3:
- No change.

Changes in v2:
- Add an example DWARF of a class with base classes to the commit
  message and explain why DW_TAG_inheritance is handled like
  DW_TAG_member (Namhyung).
- Skip virtual base classes whose DW_AT_data_member_location is a
  runtime expression instead of falling back to offset 0, in both
  __die_find_member_offset_cb() and __add_member_cb() (Sashiko).
- Match a DW_TAG_inheritance in the offset lookup only if the base
  class actually has a member at the offset, so that a member of the
  derived class placed at the same offset as an empty base (EBO) or in
  the tail padding of the base is found (Sashiko).
- Continue with the next sibling in fill_member_name() when an
  anonymous child (base class) has nothing at the offset, so the member
  name is shown instead of '(no field)' in the cases above.
 tools/perf/util/annotate-data.c | 46 ++++++++++++-------
 tools/perf/util/dwarf-aux.c     | 81 +++++++++++++++++++++++++++++----
 tools/perf/util/dwarf-aux.h     |  3 ++
 3 files changed, 105 insertions(+), 25 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 25e3169ea8ad..6597de34dd6e 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -252,9 +252,17 @@ static int __add_member_cb(Dwarf_Die *die, void *arg)
 	Dwarf_Word size, loc, bit_size = 0;
 	Dwarf_Attribute attr;
 	struct strbuf sb;
-	int tag;
+	int tag = dwarf_tag(die);
+
+	if (tag != DW_TAG_member && tag != DW_TAG_inheritance)
+		return DIE_FIND_CB_SIBLING;
 
-	if (dwarf_tag(die) != DW_TAG_member)
+	/*
+	 * A virtual base class (C++) has a location expression evaluated
+	 * using the vtable at runtime, so its offset is not known here.
+	 */
+	if (tag == DW_TAG_inheritance &&
+	    die_get_data_member_location(die, &loc) < 0)
 		return DIE_FIND_CB_SIBLING;
 
 	if (die_get_real_type(die, &die_mem) == NULL)
@@ -336,6 +344,7 @@ static int __add_member_cb(Dwarf_Die *die, void *arg)
 		member->is_union = true;
 		/* fall through */
 	case DW_TAG_structure_type:
+	case DW_TAG_class_type:
 		/* Only aggregates have children to expand, so only they get truncated. */
 		if (member->depth >= MAX_MEMBER_DEPTH) {
 			/* Consumed by the JSON exporter added in a later series. */
@@ -420,8 +429,21 @@ static int fill_member_name(char *buf, size_t sz, struct annotated_member *m,
 		if (offset < child->offset || offset >= child->offset + child->size)
 			continue;
 
-		found = true;
-		break;
+		if (child->var_name) {
+			found = true;
+			break;
+		}
+
+		/*
+		 * An anonymous child is a C++ base class or an anonymous
+		 * struct/union.  A base class subobject can share the offset
+		 * with a member of the derived class (empty base or tail
+		 * padding reuse), so keep looking if nothing is found in it.
+		 */
+		len = fill_member_name(buf, sz, child, offset, first,
+				       has_flex_array);
+		if (len)
+			return len;
 	}
 
 	if (!found && has_flex_array) {
@@ -580,9 +602,7 @@ static const char *match_result_str(enum type_match_result tmr)
 
 static bool is_compound_type(Dwarf_Die *type_die)
 {
-	int tag = dwarf_tag(type_die);
-
-	return tag == DW_TAG_structure_type || tag == DW_TAG_union_type;
+	return die_is_compound_type(type_die);
 }
 
 /* returns if Type B has better information than Type A */
@@ -709,7 +729,6 @@ struct type_state_stack *find_stack_state(struct type_state *state,
 void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
 			    Dwarf_Die *type_die, int ptr_offset, u64 imm_value)
 {
-	int tag;
 	Dwarf_Word size;
 
 	if (kind == TSR_KIND_POINTER) {
@@ -732,17 +751,10 @@ void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
 		return;
 	}
 
-	tag = dwarf_tag(type_die);
-
-	switch (tag) {
-	case DW_TAG_structure_type:
-	case DW_TAG_union_type:
+	if (die_is_compound_type(type_die))
 		stack->compound = (kind != TSR_KIND_PERCPU_POINTER);
-		break;
-	default:
+	else
 		stack->compound = false;
-		break;
-	}
 }
 
 struct type_state_stack *findnew_stack_state(struct type_state *state,
diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
index 54f8b5ec74a2..1cd1643fd1d2 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -61,6 +61,14 @@ const char *cu_get_comp_dir(Dwarf_Die *cu_die)
 	return dwarf_formstring(&attr);
 }
 
+bool die_is_compound_type(Dwarf_Die *type_die)
+{
+	int tag = dwarf_tag(type_die);
+
+	return tag == DW_TAG_structure_type || tag == DW_TAG_union_type ||
+	       tag == DW_TAG_class_type;
+}
+
 /* Unlike dwarf_getsrc_die(), cu_getsrc_die() only returns statement line */
 static Dwarf_Line *cu_getsrc_die(Dwarf_Die *cu_die, Dwarf_Addr addr)
 {
@@ -2143,20 +2151,35 @@ int die_get_scopes(Dwarf_Die *cu_die, Dwarf_Addr pc, Dwarf_Die **scopes)
 	return data.nr;
 }
 
+struct __find_member_offset_param {
+	Dwarf_Word offset;
+	int depth;	/* nesting of base classes */
+	bool overflow;	/* depth limit reached, the result is not valid */
+};
+
 static int __die_find_member_offset_cb(Dwarf_Die *die_mem, void *arg)
 {
+	struct __find_member_offset_param *param = arg;
 	Dwarf_Die type_die;
 	Dwarf_Word size, loc;
-	Dwarf_Word offset = (long)arg;
+	Dwarf_Word offset = param->offset;
 	int tag = dwarf_tag(die_mem);
 
-	if (tag != DW_TAG_member)
+	if (tag != DW_TAG_member && tag != DW_TAG_inheritance)
 		return DIE_FIND_CB_SIBLING;
 
 	/* Unions might not have location */
 	if (die_get_data_member_location(die_mem, &loc) < 0) {
 		Dwarf_Attribute attr;
 
+		/*
+		 * A virtual base class (C++) has a location expression that
+		 * needs the vtable at runtime.  Skip it as it cannot be
+		 * resolved statically.
+		 */
+		if (tag == DW_TAG_inheritance)
+			return DIE_FIND_CB_SIBLING;
+
 		if (dwarf_attr_integrate(die_mem, DW_AT_data_bit_offset, &attr) &&
 		    dwarf_formudata(&attr, &loc) == 0)
 			loc /= 8;
@@ -2164,6 +2187,47 @@ static int __die_find_member_offset_cb(Dwarf_Die *die_mem, void *arg)
 			loc = 0;
 	}
 
+	if (tag == DW_TAG_inheritance) {
+		struct __find_member_offset_param base_param = {
+			.offset = offset - loc,
+			.depth = param->depth + 1,
+		};
+		Dwarf_Die base_die, member_die;
+
+		/*
+		 * A base class subobject can be smaller than the size of the
+		 * class type: an empty base takes no space (EBO) and a member
+		 * of the derived class can be placed in the tail padding of
+		 * the base.  In both cases a member of the derived class is
+		 * at the same offset as the base, so only match the base if
+		 * it actually has a member at the offset.
+		 */
+		if (offset < loc)
+			return DIE_FIND_CB_SIBLING;
+
+		/*
+		 * Stop the search on broken debug info with cyclic
+		 * inheritance.  The callers check the overflow flag.
+		 */
+		if (param->depth >= MAX_TYPE_CHASE) {
+			pr_debug("DWARF: base class recursion limit reached at DIE 0x%lx\n",
+				 (unsigned long)dwarf_dieoffset(die_mem));
+			param->overflow = true;
+			return DIE_FIND_CB_END;
+		}
+
+		if (die_get_real_type(die_mem, &base_die) == NULL)
+			return DIE_FIND_CB_SIBLING;
+
+		if (die_find_child(&base_die, __die_find_member_offset_cb,
+				   &base_param, &member_die)) {
+			param->overflow = base_param.overflow;
+			return DIE_FIND_CB_END;
+		}
+
+		return DIE_FIND_CB_SIBLING;
+	}
+
 	if (offset == loc)
 		return DIE_FIND_CB_END;
 
@@ -2195,13 +2259,14 @@ static int __die_find_member_offset_cb(Dwarf_Die *die_mem, void *arg)
 Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset,
 			       Dwarf_Die *die_mem)
 {
+	struct __find_member_offset_param param = { .depth = 0 };
 	Dwarf_Die *member;
 	Dwarf_Die mb_type;
 	int tag;
 
 	tag = dwarf_tag(type_die);
 	/* If it's not a compound type, return the type directly */
-	if (tag != DW_TAG_structure_type && tag != DW_TAG_union_type) {
+	if (!die_is_compound_type(type_die)) {
 		Dwarf_Word size;
 
 		if (dwarf_aggregate_size(type_die, &size) < 0)
@@ -2216,10 +2281,11 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset,
 
 	mb_type = *type_die;
 	/* TODO: Handle union types better? */
-	while (tag == DW_TAG_structure_type || tag == DW_TAG_union_type) {
+	while (die_is_compound_type(&mb_type)) {
+		param.offset = offset;
 		member = die_find_child(&mb_type, __die_find_member_offset_cb,
-					(void *)(long)offset, die_mem);
-		if (member == NULL)
+					&param, die_mem);
+		if (member == NULL || param.overflow)
 			return NULL;
 
 		if (die_get_real_type(member, &mb_type) == NULL)
@@ -2227,8 +2293,7 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset,
 
 		tag = dwarf_tag(&mb_type);
 
-		if (tag == DW_TAG_structure_type || tag == DW_TAG_union_type ||
-		    tag == DW_TAG_array_type) {
+		if (die_is_compound_type(&mb_type) || tag == DW_TAG_array_type) {
 			Dwarf_Word loc;
 
 			/* Update offset for the start of the member struct */
diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
index 6f9145510adc..7c893e385824 100644
--- a/tools/perf/util/dwarf-aux.h
+++ b/tools/perf/util/dwarf-aux.h
@@ -23,6 +23,9 @@ const char *cu_find_realpath(Dwarf_Die *cu_die, const char *fname);
 /* Get DW_AT_comp_dir (should be NULL with older gcc) */
 const char *cu_get_comp_dir(Dwarf_Die *cu_die);
 
+/* Check if DIE is a compound type (structure, union, or class) */
+bool die_is_compound_type(Dwarf_Die *type_die);
+
 /* Get a line number and file name for given address */
 int cu_find_lineinfo(Dwarf_Die *cudie, Dwarf_Addr addr,
 		     const char **fname, int *lineno);
-- 
2.53.0

