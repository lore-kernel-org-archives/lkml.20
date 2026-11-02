Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623029;
	b=KT5T8E/U6Nt4/V6dWzYk64LDdaT1Gb6SQc3Cm7C6YxOiz4Do2KqEw1h2ngf5yNivnvld
	 jQk6KkZR8RV0cKZQ2W17JyKHfEvgPAcRjxeUTom2hWsH6d2POItkbXRF7LNvWCdJZ5euX
	 dsqZSS9h9pA3tPR3w/Xhhb/2254tkqLGl0LKgaAIvQgh3cA9tTeJ4vbj7U05E6zfQo9ZD
	 +jn2xN04wa5odE9qjRB8gcntIwWkzMp0UsRHIZhW0p/4FpPJzMC74FDAnBNWIS7zau2u2
	 cHvU/Mcadcl6woNGCYW7p3zSWMADGz7eEw/nyUvvZN+QKgTRzUhpF7H/utp3StCHxeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=jiUaz4f9o+mDn4Avtd7lFhAHvXfThjVzdbQTeYRRX+0=;
	b=kjfGz/sOKK1p5RbzyNEXGraPuY35Ijaw2OpO28JSCed/J6IkNltinVfy5Yv6ymxXjJn6
	 y3W079GWX7EOF7rpit3P7fGzcaEGhfsOj5dlK3jCAFMFv+PYHic2i8N7bCEBacoTEtQWJ
	 O7LfpMCLpmXc2MdXTLDYkIFD4cNaaGovD5ooCQxEfrXTCEO5FdCcC194zCMp30D9KglKa
	 qV2k8p8/SG5E8Ndh7q7HmZem8S89iaFbtfu1qdyeOVOLT0qyEuMPgk3WBMz9Hj++tm1o5
	 H9WgA7T6K4d5wWX+HBjKZe6CB7eMECzCGhxC24wel++o07181TJzyMcy6tnr45jugCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UvfS7rY5;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01908606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01908606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UvfS7rY5
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so5521609eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623028; x=1794227828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jiUaz4f9o+mDn4Avtd7lFhAHvXfThjVzdbQTeYRRX+0=;
        b=UvfS7rY5xoMCyzIjp8URThf1WnyL9SRo3oRA9q6a4+i6rBO3La1sR1ZLXpsw16dUtG
         GQ7dv4C25qefwMqVETPIyu7hwbbUxrBICSY+fcT4RF32ADFhrzO6ORqoBa1hZhS8W1zU
         wtp+bb84P5Q4RZPpp/DjQEDrvQiXExSMtaCypR7TzKBcggo+wnXWRyAkBo8CtnJiCvTy
         i0Dk/8C6JkxYz7ND5HvqrJoa0AFFPda7JEw+iggns4Lp1HL+zxX5ZpRZaUDQx/oRgf1j
         zR8lYCMDavas7noWIIgsKpxiGty8ygKH5ygr6B1aBoFkb8cm87pqbArjWSniQm/G//mg
         PQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623028; x=1794227828;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jiUaz4f9o+mDn4Avtd7lFhAHvXfThjVzdbQTeYRRX+0=;
        b=t5eH0Kb2UFv31A/VjDXqp1cmL+P+ixhe8ihhqNhQTxV3w++obuxZNnhy3mV0rfyvR8
         UqLXmgkvXkVCMRmE+px1EHzk8gpHhXhcV6IcxDsJzLlhIdPvP2IQOWSaIMJCxR6Lu7U4
         NcNY/E/jvX1AACUDM2WRcA5GlU2l0SQ3EH1hpDjot95e1eOM9rUKPmwDr+Dv27sEVQP5
         bJqyQF1v44DR43XpX6rQO0dbrcmISUz/wHiEP+QRdyiAdRCifdj86g+CPzPgbX7kgaKh
         mhB3HXTEfDPYVbqTse+t11qdGZ+cTt9YkUALdDrY+2bEoFXsvQsAJk+5XzwB3ZiWhGuq
         ZM0w==
X-Forwarded-Encrypted: i=1; AKwUvBzP2cFAFks0vq//PB1Dm70NKR8ken1jY70Dh0Jzcqtf7LcY6vL0hkIhE795oeL1NoCgT3C53ckbhPJ983c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9rocLO57kpfDeXQjzdgCoaDQ3wCr1BqJBZb/3ELebmHYDbtaK
	ggmuDD7KRNFTIrtvNhYNhZuCXKtXbHSGGxFan0EuUDM/fpd/dZsMZaAZ
X-Gm-Gg: AYBFou1jFcm/UFzK1nC3QRq4e/Ikck5Nl07mIi7orsviiL0JOWZnJKMbeesz3JtM+tt
	UpY3E6Ukz+Vh1pxcdkU/NX/aUa/t9nhGxu7ZDCimWoGIhnzxPaqAemajsVCpacuUHIw5j0GEN+D
	A1gkgZNajTDgcZYghT79pFJKhM8d015aiOy2FDjqxsblEwpoxKwvZ/NDt7OIXnAdVxG8M/NhIsQ
	Gz9VeyKNARc0BjS7NMYrTR07Rx2Iv61zxSV5QudKHubrHcnQXZ76wcrSrSWQEXGie6+6TJcilr1
	lyDLIFbC5iNCWwsorGK7JdhZGuHzaSCam+/+n30L19Nw7JTDwn1m4TaN5kUqLP1B8Me5bbCnWFw
	TIhatVZnZoqiITUAxtQ3JoJX6MO8mcIizvKLAw9Zl6p9wwpxFgsqc0apGsHSpbtDFtQJ+Fs7AgP
	m6NxsnFCbAIcUXItdY4ujc441+z8EE4oWhoPtL3XXposBxfJx6Wt6nRXwb+AOMaXFIkxxCmJKJH
	AhnJgOkeCB6N3pa5W9qdYixSls8PKqOhOJy3E+7mv1VcvihH73SL+D1Pn2Ifnq3AIhHUEqxa0OU
	ErFLlE+sGzsO1Em59lnGlxtp
X-Received: by 2002:a05:7300:c8c2:b0:36a:117:522a with SMTP id 5a478bee46e88-36a423bf71cmr15537738eec.22.1793623027994;
        Mon, 02 Nov 2026 04:37:07 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:07 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next 0/5] bpf: Fix three bugs around constant blinding
 and nop removal
Date: Mon, 02 Nov 2026 07:37:00 -0500
Message-Id: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAOyD6GoC/x3LQQqDMBBG4avIrB0wobHoVYqLan51oIwhU4og3
 r3R5ePxHWTIAqO+OijjJyablnB1RdP61gUssTT5xrfONZ7HNPP4EY2sWzKeZYcxHgGdi22YnoE
 KTRn3KPJFl1DsXxrO8w9Md1K1cAAAAA==
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Alexei listed three bugs that were in the tree before the patch list
series [1]. Each patch fixes one, the last two add tests:

  bug                                                  fix   test
  line info stays blinded when the JIT falls back      1     -
  removing a nospec jump as a nop drops its barrier    2     4
  log_true_size misses an error from blinding          3     5

Patch 1 needs a JIT failure behind blinding with
CONFIG_BPF_JIT_ALWAYS_ON=n, which a selftest can't cause, so its log
shows a run with fail-nth instead. Each bug shows up on bpf-next and is
gone with its fix. test_verifier and test_progs show no new failures.

[1] https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (5):
      bpf: Put the line info back when the JIT falls back after blinding
      bpf: Keep the barrier of a nospec insn when removing nops
      bpf: Finalize the verifier log after the runtime is selected
      selftests/bpf: Cover a nospec jump that becomes a nop
      selftests/bpf: Test log_true_size with an error from blinding

 include/linux/bpf.h                                |  6 +++
 kernel/bpf/core.c                                  | 29 ++++++++++-
 kernel/bpf/fixups.c                                |  3 +-
 kernel/bpf/verifier.c                              | 13 +++--
 .../selftests/bpf/prog_tests/blinding_log.c        | 59 ++++++++++++++++++++++
 .../testing/selftests/bpf/progs/verifier_unpriv.c  | 35 +++++++++++++
 6 files changed, 138 insertions(+), 7 deletions(-)
---
base-commit: cd5bc55288d4fd999595c8f2af6a5408cbe92a52
change-id: 20261102-bpf-blind-nops-fixes-e45e91d65c75

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

