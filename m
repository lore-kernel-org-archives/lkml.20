Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9A33E35C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117220; cv=none; b=ez7slLrK5Kuoq4K+JD2xptBJ3kLqzvLzcxGUcx3VSZYnQhPiuv+9dEzaPaPBorb2X//YFYD060z0ZeL/wcIk0mGiVJ6wXertq1t/Ovskcwod2XKLBoRsPCCxatui0fJMWvKsqx/5GrYJc4MpKIVsMjK3WDhw1u5oTGVlV7fAfnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117220; c=relaxed/simple;
	bh=xGfc8hkwQ1JzAZbx3cw8pks2pYJ+XRlDMgDsnChrvZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HA/bYTqf/vEnkQgzjSMc+uSNM9oWEjHgQbpQ475HexC3S7F/m6nXfPoC4ehxK1jMfWVCoUeD0eBJ3u6URqDg62QNRRG+Hr9mYvAF2INZ+sQjqTGOGU/HDx+XgUmnVzVSoMxhEVfcHcOp0MQ+x3zc/NWYzfkm8sA6GLMZrK6XG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=AMxzgrU5; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="AMxzgrU5"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-17bc533fda3so2906771c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792117218; x=1792722018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIkNKmu4tNSbGV5T07Rx97zRUQ3kfDdV0Kwy8SxGUtQ=;
        b=AMxzgrU5Um2cY/sdHPnv6OI9SVONYnMSqpBBKinHSCfhox+E/iZtlxxhozLbfziSmY
         VazFM2+ZGmbhDsWoqdzfAbd6nH6AY3GDYNbvKFACuz9Y5OJfhfjnTaVtnP8eig9/pMp/
         R/bI1Kh/Shw7ZMOdciMQ7SKN+5MzXleXuzsweSd2X6EEEJSj878iqVl6G1bue8yJH+X7
         /5sKwUQhzvhJr2uWyUK00hsw0KEjBpVg2RrrWm9EptllrmnVJxMc7XTlK9w6beSoEHQi
         1O2lkQGMTlzab1PmMTVnanfV7ORmTlP845sLOeN34HtdHyjByNwk3RjL4k7Vq7AHQLUA
         OWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117218; x=1792722018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIkNKmu4tNSbGV5T07Rx97zRUQ3kfDdV0Kwy8SxGUtQ=;
        b=BxWB42Wci9yb+PRMDrIXSij1F1Gkjn5zWiGHJcX18PzcNgtSzDSn/SzZBecN+KEsAy
         upgWB/fUGyD5o9PI5I0qCfz+2eiZBLnXfsntOYXUaMn5mYXyw3/k69b31MRNDAX75T3L
         G5110dkgwAoN5p4NV+YgeDlCH2uCq+DEANRD7AFCew2hnYMkLH0nHu3K8wMSbpVb3SRj
         XulBc4RQacjbUW4p1zVl5z9jgjOpkWBEvEx+lfVy3sGNDqrh5W7ZKy3seqmfJMy7OsE0
         yZXrZ/D0XIS6LdflK8pM0pXU3JTq4o7gByXNaLAcTM/zKaDhm70JCr/Zhz2+vr0VGQfo
         hXog==
X-Forwarded-Encrypted: i=1; AKwUvBxBSS8jmhfQBrOppvTLRQsIlWPrdkEFiK8Nq+VoqCzGLfIlvz/85jFBtrzp/c4rTpnRIgwbu2p1EgZizrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6nziZ1ktMEqygfliozAXd9htLwt3Ub0DlDx+O/GrH+x90PTBB
	5CwoZdr06nEUWBV72sB5UEFp3ARYrq6+cO/jo70C6EHF5cbXdrIDg6M7qmapPM9Estg=
X-Gm-Gg: AYBFou1KWuTIt8jlVllBIWtmCw01yBsf1Hl/3nZkYX50QnB3GLAqPjQyvVKJaeas0mi
	7QhLNdzeOQauKGe7EiuybzZAoaD2Lqg8oGKxaoghKEDso5UIk1DsRN5Udui65bu86dJdbZ+SA2g
	z2pbsZbEGo168vzBE2UlqKfh4Gwk7RGPLQKOE5aEv14lRxKZssb2CA3Qj9g0b33ZciF4GrMHdn8
	LDKpqtdZ85sxFbThqb43dUSoekmz4kQ7C5/jYJLN9qiSQGRMP1kZR0R36ZfJsdad0X8VRzEl55h
	PTLAJcByUPJMYncQxKNoye7eZlrwTnSs+qt1aOvoMWVlYvSRbZGBzN+vRmRxcZzGhbaNy6xzY1A
	2yE7nF8EVPnwmRVrAo+c8CozVOaubG3jtdWO2NTP2QfbmXhfDRXnchhTaWQSiACClM7tsPsq5+f
	+c3yhnpP71hKyj1oRMghbXuCJo02URb4sRkdn9x9xe+Q/vINtC3JF9AI/VXM/wJv+Qfq1elVuzU
	18KE5n9Cb7FQ0n9bvS+A08atc/r1XgT80He86Xma26f+8rDNOqF9d74LMF6QoCzBmOh8A==
X-Received: by 2002:a05:701b:2403:b0:145:152:b547 with SMTP id a92af1059eb24-16a56ab0d40mr26503724c88.1.1792117218235;
        Thu, 15 Oct 2026 19:20:18 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d66:d0e8:dae3:3257])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm1434734c88.22.2026.10.15.19.20.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 19:20:17 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	linux-kernel@vger.kernel.org,
	martin.lau@linux.dev,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev
Subject: [PATCH 6.6.y 2/2] bpf: abort verification if env->cur_state->loop_entry != NULL
Date: Thu, 15 Oct 2026 22:20:11 -0400
Message-ID: <20261016022011.16938-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016022011.16938-1-artem@trailofbits.com>
References: <20261016022011.16938-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eduard Zingerman <eddyz87@gmail.com>

[ Upstream commit f3c2d243a36ef23be07bc2bce7c6a5cb6e07d9e3 ]

In addition to warning abort verification with -EFAULT.
If env->cur_state->loop_entry != NULL something is irrecoverably
buggy.

Fixes: bbbc02b7445e ("bpf: copy_verifier_state() should copy 'loop_entry' field")
Suggested-by: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Signed-off-by: Eduard Zingerman <eddyz87@gmail.com>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
Link: https://lore.kernel.org/r/20250225003838.135319-1-eddyz87@gmail.com
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the corrective follow-up for
CVE-2025-38060 to 6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 kernel/bpf/verifier.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c00113e691955a6c9c6caa56007ccf90ce9b87d8..37abde03f174ef5c0a47317d9b9d19eeaeb0ccd2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -17562,8 +17562,10 @@ process_bpf_exit:
 						return err;
 					break;
 				} else {
-					if (WARN_ON_ONCE(env->cur_state->loop_entry))
-						env->cur_state->loop_entry = NULL;
+					if (WARN_ON_ONCE(env->cur_state->loop_entry)) {
+						verbose(env, "verifier bug: env->cur_state->loop_entry != NULL\n");
+						return -EFAULT;
+					}
 					do_print_state = true;
 					continue;
 				}
