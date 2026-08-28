Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F43B2FDB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939121; cv=none; b=vA0PF8j1XgG5jZV4ux8DTSRPHt4xLZaeJtWFN5NnHw1sanzEjxrnYmfVD0hm2M1LTiURiWRPHSJjK5qffcRUXMoC8QbOKcs4RbodkVlimtYb/ZM0e4daGNxDj48ruT+1YpBsi+PmkPkV2xglolntBX6h5kRReO5Wo2pdfKbHDlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939121; c=relaxed/simple;
	bh=r4WMTTppi1E36eQj/o9V1iKpwfdz5dGoX1URXLna3jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1+wQa9QC6Ep33y6zlL+LGAHXdwN5lu7vjxUYuQFLS0RdZ6m0CtPPaPmuzgEWVzPvOvFYTQuZRBfKWrT7lbGiCyi7dlzEw7b59DXVPVVdPQJPEgw63XumWxgfFTCpnTltjqmEn4O5DcaKvQ4rvRNPhCLSDOi1YB8H1KmlnGpVvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=HLHclhpG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="HLHclhpG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f71156e1aso468513f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1787939114; x=1788543914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJu5xRqwJGsup27bnOejvK4Mm0h/OhLvcqFDdKFUl8c=;
        b=HLHclhpGQb6MA8D+ACV/vm4X5zjhVbllZtuUlsEevii8k3ttgV8qqfCEqUf8vwEzkc
         G4EAYNhmkmU9ft8jPkro1KjLjVjWna7NzRcfIY7mh6cFl9qZK09whdmMdEm+DSOmTqA0
         ALQP0mAKRs+JjsDjDQvBey48ybJ8TJYEroboItnh0K1WHioQEuSk5zW75ZQ1Bn6FMIE7
         6Oi0ruekR2zmrXPjqh+Snv6wmbIXcbACKxJ4/5OsxloIZwp3zgaAt0HE36s3AgVEIpC3
         WekfQML1ozryISl2oMSgvNkBQ1/iOlDWChtxdArYszUPPCG14dtTa4DJUqiXc6uRyZOT
         RPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939114; x=1788543914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJu5xRqwJGsup27bnOejvK4Mm0h/OhLvcqFDdKFUl8c=;
        b=OXJ0Zc3m09H5a3LvGA7DuEaulGEZhxprG3u/Fi6D4BnjP1AraMX7vF6CHE/Y4ER/2t
         tWUTpa5I7JVRu3f9Ga/lAFV03DJmcrohXEjRITb7UrJI9LXv5r6IAhAq03PZuzAiUULQ
         C/0BlaS0pf3s0yTPfuGBT6JfPRXcuHhlD7p3MsjUG5ZE9yGajfOOx1ThOOpRc9xaMT7t
         9B75leto765hi+FXa8XtEL9AFLlSL+4ZAI40Kotng/nvABcGwuHEu95Tk+4nkpsuc8o/
         OQDdgS2EygqK6Kc/kqA0hk0RimxxX9UYd0EmkEhFnfPCnC7tWSAQJCRA/dRu+qShjlWz
         B7TQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF0j9UKvft/YJT/uZrvJuFnu7CIO6BdMg2PBMALjSAeqiIva3Nmjb7vag3SCUMle6g364gG+AnP9vRt3A=@vger.kernel.org
X-Gm-Message-State: AFuF++luS7GKYrioJA+CyowiQ6cPODLp9hTegITj8hqzoNBNw4HmC0yS
	wHXNe4uncESD0rXzNvyum5GljJnibz6/IF1++Fgy6cMKhJYRDXdUk6FswKiJdfpFMRS2XWeuE8Z
	shvhjE4s=
X-Gm-Gg: AR+sD11Nte7WxHOjcSbEp9P8+Ata5zpuZb8HSkyxjoYJlcaZ43IQsexHJQ4BAhG18V5
	lEViEX5Hf8XW7vuIrIYJIYyWKytUd9+ljUambPQK3ZY3oxbehrpaFSBdBQqANskMWjWxczNT8OJ
	Y/2PvTfWiF5Cc348v+ssDakv2Kd2Pa2TCd+0OPM2hzhwh2K3ugJJTR2l7QBGFgZYvVNcM2ngIdm
	2S8FcNOEkjrtmIeNlPIuoi+DJwsDyNiqmYvQadGkx2odrd+0nujdxPDGYDwdkGEOqSl0AYDScWS
	jpmZkuBSoGa0PI9abxbma6DlCHm9+j6kLJrFDFfYB6D+Mjm4Q3goDdOVJZamnMGsuWm9AmFe2T3
	HifaacojlzaECbXsk1vzXEW9sjTMpWs0e7X8kinWYCjGLoZcNBtn8K8pa+UeSt3UiR7533uMLh0
	6kjKtCIHIdaw6nTg+WZI8xQesQkOuJ76+nzxCjI3MZSVGTYexGiNXGTKg7hkMDJalo3BBNNXUsi
	fZGnpmQTE3NYMvE2NaUuuz7MlSmFMYF+xUDmRZE53Ow2hV2QB+a1dlKAzckjtAV
X-Received: by 2002:a05:6000:41d1:b0:482:f4f8:7a00 with SMTP id ffacd0b85a97d-482f79cf9fbmr15323631f8f.16.1787939114063;
        Fri, 28 Aug 2026 10:45:14 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f02b200023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f02:b200:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm5480678f8f.25.2026.08.28.10.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 10:45:13 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v3 2/3] ceph/mds_client: stop checking a stale MDS map after dropping mutex
Date: Fri, 28 Aug 2026 19:45:03 +0200
Message-ID: <20260828174504.1247038-3-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828174504.1247038-1-max.kellermann@ionos.com>
References: <20260828174504.1247038-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_new_map() drops `mdsc->mutex` in several slow paths.  Another
map handler can install a newer map and destroy the map being checked
before the original invocation re-locks the mutex.

Use the `mdsmap->m_epoch` field to identify stale maps.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/mds_client.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 160f23e2edd3..03809328e4aa 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -5782,6 +5782,7 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			  struct ceph_mdsmap *newmap,
 			  struct ceph_mdsmap *oldmap)
 {
+	u32 map_epoch = newmap->m_epoch;
 	int i, j, err;
 	int oldstate, newstate;
 	struct ceph_mds_session *s;
@@ -5825,6 +5826,8 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			ceph_put_mds_session(s);
 
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch)
+				return;
 			kick_requests(mdsc, i);
 			continue;
 		}
@@ -5836,6 +5839,11 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			mutex_unlock(&mdsc->mutex);
 			mutex_lock(&s->s_mutex);
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch) {
+				mutex_unlock(&s->s_mutex);
+				ceph_put_mds_session(s);
+				return;
+			}
 			ceph_con_close(&s->s_con);
 			mutex_unlock(&s->s_mutex);
 			s->s_state = CEPH_MDS_SESSION_RESTARTING;
@@ -5859,6 +5867,10 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 					       "mds%d reconnect failed: %d\n",
 					       i, rc);
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch) {
+				ceph_put_mds_session(s);
+				return;
+			}
 		}
 
 		/*
@@ -5874,6 +5886,11 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 			mutex_unlock(&mdsc->mutex);
 			mutex_lock(&s->s_mutex);
 			mutex_lock(&mdsc->mutex);
+			if (mdsc->mdsmap->m_epoch != map_epoch) {
+				mutex_unlock(&s->s_mutex);
+				ceph_put_mds_session(s);
+				return;
+			}
 			ceph_kick_flushing_caps(mdsc, s);
 			mutex_unlock(&s->s_mutex);
 			wake_up_session_caps(s, RECONNECT);
@@ -5929,6 +5946,8 @@ static void check_new_map(struct ceph_mds_client *mdsc,
 				       i, err);
 		ceph_put_mds_session(s);
 		mutex_lock(&mdsc->mutex);
+		if (mdsc->mdsmap->m_epoch != map_epoch)
+			return;
 	}
 
 	for (i = 0; i < newmap->possible_max_rank && i < mdsc->max_sessions; i++) {
-- 
2.47.3

