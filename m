Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328185;
	b=TGJVLD2uwNVJCOzYiE7N5dwG4kapbzJas9xF9rFfVdNJBBsM+yD1ohbZXA70CFzd8906
	 8Vlit1q76rXlk1NbJJS6GK+vwIoOsQ4q4LAqw85LNspSzLAQE6LzS04mIK2mnOTfezJee
	 quZr8LH+TJGIcUmwJA7TIox5qQVM+7YdZt53Uaq4TMxdMsI8lTdLaWqfbUn52ViTw+EZA
	 FVFpjb0l02NIJ1iqWs47uMgOTDNtpLSQj0WcNcSt+m/tGJ6gM9rlKjP1Kwp8/cXqNF41J
	 giWeR0GC5hj7D+syU+7GI5omHkCR+8um+q7bZMyg7GEi+IheMZCui/oQRLrmwYLd2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hV6F7yYjnqHSXEHJzA6+kFWKMIKY39vlSpHiYUGRlP0=;
	b=hSFdnymW3LiO1t28HgRwuINe4Q6nC+IkjU6W/agi2B/FZDw0iatZOxqx0MA79vENu8OG
	 c19SmydnfajqNwyfcoIJPB/atPiL5hyM6dY+h4kk8AbZ1NLrLR1JrXZxouVVSJmccRpv1
	 4JdHFnsGFoLuIR7aVrKVrAFhzHUu/vLe3wVGwHQiHS238hlMvP1TeGNZ1lQtSG9Ll81Rp
	 CH8xY8lZi8kQTjG8IGo5VHO1y1cws2oHrHAuOuPW9vfLS+bV4lTHcccGJuZn6c8wslGL+
	 +zxy7V70A/i/jqhxCbFR9SgzrHirVb7lJlt4S8w6WdtkqKsQ9ie1o6rKciQHcgFz1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr1nJCsw;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C6E60A6F75
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C6E60A6F75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr1nJCsw
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so2177018f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328183; x=1794932983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hV6F7yYjnqHSXEHJzA6+kFWKMIKY39vlSpHiYUGRlP0=;
        b=lr1nJCswxKRyPGM/46HaIs+xOyWtjUrl9/kBRj1lBdIljOXcw89Qeyq90My77URS6+
         57NXP4jzbNryQehACnr0Dm0002e640ssXBtS3jmSI4MMTgitqocnTPCUjsMJCqGAvkOe
         CQj/CKVBahW82rIa7NBGg8J2iMyFims/5fOZZwPsgP4jz0wz78/3Kc+FohSpMBw1LdWJ
         FzEnRLWTomW4ycl6My1zGw6qOeKmvGrM1n0JQmrSGcEJycbyom32ZcZY5yZ9RDqaaPcl
         ribXhZq/6HtSD1KgxmaKVF0p49JH7lEMNL1PqiprhW0pZ5T+fq6QR0pUBomgaiJC4v/l
         zcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328183; x=1794932983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hV6F7yYjnqHSXEHJzA6+kFWKMIKY39vlSpHiYUGRlP0=;
        b=ollhtjlwbIJJB4vJ1zkjCQLdSindK3F3N4Ho+Idy4cVPmivPO4ar4Hm1Atxgd+hcLY
         0F0asD822indLwMoOPwK7+Q06jEyCueQ3BVRVubOqs3bYR39OtX1Xq82QTFILTBb6rar
         RNbaAM35w4CykPLfzQFM/op5zCElz2DNtrKHwcOEMQT/ey2AULpKcOeIlxn419FUHxaB
         0KqpuMN3lw9zkBZofQVYyVNr3uUTm6suyFXoF4VGqLVh8dILVoDVcy6rPyqlYOs6PqDw
         5YemWxLReG8/0r6IX/ftfR48BRGA09thEzX9n+4IKQbDOyyYJzDqVN1quHlIWsN3Osl4
         N3jw==
X-Forwarded-Encrypted: i=1; AL+hErGqGNRQPRncLYq3wpTZr0Btll08Tb0ZUoba+Z37tCz91zATcP28eU9kNcW088U9e1hzniuCccv1Wvxn/yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uZ140Q6AF6stSoiHz4rsqgV7PZDVMDYx/97IKZfC+0WJvMV9h
	oyXKVNLZwRc4dPYIkl6xRBS+9as3VYkUTAa4MaaCnRRCk2WY19X8JPea
X-Gm-Gg: AYBFou0XI6+C5k3d1yisiJ4q7Rt9aQadRrISixiwt8R8l59VvXcQH/j34a/T634vxDX
	McFb52jx96GGJDTLOn4mpKxN48vO53r4AYAI1gy7gA3qePMuAhFtr/X7m6JsUDz2Gk4OGigQeln
	9EyQQ+AQ/Bdvli38L8AHIHh+XTX8okTHFirJ9+KoQFCaP+hSAZhdd+b9hSmEdYNCNIGlpJiguHO
	pzLvmahB+TRg87dwlhrJAH3T3KumPo95cDRm1SBM2MX6KSq09PSYHb5Ph09ttVfEoFjdttT70nc
	0Wam3jqUtMSmwBp2e6BlfP4EyujTYXWkMCIEKWUGrjE1+QemxNRMEZ6U6Lun18K8eEeqkpBTzeJ
	5YzD5uOjGVjD3vd1UofhX7Z7fz7UWoEww7Hrbd3K1wmEXeklN0lwRgM7TCvGbiMidjcETaqNYuy
	EIff3kC0tPAJByJn/OenzY8LJVrRjkO8H2THRW7tkhhVUeGh3tcqZT96H+HGCXsmd59E/xEgc18
	utP2F7oha7RroQ/16g2P0mehZIcH092ukHBUobNoSKjW6FU7d2Lh9FvKlrWxJBtyPmRUXpPEIjY
	jfBcV+ZUqVxQoQexiZlSAOcVijJr5xa3j4xljWy9bmgwu0g=
X-Received: by 2002:a05:600c:34c7:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ba0234cccemr51157495e9.24.1794328183482;
        Tue, 10 Nov 2026 08:29:43 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:42 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v3 bpf-next 14/18] bpf: Require the JIT for fmod_ret programs on found 64-bit targets
Date: Tue, 10 Nov 2026 16:40:34 +0000
Message-ID: <20261110164046.454431-15-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interpreter returns only the low 32 bits of the return value of a
program, while the trampoline passes all 64 bits to the caller of the
function. If an fmod_ret program on a found target which returns long
is interpreted, then a valid return value like -14 reaches the caller
as 4294967282. This value is not 0, so the function is skipped, and it
is not an error either.

Require the JIT for such programs, as for other features which the
interpreter does not support. The caller of a function which returns int
reads only the low 32 bits, so nothing changes for it.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 kernel/bpf/verifier.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index b12b57c7403e..920ff39aac42 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -23883,6 +23883,9 @@ static int fmodret_retval_init(struct bpf_verifier_env *env, u32 btf_id,
 
 	aux->fmodret_retvals = retvals;
 	aux->fmodret_retval_cnt = cnt;
+	/* The interpreter returns only 32 bits */
+	if (size == 8)
+		env->prog->jit_required = 1;
 	return 0;
 
 invalid:
-- 
2.43.0

