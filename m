Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430959;
	b=l+AILMgbWlMFydb7jaTlNlDe0Lz4RcWn+HOnbkCsAoxby9+Gpu6ay0W1BAMu3DcTG9Up
	 QO1hr94aRPYA3loM1GNU0h6WKDLquPSXuvx5wniwzpmQWWaZTiOIWU43/w57yBFOqf1S/
	 AT6M4AKCHxbqNt+D53nn4nLUrQ+cYcA8ITQK6TOvL9pBDNFX6lKkKRRbcJoOqrGVxd/wa
	 yWjQ5iq0IKkt93IMBqD/a/TcyG3fzjvB0CCCHh7xzfeRX7vgY81ciTStlZ2NXaQtOzPmb
	 1Rj2rh9h8wc/Or2xx23m44ARTAOk2Y0FHbw0kJlVzkyIrbjRU4ysH0iWcW+g9RcuKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430959;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=o4VAib4sWZJVwEdVvn2PsUOlwVmvvkfLEzixgLq3/94=;
	b=wLVl8uE5px6v7HKDaWqAQ28oewlRir5RSIvfbcXsCKop9m6Yk/p54MjsXPnXrkdNmoV/
	 jTreAcagQHKcca3JptHMuGcMOX9d9gxKAT3pmnW5O3Hwqz1JHPxjXmz85P602wHjLu8Ty
	 rDEA6qWFenht7aO9YHIwFDyqVGVjseuYDjAt2UzwaIPc7/ArPjOSGbw0hTl5BOOnxAnfW
	 yMY+gWEnGK+5IGvGpIrH6Aqt7nGAJN6+adzVscY445laiDM3dgo634uuI17khC++4skK5
	 NQ7C1L6wHfREPRGJfRtvwApjKOITP5HgBAcOLkqOKRVkw8xT5dD0dDpWUWmG2rYFD3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=h-partners.com;
	spf=pass smtp.mailfrom=h-partners.com;
	dkim=pass header.d=h-partners.com header.i=@h-partners.com header.a=rsa-sha256 header.s=dkim header.b=T8n7s3Zi;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F3606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=h-partners.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=h-partners.com header.i=@h-partners.com header.a=rsa-sha256 header.s=dkim header.b=T8n7s3Zi
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=o4VAib4sWZJVwEdVvn2PsUOlwVmvvkfLEzixgLq3/94=;
	b=T8n7s3ZilCeQ/6cccoko5kLoYxL8PSYdLMBz9S8Y6j6gYtpKr8476jizDkAYB9vokyT7DNWbq
	Ekm/0c4gme8GAxQEn7TTCBAJjR3nso1nCAEVKhgzYLJZIBmr/3cl2bf1HwhqN1uYG28zCj886gb
	JcTExZ014FcqJYmFQxM+HXE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jGq4h3hWzz12LCd;
	Sat, 31 Oct 2026 15:15:48 +0800 (CST)
Received: from kwepemr100001.china.huawei.com (unknown [7.202.195.168])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FD464057F;
	Sat, 31 Oct 2026 15:15:50 +0800 (CST)
Received: from huawei.com (10.50.159.234) by kwepemr100001.china.huawei.com
 (7.202.195.168) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 15:15:49 +0800
From: xietangxin <xietangxin@h-partners.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
CC: <dm-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>, gaoxingwang
	<gaoxingwang1@huawei.com>, huyizhen <huyizhen2@huawei.com>, xietangxin
	<xietangxin@h-partners.com>
Subject: [PATCH dm] dm-crypt: reject integrity_key_size with non-authenc AEAD ciphers
Date: Sat, 31 Oct 2026 15:15:08 +0800
Message-ID: <20261031071508.1999545-1-xietangxin@h-partners.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100001.china.huawei.com (7.202.195.168)

When integrity_key_size parameter is paired with a pure AEAD cipher that
is not an authenc composite, crypt_ctr_auth_cipher() returns 0 early
without allocating cc->authenc_key, but cc->key_mac_size remains
non-zero because CRYPT_KEY_MAC_SIZE_SET was set during option parsing.
As a result crypt_copy_authenckey() dereferences NULL crashes the kernel.

Reject the contradictory configuration explicitly instead of silently
returning 0, so userspace gets a clear -EINVAL.

Fixes: 4441686b24a1 ("dm-crypt: Allow to specify the integrity key size as option")
Cc: stable@vger.kernel.org
Reported-by: syzbot+ff132cb52bce4f44ecc9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ff132cb52bce4f44ecc9
Assisted-by: LLM
Signed-off-by: xietangxin <xietangxin@h-partners.com>
---
 drivers/md/dm-crypt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 045face6924b..1cab614884b7 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2847,8 +2847,11 @@ static int crypt_ctr_auth_cipher(struct crypt_config *cc, char *cipher_api)
 	char *start, *end, *mac_alg = NULL;
 	struct crypto_ahash *mac;
 
-	if (!strstarts(cipher_api, "authenc("))
+	if (!strstarts(cipher_api, "authenc(")) {
+		if (test_bit(CRYPT_KEY_MAC_SIZE_SET, &cc->cipher_flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	start = strchr(cipher_api, '(');
 	end = strchr(cipher_api, ',');
-- 
2.43.0

