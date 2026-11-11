Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413917;
	b=YbJP5A5IznVwCfSi0BU6cj4B5pDQkTvWvn17zdoPfEwfFP2t4lkseEgr0TD5NfbqjIrj
	 QT9HtuJcLsSXt5A8UFautodCiRyyO/NW3r9ssXUvqAU4Jcvt5lxWoHPdbJHW4UZ0ixe4o
	 l7vzqrO10UlC0+CBzF+GBplyDw2Rf5Ct0LOPmXbuxe45g8ZiUzXy46crVHw55vIejN2Lp
	 675m7+/JPmZvEbkAGdhriSPlJicUBmuP6isH+8NYBK35GAXQRX9Ls4ZtmO7zJlMd/Z1EB
	 u4S5qX4qAbSkz5POsAFl/d+u5JAfQHQw34TVc5a3IXa2hguh8TF3vc+1yPYlPl/vxMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PywhPEppgcWI+Me/jVt+CP7Qe/6FQfOUGlT878EeRYg=;
	b=ZMYaE44w+0bXzNs9fpJv9K1tnXBS8bNd1lSPZjbPcDBmZ7x3eaE77Q3PFjaKvJIW/0dK
	 nXCmkw7U1yOTLj52NrlOHt1Bbr1Quci5UHGSch1hSVtmzyrmMU29vocnXtEgN+FvQKcr4
	 fi+uyLuS9SK6U0nACGNca6c09sxq9EUb/0wIXnfF6oKRxVuRMxbt0SH4u8Nj+nRviH4Io
	 V52XrLHWNiy1vUpMdVvo0k7F71AvrJNoVdaWzYpTEYsPe11/VjT919i/30rBqqxeQrfpC
	 70a4CqK98Yq7pb6MbgaJvpAp+PSsOsRP/kOW/siBpkLGDRI0PimUOkhVR2QwKESia5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=MAULci7y;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3CB606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF3CB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=MAULci7y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2013796f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413915; x=1795018715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PywhPEppgcWI+Me/jVt+CP7Qe/6FQfOUGlT878EeRYg=;
        b=MAULci7y91YTKEUFyO/XThAFj2Pe9m5tWcxpxxpPKFaUanSCNrn4fBmKilzd34WSVy
         F1Rl+ozGWD4G5Lrf1+qZs/31vD47Do6X0Px+St1/m7+GMjp3+b06PHGA4G5TDoTHc/Jk
         PlHZOdI0PvQpwMieLqh8X1C8gG6fSmoMHQggRwuvU52FLa5qfw0OX9eY0mWZP+o9x/P4
         7JTJKsWSfHwz1gtTy4+jlmc2v9A4mBHhfHPcwH7NN3ZzhsfHHyk0JVkRMgcdvvnDj6p+
         EmpBTZrZwmTtWi9pjEBzEpowQ4p+LvPs+JzZi0RuNSyAKMd8KZPs4UGDT1678uLXaDDS
         HFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413915; x=1795018715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PywhPEppgcWI+Me/jVt+CP7Qe/6FQfOUGlT878EeRYg=;
        b=Sh7scdX3/2mKVOqISp/vmF4K5VMemj46AAVpGtrIck/qis56nO2q1RYqTReQIybpjC
         +o1uoXUQIJsxv3/ajF62MvJbfqE+uYsFvtoqZreLP/+MdFLlMSpmIh0aMXImFi4X21Gj
         UQzxjfDnDRn+TqKFQpq9mhjRmdeBEXt/+UzciOEh1XDcXgCGAvDyU9XTUQpczIKOfTww
         IKmtVCKtYub3grPyplhi66Z/ZBPgRN79Ug9/E6VR+vj2Udt7qyQoOVb/EMbcXJaRPo+V
         nMrWsZI5Di8+J7mEvDzycvSXNJNHkqOJR7Ec30ch6+zYmJ366YbFF9undlEtGbkwzYQu
         9gCQ==
X-Forwarded-Encrypted: i=1; AL+hErFQAjJWsBT2DJydd7f7wM6iC2u8dDVBbIgTpUb9sKwb1PiT5R1LMp401/wUlLQWv4LXhzFZybxAtb5+PPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e+GAx5D6cZcye3n2mnQF+1nYztFQgjE6yacmz9t7y/XcueGLX
	FUHHBSYM2M/KCnyOL8EWzcAptI1G2cEpGAbHntc7wE4WJWe/Rt02M27ntJSjzc8oPo0=
X-Gm-Gg: AYBFou1dKXx0g65sOh9F8CYKpa+pElNFA6gMFVohf8bupQgHvvr38djVsbsR7vYxH8v
	vJRcpnXyyQ7KCoq4KbaG4htisjCyj2rYbA94fHD1u5ETJuSdKJM5qm2k404RN9+xc8AssFaE+VC
	a4N1Br6oIdZNDwtFtt3cJTDfvnL6zFK42AjIN0/Dp++cehFsh/vfxVi+/jd7Xc5EOJhHZn8pDTw
	EcPiJ31AUy8humvWKU9CEB7QEWZOV2hfmjY4GTz4YJcgxamc4GvRyLEQtANJplTSNvjRdNHyoPK
	MlZt8yU8HKodAFcCp8YUVVDuJZlqgBb9+Rr3TE5jlVCXCaJpTAE0F6WuhmyIDQ34/LVfgBWgC15
	fialMfXcYSZRfKf7p5wtqzZ3DnT5q2F7IMipNJmNQuGAp/CysmhuJ0BK8waEe/Ujq3iHXpJU7Hh
	5XqTXn2syE7rl9gX/DemGXcz62Mdp9aYwirVgh5vfLQUqYHt6zQDvfnKRSMJK1TRTqZyAD3lVQU
	gpJzLDQg7tHy4AOQt0MBcwW3pdxlslH6rRt51D3aeyQSgb7RtbolurJB4Tn/Bu72T0V7VieooFE
	tH+1eH/279juu42LN9vPvFp5sC8boMmLdc/EniYy1EcghXMgKSi26BQhd0rYSR6l2Bl19j0QnJ5
	UxzGY0G6cGsKcRdZ4Kt1vY5NQKN543w==
X-Received: by 2002:a05:6000:2008:b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-499c38bce0cmr5171391f8f.2.1794413915273;
        Wed, 11 Nov 2026 08:18:35 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:34 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/9] ceph: fix mdsmap use-after-free in ceph_statfs()
Date: Wed, 11 Nov 2026 17:18:22 +0100
Message-ID: <20261111161830.1336485-2-max.kellermann@ionos.com>
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

ceph_statfs() reads mdsc->mdsmap without holding mdsc->mutex, but
ceph_mdsc_handle_mdsmap() replaces the mdsmap and frees the old one
under that mutex.  A statfs() racing with an mdsmap update can
therefore read m_num_data_pg_pools from freed memory, and then load
the m_data_pg_pools pointer from it and dereference it.

Any user can call statfs(), and mdsmap updates happen whenever an
MDS changes state.

Read the data pool while holding mdsc->mutex.

Fixes: 06d74376c8af ("ceph: more accurate statfs")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/super.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ceph/super.c b/fs/ceph/super.c
index bb5591c1e154..01f92d77ef45 100644
--- a/fs/ceph/super.c
+++ b/fs/ceph/super.c
@@ -64,6 +64,7 @@ static int ceph_statfs(struct dentry *dentry, struct kstatfs *buf)
 {
 	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(d_inode(dentry));
 	struct ceph_mon_client *monc = &fsc->client->monc;
+	struct ceph_mds_client *mdsc = fsc->mdsc;
 	struct ceph_monmap *monmap;
 	struct ceph_statfs st;
 	int i, err;
@@ -73,11 +74,14 @@ static int ceph_statfs(struct dentry *dentry, struct kstatfs *buf)
 	ceph_blog_enter(fsc, &__ji);
 
 	boutc(fsc->client, "begin\n");
-	if (fsc->mdsc->mdsmap->m_num_data_pg_pools == 1) {
-		data_pool = fsc->mdsc->mdsmap->m_data_pg_pools[0];
-	} else {
+
+	/* ceph_mdsc_handle_mdsmap() replaces and frees the mdsmap */
+	mutex_lock(&mdsc->mutex);
+	if (mdsc->mdsmap->m_num_data_pg_pools == 1)
+		data_pool = mdsc->mdsmap->m_data_pg_pools[0];
+	else
 		data_pool = CEPH_NOPOOL;
-	}
+	mutex_unlock(&mdsc->mutex);
 
 	err = ceph_monc_do_statfs(monc, data_pool, &st);
 	if (err < 0) {
-- 
2.53.0

