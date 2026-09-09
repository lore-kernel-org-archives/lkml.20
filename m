Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C457D217
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960785; cv=none; b=Ks68KvvRLe1BdVT8XTmtTOS58YDcYo/kotwJq9Vj1iOsx1y9OrcfR5rxuVE5nPz3YB5gDHvEdp3VQHaWPoU9StVjAr5NIpVxZnvOc+qvfkrGY3AXTJTzNxRSWw2LviEMv5kny81NH9dPobKifnZrWv6pFOMbdEU7PHfBsAL3QgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960785; c=relaxed/simple;
	bh=n7BwLR8vVeSP7BQUeGCqwE2IwAkiiSZQRz5EdOjjFL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poQ1VX1mc6YdWBguBlFWVN3wMynCpm9xV/V6wyuHEa2dAhz2Q0PDNYc/mUjVypf9PBdkWWwiTaAqXKih68nORAK8nqlyv+gJ5mGcE7csUVD4riSfNjmGJD9PnVyMnXGSraMWPtLif6U2fjP6hPMpY+qb9eHlaURq/eUn7XH+P0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es6FwusF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es6FwusF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dd020a2e44so5390175ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960781; x=1789565581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haXVv7k48B6R2bnuYsrQ/CNSi4SRFJHWdVJePl8DmGI=;
        b=es6FwusF9tmU5iELSd08gM0kQDcQgOMOHtRn/wCJRS72Cvcg9tLZ4K3NDL/lPjTixN
         POojZMO4Ag7DXjGjDqlCjZp/tr7cVQPS6or//heqsJeJ49fgfqliDddcslZUhlGSXMll
         JO+fmwSluBrJfr816DgsXlTFuQVoOXX1CJYNpWGXLHOjpZylMnUcJE51zadh+KZ3QAVB
         SMeknSuZraPOyuIx357feZOovhuXw3DyM7jWQtQs7GkybMfTUr16aFTI0o9NAHgkAPXK
         P06ZGeushX9xpZeg0q1/fzxRK/PGtTtonuojeimz24AYcBcPpOCiwsR4cduK8/n8B80i
         M1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960781; x=1789565581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haXVv7k48B6R2bnuYsrQ/CNSi4SRFJHWdVJePl8DmGI=;
        b=r+VNkp132NyiNoMVgSGCz1c+XKOaDqrMSrsFwG4x0912a7vUU+A/cw3s4zQT9lUN82
         NPqrpCNEhLudaBLU1/3Tz9ey91QFLgl5zJcbzslpuuQQUJ82QvI4a1CDZ5SY5bx+u+Ob
         pb+izH0ZX/fi8to6Ko/xMSVephD+WF+OLA2ZzpMiOhFkZiGCJShVsRTP2y3WYR7sZADf
         kyfyGkG1ux/u7I1QEjkMHUS0HiotHT6MT2XYSNpsmwACYokjRzArPz4ehBWhHswAanqE
         KGSqMoEMqqsd4NmnnSLFUNQEZukH/ZB/KYwJl2Lz3eMX2wSp7ei/JQkVBAwrjhOYnDyJ
         KRSg==
X-Forwarded-Encrypted: i=1; AKwUvBxaUonnqBVRqRhona6Gxptw4PXhxNf0oCmzBiVbFWpwz528FdbfVqV3H9EmvRfMbf0nuAmk+VOm5GvvbHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mUZy3ovFrscYONHodn8NmV96Fg+69Gf+4XzdCMvD0+ZUS2gQ+A
	fTWSsJQIosD3raTMzfYP1KEE2FXnQvWhAqJr7DnOvfYcaNHQFdJ4peiT
X-Gm-Gg: AYBFou2xCu/LO6izscNCkV7b1sRWU5kI0BioyiYErGNKBWv8M8foW3vluXcUSz/mBl4
	+CZsm2J7kjI/2o6Le0Q8eBUdffcCYqi2QixH0tP6z0/QlPlqqZs55IN9UaZmHLY46RCxeU2viLP
	+WrXmuKkiwv0OKjqFm4bpNlqOfVKFPBiGbGnSCzRwafwZLDwIdBrR4/jLwhfQU0y4aUtvJ9ji4L
	OGXxqvF/d7X2K7dSJiGYRgjzOCowuSlkHTwNvAqYi8WeVypmQDTcvTrZYkz54bIckGuffnndB2E
	2bqPAGODMQYg32ZAtLbBJDJNs57muWTWg11Sqmu9Yf4zY+PIABI+xQ4EqFDs9xigljK14Ql7lfn
	Jomm0kLk12Pe88c8dM+prmO5TGV5a2MNmOAYH9CwFDh1O5P8NL9tdUOjKsD0rvMY1JIGLHrHyKt
	jgVMebwt4+OhGxXzhbMGkIXP5KaV0p00x/on5k5rXs0zySRbyMLtLmoXHrJzUj8ntrLS+cKiw7V
	U0SntJ2FAdHCWXT6ofWfOFz0f18j3YTjRDrbhaT+fxASL65yZbJ0OCiseOIoQA=
X-Received: by 2002:a17:903:1acf:b0:2d8:da29:da41 with SMTP id d9443c01a7336-2db127509bemr560812515ad.15.1788960781157;
        Wed, 09 Sep 2026 06:33:01 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72564185ad.80.2026.09.09.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:33:00 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Wed,  9 Sep 2026 22:32:44 +0900
Message-ID: <20260909133247.113923-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909133247.113923-1-sigefriedhyy@gmail.com>
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")
Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..17ead2203451 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -119,7 +119,7 @@ attribute-sets:
         type: u32
       -
         name: target-netnsid
-        type: binary
+        type: s32
       -
         name: proto
         type: u8
-- 
2.43.0

