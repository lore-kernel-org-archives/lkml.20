Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F571A6834
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085949; cv=pass; b=nw1G6zSK8BneOiKRt5XZqC5Q5lQo7c59ITKCEkM0ZVIYRWUEPGsfgC1Z7Aj4IOT1w8Yi4kfPy9Z4OeldDhK62s0AnJ3Xr5eoh6vO5krTHDrOOdLDC8U9wOysmcKUiuX6QRigVHnwKvWYvo2vUzddZtMIMOufrVIWLZGcgVaffv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085949; c=relaxed/simple;
	bh=gN6p4BHMJu7wezAEoh+ZWimR6M9/A3O/vdPPB3p5BGk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=dx36v4xE6oCKdS3q5kmKkWgfUX/iEN3tOorXzwVxELwQfwzEVp6JtEdoZOL/hfkGEpokVnRYwXvllOVqUZUj69nYptasBH+C2DI32R8WOj0tYIZ7jcSu/6zdUqrkGAyNpxiUknpB111QQXw4d+Ivca+2S4IRPhT0m5VCTTkzAD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=JAseW34j; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="JAseW34j"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8541875f596so244326b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789085947; cv=none;
        d=google.com; s=arc-20260327;
        b=BqDU2HCDMW4IHii3KRdY2aub1l/ibcpTtzJLci9tv767f/vpZrO4utIfOCC7a+0PZP
         UiVrrrtjGf2oI0Tlcs37GZvL2EGJolbWUx3Hy5cp3Ao1u26yw0/91Ycxws2ov86pGlIu
         0dX7dCiArxvsJVK9ekQUISSxfFDoh7k8DLHyBKv+8+4woxltHUINjEZvo+VHV4Au6Pxw
         IzkhKXy0Pv5j4S/6B3/5M/6u/NC/w/G4rT0uFoZcagnAnZPpVh77+FfdNWQ+pjzoOa5O
         teOSGtnvDvNhgrd3UkavP85JCaCLyCzAGB8G99IY+r4P0f3CL21u9OgjIBALCwhLan1V
         bIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=DRWY7TGKlrDE8BUJYREHI/zhjMrn8auFwGi8zbFwJIM=;
        fh=LmIt2osZcYLqTLJVm1sISkq+B9K2/7ktxq8QYFFosvA=;
        b=QxrQ23mrbUTHbdTb8Nlw97N/PygWAJLmTyftU0Mau53aqPqP2FY4be+iQ/iUFZYbpp
         sd5ZfYNlPd2EwNfbdDrUMDMSEHh4PqaS85UKtIY7SW3RHRsQEsqVsUbMhI6xUGZES1gJ
         9P+NH3EZVmfWo5/SH+pc8GJO3rqtKWL6G8ll4v5oSx6epZCanXjLE0GiyPHlqmNRVhuW
         9RW4yDf3n53EnKOY6SkgRwJFvt6qprSYVof2iFr2+55+T23zJxoRHqPE1keTzxC9soJG
         C2GiSiVrJbjCyPo4r6GBGDo7ghxKJqhWMXOxJpCKqG2U03I7WA+EE7hsBCyn5R0WEbto
         6yYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789085947; x=1789690747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRWY7TGKlrDE8BUJYREHI/zhjMrn8auFwGi8zbFwJIM=;
        b=JAseW34jbtEjb0h3l5jfliToWd1c7hzf6HPMG+cq/Dxu4IUVMZrtmlRw90ip0yyocJ
         D4PGZU3wy289NXrEp4MaBiC1NtsMKh/W9Y0ntUL1U/d5ERaLEb82bjfkhAcUA15imlpD
         Ee/HR0Ec0FswO7eDWwEShikaga554Rur7h6yb1CH6uNCv0VajhWHp7rD+alX0LxH5jE2
         bbZWJY65btCbSND2f/O8doDrPZia4VyGoL+7iw+pd7QUcLLECnO3JN5nERqSJM1qEl0p
         Pb5GblVJq+54p+smc6vEerSg+AKdpRXeVhMGXtVMevOj2oNRvBaslLvtTTVNhR+QYdW4
         C5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085947; x=1789690747;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DRWY7TGKlrDE8BUJYREHI/zhjMrn8auFwGi8zbFwJIM=;
        b=SOwyghgSywQR38XedhOjMgjHgNbIsxAAGAiwZvtBll7YzNZ5yfx8BXIK3ifs3aF6mA
         8P+vXmmRrJTOBEaH8pMUDOtZEhxEo7AH7T3Ib51VrBwLy3RIhoQGNf17LdDXu4EmHbtK
         yH2JpInXuERyXGUIitjCaYFCcoyqHNhC/sDEEkhXZ8BBFvnQJFRC7kOauVr40xKWetP3
         9h4BSM1uowLGs1OO1CjjEONqaUuTG8ou0VBh2sIoRbTse1HkMg36yFWsdrcSl4ZEoFUc
         8yLxspbQNaDU3s99ggBCcZGVQs2tJc0dFIhR1STyTJReNVzm2KTDyCOpd2aKARPSwjTC
         wziQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLtV0C++PNW7NxSYenWNnrm769yJTy+DnYj9fMJE9tOHm1rgNh+IarWt53tebH4BzoJkqHGS9Ml7FyPDs=@vger.kernel.org
X-Gm-Message-State: AFuF++lGG+OQ4wlaG6pfBKTB4rhI3SYVPVVYvv4xk/ZUmuOP7ouIaps5
	c42A0qLhHCzm7VLw8eVG1+AgSXaiH1Dh3aNzt6fRAjvfRBe8iiKL5Ki3d9IVH4eEuNwyiRnbi/6
	c8vHKkKPFhhS2GNL4J2rgYJxdvZhj5MW+ZHRutr7N
X-Gm-Gg: AYBFou0Cge40SqRSBq2y4itNK3E0Knxe+Y16lJDcdEZqytEKOFWkwPTgMRvRHd2vvdw
	ns+RlHt2/1hM/uychqXg0KJH6OuRT80R9XMyxSxzp2xU25ndyisT2DnbQPjWyxbov0LSPe539F+
	hQSgNPpZ1ijTA6TxLfQRf0JkPgHLybTduMrQsUeJ7StGUHxCypBQBnYOuBJsje861Tj8wSf/KWs
	0jSfAdszB2htrNNLx89ZipKVdckNdBFXeCRtQCZtldJhkxDaKrepLMVef9xZfPC94w7zABuYfbB
	DwZ0KFoEYEHGzZfIrl5cCQIfhGQ4dYlT6TZyiApKBN357OdTzFeww3HoFsmoKzva7DlIvFksfv5
	cMN6UWVls2lcHn+7xJ/7FnV0h8arl0uDY6LkkxlOpijc=
X-Received: by 2002:a05:6a00:889:b0:869:4484:ed98 with SMTP id
 d2e1a72fcca58-86b336da391mr2179665b3a.20.1789085946510; Thu, 10 Sep 2026
 17:19:06 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:19:05 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:19:05 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 00:19:05 +0000
X-Gm-Features: AcwNN1VhQHuDmyfmr7G_3qRfSsnT9lX_ogCYHM0LoLiDwCGK4kVN5SmNeoy2eZA
Message-ID: <CA+0ovCiUaccnL7U89TZs2GOBGxp2E6OCfU_KMwre9Fnfv4BE4Q@mail.gmail.com>
Subject: [PATCH] ceph: fix NULL dereference of filelock_reply in ceph_lock_message()
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>
Cc: falemi@asu.edu, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ceph_lock_message() dereferences req->r_reply_info.filelock_reply
unconditionally once a CEPH_MDS_OP_GETFILELOCK request completes
successfully, but a reply with a zero-length extra section leaves it NULL,
because parse_reply_info() calls parse_reply_info_extra() only when that
section is non-empty.  parse_reply_info_extra() also selects the parser
from info->head->op, the opcode the MDS echoes back rather than the one the
client sent, so a GETFILELOCK reply naming READDIR, LSSNAP, CREATE or
GETVXATTR is parsed as that op and leaves filelock_reply either NULL or,
since the extra results are a union, aliased onto the member that parser
wrote.  Reject a successful GETFILELOCK reply that left filelock_reply
NULL.  Select the parser from req->r_op instead, since only the op the
client sent identifies the live member of that union.

Closes: https://lore.kernel.org/all/CA+0ovCgZoX5yG35yvU1S2D0Fc35TYeEZKAFUnO-tFMqeXubfdw@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -822,7 +822,8 @@ static int parse_reply_info_extra(void **p, void *end,
 				  u64 features, struct ceph_mds_session *s)
 {
 	struct ceph_mds_reply_info_parsed *info = &req->r_reply_info;
-	u32 op = le32_to_cpu(info->head->op);
+	/* The extra section is a union; only our own op names the live member. */
+	u32 op = req->r_op;

 	if (op == CEPH_MDS_OP_GETFILELOCK)
 		return parse_reply_info_filelock(p, end, info, features);
@@ -872,6 +873,11 @@ static int parse_reply_info(struct
ceph_mds_session *s, struct ceph_msg *msg,
 			goto out_bad;
 	}

+	/* ceph_lock_message() dereferences filelock_reply on a success reply. */
+	if (req->r_op == CEPH_MDS_OP_GETFILELOCK &&
+	    !le32_to_cpu(info->head->result) && !info->filelock_reply)
+		goto bad;
+
 	/* snap blob */
 	ceph_decode_32_safe(&p, end, len, bad);
 	info->snapblob_len = len;
