Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355363A873D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519017; cv=none; b=gLmDjpK2w5JPkyKZMcR5pvTKMqLKcpR8QJkh2XyG72L2cV5QOnChCkwt807Q0wAFN8QY+dYYEY+uWXoQmhTMJRnZaBtSECZBNnwG5NxB07mnCq8S90/kJgpAtfQ+ebsELcSacahMZG+WDi5Cr4kyBRGwF+vL+siINycV13Tfn/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519017; c=relaxed/simple;
	bh=HoYYZWl5xMCEk2gzVGOo6o7wMXQsdpGRapkdzOEG0oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e43M9zsgZ3nvCdU4z0Vuyao+7D2jKxmSr9hvJ7WdklsejS9Rp9saen4gNjxIgak6W7q6lFPAKrTzsFG3a7tEkVlj6YW4g8CXb24oTE/uUj7961v1BKwLM8IEEls4xtJro9IsOxisOJB0zPcCw41fjyR2CszkUk+jm+KOpGc102Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAGc1Olo; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAGc1Olo"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so903908a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519015; x=1789123815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CcodeQMVxdweJTHG9V8PWJhwpHPz1n13iPBo3iHn3U=;
        b=GAGc1Olo40xEy6aw8Iu1cjGJVS9KybELe0SkRT2qqKTII6PBur5oQs1WdBuZjIdcp9
         NOKEye8bc2CCo0odruAMmMEnI4B+PNC0zkwtcuCgnlYGnpRgnNhkttnMenoZuEdcQPna
         Tbm+/dcmefHCBbqrJOKmqiVX3wK8tr9wL0RMQ+sgUzr9UVpfaJxuwOEBpNINxpGPnPHk
         Te5uCfBF9owcTHcFSsAR82+G47Odk0awiNDq8EKRp5B0K7ZNrNth+72VZeNr1CH7+x+w
         gkL3bvrVIJM91wrGFCJe1jnIXknIrTDOHanYQKrGGeP23WLuz04lj841PpGLKg0YPjvi
         Vq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519015; x=1789123815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CcodeQMVxdweJTHG9V8PWJhwpHPz1n13iPBo3iHn3U=;
        b=sI+6PjcCFWAlAUuBhb7B838z0bwJkG1EUGwCB5ZQkVID2zGwyiUO8fSC7Y+JqR3TYV
         IwhdsrQNCcqzQg08fP8KbJjf/jYb1k8btwCw1d5o2MU+6RUwiDjoCnIgfQ9qhcCyJFet
         xppMm2Z6apmVfFwXDnMZQeQVUSa8oEiFI3x3orSORnspcMNh2X563cLhA9iiBEbxLN7P
         1O8Xsh15TFBdU65KMvamczG93ENiKmsjdlrhMbxmQVPmrEXFnxLTyyfIABr/Cnv3ELjN
         ZPwL/q/XDU50CyrtiLOpZtYP4rxm2V7aGwyyTDcN633FMhpWOh031Vo+xbin/YAF8X7R
         Jk7w==
X-Gm-Message-State: AFuF++micgyOCxfvKXSkHSH+oMOJ1GsK6otNMKkh5EX5fIQuF1aqtjrv
	dN+GfQvDBcGH0r0qBRv4UaZawPNnv9KMtwGK70kyJpWLLJm/A5h9xSfhDS7dR3ij
X-Gm-Gg: AYBFou2xLmDlMxuMisfuPzOh7EYazAcXl+sktXHtfUg96EqCHxRc0yPtsgJOz9Flgku
	Ec1WBvpdHwtrviKogrbsFU/TmieAvUB1veMafzWPGA9ZyeHaWbvPPoMjH+GmqP0uhaT7E7wMHUS
	N+jynFJFgQa1zhiYDTlz7/Zmk4HKjx9tAzzvhnf5SYeHVJ3+wf0X41JQ3JvqAz4vHwXfOyHhvoT
	nWWmn1fstLEhEZrhiOO5KWHIMmj82SZoOFS78FjVonhzh2TAZCmrckzGFr4CXaDYuSXl+O3d7n1
	Ox9qDz7QjjnmfquPqxFMwkTLyIU5/ZMZ5OBM5nRLeG9tQsm4J0lfpv0eOU/z52I8mXLdLLFPSM9
	PD+rye+BhGU0w36+5jNO9qPsW0ZPMIQk8uiPQlYezVN6g3lDT4bQcKZDfCnQjsfw36tm3swByWR
	IMgrqYmq8lqJnL0XK0q+QKiN3ItkEARD+6u9ssyFbCUTBQBSgRf7kd2xT47rcbhrKITwtZYw+Gg
	wjHIA2sD6T44jU=
X-Received: by 2002:a17:90b:35d2:b0:39a:e002:f192 with SMTP id 98e67ed59e1d1-39b2628f040mr7389102a91.22.1788519015352;
        Fri, 04 Sep 2026 03:50:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm6421454eec.21.2026.09.04.03.50.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:50:14 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i2c: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:20:06 +0530
Message-ID: <20260904105010.27405-1-hemanth.selam@gmail.com>
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
  i2c: busses: fix typos in comments
  i2c: fix repeated word 'to' in comment

 drivers/i2c/busses/i2c-axxia.c      | 2 +-
 drivers/i2c/busses/i2c-bcm-kona.c   | 2 +-
 drivers/i2c/busses/i2c-cpm.c        | 2 +-
 drivers/i2c/busses/i2c-st.c         | 2 +-
 drivers/i2c/busses/i2c-viperboard.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.48.1

