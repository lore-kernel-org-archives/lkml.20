Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDEB31D362
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773290; cv=none; b=fETYUEielMSnPiHg/ViXXtbiCd2mRYxfDFWKvjskhTVfGS5sFg7yZd4Z8f24KTz87zABdnNqADfI9Cy2IQKEwO3V61Lj5eHiTvBa42N+5c8ccWRY545OhsfHvjfzYWUrO3rbQmlzl1ijT9ixsg/e6MF0OI9fpd8R+np3ONtS4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773290; c=relaxed/simple;
	bh=wV1N0EMtebqy+ViUTneYqlfzv0kZ43eOEZ5LQbIFAjY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a4GW6BmHH2RxUXXztlFb0dJ490y85X2SagrmMTy81pJCJmLQjC4E7BnKnBTVkHTVJAqulWQDMGQOOXyHV4U64RJBIbPgZRAGxm9aSDLRh9t9yRpRRFcO6+egVsQWMouhyiIu/IQ3hvezqR5cuTRolACHguyA5tjeOcn7jlJW0XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsW03kCj; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsW03kCj"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535a54bed9so1987746eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773288; x=1792378088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uP+7PH/D8Dh+nlraV4xc/jtLrXAcsGGaqtx5xWCT1ME=;
        b=IsW03kCjrqG8gsW79hxVdCzY/nFBqhBfS7z+iv+8e3sk+FO28kAGX4XDI+Zz9E05jq
         QCLY1XpINSku9ugXSHn40sEDkY4NhCdGl44EVO37YST5qrM85l8i7aqmG40hBqr4aRlO
         rFoUVUOBoCpDuEqFoZpBI/jR6uGspP6N3+/QT5sIRnaa20WpxOdn+717dshqvOp0O1Zo
         gyoIlinc4CuBlkT9st7y3a3kfpSUZTdLIuH548k3Lttctg6Vi7bhvWpDqj6lwsU0qWLn
         ClaQY0F71+9P2mw9d6G8zgcoQc3EsqfosOee7UnVKKe2jSFVy2YKLC3o0EN4rZiUkc2m
         X3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773288; x=1792378088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP+7PH/D8Dh+nlraV4xc/jtLrXAcsGGaqtx5xWCT1ME=;
        b=Y8JLbs+VLnIMPEr2M1i6Apd9ng3ITfjT/tjGripXbTfucSua460mJBYIw9Ea1ULLrE
         TQ311Gpuz5Yg6sD0B2YQNSDPTZPW3oKzSWdaTc9JEZDtwAoJQqLE1Q5w9ttx4cMsE2wk
         aPNAn4nsLzoEaH4nOvSDNaQS6K/54s+YVq3o73NWazyajzcq3LlU/tCkeZD+RrDt3mxh
         OxLcF4AtmDE18hyBOzqleztOCYsry+3yV7rjFU45jvIev0ikfCNXZzg31TziIrUC690e
         l4diX+Pdbk2aAggM5K4pIysh3HzFTojgWtluiKICcnB74OxAw7Jk8bx1zZs4feZU5AdS
         9eUQ==
X-Forwarded-Encrypted: i=1; AKwUvByJDJ5PmIOPBIIQ45WBzh5BOlcsG729Ff00KOm/pHKkc4e5Nfjx7sx6gsJmI4H8HE1It40gpMMWSDDRUvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWxc65qred3uIQlnsv4x0k3VOF9WpdxeBni9WD9Hd5Ptbn2KyY
	E+DDO3OQ7tySNyRQQBXD0t3mNX8wXvM7bsZkE9l+H6GY8M0MkJKuaXao
X-Gm-Gg: AYBFou3g8OB8VJml8Qwv1HNvb42bse5BudBkW/TmIueYyKGyEtwYw/aWll3MGdcHf5M
	n3r6HaMjmGU3UCEmYs9jRazYSBIWlVmgZi9OOzHaqeYYPjveUpp5EWE+nskJqAwbnJmRK7C0EVy
	j9rZ062GSIEM8P9xVsYa1eDf72wJaKKfuIFhKOb7FC3FO9C3VUEJ2p3ATvpWkn42Dv3cFM/4Lbq
	LGOtGiPD9w88qBMeomGf/j6uR3gXW4feEJmEvTutpAf+L8VFldOq9XCkFE6xoqWnkdUK5taXrMf
	3IviraIPxW5Ow99NsLytMM/eOsSZTnT0bqxxFzKuYrIofXQFY49hjDx6Q+XQV35EbRJV/ZPUs2v
	ZOoH1/xOYifplskfpj/a8qCviJxvo572ubrxbBGV8kiUZp++8E4qxiVOUPf8K3/vNqTd096OJ0t
	t9X7OMZ/uLGwJcVNdSz9sIAdzSqykUEb7bEB23ldeGRmKiFlS3KKrtgDIgRM13e0gJmveSZoKoH
	9Sfk1AzkXaYhCNQ0o0V0FUjdHFjFLVZSJyoxJp5BkgaK23ozk+J495RC07o7y2dlcSs30hZM4Y2
	eQFXuaapGjFPg1qBJ8z3146e7YJj8BI2dcwpTOsSp3j5yvYDk1nHjg==
X-Received: by 2002:a05:7300:e9d6:10b0:359:bdc8:c9d5 with SMTP id 5a478bee46e88-359bdd83104mr4936824eec.21.1791773287658;
        Sun, 11 Oct 2026 19:48:07 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm26075299eec.6.2026.10.11.19.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:48:07 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v5 0/3] gtp: ynl spec for the GTP netlink family, a reply-command fix, and a selftest
Date: Mon, 12 Oct 2026 02:47:57 +0000
Message-Id: <20261012024800.400616-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a ynl spec for the gtp genetlink family, a small driver fix
it needed, and a selftest.

Patch 1: the GET and dump replies carried the family id in the command
field, so ynl dropped them. Use GTP_CMD_GETPDP instead.
Patch 2: the spec (NEWPDP/DELPDP/GETPDP/ECHOREQ), no uapi change.
Patch 3: a selftest that adds, dumps and deletes PDP contexts.

The multicast notifications are not in the spec: they reuse the request
command values, which the ynl C generator can't express with the
current uapi header. I can look at generator support as a follow-up.

v5:
 - ynl: add CFLAGS_gtp so the generated code builds with older headers
 - spec: doc fixes (notifications, version 0, echoreq ms-address,
   ms-addr6 /64), min-len for the IPv6 attributes
 - selftest: only skip when GTP is unavailable, close the ynl handle
v4:
 - spec: request/reply attributes now match the handlers
 - selftest: fix the gtp.ko autoload crash, check ENOENT, delete by
   TEI and by MS address

v4: https://lore.kernel.org/netdev/20261010105740.223992-1-anilkaushikwireless@gmail.com/
v3: https://lore.kernel.org/netdev/20261009060615.4177402-1-anilkaushikwireless@gmail.com/
v2: https://lore.kernel.org/netdev/20261008181031.4129029-1-anilkaushikwireless@gmail.com/

Anil Kaushik (3):
  gtp: set a valid genl command in PDP context get and dump replies
  netlink: specs: add genetlink-legacy spec for GTP
  selftests: net: add a test for the gtp netlink family

 Documentation/netlink/specs/gtp.yaml          | 183 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 drivers/net/gtp.c                             |   4 +-
 tools/net/ynl/Makefile.deps                   |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/gtp.py            | 122 ++++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   8 +-
 9 files changed, 322 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/netlink/specs/gtp.yaml
 create mode 100755 tools/testing/selftests/net/gtp.py

-- 
2.25.1

