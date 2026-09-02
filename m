Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7584AA59B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366939; cv=none; b=h2pVLjKWi8lToRwra+Yt1dHGRIrX5MFQcFXEAnFYLzUeryyiMSEqfkbiHbgaCjO/fH4VzBjNQvQUO/oYX3N0z72Xu9nH16ehqyf7xQ3mRdNF2uk8aXv3bNJIAqPQzIsdAyeUO5ptvmnvY/l8eI44tV5gIfuytLDW3kMZlBaeGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366939; c=relaxed/simple;
	bh=WEHlyr4Efxhk5teTrx1ZhLj53CZbT4uxkhVjxj4C5YA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AX4Pf4CoTI3VdkUTGaghpjMGWBhGPXrHrXNer5hc0jkNXlH8puQaBumM5yNnEsYvLmgLPJJazZH3jSndAiLzFxeeiHrQkMjgh8IAI3HCIlVAaXGB0somHEg8wgfxfeUr2PzKL2irNQzoEGSUWtv4KMlutROEtmw75EHb65zFMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nvGJgtg1; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=C+oQV6jF; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nvGJgtg1";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="C+oQV6jF"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682GZ4Ok506205
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=UFiN
	X9OJ9AlNvX71DGEWb4R21Djm99DB5fOLNXEMpJo=; b=nvGJgtg185Lja6OGb+3d
	QsAPKWRCWlum3i9LwVvviIXOCgWYq08/nk8EsF+5Frd3nYwJ7h3PpCO6n9JNXpxt
	8M1J6lpfBa4kGa+SwmHDzIffg2YmhAQb+r5hL2bXyrZRuLtwYM0UvtRO7RD4QUpY
	OFC65akkVQAcMX11BL8WPrVycGxaPHOAD+1CfzsSn3KnL81QpaCGgQ9iBwYNlPWj
	Ube8wrwJnRkOwyOxvc7+hgfT7fGtmBW/Py6osniuWJ5FLK1lJeJKDBwkSJHR7ue0
	NXqgr/UB716iPhjkIOtWBwHu/1f5IqleMS+YZxBL6V7L53sNo/8ovNes3KNktFWs
	+w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ge835d59n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:35:36 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e87478402so35948836d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788366935; x=1788971735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFiNX9OJ9AlNvX71DGEWb4R21Djm99DB5fOLNXEMpJo=;
        b=C+oQV6jFnu6DT1cZ52VpmDJTqhpXF0pTGKDdZuQIto4FvjWHQsJijKA0FubuYQeLhc
         nkpWTfVOQuaf5xpq1Jfjq9oQAZZZXaYZgbuP6YDWOfOUCZEIv6mqtmxzGpJL9BZ7EHnQ
         kK6CZLPo+tI8PGhzZxFnaJKthx9G5I0iU0pPMgW+zctUBO3D2+K5AVwjFkE9D0rl4vQw
         QVLdEFNnoTCfCmkoWi/Z/wivrSKgLcWhwBc7GPU6+8VY46cAFWaLQquuddsUW5v34Vic
         o618pt1ZnhZjZ4nnW+NH7UZzyvm5TQekf/CEtlNaB0oKDtPtp1b4B9UYyidknnbM9yr7
         csog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366935; x=1788971735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFiNX9OJ9AlNvX71DGEWb4R21Djm99DB5fOLNXEMpJo=;
        b=OC8GfhkPq/Vy5CDH1on1wPgt48RU/IpSQWBt37F4ndEofZGbEItgRq7eRcURWwXskA
         IYvDYlj+tVIUs+wBNn9hKKyKG8V3fnBk1ub2rCP1Cod5oIANhuWF8/sdgYWB+TeCco60
         Yh6bm/PT+QbnyBPoXmzFGttisC/V5DewOV6OtZQAKs7D8zP6PPXV1bNxe5qP+P5xAmT8
         O5erRvfp21PFWfl5yWHhPQ/QbJuU5LahoRgYnluHuKvd7VPp4B/MLQGTw7q58e5dO26O
         WSzDzMiGAr7bnEQt0Cz7c74KXb995TRu2q6x6fgWDuRqPvTs5PVwzJgxwYP5D1yEvI8Y
         n4ZA==
X-Forwarded-Encrypted: i=1; AKwUvBx+Rf4ozoS7B3keWtcd0DLRRaDEnZNajci2o/VjwFhvq2aG4JzxfNluuOAJ355nwP8lmkhVtPZwzi07hH4=@vger.kernel.org
X-Gm-Message-State: AFuF++kC03/wyxeudCs3U6ArOVlzR3TDTJG6QxQaZ4bwAzlPuXlU1+Ve
	KwsaXJR86A4IqKgv3bcv5yALG0QrtUiQ6v/iwk9iiOoHTWjblzDCJARt5obEBEMm5JVh8Iwq1J3
	hvKT9/D7efL3nmGpzgNw16g3DIYTihdG8mA6cMgmSub8xpsfIFRo/WUJoys4/Yg==
X-Gm-Gg: AYBFou2g2Ta1zSNk4Gpf6ZscYcV2PJB+kaDMEx6yWBsEICrevrV5vy5O3kMMVMhR1/g
	BXZ75PEQmPssspUJZX+1ytr5DfygNyj8dTBf3qAJ/ksrlQmtMJewYEEj9/yhHfk4tQRD1+lG9Eh
	6xaTpiCAy8SOUKGNsmvwbIT7YKWbM6Y1d1P/UAtMxkMxkubFOFEB/xzch/bXu1qshdXRV1k9Zq+
	lDfxS7lgrVKlu6YfCv83xkaVIP9YOSwremg9jffdeq0NOR3KifgkL9NHPbILBQlNenezk5c9jel
	w4eGYmo5UCc49YeCTL/aWdcgjHxK2cmHXivqa0goUae3YPF6DJrk9A5GrHx2i2rW8j6as2F8tuW
	N69TUSMEDnUQuqi8sIhjdwUXXXdDynYoXcvTtHotBs3EqLE3gUezZow==
X-Received: by 2002:ad4:5d69:0:b0:90d:3322:4e1a with SMTP id 6a1803df08f44-90ebafc70a3mr80095146d6.4.1788366935337;
        Wed, 02 Sep 2026 09:35:35 -0700 (PDT)
X-Received: by 2002:ad4:5d69:0:b0:90d:3322:4e1a with SMTP id 6a1803df08f44-90ebafc70a3mr80094466d6.4.1788366934737;
        Wed, 02 Sep 2026 09:35:34 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef5067sm21805726d6.34.2026.09.02.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:35:34 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:35:11 -0400
Subject: [PATCH v2 5/5] ceph: convert r_locked_page to r_locked_folio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ceph-inline-folio-v2-5-6c9098112352@columbia.edu>
References: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
In-Reply-To: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>, Xiubo Li <xiubli@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366929; l=5916;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=WEHlyr4Efxhk5teTrx1ZhLj53CZbT4uxkhVjxj4C5YA=;
 b=XauyQTbxlRlgKNE1mh+cat/5ZOb1R+XGfML7xNzgZnPcv1Z7ktxRH7oWHbX5e0FkZX/v+vmOZ
 Mu1Q1HJRdpdD8yZyuZtMyvNUZvtL5c/Ty6mFO0TUQtLG8YCQUJ56fHG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NiBTYWx0ZWRfXxa3Z0YR4e+SG
 48buU6RZx7BCeiviLdSnVIRn24ni1XmDuQPVdXPxT0oySNH3nWpCjM+znUGnecUfQ89fwMKbTRW
 CsMwcWiSCayuX66Bmvst9B89pTY3IPEctE8j6sW9a2GfLVxpABC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NiBTYWx0ZWRfXygAMBCBt27SM
 YK1mdZdqpD/WUQzpvwT5ibyNbXDPY16/3MNHE5zeLjmOXznJp8/Cq8gLULbxGns42I6gu9lLNEa
 gAtNG8p9e7Sy6S6HdtIn7z4d6hM8Zmc5rh8u9jWMpb/wurPAXB3ovc2M55xlCIWqVbubDxVeNBO
 jhePmqQl/Gxd+IXMGqUCMG90AiUJiduakfXL04V8vl7E+SFfVLcw98OI7F5BgVq6kWeONgoCeRe
 7RQfKgde0QdFAoacmfHVrCW/W4d8r5xP1hCIxkoRQnMUqUuYT5nfFBUHP0zI9/yoP+VZDVTd6TS
 77f4wenzqc6Qna679ifD65sj9RTQS/aJg+Mt51ogVCx07WfmQiH7Qur5O0r/gWwgka0KQ3YRaMS
 zX+bPlCTX0StqOmq1XYERNaacwvfq8B1hLFhczRXS18dqwppD7mmFgy8Zh0rJQ5DdTMzhS6WCg6
 /G5xvdyhxSXs5IYLUnQ==
X-Authority-Analysis: v=2.4 cv=XY+5Co55 c=1 sm=1 tr=0 ts=6a985058 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=945u1j8887UpmP1-4VoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: yJtLIxwxzzGhIuGvngYh5UW0c53rPDdq
X-Proofpoint-GUID: yJtLIxwxzzGhIuGvngYh5UW0c53rPDdq
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=10 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=10 lowpriorityscore=10 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020146

Pass a folio through the inline data plumbing: __ceph_do_getattr(),
struct ceph_mds_request, and ceph_fill_inode(). No callers pass a page
anymore, so this removes the &folio->page conversions in the fault and
READ_INLINE paths and the page_folio() call in ceph_fill_inode().

Remove externs from function declarations while at it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c       |  2 +-
 fs/ceph/file.c       |  3 +--
 fs/ceph/inode.c      | 15 +++++++--------
 fs/ceph/mds_client.h |  2 +-
 fs/ceph/super.h      |  6 +++---
 5 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 71d9f7bdb0c6..9ea44ae8dd6a 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -2057,7 +2057,7 @@ static vm_fault_t ceph_filemap_fault(struct vm_fault *vmf)
 			ret = VM_FAULT_OOM;
 			goto out_inline;
 		}
-		err = __ceph_do_getattr(inode, &folio->page,
+		err = __ceph_do_getattr(inode, folio,
 					 CEPH_STAT_CAP_INLINE_DATA, true);
 		if (err < 0 || off >= i_size_read(inode)) {
 			folio_unlock(folio);
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index f0e77a1ab4d1..7ec5d3192974 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -2258,8 +2258,7 @@ static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			mask = CEPH_STAT_CAP_INLINE_DATA;
 		}
 
-		statret = __ceph_do_getattr(inode, folio ? &folio->page : NULL,
-					    mask, !!folio);
+		statret = __ceph_do_getattr(inode, folio, mask, !!folio);
 		if (statret < 0) {
 			if (folio)
 				folio_put(folio);
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 21d72b7667bc..149a82f0b3c8 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -1081,7 +1081,7 @@ static int decode_encrypted_symlink(struct ceph_mds_client *mdsc,
  * Populate an inode based on info from mds.  May be called on new or
  * existing inodes.
  */
-int ceph_fill_inode(struct inode *inode, struct page *locked_page,
+int ceph_fill_inode(struct inode *inode, struct folio *locked_folio,
 		    struct ceph_mds_reply_info_in *iinfo,
 		    struct ceph_mds_reply_dirfrag *dirinfo,
 		    struct ceph_mds_session *session, int cap_fmode,
@@ -1438,7 +1438,7 @@ int ceph_fill_inode(struct inode *inode, struct page *locked_page,
 		int cache_caps = CEPH_CAP_FILE_CACHE | CEPH_CAP_FILE_LAZYIO;
 		ceph_set_inline_version(ci, iinfo->inline_version);
 		if (ceph_has_inline_data(ci) &&
-		    (locked_page || (info_caps & cache_caps)))
+		    (locked_folio || (info_caps & cache_caps)))
 			fill_inline = true;
 	}
 
@@ -1454,8 +1454,7 @@ int ceph_fill_inode(struct inode *inode, struct page *locked_page,
 	ceph_fscache_register_inode_cookie(inode);
 
 	if (fill_inline)
-		ceph_fill_inline_data(inode,
-				      locked_page ? page_folio(locked_page) : NULL,
+		ceph_fill_inline_data(inode, locked_folio,
 				      iinfo->inline_data, iinfo->inline_len);
 
 	if (wake)
@@ -1785,7 +1784,7 @@ int ceph_fill_trace(struct super_block *sb, struct ceph_mds_request *req)
 
 		in = req->r_target_inode;
 		ceph_inode_set_subvolume(in, rinfo->targeti.subvolume_id);
-		err = ceph_fill_inode(in, req->r_locked_page, &rinfo->targeti,
+		err = ceph_fill_inode(in, req->r_locked_folio, &rinfo->targeti,
 				NULL, session,
 				(!test_bit(CEPH_MDS_R_ABORTED, &req->r_req_flags) &&
 				 !test_bit(CEPH_MDS_R_ASYNC, &req->r_req_flags) &&
@@ -3064,7 +3063,7 @@ int ceph_try_to_choose_auth_mds(struct inode *inode, int mask)
  * Verify that we have a lease on the given mask.  If not,
  * do a getattr against an mds.
  */
-int __ceph_do_getattr(struct inode *inode, struct page *locked_page,
+int __ceph_do_getattr(struct inode *inode, struct folio *locked_folio,
 		      int mask, bool force)
 {
 	struct ceph_fs_client *fsc = ceph_sb_to_fs_client(inode->i_sb);
@@ -3093,9 +3092,9 @@ int __ceph_do_getattr(struct inode *inode, struct page *locked_page,
 	ihold(inode);
 	req->r_num_caps = 1;
 	req->r_args.getattr.mask = cpu_to_le32(mask);
-	req->r_locked_page = locked_page;
+	req->r_locked_folio = locked_folio;
 	err = ceph_mdsc_do_request(mdsc, NULL, req);
-	if (locked_page && err == 0) {
+	if (locked_folio && err == 0) {
 		u64 inline_version = req->r_reply_info.targeti.inline_version;
 		if (inline_version == 0) {
 			/* the reply is supposed to contain inline data */
diff --git a/fs/ceph/mds_client.h b/fs/ceph/mds_client.h
index e7a262c9c2ab..d4d620fb8417 100644
--- a/fs/ceph/mds_client.h
+++ b/fs/ceph/mds_client.h
@@ -398,7 +398,7 @@ struct ceph_mds_request {
 	int r_err;
 	u32               r_readdir_offset;
 
-	struct page *r_locked_page;
+	struct folio *r_locked_folio;
 	int r_dir_caps;
 	int r_num_caps;
 
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index ed750ea73d85..d3dad07470ba 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -1172,7 +1172,7 @@ extern void ceph_fill_file_time(struct inode *inode, int issued,
 				u32 time_warp_seq, struct timespec64 *ctime,
 				struct timespec64 *mtime,
 				struct timespec64 *atime);
-extern int ceph_fill_inode(struct inode *inode, struct page *locked_page,
+int ceph_fill_inode(struct inode *inode, struct folio *locked_folio,
 		    struct ceph_mds_reply_info_in *iinfo,
 		    struct ceph_mds_reply_dirfrag *dirinfo,
 		    struct ceph_mds_session *session, int cap_fmode,
@@ -1213,8 +1213,8 @@ static inline void ceph_queue_flush_snaps(struct inode *inode)
 }
 
 extern int ceph_try_to_choose_auth_mds(struct inode *inode, int mask);
-extern int __ceph_do_getattr(struct inode *inode, struct page *locked_page,
-			     int mask, bool force);
+int __ceph_do_getattr(struct inode *inode, struct folio *locked_folio,
+		      int mask, bool force);
 static inline int ceph_do_getattr(struct inode *inode, int mask, bool force)
 {
 	return __ceph_do_getattr(inode, NULL, mask, force);

-- 
2.39.5

