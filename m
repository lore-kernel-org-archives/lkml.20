Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF140927A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488068; cv=none; b=T74GkzOUSEM/39a9Wv+/goj5Cw9qBxdGU5ySHfne/OjNLfYIa+H2p3oQie+BlgJvvQUNWp1Peeq6hFVD88AQuiRxDJ57IzNGyO5ErEBIQLu9Wle+FQmu6zvGhsLJlAfUN+0FDEln6PbV4S7SqbylxrYjNUiPFNNVpBWcvDb4sbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488068; c=relaxed/simple;
	bh=TP8vzZNqYTvpqyiQsP8/kzXcvof+WkIv9WsLTDcnXlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5b9YnToBNpIo/cnYhUozPZYnVf7bmG7l9RGKsU5G+RRvV5jHbCNKB4KvyJbc+MI/U1SFSA3ARgbKWb9CSDwCnNLsrjPF4Ff9dM8gNKSU3qIo6I7jGVajFa7Zk8aHzoGx6vLBQALaJtxH63+tMPGs2NIeBNgm43Jqeb/ZYxbjzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgNDW5/1; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgNDW5/1"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso903050241.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789488065; x=1790092865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHnSyuLANDxKOE15RlXzsARxBU9yDC28z60+XrDSb1o=;
        b=PgNDW5/1++gfdfkWd8E334FRbkdy7GHOa3tyFNmXzjuT6ndnKM0M1WQLDa4RRY3wkU
         xSifHRlOj3cNv87VHVspiP2uuiHfqwUyaWHGFZDHDux9TkuFZqZLrK2iHyiyfYF6XRM/
         Rl+Xq/dsvT4nyyRxyZnvrKODwL6NsvO8v9rnIY8kjvtnZNM9UGJw4ETBJzN4++lM083G
         ASwWHMhgmLIkHCLgDhM//9lchCnW4oWIat6rvzHgicwWvszFYg0no3daVSToEefyU97M
         Ds2HT7qSjw/IP0LDdqrMMlgzbKu1W8P6W9WaPDF/SGp0xNkwOb4kk20wlfi9Ve1xwvZp
         EmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488065; x=1790092865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHnSyuLANDxKOE15RlXzsARxBU9yDC28z60+XrDSb1o=;
        b=g8G3AjNGO2vbMJZtEko3/O0w3RQ+FsRjoNz5mQJbJcXo+MQ0PyS8XZfZj/FTgSkSc4
         yrIsCuOpq+PQdNqIe/gaMpaXqV6zscrFiyaAfaoNKHriv79zBEzrhmrdkOoUXAs5d62q
         OETJsAl2iKkys6Uo+JTi3a8YmuGyZcuAQaxsKyUpqhU8uauckTP02IYylhPfdJa5y7mq
         g0XYKdydefduFEf/hlVxODfWN473EbAcguk5A4khsmX5mHsy7IQHMbK4akJ1lj2wGa7L
         mWOJ82vbAEZbbB4W8FdEh7OKuh95mg8HoPDgIolKbV3FAFy14jxnq2ppNElU36XDI66N
         S45w==
X-Forwarded-Encrypted: i=1; AKwUvBw2v/NNTKgfo20Qa6RJaOs4CUPJe3lsOMLzVMM3hooiFBVw7u6ndTX0hZXvFYPtrd5P7LQpWN3wFIZZDiE=@vger.kernel.org
X-Gm-Message-State: AFuF++nChGnRpuiNVV3YIhCHBJ32sY4Pm5tAcOViJXugptOMwSIPQcGf
	rtIUhKGdBSZ33uOy26yH0mPAZ1KhLl4vh+gGfUviGwAHgNO1vzaiqIrj
X-Gm-Gg: AYBFou3QntD34KWuTQalu63cXhyZqkBRHlOcSBZq5Dls9HciuYEcLxSZgMl4+xdIx1Y
	/uHir0HMCOCBsFABIAuAGP3Zfq35taZphrnkeg+HlZta/jWTfHxLqNI7GPOKdk19X/dKgKkLhzl
	X4XCs9IH4I+pzaASf6kI1jpnPLqW7IVC+befKNT8AmxpQMaIydiRBRPdnOQuqwH2NoLawJWJVsv
	XrrFa8CmUbtZKyK5LHs8jXc4DhiwRMRsXT/OCmPpwEU71v7L2gms3OI0DIxZBJapvuslIIy8PVj
	9flvai77xtWMLEPGHnBdWUhcQmpiKTqyQcGqGAe0XSfAZ3qOGfy0+CORvnsYxPznrrnwOL7DwRg
	Y609DhWjpoXM4kx9I0r/W+ORgaEXKHeUlf9Tu3fAPJhryPpr0XISOJUVG7CSxP3fm8NvknHXA0E
	1RwLPZPn/ujYEoTLlyX9BAsRu7vRveW3mFSRk1e4gcSmgoXvbL+IxAXPeof9La8+Jw
X-Received: by 2002:a05:6102:a184:20b0:79c:cf1:723d with SMTP id ada2fe7eead31-79c0cf17cf0mr7667253137.6.1789488064765;
        Tue, 15 Sep 2026 09:01:04 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm79049137.4.2026.09.15.09.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:01:04 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfsd: zero NFSv4 COMPOUND tag padding
Date: Tue, 15 Sep 2026 13:00:49 -0300
Message-ID: <20260915160049.3105481-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfs4svc_encode_compoundres() copies the tag bytes into reserved XDR space
and skips directly to the aligned end of the field. xdr_reserve_space()
rounds the reservation up but does not initialize the padding bytes.

A remote client can choose a tag length that is not a multiple of four,
causing one to three stale bytes from the response page to be returned in
the COMPOUND reply.

Use xdr_encode_opaque_fixed() to copy the tag and clear its XDR padding.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/nfsd/nfs4xdr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index e17488a911..9377f42dfd 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -6480,8 +6480,7 @@ nfs4svc_encode_compoundres(struct svc_rqst *rqstp, struct xdr_stream *xdr)
 
 	*p++ = resp->cstate.status;
 	*p++ = htonl(resp->taglen);
-	memcpy(p, resp->tag, resp->taglen);
-	p += XDR_QUADLEN(resp->taglen);
+	p = xdr_encode_opaque_fixed(p, resp->tag, resp->taglen);
 	*p++ = htonl(resp->opcnt);
 
 	nfsd4_sequence_done(resp);
-- 
2.43.0

