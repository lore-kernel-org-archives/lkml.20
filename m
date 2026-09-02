Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6237B036
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331533; cv=none; b=roCexQFzlAANL9N8a8AHOVUlWomIGbuiQAsqISe1mTpLoxoXGvuWYFvilRI3XnvsqgGXVbS+WgxTggwcNwrP/Ro3v9b5Tx3OJTSraUsvmtVUBmjGf1XQ05Fu/SJJ+OIS4Rgx6QjqGhfkII6hXDiHOIMn44FPUnqPPHmmlcgv/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331533; c=relaxed/simple;
	bh=qkpzPnGgNjozNVl/OQ4FxMb8JZeE4UQpJXJz079VkrE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=erv6mNfL3cCs3nUo6vsxoIVH4X4AZsS1ff3ot3xGB69xhdUZ6wkdjBs2POzMoXq8HsHXAl14IixD/R7DGmL3GVv5+Jn9MK3KcorEVrFld/85i0N+cMr+uC9t6TVgxE1J3sfhZOGpZO8q11b/xCOsawVIO6gBODz/B/RNLuha58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzdevgID; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzdevgID"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so968953a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331531; x=1788936331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1Ijfwz6wl79jsZ8nek7Aw8mUO11NOUio6A8OmunRuU=;
        b=LzdevgIDv0QVC96lRAogWGBEqylEn/nkYJ71V/fCkv+d6rTcGvcd/UCcaqzYcLq/6o
         vY96JnjaH/tek6cI0AzhJMEIxO7hX5bKPFVxGuPpsGGcusaY6UvggvteZhsYXtQswADf
         +CmlFb9ULGuxJS2jxF8FD8eNF87Y290l5Kiq0OfQu4oTVM9NcDHod/VbYhiX848O56dZ
         n0NmHnWaD69djq5/7evaXOTW55lkP2VH9Yra37Ruc9trfUzKJBgE/d5nGRn4yCh100bg
         tARYUR378AWMYGIZ/DmT75hyk9JMP1XMA8WxD5RJIM6//zYYo97sgtLvCWqo7bnyavWV
         jREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331531; x=1788936331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1Ijfwz6wl79jsZ8nek7Aw8mUO11NOUio6A8OmunRuU=;
        b=VLejTBP/E+g3N91kusNJHvDbddcg32J4J+tnSYYuOEyZPGKOVU+0vZE7lQQy9Ql8Jo
         /r85lnlcsZnN0Ov67jfUnfKFKFLGiEqRs0VXdHiDun1vZC7cJkWrRbkNP8fwJg/f1zC6
         dZOsopnzPHvZ/+eit6phZwCsFauuDhanB83z7cTrJQljDyOgGXojxReXAvrfw6SSsLdI
         iDNhMW7+fdM8cByqo9/DJPtdBxHXzscS4my8zAnJbJtN9dZhE++L6BdmVlTs8FX9n+li
         f+y9A8wH8F1Zy6auxeByDgNWRhc73pupoeYH8VDC3pDybW6536gyPePzxxcMFtXbdx8S
         anAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrUpNgAM+NolFGol5c8Kxm9faHqCqDk9sFnFRSWdnmDJHTb17c+RElbMmaBOgcfBU5+kpQkmyOppTfsPM=@vger.kernel.org
X-Gm-Message-State: AFuF++n/QO4Tn25NYN+PE2inXy2sgNwfFK3SaDUFx/QqPkdwXmA9wvn1
	G4woIYXTiRYRDvQYmsv3yBAV06MHsZkdOmvlZ/bFiwC0/zv98hqKuhtG6trNHw==
X-Gm-Gg: AYBFou06dfwE+sZ3seEAfacznGmbwVyOo+XVZVuoN8scpRrCi1t7+hR92qJRspXvfKt
	CBZABC8M/Z01B6Z71jzpGDFYCne0yn/dMDUxJE9RUXNVjaU8kyq6wpubqae3l48Y5Ln2r92woHT
	e07oF4/xGORay9kuuRNmzrZaoS64lmaFjEwxystvLod6+oMgjbF5gu5PBbO18Cy9cFEAo7a9U6A
	tETPBH8UJL7EiWvTs+OWvOaoIRNsfxezu1MBIBEIW5yYqVTOv9zFq1O+Z3KJ/wbWadKzZmTyval
	IzRoxwZdzEOQ88cNfvfwjSPZmZ6YSWfoYykeopNxMJm9NV5d6CnCum43kVb0igcmqcP1voMtyA6
	zwQNT79DJqesDtABF3PXKMFgl59vFXIiRHVHtkd2wbdwpXYTAV7Jm+nLxFx8Sq1y0Rwof1i2wic
	QaSuTKCIcWeYW94z8JfJEnljVgOPi7cW9ToquUNNW8l52zXPRHf3VoJY0iu+cYi6r54beJiyIZ/
	FUZ0obON7cW2VfD
X-Received: by 2002:a17:90b:4a8e:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-39aedcfc81bmr3925777a91.0.1788331531419;
        Tue, 01 Sep 2026 23:45:31 -0700 (PDT)
Received: from PC-2B0BA31200898.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1b395sm11051480a91.1.2026.09.01.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:45:30 -0700 (PDT)
From: Meijing Zhao <zhaomeijing100@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Meijing Zhao <zhaomeijing@lixiang.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Wandun Chen <chenwandun@lixiang.com>,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] mm: trace: decode architecture-specific VMA flags
Date: Wed,  2 Sep 2026 14:45:07 +0800
Message-Id: <cover.1788330432.git.zhaomeijing@lixiang.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meijing Zhao <zhaomeijing@lixiang.com>

show_vma_flags(), which is used by VMA tracepoints and %pGv, names
generic VM_* bits but does not fully decode architecture-specific flag
positions.  As a result, trace output and VMA dumps can show a generic
"arch_1" name or a raw hexadecimal value instead of the meaning assigned
by the target architecture.

This series adds symbolic names for the arm64 and sparc64 meanings of
VM_ARCH_1, arm64 MTE flags, user shadow stack flags, and protection-key
encoding bits under their corresponding configuration guards.

Changes in v2:
- Rebase onto v7.3-rc1.
- Fix the patch 1 changelog: "bti" and "adi" are descriptive trace
  names, but do not match the two-character smaps mnemonics.
- Cc Lorenzo Stoakes.

Meijing Zhao (3):
  mm: trace: decode arm64 and sparc64 VM_ARCH_1 flags
  mm: trace: decode MTE and shadow stack VMA flags
  mm: trace: name protection key encoding bits

 include/trace/events/mmflags.h | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

-- 
2.25.1
