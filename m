Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6A52E173D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178318; cv=none; b=bq10JVFc+vksJWpZSxM6y7HkpynrNeCHV8rhFiMKdtswr1w9l0aWRx2xp/lsV1CBkAc5IRb9nbUq60EBpibTtzQxaLdjFClPbHJphJXNaQ1vK4tmfVNJJ0nGZ9K1Qk0SJr8XFPBY/Rranl/iaY1yPAfF00P5X54gdtGpJBsX644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178318; c=relaxed/simple;
	bh=0tbrBdOAFD6j68HR1D9P/i1oHR1VFAhjX4pnHTAvCsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WVIVX6vIiggi2p5JcvuzS7haqv5AOxlhxwiE8KzfEBwq9isH3iOIVXmL2uwRfYC2OhgaNdRhJkW+XOX23REKllv9H6CotT+dkUc/7qSJMcERf2d+qQxkPmzXtOlOFQfUREdzYBipDCFiG+hMo6F85Rt6hjrFJqjX0+Dyc6FrMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnnoocjc; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnnoocjc"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so485846a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791178317; x=1791783117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LSDnu3myMd2V0moRo2OOnX6aRGg9tjowM/h0PhTdhyc=;
        b=dnnoocjciZNZFFPqc7McoUeMcCPrHn9j646Jj5eRRt+qutgEvC08E/P4FM6+4l+K4c
         7HVX0f7/cANeXgSPwPgwT6FMJ93C19hhGE7QYfslUI/UeHAQumXHkF6VGEWY1BW1CXn4
         f6vi0Jou3/xc0R1NSF878/Ts0YOL3fpsCy3rpe5VdHvU4TKM2FYogxvnzdx5vBSKeQ3u
         89EJiCeCTbhvbNeR+W3AujI6LnDtQLeOvNvCt3SVcBLV0TH6QdzGJi7P8dyT6QwPOXWi
         wsPVYkY9AbyEcrvspsalquHLRrNLtqji2vYTb5w7bryYwWVmPvuH03w5FZye7BgZ0oDQ
         HNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791178317; x=1791783117;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LSDnu3myMd2V0moRo2OOnX6aRGg9tjowM/h0PhTdhyc=;
        b=ONlS8GlKdsGdfQznsFwRTceRg0hsOmKHFCnTIwVagRGD5VnLXnq4UP+hcIkIMnJS+2
         7RImzQbhoVPrmXi1MLCPCC/NAXMHQKYMTdtt71j0LD/Ok3tIEPWw85nvB9z1tnT+lCqP
         JMu0W2h7bf00NJYlP0J5xTD1gXagrIDuDXWv5Vb1TpadhFu4Hce1XGOJjX4KKUQ0GAAK
         6I0J/surRsrFtL7OOdwO/Qjh2jjnd4VCglccZ5ijQqnPkXDayxp0tfwlteIBu9OpERSg
         ijHxcgljjBXIylRH+XFAN1o17j2NrHH4N59PNwgScNEhEjg3srvZHCj5sqYNYW+VrZqB
         g+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxWyYYTizG+uXORQvpnfK/5uiBKaT2CrcHJvUv4KJzc7XIhKREHNWp+h+6f8+jd8grylvYq1u1/k01g5OA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQtue2M2QkQ7dSWk8ZZuh588ex8SytmCeb/snsFq9nh/YshgDo
	2Jrc8z/Ln4qZh5ifnrrjQeCX7UZq8N65YFCN4SmixfMrm8U5nv1EMFuP
X-Gm-Gg: AYBFou1FgVd3toIh5FE25ESAaAvPck039INTTCAbgLd34lmpMS6SvZ2M0jqmeWLT4Gf
	UsbnxhiiUnyoOBtYZA9xKuqQ3vVRQ+Rza7qNhVDEpZ0jCWNq2oHuFPOWxx4hTMmpw9s4es+W1l5
	D76UbaH19JEjvBnB2P1KrfFNAmNhZUyfyDnPwJ7fo8+dQ4ZA8cwtNQn18+dO8hcgkvO3erFmaKa
	Pni8xsV3KG+ISsgslEyuuQXYP6DAoLPlhPNc5K1iaidx66r8MZR/8rXtQqhVyfbL7UxsES+RkUw
	uAcoB4jV224iS7BD2FOaHDuAE1iggbUf7EJ9WDXe4qy1qbM/lV2bEKJWsbUNXoWF1XuokJNd/OG
	mMgSV87qQssYuQIkSKHg2/7j9Y3kKvl09lFpfEadRJA+JfaVtV9eMzvASzwh3W8kG+T4U2L8aMZ
	poU2xmye08jlz2FdlY5m706qlZN31mR7NzZnK7SmB3ukNdkHt+tVHXMsx6NfcgRUr1gyuBNec3S
	xYS9ajj
X-Received: by 2002:a17:90b:4e88:b0:3a7:8707:a0b9 with SMTP id 98e67ed59e1d1-3a78707b7bemr2256571a91.31.1791178316571;
        Sun, 04 Oct 2026 22:31:56 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d59f1cdsm9419306a91.0.2026.10.04.22.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 22:31:55 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH net-next 0/2] seg6: skip route refcounts in seg6local
 lookups
Date: Mon, 05 Oct 2026 14:31:52 +0900
Message-Id: <20261005-seg6-lookup-noref-v1-0-092e84774e80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEg2w2oC/yWM0QqCQBBFf0XmuYFdsYX6legh9WpTMSs7qwjiv
 7fl47mXczYyJIHRtdooYRGTqAX8qaLu+dARLH1hql0dvHMNG8bAnxjf88QaEwaG86G5nNvg0FP
 xpjLK+m/eSJFZsWa6H4/N7Qtd/iVp37/OA8iqfwAAAA==
X-Change-ID: 20261004-seg6-lookup-noref-e016495b60ed
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=669;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=0tbrBdOAFD6j68HR1D9P/i1oHR1VFAhjX4pnHTAvCsY=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqwzZJ8jfZ8RN5e8y6cU9FqbcoMtdivDEF/sQEN
 YLAwu6MmAKJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCasM2SQAKCRAq19F1Kl0b
 Te5KEADHafy2gyPRu3MVkrU4W340zB6z2LO+75Jun5eFLji1ZSixqBp/liRDT+Mz9B+nCn1tDVq
 S97ZqdgibxZ1qrCAryZ1rAHATbwvxE1E0mP/N1SHD4mulp3W8JuD05jpZgyBtrXNOLgCoknTRQx
 Lvrh8rEMqLQc//xowC5ElsQX19pICF8luQjeWc3ytQ7X0qlq7hFwP/e7m5EiR3EV6mz1hOifSGS
 le/Ii69dHsc+BT0XVw9ix1jAxdpp/gMsTN7/9Q0dHn3nVYfQjgHKauipjgv8UoG+Mt39UOsumUP
 ZqQznNNUDvW6cPuQtFx9PaIIEv5Ibj9oEjYi4KmDDIMwNOJCEC/R5N9FXQMyZxbvmuDXfoC9bSV
 GaeO+CtPwtxPVl443iUYVNtw4qk4kJybiH7yP09TI8u/HyTiTjCCyoRix52tIagYJeixWuDb5hy
 O6GhC1upxeywutRX+oS15gVenhpeRNWsq/+2KEwAkA8EwtH/yleMdfJdWCQegu++LHA8c68vIs5
 fGyO+OTAeHDQYMcAu89m9XtLQUKq2h/msAcEvb+Drr3baowXWUZGPmKOZIWJaVk+0hA+LmIZg0B
 Wpg0fduJWbDyWOQWg91QTQ2au7+r/U7wxco9proy4cCNuuetL5S7jVrFo/R+hcsfBHgDkD6RVoD
 8PTDY0nw0+I4Bbw==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

seg6local looks up the nexthop of its IPv6 and IPv4 behaviors from the
RCU read-side section of the receive path, yet takes and drops a route
reference for every packet.  Skip the reference, as ip6_route_input()
and ip_rcv_finish() do.

---
Yuya Kusakabe (2):
      seg6: skip the route refcount in seg6_lookup_any_nexthop()
      seg6: skip the route refcount in seg6local IPv4 lookups

 net/ipv6/seg6_local.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: cfb7793d1bc0f7d90571611979654cf1b3886b29
change-id: 20261004-seg6-lookup-noref-e016495b60ed

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

