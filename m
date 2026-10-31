Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793425605;
	b=aYvx2WzUV8GI25SwndDMIC/Zt9nmrPVjml4O4ITs/f/dv5z6L1NTe5Rq/1J3fmotfsC6
	 B1i8NLbUFcSkBvT2F+oWJPzIyONTo8g2/Q3TVkebF9AKGlQ+WoHc9ZKT+yA6Wg9+WyWQ3
	 pLQFJx7oWJ2MaqK+QtUkaD2trVkIh4oJspVtSTy4E/B+ZYZoQcqu8odJ8UzX/9N4UWIgi
	 dXXXM3iQC3aPj+zJ+2lVRtUgE/DFghH9EP+LLtZTQ+5z2gkgKpptE54dqFsM4So8Jl1yq
	 cbs5EhaHiesk7E7x9ghgJQFLUZT8Y1g1NKGx3PznU3LnhYfOsiEvrUFPjFwfbOZm+rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793425605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LjZWE7cPzqPANeXKx2eAoJh/8Vehaw21VR2TNABJYHw=;
	b=bi8Jn/f/IGb8SqjLXP+XLCZRHBlnSwiEDUcOTIRGo8yLpHr1rH7xeWl7iD28C6A73zPd
	 G4Bzl1XUqDizBfXCPxDmQlWV5sey5yxxaMkePYq32qsW2OIekid5bCndl3PYPj71ajZPm
	 G3pw5kopcQFadBZbHBZHBQXxUtTDpaQCsAxYAjTrjASuCKZDzZT+YwL+YG8CdeQzzB/2W
	 YqIZF31VLxZbezRjx5iRcycbRJh2UyaMPjpbvtWfXmpvIOMCA6S8T2/Hf6aHreSu4pFfg
	 F06R/fqf4UQPqwoWVMYwiuwlj1oi2NCmhBQvqTesq1VN/tgTkTrlKl82LeM/GDNOH0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLzH1RsH;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0BB606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLzH1RsH
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2426620eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793425604; x=1794030404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjZWE7cPzqPANeXKx2eAoJh/8Vehaw21VR2TNABJYHw=;
        b=JLzH1RsHDyrTpVcZFailTP5nj9hFV8aGheePuCk4Cmr6l0H2VeIdo7DhZ37o8d+FJc
         1c6NO519zIXYMyV1z2Evt9ezMzyrd9Bk4zOkqFgpEOTvl9Etc3qtmIDn2ijcx2PkMk+I
         2gwREocv/ey3grgxLp5eVr3OtJW7+4zEcTocj9BCWDn0gx3cxPM+Q+aMDL2AiCRjIVjB
         JfO3ujUjtmSN4yxyGru8mXvkTLOEN7rOSmZp9hq1QJEHRv466f2gGdUQSPk/po++2eQ3
         cVB37oQSEMBJ4mhITFUOqTJzOPdbO+unaIi7+AH6ry77Qnv4NE8hHe7lcP8YoqGR7Iv0
         l3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793425604; x=1794030404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjZWE7cPzqPANeXKx2eAoJh/8Vehaw21VR2TNABJYHw=;
        b=hdEg9SCs1Ewd7DKf87h25JxxymviUVQJrPi40tX3/AZap/raxUU37RkG4FGanFeupH
         Eoxnf+oniLf+Em44WRfsxv/UlbaeILQanBPbIleEF4w2EqlEogyTIaRexOJCHeR2B19N
         d+JeQe+otM5JyPLpK4JFo6pxFuP5kv3U2dTqTrpu0KvayKSwXRBiRUi1etbJ4PqiY4az
         U09jrFBRMbI40T1iyMI5j7+f3C9070I3kXVorTcJKFz26eyuMXr86UFM3K8mi08BAewM
         CHIAD6HP5C1/f3pkWXY7j7ptq8YpaOBVjOb77XPBT/Mge+zME1PFHJSLRSW/1HKQpArf
         khKw==
X-Forwarded-Encrypted: i=1; AKwUvBz6bwKRycC4tydQglB/3w0INQ+zR1E+YK4W7sgr1KRcolynWR7X33qSgQAaz/kXvTCiw08w50+9awauRD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKik3cr+jah3Iz+5nUWwWvNZGBdjQp/f97s9XjLUv9SIEcY3MMK
	A1LZwx49Inuo/dcx6zpEZ6ZhwdyOnJl0gtMyJf6vXBMXYX9zpqW8VVad
X-Gm-Gg: AYBFou1hmDC8lXVUtSMNSqHcT8rFhxWzhAWEfKCTOBLdt7xSP/5fByUWVgAuY7V1rPI
	eRQB7jm92SIZK1F2tN7/ZvSiEBB5yeb/c+y2Yew4cCgIlrMev1nl4aZZyy9ZmmIvq/88QXRkI2N
	bav49e3pNTVxBoefi3kMYpFYTejPq/vG7458jgf8sQazKLN7GYurNthu6cX61K+6Q8na+gFX66Z
	10+eGaC+8iyqo27BVCy/3BuQGye2xYR1s7iyWr166xyWWAOosg3Gku4igNSTLBdgfxGs65ekFLZ
	kvJRrCKUQ6AE44WDvFmTuKPz1lfzKQ5TNOEoS6+Ov7fIJqPWUTNLP7Zy6z90ptTx9GH9zdB2Mur
	RRqiEvKWOMzjcKT+zrnFM7wqN40vmh4eMiZGdpepXgdBfIcS8uGe75yT/Fnu6MOfkHGvMYkI6ti
	E67bRzdGRSa4D3+VT4IeUURdnUEwmbxrWzTa5COwyCj5M5D37g1sMT+VF/rPPcN6BXsiRl9jzds
	cnuUbIIiLwv+a8JQ4xHO6uKIBSAD865qz6a+obwOFYf/gatTf051uLjavqjQH1bjgV2v0gwPMvy
	rms8av/osb2q4ibKtml1rMKqCY2NeyY3YfZ+wOCQmC1nFmSCgXNgkS6/VFVSOY4FSaBg7Nv+8gM
	jdhii7lKvr8dtPBGrZkpC7E7NlP80HXYa/jkFC3LG8fqVbdno/oLSXkzS7ha1nOWsNApOGqisfC
	iuywqeo30yBa/Xuhjpc4E=
X-Received: by 2002:a05:7300:cf92:b0:35d:ea6f:b85e with SMTP id 5a478bee46e88-36a42225501mr6499164eec.1.1793425603691;
        Fri, 30 Oct 2026 22:46:43 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429018casm11668877eec.14.2026.10.30.22.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:46:43 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] genetlink: Reject joining multicast groups no family owns
Date: Sat, 31 Oct 2026 05:46:31 +0000
Message-Id: <20261031054632.3697295-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261031054632.3697295-1-anilkaushikwireless@gmail.com>
References: <20261031054632.3697295-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
Nothing is ever sent to such a group, so joining it has no use.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: e03781879a0d ("drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group")
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 net/netlink/genetlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..f038f04ef4ea 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -1825,7 +1825,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1841,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

