Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB2D3A7F70
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616385; cv=none; b=a6Rc3d9Xm7XQuS73OnZDF7TGruLSvbA+RTn1J5tAPix6QU4SCtgVhQ5qqnYy/ApwosSUjndYumVSQAdP6BLW3J4r0wKc2UUmD6xXGTGQNeFHNPqDanQneIWE2OX1XOEgzEHlr4j6KtXbN9uHi6z1rpVem+ifYpPPlosY+SZ4Y+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616385; c=relaxed/simple;
	bh=hzCEfXOexl9lRk2jtF0ia/E/xsY7QrkIlPOExC7aqJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqMMHM35kWnf3onBiXv6Slvg012+sgySWRE8g4i8/xGDrSRWCI/24LL0WPngkf4PCL+G5WdkhqxPUn05MORHSjAqVm+FbmQLOBAVXDIfPgryvQPd8h5K243bAhtMm1CDmJlSZK/OGThnDH7ZW1G8EbyftFgningx0WThwd9rmRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=mvUmGv6a; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="mvUmGv6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789616377;
	bh=wC4+AS6cPqlTramKIs63D4nQLoV2MgyPPge8BR8mEm0=;
	h=From:Subject:Date:Message-ID;
	b=mvUmGv6affwKKq1iy5KufZImX25G1GzWVA4NXVlunPK9M5wF25CZWaWCPBZFhxOdF
	 VU09/6aBqRGWOiRZBjWADTSKU5qo79jHsSfBbu6qP+mTG75rCL0NHqk7vJqpGxksRv
	 Wm//y6UHR7k3HIO0R98Bp7haABL9lA9BTi4T087A=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AAB60ED00004DB2; Thu, 17 Sep 2026 11:39:27 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5344464456699
X-SMAIL-UIID: 092D2B0F0001456290E05F3D0F9D0B68-20260917-113927-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Date: Thu, 17 Sep 2026 11:39:24 +0800
Message-ID: <20260917033925.981926-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
References: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream f6e7b42bf05b

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..a52ede408f1c 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -455,6 +455,9 @@ ecryptfs_verify_auth_tok_from_key(struct key *auth_tok_key,
 {
 	int rc = 0;
 
+	if (auth_tok_key->datalen < sizeof(**auth_tok))
+		return -EINVAL;
+
 	(*auth_tok) = ecryptfs_get_key_payload_data(auth_tok_key);
 	if (IS_ERR(*auth_tok)) {
 		rc = PTR_ERR(*auth_tok);
