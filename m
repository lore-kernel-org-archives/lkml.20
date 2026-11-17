Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887414;
	b=RQgaU+bqVnnRm2P793NBs13PRJvy9sTLaDnzG5y/E0jnVRk8K2b+JWGXqPGoOGsduweo
	 iMnRpQ4TgLPU1jpxKHDmKHg3Od/iaoMFoJfCm537mIkg+CrLNS7DnIzkeTQLmGhOHBv4R
	 cXBixAVYj45Ism/son+n26plqvuOZX3M6UpKBo4RT0UKaCbFKj6rdBBv718cE9iq474mH
	 h9L0kszpffAPjgx+8VRke5F/j79ytgK8j7oSAcKsx9RGkCKpgZhXsZXOx4Lr/nqF9t/JM
	 f9ej8067UIHdtvdc2i3nKH6pStLwypUkwNJyNIzRNK0Nc7skdnfDJzXJ5J1VNc68rUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=LOoNOnATt95HfTbuHjeUZKrmhPL7FnCynFFlsveEyZ4=;
	b=0UN/EKMODyvHyBHAZuYiynDm7LlF2cqhsaFiN4obimWicdKY2kpAlUQHq3nsaEJT+kIP
	 /5hX9BelBt1A/L0crcnD28Zw2oDsIIXWTZ4JvxfC7+8S0+U/qiNkBBeWszjXsRVgSBVob
	 +laKbIfZaiOwSxxs6d7fMt+IvydzEy7ei5T7v+S/c0aaMDjq56EiCsHcg6USmWrDfNUsD
	 adLQDcswQipPRiGSynlQ+bnc3Xm5ECRAIKNbK1/ziasUuZ6CCk1ScHOfS2SbKPjN3eQOV
	 o6kMwalSehYbKYVpIFP7cMaEAV9qIJ/nMa6b0WiJtXuaVtUmMJ+f375VAj290ImrB5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKahpC9z;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3F4606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3F4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKahpC9z
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso5304429c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887412; x=1795492212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOoNOnATt95HfTbuHjeUZKrmhPL7FnCynFFlsveEyZ4=;
        b=vKahpC9z4zXsPVil5aOTXJcx35DZauHTt1wHOPxzzmnUR2HZjJod3TEZ22RtXXEFzv
         MUMNN31nuJScfj22Eu7r0XNsUI7MsQuhuM/CiZ7JnBeUZ0plR4zf9NC3wCVk7zpl2a8P
         GU3Y48e8D/e+8IH8bTn2NV1iIrhH6ilLCEwxdFBexfgV5CN7t9PjC9bUAH/Hj7TmeR9/
         LzK8kKBP2bf0E2hPN5lG+8TJhjwOISjEKwpwachfhzVmJofEhf1l2qU3slJ6I8fvp4iR
         TojInpQZl3aojVzO38N4+0grQT80wEFd/0CCyoY00DCTpWpxf4BisHJPv5XwSNuJ9tog
         o+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887412; x=1795492212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOoNOnATt95HfTbuHjeUZKrmhPL7FnCynFFlsveEyZ4=;
        b=zDOUdv9n/aG7q7EnqnXNPA40H3t2B00fautP5cJXD5KEk24/VAmQU2m2te7dbyojXh
         dRzCizYC4PFqaTKJDRiMaF6OoMe2JhPfwYUSM3z/IQZ58DYSsaFY4N9yaP31Z9mBp+2m
         pb2HI9hUjhiRZr9uEmTJGIPVivkqkEhMcc88HsxilIX/4Ur4uWkHba0Q2CRnTonNqpvL
         HGHHZReHLkZXOFlbgKJ+a8IwndCeW9QmUMSDmeSl3KgZ6kD52deL93q7jwVTKG3F/82k
         A8Rvg7eqmqj+00u4XNVoX/3tuHCvN9QL2gOeaILTewnvlu10NJ3ui9U0/jAqtw5yYJR7
         OI7w==
X-Gm-Message-State: APuU4Z8OoOAefl+/3j5gWa0inS0i/snv+bpU007sSFm43fotGZabbmT1
	+/r/RK5PiJnhAJo/urlApjCmMmLvzMOMi2nnrsKMYw3brA20Ex7yC3Ic
X-Gm-Gg: AYBFou0gtW5V1yM6FbWewM5Z/j5SB1E8dLZB0/Gc2L6bQbgzpEf8z3Lm88A3sErJoCJ
	2HCKQvJdiY3wc4BMNkN9xXummwt5kL3QNPkLmUlKMQdr+9RBsFKthQxAdwbsLEvq+Mq8LeVf1ll
	V43i+g1Ur7Op2RrdmbsxNM47pdGULoDUGfqZm2FBrAaBj47DyD04v9mCAX6iA9t2o7TDdqMjOoN
	Gq5SIIzmzd4dEUeAJ1bC/uUWDWfvrnjz6pMOTq6Xo1Yu11zSCoPCifDlbg0WJDWQg23wexsdvkU
	Al1gZHE2Eqfq5sQNA+btn8/uGkIGFGHjEVR0VItiYtPJW6Iw63JfvFQ28vBFkkkJXu933dIe8at
	M55NNOwsLNg+RysPqKBPYXOfAkmPbMujrnrWIKm2OkpfPrQyejmY2nW3GJfCuz1iMrSIXDoGuCB
	sXOdNO6BKL+k0i9kcaOOi1OCYesnwVb657YbJTofFaBDHmghVKPhFQYJFb3EJBq06WxiXmTHaL0
	O/TOdvWCOoyCJ039WUnQwapWqZAKRcCHJ7osYCs4Ls4Hp9TzTod/uWsbQ3dNcjOr5ASzmdGs0ZB
	HjFXF9Mx+3G3hpZNXF7l6U33nMw=
X-Received: by 2002:a05:7022:3b87:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5030d2bf7mr12705249c88.33.1794887412161;
        Mon, 16 Nov 2026 19:50:12 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm36666360c88.6.2026.11.16.19.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:50:11 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7D82B420B801; Tue, 17 Nov 2026 10:50:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	NeilBrown <neil@brown.name>,
	Eric Sandeen <sandeen@redhat.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] fs: porting: Retitle
Date: Tue, 17 Nov 2026 10:50:04 +0700
Message-ID: <20261117035004.12262-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=bagasdotme@gmail.com; h=from:subject; bh=EDshUAUUgNEFJDafoIdKOxSbO0GYM1siJAlD4D9V22k=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDFm/z+VX+H/Pj99z8cEFO94N6ZKi92J2TXv76Xa89cZJV 0u28/hf6ihlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBE6ooYGTpOPPfn7EvN2/Lk 7KPMdVL8F955fmJvyrHRWxK3N3vCt1KG/xWJ6++zdvMr9i8qz5/w/0HsC5Xr/HWToj8oJa9qrFx UyQUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

porting.rst is a technical reference on what changes to the fs subsystem
(since 2.5.0), not the whole kernel as the existing title may imply.

Retitle it.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/porting.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index c38f5df755bb50..dd5a55e68ba7b6 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1,6 +1,8 @@
-====================
-Changes since 2.5.0:
-====================
+=============================
+Filesystems API Porting Guide
+=============================
+
+This document details changes to the filesystem subsystem.
 
 ---
 

base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
-- 
An old man doll... just what I always wanted! - Clara

