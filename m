Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945427;
	b=IZfrAv2DgB8JgKNP6tVPk+fB6a7DirWOzFyx8u3LNzLMDu84LX43hh3z7Fi+vcicQ3HN
	 rvJwclS9T7XfkR+XqrV6nrbFMB4yOOlWKolss5wbX9/mmvlIO5XThqRs59Vw0QtgTldh4
	 vwK5j+GwN9kPK+BqOUIH9LIo805AdKHVY0cSN8plX+fFCkn95kPVr8AaypUcVkJLv+F0X
	 i+Ts+9yj0UUywY6a1DdFdPo8q/4V1baVH9FkxltW5V+2aHcW7JZCmpkTyvOLwSL9jjzAR
	 EtxUNGp2Q5UP5tqR58V3ygjNxoKTGTMtmA2cNBS+I44cKnWm29mg7zveIFTO2VG1CwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d+AcYVf8reTWXFlWM/d+zw4B23JCw+ulbjBtfDhJI3w=;
	b=aAmDglnrJUtJUrxtWRAZ8RW6zwPnKASGyx6Y/WxaxVZem10qzxgK9OxzzTR5pOCbhYUw
	 r3KzCNOlpjMCDxv+hKd1sDB4OR7abDn5hdf2uxijQuAEZrqNyEFdLwn0iAuBmBletYhi2
	 fEDUnD4OOOhW0Mk17uAtmwBrqy+lgCGaph94qtLQR9Ax+oAU8OW3jvbCLk6i/46DxUh1e
	 HiJPD5ToGCC8NK9guNRrz4gnGbLhSiKfgAowVXwEp4Qv7rerHHsWlCo4gikEnW16On931
	 3wcNrZGPIJO6AGLRzx2TAdJp91k6V3hqLm65sMc07fJbIdD3N6XNK35T/Kbt6VLdb3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgJ+pF1T;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A6606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452A6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgJ+pF1T
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso511035eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945426; x=1794550226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+AcYVf8reTWXFlWM/d+zw4B23JCw+ulbjBtfDhJI3w=;
        b=zgJ+pF1TwA5rO6fmWXsCVBbSeXfG92ete3mNtsVYgXGW6Ns7fKNXNVIWx0oBV4aJVe
         7H2gbfDNbJZyB05iNwYYvNivYUVJ1ABCOLQy7eLs9kgCYPvlJko9vOm302AJfCoAs5qf
         1wJBegNmtU9nqI/H0c1cXQ52EJIKUQrgEehWiEsYQcq78WGVSMx1PgL+MCE2lLOUn+Yi
         jLRMIgXcHN3GXB9UUT2k29RI8X9u3TwSt1ttEmkKPpkPJnz6Yq8mUUDvSUCiNjY9TZta
         nLoTBHA/OVOjK6cblyEtuhFlwKrvXZKzUgH5qKDA3B3f6UHdP9FTb4sJQZELuASZdpcB
         gBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945426; x=1794550226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+AcYVf8reTWXFlWM/d+zw4B23JCw+ulbjBtfDhJI3w=;
        b=yudwVSLyTeMpNFpq29r/RRoA+9BW2TXgVnAhjYMOWTBuHxQX7mOnoqwAiSD8+FKlzW
         6OpJe7g6nZR7prNd9ypwjTdX2mSGCd2SMwH1jrDRnJpHSrVYJNlWXLJb5uz7t4G66x+t
         hDieJNGRIEAgMmg0c/Xgrc5Z+13k9qb790ynWZAKB+9WPZ+Z18bK382yMr5ddy5iHHT3
         UqHmGdcCNkgiMhWQw6VDNSlbsWdskAxshifHFYbjE2vToj82qeevyTwg0C+jKX0C+AmC
         Ee49/fbkj6YIP8fjeCxtTbj2cnV4toNx7LrQTlNWfnLQW8EvSIF6RLHUhAM7phXv11b1
         AOxQ==
X-Forwarded-Encrypted: i=1; AL+hErEHwhnmZiRbQzx3C8LSEIfpvW2hH3oZCkTGSwqRuZzQWAjDGiDGZkhYKoEIXVvaYco7UYuoZWRR+5o8/gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ud4jSeVsPoQh0kyiaXyQ+ZpuHhpH1KU/4Af0pYYssI7S2H3QE
	85BPw91VpbAjQiSmjiZw9/HUHO+y/cbVDLfnOKpVPPtGjmSiBjzLcbNH
X-Gm-Gg: AYBFou2pi7e9j2iqjWXIEGpoAXSy8g+hdhnvHu06Auz9Ocm/BffrB8bjLh1vuVYzOhz
	zlRyvbaddjyYEaijRZ134arvqqWwhPj/GbGsVCIFAohJOs8nG8wBj8ymQUfRB6H6lRBzKUiw+1x
	4Tf/quoiFZxxpsTBP6LBYtfzm0DksMEpE5bqOswJB87vvMreE5fCM8bc0afDOAYZo+zUZwWkHCW
	smsRK4o5uQEMutYx0VvAfR5CEU21Q76mb+K7pakLCkhk/UGaNeht5vBsxZmcLY5oMIU2PD2oDFQ
	/4RDcOllHq02AxBB83iPJuOy4j471tJQ2D3fy6DNLvJSYFgQlMv2J1IMyFA6SbF56enoQ0DbCgq
	MZMDNSOom206++9RSQEg4DoeJ/WOmB1AGiHJiy3H1Ce/i87chqWvjPqpsMUJUtlt8IQt5WTfUOd
	+A9Q7tsUWKtYrSxVVDSOK0z2g99YyhExKxg9iqPPDUNcT4Gp8/u4sZL/E+t5M+tx9L9SoA/McHO
	hzv479KlT8/1m2l+3yEe4zupE5Ka/tD7LSsIgW1mROKuOZU2Q8J/k16ZWeN/pbQyMjReok5ddZ3
	0/LLGpIEXbC1bi2XMuhHg/Ln9kUSI7eT4LP6kvv2KGGIGUdYUzPWFkmU+9G2Q3eK1A==
X-Received: by 2002:a05:7300:c8c2:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-36f76326a0emr1961423eec.26.1793945426214;
        Thu, 05 Nov 2026 22:10:26 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm3160531eec.1.2026.11.05.22.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:10:24 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix endless readdir loop on a directory without a $BITMAP
Date: Fri,  6 Nov 2026 11:40:04 +0530
Message-ID: <20261106061004.2338569-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ntfs_readdir() saves ctx->pos in "pos" before it emits "." and "..".
If indx_used_bit() returns -ENOENT, the exit path puts that stale value
back into ctx->pos and returns 0, although the dot entries were already
copied to user space. The next getdents64() call starts at the same
position and emits them again, so a reader of the directory never sees
the end of it. ls, find and rm -r spin forever.

indx_used_bit() returns -ENOENT when the directory has no $BITMAP
attribute named $I30. That is a damaged directory, but it simply means
that no index block is in use, and indx_find_sort() already treats it
that way. Do the same in ntfs_readdir() and end the enumeration.

Reproduced under KASAN with a crafted image: changing the first
character of the $I30 name of the $BITMAP attribute in the root
directory's MFT record is enough.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs3/dir.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 7ee1a5d4189e..dafd309e136d 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -584,6 +584,11 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 	for (; bit < max_bit; bit += 1) {
 		/* Get the next used index. */
 		err = indx_used_bit(&ni->dir, ni, &bit);
+		if (err == -ENOENT) {
+			/* No $BITMAP, so no used indexes. End of dir. */
+			err = 0;
+			break;
+		}
 		if (err)
 			goto out;
 
-- 
2.56.0

