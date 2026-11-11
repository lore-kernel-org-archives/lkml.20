Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413920;
	b=y2LZWw90Pn/vZ/vNhQL8zK4pn5l+AeR1WGsb+SKm/3hXLCh5rQoLuJ0h4nLjnmdl+2+n
	 5dZbXpKRbD6nZlFrbUyKb/Z5g4rhIpO6twWEodqIDK+qqPyGvjAg1nYMWLCvrz9QrfM75
	 eMsMgfOsTiilP6Jx7ymbJrvI4oEynd2GQgt1k2ri/2VCHbZFmR5V1nSutcKhEwBrJz0fr
	 6PDnYLcV/n25UGzI5aGdpjjt8mHYbhaXAI4XpaEEIrHqQ+OVnPY8s1TkDHlJTk2IP3eE4
	 zvQIESOqmRHivL5pNDm/+N4x5z3JcMFJZm5Or6RKRGhcUsDhe6CQHR9S+YPtcztoXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oM/6l2zeyiYa7HEKwL18/fyBBln2kYpUTJiHwLiTo84=;
	b=kb3JfYWw3gvEJbzDboepMMFtblnLU32dmP2pHjwb38r4eM65i78JGHYUHP8mJ0+MKmB3
	 hBZqXoEDzhSwbl2A6YIyvcrX93zPPLielbnX0x54O2tkKejhOs0l5ucyjr1AhVpHkn1h4
	 cpAQ9PRT4Hi6rcqGwspfK1odM0d2ciTBLAJGsF95lpXsasVeykXc4aumGFQ1QCav/vfV4
	 PcC2YwAhwYlO7TD6KXG7JvzJyOt+tkyYfpUSJnuqUHbKzrE2gZeg0dpFG1gl42qdEcqQj
	 oiAFFue4KRNR/AMaOYix+uECnq2Av0z53xug6x2KNIErvW08qkwCQ0TN1Y2F9Bs0NvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=ExLC8ry0;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A160A60A2606
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A160A60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=ExLC8ry0
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso2437469f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413918; x=1795018718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oM/6l2zeyiYa7HEKwL18/fyBBln2kYpUTJiHwLiTo84=;
        b=ExLC8ry04gNbzdm24tLh3UFZXQJ6TJH01gda+GcXsaqej5tdZPsNkiqdM6uyRs5I1G
         GEu1GFYAU2GzhquwA3Rvz5MQBofvL6s8Gvtba0o7qo39XNpOg391HOYXtomqgceGl/Wm
         vhKuf996W7fesOBSmrP6cF78g9x2nvX2pZPY10uDJ823xfguO8D82SYjS0mRmDPeG3RJ
         9pBbBFgQkdrNNkSHadG3YLmCd6oAcuo8oqwbgNqZFKGvjzTY0R+pFM5wY4iIJ9rLpoYY
         uxN5T1Gvf0zpwzDIRyKyVUw7BVXH8Dp3BYu23m9jBtCFziMG360GMAXrIAsHRbRMDEgg
         s+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413918; x=1795018718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oM/6l2zeyiYa7HEKwL18/fyBBln2kYpUTJiHwLiTo84=;
        b=gr+zKgQN5BaPDDVOqH53Fe9NuTlObWjWbqJ5Kglbtv8I36fhRH59S5s2bkT3lZ41IT
         U+twqIWaPd8hm2W+xVUbSWrVh4HpOEWuvm1pn5RLn0LEmsudTBcWvgDkr8DIqLWuec6o
         uzAXwoIHYw7E+kHAYy20TQVe5trsdfoBcaOFoTHiXEulpxI1qSt5wXRNZKgX0/iTcdbM
         QAx3heLMU2WjO0OmqA9zj560rS6VBDV8J/QiipFIcaeT5eV/Q2Xt3nkCxGqgrP5peizl
         P7nQIWDCQDsaxF3WENCy446Dkq+Tv9eZJSXmo2ioSkcD0t77Uc2YYnE9ka03aKMrsJoh
         zoGQ==
X-Forwarded-Encrypted: i=1; AL+hErH67TUVzrnrbgWKO1LO5Q5eDmobWbSXgx/XAh3fHL8naRmMKzwKvuOZ9ckvjUW5vD6r7bEItlrLjwEHybA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WklBDUbLV5h9zHsUKddtrO25GDLbuZrciX6P46VV3an0z81Pb
	FiI5q/kwYtkPdw/xXqCyVx8WEee6WFjQUcCnVohqfJG2pHp1ybFwKAl+GbXJUiq7uyw=
X-Gm-Gg: AYBFou3hwyOX87mEc2zZ8cMBypRSwv80gqqmjT3W2d+teVqvoKCD8kpUBlfKdtCauep
	mgKhicVfP1PlMGeQz6ZOLPEI624BKCxeA5pAXdFVp14iXve3y6UIyayVNBpB8CgLQ/b3L2DSMrT
	ZrLe6PCxfclePjSiP0+obi2G3ZPEtbQECf1xkFn3kgR2+9Q6Ms9jQGiZIiTwdivLqn2NEhGsE7T
	KeE1pZss/L1GjWFOuFx8Uy2ADJ8TRep2Gm562c+bJrTPQNtd1FdxlvGvxLQJRNE/frP5UvsOS13
	A5+bao8Qz6oZ/AxyWrI5QrDo3eZoBwhAUxNlvJyS27e1wOpXiTudbi8Lg6FAkhIG9mpzpI7I9Zr
	dbUajT2sP5W/VVgjltM1HjfXdJ6ebzTTEKvZivEczhvcxPNk+TSYfgw3ueTS8rDQYauCXw001S7
	IKWxcS8BO7dCn5p1b1N3/+c6ItpdqyvjkmfDsR6YRssv+K7JWKPMN4ky+7Q0eVMDxfjee1b5sTK
	ckA7n7pYTWeSHYG8TO0SoJ9qIxTUdC21PtlNPBj3ciTx4BZ8AxbSL+KNU9mFqEgqgmi0I4xfWT+
	79pPThOqK3SqDgSeCQZrvvNTFdKOXtKYK3cZ3eRUgm842h7LGmVKxBra5HPLYL1BRBPdcP+j78Y
	gC7nrbAw3wlPJIlRK+LQb+a4vJuwfbw==
X-Received: by 2002:a05:6000:4615:b0:48f:8eb6:2320 with SMTP id ffacd0b85a97d-499c3c96806mr5058142f8f.3.1794413917994;
        Wed, 11 Nov 2026 08:18:37 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:37 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/9] ceph: fix mdsmap use-after-free in send_renew_caps() and renewed_caps()
Date: Wed, 11 Nov 2026 17:18:25 +0100
Message-ID: <20261111161830.1336485-5-max.kellermann@ionos.com>
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

send_renew_caps() and renewed_caps() read mdsc->mdsmap while holding
only session->s_mutex, but ceph_mdsc_handle_mdsmap() replaces the
mdsmap and frees the old one under mdsc->mutex.  They are called from
delayed_work() and handle_session(), both of which can run while a
new mdsmap arrives, so they can read the MDS state and the session
timeout from freed memory.

Read those values while holding mdsc->mutex.  Callers hold s_mutex
but not mdsc->mutex, and taking mdsc->mutex under s_mutex is the
existing lock order (e.g. check_new_map(), handle_session()).

Fixes: 2f2dc053404f ("ceph: MDS client")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/mds_client.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index da40f2cb80f2..a43ce23d48f4 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -2190,7 +2190,9 @@ static int send_renew_caps(struct ceph_mds_client *mdsc,
 
 	/* do not try to renew caps until a recovering mds has reconnected
 	 * with its clients. */
+	mutex_lock(&mdsc->mutex);
 	state = ceph_mdsmap_get_state(mdsc->mdsmap, session->s_mds);
+	mutex_unlock(&mdsc->mutex);
 	if (state < CEPH_MDS_STATE_RECONNECT) {
 		boutc(cl, "ignoring mds%d (%s)\n", session->s_mds,
 		      ceph_mds_state_name(state));
@@ -2232,14 +2234,19 @@ static void renewed_caps(struct ceph_mds_client *mdsc,
 			 struct ceph_mds_session *session, int is_renew)
 {
 	struct ceph_client *cl = mdsc->fsc->client;
+	u32 session_timeout;
 	int was_stale;
 	int wake = 0;
 
+	mutex_lock(&mdsc->mutex);
+	session_timeout = mdsc->mdsmap->m_session_timeout;
+	mutex_unlock(&mdsc->mutex);
+
 	spin_lock(&session->s_cap_lock);
 	was_stale = is_renew && time_after_eq(jiffies, session->s_cap_ttl);
 
 	session->s_cap_ttl = session->s_renew_requested +
-		mdsc->mdsmap->m_session_timeout*HZ;
+		session_timeout * HZ;
 
 	if (was_stale) {
 		if (time_before(jiffies, session->s_cap_ttl)) {
-- 
2.53.0

