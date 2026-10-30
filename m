Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390048;
	b=WkmJOtJgycWn63HbbyGjuZ/d5QFLFVeuRYV7jMZRJMSYTeKODoR9A2jZbVbZnm6Jk5rf
	 cBMqEz/Ivs3S6Tls8V0yRiZnfw/ZJkgz3B87ZIBxMcLDf5PZDt/MTBJYtAuE8OWbppuQe
	 x8jWRyfgH0m9DGDxoeMqZ7ZskmWbZCYzD5Bcyqn1eq+446jJAHEVOW0s4G+8umBy742c2
	 x31PwN3qA1DKxaPj5ltIUPZMuJ+7PGB2+t4HKI5Qt9oiQqjT9c7CCaXnNcoyjy1UZJOpl
	 GS+wIEgCdAe7Xcg765fW65AcT877ed/ltb367Emm1y3+9O9Nf1aXJX7IrIp1pvbRHzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DepijJ5mSdF6Rm/91utIZUffVZqjneqDysOMMvYPl3Q=;
	b=P8TOFd1/bMuQhQFkhBwed3lc7LBrYiw19Wlq12MFn1WgOMo9egb4Ql6goLPksliJoc8w
	 B7Y6ESjhpInrNCLB4WloUv2AvDh0uvCp0nfw7AZSEf4g3/BxJsZVG/nXSZElRDjgOD6S9
	 rI/yCLV6vUkUPekESaw7AYNreWv9LpQLwob/w7K35/Fx3ulqWVvdkQq/8CMcbMZFdWmnP
	 /K3Bg8Wk1QWgH3PrWN9gditet9wMrjNuPB6jhuLTIUmkBS1P1LqmeFeYpgqvxhYzEJ3JL
	 oNwAwGv5pHao/rgi52siMrQf3U1i2kviH1Fo8uYZM1GvonH32nTYaT1FqSpBgD4wzIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lp+FzaVJ;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62FD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lp+FzaVJ
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so494292eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793390046; x=1793994846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DepijJ5mSdF6Rm/91utIZUffVZqjneqDysOMMvYPl3Q=;
        b=lp+FzaVJEg9jeu7brmdhZ8zaEXk713eqp6kT8yjKzIFrt31p03EOOnH0fdPxP3H0kD
         A4fNXYWR5VnuEcIWLV1CZjEUaMe4YVep+8rnudQQYOEu41BGR5tPYa9LYBjz3vQOHPrh
         9CYJ6F4cmpAIBaddz5PM0GZw0CJvIkhOdiiS1sFv1ioRkDRk+S6NR7VvnP1pXSMv6+dq
         M8FdnMSPHW90/qe4/NTQH+lnfjYMa1ppu/yPk1ZFq7DzHl4u/w16ogwuc6pL1QooFuSB
         AShRoWrAhoS/7ZWN4VBG/YOp6f9HBzDrw20ubgcjIKsMMer4LbKvTswcbKc+RQE9g7CX
         qgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390046; x=1793994846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DepijJ5mSdF6Rm/91utIZUffVZqjneqDysOMMvYPl3Q=;
        b=dbQajdU+XhgcxO2x6NitdotBM9xslK+fl5rZK3wXAUJwYf9A/qsJmLx0p+MrC0uyD3
         gerETovClPvOyUBsdJbg3d48h3mzvO0hfVhXoiTaf7eSXjWOEHAunMwCSdG+nKHF0zwD
         XXDYb2CAyxFsnVsvrdDCy9Jgq1VmW+JS5oGkIuP6hkKHTjYnw1PLkE0VM+4ixvbW6H+h
         /BAUco6ciJ+i/ce4d/IV6hnOBvPXmpobQsJKhonaKWYuMD86ybmAxqrYNUqweGhmqpTV
         asxW+Cy6Ec/LbbtBY6+rlaKROX3guIgRgB74x15qR0s+Kwom1PJ/4v6AEMwWmt8QDRDo
         NtTA==
X-Forwarded-Encrypted: i=1; AKwUvBxb8Kbjand7mhIsYCh2uGUuibP4ubtgtpLenwolXB40nMvfguzDfk0F7KjcNF9LQbU4LYIhl6c6jOykksA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd6TYedjhdiPA/sOSbeviVpocQnorvtG+1zpuQhq2xfQ90nzSd
	dCykQC8jw/eMIawLFz3XpP2SdlOixp8BFHG73np4uxba4rtJ79dEUtad
X-Gm-Gg: AYBFou3MHKqik0UeTnNnpgcAqZ2MU6weorP81EBDVZmMqN19mx1d5xihzW2J2DabvEm
	/bWFex20och6c70vRLhycvCkYXXFpr9cSDA44HUKouVW68OkFwoyd6YBvTUwInHHBTEZ+oqIa6I
	+K+yanHdPH/HcR/fk2xqAcHXgfsPgbDuKRi/DGoZCo3l90ypuSVk5CSFdZPEIsJ0hvOMLGZRdlc
	XUnb/y0jC0wEL8Dth8PrbCmfMkSqbE2InA7A33KDid3kf6FJVrH7WVm7u4IhTVtNSbK82B8Qa3j
	HC4C5FnYkrGI6MCq0obvd8WW6gTvKtmSr+GIP33PQnqMqN5H1zbXSvcMPIrnOq4BIP2k0N2OttL
	B/mC6Hum2XMAG2sCwxMOxw2g/4AdhHpnT5+HYA6GSyb5yzlhA4jVYweiFXkF3HJ5VgPVgw/nz3c
	f9JwQV7l3v9jno8TvYrrBear0Byz3TXBKBxPSyFE49jWRSpvNjLTy+OZO3tmQJ1sVY79Foeu/Q8
	WR0PjgPuNvg6vujhBntLFAr+UZLnbJaoaEErWQZHZXF+jQnmQWao8t5ykd6YdAr88YdjKeb8wUN
	ap3e8zoTdUVtrkctbJz7ViIn/R7T4qf/y7E2fpgGtwYaoHiFwORWkCDX
X-Received: by 2002:a05:701b:4206:20b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1ac5fd08905mr4373862c88.45.1793390046372;
        Fri, 30 Oct 2026 12:54:06 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm8711286c88.22.2026.10.30.12.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:54:03 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii.nakryiko@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next v2] bpftool: avoid sign extension in unsigned enum JSON dumps
Date: Fri, 30 Oct 2026 19:53:43 +0000
Message-ID: <20261030195343.79712-1-dennylin0707@gmail.com>
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
Content-Transfer-Encoding: 8bit

The BTF enum value is stored in a signed 32-bit field even when the
enum is unsigned. Passing it directly to jsonw_uint_field(), which
takes a uint64_t, sign-extends values with bit 31 set. For example,
0xffffffffU is printed as 18446744073709551615 instead of 4294967295
by bpftool -j btf dump.

Cast the value to __u32 before widening it, matching the conversion
already used for plain-text output.

Fixes: c93cc69004df ("bpftool: add ability to dump BTF types")
Acked-by: Quentin Monnet <qmo@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Drop RFC as requested by Andrii.
- Add Quentin Monnet's Acked-by.
- No code changes.

v1 (RFC): https://patchwork.kernel.org/series/1196994/

 tools/bpf/bpftool/btf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bpf/bpftool/btf.c b/tools/bpf/bpftool/btf.c
index abd661db91e6..385521e6b028 100644
--- a/tools/bpf/bpftool/btf.c
+++ b/tools/bpf/bpftool/btf.c
@@ -482,7 +482,7 @@ static int dump_btf_type(const struct btf *btf, __u32 id,
 				if (btf_kflag(t))
 					jsonw_int_field(w, "val", v->val);
 				else
-					jsonw_uint_field(w, "val", v->val);
+					jsonw_uint_field(w, "val", (__u32)v->val);
 				jsonw_end_object(w);
 			} else {
 				if (btf_kflag(t))

base-commit: 7101b10cf281f629ac58c99697ca6f6d082b99a7
-- 
2.43.0

