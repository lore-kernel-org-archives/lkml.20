Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA54535FC9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076392; cv=none; b=st0B4DceIE0j9ULfIGeJWWebQOruZ3MV/R7t8kPHN904Ja/ztSXl25V0O+V0hKyiHCcXyIk8vT2NSoMeTl/9iNfq2pnp3yF2Qpli+Py3iGTVgGSd3dyFPWz2vqPSE8Vw4YL2aPk0CVCYGlEAdIoX/iDqvTKRWUwwaBZylK0AcL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076392; c=relaxed/simple;
	bh=W6B9AjhIZeXspmpCYDtaD6xtJG3LTCnH7YMHFx++ScQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyfbww5sCzeFomGm2Rwpj/wXJcy3Dj6eECmZfsqbUePIF13DeIsEMIDd53+MZn1mNYKEYCU0lAsM3MqSt9wRGVSn7InlEWLsBvtdw//cFVRxHuh+u4+drgqjca0ke2f5mfxmEn+E656bWIWyZ9mMnCMMzB5sRgLBFCJ5sZhdse8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quoRFSvk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quoRFSvk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so3672038a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790076383; x=1790681183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OP4ep2F3i+YMFcbmXutjukSDO+90ndszR4jUA8kjXWY=;
        b=quoRFSvkSfHWLyeLXSIWVAgExCfvd2a+6mus0xelgtaCfUDBqAw4Jk79CLDUDovtiB
         qDGzYGScoR/8buiy0f9L+DfTwISQLBtxNUun6DsXrKfsulOEsFO4bgU8PxSGZx4MDTnr
         AlWSK0xu2N1WsFKKmrcEfzMwL/f/Y1FUUs3S4zVRa0CyVA78XROpJGvhUpBT0Qh4+uCk
         ZMfU7rAWW/SPV14WHRm6gEa/Iqv0ma27siKx47xaodrFFgoD1axf+B9E8Qz2rDGGcIg6
         waNvmWZgqMDnYbygZ71N8Hu2njwf5sfLzjeS+F99rvEvl0yaniajvLAm8T9htESKRmti
         8aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076383; x=1790681183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OP4ep2F3i+YMFcbmXutjukSDO+90ndszR4jUA8kjXWY=;
        b=oRS+0uRXvNmNnDdmRlUGiGoDHqIufUBnrBocGqhxdrfJNYIJg6srbK37vXxo24mGPB
         2F/tWBh6PcrZyyLBzWCf7FM+NjoeIC+neeUtxhltGzOH87oMDhs+T3EwjqqE30fLrLrJ
         rk08vNHkMqEnqkmfDdNSwDHb9p7BiUAPuhPigD3JG/Hf4M7lHQH8NSKi3SzyCdZf7lhA
         SNODLaixPWbsldueUxZppd/1Jdtc/GhM975UqwzjWgovM1sUJYWDoByu4TTqRmU10FRZ
         JEfrZvOZkMDhZH2c6VtTYpsEDzg7EnoB5TRKCdWS0NdpYBIVyXOd8yQkV+p9tzGVN3/e
         39sg==
X-Forwarded-Encrypted: i=1; AKwUvBwUZdjvTtl0mRFpG3X1maWz6cvfgX9DfVaO1PNjAaPxqbSbr5KdNBk1OrYxVP2FTsb6S61Rbf7VlvSUk7o=@vger.kernel.org
X-Gm-Message-State: AFuF++keRzTl7+NY3pdw9WLyUqCM5ogOtNDT+BVLQQNZrbCNl1tlRrbL
	PZvRLsxIV3lW6cveZrraiC/5D2R35hlePXjIYUrE5tRUP4Q9fibOI/7D
X-Gm-Gg: AYBFou1eEqs1Fakrv/sEZEQNZacQ6HFxEVGnXMykTEflrfkQ9Ej0VdGLmX9Mw1s7KiO
	JhRQXL+9lfPLhO9CEpvMW0otKxuhl7/GpKnZK5wWHO0ewBnYQKCEReAXAPlB2oW6bhTKtMjpazZ
	zREUu/SVFz2gGo0SK0/F8blt8XOyHvA8Z4fKpYhNbfrC8KdFXkynJ81mGgCuOb2mP4UssDF5KmY
	OdnN8MpyF3/22ktU8Rvc2sFycpVinL3vytpsV+sikahQE64EAptOpmNoM22s9vmYDGA9Wh1RVWz
	7TjPP9A7W8gq25ulDwZ/t5CwLHf/x6NVQsukmH+UrWytJa0SBoLvylcPUuqu/btHgeRBir9naM6
	zM8Kld5EeUb+xuS4dE7OzlSYnST9Y+qRbF7J7SijSy/RkRel9SHphaboiE1m1G483zqGzNC7sc/
	BcYoFcmEctKLbAlG3wgzD9uQLdSNo5kG3jol+g9BKxw3h6Z8e1tRbGCUWRNeQJPEFGT1zg8Qa2o
	sK7YezsttYdsTpLoD8=
X-Received: by 2002:a17:90b:1c08:b0:3a0:5413:49b4 with SMTP id 98e67ed59e1d1-3a073201a61mr830901a91.39.1790076383278;
        Tue, 22 Sep 2026 04:26:23 -0700 (PDT)
Received: from vultr.guest ([139.84.147.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6131506dsm5055854eec.25.2026.09.22.04.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:26:22 -0700 (PDT)
From: "Mayank Jangid (OpenSec Intelligence)" <mayank.jangid.moon@gmail.com>
To: cel@kernel.org,
	jlayton@kernel.org
Cc: neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	"Mayank Jangid (OpenSec Intelligence)" <mayank.jangid.moon@gmail.com>,
	Kushal Khemka <kushalkhemka559@gmail.com>,
	Kkartik Aggarwal <aggarwalkkartik@gmail.com>
Subject: [PATCH] nfsd: prevent NFSv4.1 SEQUENCE reply-cache overflow
Date: Tue, 22 Sep 2026 11:26:08 +0000
Message-ID: <20260922112608.1256363-1-mayank.jangid.moon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfsd4_sequence() narrows the reply buffer to the session cached-response
limit before accepting the slot sequence ID. A client can negotiate
ca_maxresponsesize_cached down to NFSD_MIN_HDR_SEQ_SZ, leaving no storage
in the slot trailing sl_data[] array.

A padded COMPOUND tag can then leave enough space for the SEQUENCE opcode
but not its status word. The encoder returns without setting
cstate.data_offset, and nfsd4_sequence_done() consequently copies the
whole reply from offset zero into the zero-capacity slot cache, causing a
heap out-of-bounds write.

Compute the fixed SEQUENCE reply size, including room for a following
operation error when necessary, before restricting the reply buffer and
accepting the slot. Return NFS4ERR_REP_TOO_BIG_TO_CACHE without changing
the slot when the result cannot fit.

Also record the appropriate NFS error when an operation header cannot be
encoded. This prevents an incomplete operation from remaining marked
successful and being treated as cacheable.

Fixes: 47ee52986472 ("nfsd4: adjust buflen to session channel limit")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Kushal Khemka (OpenSec Intelligence) <kushalkhemka559@gmail.com>
Signed-off-by: Kushal Khemka (OpenSec Intelligence) <kushalkhemka559@gmail.com>
Co-developed-by: Kkartik Aggarwal (OpenSec Intelligence) <aggarwalkkartik@gmail.com>
Signed-off-by: Kkartik Aggarwal (OpenSec Intelligence) <aggarwalkkartik@gmail.com>
Signed-off-by: Mayank Jangid (OpenSec Intelligence) <mayank.jangid.moon@gmail.com>
---
 fs/nfsd/nfs4state.c | 18 +++++++++++++++++-
 fs/nfsd/nfs4xdr.c   | 12 ++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 9c4adf311..6c246d851 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -5016,6 +5016,7 @@ __be32
 nfsd4_sequence(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 		union nfsd4_op_u *u)
 {
+	struct nfsd4_compoundargs *args = rqstp->rq_argp;
 	struct nfsd4_sequence *seq = &u->sequence;
 	struct nfsd4_compoundres *resp = rqstp->rq_resp;
 	struct xdr_stream *xdr = resp->xdr;
@@ -5025,6 +5026,7 @@ nfsd4_sequence(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	struct nfsd4_conn *conn;
 	__be32 status;
 	int buflen;
+	u32 maxlen, respsize;
 	struct net *net = SVC_NET(rqstp);
 	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 
@@ -5102,7 +5104,21 @@ nfsd4_sequence(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 			session->se_fchannel.maxresp_sz;
 	status = (seq->cachethis) ? nfserr_rep_too_big_to_cache :
 				    nfserr_rep_too_big;
-	if (xdr_restrict_buflen(xdr, buflen - rqstp->rq_auth_slack))
+	if (buflen < rqstp->rq_auth_slack)
+		goto out_put_session;
+	maxlen = buflen - rqstp->rq_auth_slack;
+
+	/*
+	 * Ensure the SEQUENCE result and, when needed, the next operation's
+	 * error result fit before narrowing the buffer and accepting the slot.
+	 */
+	respsize = nfsd4_max_reply(rqstp, &args->ops[0]);
+	if (!nfsd4_last_compound_op(rqstp))
+		respsize += COMPOUND_ERR_SLACK_SPACE;
+	if (xdr->buf->len > maxlen || respsize > maxlen - xdr->buf->len)
+		goto out_put_session;
+
+	if (xdr_restrict_buflen(xdr, maxlen))
 		goto out_put_session;
 	svc_reserve_auth(rqstp, buflen);
 
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 606ddcb08..e5489eec6 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -6637,11 +6637,19 @@ nfsd4_encode_operation(struct nfsd4_compoundres *resp, struct nfsd4_op *op)
 	unsigned int op_status_offset;
 	nfsd4_enc encoder;
 
-	if (xdr_stream_encode_u32(xdr, op->opnum) != XDR_UNIT)
+	/*
+	 * nfsd4_proc_compound() stops only when op->status records an error.
+	 * Do not leave an operation that has no encoded header marked nfs_ok.
+	 */
+	if (xdr_stream_encode_u32(xdr, op->opnum) != XDR_UNIT) {
+		op->status = nfsd4_check_resp_size(resp, XDR_UNIT * 2);
 		goto release;
+	}
 	op_status_offset = xdr->buf->len;
-	if (!xdr_reserve_space(xdr, XDR_UNIT))
+	if (!xdr_reserve_space(xdr, XDR_UNIT)) {
+		op->status = nfsd4_check_resp_size(resp, XDR_UNIT);
 		goto release;
+	}
 
 	if (op->opnum == OP_ILLEGAL)
 		goto status;
