Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847321A3A80
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226936; cv=none; b=TynkNucNHz/WkqNbtZ1uYGGGIw6Dpn5ytua1AuYOeIttxOZvfBrliXH+GDmyi8VFqqBiftSGXhhNXLg5lLrPqOsl9pbgN72Tws3PqGG9uEqCAVQGuJ0tkbgkAl1SoKTu83YyIiP28qZA5TvRHKIt/9YcXZVFuITha0iaE0VsBj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226936; c=relaxed/simple;
	bh=ooeLktLlgv5ipoC6vY3L+P+LoVJc8wd6r9b4126KwO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4PE8VoDlhnpGO7KUD4s8gBMMqtySaR2u/vPH24uXjvcv0skNd6Y6VHjeV7OkYRJwICobP0m9OXwX7I0jr26DQC7Sc7MF4iLxtO3QjGMFJTxm5130oLPQ7OqDhSpe0SQGbC07vmdC8/4PyUEQpqpcMTaJuu5YVI28+RamoXPaA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=ifQN69z7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="ifQN69z7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso10151105ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790226933; x=1790831733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MJJXLu5JWmqzN8gvpfOKuAAfjxmxpsaGArkxyS3jzc=;
        b=ifQN69z7Ey8x5LGWBH6b+lkcu7IkT8vasi7lQ96+4ylwvG7wYT39elpxUI5BUAvACp
         9Q8i3UdIUiK8qXpHQLhWJZWSxiWZE1ZJ85/bSjHEnpz9BxxM1CkLYqou91dz600h1wRK
         vWbslCfjctjWZwgTypkKbzOHihDdGdVX1e/hGIhrxS9QBeB8L5XN3bcrtMrE6FGnyIaR
         bBysvMfA7JbYbtHYOzksZugigpon+6a7MHoFnWV46P2sHpLdbVj6R4IScgYU32SNrxj2
         8elHBOTOUWTKoznnEXZCumVQvtjxpsaIj7uxyimcxHzFUdPkowM1NjLuNM+AtgSD8HlM
         Ng4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226933; x=1790831733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MJJXLu5JWmqzN8gvpfOKuAAfjxmxpsaGArkxyS3jzc=;
        b=uwYK8ft8rLg4beqPly/cK8PMlEYz5+TC1oQ3xsfrnR2fEQ7OE31DE/qwL4dadOOZWK
         06Co62CAXJSYlaymz4e/Ogv5/Ux9fi4WurNHjbC43VES5o/bL3DVACBStmPtccySdzH3
         7TlCcz/3aCHMpMSqCy7Lb9f6mxxnEhxP0v1RPug2B5VJxwyP0flvbT9pb3w8z3naQ7f6
         LEre9UEZpDiTDuxeMfWWUqw29szMNDta4YRRsIOipwUulOw+WMDIGwr2y0CjPf6yJ2C8
         6Xk2bFVTGJbUd6Y2L1UeRCogEmDPIK5Wl5xOfbbQSlpCGarH4PyLl1Z2ZG2mMqJSCa6C
         GQ0g==
X-Gm-Message-State: AFuF++n913xLzbnJxzL7u1aTierQDw1wEy5v1180/w03AynP9BBiBiCO
	4r2m3naMyYpw+48vljgjJkpSvRg742WOGvAjMsMsYIENBmqWiV6lPqrqItzlUDYzLrEP
X-Gm-Gg: AYBFou1+Oeiv08YQTJrQCE/uIsfMThSVie16bquA9FfAytxADaZvac7pHbUVSS7lR4l
	uz5KuJeAxRrU7PAMY77SzunUGX38TCKWDzX+NQmgohwgZdh8d3xuSfj8iP4HmzjTT5LajlAhLC4
	hLpJ8HCex3/OfiBybfPPcR1XxuR/DJCkVlw7ZDZiUsZ+RmxT1UXRajPa6QRQTk374BVhZMguss2
	0aPbh2dt3RD9OoZQ2GaNk5BYLE2w0mjlplgBQB7MjGtKVaOG1/XMTJb4XOvRokvB+WWzYZksxdZ
	NcFZkbYG7HmBwzcBpkfDecTHpY427KFRhQ65TxBiJIr/kZJ1BbVOWA2Kt2CIwrRazAPD16G2edh
	3yWq0CnNYapcxtdtGyfTtTVAwk1MjuKjL33dxoILLw3BbOT8I0pkMsQOwlIhyfpVCk2THTYeJgR
	8d3PfPP4yOeTUDEXO2a95MPZzy99oET+AMo7PVzFvc4okHxzkf4WlsBsM6JPaUNoMbsv44+Zxnh
	Vb/YBs3k6ysi5aCNPULNXd6PpdZFA==
X-Received: by 2002:a17:903:1447:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2df7e11d07fmr11774385ad.32.1790226933498;
        Wed, 23 Sep 2026 22:15:33 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a7b48sm20062485ad.23.2026.09.23.22.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 22:15:31 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	kuniyu@google.com,
	willemb@google.com,
	kees@kernel.org,
	richardbgobert@gmail.com,
	zihanx@nebusec.ai
Subject: [PATCH net v6 0/1] net: gso: limit recursive IP-in-IP segmentation
Date: Thu, 24 Sep 2026 05:15:20 +0000
Message-ID: <20260924051521.32568-1-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux kernel maintainers,

This reroll uses IP_TUNNEL_RECURSION_LIMIT directly for the shared
IPv4/IPv6 GSO recursion check and adds the requested Closes tag.

The v5 cover letter has the bug details, PoC, and validation evidence:
https://lore.kernel.org/all/cover.1790157745.git.zihanx@nebusec.ai/

The v6 code was rebuilt and the PoC was rerun on x86_64. The BPF/veth
path sent 65536 bytes; tracefs observed six inet_gso_segment() entries,
with the sixth returning -EINVAL. The UID 65534 namespace-only path
completed with depth 180, gso_size 1400, and sendmsg() returning 3676.
No stack-guard, BUG, Oops, or panic was observed. IPv6 was build-enabled
but was not separately exercised at runtime.

Best regards,
Zihan Xi

Zihan Xi (1):
  net: gso: limit recursive IP-in-IP segmentation

 include/net/gso.h      | 8 ++++++++
 net/core/gso.c         | 1 +
 net/ipv4/af_inet.c     | 3 +++
 net/ipv6/ip6_offload.c | 4 ++++
 4 files changed, 16 insertions(+)

-- 
2.25.1
