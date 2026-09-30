Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55143AEB4E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802057; cv=none; b=Qa7cR639ngqTV4UDYlL++7v89q23UKXtrMRV65D+RyyqU4NBY79L+wQnphInanK4R/YnkF7LQZ7MruDsrn28tacFsnwWeSHMNhnFpZyEGhIyAznfReb6D+/5wfFhsOjR7jq6znVYXiZUMAH/n/aJ9voBKHyDBHoSGnXIix5k9ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802057; c=relaxed/simple;
	bh=FnxjDp15O/l08n+7wSsG8HVGKXMui4LMVwzYMP8Tdj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxiWV6Bwhz0dChITgK9JQO5TcmsLX/htcf8OXTG2zHUymNzpB9atnaxAZhv/OHKvfkgGKp7oiryQ9TetP+cBgnctv3TQMPNmk6A0h2bVqZX/xITR7+Xq8HefPGdvWp0ptSAWfVCjPk7XC0CUUaZ3SN+eSHY76WCRCNTLe68yW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu; spf=pass smtp.mailfrom=ncsu.edu; dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b=DWt8Wg52; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncsu.edu header.i=@ncsu.edu header.b="DWt8Wg52"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so68748081cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1790802053; x=1791406853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp8tJqOYrF3z/amEkhn3Cfi6ROVd6WC5qRT+L2FdTAk=;
        b=DWt8Wg52duabtUTBcdbsjEGmH0FMXiC4XTHRElzNEBUDnBdPKeHjt7zlq7lHubt5Vy
         j7E11POakyjvtDQrcgi0t4dqVIT7UaEvH79P6pVmiwpTtfe/Dv9G9tUr2KjXakw60QRT
         zwzJlclLAasYKNzmr77CMNIP+JW48baP/yYJc+2HlVJUx7u3tK/CK3hW/1/CnhL1d8gY
         pqxHRKgcSSWF1MIRZqFp3rmYSRKwqgx8HCvS4aOiFmuAreDacdKEIEDB2KH4/el9M386
         mwslFsYgt13LOOgFLWi/bvZaBT1JomAI0tF+Mxg6+l5svtBvzLNSraGHvNFRsCNUWGnP
         qhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790802053; x=1791406853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp8tJqOYrF3z/amEkhn3Cfi6ROVd6WC5qRT+L2FdTAk=;
        b=ABt7ZfHjEw/o4VTxWlrYVxyWR/u45SR7ZzA5HhBjQ7+1dUvwSGJpKNgD+TxlSaL8Dm
         Q2MqLBmcVokoT3bSf0wKquqrQWNq3u/X/xVjzbv5RR9byd0O9N1CuXdX4/9ktyQF7vmY
         sNDYKOzsczQD0Q1MslKEslodm2Z5G6j5nKktpErOqRxM/qP6AFb4CgEsZQSUVhqbpWAA
         FaeWWq2Qs4p4fh97nqIN4IQTubSHe0GQznM6AbYCr1afxNEn2/5dTjgtKhLODSYGRfIf
         ObPkW5iVj8XCaNxVKnGSLdDMWIvF5gHxn0bYvK9YQDKoh1NXHG8L0SvLO09fqvJPSoJ3
         KfdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmgdJxE5swog1Zv9IvP8JpvwFJB2f5KWzxbxhDzJWAgyln9HtNH1IFhedSS02WN7vcA7BQjq4y1El/r3o=@vger.kernel.org
X-Gm-Message-State: AFuF++nSYEqtKG+0g1TV7n51X4TAvLRjWZJkVjAYcMocQS9brTTQvYKz
	7lIHX1mv7YcM/3jfTb26J4L591832kJaCcaDVYHyEYYfGmkiauaKju0SwK3fDT8wHQ==
X-Gm-Gg: AYBFou0iEMRQLom7aVPfBq9PHKC1bJTWe0Gc4IUREvN0krYwTASNukSA5GiOW9+3NJe
	rAczsHmR8XB43pPRlePKlAI2otKGryf6/pEl9+BvDsIN4q0sUU6aPNAb6UUoJWPi1SZeJVCteWO
	VvvuexBq/4724s3Bnc0zJTscxGLrckNlA8TS74gjFmDBQdTNQWrD1YmDrGZ3121qWgnScHAfxtV
	YQQlbzHT3i//UPepPRO8JnMQu/ubg+RxCdHS75BJTa8ISoKB4R4rO2KKVMsxT0wiUaagHSB+1gi
	Azd6vAVVLSDY4HiaZThguxGorrKDwV6LCUtjOCD5GOqg0/TDt/rU9S5xVfOWZO3pOOf2Iy6wDnC
	cPDXMKgtGXdOHvimZxHHqGMA+mL3ftj0r2MGwQovYpchFgX2ZBQRPvCF9aCkBSRKX9Zl0wovAgd
	kEnsXQ5ev6xq4Iqh+9YEjcqdyiPYSrMfQL2UNP/ett14VBghBJfTQV8rEXBeRIYkZDLdkuk+Y4p
	kRN/1n/rosvriAPH+X0zddqfhv7hk2Z36ptEWG8177y1HtbtOwlVBJuCfYna779DnhWDV/Wc+iU
	ew==
X-Received: by 2002:ac8:594b:0:b0:533:35c1:2da4 with SMTP id d75a77b69052e-53374d2c29cmr53444781cf.52.1790802053056;
        Wed, 30 Sep 2026 14:00:53 -0700 (PDT)
Received: from flag-System-Product-Name.tail132f98.ts.net ([136.61.118.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a579d8sm8580336d6.38.2026.09.30.14.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:00:52 -0700 (PDT)
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
Subject: [PATCH v2 1/3] perf dwarf-aux: Add die_is_compound_type() to handle C++ class types
Date: Wed, 30 Sep 2026 17:00:36 -0400
Message-ID: <20260930210038.196928-2-yzhao62@ncsu.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930210038.196928-1-yzhao62@ncsu.edu>
References: <20260930210038.196928-1-yzhao62@ncsu.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

 tools/perf/util/annotate-data.c | 46 +++++++++++++++++++------------
 tools/perf/util/dwarf-aux.c     | 49 +++++++++++++++++++++++++++++----
 tools/perf/util/dwarf-aux.h     |  3 ++
 3 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 19a6ecd67f28..8a9d3f2eec4d 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -237,9 +237,17 @@ static int __add_member_cb(Dwarf_Die *die, void *arg)
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
@@ -321,6 +329,7 @@ static int __add_member_cb(Dwarf_Die *die, void *arg)
 		member->is_union = true;
 		/* fall through */
 	case DW_TAG_structure_type:
+	case DW_TAG_class_type:
 		/* Only aggregates have children to expand, so only they get truncated. */
 		if (member->depth >= MAX_MEMBER_DEPTH) {
 			/* Consumed by the JSON exporter added in a later series. */
@@ -405,8 +414,21 @@ static int fill_member_name(char *buf, size_t sz, struct annotated_member *m,
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
@@ -565,9 +587,7 @@ static const char *match_result_str(enum type_match_result tmr)
 
 static bool is_compound_type(Dwarf_Die *type_die)
 {
-	int tag = dwarf_tag(type_die);
-
-	return tag == DW_TAG_structure_type || tag == DW_TAG_union_type;
+	return die_is_compound_type(type_die);
 }
 
 /* returns if Type B has better information than Type A */
@@ -694,7 +714,6 @@ struct type_state_stack *find_stack_state(struct type_state *state,
 void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
 			    Dwarf_Die *type_die, int ptr_offset)
 {
-	int tag;
 	Dwarf_Word size;
 
 	if (kind == TSR_KIND_POINTER) {
@@ -715,17 +734,10 @@ void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
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
index 54f8b5ec74a2..eb4b8f3475df 100644
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
@@ -2150,13 +2158,21 @@ static int __die_find_member_offset_cb(Dwarf_Die *die_mem, void *arg)
 	Dwarf_Word offset = (long)arg;
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
@@ -2164,6 +2180,30 @@ static int __die_find_member_offset_cb(Dwarf_Die *die_mem, void *arg)
 			loc = 0;
 	}
 
+	if (tag == DW_TAG_inheritance) {
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
+		if (die_get_real_type(die_mem, &base_die) == NULL)
+			return DIE_FIND_CB_SIBLING;
+
+		if (die_find_child(&base_die, __die_find_member_offset_cb,
+				   (void *)(long)(offset - loc), &member_die))
+			return DIE_FIND_CB_END;
+
+		return DIE_FIND_CB_SIBLING;
+	}
+
 	if (offset == loc)
 		return DIE_FIND_CB_END;
 
@@ -2201,7 +2241,7 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset,
 
 	tag = dwarf_tag(type_die);
 	/* If it's not a compound type, return the type directly */
-	if (tag != DW_TAG_structure_type && tag != DW_TAG_union_type) {
+	if (!die_is_compound_type(type_die)) {
 		Dwarf_Word size;
 
 		if (dwarf_aggregate_size(type_die, &size) < 0)
@@ -2216,7 +2256,7 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset,
 
 	mb_type = *type_die;
 	/* TODO: Handle union types better? */
-	while (tag == DW_TAG_structure_type || tag == DW_TAG_union_type) {
+	while (die_is_compound_type(&mb_type)) {
 		member = die_find_child(&mb_type, __die_find_member_offset_cb,
 					(void *)(long)offset, die_mem);
 		if (member == NULL)
@@ -2227,8 +2267,7 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset,
 
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

