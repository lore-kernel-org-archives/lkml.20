Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E733477285
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196863; cv=none; b=KMcFvlubCwnOV0nX6o4jD6u5qkkyVQcWpz0Hg4p/rVYzGyJ19xs6mSDfIR1X5oltSb1XHe8aI1HH4+t1QBC+7i61Yp00pmFiTekAPQfHGCsxvOBiDnHipFfXlrBqLoP4Yt4CzcpCoQIIvYPNfpzih2Ht71r+CGB4h4VR/hHhhog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196863; c=relaxed/simple;
	bh=/HFfd7hELjQy/Kgc8ukSdhXTlt/OCGs8ssekfu02a0o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L93X/Tag0mbhWlRVykHjKauhFJCYurrNVaRWLcNArKvyj8xq+fKvUMNqVM5xT08Y/fbkfyieVT9yVWNgW/icy6OXfm0Nw9932RksW+xhDJCKwrDxdn3aQnKBynfX7nnfDlXxPx2ggWtjG9cey7mnUiPHIicfISUc/UOJLZDaAow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmYjBNq8; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmYjBNq8"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so1009002fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196860; x=1791801660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3U5YwHD1Z0Qjfcq1Gvi79ob/V78ZCaci+Pc6FSIkfe8=;
        b=DmYjBNq8V/5Kex7fk73P8FH4CGzy76UXwuoDcgnf38FKXTvKwuNwAgozpdxbnRf98P
         3EYXNeIKC0Pkg4BMPTCq93hdJYsTn2K/E9HFASXSJApJM9UEfaUukETzYINkkLa6i7r+
         MAOiwJs7q0Bt+NCecJh31werIEciFapNR1ITGwVZIE6XMgdEOeWzahiOwTmrtO8joqhx
         MxfKmpyFvUEpW2FJ6wcWuwpKEdezcW4r+F9lk64xq92jzhH05ps6Lj+29BvpWUhendv2
         rZLl9XwtsVWhc8IM9Ik/JD3DuevkOdDSzob+gcf0dIytE4p5J7uTGoLQ/eCwKAOfEAZ+
         cmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196860; x=1791801660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3U5YwHD1Z0Qjfcq1Gvi79ob/V78ZCaci+Pc6FSIkfe8=;
        b=wR+/eZ8i1dcDB3ekQWEl/klt7GeS1fsmGMjwY7EUt6WtlkqFbqZUVijcus+7ybutpk
         KhDeVbJukBKep2bY1VG82xft1dhjpAfAr/7hMvKx0kWLK4i4u6Lvr1Wf43AklTaTKQiw
         QYnzAsIWGaHiiI/CjDQa+W9zFH0WysV8IdUCuN14cNWLkE9515NCBaRTG9bFE7ne9kxg
         darQoBdl+qb061k0az8q9fFzmrQH90Z4oMNdtWcjtJhmMUTJO0AtV1C7TUjxQWB7zxsy
         8KYpV1zFID2/1FKTsD6/0P6BgP9lD31EGrcgoojPNMaqDg26r1f4Ozqe02lSrU/7gOFR
         TjTw==
X-Forwarded-Encrypted: i=1; AKwUvBxY+ha7vgbIwy8cr7cahQ/fmv1Y+Fbbv7jDhsyPbnSJfSV6hk2DS/2+GMv7ITDucCssHF6VBgI85Up8tM0=@vger.kernel.org
X-Gm-Message-State: AFuF++n9f+tpXx5dMayI7qooluT6QYcqvBXQBRb/xC2VRaELYgKWIfuj
	AqsqM0oNjwLhS37dWr+sxclY3CcRmsH5wJFPB/0knfS7TqMtVgEN11yR
X-Gm-Gg: AYBFou1idaFcSsL0BGdswD5VqGAlcvgyk5+iLTNvifahmW68VLzsxXWzeSV8mcKpniO
	+3wCKyMd1YoZQqND2YkrtjZRlkybMAwyl5QGXViH9QKCfMtK3pR29KSpiPoANbdxXEe/dMH6x6G
	cHPhDeruiRNk63KyfjaSHi+NRH7/b9wm7ymyMuaifAeqpOb9K6l9CgA9NYazEMS/pIMkPn9Jh/q
	1dQtUFnpEQVe7RBL0P0t8rhg7IR0+Sp8nZ+go1sbjTptmnFxpmY/R21BvDVZ5Ex6uPMAifypAGZ
	R1VsthY7ApYP80zFUJm/3FBH18s7QH72x+CcxAwLYB4v0qxTdZZpWZgujUaVtknYIzxMhJyNqdi
	8lcbovGBX+TtvsqHIcDkzYXWZ1jCijGElT6iuRDrFEN9hWZGnfEOzY7ifsGoos6D+TA827NUhfI
	RIcheSTiogXE1/vJbqNYcWAi5PdJfjD7S9dp9EdJfhi8bpJ+elDIR8dgOAS0vPLCWol16M1gNj0
	AmLVO99bmTw7NckcovuItE=
X-Received: by 2002:a05:6870:2104:b0:475:e0a7:9f33 with SMTP id 586e51a60fabf-49e15d66acemr9376982fac.33.1791196860092;
        Mon, 05 Oct 2026 03:41:00 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:40:58 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] kbuild: fix memory safety and UB bugs in host tools found by fuzzing
Date: Mon,  5 Oct 2026 05:40:41 -0500
Message-Id: <20261005104050.1786222-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

This series fixes bugs in kbuild host programs found by building them
with AddressSanitizer and UndefinedBehaviorSanitizer and fuzzing their
inputs. Most patches include a reproducer.

Patches 1 and 2 fix bugs that also trigger without sanitizers:

 - kconfig: a string/int/hex symbol whose default is a choice member
   gets a NULL value and crashes conf (since v6.11).
 - genksyms: a declaration such as "int a, f(int);" makes genksyms loop
   forever while allocating memory (since v6.14; earlier versions
   silently recorded wrong types for such declarations).

Patches 3-9 fix out-of-bounds reads (fixdep, modpost) and undefined
behaviour reported by UBSan (kallsyms, modpost, sorttable,
tools/include byteshift helpers), several of which trigger on every
normal x86_64 build when the host tools are built with UBSan.

The series is based on next-20261002. With it applied, a defconfig +
MODULES + MODVERSIONS x86_64 build succeeds; for kconfig, the generated
.config files for the def/allyes/allno/allmod/rand configs on seven
architectures are unchanged, and for genksyms, the symtypes/CRCs of 149
preprocessed kernel sources are unchanged.

lzhan011 (9):
  kconfig: fix NULL pointer dereference for defaults taken from choice
    members
  genksyms: fix infinite loop on declarations with parameter lists
  fixdep: fix out-of-bounds read on a comment ending with a backslash
  kallsyms: do not call qsort() with a NULL table
  modpost: fix stack out-of-bounds read for unterminated PNP ids
  modpost: fix handling of short reads in read_text_file()
  modpost: fix pointer arithmetic on NULL in parse_source_files()
  sorttable: avoid pointer arithmetic overflow when locating sort_needed
  tools/include: fix signed shift overflow in 32-bit unaligned accessors

 scripts/basic/fixdep.c             |  2 +-
 scripts/genksyms/parse.y           | 23 +++++++++++++++++++----
 scripts/kallsyms.c                 |  6 ++++--
 scripts/kconfig/symbol.c           |  4 ++--
 scripts/mod/file2alias.c           | 10 ++++++----
 scripts/mod/modpost.c              |  6 +++++-
 scripts/mod/sumversion.c           |  3 ++-
 scripts/sorttable.c                |  2 +-
 tools/include/tools/be_byteshift.h |  2 +-
 tools/include/tools/le_byteshift.h |  2 +-
 10 files changed, 42 insertions(+), 18 deletions(-)

-- 
2.34.1

