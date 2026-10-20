Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503882;
	b=yFHMr+NrTnYfZbfjupJZ7UIA1+a52WHA8kgo4ROBHWipFgXBLBv07pJlktw3WGDwSOEl
	 48WLCLX+Kyg5LgZCx1rl5D9Dfm4hugUBA0Xa7TOCFyhf+POndiXruYjDRmI5NFAWROEVc
	 ql/p6PNWNDmWP2bs6D5qk0J3Uek1QCfq4wvUOuCOHvJ2jZrUSz2X1/sso8aTeLCWrX29A
	 7WIx3fQFXCaeQGo6D3JOAWFEpNz6HYIY+dkgC5l4sICuWgFPESX+71mkluriKfC9WD63u
	 aROE5xNdv73AmNq7TcxSiXlw+zKvk1EfH4YQqztf+FQRm1HMLyX8Ovb7thZBp8YvTtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1KnA8qJSnVaXvhcG07O90BVPJJO3cIpz1Me1LWhP5cc=;
	b=jC9S39bKssphAzVxbe+WwX992vM1/W8Ow+eqdpvVACk3RuMRA4sPWVdilMtemtH66IpP
	 kV0g80M+dFN3ZP6ORz2xVO9YQPLXP+BxggjZozSDIFH2jDVANK+BH7Ra8sQf4kLBQL5vs
	 4sqIiQXKTPFp2ffss1zc3ODrAWWhZm7u09ekXf1VCUZ7p5H7RIdgIEakkzSqbmoFnkk6M
	 h9LSW+ecfOrU60YLDZwzQXDn9sM5ceCFJpX2O1jXT921nlswxqyPMoA7Ic/ZFgfM1obMn
	 g3irjWDl06cdKXd9/wYWmCJ1ESAo2IUEGsMlWhS0PF4vNc9odrUcMd8PNHzErpMQmOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bBLTKJik;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742360A2630
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9742360A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bBLTKJik
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2643246a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792503881; x=1793108681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KnA8qJSnVaXvhcG07O90BVPJJO3cIpz1Me1LWhP5cc=;
        b=bBLTKJikn7lWSWuJJk4db7F1J7/zRE8sm//KzZOY4BM3tBjE6naDOVa/dOPHjXZaxg
         sE9F4h9NcrT0QxreMG6aXiplsI3WzzXhCeae+4pABr3wPFsLbGTlwDaib6Tl2zYGEBLB
         S/uY/vJD9v2RDlGVRvhK0XJwCCioDngyHSEhHXXwlyShvmsRjBx2iCC0fwHSp5Iu4Z3b
         qWG27JogXuHNEo5WEzzUBafk6dYewlJvVsr9J/442yJAxUAKdABs/2kO6fW9jL6yrLZK
         Dn/+/Xk4WGYFGtCA+W/bbmTStDdQ1YJBZL+eH9i9aBKd9BNJcfnW45++Ykg8IuQ2MoMR
         2X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503881; x=1793108681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KnA8qJSnVaXvhcG07O90BVPJJO3cIpz1Me1LWhP5cc=;
        b=naxOKrlEYGDLvArPxaRhEHCALn2w7bpL8wOCMKi4qLEJpE6OO2jLgdcij6vw1SbqgS
         9gjHKbv6eqWC5j0gMOk9/dl6/1/zQ7pcM1aPb9xGnOvHrnWyer0KCx8grAJ3aQWgnmUL
         uIMZUaFBX690w/w/XzacyOI9DY0CbbVjIgtj9j/zfIkaTEGHIShOZnST3/7hYGDOQUva
         g+EZQpp/aiKijyzF53Tz/Mb/vNkFoHTmNv2WsZnq8sJeopTtPm/fYD9JqqGnRNGYpidj
         Ffx7Czw9/L5Oy+hR8YtOsbyfGYasTOS4mUrjjLwOTKUKwUCM5DlUwoZquT93/5exQQas
         KiVw==
X-Forwarded-Encrypted: i=1; AKwUvBwMjcBQjmEqgQkC8GONIwWDPsmaXI6Trna/Sgennje81hfKEHtwYXu8MdI6PvXlGusN9J6xjWFAczxjn58=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1iqmvpsvGaSpcslED4Q9hzUGddalz2bId4hJW4FggK/sAPQrr
	BsX/srnonZ73H0HaNh0gImRkOq6o2BBB5gA4LcOJbsNXFkvFM8jCJahO
X-Gm-Gg: AYBFou1bRU2hUHPrFlkzU5JbegVHQQ5OGIy5l2iTpkpj6ob1r79YJ4RKhwUp2p56dXf
	gx+3Jl2gi+44ctq2qGC4wS90Q2EiD3uxNc37QwtWJBLD0fiZjdGh+du3h3piiplBrk8PgBB1Z75
	6nWEsAAUarxTihqnTlCQKqIeY6z5Z8l96O1JWwRMIASiWuaA4caFq2O7fiOsGY0Nh1Z4Ug45K0r
	WYmXPPAYTWrG7tGQMLgOb7Bmj4rHvlI6vdk5J0G5AURB661reGbe/r6Y0QrI64yIcWeLmDgBr1B
	MKUoQujO9F/0/VPqDjo2OpU/UoQ4ETmXGMMxfo97V/WfD9OjLN4luRImYx075x9rD1M88DdGKaf
	NuIfPT14i50xuJ8V/fO4UWxqz2qnpjds3k6NIvd+RI6SQDyIWfv0c2UyNuwAcZVsfEsLuAfolnL
	7u+vHAhGHTG+LreIb2QbHzDrcmaoOv7ygBS9z7HAMkolO/hIDC5nqmwTjfU4H8dac0TzhmteYUf
	s85mmH1/4AZZls=
X-Received: by 2002:a17:90a:e7ca:b0:3a8:878:ebab with SMTP id 98e67ed59e1d1-3acef0c8905mr9887954a91.35.1792503880947;
        Tue, 20 Oct 2026 06:44:40 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d4004efsm3718231a91.5.2026.10.20.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:44:40 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Bryam Vargas <hexlabsecurity@proton.me>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] ntfs: fix u16 truncation of the update sequence array count check
Date: Tue, 20 Oct 2026 21:44:33 +0800
Message-ID: <20261020134433.1015126-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_check_restart_page_header() bounds the on-disk system page size by
recomputing the update sequence array count from it:

	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
	...
	usa_count = 1 + (logfile_system_page_size >> NTFS_BLOCK_SIZE_BITS);
	if (usa_count != le16_to_cpu(rp->usa_count))
		return false;

The right hand side is computed in u32 but stored in a u16, so the count
wraps once the system page size reaches 0x2000000.  An image claiming any
larger power of two passes the check by also claiming usa_count == 1.

Nothing else limits the value, so ntfs_check_and_load_restart_page() goes
on to kvzalloc() up to 2 GiB for the restart page and copy that many bytes
a page at a time.  The size is only rejected afterwards, by the
(size >> NTFS_BLOCK_SIZE_BITS) != usa_count test in post_read_mst_fixup().

Compute the count in a u32 so the existing check rejects an over-large
system page size instead of being defeated by the truncation.  This adds
no new limit: the array holds one u16 per protected sector plus the update
sequence number and must end within the first sector, which caps usa_count
at 240 and the system page size at 64 KiB.

Widen ra_ofs and usa_ofs as well, as ntfs_check_restart_area() already
does: both are loaded from __le16 on-disk fields and every comparison is
against a non-negative value, so no result changes.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs/logfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index ce38ce87f8fc8..2f27ae7a3927f 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -27,7 +27,7 @@ static bool ntfs_check_restart_page_header(struct inode *vi,
 		struct restart_page_header *rp, s64 pos)
 {
 	u32 logfile_system_page_size, logfile_log_page_size;
-	u16 ra_ofs, usa_count, usa_ofs, usa_end = 0;
+	u32 ra_ofs, usa_count, usa_ofs, usa_end = 0;
 	bool have_usa = true;
 
 	ntfs_debug("Entering.");

base-commit: 19dc08f1f2c5563ba4da6afd5ecace8eba163aef
-- 
2.43.0

