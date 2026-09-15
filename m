Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5CE3AE6FD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477013; cv=none; b=ckuhAoj6CdvusylEEURh1a5A8P5pmc52rR19hDdTaTDBnbBqIeboKN5j6Y3RiZaof+FgRwsD7keBha/pCnoSgKCsqMV4WIhhkY5sdZ1uomtGvCntTbexDirk1g9srp9meXxrl2pYDQgQg+k5dgbspmqF6q/M+zxwZtkG9bhVbRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477013; c=relaxed/simple;
	bh=3x2XNScpLA7pdu8iUE5GPOaaChTsijxgHbzAPrI9O+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0JlFzZSG6BP0aL04VQ4Jn+iRcJvuGDN3l7K8rsuq/t4o/dP09zounBq/sQ2VqdMvbnHfLI2HNjzRUVw7t01AnNZfYw/10NsvDqn5rSTg6gBlI5WZa72+giw5FhRb93/2UvypbdlD2zGyb205BSeyutQfFfWLT1YyWzBCpjQy6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHK+461N; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHK+461N"
Received: by mail-vs2-f42.google.com with SMTP id ada2fe7eead31-7954fbd0ffaso944215137.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477011; x=1790081811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDZF9JSId7CCV6qo5hkoNAYzi1vRwU33Ad5zVuVmN2o=;
        b=kHK+461N4eamGh90QLwK5yBx1QBIaLqgqDpYLw4IofPRhk7aS8e6GMSlw1jmHHZqQe
         fc42e+JrJIi3JkDOvqQetv7rQB0GnwP17tPIZka5PpX8gGkmeXxpgj9egY8FQfjIyaSc
         OvQsIFHZ14ZdxjhaePA5VsIbyswtUycFjL2eRuL9aigSTX5tGURxT4Mo3vRiHVRAzZy4
         U7x7GRj3+97hF76YF3xL+fEMcmkP+etDw/kj2CdTPkmn/tckGO5UU72rpI3IPiRt29R9
         FDI2MDVnigBy/mWLOcpBd408ZroW6Styr9iIxmd5DM19WhCg5P1y91Sx8OFAd1GjtaQ4
         jx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477011; x=1790081811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDZF9JSId7CCV6qo5hkoNAYzi1vRwU33Ad5zVuVmN2o=;
        b=NqD2zu8jvvjEAEOeXctFzLIPao5Kk0eZcYzjhVDKJA4440XW9Et5Un0srrEy2DTy7a
         BjXcwGJEUef4pFdCbvZgeJfU9bEIqg3kTNgqBLclwOfg6zBSxtmhAI9+LHjZFY7Xy+pw
         jMbHH9/khuyYZc+rH+VVqOzP1UZbwujq8v/piuEYBTEaxJAbqCid/K4IRgx9IpUc4qWp
         Oca0Z+PxCnjDjo8tIrJbs5zgTP7BZ7zqncvRP3Vjm/0Ylx+zMyfbdKwRbWMal/9aHUFs
         x7HqYIID1Bl382db68iTKk48HZ2hrKbzpP6ISW4f5aSZ61CfrBM8KW///wM/OXrWTt64
         JNMA==
X-Forwarded-Encrypted: i=1; AKwUvBxVDDpaKDa4EjtHGHA3zO7BCm6svyP8m3yafgaqaDgnr2ImJkAvVIiYBB2+MX0RRyVdx6d3iYX5zq79wt0=@vger.kernel.org
X-Gm-Message-State: AFuF++mwO8GYiG4haKGOwzmnOmVr8ba4/G93Q4H1fTfk2dDEvJeDbiB8
	tUjLEXuNO2LSD2Lbk3uu3QyJvOach7xNnAQM5sKSJGlPeN5BrpeSIMoP
X-Gm-Gg: AYBFou3K4htunhb+SBQsUouTJFsOhg0WbYb8PTZzrQkPAC0yL2i1IVpd7Yd+9QHUzAr
	TcXrDTyImCNFGR0c8ll0fX9xez+RkwKRvx56XUYdaNB/GjxbctqaEP6dVdKqGdrj1qOgSFU/G0j
	AWbdvhklhNoiu6uwVrXZz1IQ+nxqn0bdQBhoHvBYjJofD+ahVZPiiWOBHKR+4KPnXOFeEmUH3/7
	hhph2WGKjyTD4BXiNzfJkhapHpJ12kMeXytSfc36jQTCILturRSI0aKPpXQIgUSCC5OQreoHLol
	exwVc7kkMy+6LgN2BXHuUlYYd4ZS8yYzoeaWd6rDI8pGmoryEwWAjsJpEtQCP2GtB/VagTZ3kue
	Og5qm8tGsV/OshVLj/ADr1w0nzYCP1JYApS3C/O+n//GHVg8YfJTnQM8QvaJ4FHuk7rhtsw4vra
	n/ojbM+CLdgd/2Mh+JxBitlqdPU2Eji2wuvB2Oy+RicdmVx9T3Zbm8VfL51idofsFr
X-Received: by 2002:a05:6102:3f0d:b0:79d:5bad:4c7a with SMTP id ada2fe7eead31-79d5bad6c78mr2752414137.9.1789477010891;
        Tue, 15 Sep 2026 05:56:50 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927eb824absm13220097137.8.2026.09.15.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:56:50 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfsd: propagate SETXATTR value decode errors
Date: Tue, 15 Sep 2026 09:56:36 -0300
Message-ID: <20260915125636.2849626-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfsd4_decode_setxattr() stores the status returned while assembling a
non-empty attribute value, but then unconditionally returns nfs_ok. An
allocation failure can therefore leave a NULL value buffer paired with a
non-zero length and allow compound processing to continue.

Return the decoder status so that the operation stops on the original
error.

Fixes: 403366a7e8e2 ("NFSD: Replace READ* macros in nfsd4_decode_setxattr()")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/nfsd/nfs4xdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index e17488a911..27c1b42384 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2435,7 +2435,7 @@ nfsd4_decode_setxattr(struct nfsd4_compoundargs *argp,
 						&setxattr->setxa_buf, size);
 	}
 
-	return nfs_ok;
+	return status;
 }
 
 static __be32
-- 
2.43.0

