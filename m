Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228DC3B71A4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372602; cv=none; b=Z2twcYCp4Q+Po+Kpodvzpe8QiwExWwSgNKnfInk6MeLjlvgOijk+jeuGap80KPHh+LqvdGCbiAKU9JyG0kOF2S8hgPg2JpVDwyEwl2W14BXGLUjYrr7+R9axqmnYnpnnzZPM/9OKGfOJD/Ku0M9xfhK0LEFymT0e/BLidHPMeag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372602; c=relaxed/simple;
	bh=YA/Zt5Rp3A+cv1udmI30pynM10rZrp/ZOB5JXnp18OI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sFmcHDCyP4IC3EyIu2W2X+DJJaaDAYpukaV3vx4DbCE0qABj5JYBfDZ8QIZz1tRbXfGtlG/9IgvEo4rP2vOtKyuJ4PDneHj7uMH14wYvTS9kEDEVc1oS2feSEiuZy2Iubq9+QhePsnF2hDZ53/qGTgJ5NTC51EqXecBYqk1jrrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNLIjZOA; arc=none smtp.client-ip=74.125.230.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNLIjZOA"
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3a49bfe419aso18371981fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789372598; x=1789977398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SXkJ61xh36bbhjQO3MwznVY3pjw6v2KKNzzDKE9IK4=;
        b=tNLIjZOAhhx7LnwZ8WXXw8zGUA4ITwBbS3XntzmrTulikKKtWFCi+kqbxz4jdNheFI
         8o72cSVGde9gDYASAGIpjf1sI5M3ekiM+OPohDYo7YQOYbBwd+rxmtYetld4XK1nt9lZ
         d50lUH3FuYtWHNyauwYcF2405D0Ukq/3ltGetcjt5bqscDcMnkwkumwhHe+RzSeOgLC6
         CnjqKPL3Byvh3wD24Wqu4KzKhEK7ms6oPGMJ4aBdSQYvLcQ40GucAgkFq5HIvMSqSIuA
         bsvSHaxB+BWe20Wde8EG3veecIDUvcvSLzDKDEHmYYDXDjPQ4KAUNcWzAF8j/Hxt53dy
         /GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372598; x=1789977398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SXkJ61xh36bbhjQO3MwznVY3pjw6v2KKNzzDKE9IK4=;
        b=jMp5bmds57cqO8GpgBBaYRNleipXrEJ/6iWHc2E4due3eDaVqts5G3n/H1bwprWWB/
         q57oiDJCa1WPb0EGbJkv13gYz4tSl4mVAWNUd/s6kLr70CiRcz5/w3PBn+niTruNQtkK
         YCDL4eOCh5NRJ9wD3TFQedTOxGHKApUdCgBeVBpjnWiiF5EJDgxthm/4dP5qvqUiJAcL
         TwfwC0JavmAXjVmlk1/zo36wjC6Xaf4y1R9K6aGGXg7jpmQtMTeOI2BWukZxsoe/tW3/
         UDWvBzp5viq9KRMDEBbYrdDwSqBnmXxA4+iAYumTUi0EY0mtPo884+H3GiLQMFXI41Ty
         FEpQ==
X-Forwarded-Encrypted: i=1; AKwUvByZfmZqTFIbVJKYGs3rxFT7srrF36Y9VkfPqJwNGlq1H7ZARnBAl7xpML+nSGJSggQ+0BgjG8s6NNgV2z4=@vger.kernel.org
X-Gm-Message-State: AFuF++lhdva9LKILlGO+H6p58UOREWCb0hjPQ46MyaVUk0hYO//zzNPJ
	PWDiVtzsmLES3meXpga1gdOknia70mGKgChclOIbhTIZ/a8bFZDOhIAK
X-Gm-Gg: AYBFou2VCTtyIEu0DgnNJB/5Wki1Uyu78KL9i/DvXAwAXnx8OWUWjV9wdUCgaor2uGc
	Brm8xwLrHsImy8jLjW8d0BnziFuaKD213dqb+4gbPFovjN7ipxdhhc5LHE5AsGQX83+1yF49XUZ
	BfFoxvSw1oKLvp/aOzrZBk3O39FWeQA5xgLfOfyC/wJO1UnIAvnzfiXXrBL8f4WtOnw5SbVlwAV
	W5aaVcVb+MMUOipJDaFnLji2aKopFrtf84Y+tZxK2RXclmT176CHlUjjRXsMiDtWm2q1dSkzf63
	I8NivMAuNbE6g6pZsoSwBsLindo+17fWNeqrb3lRZ3WnQ4LzUqDbdOMgfOz6JFNnA4jjxN3psKx
	bDH2arG8b0qGbYZjI94zWk0zLW7+YsnlMRoOMJS2HmGbWufWHyqJlyBKdlMFOGnwJIhkms0+oOc
	9GdSuOODXBU0tvpQnMVuT2uYNzzKbgIa0oDSUlTqMMI6asvMXoRwWi/Ds0AwxaJwCVOBvoid+dd
	P7rOwdjN7/kXiIUDp/qOLlyyytg
X-Received: by 2002:a05:6512:1241:b0:5b4:ac27:6bb0 with SMTP id 2adb3069b0e04-5b8ae6b89famr713138e87.25.1789372597734;
        Mon, 14 Sep 2026 00:56:37 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047113esm2231327e87.55.2026.09.14.00.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:56:37 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubli@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	ceph-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raphael Zimmer <raphael.zimmer@tu-ilmenau.de>
Subject: [PATCH 5.10] libceph: Reject monmaps advertising zero monitors
Date: Mon, 14 Sep 2026 10:56:19 +0300
Message-ID: <20260914075620.11202-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Raphael Zimmer <raphael.zimmer@tu-ilmenau.de>

commit 40480eee361ed9676b3f844d532ac28b47251634 upstream.

A message of type CEPH_MSG_MON_MAP contains a monmap that is sent from a
monitor to the client. This monmap contains information about the
existing monitors in the cluster. Currently, a monmap indicating that
there are zero monitors in the cluster is treated as valid. However, it
is impossible to have zero monitors in the cluster and still receive a
valid monmap from a monitor. Therefore, such a monmap must be corrupted
and should be treated as invalid. Furthermore, a monmap with a monitor
count of zero can subsequently crash the client when attempting to open
a session with a monitor in __open_session(). This happens because the
"BUG_ON(monc->monmap->num_mon < 1)" assertion in pick_new_mon() is
triggered.

This patch extends a check in ceph_monmap_decode() to also reject
arriving mon_maps with num_mon == 0 rather than only with
num_mon > CEPH_MAX_MON.

[ idryomov: drop "log output for unusual values of num_mon" part ]

Signed-off-by: Raphael Zimmer <raphael.zimmer@tu-ilmenau.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-68155

 net/ceph/mon_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ceph/mon_client.c b/net/ceph/mon_client.c
index e1f01aef263e..fac52fe7a587 100644
--- a/net/ceph/mon_client.c
+++ b/net/ceph/mon_client.c
@@ -59,7 +59,7 @@ static struct ceph_monmap *ceph_monmap_decode(void *p, void *end)
 
 	num_mon = ceph_decode_32(&p);
 
-	if (num_mon > CEPH_MAX_MON)
+	if (num_mon == 0 || num_mon > CEPH_MAX_MON)
 		goto bad;
 	m = kmalloc(struct_size(m, mon_inst, num_mon), GFP_NOFS);
 	if (m == NULL)
-- 
2.53.0

