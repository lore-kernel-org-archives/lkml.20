Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991255;
	b=D68+eQtL3eB7pa/2d68yku3pRvshVqMAo9G2GGA3dWzm/88AUCq9c9zJ8C/Z/B5Pto5H
	 0ULtNzx6NciTyspplHZ9y8FggzgUaeRx8KHA1KMRVUTVHE3mawG/uVVWB72+X8NdlEnwU
	 sIWvMUzaB58Gh+T9CwtDoSxx8yHDdHEgWlUA/nv0wD+VxXN+bWYh61/RDcX45AU7HANRC
	 FR7XEstVaYul4QmJL1d8gUybRnydiHoL+IfqGJJLKu0e9MW9QCFznUQEHITrx2sFTijqz
	 szF4cyKjx0xZlQ+X5AdPiesg4VF9eIOBfPh9WfSVqlHl9ulYQvmEO8+1QCD0uyTU/OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qeGlqVH5MhUCNQ0F6mtAxIbc+A9NtKYDR+yZ3OWP3Kc=;
	b=qzABYFTRXpomou/5TSfpO6ZNG6A9TqJQUtflCigzf7uZfB5N2T4teQ3s/vRSO1+/mGqu
	 ZYPxyROoeNmezRIpjBq2yLDxkLi1TZfuR0abQbgcIucgsQ/JGiwR/vbBdi5HQ15CgyRFl
	 T5YudVUpH87bsdiNIZBJi53YHLQCTMpNPA9LaUKZiYb9q6IzO9pE5PoWm4aP/QmewLixj
	 Kp7wHbCFoimrnhvHZnG6kQEricEZdVxwymLEqJUH6E7QL7Z/TLcVsYZXdqCiOYTxfCuP9
	 CnDdvpUCUtl4XjjrbFtMeYXCnOVN8ksY4Ca18lDCKJOpJZbRNMzF4oMt3jl6bdsrdog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVhfqmF4;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E09606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E09606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVhfqmF4
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-85e1040ca0dso431863a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793991253; x=1794596053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qeGlqVH5MhUCNQ0F6mtAxIbc+A9NtKYDR+yZ3OWP3Kc=;
        b=IVhfqmF4RKEln+uHmglFlblQIElDPe7IjKKUpOh6vJbnFTomdzbuBCuN/pU/swFIX1
         +w0DHeDLmrtDOYC7YHQkuccQDTWs87hkzppBwsNKlZ5sNsRmW6Zk91Y/CjsjQ5fQXjFn
         1pPP3bqOyjWQfmPvZiqIfHp8vLcY+Roelfc3zJ5uAivAQReKvrJKgEtpuEN77vKCSKE5
         KOO+lYhDUGgoRV3WhZruxHqikILXp/K0iPrUa4Zfx9j31zN+QipV95xorFquuf651OMa
         mpiqtVE9o98H0Sxdt8CM8Ah7y8+CsOI+mJQxCERc8uIHzIBj2Lj9SRj8mPlQ7CdnBW79
         jP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991253; x=1794596053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeGlqVH5MhUCNQ0F6mtAxIbc+A9NtKYDR+yZ3OWP3Kc=;
        b=xL23wN4QN4uH/0Lia55Rg8WJ0zTfMHP09uqIE7oBAeEQPniDxYMoxWQbSRnjRgKAZt
         F8Bd69Urlp9MNc5EgAiBYLWT4UPXcd5mfwewirqX6XFO8o0LYGck8ldKvb3prIFlmIUq
         D3WvtpFJxjpWcqmTCR8T5uIK9ZkudplapbxrsQfO3Y2VLjpyTO+PO5L7iePqj8LC2gnx
         RE0JWD5JdneaAQ0Ba0Tx+UMLdyZZUL0CEYXZLQTk/sFs3CTLIXMjRzkAXUq0sW2M8eF3
         2ffpuq+bmS5wcOEDQiUzQgNeZqzu2/odplCzeq8+yYEt8ofSy+dz7JeFR7M+TaALQ6X6
         m1Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxysFC3HJERlJrgvM4dYOcXXY/KiRZFQUhO1dBFTnU0SwDxKdkFnIwzev8efdj5TYxxCHTrohgPSpMReBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TFWGCFk3B/BsfonX+Ax+XtqH04dR758xPK4J9fC80JlZIx3XR
	9fGbrzJzGCQY12oNIT5eTInJZyaxGx/gikkLs/+8brec5U7UTPA1GsXk
X-Gm-Gg: AYBFou3hwi9GJc8WDp+ZiABCut7xluVrh0vbhRjE82mznauj5Ke/VcdhWtSs3I+aDGo
	aSr7iTh9KDOMy9wEBzm2ak74DuQ3kAXfq1hZj/c6dmbgSOI7ShgQKoCmmfP6jDkPG6BiQNuMJbu
	HCfbpxlDeV63BK8tkH1Jh64eInS+NjBOfaU5+SWQUbVfLyRF39wPZcsbiWzxdLB/quk9YP9dfWu
	o7mSQabCHLlfQNs5OuZwfYBGK+c/3e4KQqD4mFFBI8Mz2tx0SfYyoT0td2rp8qpDtn44DwEqgQS
	5ci8O6zPBFjJFJae3eeKoim0mu0S+QB4Ujn7mZ7QcbYYVEl9pRwXgjei/8fVu8K4TT2v5/J9lkZ
	Aoaeew0LdjLAfdpvmOU+S/4NqGdjZay4wIWNxKu26Q2j0a/NBwGB0hlo1f7UOH2Em7cAN7dLzvc
	7pTGJK5/Z7Jf8XDPQTHIwcF0uc2x2gYA78ndse3ggjHuTqARtOEjPh4jqfaviWqQX+O7o2KqCPm
	K7oTCFhY62UKfjLaqZJd5adCs1CGQC7V9aPNAooPeUisiHy9Hp2CA9OBsUDulZT188s0BhE6QZV
	eqFPPpuAMviZ+EOx8B5o6TVrQS8GyDkiKVIaVBw4hiDQ2bRUFJAB6tpSjParQ7FfRSSP
X-Received: by 2002:a05:6830:b13:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-85f1cfa0bbbmr3686468a34.16.1793991253299;
        Fri, 06 Nov 2026 10:54:13 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.34])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm2504620a34.12.2026.11.06.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:54:12 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: john.johansen@canonical.com,
	john@apparmor.net,
	georgia.garcia@canonical.com
Cc: apparmor@lists.ubuntu.com,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] apparmor: fix out-of-bounds read of xmatch perms during exec attachment
Date: Sat,  7 Nov 2026 02:54:06 +0800
Message-ID: <20261106185406.3332779-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

verify_profile() validates the accept table indexes of the file
and policy dfas, but never of the attach xmatch dfa. When a policy
carries an explicit xmatch perms table, the blob accept values are
used as indexes into that table unchecked. At exec time,
aa_lookup_perms() uses one as an index into the xmatch perms array
with no bounds check.

The index is a full 32-bit value from the blob, so the read can be
placed gigabytes past the table, across the entire direct map. The
bytes read are interpreted as the allow/deny bits of the exec
request, and the transition outcome is observable by the task,
turning the bug into a bit-per-query read oracle over kernel
memory. An index pointing at unmapped memory oopses in
find_attach() at exec time. E.g. on mainline v7.4-rc1 (KASAN
build):

    BUG: KASAN: slab-out-of-bounds in find_attach+0xc50/0xfe0
    Read of size 4 at addr ffff88810fb2f934 by task su/495
    CPU: 5 UID: 1000 PID: 495 Comm: su
    Call Trace:
     kasan_report
     find_attach
     profile_transition
     apparmor_bprm_creds_for_exec
     bprm_execve
     __x64_sys_execve

Run verify_dfa_accept_index() on the attach xmatch dfa in
verify_profile(), the same check the file and policy dfas already
get.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 6f442d42c0d89 ("apparmor: fix profile verification and enable it")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 security/apparmor/policy_unpack.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 35dfa3b451f39..054aad13f5e48 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -1593,6 +1593,15 @@ static int verify_profile(struct aa_profile *profile)
 		return -EPROTO;
 	}
 
+	if (profile->attach.xmatch->dfa &&
+	    !verify_dfa_accept_index(profile->attach.xmatch->dfa,
+				     profile->attach.xmatch->size)) {
+		audit_iface(profile, NULL, NULL,
+			    "Unpack: xmatch Invalid named transition", NULL,
+			    -EPROTO);
+		return -EPROTO;
+	}
+
 	if (!verify_perms(rules->file)) {
 		audit_iface(profile, NULL, NULL,
 			    "Unpack: Invalid perm index", NULL, -EPROTO);
-- 
2.43.7

