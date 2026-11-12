Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468035;
	b=YeVEfkA977Jvpu+BN7DaI/YRHkY+EQZOGIgVYPRRkECFzm4QL2GO/PIMF35RAuyNIq2S
	 QmkEXqPTBq+wanu1mE8l387IafzlgxKfDlTcVaVki0PKgQSMOjX46BJ+qKZuf3ZwQSXkG
	 ZXQ3ckXQTIk3lYKZ7ICun3Xaddig5pkK3r7o/8FtfFIFfsGVSm1xoPpVOGjnJDDkoN1tS
	 l0szhOGb7NRPXOA3HDYv50gk42YOTWBxHHmaB2SJ+61/LQU8XwrZChdYSOmzPZdOPskjt
	 FF5R1P5LH/UwnvwV5Xu/HO7eyZqkuNNIVAVDgO7clAqlW+OoFIZ99OzEcI3aT+pPOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468035;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=z9Dk6L/CtbBkYN6Qu4Qi5kHl7KQrluvS9Xb8JC02QIo=;
	b=zOJtx/OLSogrsEv1EI0IJfcHFZYWGEi8Tp2qK2ntPyDzOwA3Rv9t9bsJU7lBmrurvOCz
	 L0BCBoRqAmR9KSqBp7yr0u5dRYsGPV+UoYKBOrEirSTPCYyUNcNkrLFMUPpz26zUp29z5
	 stnAsV6v1MdfbSqWyDJpvXJEDmxM7U9wv+EVlksmrc9glHDrh8oJ2rVIOmuciV/dwIzMj
	 w7t1u7vu5E7Gh5rzyCXdxeqXt5yZZn2xgq8NyfPadHVuDUxU/YeNig8/JPrbzYC0ZxljM
	 9jUdrsB6/SeGOKChiLAXHsMRzVU6F8kRbZnty8VCxBbnnNvQJrnQqVmhpYI0R934BXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=X6CTVz45;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D95606A8B9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D95606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=X6CTVz45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794468024; bh=z9Dk6L/CtbBkYN6Qu4Qi5kHl7KQrluvS9Xb8JC02QIo=;
	h=From:To:Cc:Subject:Date;
	b=X6CTVz45h7o4eSPq/GCx7wuITkzmyN1iUScQ5OqcDxp7rhaxEM3CDmXy5X1e7RxL6
	 iZhGU9W223Dc12+aJgiW6owidetBsB7pYg687nu9bM0i40XWif9j2kRSt71jiMSOp+
	 WKE88tYUAAYbiv4cQgSNCq6E5tENa9B5ZSScRJcg=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 516A584F; Thu, 12 Nov 2026 15:20:22 +0800
X-QQ-mid: xmsmtpt1794468022tcv0o3hbz
Message-ID: <tencent_E85C7718E930963979DF267ADC15B1B70907@qq.com>
X-QQ-XMAILINFO: NAvVT23RIZvIo/dhvDJZagL02641seSODukoWMlxOYUDFpXNa6gnKylHthNS+R
	 ztUH3xJJco5wgXLQitGUOKHUabZCHp+iC9cQq7QnQ4SPPDFhOHbbbKOG/18HxA81ZvxNqWN64IXo
	 tK4fU8aCe4SVF9brl3WI+LtOS8qW17o/nj1oF53DfNYn7Z4jDJX7ue50WDYQ/nIB+hlg/i/OfVT6
	 W1xQlEjIV0YdLzoyDEgziRw6Y129cYyylFe812v0KIMA7k8ovTUEw3SGQ+1VdbVprwWLvUT9SCIM
	 pVBkq9aAu+/gMYRsb/B6PUExTbxvxdzRw2/j23uMrCpIJckEbVE1SkNf1LZQjV8+Kn+T0gRbIkT0
	 lNvsc3+TEpEVoLuPpMWW3zDZnQRka4Ng1RsvezFi57XEKLrq8LMHWi9hPZR/xBe15Wzemdyp+PHi
	 LYDIWl5VSTN4fTJv4Wk5RD77LMYzlzHF1jYxFalgSezAs9sN+h3jXrJafKCuAXWpron67TS101+j
	 kCEc7KFurBZmFLNLV5W3Qgj2RYq3qBE5+Qy5xXK8lszobCCBMGWBH1zZU4skH4Cy46TidqFtHs9Z
	 tZ/nIMA/dypbxIgdjgzusL+ojOv26+cMjAFkcZyVr6ZPrukQHTBqjOVf8KnUgtZ0H4neY2BTWffT
	 0hqgDefpb5LujrouJBWFRVibwdO/dxUvsooI6Sx/nMzdaNojorVubAk1nMo8nTNvAaxDZm/UT4CO
	 u4Q5CGXkCmfqUcfDFCehL2S/pP/5HdXl5cynBAMC2til97uOOryGQsOdGIXxIHt9d279pcw88meV
	 jmj1eufRmQU6fRZ8aVRaHhVMxRkvKJG46q67LdFQZVlE4l8Bj5PbdEZGbIp9h0l1pvqfo3GOR7PF
	 SDR9PHKor4dGx2cYkhcsf82TcdsovAGmXAQMSjTgykF0fI2Dg/WL4W+hngFPd0/HjtTwh6XKUGXC
	 0k121tDv8U0vngn6VxGNNsSTr9nLMh1FWHQnBaAsMjMC90so+0U8goLgEB46srCoRbu6L3oUTCpz
	 hMziIq0GZwLj03x6YPKlWfaih/KRAvSoVCVWaZi0G4270+QyPeW0Q+qo9z3JU=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Shuai Liu <847807867@qq.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	gfs2@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	syzbot+0423714c06c369318794@syzkaller.appspotmail.com,
	847807867@qq.com
Subject: [PATCH] gfs2: Fix premature disposal of quota data with pending changes
Date: Thu, 12 Nov 2026 15:20:22 +0800
X-OQ-MSGID: <20261112072022.209228-1-847807867@qq.com>
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

Quota data structures with a pending quota change (QDF_CHANGE set) hold
a reference to the quota data structure, which is dropped when the change
slot becomes unused in do_qc().  That reference is taken by __qd_hold()
when a change slot becomes used, but commit bb73ae8ff394 ("gfs2: Fix
initial quota data refcount") stopped taking it for the quota data
structures created by gfs2_quota_init() at mount time.

As a result, when gfs2_quota_sync() or gfs2_quota_unlock() syncs a parked
quota data structure with a pending change, do_qc() drops the reference
taken by qd_grab_sync() instead of the reference that should have been
held for the pending change.  This leaves the quota data structure with
a reference count of zero on the LRU list while the sync path is still
using it, so the shrinker can dispose of it before the sync path is done
with it, resulting in:

  gfs2: fsid=...: warning: assertion "!qd->qd_slot_ref" failed -
        function = gfs2_qd_dispose, file = fs/gfs2/quota.c, line = 130
  kernel BUG at fs/gfs2/quota.c:331!
  ...
  Call Trace:
   qd_put
   gfs2_quota_sync
   gfs2_quotad / gfs2_sync_fs

Fix this by taking the reference held for the pending quota change in
gfs2_quota_init() as well, and by dropping that reference (along with
the associated quota slot reference) in gfs2_quota_cleanup().

Reported-by: syzbot+0423714c06c369318794@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0423714c06c369318794
Fixes: bb73ae8ff394 ("gfs2: Fix initial quota data refcount")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
The bug was located and the fix drafted with the help of an AI coding
assistant (GLM via the Trae IDE); the analysis, testing and submission
were reviewed and are certified by the human submitter.
---
 fs/gfs2/quota.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index b2984fb7b35c3..f8ac274b99db8 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1470,7 +1470,13 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
 			if (qd == NULL)
 				goto fail_brelse;
 
-			qd->qd_lockref.count = 0;
+			/*
+			 * The pending quota change holds a reference to the
+			 * quota data structure, just like when a change slot
+			 * becomes used in do_qc().  It is dropped when the
+			 * change slot becomes unused (in do_qc()) or in
+			 * gfs2_quota_cleanup().
+			 */
 			set_bit(QDF_CHANGE, &qd->qd_flags);
 			qd->qd_change = qc_change;
 			qd->qd_slot = slot;
@@ -1542,6 +1548,16 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 	spin_lock(&qd_lock);
 	list_for_each_entry(qd, &sdp->sd_quota_list, qd_list) {
 		spin_lock(&qd->qd_lockref.lock);
+		if (test_and_clear_bit(QDF_CHANGE, &qd->qd_flags)) {
+			/*
+			 * Drop the references held for the pending quota
+			 * change.  The change remains in the quota change
+			 * file and will be picked up again by
+			 * gfs2_quota_init() on the next mount.
+			 */
+			qd->qd_lockref.count--;
+			slot_put(qd);
+		}
 		if (qd->qd_lockref.count != 0) {
 			spin_unlock(&qd->qd_lockref.lock);
 			continue;
-- 
2.43.0

