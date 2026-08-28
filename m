Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F732C942
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895859; cv=pass; b=MxGzNPEW/exNiyEm26M/O4DAe8HxlE6XCwQ/sWI4BwgJ2bVAE3OlI5DOz94DDEt87Wq+PRfh6MM63fmPAvZbLypg9jhpo4mgC8WCZ7244lhyfM7lBo3i4gtpBqL+wEPvh+n5HBCCM42TiIWNPUfKsohVQGiPrwDv/PwYPnl0m5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895859; c=relaxed/simple;
	bh=Hf8b7jdlKiatljSC2B8q72HO9lbL1UdDOmM2gz+ngc4=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=QdwHNsT/sflJF0HlFgpqwdkd1LNNmjfC7jeoFvqKuu1kV+J4Raj8Gp3P0gPaLsSVXXVYdbEHRr51Cp5uhMIF01IJeta36V2AsGAsSv344WDbAAEaZeDrK2vTnl9Ag3WCf8dyEoJ9QiuuT5KkMLX7GAhUlbHSU4vePIqz8UdqRDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=FzI+e6g1; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="FzI+e6g1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d58efc7356so5586335ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895858; cv=none;
        d=google.com; s=arc-20260327;
        b=RzjJC9Sl6SU8oAhdjUdYPDtSUZaeSx5LRSzVyKUeOgAmymZ4aRYMbKjLQV6Zs9vQBz
         met87ixlIAJ54PYdqEleHqKd48t2qHwaRJIeJGSXmvU12+WNHvzzqFYkcYl/A+O4e5fx
         aaH3LLyC08oYyqYl0ejbQ+ug162kVdTBlA9bhVtfukja/ahzG1rFqKrCkXncww6D4oVT
         lu4Ap6a0MeFuGYkckgQWhL5qS/LfhsYlqUPvX+/gR/w11bbdUyOFAef9f4L3VeE2A6hG
         QvcFDuV2ee5KzeZK8sorDdGI+qU0G69kPJNi3XlnxIRficKy/nyOtbljML+2WH0p+9c2
         ClKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=gX5MXuN0yMPP5fZup2Supwzv/CRHAFoVR5x62kh5m90=;
        fh=M1p4a1d/idpMjMqwJQGx+OenDhWviOGtZ0uhsoHOoFM=;
        b=B/QyuMnGwMuP+ewlqyAuserFYo8XFdnHD2gG4h+60dBpjRaWwBb/PuN5yanlCjMfKr
         JQN+FxnQV4gpog305O9vJD/hDpyPRFPkRYn8gZVTrii7k3jQ1FKSoLbQrWyZ9jYJYS7+
         UNTAyEzYqFTW+F8Zc0HUVROnvGzAukihjtHSby2sQXpur7sv29c5zr59ChGdDjeG/W6E
         D1712NfAbjc1B8MWFPbin2YxRhAyxyyWcEFWwegj7Qg3hCblWXpTqnaZ8hOiLgoZxnqq
         eYnHNr5k2sPql8aP2sQbXPhlf6JQ5Txtnn29e9hOHwp5DWSEh0hScJnRh0VyDWsWk6wA
         h5zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895858; x=1788500658; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gX5MXuN0yMPP5fZup2Supwzv/CRHAFoVR5x62kh5m90=;
        b=FzI+e6g1foqMuByBdqwCJE7AeeREsj55Lfal8D+aASfo0DghJ0n3DOqsI92C/yQ+CW
         FySzc75FKTmieDFT2vmU+PlY+vScMjeVbpHUn6N0T5th+TUuH1QLST6Apt2ftrr8qW7K
         wdz1NelghvS5QtjIppHrlBSrCo05x49p8BBOXqMWcdp4TuKn9y9M9RsJJay8MG37C6jv
         lpc5qkNX85QVfaPek2I36rKNZDlWmVgAwziXff5F7myNNDWYFenIzrFSUQsqwHPSy6IV
         YKF+ZWuCU9ZE2niFut1tmF6YZUAxnj9n/wqE5wa+8NTAceuIkLT/SV/2xPTKlNFOD3SX
         PZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895858; x=1788500658;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gX5MXuN0yMPP5fZup2Supwzv/CRHAFoVR5x62kh5m90=;
        b=p/o9sDPgKBZjSTKZ/MtizRni0V1Tkm9Vyr9qj61qxWTfMbVPqgQFV1LSNzNNZpy6A+
         sw9PhQREUr5EcASAwnTszhymbDW1F6HDDhk0SgIdvc/fHQgjT5nDHgyXo3R/5Lx10SH3
         27aHHYEUnaIb6cn8MXj2xjAyJPlcfNwZ9QVrFu463+8b0TToLvGvhWAuz8baD45SlQoD
         kSFJ0rqln/0HJIMZo9DCrzTUlrlb/GsVhxjbymzWZIV/LMzdrcjYrfKmEDGyUoemeupL
         JCif7+HSP0ZTlz2zGcTbSLYyqu12YkFVkQWoZ9k/LOsWq5lDU/GOFT3qWZxzO9kUTHYY
         5//w==
X-Forwarded-Encrypted: i=1; AHgh+RpAVkZoGiuMAa+jzxtM9I60WM7G0UsDt/xSuFgAcbG07BjwLu3V7doGt2bntTddI0ZzlVwPYznPRhwWBeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++loT5Fq38gkCOWnacVa2d3DG3FPmrKO/z+LK+C2FjvlcxvEdHNw
	DQx/rvWeP+qxTRRPq3SDvyuw4MTcPo3iOwSlI+CF8X89kRkPiCw+ErzokGRyMDQaiRosBP26Avl
	akv8h8X0eq8RAMotBo1CtI60IM63Fa+Lq7R62/sVG
X-Gm-Gg: AR+sD120zkeNKx/7jVAuh4ibw/I4tePoMk1jyQabFiqOI76y5Pxpk8mkzCnk3T6J8O6
	6OfjktqOYizkhyerSC7iW+qp0yIcJBvsbEF62MUEMgV0qmj/dJaeNu8kxN9utOHaP2LCXOFQzY/
	sm50Tu0RsNm1JXEtbYtSDl8821wTGy5AC+LJD1ZbVsLp0zMe6h23slwy2BIuA/954rrLjp3qMnF
	wfLERZ4EeDSUuQnbUHP6VUQh8BsZYRMUwkCxXdbEtejcmMD3J+yejnVaUvW+hr+bugbf4c1iNrY
	rpu5w/moGh6mY597bKZS6elkxDO1ss8PGOUPvhintvQbeTWt5uANtzlov/VQMrY8ZVUH6Zm1uMg
	AqqiRPQCT1Rk3QPKF2l2jDm6GsYLTnjRQdWp5xpP0dcM=
X-Received: by 2002:a17:902:d2cc:b0:2d6:61a1:822 with SMTP id
 d9443c01a7336-2d74df04c7fmr75336995ad.10.1787895856999; Thu, 27 Aug 2026
 22:44:16 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:44:16 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:44:16 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:44:16 +0000
X-Gm-Features: AcwNN1UfLFKvzsZ8yrGtx6F_RIY8tC-vXZ3mULzFo1lEYjjLnJ1dOGNaTOPlY9s
Message-ID: <CA+0ovCgD992wQBoKm8-dzMCMB8RTGcnOoX=Dv=3pg7s7q3rL2A@mail.gmail.com>
Subject: [BUG] KASAN: null-ptr-deref Read in dm_kcopyd_client_destroy
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>
Cc: falemi@asu.edu, dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/169-kasan-null-ptr-deref-read-in-dm-kcopyd-client-destroy/

  workqueue: Failed to create a rescuer kthread for wq "kcopyd": -EINTR
  BUG: KASAN: null-ptr-deref in dm_kcopyd_client_destroy+0x9e/0x480
drivers/md/dm-kcopyd.c:980
  Read of size 4 at addr 00000000000000a4 by task syz.2.409/14796
  Call Trace:
   dm_kcopyd_client_destroy+0x9e/0x480 drivers/md/dm-kcopyd.c:980
   __destroy+0x172/0x2f0 drivers/md/dm-cache-target.c:1969
   cache_create drivers/md/dm-cache-target.c:2600 [inline]
   cache_ctr+0x1614/0x2af0 drivers/md/dm-cache-target.c:2645
   dm_table_add_target+0x5c9/0xce0 drivers/md/dm-table.c:749
   populate_table drivers/md/dm-ioctl.c:1509 [inline]
   table_load+0x2f9/0x810 drivers/md/dm-ioctl.c:1551
   ctl_ioctl drivers/md/dm-ioctl.c:2115 [inline]

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
