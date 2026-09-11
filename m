Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3262543712D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123878; cv=none; b=Bs+4R6EeO2veKQ1pWbYHADK1EXPe2rZz3WmxaAviQhUp9XQMxbMfXDCzBeXKUqsAOIK9PeBzx31kbsKzSc8v4fjHLhqSqzbL0RJ4OsJnsHt+A2huBY3BTPnR4mvHbjTZqLJvQi0CVSkOCHn/SRknUnwLeQBueTyTqs5Op9UqgRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123878; c=relaxed/simple;
	bh=tUSiW1gzmcpR51eI+ftkT0cq87urkbDu1YspEiOmjAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8WsGtxayV7BVKgbZXkn9KDemHxTi0kQP045gArqd+W34VRI2y8NDf6JRlD6BznZTYVrQB3my43jrC/ZYiQmXZvpmCQGt/vhq1IqAc9qi3yOmhSvZs7udQPdYynp+r6fpu/SE9YLmwY2v9RsPe1TbGSGcQP9k9caYuEWWT8d3os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSvBVO/H; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSvBVO/H"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so275172a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123876; x=1789728676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dy3tPiCmSC6ac2E9SuBSByLfrAsVVo0KwKwuZ8yfA3I=;
        b=qSvBVO/HtLiTvZM1LsrL9FHKC9u5U9o7eW2GW28bNRhwyuBPPuDQAaE5DysJmMuSKO
         udal2XWtTqwFPTZ54T3NWcqIV+9MeBgE600oPPduQPauqxZuzsQy4Z5FXLuHAT67SJ/9
         1Sn7TrUvOKFK6FIPddGwsL8bbcyhvqvqkHMEwls8yjyY0F5e+XINsASLaq1GMppfXcvO
         Y0Ykjdrm4N5NRZSNzZHPqQI4WfYJAnP0wQ8uw/Er+FUZC//BjIolso+yR89fray3pmFA
         dXUn5Qjrf8sv+hEf7KCNC52xPndtwTB3nocHAN+vCt4GwowoAup3f8MOKxZsxWkgieZs
         AW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123876; x=1789728676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dy3tPiCmSC6ac2E9SuBSByLfrAsVVo0KwKwuZ8yfA3I=;
        b=BgVXuMnJ0qv6m91QyKl1M4q9I8pJ+avYzsyv1VZY9YUwQZXspvWanNfw1QRqnISTl+
         0zxBBIHAa93oL30a9x/ucL7YeKq+77M1adm0mxwW+lWXZOadMQGe4z7964w5RlcDtXPY
         a+97CAEZXJ4ktYDBW73uEVFz82vTs+F8c0SQAydyEjdCu1zeNtzGBGz/VNUb4yn2K/Ke
         jY39vTCR4I23eUk0nsDKGBoPlHJ2UtaIJc0+SUhoSeZJ962pUFzXhucX5ccaPxGmBJof
         45nZ3Oyyyh51oVc85kyUpbRvRi2a4m7HPa+eJnWCfbFm5+cDVTzHiFxv2kf9rvuk9SVP
         XWfg==
X-Forwarded-Encrypted: i=1; AKwUvBwFvkmC6z2f5YsjrmNACMGd+CcTbGTF04hNtZHOvO5WP551EH8L2cwyDoQv3mSHFZmXAiKWkM+nKMTExRk=@vger.kernel.org
X-Gm-Message-State: AFuF++k4LQZKVc2jiP6J/nteFjUiMfwk2cSw/gG1pA1P2Zo8ZaGdxqHW
	8Az4TTUDJDMEcoN2Vt/c24W9VlWP4uzORUDevvGrRoZPXxjUJ73WJkGt
X-Gm-Gg: AYBFou2QQr9KsmbL3fsjnn7JeQl2SC4vFdnGerN+u5eEl95/Dqioee15aGwkf1yaKjT
	8CMehgE44i+YzN3TiOW8dsSAjPJkbG28h7rAHM7p6Py97PXjAcIjH5NbsNrVzbcPl1nsp5nh3w9
	GumPsFxrwArtAzFBQlqCOPpm3MgFLJiW6IHWr2aQFBfiCgGa7km7jDsucGszrQB/awZkgZ6S/aQ
	ZxZK7GaoNv4aW0UhkNwyR6+UlFImSVHXK6YSr9mOF7un95+0vQRTBKNF4KcWe0c6Mqs9iGD6xf5
	eLr2YceUDDtHexr5Oqg+8+ny3XCvhuZsTT2EIs+lf1voDQO8h8CNfAt6Hsv6pXLV4bUp6qDJAb8
	dvDDYa2UJ3AhMg5fytUAIbl71A4eY7CU1REkd3b8BO3vM23YpDQHuZMhobvCL+ZbnJnTUAuY61Z
	FdtSGdzSdi1hi6n/erGzkyRo6fCSMcJXYn6c6pGF3yNwUbf+3Tn5doCU8u7T/x2PhBG/lPI7XTr
	FB/wNHXgFS3pL5LfJMyVCmAw+kC5zBmqlDzaAe0lrU8tlzCTg53Qbyn8zgwlg==
X-Received: by 2002:a17:90b:578f:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39d97eea626mr3603449a91.4.1789123876272;
        Fri, 11 Sep 2026 03:51:16 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:f7e5:8b43:47c8:5245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm4876004a91.1.2026.09.11.03.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:51:15 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
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
Subject: [PATCH net-next v4 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Fri, 11 Sep 2026 19:51:00 +0900
Message-ID: <20260911105103.7771-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911105103.7771-1-sigefriedhyy@gmail.com>
References: <20260911105103.7771-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

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

