Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077103;
	b=Zc5EJRqjo9MqdjXS1zvAZt9TueWq5KlprM310RQPgCQ553qQIsrY72EkK2f/XfQ3d9z/
	 LzHPF7ShkMY+jay6qYtuuHXPYiH8OYyNMMy+WmQB4onm8h5f99zNCg/36ILIMnywHBvQd
	 x7Ah9BaVneDupFB9l4dTXPdmPHieOTifXx7u7VP1lEBv/SRNH+63d5WD8y6kAjXpai/17
	 ziFYdoiEBvE+AUcO21Lggakp/hf89P7AHIBrspRLm7HlwEPVI3Q9tC1W1l5prLX5QezO7
	 QhCgHiAHy3D+xT2Ajz9GBEe18ouUrjrcYOhsayHRwvtY3E7Kgnaf7b3L/6RkAQQW/0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fhdhbpDGmd7gIfxOVLBlem2mFmloT/DJ5ctenjojXQM=;
	b=oRfB71xb0ijGrbJ1iWpsBQgZP7gXWOpDyrP1u6yRe9YNM5dYUr++B1kOn5f/b6GBqlhj
	 bl4D5poiqFGjraw+fz+KmusGxsxABrDmNwyu7/wZ/DuMIX8HznZNo041tW8cTd2c5Pclu
	 Q4liqQQNzgNCpFfSqT25tt/WHSwAYcWQaxpJiQ0lxIzDJ7QDCC3M3+s6WdQ+EYHZrWLZW
	 Ztn9mTScxfGnUJTxWLwIkixcjK3dne1TTZAWhPr0ZSQNV/JMjvwa71Oxsf8aD3ARKvgSj
	 oaDqk09Mebv28ar2bmXjWXEHCYlrKltZ6z4NUYRZTeEJegQIbrMKzfy6AlyVd1Q/riQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=GkNciejQ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9345606EEBE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9345606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=GkNciejQ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2683734eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794077102; x=1794681902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhdhbpDGmd7gIfxOVLBlem2mFmloT/DJ5ctenjojXQM=;
        b=GkNciejQJ/Z72Y1u1tTkdWG7r+DlIGafrtg6x1vnSUWnbKDtUfo4oXs8nuXxWCrwuE
         1Dy4hbpxEU32Af0gjzGbD0e2A0xxeEkRgrPUDg8BceJKkqVQ35gtFLG1aIZabKzUWEuL
         yD6pG/+159wzmKJ09bBLUlbQEO7IJQtnE1BpCAw2aE0oIMYk76pwDRK+tIO/8hSm1fO9
         b55XlHUryrYD7WHEQdA9L3ffKEBDpFwDpkdSZd0y90CIVoUyKP6MD75ClHAiwVraWrMh
         R1qBZx9fKz9+Vktmacea83L8gsjhpaWjMn8w941CjassP+0a7V9D2Jnw91zbdqUkRSgk
         7/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794077102; x=1794681902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fhdhbpDGmd7gIfxOVLBlem2mFmloT/DJ5ctenjojXQM=;
        b=eGhEYnLhDc5ihKRcBQgMzy2LOxxo22H2g6itW5JLqU19qlFBVq/D7DT/8LBhLekYQe
         YFC8PdosNJgV1JOmMu/81djV7NA1190yrBdmcE74IrvWY8lsZG13UiCFDW+N27T70YOC
         M57ujK9Wb8Kz8lw6cU9vRdKZiwGzHt9iSgwl21bU8jv2cXI/nJVms703acXcBtIZPq5d
         Zz2ftIxSHT/gH45uRNlFrGIu9DM309nBPJsICZPqiXRr64yV5XGwgzc59IOd2ok1F4ru
         mz2xHLt610TalI2T0HxF05qCwTBaOdI5iUvZCW5mOqxRp9S/CSd0pAwldMj62ETy2LeN
         3hoA==
X-Forwarded-Encrypted: i=1; AL+hErGk8WbH68LgkLOaCS2HZaNMk6FwzlHjZsMSZ0h4Z0mYXkVLw0coI/tXrv7uwf9zqhZC5sED27TGJfitchs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qb931WJuTAksjMoWk248phsPj/UUJDuph0dMJSO6i4Y3Y0lD5
	8mRBLmryX7nvjIW2g7fgZpiELhtGgryXgCt9qVcTb8+O09gy7eS9LRrk1LS8nmP0yhA=
X-Gm-Gg: AYBFou0rvIQ14pYkoOc2XA6MZX0ma1O6qiAqf6U3fFp9cPJSLm+wUy9D0jzkQdRvvpi
	blOXUYxVjuusbZKCB5nFc6jtES+aTUGvbSh6RJEonwSxT0k5pcxambUsLeLIOjbh5SwHHDcHshe
	zVYWOJA3gvgGpr/dEanUCHQbz+J+NwbTb6Cz3kxwdpfy+GUuJCxntWNHUtVEfNDYgAAutVRMJ5H
	W2PwaVpA4cIbv5zFPopXnSoM0DV8n3QM9Qq+i6HMnoHlhzrNT6rSYZVApIta06CTNSwmyex3byU
	teJDpHapO+uzkMOFQ3oaLtmEB7mY7vE5nEJzi6tl4fo9F8EIovMUxcTUl0XA+hSWZ9SzQNN4obI
	s2h+Gy2Jo6OMtxXLdFA63vS9/aCjDCHAL1VM9I2dtkdBrpZ6mGu5XIly90zUtmMwNQJwjq/wJB5
	cvwkP30co2z3omLV5NWIcpQYtuur40Y6YbNVlLL/lUDvTOb55Ilz7tN8Mn3HkhzELneheo3aQPR
	6O8bmim69KdEUZHqlkdAWHAJJ6lANWEMa5125LoFmt17fuKv5IH4I46+mxwDGnK13vfg0ma4Gu/
	pnopHwNFzimiPcXNA9dWKcm2x3eFdLuTxueVo786dvSEDgXIyfp6BJfggvooYAiP7kwZDts=
X-Received: by 2002:a05:7301:1601:b0:36e:dd5:fb08 with SMTP id 5a478bee46e88-36f773f7c7fmr8246456eec.40.1794077102206;
        Sat, 07 Nov 2026 10:45:02 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm17286897eec.9.2026.11.07.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:45:01 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	brett.creeley@amd.com,
	sgoutham@marvell.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org,
	Ido Schimmel <idosch@nvidia.com>,
	Satish Kharat <satishkh@cisco.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH net-next 9/9] MAINTAINERS: amt: cover the offload header and netdevsim provider
Date: Sat,  7 Nov 2026 18:44:37 +0000
Message-ID: <20261107184437.2783174-10-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107184437.2783174-1-omar@blockcast.net>
References: <20261107184437.2783174-1-omar@blockcast.net>
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

The AMT entry does not list include/net/amt_offload.h or the netdevsim
reference provider drivers/net/netdevsim/amt.c, so get_maintainer.pl
does not find the AMT maintainer for changes to either. Add both.
tools/testing/selftests/net/amt_offload.sh is covered by the entry's
amt*.sh pattern, which the IPv6 outer transport series adds.

drivers/net/netdevsim/amt.c stays under the NETDEVSIM entry as well,
through its existing drivers/net/netdevsim/* pattern, so the netdevsim
maintainer is still found for it.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b01fdeee6..f6d5b471f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1404,6 +1404,8 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	drivers/net/netdevsim/amt.c
+F:	include/net/amt_offload.h
 F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
-- 
2.43.0

