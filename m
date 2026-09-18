Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A01399031
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702793; cv=none; b=JrRv4zV//yGIDbbnU/vxUBykwp8cYGO9LaCCO+tXMd4jqL5gcjaWE8eHggVYApzYwR6jutkjQsRlyE4nyCkZSZ9IY7bXAEZc09gDmBU5/WFprex4gdfTdiYvHhgYk82izA7HDOXImyI43HtQ90nDPaBufMCsFko3CZ3kL36uxo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702793; c=relaxed/simple;
	bh=9zyfsMStqHCzcyLPXjxWLHVGXBONiRoKF6UKjmqzzSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADtaAEF7g+mzz6fXqOtUl4Cgu84pKBGVBG7a8kKB/Fl6MTjeeJAn7vKGHfvZNOWgiFl+x0zpAGqtaebvRoEqH41/Q0/FQDrViL52E/VKg+5K/QcSH2vVoKsx89zvsCnPfvFX0i9Q8y8geUw3OPYpqJ74Ywc3aBQuw2LRYgwxVbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htfvsjFH; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htfvsjFH"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39647184c73so1234270a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702791; x=1790307591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SKq4v+7ohiq5ZxcfqZ+UYd2lyYbuemEMf0RmoykBXpw=;
        b=htfvsjFHk+5g6a00eSg5PqaVap1JkBzT2oo2k1m+WbArVZAXewOyOm3NSn0ZqaPkS+
         XzmQTdFOBDLM18wCeHOLrxowasFH+UMgEzPsCVtu4PJSuTjUH2upMfbbYNa5Xa1QfUqi
         9HKM/G04zws3cwHIeR5iEqvYe/1v4sznHYpJfGoMZUXUPsf14yNwhj9DtJDbie5CDoIQ
         rJ8ljrS2ScZJEfea5Ve2lpLYTUOoesndQKC1hSmyF95P5ZxUSGecqsQjEWBCGP8FLe4N
         q1onxT0H0aLR/k+wVt7b9qHgNDs63bJK9B9StTu6XZ6SKp/vcGBjr/hMLLwBjAw6gCkW
         d7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702791; x=1790307591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKq4v+7ohiq5ZxcfqZ+UYd2lyYbuemEMf0RmoykBXpw=;
        b=yLo1re7rHhyr5ZUQtCxvt2LpJwA/kd5W7IF4S3x9NCVY7no7q+8Iq7VfkXMrnU5rat
         p3Qm7AXhcVqzXtUgodYcArulmldo1u5u7mF0mVKk2o/ytJKpUFGDRjw8gx9a1sU75rs/
         9vtchlsNRZFWFcBvECX1oWQiEnFov7dieAh9LGAp4yIa8yLjBGF3q9SwjEXspQm33lKV
         hW0NQw4j6dbg4nP8aVGW8ara2WoOPRXAI4AUv/SUuhe4K0ZZv6s7WMJYNGlO2j93JsLT
         6BAg7U0N8F+3EevXArFNpde3t5VkAZ1FBf5OERm0l2Ih8i0m7eHcGR5upE3X/6qUtm+8
         SGCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfNwMa7V+KsoNLKh5+h4j3eziqgSxhtH1r3WyiAe41bgpe7+yMH34sd7tflC4yeWde4eXtJZD0MRhLJmk=@vger.kernel.org
X-Gm-Message-State: AFuF++nDFeemrxjwwvOT5ZJFwGrmo1+XpslrkJaQE/NGwAKK/acJMeBB
	SmR9y/uQE3+UpowmMEMW9xaRImsbAFjFlrm22IAHgwESjRSfUpxuhMz/5/NmxqHzDtii7w==
X-Gm-Gg: AYBFou1q7HORWvIxGMIBUlk3F7U+7DgJFu6jsA1JNdQbXhk5joxq/3QYOIJGvy/ze0y
	/SDwShJhrBAK5cEh2o+/DmdgtHVWwH0bf1eqzMTtnXfH+Zs35Oe38RaxScsrYE+/iphh3wf6XGl
	jJN7IsTcKaA5uaPfBAZAPzKrZKXBA/lh3NqotcHomxZr5fMpF5rYgnjWZBAIeOzph7LlUvfjP08
	5XkBj/bx7MkwUKpGeakNm8WXPbuzpSlZHC7VNnFRF0VUWRQDH22t+7PJDPRPLC+8BvvkhMNkK0W
	Ec1bzSOQNwsbK50+9B7xNiYfPpyvWoY5nzYe8oH104Ar0JbxGP7ygLynlz4cSoVumvjRjGW+BAw
	dB1YO5ljcXYa5L2L/VVmm2Pzz16bb+gz5Q4u1A/EDgzNRBLNYi8yJBdpdEqCfFwjK96RZtuk4RY
	e9uZ2A6/a5cezjnNcohn9DwOeTAxQZFhCxDe/om3DBmZhKgnfVX4gsoubor6kziuifAhiRb9ehH
	15TR+T2mPDhNeLWJoaoIxL/ICw0tPaQc5s8qWBzWLGWRgr9og==
X-Received: by 2002:a17:90b:4a4b:b0:39d:e7c7:8044 with SMTP id 98e67ed59e1d1-39e36106e8dmr8461939a91.17.1789702791461;
        Thu, 17 Sep 2026 20:39:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287aab5fsm608065eec.22.2026.09.17.20.39.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:39:51 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] sctp: check return value of sctp_get_af_specific in sctp_process_init
Date: Fri, 18 Sep 2026 11:39:41 +0800
Message-ID: <20260918033942.85061-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a NULL pointer dereference in sctp_process_init()
that a remote peer can trigger on kernels built with CONFIG_IPV6=n.

Problem description:
In sctp_process_init(), when a COOKIE ECHO arrives from a source
address different from the one recorded in its cookie, the embedded
address parameters of the INIT chunk carried in the cookie are walked
to re-validate the source:

	af = sctp_get_af_specific(param_type2af(param.p->type));
	if (!af->from_addr_param(&addr, param.addr,
				 chunk->sctp_hdr->source, 0))
		continue;

On CONFIG_IPV6=n kernels the IPv6 address family is never registered
and sctp_get_af_specific(AF_INET6) returns NULL.  A peer that completes
the INIT/INIT ACK exchange over IPv4 with an SCTP_PARAM_IPV6_ADDRESS
parameter embedded in its INIT, and then sends the COOKIE ECHO from a
different source address (as a multihomed peer legitimately may), makes
the walk dereference NULL, crashing the kernel in softirq context
without any authentication.

Fix:
Add an explicit NULL check for af in sctp_process_init() to skip
unsupported address family parameters, aligning with the other
from_addr_param call sites in net/sctp/input.c and
net/sctp/sm_make_chunk.c.

Tested and verified style-compliant with checkpatch.pl
(0 errors, 0 warnings).

Yuchao Zhang (1):
  sctp: check return value of sctp_get_af_specific in sctp_process_init

 net/sctp/sm_make_chunk.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.53.0

