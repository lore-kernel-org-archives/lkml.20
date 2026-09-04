Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3133D8902
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526110; cv=none; b=kHRYPzc7ThhC/aqautIX7+M0YBiSRaqHla0amlNpDi6E7h46QTm0mG7LXZFNZKUgoOy9+OguOC8o7dislQaeyT9TRHXeO9MW+MAwM+uAKp3x/ZxTYEEKDHN9HczKP91ULQLtgmNtDl0UyCPzTf2wibR3sb84/ScXdxgP8hhx6eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526110; c=relaxed/simple;
	bh=+iEpm2FjxQLtkzaQbNX5fST83wZkuKHg7yt4+UaIgi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAxXjD0NKSljO1I9LA2Q6lzRiDdRwq9YJkFtoGevAQasazvMjX/cBkt1Mhj4CnR/fv+QiMPuXUJMImafmx58GYP713cZdYv2h8E7DGBmNpzXYa+EOWjZ0z25Rv4XOaDIB2qjBL7Xgv507mn8fxH+8LhHML1wPyteK47sdUI469w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZOFt6eU; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZOFt6eU"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b28df1f600so742133b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526108; x=1789130908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=St7iMzxcCBQba3AI3+THqmAe7SlMFtZGccqjjT3p0x4=;
        b=IZOFt6eUJDuHwce1louzhI8cHPtMHtDk1wAaHKpmd0bUPVfRoD9FoiSIYgN2+M73IZ
         Gi9+jJD0g8rdaAWhWyV3R6c9bQ4ZybmZPFim8e8B1UCTzeUt2i6gzVbzEtjduavVEQky
         NmCYVKXV/vVZ3go8BCPsVUWSqPlnVKbHQjGWrs1VhT8gdQYILkmE9ciDIr2o9DoBbm9o
         RR0aCV+XfuevGvaOyLvIa9hRakqb6yV/PA+upXE3pdG1Ce+RpUkGGABhBHM7sR7Usnqe
         ujDYbMEBICldo5cGtAK8h+DdOa7OJhPIUF1ck4eaWE5qfYbPDT3N2nDP8w8TyunU8oTf
         gphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526108; x=1789130908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=St7iMzxcCBQba3AI3+THqmAe7SlMFtZGccqjjT3p0x4=;
        b=BlImU1PKxkrsF6oMJlAGpizQG4r7Ba+wmtZVFf2eaoERVnJ1nAulqnzqIXMN4gNumP
         +rULk0gVjcrh/OIgiXPUu2pQ4u5ha6EFvlSFNVJ0p+oT9PxM9j5nZn+18IR4ANYprdLr
         Zckj9aa014kz2dksa9+LCouzLRwScgfLRsmnWaZeuptfUPhU3DekkCk7R8gam+qLU7O8
         V5QuE4kSl42LAGfYEwlT51z3jJc9cS5ObAzPNbBNLseD37v2Lqc9o7QpMtyqwdirhZOy
         a3Y672laIGQLXmI7/Ng/tLUv4iEltqR5f9eWGYpu2Suud1ApDXxeT5skp+K05mumwp0H
         IYVw==
X-Gm-Message-State: AFuF++m9DQpg8wJJm6RhmOnNPXQ3Qrr7nm9uO7hG5lDOxuTSSPJzDxiN
	0uKj03+2rOUE3uW3fWqGIV9TZNb5AzDf78OVPT4CgKhnY9tdVnX8cpuxC3wvj/biTU0=
X-Gm-Gg: AYBFou1dDADN7DGDBBZ3a/CMgt4Kj1G+2ZqVi7n8A3EyeRFHa/1zIEmkBu1WQSL6Weh
	fwvvE2CfWwUqE0nU54ws3CNoiAyPV1SJh75MBcn9gUGcphMjK9Hgz48K7yLpT3/6UaEyNJJQKVR
	Vr0AR9J/ClJzN0Kb+9jiF2ukzwfT6LGq95e2eTKSM27XGWP9Z2NL2lXEdMyJwe2kyp6Ymq2jFsW
	7WndOma1SYW1Lfha65xZ97cL/5PpNqm+9ZsuoyFD0OE741rf4JH3zB3z7Urq78ZzMvy8jKzw0sN
	eKyX4ZMNB9D8QnZ4A/pvigXeoGYls39FIaQ2Bq7KdiHgazURyA/E2kv3hvewBc0LRDSCdh+rzso
	uXqSBue7pCZ/CMQePuSQIbSTTd04Op2e4EJDZGyXM+mEmIQJafBAWTJBOtOmUCNJfL8RLK8kNo3
	2xuMtbNkRGpWSPix/pzSV7jaBUHNIsVi27dmyBkvAJTq4Durbj5/aJaeOpkrAwMSfCvFuHJfICj
	Wcr6FhTkdWVTN0=
X-Received: by 2002:a05:6820:4d03:b0:6b7:83d6:2931 with SMTP id 006d021491bc7-6b783d62f12mr1451113eaf.52.1788526107893;
        Fri, 04 Sep 2026 05:48:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7322412eec.30.2026.09.04.05.48.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:48:27 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] md: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 18:18:20 +0530
Message-ID: <20260904124824.9585-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  md: fix typos in comments
  lib: fix repeated word 'the' in comment

 drivers/md/raid1-10.c  | 2 +-
 drivers/md/raid10.c    | 2 +-
 lib/raid/raid6/algos.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

