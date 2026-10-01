Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D07349CC1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790826194; cv=none; b=WwRge/6v3oyED/5UQGt59vtM6PFgvix77wAYCZEaF6w/WX8+AIuuxe07WSuKsrZmzA/Ij0+JpfnEQ4UCKIAlnZbGhsX4G8kr9Q8H19wY98zV/zWq1lOoxOdax5be42kkLdjnFtqHIntroJ5U77M6bvTx0owuqjxHmO70qMeQEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790826194; c=relaxed/simple;
	bh=oUeXwTCQbEyPdKNvTT+R4vw8lmHVoLHGeElv1oBHK1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axWwbrV/KcC/+QsL8/6I3OKeG+vAlp2XtwI92fH0pW9zToYEbKrCetOsoaFUYIyPoll3EJnk4IDW10vCmUKqAHNP+jMrDMbWlDCsFjM/XpbC0ur7rNDxRM3CRK+uoC4LBl1AXvnd3/g7jW+HJDvLvsMAKUKRZmpZT7cs2qbjWjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIut//Xc; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIut//Xc"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7ba99a2e56dso716985137.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790826192; x=1791430992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VF8cyCU4Hq6TsV+yLkED8/99mWKmZ1f8NlgpJ4jYFjM=;
        b=WIut//XcCK5dIuf682xjG7vNPPudZsrp7mNWA5ekxpVdABjnNe0hhuDkqC6Qb8q1qZ
         CQUbJ7wQxNgBmHsanJK210YrW3LhgFq8ZWthIabcj7cja1CbtMxh87QqsFJTJw4c0+oI
         q1eZJfKOw1TzjYVGb8qkQ/dIsqbKcwZ2PdMBtBBpYxhi89x4xhi6tIIQxcQOBP8wAmss
         Jt/48Eop+QO/ZR1rCk88/amKbA2JiKD7ETwBfzKJ7Az2LvWEiL2TvfwL8kVvN3DPOUBK
         WvIGw0FTRjJeuGHFyZes7NDig3d0df46xPwRXObCyltIl/aMNlJqKNvOhT41gKY/kNuL
         JugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790826192; x=1791430992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF8cyCU4Hq6TsV+yLkED8/99mWKmZ1f8NlgpJ4jYFjM=;
        b=gdDqhtbro4ClQR931JcQ70qnHlYuHl+iraYliLnz5WBvBtxO91g26K52opPQQ1MDHa
         l9imxuChaF68QotsNbW6hNMKPnR3jtn7Pmka9vvWDGcGDuFbqZg/9XKR8jWl4p5X4dkC
         En9hxWGYdRRR0l0WFqeFFPjElIA+Cp1hUrLMwtF5U7KHt4ABfufbQTh45NY0Q3ZgnrPM
         YK2NKRPA+h1C5+PzlDWknGXMvuZwMgu2o7pm3alVVEGiusLTK+3AOz+VYex7LPx5uO62
         pCrAQMRHQD0QkJYn4iSeGFrUlWtRiRAaZOoRlFj8QKj/CrgQg8psqp22cGzHTg8hP5o7
         ck8A==
X-Forwarded-Encrypted: i=1; AKwUvByefBCmlV3Tze4vrMBAGGBHpArtIAUHCSTezbwZ5BL9ukU9FG26kE1CEQAMvnI3n1QXjmTwZ2cJp52oA8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg0OSDSME5Xj2UhSUwZElochJIyanZgbWNu1JJEX+3NAN3Fkmf
	O3E5A0NWAK8ifThlM8Uco3l45jr3VBu05h1WQO5aMu9nMCNtCgWX09yA
X-Gm-Gg: AYBFou3cDT+c11PmVzmM7IEs3uH38xBd/tPAL+CpNAJy9FI4NNnvnyfFB7u6pcxBXRa
	6MjLR0GbU099Q39ErinuQhVqaD+Xdbl7bWirxXSx45FtKSO+AOsrN+IerH8xYHYvqfq2Lw2MTY+
	Y4zXhpTpfzrvW+3IcNRbzHQMKDqcT1B9unIYfgsBKfJtmZhYXRMrLnkljbpwUyHlld0w7DvxgGM
	mzc9E8CIsOTdWJ3E0JaiGL+HRgGT4/ZQF2oTpC9/JxE7pgtjyAF7AFa3fYHkVZbuTNphwpCy8OQ
	bSCaYQKKdXHSq61orIF6628DWgbxK+6RbU78ijYKmC0lyXWGa4JV1PwIB5Etoo77Q8NQTwPOhi8
	3aVw51sh1LYSKylmAXeLn4UAeE7PDMOxlOtM/3GS/1oGnRa8ekjtaXzAAGVmkWqApSZ5w8BFkSl
	BXIzdssew3Or2rW6KFzDNC74jw+lOk8ta+U3Ptq4vxqt5vC32vlL94AAkNF08chho42XS2m+XHs
	oFDSlRVKMYBuQ==
X-Received: by 2002:a67:e7c4:0:b0:7b7:3acf:bd3a with SMTP id ada2fe7eead31-7be61e96e8bmr728692137.4.1790826191969;
        Wed, 30 Sep 2026 20:43:11 -0700 (PDT)
Received: from [127.0.1.1] ([201.162.73.164])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d7fa499396sm1789926e0c.3.2026.09.30.20.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:43:11 -0700 (PDT)
From: Luis Vieira <luisflavieira@gmail.com>
Date: Thu, 01 Oct 2026 00:42:58 -0300
Subject: [PATCH bpf-next v2 1/2] libbpf: Fix struct and union zero
 detection in BTF dumper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-libbpf-btf-enodata-fix-v2-1-89f6e8a0240e@gmail.com>
References: <20261001-libbpf-btf-enodata-fix-v2-0-89f6e8a0240e@gmail.com>
In-Reply-To: <20261001-libbpf-btf-enodata-fix-v2-0-89f6e8a0240e@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Luis Vieira <luisflavieira@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790826180; l=1187;
 i=luisflavieira@gmail.com; s=20260913; h=from:subject:message-id;
 bh=oUeXwTCQbEyPdKNvTT+R4vw8lmHVoLHGeElv1oBHK1E=;
 b=EDnrT6kKkUuj7s1mRM9dxT3GkXe/76ILO4Zdju1bN1vq6r5P5Wc85VUWqdrME4mVNlgX8AKMN
 wCnS8zZzFJWBIMLZyZLaZIEwCpummvyQ9uO1Eit78HMurUNwbb3V+B/
X-Developer-Key: i=luisflavieira@gmail.com; a=ed25519;
 pk=98MeC/NdrC6ah7zYpPnkWiQIoyj62iUP/rNuV3esCW4=

btf_dump_type_data_check_zero() uses -ENODATA to indicate that a value
is zero. The array path handles this sentinel correctly, but the struct
and union path compares the return value against positive ENODATA.

As a result, the member loop returns after examining its first member.
A nested struct or union whose first member is zero can therefore be
treated as entirely zero even when a later member is non-zero.

Compare against -ENODATA so zero members are skipped while looking for
a non-zero member.

Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
---
 tools/lib/bpf/btf_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index 996e61b5f11f..ad43bbd3b442 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2564,7 +2564,7 @@ static int btf_dump_type_data_check_zero(struct btf_dump *d,
 			bit_sz = btf_member_bitfield_size(t, i);
 			err = btf_dump_type_data_check_zero(d, mtype, m->type, data + moffset / 8,
 							    moffset % 8, bit_sz);
-			if (err != ENODATA)
+			if (err != -ENODATA)
 				return err;
 		}
 		return -ENODATA;

-- 
2.43.0

