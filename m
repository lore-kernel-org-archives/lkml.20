Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38D247F2C3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270377; cv=none; b=cVVMDr7qVffm5Ew3Kbmv3NZvUb9Mu59Y3Sw5I4eZdm5FjpN5kiWnwvp87OXor2QfuTNtn0fua//nbfBrmy4DAuK2bO3+iU/az/NLTwKpP30zBJ9qpUTPcgiKVkO8/f+ZVRGvescXnXpdIVWJbG7Prg5lY68hMhcDFwmsziXzYfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270377; c=relaxed/simple;
	bh=bm8bp3OKvTpbmVk86pCxKeMFsEBnuwMNAx9kusqWPLg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BAmvnaSZBHDwHvk59r8FF+ta9Tl7OY56qhc2LaFPt6iqo11Wa2fw+wp+JnL0Sq3ydxYLrfCxLru+v7PgFAC19gZHhFA8mRGIslzr3SJ/rGs1SaVXRzDFq3o3pCsze1jMr8ik2uAffuIXgO4sud2EJh4yT69cskfII0RqmupXVrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfyGHiWr; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfyGHiWr"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so4162787a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270375; x=1788875175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwOVRZXUuFeiUE0jd/1FDXen2th6EKXLFmcEZJapFes=;
        b=CfyGHiWryRfLOCo/uaY5apvPkjWgGPUOQCNFmh0c5GiZ3vSBk/fmao8zyt74nWN7zq
         PaDwJYHGEhilO8PDjZyARTgHVc7AI+1xGa15uT0GZ948pI4GgTDTIWeLE4iO1oxCCw8v
         hHsuhaEUPPem7qkA88NSkzvtTWZHGWU3C8NTLgm149LNOVP/hwQikSH/hxk5W9v1aEVq
         31z+WsfdOdL7PgCY27LGSN+2yKwdUOZvzgIWa3Ol3r2xZajOshFiCECMAiUBwidDFngS
         uC7Qd6dsxAvVoQuI+JR3JnSXr1lDJxXgi/6olOU5tyIFthSx+0w+nG6kCX1vWGVrEQ8D
         hWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270375; x=1788875175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwOVRZXUuFeiUE0jd/1FDXen2th6EKXLFmcEZJapFes=;
        b=KNM7i7tz4PD9Na3DzPCpNZJQZeY00tW2a1S80PdMTiBr6z9axUaoiT3P7pizfvd6hC
         O56FENLvbznd4iRhABFDAt495TtzWMelkIaKhnZmYBOdPLWcCUqlGLRK5rLoHNRMEPCw
         qVXs3UcXFy0LgUszON5W68uHJrrNCE/T7s6LDTfcI47K0GaPOafVW7QLePcOJgVgpzHy
         H+Syv44e9ilY1aBMMVyev6c12nP0+e/u7+WYw+hUmdoZVZr42CLisZR35yc4jWMjX9+8
         HTCV3M32JYF8sxy77X8ECQXn/KVjbP9rLPruhAzUpyYCrc9Z931mMtXYJNp0uCJHz2Gg
         G8dQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1iWkQq4jj9vBHTA6XufIX2aZMAz5hu328grEcEDMq5w8ZKpsRf9Oe+C11YZqw3FO6LaBj65Jir9Y8jGo=@vger.kernel.org
X-Gm-Message-State: AFuF++lUhc+sHBmU2CUwekeYPeRJjp2x4PodZDpHG5QKXSKOZCpvThEU
	0HpyyyQdJPszY5hORchFWBkI6JoNJ8enOT4VIIR1JyKkkMlnAZUpTspY
X-Gm-Gg: AR+sD11p+2ougsEyol95NtseTVn2cZ/n5wQZ9gO8J64hnpUefL08UGe+ZOJrkyPmMIa
	tNMX2GH//QaAoj4jcoIWK3ObGPt1zqmvwrTdMeRuydpZmkpZTq+5nRRr6QGb4LmcBfjymeAccF+
	egeGsQLHZA6JB57FNsFXUdy/j+WgQHgpmR4N/+0KK7v7aKaKW7cM/FOF24B3is5Pk+XSsCAau+p
	LsCn9sT6l/fynGhhZ+qY5e1amCd8Oohjsf0jjlQa0Y/GFfu9yNodUFT6FCuBBVLBreulANObgbk
	UwWaTgzHOeQAzKOiC8kJHl07sP4MVL++LfAU6PXqub+dgPiG+ThaBh4NWcYN7GdP5cr6CPkuiOH
	szwyvIzZYZ0dAJuvLlGy2gidPjKtwqZA1elGnDmpXFXW1v+UqRAVRW+Vay7WTFx/r9xxWbuyBim
	tDijrk/e7x5iw00pOLRZWFg2vEW1gu2VnMaZDmy0Ukby46KTcVHYQnYyVB8ENWCik/ihge1TUKg
	LtH
X-Received: by 2002:a05:6a00:1f11:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-85773e29383mr38768468b3a.21.1788270374889;
        Tue, 01 Sep 2026 06:46:14 -0700 (PDT)
Received: from pengdl-pc.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be8f52cb4sm1132502b3a.39.2026.09.01.06.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:46:14 -0700 (PDT)
From: Donglin Peng <dolinux.peng@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	dolinux.peng@gmai.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengdonglin <pengdonglin@xiaomi.com>
Subject: [PATCH v5 0/3] Use BTF to trim return values
Date: Tue,  1 Sep 2026 21:46:01 +0800
Message-Id: <20260901134604.4052265-1-dolinux.peng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: pengdonglin <pengdonglin@xiaomi.com>

The funcgraph-retval option currently records one machine-word return
value without considering the function's declared return type. As a
result, void-returning functions can produce meaningless output, and
return values narrower than a general-purpose register can include
undefined high bits.

This series uses kernel BTF to identify the return type of traced
functions and to improve funcgraph-retval output:

  - Do not print a return value for functions with a void return type.
  - Trim integer, enum, struct, and union values to the available return
    value width when the BTF type provides suitable size information.
  - Format integer, enum, and boolean values according to their BTF
    encoding.
  - Mark values as "(trunc)" when the return type is wider than the
    value captured by the function graph tracer.

Here is an output comparison:

Before:
 # perf ftrace -G vfs_read --graph-opts retval
 ...
 1)               |   touch_atime() {
 1)               |     atime_needs_update() {
 1)   0.069 us    |       make_vfsuid(); /* ret=0x0 */
 1)   0.067 us    |       make_vfsgid(); /* ret=0x0 */
 1)               |       current_time() {
 1)   0.197 us    |         ktime_get_coarse_real_ts64_mg(); /* ret=0x187f886aec3ed6f5 */
 1)   0.352 us    |       } /* current_time ret=0x69380753 */
 1)   0.792 us    |     } /* atime_needs_update ret=0x0 */
 1)   0.937 us    |   } /* touch_atime ret=0x0 */

After:
 # perf ftrace -G vfs_read --graph-opts retval
 ...
 2)               |   touch_atime() {
 2)               |     atime_needs_update() {
 2)   0.070 us    |       make_vfsuid(); /* ret=0x0 */
 2)   0.070 us    |       make_vfsgid(); /* ret=0x0 */
 2)               |       current_time() {
 2)   0.162 us    |         ktime_get_coarse_real_ts64_mg();
 2)   0.312 us    |       } /* current_time ret=0x69380649(trunc) */
 2)   0.753 us    |     } /* atime_needs_update ret=false */
 2)   0.899 us    |   } /* touch_atime */

Changelog:

v5:
  - Add an inline fallback for btf_trim_retval() when
    CONFIG_DEBUG_INFO_BTF is disabled.
  - Release the BTF reference after return type lookup.

v4:
  - Link: https://lore.kernel.org/all/20251215034153.2367756-1-dolinux.peng@gmail.com/
  - Build trace_btf.c when CONFIG_DEBUG_INFO_BTF is enabled.
  - Remove the redundant BPF_SYSCALL dependency from
    CONFIG_PROBE_EVENTS_BTF_ARGS.
  - Update the funcgraph-retval documentation and cover letter.

v3:
  - Link: https://lore.kernel.org/all/20251209121349.525641-1-dolinux.peng@gmail.com/
  - Print the return value based on its type for human readability,
    thanks Masami.
  - Update the documentation and cover letter.

v2:
  - Link: https://lore.kernel.org/all/20251208131917.2444620-1-dolinux.peng@gmail.com/
  - Update the funcgraph-retval documentation.
  - Revise the cover letter.

v1:
  - Link: https://lore.kernel.org/all/20251207142742.229924-1-dolinux.peng@gmail.com/

pengdonglin (3):
  ftrace: Build trace_btf.c when CONFIG_DEBUG_INFO_BTF is enabled
  fgraph: Enhance funcgraph-retval with BTF-based type-aware output
  tracing: Update funcgraph-retval documentation

 Documentation/trace/ftrace.rst       | 88 ++++++++++++++++------------
 kernel/trace/Kconfig                 |  2 +-
 kernel/trace/Makefile                |  2 +-
 kernel/trace/trace_btf.c             | 68 +++++++++++++++++++++
 kernel/trace/trace_btf.h             | 16 +++++
 kernel/trace/trace_functions_graph.c | 50 ++++++++++++----
 6 files changed, 173 insertions(+), 53 deletions(-)

-- 
2.34.1

