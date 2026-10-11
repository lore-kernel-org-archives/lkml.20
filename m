Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8612BE644
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685864; cv=none; b=LpWPwViZEVy3vqwRbY+Oh63mCIq+ToCechpRIRf7ktCfZySuq3Sn7KovDUimpOcvhvEgSi/9u52iW8Sfh8Y4iFmU4MD30VzF6isvkgEdMnudQpUeqDT7V9mSzESCbEqTJAvffeF+be2u7Caa4QzM1d9yilZd6Jg+MSiFvxNlx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685864; c=relaxed/simple;
	bh=7blTCdfwCJTYpJugpvZ97QXlgznTZJ9g9z6X3QVY4F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ex/UB8pqv1NiJsuDxst82Q5ymAA29VWRuBR6y0bPJVakztyQFP5+p0u/mrq+mNP6GJDTCEHmrutkm8wDRN2HdHasWEaRq0K4lskJOaX/f+UihdulFXv2hTDLkZ8aRFVhScT7PGRPluA+QLvh1y+4xZ5TLh4LkWSOUYn6WrlGK2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlbKN3WN; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlbKN3WN"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so1553811eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791685862; x=1792290662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcPi2slsjMJXK2YUw5+ACVPygnwSrKqUcySMzzyKDfE=;
        b=DlbKN3WNaWV0h0MWA1flPSkrHhxLCiTVbEZ3JLOBQv0xsLC5odnoBtgAw3DC53dhqZ
         ricbnZ/iytSrV0XaEICgO+7eLS+0sc507a6osC7wUmvcsouIA+NUgJ2xVMhcgmgdfXMy
         dX/8vynq07DdsealKuHSEQHKopirAheqi/++SjRqdm9ATSIMMer5AVZo4nhSwVtNhYzT
         qLjElQhvLd9RFnRuI/Guj/UKZ+nRSbRLQlFksukztrY+ly2IDoL6Nhx5026rVRKm1OX+
         LGS3IhY4qySW+v5g5JJw0s182E5op8mBUQdmFglKbN1XVh1mPsPpRJFwUeW0tiu4GJRY
         Dn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685862; x=1792290662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcPi2slsjMJXK2YUw5+ACVPygnwSrKqUcySMzzyKDfE=;
        b=bJfeltwjcICy4v8F9OxBaUOdyeEpvhAfcXU9+2NUWZfS/+1HiaRL4sSZ7IluLaBOtp
         OmOgtc5d3tcx5EjqRX3zYrNuy2jUl44rCp0LSMXitcEQ+iM1yiIaEDSqO629lsU1+9rp
         PchC4jxNQFjQahRj1Q18NkaZRtd72tzkG5mKkegm7zofOrpWC9oBEf12l5/zwnuRQPAv
         4gqeoQwpelUFhDcXzWjmxXLqoM/9DfDZxiQ21Nzsnfw5rSi9+srOV15s+WCrlREwm3vr
         9HkpsoJhbk8XBRurd7Mx/XZziZ04SrMVOkRqHWalpOvsvT3F1J8ZnW4+Q8MesHsMI+uA
         x95w==
X-Forwarded-Encrypted: i=1; AKwUvByOPdwUl2zxx5/gi9+4qiH2ayGUzZuRYeyP54QFSk8szAj9c1nTCqoK0iP2sQf59S7cE0jx8WaSEt+APg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCFDxscCM3k0XCLU5XiUwL6KuyaNkO01YMEVRwfUEhoddVf2FU
	gegn9OcIPVONN8DGPv3tfZR2aYixzyC8f02Tse2xbOvfGsg3YlWADb6E
X-Gm-Gg: AYBFou0lkjdVWctsSIKswljG4om+PT68PWfQ0aukl5S4scWMZk6dmKF5rwvf6ro7ron
	kFF2/tmDtQD0rcRi1rTXnX7jernLW03slvYzh+KUchVFxXFroc0/UVba7UVCir41nV5MsVLZWw9
	pcgAwdsTUvZ5gkBVq0JsFmdq4lklXSUsaq7v/FOwljBjPyyD9nVkK3ReYJowQB2b+LyGfGSkXFO
	4fhLhHimRtLEiFeeks4ZE5N0OA8Z5IDrJAsJB7pIJ/wICE+3KmBKMkEQNKTPi3fgdNmSJ4LScNT
	ZAvi4Dch/c/++cF/yXqYXLETSOItxZxTcqLCJze1nsC34Wir10UIYwEHEdkFvfn2gIDE5GGYS7m
	IWMPQZZNct93bsMeXFIO9f8cPFF4u+H2xL/KCjbiSpqLdzT4zGKLxj3WiDCR/UzYgGLANCNeR7z
	C/m5XYWL6M4yNS6y8NTo0C2SeVM0h/BNnVWNFksAFC+NTS1DbwtuRbge6vI6VQ4ctgMd1Mz2yDs
	fiy8S6rp/Yog2KyAjxK93uF97NWc7Y3yi2CJ+ELkepud1DprYcKfgbz4B3LP0yRFKT7Yk6fLT2O
	bb4XaKgCgbbR8tfoHk1S6kZNU8g/Wcl1lmnOa/3v+JhcyuNq8ZyPa09HY1wm1s7G3BrSMIMTWz8
	r7L8ggP4DnRJxYPPXKcD3aNG+GROumvSad+T7Dchg3C1C+jVVOmPGzv1ZVRN85lx9BA0IbbLUBV
	S8gEyO30h2BSB2btDgoX5GbtR/GjDspUtbjh6VCw==
X-Received: by 2002:a05:7300:d081:b0:34b:dde6:29c7 with SMTP id 5a478bee46e88-3537dfc7dd0mr8186431eec.19.1791685861815;
        Sat, 10 Oct 2026 19:31:01 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-c00c-b850-3c50-660a-7c51-9da0.dynamic-ip6.hinet.net. [2001:b011:c00c:b850:3c50:660a:7c51:9da0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm20357265eec.25.2026.10.10.19.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:31:01 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Kuan-Ying Lee <kuan-ying.lee@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] scripts/gdb: Fix stack depot out-of-bounds diagnostic
Date: Sun, 11 Oct 2026 10:30:44 +0800
Message-ID: <20261011023044.1722-3-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261011023044.1722-1-ue081723@gmail.com>
References: <20261010141712.2db4491436e30110ccb5a25e@linux-foundation.org>
 <20261011023044.1722-1-ue081723@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Changes in v2:
- No code change. Resent with git send-email as patch 2/2 of the
  series; the v1 posting was word-wrapped by the mail client and did
  not apply.

Tested the lx-stack_depot_lookup command with GDB 17.1 and a GCC-built
ELF fixture using the handle bitfield layout for 4 KiB pages. The
fixture contains one pool and a valid stack record. This is a synthetic
debugger fixture, not a booted kernel or a kernel core dump.

Handles 2 and 0xffff fail with the missing-member exception before the
fix and print the correct out-of-bounds diagnostic after it. Handle 1
still prints the expected instructions, and handle 0 retains its
existing rejection.

 scripts/gdb/linux/stackdepot.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
index 37313a5a51a0..aaa18af25cd1 100644
--- a/scripts/gdb/linux/stackdepot.py
+++ b/scripts/gdb/linux/stackdepot.py
@@ -39,7 +39,7 @@ def stack_depot_fetch(handle):
 
     pool_index = parts['pool_index_plus_1'] - 1
     if pool_index >= pools_num:
-        gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (parts['pool_index'], pools_num, handle))
+        gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (pool_index, pools_num, handle))
         return gdb.Value(0), 0
 
     stack_pools = gdb.parse_and_eval('stack_pools')
-- 
2.53.0

