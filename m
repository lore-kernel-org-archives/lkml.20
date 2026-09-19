Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316773218BA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789851990; cv=none; b=VMOxyIfIWZRWD5RayuXK5560Gg0vWlol4sZ3T1x0OAw9xNDBTh0F4aMUuMu/PMJgFAZUuU7mdhxW2uq6xLiCvYGqJAktUcWoH/c2GIEM46wigsRI2NsrnwnXCsZ3VVhw0kj67nE99ioAHa2HiM1S1/e24ymfsxHbWRkEoEt/mQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789851990; c=relaxed/simple;
	bh=rkeu4ZpR3DudTk78RdWRd/sRhVqmLJntTwWFB3VgecU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m35kRmbN0dIsZpgR5lmuIPxbIhapwNmpoKez3kqQ0JhJwl0+7VUVUxpaCKH18pglF6KWuAQVXxwgjoOvDrT0/peHSTva01rPjHpipw6+AZMKX+6Y0Hbp2aAIYyQ5D+LHIcoK/fPDbeK+nOLZfrHtymE/zkCB1AaE1cQ+42a+/W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlFoj5GJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlFoj5GJ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8674704dab1so2671874b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789851985; x=1790456785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIqO3FqVB1dK7+YBAaOuu1DEyH3i0oVt3LwyqRR/sIQ=;
        b=QlFoj5GJwxpEizbuZzT8pElrNwtby1pgly3SiP1Wegtg+VFVPulmw2CjpZR3nn0p+i
         Ma3BRoc6JXVIIoPAJdhcufvSCD1UEgnFS0zfozHhur505J6KyM3+lfAFUUxBhqf6jaSB
         gIrUQoVRmt6qwzJqQyFTin4KN8tRwSgcljACeHhQVmkdBJyyOLFcdBZx0PlFTpFfDoIA
         bcnhJ/LD6XQaYdNb4XF5W7H/8qn5h0yOKPug0RoRvQTVDTht7AU5oUQG3ZqCN4cfE53t
         Dh+JN/xGXX04Y5oB1oxLm9BHUw2xdnuAjQJGQYtWwHCm9BBRvpS5gbBkL5AHDja2EO/+
         89Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789851986; x=1790456786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIqO3FqVB1dK7+YBAaOuu1DEyH3i0oVt3LwyqRR/sIQ=;
        b=K8UuRS2/KVsDOtW4UlXirK+KlS4RtG3kP0ajJvSWWvGkPVnPSwHiXx9jEPgB/9dUF2
         dbWI4DBkgHba/pmmoFLMGv7z4c6AOabaEnjVxUd8FVVXpuh9P+o4/9LZaI1ISFhsjsmJ
         aqy48lEd0fLftqjKUlHGHl+73DOBWmnYUdSLG9cVnODtfp/Pf2pMwR+HQKjVQ7OoFV/N
         vsalD5Uj1Nv+s9rM++n4L4Z0ISTbmErL1Vlf4RShzQtOBRMbXuyqH4f/4ad0XWaSgUlI
         Gpy4Wq91JfF+suFMpn50eURMtDhkXpPwCaXjJH7kbSsf0EklTNL2HBXNTJLJlEtAK4M7
         6bvg==
X-Forwarded-Encrypted: i=1; AKwUvBwhfwuYabpCxHPmGWBUZZjERn/7Jph4IUqBaf4eo0I2VKH2QOYj/XJq9ZTgcGu3FJhs9Pyx1E1NacelU94=@vger.kernel.org
X-Gm-Message-State: AFuF++mdBIA+jybdQCH888IRbyavjyrO0Ppo4H+ZIvMpJqXiqLSjss2V
	Bb2Tk4wpNZEnU6TWzB5VEI/QgyXq0jdzvAkbNkO4aG1IiulczaBVxxeF
X-Gm-Gg: AYBFou2nHZqlLSE2jcCvOkVG2NiJTLgSf99RAwPQeQYiKfSZ0F8aD5X+LgpZRpR5Snz
	ziii/HlXn+9/VADj5ARNn/+UwuIGSkivcwfTiFjGUI0qVkctS1H3bZFMXBCMvt3CSU9XZ+KY36T
	ZDAbmnLy4r8nbdt3QMBfZ609Fjo3faV1uz+fAlR+lQtZ5pOlEZX0AAPwtkHOUnho+2rIR4WwiSs
	2ON4UdxXCu5JThX1iyCUe4tk9HrW5RqQDrZxzAL1+laXLj7u+rzBn3iwkM6iJWfB13wBq38HeLD
	2tyMiT1Xee0LDJNLHo/SGFU89xxepmGNcvtSadlrhtL5Q+dpegtSqSyfwdu1VJbBlI8OMGAHe2J
	XfVlsg6x8rd7W89TcJpsFeJNNl6HHj6HYpHvtb1PmE15AuVE8DZ3TT0L/bbOpZ/OMFpQeR6v7y2
	fNq8i+GTsfxg1E9FciwKlqYI2GL1tXNyG/ro1oj5q4x+4IGADf0qHFJ/KNqc0t6lJXP62PUufGJ
	kN3jCx3CsD4N0wnDQni1Yk4jEKNTSSk8u0Y3ErShj+TPXkF+EgPoIycvIA7qbEupFEJOs2Z+hSb
	Dz8Z25bYmA==
X-Received: by 2002:a05:6a00:bd88:b0:870:8e80:3ac0 with SMTP id d2e1a72fcca58-874dc7ee0b6mr9710984b3a.11.1789851985650;
        Sat, 19 Sep 2026 14:06:25 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f8c39sm1278054b3a.28.2026.09.19.14.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:06:25 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net/sched: ematch: check nla_put_nohdr() return value in tcf_em_tree_dump()
Date: Sat, 19 Sep 2026 21:06:24 +0000
Message-ID: <20260919210624.3030344-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When tcf_em_tree_dump() was converted from the legacy rtnetlink
`RTA_PUT_NOHDR` macro (which contained an implicit `goto
rtattr_failure;`) to `nla_put_nohdr()`, the return value check on
`nla_put_nohdr()` was omitted for container/simple matches and raw match
payloads.

If the netlink dump skb runs out of tailroom at `nla_put_nohdr()`, the
error is silently ignored and `match_start->nla_len` is finalized
without the match payload, emitting a malformed/truncated
TCA_EMATCH_TREE_LIST attribute to userspace instead of returning `-1`
via `nla_put_failure` so rtnetlink can reallocate and retry the dump.

Check the return value of `nla_put_nohdr()` in both branches and jump to
`nla_put_failure` on error.

Fixes: add93b610a4e ("[NET_SCHED]: Convert classifiers from rtnetlink to new netlink API")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/sched/ematch.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/sched/ematch.c b/net/sched/ematch.c
index 5c1235e6076a..563feb1011f2 100644
--- a/net/sched/ematch.c
+++ b/net/sched/ematch.c
@@ -470,9 +470,12 @@ int tcf_em_tree_dump(struct sk_buff *skb, struct tcf_ematch_tree *tree, int tlv)
 				goto nla_put_failure;
 		} else if (tcf_em_is_container(em) || tcf_em_is_simple(em)) {
 			u32 u = em->data;
-			nla_put_nohdr(skb, sizeof(u), &u);
-		} else if (em->datalen > 0)
-			nla_put_nohdr(skb, em->datalen, (void *) em->data);
+			if (nla_put_nohdr(skb, sizeof(u), &u))
+				goto nla_put_failure;
+		} else if (em->datalen > 0) {
+			if (nla_put_nohdr(skb, em->datalen, (void *)em->data))
+				goto nla_put_failure;
+		}
 
 		tail = skb_tail_pointer(skb);
 		match_start->nla_len = tail - (u8 *)match_start;
-- 
2.55.0.1082.g2b9226bbc0-goog

