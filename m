Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548603;
	b=SoPS6xCVsK528kicZkpYkPZ6chi+lDBE4ZZ4a1shHRDEQo9v74kFANsNTNYAI454Yv8g
	 sxn94P9p/Hx7L5fdJj+WuAsn/+N2AUn3Xtv70DkvyMFebXS4RO/cg8LZ/fYlcaCiubjgc
	 ym15zSworC5MteRVyNSK6i/kwp5pGHWFbnBBAqdni2iYLRJBUrBqq+wTaEKODioONWMQy
	 +3wyRHKQOs4ekCWp5K81PLMHojD9qiv+qOekY012iy651fPdS6npYI9hbWCSV3MnmEzsq
	 9k/rlotBXQF1HKADKvZRJIXb5BtWPxJkCYztz8DYgKN7s1y4Q7ZjXVXf6iKszZX3+TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548603;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9q1Yw9T7IwohIvS+40aVD3tyRNr0XUtDXU2WOjdkgbU=;
	b=ldtohgLviZ3rzxJX81einDKjvhMKNlE0k7gmLP31o2d7ExOb6uTQ7TCa22QlXksBaPy8
	 M4L3olCfuglUetQiftKt2IWZ347ciNSWA6ft9++X553HOQX3C5btQkxHUYYnyCtw0pGsI
	 gkeXWmni23o+BCOfXYUvLI/8dKL9Vb4NAtSZ2v1yWyvXM1hKINarQoaPJAnnP+g8KFqf5
	 JIl8XPJ/58stTi4CLqqXwVDaers9Et1vldUljbE+uFIf7Trm+ApAQEVPrOjN+3MC9CGQ6
	 WQUlXGExzN4tF4ukq0H0dwp5BDjBTeDeYL/cIQ70l8sReyrv+a90Kv6ptTJWqvCmV7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GHUefUal;
	arc=none smtp.remote-ip=95.215.58.150
Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A9C606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A9C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GHUefUal
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ay8D5SY/V0LoPNx34a2cKeU0Fj9TKorKrDO5h6iRW/w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793548594; v=1; x=1794153394;
 b=GHUefUalidYbyHMKn7HiYhMZzDULhrBk4QbkwbdSYwVls0qA4iMg9MN/PAbEp0pFrMT2xEaI
 Siqa18mz1vmOnZqzHdsYxkH+OdLSN82MsoDjL1XANkt/duI+Isw1iRxPN9fKgxfAS3NVHXevCgZ
 2D9rBW0Z9v2X3WqyjsgfI4TM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0498918a273cba65;
	Sun, 01 Nov 2026 15:56:34 +0000
X-Mizu-Trace-ID: 0498918a273cba65
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	=?UTF-8?q?=E6=B4=9B?= <wanghai8081@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Alan Maguire <alan.maguire@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 1/2] libbpf: Fix stale raw data after btf__relocate()
Date: Sun,  1 Nov 2026 23:56:06 +0800
Message-ID: <20261101155615.324501-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

btf_relocate() rewrites type ids in place but doesn't drop the cached
raw_data, so btf__raw_data() after btf__relocate() returns the old
bytes with pre-relocation ids.

Call btf_ensure_modifiable() first, like other BTF mutators do, so the
cache is invalidated.

Fixes: 19e00c897d50 ("libbpf: Split BTF relocation")
Reported-by: 洛 <wanghai8081@gmail.com>
Closes: https://lore.kernel.org/bpf/455f7257-25b9-4070-8313-42af8005b948@linux.dev/T/#t
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/lib/bpf/btf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index d2ff6f5d6d5b..b55dce9fa003 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -6640,8 +6640,13 @@ void btf_set_base_btf(struct btf *btf, const struct btf *base_btf)
 
 int btf__relocate(struct btf *btf, const struct btf *base_btf)
 {
-	int err = btf_relocate(btf, base_btf, NULL, NULL);
+	int err;
+
+	err = btf_ensure_modifiable(btf);
+	if (err)
+		return libbpf_err(err);
 
+	err = btf_relocate(btf, base_btf, NULL, NULL);
 	if (!err)
 		btf->owns_base = false;
 	return libbpf_err(err);
-- 
2.43.0

