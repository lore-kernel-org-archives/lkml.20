Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622738;
	b=ABfrYvpdAtKgS0PO45FEqLPli6Vsmh5HCU+/mo9t/44DprNj1ragB7YsFktnwsrmjfvV
	 Nx6bai7uLbu+Sf/O5xNQE/NVIEyqfaimp9V5Cps3H5X08e3m9tCFTTEpD4Ix5rP8NC2Zf
	 m3/SFnHr4HS8uaEa1+hapOV2D8kbRnPDT3ErDHhGCE7xvPXjEwAdlE5//320LZTvnJOeh
	 RAVJxXDSqXRVB91Ynf3alLFz9RJjJsv/QSrioBn4hIevV4+ZQkrEx3d/jrz6JqktRnbVt
	 4bNJkyqTOSfbpcJSCMoT0DttO3IlPWyPfLDX/+NPUPTUAuCX3CZQ9stwxQzpYchz/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=lfTEZtUhCcU2T3URSEVjIEX2SBlCGYIkFNQ2td3t68s=;
	b=HzFjgov+enntxa+oD3ph+meR1T7ugQGACF5sbLUNM7+8H0cz6sHwVpfg1fAafSB+vMdX
	 hvWq1xzOVaE1kzFcgRnqMCuw8HHSisntr+1ndbfZaVh0GW+a6zrp4YauftxXor7RNf4gF
	 eBobi9nS9u5ezBYrWK0nU1RbAmq8NjI7AXikUXuuiAk/I2HEV2IvuetV7p/lboc3T6lPw
	 RyZPDHipXjifKgvqdUL2uiTb8vQypi03Lmj9IEZcmS1OixzOF8Fqyf3b0VlAT6g5UxHX2
	 Grsol/2Si2E12qZzBCLbmEs2z99Y3pbIys4MA1qGYat9+aq1mTOwRfubczvU76msWYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IXPnlnEf;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6108606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6108606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IXPnlnEf
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so5386703c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622737; x=1794227537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lfTEZtUhCcU2T3URSEVjIEX2SBlCGYIkFNQ2td3t68s=;
        b=IXPnlnEf1jbwltyqwb/bMrMK51l6iyIhrrQ2fg5JpDukS+CGDClt7341hvbF5LgmoZ
         lDtIXS3hLWs85Dg+lsrWh8miuMxZNQQS1X33IKqRQzG+Iqc1uUlLHJfRn+NEnpfpOkZh
         pjjn/y8s7Jpgswe6EtcawE0iWbKlupkm3mD8iMTbGCNacQe6IvFvCIbyofBbMJ0gvNvh
         KD4xEXocV+m8rLK23MliT6D3sXPLe4KKybWp0FW9gJaSHwAMf0StDJ/ZmLIoDg9ELzzr
         JF8VGiBv5TGe9DFbIpvL60shkoXNgSBo0XqF9V2ABii8GCzN9u3Y9xw/QuF0KJb/Ez93
         y4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622737; x=1794227537;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lfTEZtUhCcU2T3URSEVjIEX2SBlCGYIkFNQ2td3t68s=;
        b=iksJJ4DIjscWzRjHByUwlYbICPX7boNcgThrFBXt3XQSrM01oCVDLkQqLmfKUCZyXX
         d4jN1Bqd9Upo+1Fgu5vh9yEgXyh+uN+mQqtxKkHkaWULFbd4IaZkl6FnhyCxgdBaE76R
         OPYy60a470beKo/eqPQejfAmLzUTMMMaGoURhneL+S86JVZQyb6f7FDYfhejBLh9bZHy
         T6IHdqAuaNCLcIvE05N9Ex9FA0xloM4m2HbBZ2xxllJv1LJ3ASL0Sdqh4N8l2PXpDRmP
         g2PQllH9zGgf694BEu4uYIx9trxhDLB6jgmBcI5bXRCG7QiFPmzPEjoHRDHe4K2JdcGQ
         rfwg==
X-Forwarded-Encrypted: i=1; AKwUvBx6u0GzgZ3JD/ZwS3XFCrZ/zsw7Bjz375vda95WPNZjKrm65gimQTehQDU0peOauTfTmvRpn6eB37vltPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIalG5EoJ2XcSCIVgDxrWbKCDp6wQF4vciEb6y0sLmCW8uGqimi
	wYYv0bKVqxfqYvn6/UrIxGUcbCugvOLr5OCP5mUT0AjWgRERrAlPYFZca6kqg5C5Hko=
X-Gm-Gg: AYBFou3+U+rpEVBxQFOyqepCwFFJgEaNB1/eiT2Bc8B8vkOxrBMMgfG7j5+MBc3ASp9
	ld1mf6DKD+yCWoBcSWR2PqxpkudyQELRO2FYmstrrJSpPXy9toxLpaYYYnCGf0Uwayw/uvTC1aM
	FO3QDJ/hDdfZTOlMrnNkz4l1BLT3O1N+G4rt3i0FTXwUzfEVasX0CGEMxDCUJWa/cy0wyAi2y30
	4c1vjBQbvfEy4KCW0Nn1zQzE/hUgndXii5FjvZy5oJZjEsGNhDvbP3crJGVd3v3MUhAvVewOzgC
	hgiNy9XT0pGki5cKwypGHtWwuL2A1NNbkl3XVZ4GXSJLkoGoMxxSEqwftRqQUFmj2NzMHMbgj6B
	PfMmlNP2CJJpPCwyxoxcwuwzKC42Km6Qdl0BLhRaPWj7O31IslzYwwE+AS3ZjAyRM7eUfFNBJrU
	5ZPrLXV+L23bCltjivs6YzmzI6S85y/l4rUZAF+wpn51zwv+9wenfEPSmyPlt3mVRjGmISiYtL1
	jgwGLDMKxJZK5zsCXyqcwiSxgAzB9NgTJ+AlXk2QMDZTlXPJ6eCaLDHK9JpENmHDb6K4v1VWQYb
	V8OHVffgyB7d68A7oRi0OXNO
X-Received: by 2002:a05:7022:eb50:10b0:14d:baf5:c415 with SMTP id a92af1059eb24-1ac5a0b4324mr16360361c88.7.1793622736733;
        Mon, 02 Nov 2026 04:32:16 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b2360d2066sm4950951c88.11.2026.11.02.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:32:16 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next 0/4] bpf: Follow up on the patch list
Date: Mon, 02 Nov 2026 07:32:10 -0500
Message-Id: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqC6GoC/x3MTQqDMBBA4avIrDuQHwjVq5QubJzUgZCETGoF8
 e6mXb7F9w4QqkwC03BApY2Fc+qhbwP4dU5vQl56g1HGaa0MvkrAMje/YmRpGHKM+fspguScvSu
 r/KgtdF4qBd7/6wf8VKK9wfM8LySpHKB0AAAA
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Alexei listed what the patch list series [1] still needed when he
applied it [2]. This series covers items 1, 2, 3 and 5 of that list:

  item  problem                                           patch
  1     the tests break with bpf_jit_harden at 2          2
  2     the out-of-range test ignores the insn number     3
  3     the comments on the aux data rules are gone       1
  5     no test has a second patch with a jump            4

Item 4 is about a commit log that is already in the tree. Items 10-12,
bugs that were there before the series, come as separate fixes.

With net.core.bpf_jit_harden at 0 and at 2 before the run,
verifier_patch_list and patch_list pass and leave the sysctl as it
was. Without patch 2 and with the sysctl at 2, 8 verifier_patch_list
tests and patch_list/line_and_func_info fail. test_verifier and
test_progs show no new failures.

[1] https://lore.kernel.org/r/20261102012940.1756142-1-alexei.starovoitov@gmail.com
[2] https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (4):
      bpf: Document the aux data rules of patched instructions
      selftests/bpf: Run the patch list tests with bpf_jit_harden off
      selftests/bpf: Match the insn number of the out-of-range message
      selftests/bpf: Cover a second patch with a jump behind a barrier

 kernel/bpf/fixups.c                                | 18 +++++++++-
 .../testing/selftests/bpf/prog_tests/patch_list.c  | 10 +++++-
 tools/testing/selftests/bpf/prog_tests/verifier.c  | 17 +++++++--
 .../selftests/bpf/progs/verifier_patch_list.c      | 41 +++++++++++++++++++++-
 4 files changed, 81 insertions(+), 5 deletions(-)
---
base-commit: cd5bc55288d4fd999595c8f2af6a5408cbe92a52
change-id: 20261102-bpf-patch-list-followups-e6638030c913

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

