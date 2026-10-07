Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D580A4915A9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369381; cv=pass; b=CzJ90Z1e/NAY0YyWxO7GoawIdOY5KOz1VCFoMsHLsY50NkG0keOvEBER1di9Y1yBjJEl91Uqv8xpZkpoVYwB77f0/btxz8HVI4zlVkBqr+Xa1+W3rnBT+tBCSzJD9/BlGYB2ViW9x3Ge53MMAOEnQFxu0tVwRpLQCroTYXCmyK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369381; c=relaxed/simple;
	bh=5yePlymVt9qHjFmmrEl03uChO3HanrN7ZEpzPjDfanc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rmeXcOGrSat8do6/zz7SEVbpSdiuQODuxCh34Lf6b4HQK80GbbNhnWta0fu2aDxYlWy3COtOeXQdGYVIkC85kWeGWdt1ODMreH4o2oeUtArMn+T5NHLCvaSdW5Na4pffqs5K2RrfXlsjDC+6s6UykcTNAV4f/nzxScQEx/XZGt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPtQtoP4; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPtQtoP4"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9144e8021d3so66959336d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791369351; cv=none;
        d=google.com; s=arc-20260327;
        b=oPOVjxeFVya7YbBT1wBwIHXXW1qx1v6uch5up2LqaQepzHIrxi8zXT1c6qIT7l3w8c
         hM3xFe/H72LpST8qw4DwO01U2V/tY1iBIz2uCCWQ0dEJmt5Jgomz0fGb23FKmnKnZTNr
         2kUSoYJCQtnrjnja0ujZDL3yzPecSPQ3rvwPTv0doJ1nrWvJ2oL3VHtJUemF7e6XV1L2
         Ewi/9PQRukKtFVLOvIxoL/Rj80bJuzbCh6puUdcbTXh10LYV/s0INhgEhVKSpkliT1RG
         FpaFEtVkjaA9qc6xsczXOP1FoZZvRI7yHufUy7CH5N6/508Tuij1px3IvQFlx3MuEUYs
         BPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MQfqQLaS7NmMc+xICuqZaigBPGZ351Cprmmnfp9gD3U=;
        fh=KicBz6+enunKO/CTctv4AIjgt3gbxRkQr14ISRT4twc=;
        b=q1gWRx3h5OkOEUM6NoRbBSoZp5nr8iRgyLUJyaWxN8HjRktdbEnVlpdyaSRTUq2HYW
         6VTnqwR13CkMdquetiMSnhWAoDy+aMgKVa+OTOaAtSLiifmRsSKXv3LoM9K+n713jWK9
         LqCGyH+3Erz09A7xSGDyOWB2iJRTL1+f70KEJgvzDF17l05ZSvcZQep5OOnMW3mMc3Of
         juvINo69jZ0Beb7073iaQ10njbD2r73dXZDCo/dbgMeHh5QYb9NJoYGGdMHLWvw+QAmI
         e6WGKNU5jmqdXPeRQmSaKgPp4iVhFtbwASW982Xc2LHi/JfXxcFzefniGrEFhoYlLoxK
         r0vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791369351; x=1791974151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQfqQLaS7NmMc+xICuqZaigBPGZ351Cprmmnfp9gD3U=;
        b=NPtQtoP4+jksAHmjnF6glF84hsCsrrRr1dx9LV/GQUDo5fQpXdFLtGWDK73fZ8UVRs
         tDn5qaIYjZZ3HGQLmZCcHHOIkj2c2jlmPfedrvp/qMK8LQVGcht/W6b9KV9aHeoStArJ
         NduebLkHmGVm3XAb5VL2O2HdUDJA58dnE6hkk7sPDRMHivQwg22/RkFRTtQybUoJoptz
         vCsNJyXDCmtPy4/8ek9uBqE+XtnmJNKgnH1L7QfYM7II5lhaMrDjK69QW3yvqWHRuXIv
         r7YBq3ykuVLOyrWACcnN8gMMlnwDxMGWzn3m5gRDJARq9Pr7sNtcJL6oWGGf8ATGSEBy
         VI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369351; x=1791974151;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MQfqQLaS7NmMc+xICuqZaigBPGZ351Cprmmnfp9gD3U=;
        b=yMsok90rFVXLuzQBpuQgt+bHIQ984Sa+col9uKx8d9G7YmLCgH91eC4uOoFD3IEvG3
         JT1xpL8Gn2ERMgzIb6wNbFv4N0KopjrDmxCGbb6pOLLduB3tp4cb7cLa5S2fzzWXo0rm
         O4M9+uERnaRoNLRcvU0i5J4DzOoSpV5NI5IDKblD+PvsxbHgVYY4yd8hAhNWkjq8UvXI
         y+HEDp8OvjRlzkvkSgi6d5VHKdN22jaYBfvFJetlLSWHlGbcU3XpI0Ex9KQPDCoxyOwj
         vxm8SjJH5jB3RQNKsjXdSRQlMdcppoZYbf6bG5E3y9ZQrQX7Um/BxqDZ3mBW01Fbev/0
         wvUA==
X-Gm-Message-State: AFuF++mB6Onnz6ze6sv6Q8Ny3pGaoeZr2xK6t93ddbXVw4TiKetMbtUO
	005kXeQmm2qLbMpa5nzXySvyGKtwLsELXZVdOqZ/jfavCt+slaOihI1D7IYDPXkr/AHIhkpqdFg
	ju+3Hwiu03ZOOsEY8NX036d5/0h4m9Z4=
X-Gm-Gg: AYBFou20DAWi3prkRn7p/jSOl97JZh6GCd01WHIUycNkCj1SlCmr9cAUotX0veIxQRP
	RzgKLoDftG0KYRi1OGszS34oq71OcX6bFlOLj/ypjS8mLj5VCykDyUo4riGo4zZ4qTxBV+VrTd7
	z185Nqzkn5I0czR7olDkZJZo4OvyVlMBXrHQbxMMHgP6HczUiZVLM+8aSFU1ljUCm8LgzRT7T0r
	jN3GzHaZHe5vAe3t5SyjROESo1G9EQXEGCzolpKiXQftIZN6x/DMyp7XSNvx1X/lcUuga7DUdgt
	6dCuYK/+2C7kUY4ZAvMqjE7WddzvxmOW+f/Pwp8oL5O304sVXhjhRm+FoOcXHqIEi92dLnQpE4Z
	jwVZeR9/WF64BuerltVKXhO5N4aQPYeBn9m4JI3fQIE2qpDqzDq9laWZkOnTPVho7Zhx3R1WN5j
	ZdK7XRR2UJxWjcpaPdnFCBygR6/pcVxxJduf86OLlXo9EWRuxSpocLzjvB60LjtqOAWk1McrZHy
	0Im
X-Received: by 2002:a05:6214:d0b:b0:915:e6ed:db32 with SMTP id
 6a1803df08f44-91997893400mr31896566d6.43.1791369351500; Wed, 07 Oct 2026
 03:35:51 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 05:35:50 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 05:35:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ting-Han Hou <ue081723@gmail.com>
Date: Wed, 7 Oct 2026 05:35:50 -0500
X-Gm-Features: AclHuK-g_4FuWifzvDywDXOuTUrrXesSud9nAs5Oj1-BoM-C7zPxzNC4aLngJos
Message-ID: <CA+NtrhTQXdQRWe+pRJHyKxPPgsF7Ob5R41Xm3dAJ54OfT2_z5A@mail.gmail.com>
Subject: [PATCH] scripts/gdb: Fix stack depot out-of-bounds diagnostic
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, Kuan-Ying Lee <kuan-ying.lee@canonical.com>
Content-Type: text/plain; charset="UTF-8"

From: Ting-Han Hou <ue081723@gmail.com>

The pool_index field was renamed to pool_index_plus_1, but the
out-of-bounds diagnostic in stack_depot_fetch() still accesses the old
field. Looking up a handle whose pool index is outside stack_pools
therefore raises "There is no member named pool_index" instead of
printing the diagnostic and returning an empty result.

Use the already decoded pool_index variable in the diagnostic.

Fixes: 9d938f40b228 ("scripts/gdb: rename pool_index to pool_index_plus_1")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Tested the complete lx-stack_depot_lookup command with GDB 15.1 and
a GCC-built ELF fixture using the handle bitfield layout for 4 KiB
pages. The fixture contains one pool and a valid stack entry.

Handles 2 and 0xffff fail with the missing-member exception before the
fix and print the correct out-of-bounds diagnostic after it. Handle 1
still prints the expected instruction, and handle 0 retains its
existing rejection.

 scripts/gdb/linux/stackdepot.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
--- a/scripts/gdb/linux/stackdepot.py
+++ b/scripts/gdb/linux/stackdepot.py
@@ -39,7 +39,7 @@

     pool_index = parts['pool_index_plus_1'] - 1
     if pool_index >= pools_num:
-        gdb.write("pool index %d out of bounds (%d) for stack id
0x%08x\n" % (parts['pool_index'], pools_num, handle))
+        gdb.write("pool index %d out of bounds (%d) for stack id
0x%08x\n" % (pool_index, pools_num, handle))
         return gdb.Value(0), 0

     stack_pools = gdb.parse_and_eval('stack_pools')
