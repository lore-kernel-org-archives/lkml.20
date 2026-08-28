Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049F3C3C1C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895935; cv=pass; b=mI3wZ3CZCYUqul2YEq+XEoo6BjyB8WFbt4/0+Y/hLx2EjYSYojNYE79Z3VAvVfgJGd/U/fhWGvkTJcDteJ5p+CwRLzhig1NUKmYhK64HRT7wrZ54s3tv523GlNhcOW1PHYum5Ynef1T9E0Y/JuxKW2qfZjPE+KInnWqqiSmlYiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895935; c=relaxed/simple;
	bh=T2fF49gHVeJcSZd+NSxaC89BuaAnThHgWNNz9fV8otM=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=mNKmVJtUzA3Fu//jWc6aikG3fwztb9plefLmdwxdHNrvCW+CzIsqiNbYm3iVuuVviR5VJImSPXKeo7QJNxiHc13woRPFr0zTN0IUVKWFYmJXken4oV0/ukDA4he76K/9vNQ70rNGa6cMP1EPdQQhR5TnyXY9RGlp29lLNdFg/Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=TgJTwuob; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="TgJTwuob"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d71ae3455aso9366135ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895933; cv=none;
        d=google.com; s=arc-20260327;
        b=dlgMudtYQPPFx1MN4kDIxfdojl8LStLlxmP9n0+++kqBp2RKlljh4vaSaTzxlkAOvG
         ZbuSWAfJB9fh+QQHsWbmyx5BwH9OvrKSMRngzryT+flDkpP2v0u4Vh8LzMzmuqVeuS2r
         cRm62bYzS+oGmx1/OfgfLOCmhDZ1VA2NGu2oHq9rkKRP4OjVWSfkQNctL9ThB53guh7t
         AxDMnZlQEIZbreyWXpZniObDh7uIuBsJDzkpb2sBWHZMEDsqPTQXh4h1B8PIQks5Pbbw
         6BcT4Ycftnjw2cl28CoTc8aphGYwYCn6Uju07Hi8wyRLZMdfJdlNtHb1wWfaEjFrmI6i
         UJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=MrP3fs+sBh4JTGYQXlz9sQdw6xaaN4KOuGpsYfS+xWY=;
        fh=hPwAJrwBPOwk3fyw6j9gs2NbMJqAVLncXqRJYIcc3nk=;
        b=BkulOpKQ6ZvZLqn24+iKTotN1WgSNd7QPM0w5ckB0SwTCBeKaUDGvG+Z605jR1ZsdO
         Aa9jpWiRsciwgx/mHF2mSg9E9FTIhzTQHmMnuR2IyuJkNH2zEUvVtQ/pe6W93hHRQLek
         1BPaNU4Lf1oLVXCpY/4zfqhcYDECkryrvn36t7q6GeaJeZ3e0u3DRZMWtkjpUskzF/jf
         jYhkHXLwUUoAjaghObJkDimaN3bBoYfBqTo8ovQ/occWXCNSXihQupVPqrIfCVOE8deV
         clzZxzvTt/H7vH+ZsxzCF1dK38esNOfE9JnAWZIkjm+VPSzz9utL1kzHXQGTe+GsP1JN
         HSlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895933; x=1788500733; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MrP3fs+sBh4JTGYQXlz9sQdw6xaaN4KOuGpsYfS+xWY=;
        b=TgJTwuobKCkuJdYPd23NEYVYRyDh2zDf6AUyRDFNFhjRzYhnxqxvGUyCuxNdtAxV5k
         qsbqI8nI/fRm5yPGBRuO66XcCrRlsrkAe6i5713LSidVjiSl13IjjKWARBAqRSbBIPLu
         j9MKcz0FsBUh9Vo9zdaontGSS/H2PAnMCIJA6xPmQPDJgfNisreWftVolsQ4GeC02T+H
         bpPeJGZYJJRChV1lW0ehl/psTexPnbT+0zNmFfui+9YG0Ieddol5jDkakRn119+DFOb6
         4L4DIxW2jcsMTRZgDY0gtTPozewIHi0WsW+Hx/4dmwmd9g6yuUbIaYB/SMHyW6qKjz5J
         HfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895933; x=1788500733;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MrP3fs+sBh4JTGYQXlz9sQdw6xaaN4KOuGpsYfS+xWY=;
        b=k1gF512+pdKgGjuuK3HzGuBo2SmRtg9Cjv+QtwXNJnvKhZ6+SAfo4VH2MKzLFDJKom
         YaVHeQI62AqhRpjfWaY1sxVdXDpxrOfLr4e10whIE8PcGZLpSAYiE6Na8xJI9Zyk7M0w
         D6A52OZ/ZsOboMN5UZboX0E0/nglDyAOVYVbYiApH5/RjdGDlRE7M43UN1n/axIMQQma
         ArciSk4YOSPizQU81iF68mTSrSch5N6YcAfoZzuUXpm3WTltFOUqFMSdLOyEaByfWV2y
         m3DbE02txoOkYadmMYfqZ9VSSfUcqR7daLFByKeh6ujkCLo+m6b18XVSaaxNg7+obCF6
         kQdA==
X-Forwarded-Encrypted: i=1; AHgh+Rrso7sNvLnDTlBnMicvbMfBijcCCXTwfDbVkwSHzhUNPBkld2E7qdz9zLd+e3NyEn7Lew5kWexPbMT/ltY=@vger.kernel.org
X-Gm-Message-State: AFuF++nQZ1Vm1RRLFTkzYMmQSiQ6z1RzqGI4s82myegmO2NkfWSftJRE
	th5HRZCN0mT/gEuYEtsIrIfYaZDWJRgKUU6njwVwto0fgTYSV+GSn93bbGMxqQLxeKIb8jFny5P
	iyl2JydA4q1UilqbrS8pXx9xupd7r35TRvROsr5t5F1lyS2D3bP7xFQ==
X-Gm-Gg: AR+sD10PHV+qetv6Bq7YEFuJV1lK+/Z2kAOSEIKRL9jq6blMyNM76HUg3Q3DGjPL3Yy
	C1BmrNZxIM3WzwrWFNkw7iqTZ9+cTuo7Abp7Z0iSp9EZs+8+xJT+zCPxeVrdZ6m+hYnM1rjXnb5
	x1UiQcHinjCSRLtu/RUgqLUdYUBJam9FOUPBsRjiwNw/e29540gY5299nZyBcTrMcc9q6MEuvab
	5uysL9aLuq79HUe1Cqd9U2mp9ytVik93wtWP0F2DIFESvCvnm9sa/WCURZYxCyo8JfEM1T9FmuG
	jZXQT9AFPqLEONKoVyn6jOHPaB1G9U93zXtqQoNsClV652RSqLZ4I2Z8nBXF2kci6GOjrzIfNjP
	hMvDEZIGIePTEb830wdruOxD8W20abOZk
X-Received: by 2002:a17:903:15cf:b0:2cf:ccc2:6088 with SMTP id
 d9443c01a7336-2d74dc21be0mr93296435ad.4.1787895932178; Thu, 27 Aug 2026
 22:45:32 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:45:30 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:45:30 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:45:30 -0700
X-Gm-Features: AcwNN1XQaQsSGB_JtPRDptCarl0A2Bdri9F5yBjxTPzlaSSBJSLu85_ntTJbXo4
Message-ID: <CA+0ovCiKb8axo+R-RsqzGbUsrVE0AcLbHqy=+-c9oSMCAqL1fA@mail.gmail.com>
Subject: [BUG] WARNING in ext4_journalled_invalidate_folio
To: "Theodore Ts'o" <tytso@mit.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/172-warning-in-ext4-journalled-invalidate-folio/

  __ext4_journalled_invalidate_folio(folio, offset, length) < 0
  WARNING: fs/ext4/inode.c:3432 at
ext4_journalled_invalidate_folio+0x4a/0x50 fs/ext4/inode.c:3432,
CPU#0: syz.3.369/14887
  RIP: 0010:ext4_journalled_invalidate_folio+0x4a/0x50 fs/ext4/inode.c:3432
  Call Trace:
   ext4_journalled_invalidate_folio+0x4a/0x50 fs/ext4/inode.c:3432
   folio_invalidate mm/truncate.c:140 [inline]
   truncate_inode_partial_folio+0x33e/0x8d0 mm/truncate.c:249
   truncate_inode_pages_range+0x5de/0xdf0 mm/truncate.c:416
   ext4_truncate_failed_write fs/ext4/truncate.h:21 [inline]
   ext4_journalled_write_end+0x8f2/0xc70 fs/ext4/inode.c:1608
   generic_perform_write+0x611/0x8d0 mm/filemap.c:4346
   ext4_buffered_write_iter+0xce/0x3a0 fs/ext4/file.c:316
   ext4_file_write_iter+0x298/0x1bf0
   vfs_write+0x6f3/0xda0 fs/read_write.c:688

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
