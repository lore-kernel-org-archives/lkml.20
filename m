Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396318;
	b=0cZ8tdHMIXmFD3sOyd9iJwlhFFgnAASELfmGZcxHGz6O6tuYWr6N4cMmO1I3yyjtpSd6
	 tI8/BzoD6ZfJfktp+4nCDmcAXxcPvyl4AozyxE7LIXEjtTQvz3/iRJ63SNe1hxcSLSZEW
	 HvWBwXvPe8TCPJCvCKOePErTTZ17FEjitH4AIsdt9onmKbr6OQ3Xs3EcLdkxmCGh+vmh0
	 QZyo6Fcr6ReNVJSnGUw5j4TRDWTYPImTdRLblwhr2ZjGZYHMyV0QmcQUWfBUlEpg2FWM5
	 7XBbtQhFzENNqo/4JhdOuMHfausDO4ChbjRbKohmQXq/29fKfxECrYNbK5vHJs1Tb9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yCiSFwp1cCOa8SOdttgJlPnlrtvKmubMnzBrBcTEAPw=;
	b=E1PnpyRFpIHMUYaNa6AWmhU595WFlkPZlsgJMV9kyf1S6Q/h1RpL+1u/dj9o7BLTtnmG
	 3w98zaFBUdiiaqWVexbx0LQgjsH6RvsijaAjdzKkMXbTrDN09aeHILR8FlCQFpGKVtYi/
	 VZ8cLrkkzW/eVEzvwL3poM/TX59NDOmToEwTLzzJrXm9biNlnWm8A3/9exfjV6VxLFF3n
	 pgEvpCULM4ZRfa6LkyAR9y4UBnx4o1CfuKeafQaTNtWPctyN+rkI3zVyj40uzVMyyNy+1
	 1ZEWObMjPWuK8fNK+cTV0zBQvlv665v+QNDZiRLh0HcfemBa1IXK6g/k0OFYUsP8W3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8XBL0xo;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A039606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A039606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8XBL0xo
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afbd2c386so672835f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793396316; x=1794001116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCiSFwp1cCOa8SOdttgJlPnlrtvKmubMnzBrBcTEAPw=;
        b=h8XBL0xoOGZ4AQFHfHYcT/MlggAh9bw44ZnQnHfwNE1mv9HPuuur+kIFlsNEaLMqlQ
         SNRyWLTnf/rJGipSl+BRD8ReZOJveoxVKyVDv9+h69d2cRH3DApE7dbSqSPDivXf6zM2
         GJaR1Ja5OHdIozjxoyIPJ6OnRTEv+c9hjAYOP881XxWo95WuLjAwMrJBk8SK66Mdwl49
         +pxaqdUE8kJO6fXENWsKJ3Bb9qtsaxvgsBZxnJD1ySZtpgXXIJh102Q3b7HTDauyqlW8
         OUwP6wpT1zuNhH+5Ij0hkEJxk4e/1l3xwmJqwY0whEH2jQbfbnW6ho2g5LRRT83L8e88
         IxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396316; x=1794001116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCiSFwp1cCOa8SOdttgJlPnlrtvKmubMnzBrBcTEAPw=;
        b=qaMX2B2O7s02w0x61uWl7nnBE+7QSyTP6xKBpL0q72uwJS1sfvqQcAqwNWN6J4aFeu
         JBM/iBI6EQv9gL9Y94net2zD8OdqkJCkGuerV4s30I5vO5zbhY56a3D5odKMMFuAogQn
         x2h6d+8wZF/Yu6gwJ8MfKVKUcl3o1l1HZ262oq8h/RDLYvkq5cKYAtfQMHLhn9qqBu5E
         +/wx88+VwKOPwx5SeNelj0B7tLk9onsfwZWSs7vMjjBmvIvLNBOGfvVXgRP1og7fZnHB
         LNUQmplzMIxvtibKq+LoJlYD1PfjfDKL8VoENr7B9FOnFhly/dQO5gD3bXm4TAP4FsuO
         evKg==
X-Forwarded-Encrypted: i=1; AKwUvBzesF3BnlwBpiytlCDeSjfHlmC/1s5fvhdF25V1NNK6KL9X/Gcyf6eyfRpmrvu7uFmKMnV+p254Mhcn3Dc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyDU+4bfZOvISjx38WGGpSx2g3bRO9H7pN/hNjVCaw7fgg+uVe
	MdykExNEab552Q43xTlDhPI18+dlTd8STCs/sL3TCLqLVZKcoPCGBwcgEA8pHsJn7fWx6w==
X-Gm-Gg: AYBFou3MjLP7LiHUfonyyNzgOruT0sn1SMAHLc76kYWmYLorybYnE8jnPv+Ar0Hx7JW
	oVhkMxyQk5oewc+ElPtiruvGLgMFFVCM+wg8TqBJAqANltvMLqK/J7meBYB3U+LnHtqxyZGKNLv
	NZHUMk7EiFwHKKQBlkRAfKNyqC2Yu63e8TMLsMCNaYQsTevLLvvv/XeThveFbdTmqlBFh//GVML
	Wfu1rXsxPwpk3tMWFuUeonrzQAzC+tZcae5FoKbbcYInRTKnmDPOZmmkLbMf3yDwcU9atA0xyt1
	lU9f4q5z5MIDGLas3uCPtJ/GltpF+xmT1oWqnrS8xf5j4Ql/RUudFtp89EnzhuMIVzLZjhZlhiZ
	4gqGUQxUo+eridojMK1NTdn8Qao5MObdX0YllwzpmK5KRvv+o4+tBJdeTM6rcsHUENaboDnLm4r
	5yw7vpWyXQ4Frzjd4LG3IM7lTOHmaifOdBDMNYZf0/5nTQGLEc6Or2M5dspyT+y5rEqHXtjUWR7
	LBYgqNETjFt6CTSL8N7YeDCV6rqX3dAqFZ86hZu4rRpKwakcJoLGzRPDZsX5Alt9vhFAQ08q6Si
	C7GGOXfRaDNKT9lWHYGAsx8Y
X-Received: by 2002:a05:6000:1aca:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48e6e4fcfacmr8292130f8f.50.1793396315576;
        Fri, 30 Oct 2026 14:38:35 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm5547147f8f.52.2026.10.30.14.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:38:35 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <stfrench@microsoft.com>,
	Henrique Carvalho <henrique.carvalho@suse.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <andrey.misyrov@gmail.com>
Subject: [PATCH] smb: client: fix OOB write when compounding SMB2_IOCTL with encryption
Date: Fri, 30 Oct 2026 22:38:27 +0100
Message-ID: <20261030213827.2216453-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
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

On an encrypted ("seal") mount, SMB2_ioctl_init() keeps the IOCTL input
in a separate iov (iov[1]); iov[0] is a 448-byte buffer from
cifs_small_buf_get().  When such an IOCTL is not the last request of a
compound, smb2_set_next_command() pads it for alignment by copying the
whole request into iov[0].  A large enough input overflows that 448-byte
buffer and corrupts the slab; the copy also sets rq_nvec to 1, so the
input buffer is leaked too.

An unprivileged user can trigger it by creating a symlink with a long
target on such a mount: the native symlink is sent as
FSCTL_SET_REPARSE_POINT + QUERY_INFO + CLOSE in one compound, so the
IOCTL is not the last request.

With slub_debug red zones on the cifs_small_rq cache, the overflow is
caught on the next allocation from that cache in the same compound (the
0x61 bytes are the 'a' characters of the symlink target):

  BUG cifs_small_rq (Not tainted): Object corrupt
  [Left Redzone overwritten] 0xffff8a59c7790500-0xffff8a59c779053f First byte 0x61 instead of 0xbb
  Call Trace:
   check_object+0x1a8/0x350
   alloc_debug_processing+0xab/0x110
   ___slab_alloc+0x7e/0x2f0
   kmem_cache_alloc_noprof+0x28d/0x4b0
   mempool_alloc_slab+0x16/0x30
   cifs_small_buf_get+0x1a/0x30 [cifs]
   SMB2_close_init+0x8a/0x100 [cifs]
   smb2_compound_op+0x2571/0x2b50 [cifs]
   smb2_create_reparse_inode+0x27e/0x490 [cifs]
   mknod_nfs+0x1ce/0x2e0 [cifs]
   create_reparse_symlink+0x119/0x180 [cifs]
   cifs_symlink+0x19f/0x8e0 [cifs]
   vfs_symlink+0xa3/0x1b0
   __x64_sys_symlink+0x41/0x70

Pad the input to a multiple of 8 bytes when encryption is required.  The
request is then already aligned and smb2_set_next_command() no longer
copies it; InputCount still carries the real length.

Fixes: 90f7c100d2dd ("smb: client: fix compound alignment with encryption")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
 fs/smb/client/smb2pdu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index b140ec0a71a8..71d9b698c208 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -3432,6 +3432,7 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct TCP_Server_Info *server,
 	unsigned int total_len;
 	int rc;
 	char *in_data_buf;
+	u32 in_buf_len = indatalen;
 
 	rc = smb2_ioctl_req_init(opcode, tcon, server,
 				 (void **) &req, &total_len);
@@ -3439,15 +3440,18 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct TCP_Server_Info *server,
 		return rc;
 
 	if (indatalen) {
+		if (smb3_encryption_required(tcon))
+			in_buf_len = ALIGN(indatalen, 8);
 		/*
 		 * indatalen is usually small at a couple of bytes max, so
 		 * just allocate through generic pool
 		 */
-		in_data_buf = kmemdup(in_data, indatalen, GFP_NOFS);
+		in_data_buf = kzalloc(in_buf_len, GFP_NOFS);
 		if (!in_data_buf) {
 			cifs_small_buf_release(req);
 			return -ENOMEM;
 		}
+		memcpy(in_data_buf, in_data, indatalen);
 	}
 
 	req->CtlCode = cpu_to_le32(opcode);
@@ -3471,7 +3482,7 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct TCP_Server_Info *server,
 		rqst->rq_nvec = 2;
 		iov[0].iov_len = total_len - 1;
 		iov[1].iov_base = in_data_buf;
-		iov[1].iov_len = indatalen;
+		iov[1].iov_len = in_buf_len;
 	} else {
 		rqst->rq_nvec = 1;
 		iov[0].iov_len = total_len;
-- 
2.47.3

