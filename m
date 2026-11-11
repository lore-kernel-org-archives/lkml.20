Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413921;
	b=cs6UK5aIHf75o5tcx+tufXmFmMLr4WmSGR1nBGLhJo2DTdskXMc/TnCfppoe9vXk5/HI
	 Ck5nJLjEZ+6RBG23qkToknGVGkbfY0hIV2wgxkTYaXhqYRSV42vSBl40XdoqVNRHWmL+a
	 yRO1yajz+GkhIs+WYo48GK+j4UCwtSaNadUzyoTBiNXzmQ/EDz1KsALwd700/EEyWlXWz
	 oH3Q70VtIzXqHuPk1uSDZ/N8Syz3NCDErWsBFB/zM3qd982S4vA/qA5XpqN4nC3El/ltt
	 yoaeUnFST6kSeTzdazjCMOqZe/ROPwVzDjpb6uI2Nwcoz0cFpiKMIPN0E32DZ0025Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=izt2/XobLLqiqgA/+J+pbNOAtloWX7VwrLq7qFAm7og=;
	b=h8e0J0TMXcVow9Yd+gCQuMQVoEMWE8Qn2ZvsSeXEzCt1YwpT87DufWaXB48LxKsSapBe
	 QYlhafNDGOq3RANh4MMQ83HI5H87giQzwLwiEFTuXoJOmGqMoZg/Q/yt2EltJMMHauYj7
	 EaTz9y8bH5Y5JJrkBo+CXDlTgHOoNKR9+KALchxRxFlgs3qNhaobPGmsq0HsH7BWJhuen
	 teZfYGHPZHIijviThZIsYuKxROSSqiNAV2NAWP0vrxlD3+TfeRvJz9bdHmTu2KJkQ4W3h
	 /bU4DSixhTo8+1n4/Iov9WsY8ZAUZ8VGhqXkxBDsthY49qjzPhQrGKepbyMqkNZuUPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=h6ew7d3v;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAA60A2603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EAA60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=h6ew7d3v
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so2555151f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413920; x=1795018720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izt2/XobLLqiqgA/+J+pbNOAtloWX7VwrLq7qFAm7og=;
        b=h6ew7d3v9vf+Kt4CULQmOkrk+4e7JAubTLtfJ7E/tSjtsBGHL9SF6ngarbtIfGRi7h
         rbsDjhgtddpXtFjcd+ySROzj/rbNWdonvsfTizLLb6dxcLjM9g8F5ouUxNL4tqzr2QYs
         GxbdA1+axsxLjLiS8/RT7IhwkPVQR9S1LKgbiaIeE4pchX7GWlYu/XGnhl6ZZ0BPf0EI
         yb+6CIhhZuspDWtoCpycFnQ8v2aYnTIKQvzuWY58Sn9avpw87EMnDUUXYRauoRgQEdIh
         jNL93vujq4WplSxed1q7pIkgDzIkQvjIvCjEhF062CPfzj/rwNwiSc1hA45Q22s7oWYI
         a5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413920; x=1795018720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=izt2/XobLLqiqgA/+J+pbNOAtloWX7VwrLq7qFAm7og=;
        b=unFQSHw6TGncSarstMxlvfg7oBdP6ic5jhRjsn0r9nr0gUJIqQtUfIKIky6zaYKAZ7
         FeVWFQS3tizLDZjFmu8Ms4wA7QpLfsDP62ekx5J/JRJOW8lXwcRISmP340weNW/KGxL5
         UTwBLwohooyxyDoZHvR0AQ1s3riUJB/8bq3ImozyGYL9Tm0VGDFW8b2Hqz0VwWKQ9LaV
         U7YyvXbdTPC2HEg2ddbkbRwDH3JuNwypJfXd/7AUK8Oqbi1TxuYOqqx8N2NvVeuOOXcK
         EAqDTDZGuWUkj5Z0fCKTf+hTEVyqB8lKxaRwRSHZhob9jGz+fZLcOsfCMvwTR1V7vapg
         7gLg==
X-Forwarded-Encrypted: i=1; AL+hErE7ngVWfLAYHRybE8F5w+WB6OOn4LTrFjxbJKUQ0FuZQi6LifZ9SNptIVbux/5JcZkGo5GL6VmMZL+liwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UbJ4OErk9A+cyARvflBqTgbZaZKKqQlb2iWzA3CcDQ/7HIrga
	+MKTdNCdpzryGWNzD91677YJdmXvtWu5eg9CIRPkrP5uzMzv5szFmUeRgJWuIsZvlTI=
X-Gm-Gg: AYBFou0UrIpd//RTB6vlQal3PN1xE6+RWUsyvyweIPFePUEEeNr5CR1Kbub5t5FRWqG
	OQC7uY9j+gmVlt06giBpMUYUblJRWtAtHFwUQOOzc4qLHrXkQ1ith9sVsTqwwN67bI/w+ifB24F
	Y/YTbbwcDAPcOA/kTlcn2gfuOnqKLfG649EWqsFIbE7T/U108iC01B83o2v4I9ejq0a6Q14uHNe
	zDmu2t4hOh3O+cU+I8IDbf+wTiGJ00A9UAyJ+o5EkGFLegYtXC/88ciIlrWc8/BtmSErPCIJUUd
	WBoycQ8mizK2jeYr/8hPywBXflk9so6yrQ94lJc4jwsEusUPMaHQSuMrirRamybgQZORH6qGIl+
	M7noP+CCxeFl84FLp/s6w7WB77HHuVPfLhBflGHcr0MnBAHHbTd7X2OcY2DWydPM2e1xNkJPMr3
	n2ooEt0q1jywzGVRH8bVMHxT405DkK9r8F3SGiHOHoGAWgV3Tkxcn2eACmcEZcNMewjXaF/FP0J
	m/ubtCmP3keh4hRJm/xrzhijH3TVym+wn9by8jkIYwQ/flTScIzAV63Um1GAKpmXFMaUXwEyNAN
	yrlioKJXQZqN1mwxhYLBE+eUrOlj56VYjpEbfcE0szy8X+9xMJALzkNuDVY08L7UyVrU1+u/jjm
	f0GqjrFmKnCEVZnSjqk0ggBsrxPTr3Q==
X-Received: by 2002:a05:6000:268a:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-499c57838f3mr4997398f8f.8.1794413919771;
        Wed, 11 Nov 2026 08:18:39 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:39 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 5/9] ceph: fix mdsmap use-after-free in mds_peer_reset()
Date: Wed, 11 Nov 2026 17:18:26 +0100
Message-ID: <20261111161830.1336485-6-max.kellermann@ionos.com>
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

mds_peer_reset() reads the MDS state from mdsc->mdsmap without holding
mdsc->mutex, but ceph_mdsc_handle_mdsmap() replaces the mdsmap and
frees the old one under that mutex.  A peer reset often coincides with
an MDS failover, which is exactly when a new mdsmap arrives, so this
can read freed memory.

Read the state while holding mdsc->mutex.  The messenger drops
con->mutex before calling ->peer_reset(), so no lock is held here.

Fixes: cbcb358b744b ("ceph: skip reconnecting if MDS is not ready")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/mds_client.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index a43ce23d48f4..aa4406fd65b9 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -7300,13 +7300,19 @@ static void mds_peer_reset(struct ceph_connection *con)
 {
 	struct ceph_mds_session *s = con->private;
 	struct ceph_mds_client *mdsc = s->s_mdsc;
+	int mds_state;
 	int rc;
 
 	pr_warn_client(mdsc->fsc->client, "mds%d closed our session\n",
 		       s->s_mds);
 
+	/* ceph_mdsc_handle_mdsmap() replaces and frees the mdsmap */
+	mutex_lock(&mdsc->mutex);
+	mds_state = ceph_mdsmap_get_state(mdsc->mdsmap, s->s_mds);
+	mutex_unlock(&mdsc->mutex);
+
 	if (READ_ONCE(mdsc->fsc->mount_state) == CEPH_MOUNT_FENCE_IO ||
-	    ceph_mdsmap_get_state(mdsc->mdsmap, s->s_mds) < CEPH_MDS_STATE_RECONNECT)
+	    mds_state < CEPH_MDS_STATE_RECONNECT)
 		return;
 
 	/*
-- 
2.53.0

