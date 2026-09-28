Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E094319CCF5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570435; cv=none; b=Y9xoP5qcSNHum/AMu9P8bBd+QzczrJJwfmZvHsezZAA/CSBuCJlIZT/UgzcU0WoKZM2Qo4mr8ORX1b+EW5M8trRcL6Z2+B/j+tbqwS2XZd7iHWdHJ/akbDrR4L56Ol6Xq9Ct/30LFS4KASGKD2WTMMlBBbbxC3uvaVeMYB39VtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570435; c=relaxed/simple;
	bh=zbsvhiknsGv/yVI5HlChpDJSSfdHgfhWUJugR17lOMg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BfG5qC4WmV21S2eDEZ5+o8v+i3kwajNcY5GQ30aXQlA7JmcRDFChz0PKaNqGhccw6TFcKmzOizcW2wmgu0oaztAIKUiVifarcvZolKNFQ0lV5z3sADamr9GDN7TTXrx3fqw1IK3z4U6Os7O0A2pi6zqw7EyUVKw+12EMk4LRhcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m31mdnBk; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m31mdnBk"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso604577eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570433; x=1791175233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cHs28b6kJcOzKhHAfsJJINiI7XAAGD9v2DTI8Qtx2F8=;
        b=m31mdnBkwLFtxLk8wz3X0ynZt+kdoLNAwkv/oL00WY21tb9ZK7fa6EWaBFgyJsoGgY
         r4NIP671CJryo0K1vTOhQt7/Anaxh1UeCPoynxoFHTFEHdsK2RoHki+4RWZ8qvEcmh9L
         x22nkIXU84fVgMKUubZADuAJbzlGrhJV1WXTlAMJ47VTN0s73RjII8UlF0mDWSRpkhQ8
         cP+uoHYpSMl2u5eweZQSQgjeXatNT6YwDO3sYOu4250XjMGYsg6Y/Mn2/jWtit0aBojM
         43A1dbkqR+YNYxVE366BVG8aJ2qTi0dh681ues2Cwe9JN6vAf11rdVp5g+tzyJhejZLj
         nzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570433; x=1791175233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHs28b6kJcOzKhHAfsJJINiI7XAAGD9v2DTI8Qtx2F8=;
        b=M/kg1FYjIQvBjw19m9nuiISWosYJvMfhACp9KMssz+GKOXOKZEM0SLr+81CRx4uEha
         BBB+Cm7vDDclFGiMZRTCUbyN4rsmjlrCX0VxIYu3mrjGM0PyKgHWe9nSZLLYnCARm655
         IOxSY0JQZZT5iOuVLp2tCNupLrbOmmSGbmvfewvXlhPFk/Zfd+IRjl448w7LZjek2CNd
         3GD7wHbhD5P4GsSVz6uHC8js1dy4Fjoc2iPMIYWg9pkx4nNT3uf+tWNgGt6sR/pzWjXk
         QZMynLsGLN2pX99VwHlh8L9mKWnSZion6OQDh9FTMj5owmykc3/vODOqwb878MMaHEz5
         YlBw==
X-Forwarded-Encrypted: i=1; AKwUvByZYVDYkyy3yWS2IYE7XdE018opFXSGnXZFdDjYcOm2YYa3dh+jRhJuj6DCr3gD40vi3SNlY06zHzN9X0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k+6pAbv90GXqtRD+VP4u2W8yvhINKrXkrUbeGX6R7dofzkX45e
	Xquc7gOG/g9jUEcDUV0ykJhHE58PEY9lKcQ6Y45inoG8FJD/QXWa31TB
X-Gm-Gg: AYBFou14eh+xvf/xO/dd6055kZqtp4v38lhXE0rHYITUx54jYUh2hI4+l3LGmuR505b
	mmRew80M8xMXlBF0jQjL9Od6h4RO4q7+zT1B6mKyG6ZQwMSUBVDoEwjfWLwjz5MUu7rUSB/36ti
	82RbrJGJgCUTuyrklYQ+VxEz0lsUNzdH+v7OdDxc7xGRdaN4yP1+dSI+DWH1R53ks/+MU7BtyZO
	qz455Q+PRbmuxgRN4cmNyulT0qbbEHFIjc4YvM+5p+Vti1D1YAeHRiFxvlDc7zSjjvx+AGnIMkH
	TRwKEOi0vlmNTq9zoxkbBsN4fMa4Y2xD9SIqa0e68hBQ3fjzPfah2T1iatWghbrZa4gn8+3LaCw
	oUKkYN+pljjpBVIWD1xadEmV1qX7dFG8S/Rezu9bdPV40H1TYJg9qX7SqjTaLJvBohu61UalKNu
	lvObBPFwxHS3yaccpuqt/CmQS0dLJYNLMWvRWAz537hfTpJZKB/FLLnNn9uRiDVxMt1/lxdFWSJ
	9WWpJ69vZH7Lyx5EwrQKlVmFXPugrIKC6ECUGmClRV+47Bfzvt8ql4NeIG9PJKTgHp4WvoY
X-Received: by 2002:a05:7301:4d0b:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-342707b3fb2mr7984301eec.13.1790570431947;
        Sun, 27 Sep 2026 21:40:31 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm24529067eec.19.2026.09.27.21.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:40:31 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v8 0/2] tc: fq_pie: add per-flow class statistics support
Date: Mon, 28 Sep 2026 10:10:18 +0530
Message-Id: <20260928044020.8304-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE exposes no per-flow AQM state in userspace today. This series
adds tc support for printing per-flow statistics via
'tc -s class show', matching the kernel fq_pie class ops series.

The corresponding kernel series can be viewed here:
https://lore.kernel.org/netdev/20260928043358.6866-1-hemendranaik@gmail.com/

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/
---
Changelog:

v8:
- No code changes since v7.
- Rebased and reposted patch since corresponding kernel series was reposted.

v7: https://lore.kernel.org/all/20260922211139.38570-1-hemendranaik@gmail.com/
- Removed UAPI header changes. The series now contains 2 commits.

v6: https://lore.kernel.org/netdev/20260919061254.39678-1-hemendranaik@gmail.com/
- No code changes since v5.
- Rebased over the latest iproute2-next tree and re-submitted patch.

v5: https://lore.kernel.org/netdev/20260902040221.83734-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments (folded into patch 1/3):
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is now a direct
   struct member in the UAPI header.

v4: https://lore.kernel.org/netdev/20260727165028.106817-1-hemendranaik@gmail.com/
- Split into 3 patches: fq_pie class stats, pie avg_dq_rate
  formatting, and tc_pie_xstats comment fixes.

v3: https://lore.kernel.org/netdev/20260630184453.171410-1-hemendranaik@gmail.com/
- Moved print_nl() into each xstats type block to preserve output
  formatting.

v2: https://lore.kernel.org/netdev/20260614130729.10076-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue.

v1: https://lore.kernel.org/netdev/20260531131411.28213-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (2):
  tc: fq_pie: add support for printing per-flow PIE statistics
  tc: pie: print avg_dq_rate in human-readable format

 man/man8/tc-fq_pie.8 | 18 ++++++++++++++
 man/man8/tc-pie.8    |  2 +-
 tc/q_fq_pie.c        | 59 ++++++++++++++++++++++++++++++--------------
 tc/q_pie.c           |  4 +--
 4 files changed, 61 insertions(+), 22 deletions(-)

-- 
2.34.1

