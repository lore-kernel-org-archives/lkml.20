Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51773D5222
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612806; cv=none; b=pplYkR+LHKjheaxMlnKm8EFLc2wqAlCpgW2zOEaDKU6ViAG2VgWsxYiE5ZTGfPLAr6/53nexrGIuKrq23NUUnEB2tX6BgeAf26fcgSmhPqHnqQXtAplGsCwn8alws7RxKG0wXM5prG2Rj8VbULdEnp9Jf1x4bdOyzmnggUr0o58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612806; c=relaxed/simple;
	bh=tMJkYvulMtZoHXCIMDBtyux3VJSGnuKAgnQddvB449o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RhLSLPZtS5ZJg66J8vO+4cnycBcqtiSzDcC2tMKneWzDxTeVA0MqUgC4mrdLLlnMtY4JUY9ECZraV1EL3Pjur5F4IO3eg2TGVslBfugyPKNHxQlAS+/JXSYkMAEnYs/x2fVyEUna0aNjyQiijTO8ZrLmuL6SZlFhUtHFiCDSKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXUph91v; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXUph91v"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so815189eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791612804; x=1792217604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RIrcEstVTogFp9RImwQFeI9nI9jL2oL8CAZZwCd1xaU=;
        b=HXUph91vJyZA8qAfpuaeEb+oK5VIlhmR8r3dsjwg1CuY/4N1RKkceEAJGDCHsdL3A6
         Q+xo0UvD9V1GlAuS+Pr4frMUu2I5tqMh61gtBEaJbWyI6qL644E7ALhGSg0GKBXA6+PQ
         +pSEOcRlQpvKgS0uWuMuVaKLRlIt24HxLTDPfshB5vuIRYXamAuKUmUdjui5oBMit+v8
         xxSoRxzZLS2eHCc4J8kEQIP7d9yQo1+/HaC8E36o7It5OE5QXvbVSqnbXFdNs9VAjH2E
         oXnjXrdX236qIQ5Yg3y4+D2UL2WYURaGP+9y43U830EhMcSX/mhc7IEyoPyqT5q/R1O5
         VuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612804; x=1792217604;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RIrcEstVTogFp9RImwQFeI9nI9jL2oL8CAZZwCd1xaU=;
        b=wHfVOU49GEvJsP00N83vTE9NK9tZGONjnfyYiybvkg0Nz7q0wfzPHKdNahrs4I2la1
         6ZIY+FJpa5Y0EsB/jurW/SFdA4qx+iPS/4Pz98yoKKccCTWRd3Q9qxH0yVOKW5Tiirma
         n52gIYhJOKEXDUfCLEsKDvuTNokr22PcBVM20sx4HLPGP8M1RngoYupf0dkNxUuBxk/0
         hvRCvTKAR2/8YaiUMzXnnCV6D4qFZkKBekwzIo8yXQ0SagIMJeg1gb2akmOF6uAuiVF0
         jLHqVg7W0lmwZ9g2gIJndNhF8O7OWWXsNgs3J9Ks8qDDtjdwMpmM80Gk2h84DigktEVK
         ck/g==
X-Forwarded-Encrypted: i=1; AKwUvBxbRWVraeCW1rX44sgW2AFrpdW+PhGT5K72H7GkIGRXSMiZ1nedXsGNJleR1gN0fWy5zZrFqXJMOLx4DX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZBOsr/Bi0krfnwc9kKkWZNqDWeAnxVvs0srv6a+gbKC00skHG
	W7PpybYO4Y4Kr1lY37XCHvkUh5HTg0E/NWPTvqIy3p29q4/ENRHq7bxz
X-Gm-Gg: AYBFou232+zdrwzUQ+kxftXnWjNDCE3P5eXwRHF5bUu7XYJcXSSkXzo0gZZWNKmIFyr
	u02pqhtGQzsEEn9Wpymi9oF362xJiUpZF+iklrv0FX7vhuasf1OjJVLBxDO/8MhUENo0St4l1h/
	u6jwlgu81L0oH2XgYYCHfHx+nO9jNlmkUK1ULOea6qrwU0dba7BCE0y0dS6OyxW0QE+axuKf5j1
	Bc4Sn3DqHw5M+ULe0YBrv7bjDoTRgiQa/Ffr0tq9et9DQbL1ELlyhdhxL3Nr2/+nMkWk8zYdUqT
	kib4sST5IYMAsEfpPjyG62Ylt8uUEcUCjMXuKdzePONJvIhKEwiEh4x6f2ec/WAxAvqkWr5XfXq
	PITUoSDa8bjxrlJwsQvMVzg0dWNZne9U77prnUYgo00IcfE+eV8rLU6WNtczw5xVlxTPNA2bO5G
	e4aHRGeZdj83n3a6HSb67u8zb0IIh06X3owWwK9edbihzD7yoLKBv6uSXlMH84LagIPQ==
X-Received: by 2002:a05:701b:230f:b0:14c:8461:b3ef with SMTP id a92af1059eb24-16a5f112ae7mr5922654c88.24.1791612803634;
        Fri, 09 Oct 2026 23:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a5866477sm10558036c88.22.2026.10.09.23.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:13:23 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next v2 0/3] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
Date: Sat, 10 Oct 2026 14:13:17 +0800
Message-Id: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3XyWoC/5WNQQqDMBBFryKz7pQkYku66j2KixhHHVAjmVQs4
 t2beoMuH4//3w5CkUngUewQaWXhMGcwlwL84OaekNvMYJS5aaUsCo1dIkmCzdKhpPj2CcMi6ES
 Cx8QTRayoUcZW5EulIF8tkTrezswLfruZtgR1NgNLCvFz9ld9+v9Sq0aN1tm7s03Z6rZ59pPj8
 erDBPVxHF8H33M94gAAAA==
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref drops every reference to a struct_ops map
and expects a timer callback of its prog, 500ms later, to find no
struct_ops associated anymore. It fails now and then while test_progs
runs other tests in parallel, and v1 [1] made the test wait until the
association goes away.

As the BPF CI bot pointed out on v1, the association goes away late
since commit 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period
optional"), which moved the RCU grace period of a struct_ops map in
front of clearing the association, so nothing waits for a prog that
reads the association in between. With that window widened, a timer
callback returns into a freed trampoline and the kernel hits an int3
Oops.

Patch 1 frees the map only after a grace period that follows clearing
the association, and patch 2 adds a test that catches a map freed under
a running .test_1. Patch 3 is v1 of the test fix, which can keep calling
through the association until it is cleared now that this is safe.

[1] https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Add patch 1, fixing the use-after-free behind the flaky test (CI bot)
- Add patch 2, a test for the use-after-free
- Point Fixes of patch 3 at 5db69b0fbdc8 (CI bot)
- Move the restarting of the timer into patch 2, which needs it too,
  so patch 3 only turns it on for st_ops_assoc_in_timer_no_uref
- Rebase onto current bpf-next

v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com

---
Qiliang Yuan (3):
      bpf: Defer freeing a struct_ops map until its progs are done
      selftests/bpf: Test freeing a struct_ops map under a running prog
      selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_timer

 kernel/bpf/bpf_struct_ops.c                        | 30 +++++++++++++++++++++-
 .../bpf/prog_tests/test_struct_ops_assoc.c         | 29 ++++++++++++++++++---
 .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++++
 3 files changed, 70 insertions(+), 5 deletions(-)
---
base-commit: 15b578b1715d9a318c804350d98af87c203672bc
change-id: 20261009-selftests-bpf-struct-ops-assoc-timer-5eb0295ec300

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

