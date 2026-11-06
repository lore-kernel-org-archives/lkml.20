Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942397;
	b=N+tF02Lu5IxflML8g6uD7B2EH78LugrIlTkShCuWQpJvuus0z99AteeRCfZ/ivR1G7ny
	 G5ZozQTGcJCQEsjCk8lN5sgv5ooMDsR0HLOoVpzU73DVxEJUmwJ7ICFb7W3Qd9BFMLfpJ
	 /MVR3K1Xw0tDiM4TV4cm3l6FqMpImmB++BAKiik/JH2DFpyDjZdEgJBKlPx4bE5qSZUk4
	 XTMxjZVBF+2UFPrnT31HUpHxrs29gMWd7ifs+X65EcLfenXeiqV3e6puwmNdV4+jx8M54
	 OaWFwrK6/j+EPNzQtGYVSWNa0LPxSuAVLH7wiHeJgITuTjV+UlAkHSVj5qSSNPSCo2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=thIA+a4MIDQnMOr6nTyDyHd3MBhrUbqPQ16GG235Ges=;
	b=2oIfF+n3cW2dEf08GPRtkoKuHswHABjRqK7PocYXqo6eq6S2XPp34yFv6ZcLh0qJQpp8
	 /+gtkBfaQXBHkZ43IeKEuriyGRAgwXNoP09LMHMNnYx3v/cLISl0u6hgOu4itdrkW3Gf3
	 WAVgsoTBr45t0lWXr+zF9YHg7DbiMAJjzTxZ9pu4qLeVDCYCnfPm7A+4s7/e10R/N6ZHP
	 inTAezFMiQhlGHpCEtDnqM2pUD8EpQVxW5/L06y9/IcM9Pa/vUoN9Nfej0z4u1tO4C7Q+
	 GHDj8kPWgg1dUUdr5uETzK/urmuZIHOcTybG0cEfTasKH0cEQ7YA+7bxJh5m/CuT3vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqZz6nYC;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90550606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90550606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqZz6nYC
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so150094a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942396; x=1794547196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=thIA+a4MIDQnMOr6nTyDyHd3MBhrUbqPQ16GG235Ges=;
        b=eqZz6nYCn9PVjvW6yBFagMYl08LpllPL0trgOTQ3WHfIsNe+Y3/2+c9C6h18C0RNgg
         jcERXhHYR2j4PoKgvkM1grKc5o+2PbWgwtCSHMNJwQzb4XvUs1QLlkxMNVJsq/GWuFUT
         s9h1cmrFSKEV7dPPJif7k8Q29+sSOxXEHiCW/1HNAcVB4xEWcERlp9ysXpPpYfQcSXMT
         yIa1DJOyKWCMCntBQS0TL3w+NtUTOJa3FmLKQJE1fsONpnQ7ap6O8tThBDnZ1j8EppoJ
         sv0gJ5YPX0wJBbWlpMAqrJ/HtJVjkCSrhJ/YrnFRT8frMY3n7cMxI0P6o4n+ujJVHd5o
         r5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942396; x=1794547196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thIA+a4MIDQnMOr6nTyDyHd3MBhrUbqPQ16GG235Ges=;
        b=wTuTr9N0OHdzDgsOcMO1CiQlt3oINIeMrjSAovSncr+KmT/h4wzbLT2TVO4Y2P9Ra+
         CX/kHrxCCCBUkQqGYpSd/kCLyy+6VT9vgttOxFsQZV5GdfDGJkoWoTpgNQhRJXmsVz5f
         M61X93NWRbTj/SizcH2yvBqIHxzpF4DEi/l/lZSrjLE4ej3Xyo5R2s8wHLiYG5VV8Des
         WFiqbDh8Xx78x1p/XzZCQXAZklb6uI+6eJVYKb7M/yC1/gHNo10O9zTi9Jxm33EUayMy
         FWQlZc+sr9jE1Z0zHWE1ywiAo46DwuWzgf9NkI+Es2bu8d8Y9ycKXttIsnWPMh0KPEWS
         UJqw==
X-Forwarded-Encrypted: i=1; AL+hErF5xlh9/K81KYq48Xh2ftpwCCaLE4PF+oL0Rv2pyDHLjvAEVH1xMI6+8f30U5g1scKBEURJwkK6JuYPhV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tmaLmVs2EpIWm5oqyVQ6vlZ7fPj8im480KBaFdD3nhW716aBl
	WNbSjssY/STyqM9XGo3AwTW3oEChZan3EMZlxfpCbDFCwaEP3rkJSna9
X-Gm-Gg: AYBFou1AiDjnMsEqobbcMFEsktpqZ01ETqZ6Ejk+wAQowq4hSa56rcPbzjTzEN17HkY
	7k7v5kjeQf8DXNkGcIg8vFc/r3Ux6kabiA2VzGvtHHv3dDH9CmjX0Wnz3YeAm+/gMZxqsKhKlKp
	KmlEyqiNWZlRsnVt/sw4gv9B7O/WGefGPdAXW6c3K60q7uqIONneOue+bHMsMpJwafgGf11rwTA
	fKi3HC5JdzQ0CdzIdDopi9JwA+92WDfIuudCSe26G16TtChwC3pyEWh0YgSk9eyOfkVRdhj8TSJ
	mcWQefGeTK+bg35xOhMZcgLjP4S+cCazqPdSrq373x1GuYywIvPO6gjiAsWp7Ft8MQjUABPeR5s
	A2cB+JhzY+I4SpSQ9s2aEQP3otB7PJ4ldFuGyF5hnpQ+S4gnJCQUSkPzoiDtuPmSolF3bCwea8o
	PODt/hmc+m9bn9FqDYbYi2frMMm+XYK46l9LqIhMAu8PjWKywqPIAmA8LN1ZtD5vsdjmqvnWJ9l
	+9tN9ILmWNK8JZ3NgNsu5g4nqmqFBGD7Pc1EpECNnLug8QCCCxUNrQ5y4uyG0EO5NVtMOa3Ftw9
	ZBSOixFTd/d7+Jzh0byj5j6p3FvWXv2HAC8c1PUQ6A5PVDabGXpoYT0lBCgVsl09hK+BmGQ0Lfa
	5wRmjdwu1tpVCh4dFWRdUGk/OGHXzafXVlSwHdxRH1BfA9vydZiwxCnO8xW+lO98Jnmfg8wgD0N
	o5ERW8PjqMJUmyb2f345mRBmnoXdG9+RwpCalgyC7C
X-Received: by 2002:a17:90b:554d:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3b0db6f7f23mr1414744a91.35.1793942395880;
        Thu, 05 Nov 2026 21:19:55 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:55 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jann Horn <jannh@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net 0/4] af_unix: Fix inq_len and scm_stat.nr_fds accounting leaks
Date: Fri,  6 Nov 2026 05:19:01 +0000
Message-ID: <20261106051905.218638-1-sidchintamaneni@gmail.com>
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

This series fixes receive-queue accounting leaks of u->inq_len and
u->scm_stat.nr_fds in AF_UNIX sockets, along with selftests:

- Patch 1 fixes a u->inq_len leak in manage_oob() when an unconsumed
  out-of-band (MSG_OOB) skb is skipped and dropped during a normal read.
- Patch 2 fixes u->scm_stat.nr_fds leaks when an OOB skb is skipped or
  freed in manage_oob(), unix_stream_recv_urg(), and
  unix_stream_read_skb().
- Patch 3 fixes a u->scm_stat.nr_fds leak in unix_dgram_disconnected()
  when purging queued skbs from sk->sk_receive_queue on disconnect.
- Patch 4 adds SIOCINQ and scm_fds (/proc/self/fdinfo/<fd>) checks to
  the msg_oob and scm_rights selftests.

Siddharth Chintamaneni (4):
  af_unix: Fix inq_len leak when skipping unread OOB skb.
  af_unix: Fix scm_stat.nr_fds leaks for OOB skb.
  af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
  selftest: af_unix: Test SIOCINQ and scm_fds with OOB and dgram
    disconnect.

 net/unix/af_unix.c                            |  69 ++++++-----
 tools/testing/selftests/net/af_unix/msg_oob.c |  12 +-
 .../selftests/net/af_unix/scm_rights.c        | 108 ++++++++++++++++++
 3 files changed, 161 insertions(+), 28 deletions(-)

-- 
2.43.0

