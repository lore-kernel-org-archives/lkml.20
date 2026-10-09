Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38543368B6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510598; cv=none; b=gmCw3jP4cmrKQG1QeVNYOM6N7xvW5j0fupGzjjjuG7LVAVjQgE46MySOjqMRp6Zxuzf/2xL1GR+m12sfKn8ZDaCFhx9bT3UfrdF56yAWjZb+4hh/IBxlaBzec+ROEkJ4kjGpcew/GQGHxueFIbZphrL8Y/kw1sWrTYixth2BAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510598; c=relaxed/simple;
	bh=HtIl/nwx6bOv1iqWUYSobRqCIqsM0aPvGMZVuqqehNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cWieqg84PdVsX/MnxCj1ctQhG3IXWRcusjipRDR1eS45Rpjm6cB5A1529lIVjhBn4KMWGjOEruCTOQBlV2uDdVFw4dAhQHRLiOzieMqUIbO7S7+m4aI0E4XE9On6z/sNIK8LDfeb2Y6GrSAr9FKGJtJB/bLSmnBJ4RVVfKkdDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXsv4S4N; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXsv4S4N"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3518cbe59b0so870822eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510596; x=1792115396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GMDytykDqwmOSKHEI4lP8Wfae7lF8nVLH1/sChzwqGw=;
        b=aXsv4S4Ni1U6ydBnnaNzMaBhZE0cHz7aRSYhF099qUT6Gazmo1A87ASfwOuSWQP6oY
         ArBwTkku09IlyzEInP5RwHLg5i9OvdQKsRAypjCKjzywMVFEPN00fkP0gKj2g6v0d0j/
         bi3LzX0eXPDYM1Mnr7HrsUyz+ydTmix/V7+CG1ueE8U9LvYDVJnyofmaY1HgEzjPBgxD
         Xj3R1fd7nB4bsoqlXp1g2/46unZrxr9lKODi8cghrjooT0j8lt3PZpK01SjJn+EpGz8e
         Ql/gE0QVZz64lvwsrl2HJGxS3dFalbNMfF81YJ+lIV4U+slymtuHr2vA8E8o9j3KkArX
         /RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510596; x=1792115396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GMDytykDqwmOSKHEI4lP8Wfae7lF8nVLH1/sChzwqGw=;
        b=A3yMhvNSVKq2PnIA9+4PRFPvhTw0Gt9rm5J9wF+Wja+2WOsvzwUjZkroE2CouSzxXa
         UHSNxyNj0psEKaqAZFmR+hCH7U4fjLaDth4VC7Cezu9fP1pxKhKLXEJhspEhKQs0KbSF
         Tf1ofl9PRaU31GYn6ypnKdUj7HEJCUPujeiOgY8JXpa06i8yDtx1HCV9mxJF9zg+awsF
         gqWoFhviJwYCqFeuKUDWFrARLmjTtmVuMLa7hjTD4oma1CQk8imOFXhW2et17IkdsynC
         HXCCYO9t/ZFjBXp92T2LLF1FscoLeWjLA60J+7jQ86b7ps6TuXvK0R4hgZN5kkScBvMa
         VRrQ==
X-Forwarded-Encrypted: i=1; AKwUvBywEdFG1E1WYkuIf35BOIRzJnFPapji6y/FykW9DPBAoht3PWPTWW6AdPxNA6sa4nZiI8FehdAqd04wHu0=@vger.kernel.org
X-Gm-Message-State: AFuF++mhE6A1YUneYvJ+vXb3z6NUiaZjw6/L0KPG564Mq2PgLKKYIb12
	cCxXCbyVzeecevbIP+E+AnWT2XEMsg9Q3LD+vAlmF7R1XCbo9PGWq4iT
X-Gm-Gg: AYBFou16M0qn/tXZbYbS9rfsIReR2UGUE10UpkCIMGK+DDOeGYItmjVCy342sI+mcMq
	WF7WMb5gwZKu1NWtvfzE/QI9NxDC1NJwiE8ea7j/l2+r3GCY26XX3B2QbUDQwbJNEiDpnzbE405
	jrBi6ftBj15JJokQSlHhPvS+7/4ddgNU2Sbj9pWaCiDlrT4Ws1d5tcLvN5ERWzjWNYK8CIm35vW
	/wSjI7QB63BDKBD3ZdD8Yn41Ebi0jA20DDmoHfTAsKGNk/uwAOcOafz3afOF5AhoFlIxzOT9SrD
	T5Qs6RgdqXZ2nxL8vnp9eHz1vLg0spHGy+0Cny8TkvbZswDNrDCVkk5EsZUnAthzM6l4FPRmTSU
	nV+K1RKyMSZVxgr+fvkJGJmzHqMOqQ4QTZOqF2RKB8cqy2y0h7WWtzdWdKX0cuNUu/auC1Vlu1/
	iNrRsAj9gK5VAPezLbVuhSWbLCZK2+w9rvjSvJWzmdI+sxYf3LiHlN7ebyip73yVvb0A==
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr1987985eec.23.1791510595779;
        Thu, 08 Oct 2026 18:49:55 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm1984845eec.24.2026.10.08.18.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:49:55 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next 0/2] selftests/bpf: Skip libarena when arena spin
 locks are unsupported
Date: Fri, 09 Oct 2026 09:49:50 +0800
Message-Id: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5IyGoC/x2N0QrCMAwAf2Xk2UBWmKC/Ij50bbIFRi1JlcHYv
 1t9vIe7O8DZlB3uwwHGH3V9lQ7jZYC0xrIwau4MgcJ1JLqh8yaNvTnOVXDTORqXiMUw1bfjRJK
 mnImEA/RINRbd/4MH/IzCe4PneX4Bx3hJinoAAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

serial_test_libarena runs the test programs of libarena, whose buddy
allocator serializes its operations with an arena spin lock.

arena_spin_lock() fails with -EOPNOTSUPP on kernels built with more
than 1024 possible CPUs, as distributions commonly configure them.
buddy_init() reports that as -EINVAL, and every test then fails at
arena_buddy_reset.

Patch 1 makes buddy_init() return the error of the lock, patch 2 skips
the tests when resetting the allocator fails with -EOPNOTSUPP.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      selftests/bpf: Return the lock error from buddy_init() of libarena
      selftests/bpf: Skip libarena on kernels with too many possible CPUs

 tools/testing/selftests/bpf/libarena/src/buddy.bpf.c | 5 +++--
 tools/testing/selftests/bpf/prog_tests/libarena.c    | 9 +++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-libarena-nr-cpus-50fc5dd00fe2

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

