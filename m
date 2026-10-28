Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160696;
	b=WFmZDdUvii1Y23r/jqDb2X5dMErV79m/xJUfyNXtRMdJVO2WG00mrFgzt9er8gn75THn
	 oqN2Qp4Tszh9iU73wWfyf9rOZjVN6gtNdzziC8e2EgjQsletZhVHpQKovb+El+VoA/HRd
	 Fb0VhH+epQbmVjrIYhxj4qq39PNkcQPI2ml3uR+tOvgZ2QI4MiSXx/FB/DtJdm3WtSWTU
	 YzVwNEW2sbj0JWDpzdjk/0Az1vBucsshtZVn//GCmo8yaXr2Lq8JSLO+EmtBBFbmXnAxl
	 lBkz6PYi5V820gDycmQXY2VmZsRaKvswLNSoTZzj+5CgwZmTvQbAz9e5rToguyT1q4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160696;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=atJXJjCnSCB0xHH38cay+0knolQvxdqlRxF4Wm5JIuk=;
	b=3OZDRk7vPkwz/xu71MoYI4pEFNQQ6zMPh8ovLsngzFEzDP5xTzHGAMvN5/EkVKnIrDsp
	 2gafDkY6Ih1GVKals05/P/r+c9eN4KzJf7o/PLLrClXEL7I9axj9JqPzarTvcVNMDH9GM
	 nMKuTDsJVaX3NgjJ+FDM2+in2xN1KXuqJQfcP5H4G7Dw2ds/zhEMvIm8y2h9k+Kv+s/72
	 796Lt37DmrHLmRhXcqY5sMRhGNxXMygzy+kguzgqX29KgSRaZlsYn8VoqkE0/wGh9NQ1R
	 YktfZFootxbTsE8lb8r3iQYXUaAmb4CnQMtkGCRZVxijpwfQBXRcPnXNuSCm/4iVjhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=hMOl8yNu;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=orEpq5ZN;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F91606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F91606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=hMOl8yNu;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=orEpq5ZN
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id BB9411D0017A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:11:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 28 Oct 2026 00:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm2; t=1793160695;
	 x=1793247095; bh=atJXJjCnSCB0xHH38cay+0knolQvxdqlRxF4Wm5JIuk=; b=
	hMOl8yNuxPiLKKBzmEaGDzTz4sYLMM6zOilKZ6ai+5oeQ0sjN4yTNu1IjhEnDVoR
	eVmj8KIJl39Ja/EspZJOhUMg7uGZcdCtDwylTm0w1vB8f4QHVl5vAMCHVNjq5RII
	4ClbGhIT/ub4K4Eh32zLW7mIXHI3IW116lidsCCbBSoSoKQKq74vyxt8m0O6EbA+
	8RwSR8XXgFRksa4Yq+WvoDOjDJaVzrBC452j296QnHrp4AFRTfAzOVEMIzNzn4w6
	eMdTWsved3OVGeysrpg2VPX4LYajvJ0FAVqlJcbzVyhKOw4zR+GAebmED1+i3Glc
	VDjdALdfQzwgG44nt/NYVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793160695; x=1793247095; bh=a
	tJXJjCnSCB0xHH38cay+0knolQvxdqlRxF4Wm5JIuk=; b=orEpq5ZNxNWALSPEB
	C9nWQerus7RgX6CDDc43zu/061CUCLJ82pE4h+ZXyGycEMVtbIzdxhZO1ugS3ID9
	ApsaynWj5CuksXPsV516+1ilpxTwzahR/4Fmz/9OOFCVOXNEM2O40O0XX287QVeV
	JBLi1MUTn7K+kexNOhKp/SlBhQ7WOcNzs/adfdfIzst8ioujOt20szKVgA19EpXA
	Y18NXX/gZayxB28m9J1yoql4uPObzjAefXxr+yq77m5zXl2WemnV0kkmcvk6MBBi
	Ns3qggbMBGv8xK2f7q3JLly+BMybR1IaDrjPhbgAZ+lJJfmW9FNwhBxNw45s4+Ip
	sDBlQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793160695; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:JH7ZM46OugiI1e6i68/Di19N5L0qZnPjWHYe3ImhLRJZ6gz
	6U8ZiV0LpLqc1K0pAqkXq0qmiO68S+bqPhLkPdK/IEBf57lTdsujWXd5K+nnnnns
	pMEy1wixW2EyZRLCI6qeyJk3dwz2V17rO5ARc3e5R2BO/52ZQdxfp3bn7nznquh/
	Qs+Wx9+lK8DapgxuoOQBPbMpAL8h/gIROq5IcMyTzDVs899sq1MVCx8imLzeSn7d
	z4cXmEQ9TLOpjfWWVIn31o4+dCAq+vsEHDDI68ROrHYna3ezTyUMuBQkqCRpgYho
	7hsYPsxeWSCS4udcuyZzT3KkCfZeySR50Wcgdyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:vHD2IqxrwWPBdKVPP1xZwiPEDOeNBws4+zl796QpmDI=:1SBGQ55hMfRV+AXoV+nzLRXHu7LjnGyzKH2qu9sOmhs=;
X-ME-Sender: <xms:93XharTw7v2fOE-is0Gjw-McGG1G34pqs4mRafYMteY3daI1hoW33g>
    <xme:93XharC6Ziu4t813-A7xiaiB1-BMPPDlfp9YshfnowoXyvyA08tlT7hHLUHJ8VRpo
    vzXilfbDv1wVC--q7k9qQ_MBa8GrJBJbrxdKIHnrAzmLK4uhA>
X-ME-Received: <xmr:93XhaqLgBXgntJ_4hpcMhFeFnAyUFC1JM7GnxiD82paYC7nqMLnAgqyn5jUzYyU2yblgeov7vcBe_AhmtyK3GHo52k10XSQ>
X-ME-Proxy-Cause: dmFkZTENfLDHyDJO3xIctN9oTnCe8vHBA0qriIGQ08HQKxFpV5yDErZ6Zl+Qiz2rvnL2RP
    /e8uvqhnjclTN6I8HcJ15PxD9MOgabZnxHa1DRPnMkU8q7xajrLGz1GdMP99UnyZHoS731
    /Aj77w4cu6PxnrKwYGROFG116fa9OOXaHq+Ym4QJMn3vOGueONZUZsZSlbJQhIOksaAl8f
    4k1E57wFfTk3YyddMhp9w850VOu04nlPL35kdVX8XIRekO94F9issEyTfIIIAKz2X5DfFH
    0+vyck7E3d86lcZxjpxELDEkQ3cHkx8WMQfXUkd0MsVNyDmBKgbQ8MoXoAblFyqEUg9zZ9
    SN+TLAR86VQAWmW/pK7DksdD7Lc40iOXP1KhRtxRS8tVYheB3B0TYPCSacu7Ll8G20tj3t
    aipYgz4f0z5p6sFHw7Y1iekpqJzfPjV4xJELA+KgRBQLU9jQdrg6A5RTmqVHwYL+ou88Ca
    m7ceY11tUS0kGOj5y7cKKUNQNVMhAFcEC8YzSVrq6tFU2/uc4x1ykfteF4Uf4aWh36OXNa
    8wSEfPObpz7pv8Qj7LaRgB+4dvmxprahE5UxfVSHY5WP8nXNjjgDS3wad/XfSairIB2+DS
    mBaJBIJXeScUt2w7XyF1Joa9E23D3Vzo4FSsG7LCq+1TR83vhxVOpx+2/Wxw
X-ME-Proxy: <xmx:93XhauADj-rQjAfcZCzXugioCEEJyn6wOXHnCp4sWPmCH6DuMPYSnA>
    <xmx:93XhansBq_6VAVbiloLqD65umhYpw-wQhjG1_ISzyOG-nlbhXLbA_w>
    <xmx:93XhakSOudYpLqe0RgC0o9p-t_vzQSd-Ktp-T2GD2tOCOtuwD_c-hQ>
    <xmx:93XhamLk0wlpDki77olSMfCxsJChDbDGvSMbi8LWyQmE3CapIhOuaQ>
    <xmx:93Xhau1S6QRVZ_ZP-wfcltEZMkA5DqrgaR_AIjQcNHgZq0yrK6hHSUY2>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 00:11:32 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] nfs: use d_alloc_trylock() in silly-rename
Date: Wed, 28 Oct 2026 15:06:36 +1100
Message-ID: <20261028041023.3738553-9-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261028041023.3738553-1-neilb@ownmail.net>
References: <20261028041023.3738553-1-neilb@ownmail.net>
Reply-To: NeilBrown <neil@brown.name>
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

From: NeilBrown <neil@brown.name>

Rather than performing a normal lookup (which will be awkward with
future locking changes) use d_alloc_trylock() to find a dentry for an
unused name, and then open-code the rest of lookup_slow() to see if it
is free on the server.

Acked-by: Anna Schumaker <anna.schumaker@hammerspace.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/nfs/unlink.c | 59 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/fs/nfs/unlink.c b/fs/nfs/unlink.c
index 11a46a993e11..0eddc7ee1115 100644
--- a/fs/nfs/unlink.c
+++ b/fs/nfs/unlink.c
@@ -451,7 +451,7 @@ nfs_sillyrename(struct inode *dir, struct dentry *dentry)
 	static unsigned int sillycounter;
 	unsigned char silly[SILLYNAME_LEN + 1];
 	unsigned long long fileid;
-	struct dentry *sdentry;
+	struct dentry *sdentry, *old;
 	struct inode *inode = d_inode(dentry);
 	struct rpc_task *task;
 	int            error = -EBUSY;
@@ -468,26 +468,45 @@ nfs_sillyrename(struct inode *dir, struct dentry *dentry)
 
 	fileid = d_inode(dentry)->i_ino;
 
-	sdentry = NULL;
-	do {
+newname:
+	sillycounter++;
+	scnprintf(silly, sizeof(silly),
+		  SILLYNAME_PREFIX "%0*llx%0*x",
+		  SILLYNAME_FILEID_LEN, fileid,
+		  SILLYNAME_COUNTER_LEN, sillycounter);
+
+	dfprintk(VFS, "NFS: trying to rename %pd to %s\n", dentry, silly);
+	sdentry = d_alloc_trylock(dentry->d_parent, &QSTR(silly));
+	if (sdentry == ERR_PTR(-EWOULDBLOCK))
+		/* Name currently being looked up */
+		goto newname;
+	if (IS_ERR(sdentry))
+		goto out;
+	if (!d_in_lookup(sdentry)) {
+		if (d_really_is_negative(sdentry)) {
+			/* try to get an in-lookup dentry */
+			d_drop(sdentry);
+			sillycounter--;
+		}
 		dput(sdentry);
-		sillycounter++;
-		scnprintf(silly, sizeof(silly),
-			  SILLYNAME_PREFIX "%0*llx%0*x",
-			  SILLYNAME_FILEID_LEN, fileid,
-			  SILLYNAME_COUNTER_LEN, sillycounter);
-
-		dfprintk(VFS, "NFS: trying to rename %pd to %s\n",
-				dentry, silly);
-
-		sdentry = lookup_noperm(&QSTR(silly), dentry->d_parent);
-		/*
-		 * N.B. Better to return EBUSY here ... it could be
-		 * dangerous to delete the file while it's in use.
-		 */
-		if (IS_ERR(sdentry))
-			goto out;
-	} while (d_inode(sdentry) != NULL); /* need negative lookup */
+		goto newname;
+	}
+	/* This name isn't known locally - check on server */
+	old = nfs_lookup(dir, sdentry, 0);
+	d_lookup_done(sdentry);
+	/*
+	 * N.B. Better to return EBUSY here ... it could be
+	 * dangerous to delete the file while it's in use.
+	 */
+	if (IS_ERR(old)) {
+		dput(sdentry);
+		goto out;
+	}
+	if (old || d_is_positive(sdentry)) {
+		dput(old);
+		dput(sdentry);
+		goto newname;
+	}
 
 	ihold(inode);
 
-- 
2.50.0.107.gf914562f5916.dirty

