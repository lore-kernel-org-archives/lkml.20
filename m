Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2553B05AF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830929; cv=none; b=N/W86OeIDS8s6D0g0KU/KeZ+wBmnMOyDv4IxMrsDp0RTCB//H8s5Ux4WnS+XiKpEmlRXSCX6u+vv0PXQ0cqf+6HYpsHv4gelsZ2FWJHpV58rIUGWKVZW1b+oryWCmq5Z9nd1mwc9muY+WCa+TCpXhLvgAx04TrnnqrDO1RBRg2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830929; c=relaxed/simple;
	bh=MgWJ382pjc3YS/Qw5ey/WYCKDvLWKApPLBvDgAkCkd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLwxMfpy1ZHsITRhj6dAZD2XcbgtbwgebXlmzWiJWlWIEjMWQ8iiffEn2Fm1NjLX40A76Yx760zbWcyV10DzZjr/LHSlnrgaKllLXgArASNHtoD78LmLcq/SPe/4t/hTqkirw9VVrpE5YU7eul/Y4ufpoTx2okhhyU8mWAJA0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdbaUwuH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdbaUwuH"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso1728452a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830926; x=1792435726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9MMUbPpbght9b1/Zf38zQrWJao2xsdGIO4miz4qhmM=;
        b=RdbaUwuHIu6iNJGzZh2xdR3mcbEjQev7Yjr1pT/aRT9QEe+1ClJZ9ldQSyix+3RRYE
         wRI2KIXuDI7pK7r9Exdm0mHYiYotpOJa7MuOHj3mOLbkjKNapkMPbNYJ5+YTZa6xR0j6
         MA+7xoZ3CKYNPP0EL1Srr/M7kqN8oW66iIfZZwKX2dnNHdWDv6nCk/f2h3ELvJD9We55
         LENISBn+kLSxxdaitnLTnkCJ7tjMaHQeW2r6cHDFMINy/mnsAeIlKBnZaOdey034EXgf
         kxgw2hC/18SCJAFJ3Yc9D9p13zyYzxTH8G+XdyrEXyTorkX+gOR+UB1BfmygDq+Iz8nN
         ywtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830926; x=1792435726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9MMUbPpbght9b1/Zf38zQrWJao2xsdGIO4miz4qhmM=;
        b=j16TU1kR5qp1ngtaUvwfnQpzR5hY3ndscvPWHB1MnsQqeUGLoDZCNLKhGuc+9DB527
         Xg0IhotJ96BqCyEZIFCTNaRS29fuYWUQWsMWkTVv6o4WVg3sT8wnsDjk6o0i1a39+hVc
         ge9bnTenX0bvKvjjyuTL8vw7ayPO5k9bY/0t1Z5G/JCQYnP6ipLvxfiquqgixLHeV7V7
         donLRHv82T4iwKmEfqC3fvgFpwkATZyQIYh2RXeUYuDpKqplIztQacbB2h7ENLXkEVyq
         cFOcnU8yMQouKaniOOm2dnCHUNkCS/NtYvKXcSbHJK0icjDSBoYwuCvUzw2p+psy/2SF
         gaLw==
X-Gm-Message-State: AFq9FYKR1pL0KbbskRu8h8rtstEH5TEha1IJyY5uFrI6tcCEp0iEgvhp
	1mk2Go9bTx8hSJeLrKcf5vXKbPXt9lFbML1utfc1OgPrTp9/c1ydaE1V
X-Gm-Gg: AYBFou0UpkixvS3NKenWV3JyXfpsHttkq8OPyZRgj5MTvDBPuZHa6a8T3waMXS4Vonn
	z8t5Q78xxtF4AQoO/a+8W6V+DtyegXv/6vDdLMZNeLFYZaZXP0mKKaIuxXywA+nG/16ZkMWWqlD
	cRnNKh+RTw9EeQsmqgmyVkAnGFeY7capt0drfkGOBYLQ0kitcxj9cwdXHLWY7xxIhBqOkvTuAZP
	iSabFANXuN4IwLHpOVGXgcoGVIT0nXiXmx8kZkNqvKv39Hr+o0PwiVPSTY5cQR3RsvRI0lVPdEU
	Qj8bmZTvd+2SnG9HigHUC+iSGo951oPLHnxpBg6e78xU7WDLbjgt0HDa6QXXYSRdZyQS/uwmu0B
	/Ul6f7QHXBHdlrgjMPK58e27/vNhK2qBfl4lcNzOBRStGnIYGB6jZWUbE1lc5hbs1A/HXSXrLrC
	ZPh3F+r9JJYFlAPyCqGbNMpRI9mGkgNdWcr+Oa3SLtLE41tpzhLed5sJyEAS+TLr5nBMbbxYC3k
	77GUdSancmp8ceo9r7ubTSskoFpXORBHpMD/SRC
X-Received: by 2002:a17:907:608f:b0:c2e:33f5:766d with SMTP id a640c23a62f3a-c31a9d0fceemr1026790066b.4.1791830926364;
        Mon, 12 Oct 2026 11:48:46 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa5aa7sm488517666b.55.2026.10.12.11.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:48:44 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 1/8] sparc64: return from the generic clear_page implementation
Date: Mon, 12 Oct 2026 20:48:02 +0200
Message-ID: <20261012184826.986050-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012184826.986050-1-linmag7@gmail.com>
References: <20261012184826.986050-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GENclear_page falls through into generic_patch_pageops after clearing
its page. The patcher then rewrites kernel text on each invocation.
Return to the caller once the clear loop completes, as GENcopy_page does.
This affects processors using the generic page-operation fallback.

Fixes: 6c70b6fc7b6f ("[SPARC64]: Do not assume sun4v chips have load-twin/store-init support.")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/lib/GENpage.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sparc/lib/GENpage.S b/arch/sparc/lib/GENpage.S
index c143c4d1de3f..6ce11108e143 100644
--- a/arch/sparc/lib/GENpage.S
+++ b/arch/sparc/lib/GENpage.S
@@ -48,6 +48,9 @@ GENclear_user_page:
 	bne,pt	%xcc, 1b
 	 add	%o0, 64, %o0
 
+	retl
+	 nop
+
 #define BRANCH_ALWAYS	0x10680000
 #define NOP		0x01000000
 #define GEN_DO_PATCH(OLD, NEW)	\
