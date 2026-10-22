Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641212;
	b=LhQ+R2L61IzNKBBCjt7un9IIumQB+pW2Jve2a7+tixeP8DOQQSD5CWqXfYtp3As6Pveg
	 uUI/dc2LtFUSJEq74piaPXzfOOAKxu3dou6jrD8VLSsL8gxk7WnuDV9pqem0feWedO9kK
	 fwL24wGIvqNpReLfW2HxEbx3RzqPEKQ6vEFIoiVE1CKu1JdfRpTJBPgrelKY4rAPEK0Yc
	 biN6n/Q7n0Hh6G23IggHtK8zO4YZDwg7K87x/llCoVtXLKm/7hL+zeUuSS2aSbw7t6A99
	 RS2MWSDHTs/Y7TtHgx7UzasPu9R3aMxh13fItUD2FmyRB8REJc7o32JE+Wu8CAQLQTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PFcEYtHPDZ2pIPyW3D/zakCIslo6EG3bD7BCUgb7zS0=;
	b=3YuaOMpaNbOPa1FiHi2s3Rqqw1+Hlzy4+Ag4Bc4Ko0UnumBsGC665cvQe/0TfbuyeoZt
	 rPzos2xokH1qlA5unaAbALwahAESvacpxj87RVo1H+Hi5Z/FZa3USFDtxdtBGtxYB4XLa
	 IT1D6eGkbmHoD9UNCE0vrbpwP9Z3/ifvgqIQd/oT/Ar/Av2BVTxKyKDDto28S2nwlv8fa
	 OftJL23WiVWFzsoEAD9MJ1uwt64/z27e8YlNuWTZLtslNEf1cBtp0v0jcxUJSA1ypaBf+
	 COnYGLlOg7QYXGx2YbGlU1WjeO6DtxyXEnl4RuPsLgw5H+/njl/V8nRcC00fov2KWEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMqL+8ZH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB0606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1EB0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMqL+8ZH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso12336965e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792641209; x=1793246009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFcEYtHPDZ2pIPyW3D/zakCIslo6EG3bD7BCUgb7zS0=;
        b=FMqL+8ZH9ONMWspAF8nRpPBJqk5QDZtF5QeuMWh+aapUCPJ7jomchmxdjUxPjq8mOK
         PbqpzMd/W0i4Zvw5bsbToURV3dwH6Nnpj+7e/a+9VF2iYsIC31hSlsZTVnPduJ1ifdbZ
         hp5JIeDyf9+4t5+IbMxumxb5jBppGp4ZWY1ASie0brS8yUK+BS1N2116VPnVarnfLAyK
         rrkKzfrFVQPOAKj6PUaooI81hO59sisaoHFG14VuOrgtvTBbtKkPkcXuKKhnjXwOzevv
         nPnt5dGNrljKoIkJL/GSfw2RnEh7D6hszsxcXWC+FUxYAbGmIKIcPNeD4TRPk0MALfsw
         Jzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641209; x=1793246009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFcEYtHPDZ2pIPyW3D/zakCIslo6EG3bD7BCUgb7zS0=;
        b=RR7vaEEu9Bqg1zivFZABnimaSeGuB21UKQtXXWXYSgGe4IgwiQDkcwdvJChIy5mSCj
         O4/ikyIo+jQIp4Ym0Sy/6ApS4oj13HJmnnZ+BP4K5v/60KDq79OAMpu7BpMp19fLa++H
         Egek+1wQ355VsXt/2vmRdwsxznuLI2nL95ZR2bbJj15D+eaCBVz6H/fr8AdtwpFeRZNF
         rVOUs54YomV+NGPCYdnwXtlHWRvmFqAlfN0JqnGuejU0FP7Ou4GmGc8ifycPVJvP2veh
         4BHUnZhfDHuL9qhjMSZRl7SkOdTXK0dHChuuLBYA306zO07T65CDEdl3/SlvL6BoQ3r8
         CfvA==
X-Forwarded-Encrypted: i=1; AKwUvBzXFXRiCT7TdgLTtBEcRdf8ylBJSJQrGeILas6PTKbQfu8WvyCHyYTGOdCxSNFuxLL+uySmrMEgHmaGx1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDVQH+JJuxzkiDdeKbJvZA5RUMv9B/jtJwTGTHZ5Fqj8m5rD68
	VcX7whVAeBj6wZG2gzzAgzJIOUY8U7i49IakAEar6zcKtQr+VdXlHZP9
X-Gm-Gg: AYBFou1gmLTkaihy5RiwRVtWJnZuTb/8gYUySjXkEf74FvtxOWGb8LwzZTOu2LtDwt4
	UMEbheQXAdU7JkLda0TAKJQ/xbp7ag6honuhnG0JVXQZLubR1EzDrLViVLDuvnvInrKU2Ukj2gZ
	xBOeGl/tMxTpls2+TFJ8HoFKYYWwpv//egdTlj/n4s7lzrSsBCxfmIJQ+SubhIu7bnOEplCR+dy
	5opo7vodV3+AZU2CCOo/+pW6YKzYykaegNVSGj1kXXVCi5t9F71E2IMPiN7O+m7J4yep339Gv0C
	T6SrCLdmTewnEDtG9GG5xGlMWx/22gz5EbfpvJL42de/yvFLQu9mmesU6a4AemYGGr/gArxj6Ko
	yWFmdbFOYLu+y8c+lRrfS/Zy62MFvWjwZE5c5xxTMP4s+5pq3UXKlk62ZHUyAr6l2IHhTcLvl+x
	4NSLCdgNME/DIzBZP47KgGyquwo1BL5XotmFeqzIn3Pdmq+lPhkfc0f2qrK1ELUZnWtZUmmKNdb
	pCHb6BVrCS8CBdjni/x0BooaD7j7ef1YXerP+t+EFjrXcg/iL7V7uDvLLR4dqsUV0Lod7b8t+Ro
	/3h4TKffyQdv8FBg8OdMP1YQNO8IYPrA
X-Received: by 2002:a05:600c:6309:b0:4a0:1f90:594b with SMTP id 5b1f17b1804b1-4a1fdd293d6mr68900625e9.22.1792641209082;
        Wed, 21 Oct 2026 20:53:29 -0700 (PDT)
Received: from SurHub.localdomain ([102.218.51.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b42befsm35838025e9.8.2026.10.21.20.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:28 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: linux-cifs@vger.kernel.org
Cc: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] smb: client: fix fiemap wild read on empty truncated response
Date: Thu, 22 Oct 2026 06:53:23 +0300
Message-ID: <20261022035323.17832-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
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

smb3_fiemap() treats -E2BIG from SMB2_ioctl() as a truncated range blob
and loops for the next chunk. If the server reports
STATUS_BUFFER_OVERFLOW with OutputCount == 0, SMB2_ioctl() returns
-E2BIG with out_data == NULL and out_data_len == 0, and the existing
length checks accept the empty result. The loop then evaluates

	next = out_data[num - 1].file_offset + ...

with num == 0, reading 16 bytes before NULL.

Reject a truncated range blob that contains no range, so the resume
offset is never computed from an empty response.

Reproduced on 6.6.87.2 with a malicious SMB2 server that answers
FSCTL_QUERY_ALLOCATED_RANGES with STATUS_BUFFER_OVERFLOW and
OutputCount == 0; an FS_IOC_FIEMAP ioctl on the mount oopses in
cifs_fiemap() with CR2 = fffffffffffffff8. The code path is unchanged
on mainline.

Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/smb/client/smb2ops.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 20624f5df..7eeb33640 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -4360,6 +4360,15 @@ static int smb3_fiemap(struct cifs_tcon *tcon,
 		goto out;
 	}
 
+	/*
+	 * A truncated range blob must contain at least one range, otherwise
+	 * there is no offset to resume from and out_data is NULL.
+	 */
+	if (!last_blob && out_data_len == 0) {
+		rc = -EINVAL;
+		goto out;
+	}
+
 	num = out_data_len / sizeof(struct file_allocated_range_buffer);
 	for (i = 0; i < num; i++) {
 		flags = 0;
-- 
2.53.0

