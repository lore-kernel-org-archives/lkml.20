Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413918;
	b=V/Nv1wPIRM/KgBX/1xyzDB7mM4DGd/VbxxlSJIgfe1lXqh8quFQphpLHHajCtEoUxOc0
	 b7d3AuzWeOoThn2MgSI8UPyU8IC/4MxsLV4C8ao+Hgb8kEOez4MDNAYpPkHjtMEo39qke
	 X0idl7Eg3+ff6A2dt5dSzlzfjfXupyoGlvOnrvcAfUhA9u5dCzlJh74CYeHCEC/7YnzcH
	 uKiYE4gtzOORMjED7wfwgji+dqfQP0W0Qr9n8XPzRoHrNEHsy42MEVXhNhLQ4tEfhDPot
	 f9bW/RwkqA/98LC3jmIUFA3ytBAfU4bF7dHjOufsXLsKshydDixfOPbbJ63rd9AswpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=th4q9b08lCLfMlfvam+Sv2PUGdwUZSEvcq1PM3dYcnM=;
	b=dXV3Y/N0qB+QBv9xxB8RY8F9/YN0WWVJwunrL47qzwEZkn0DZ1B2fnpY1GFIvExZyrGT
	 F5pXdnGzP/FBvSmAEqBsRIgzx1ZY7Uoy0RAK1ufoH4fJ4yfQqupg6Sy7K5K4kDSLYUgT3
	 L7NW7vtmKRSZgoXHAylvmy8JaCwuWpHXszaPTiH5fFfvlqRbCefBVavTBJYVNVVAqjuMt
	 kZLpa49BtS3NUlx/8ddVjAGjFp3B4pkIoV+ipqtZghTu9397vaOHJIDAvsH5M4pfWd90Q
	 ff248eJp856bUfq/kbsfRNqLEhstP9AVNEac9e6D8pLVNu+x20betK1rpdNRnQj/xew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=RXGhKNJV;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C9606A889
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB0C9606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=RXGhKNJV
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso2433513f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413916; x=1795018716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th4q9b08lCLfMlfvam+Sv2PUGdwUZSEvcq1PM3dYcnM=;
        b=RXGhKNJVl1lv5SHKHOJa/S6JDrV8Sp20C/S2L9eAEz/GwvO9FFqGvg+hqQeTBNImNv
         9mCebGGOeLY4rMcUFsR+BUx7/yVL+ZuB96xAIjCLBvVU7/5YLJXZb9rWUBgFK1KBfh9T
         XbVYvEH8+jwQUhVtF5nk/sd43TdWD9t73HlAanUJDzaBrfU7jzzDGaX5N8tMRgTch3I+
         5PBXLDn94OFgCx8/kLnwt/jjsJng0zh2xGyt4Unc8jAZifcjPQGkLWvSe6Y/a/gtCyLa
         unfkx/D1eHjK7NcoIgmwkXgrcdled0Aze/hMHK7GO97zGSEo/jTnnyPh39iq93B/cydT
         MT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413916; x=1795018716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=th4q9b08lCLfMlfvam+Sv2PUGdwUZSEvcq1PM3dYcnM=;
        b=okLpQx3fB2i4GmAmgRjVDSVx7S+TdfEggU8jnNirP62CgmgkCjiZwqwLIJMfJYSKDj
         NllJh6YVpwd3BRz6xJ2qI5jP+kv0MX2xBUk4DHFUUvt4RkvNRo/Za+PwIVa4Eb7wLejs
         dRrKkcikAHedBTG4pMBB0jC7zT8dP4HnA6qXZ1TKm6Ah9yxm9zB3qLPYSqptHTSG6yLC
         26pCAfOp5A+wKfj98EAZMEPS33NZ8VISR2JvcFDqL/zF3Nd2Y45eHrHZNgdKNZiBFQu3
         /c4n+dxcezcRCTbPa80yW+chVcA0vkjQ+MuzwB75NafMqz1r81jWENzj6x6AIVPU8IV7
         5pCg==
X-Forwarded-Encrypted: i=1; AL+hErGeJabxktI4gPokB6XpkOmW0cUaqAgNajnNrGoJSuTKiddeVzBFV/yZZPM8qrBV2td2jG4zhxOgFnAS0Uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hsm/0dOz2Lo4adrpUlRKgaI4SOaEhI1Yp0ge23M2pDAWY6WaZ
	ObEgdu9dM79URSG54hOniR8FGIr9jKPZg8IPX9grN1yY8RsPYFTg6DS8JSli1+FKpqs=
X-Gm-Gg: AYBFou38Oh4Nh2Hg9r71LhoPAmL9emFZnuOt5xGdfScUrSJerD43X8zU9XiC2bt4PQM
	4xEgOuRlLOc6KX9l+3KukIF7aSCbjo99ILAi9Qno+0y4qc4Na517WerDANOfPkA43FgXTw3ssSk
	mj1rrDXXxZ5eCDqtVsI8dqoXvH77o8cse6oGA4tLL8IhQbJndyLwkx+FVK+KKQiF5dzoNX0RoIY
	LliAeq4uroqDdoq5C+d4wMoDz2Rej3bXDIEQJ10xnGMFv3ns42gMBFlR7EwJLM5EqpdfLlIJi4U
	A7jxGtb2QBRz1Xcv9MfHpx786Ch+JLxmHvXdOnSSTL3WBCxlyFrh9y3KzXdLVpqmKU1Coe2S5A6
	NArjRQwALt8ubLQdKcQZp40L8BjjXUSWVqdYQZIV7nncxpRZuAgK4fnAJ/Zri/7DVS7dJlgbrBx
	NinBpdDEJwsDwMbaUa614dmKwZbxw85di7n8BaN8XWsYDKA4fuVV12cjSmeUCLn2q6dOeEEJXQY
	ZhQaz5Y8v00GUViSKcDkGwW448xdWsSXi2ySR+o87jMVqwjZNV7hyoMe8SwGFMXBL/JkyfRrjPc
	eXwf7Mrq9NuaivZDcmunHKyKXTUFfsknXs62rcqh6CsFSJjqjdcupE88U+MnfsV4QhIDSrDbbXd
	PGWykvRXoRenE6LKqjQmcGtgfAoy+NA==
X-Received: by 2002:a5d:5d13:0:b0:48e:2108:4d28 with SMTP id ffacd0b85a97d-499c60275ebmr6470199f8f.13.1794413916177;
        Wed, 11 Nov 2026 08:18:36 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:35 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/9] ceph: fix mdsmap use-after-free in debugfs mdsmap_show()
Date: Wed, 11 Nov 2026 17:18:23 +0100
Message-ID: <20261111161830.1336485-3-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
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

mdsmap_show() walks mdsc->mdsmap without holding mdsc->mutex, but
ceph_mdsc_handle_mdsmap() replaces the mdsmap and frees the old one
under that mutex.  Reading the debugfs "mdsmap" file while an MDS
changes state can therefore access freed memory, including the m_info
array.

Hold mdsc->mutex while printing the map.

Fixes: 76aa844d5b2f ("ceph: debugfs")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/debugfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ceph/debugfs.c b/fs/ceph/debugfs.c
index 6a9a5551d9d7..01c9f1896aa1 100644
--- a/fs/ceph/debugfs.c
+++ b/fs/ceph/debugfs.c
@@ -59,11 +59,17 @@ static int mdsmap_show(struct seq_file *s, void *p)
 {
 	int i;
 	struct ceph_fs_client *fsc = s->private;
+	struct ceph_mds_client *mdsc = fsc->mdsc;
 	struct ceph_mdsmap *mdsmap;
 
-	if (!fsc->mdsc || !fsc->mdsc->mdsmap)
+	if (!mdsc)
 		return 0;
-	mdsmap = fsc->mdsc->mdsmap;
+
+	/* ceph_mdsc_handle_mdsmap() replaces and frees the mdsmap */
+	mutex_lock(&mdsc->mutex);
+	mdsmap = mdsc->mdsmap;
+	if (!mdsmap)
+		goto out;
 	seq_printf(s, "epoch %d\n", mdsmap->m_epoch);
 	seq_printf(s, "root %d\n", mdsmap->m_root);
 	seq_printf(s, "max_mds %d\n", mdsmap->m_max_mds);
@@ -76,6 +82,8 @@ static int mdsmap_show(struct seq_file *s, void *p)
 			       ceph_pr_addr(addr),
 			       ceph_mds_state_name(state));
 	}
+out:
+	mutex_unlock(&mdsc->mutex);
 	return 0;
 }
 
-- 
2.53.0

