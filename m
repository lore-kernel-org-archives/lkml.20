Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72AB3932FF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523685; cv=none; b=oAhS3BQyiOzPVP3l0AJLe0JPIeDJ5CbM2Cl8eCoiOTWJjpOGIwmftH9LDSd0l7th8FNhbwYRVo22Iff5SBPdnP32/Ya+YJijaR2E0TfNDN4eJUwBu2rAKwDtASRtFW6s+kyqkyOsgCvh/YpfXHvbwHNGI8PxD3wH1wXn61RHrso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523685; c=relaxed/simple;
	bh=p4bg8m6aBwm7yzMlQHTLKK/0RDg/1nmQ9IKWQGlLxg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMk3lAUkEIB4VD7nb6iOmkshOM5uwnQriCOeKhxBylxWgRuQOvzAuzHq0mWnidAoVSHHddvOHok/Ldsxnme77UauSTd82ycv4myaqIquyZ7v/MH2dIG9OMRW/5+mykjOflb157mD1/sQGcE8ZT66T/FW2XuTVOA294BYujSWOUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spEHxSym; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spEHxSym"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1208958a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523684; x=1789128484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg34IPFa4towCtvfASdXZNQtpS6b0CwGYpSVPaNNq4g=;
        b=spEHxSymgKivDxtBcIoX/+pi7UmPZett3ibJgV1ikRGAJY2OC7kFJDBp4f0tnFuNb0
         ZTU/P00+KuusVk6M203Sd2xZ+TPHTgd6KNVkiqpfhXfuqqmrPoqwFwY8Zg+trdSBB4Oa
         sX2CNhhKTCErHx0G65VJ0vlKJzaCrBrGKjLJVgQ1Nnies5Y/KH0lLfgo0tdZUAooEd2J
         e+X2M80cB56fmfdeNRZiSa9OE76LDG9/ezmK2r0URfRv18q/kLvtb5JyjN0UOEHlDc1h
         TetlGUZHqoTEN6oiyiK19QvW8S1tsFUqL8pmG5uNbj09D8ApCeSXOKN6q9FPfL9mGEXQ
         lYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523684; x=1789128484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg34IPFa4towCtvfASdXZNQtpS6b0CwGYpSVPaNNq4g=;
        b=dqMPqLZ2K2fh1bfsh0f6xj+6oR6XZLbN0uAcF7UCnNdUIR75p+ywXKT9WMwmbgNQGp
         5ZB3i2obZX3Fo3gguaVY/WgEtllqKfs30k1FpJcbmGvMxW+VwUXeP5inw0Juq5v6I8B+
         UfCHz7DuGZ/36Pc/dQC9Zt7Ghme7fUzmYiFfjyjvva5ttmp8llGsYec2B3wFD7vRuRIY
         zseYTNU4sd+m1dTpZzRdVPm+GG7ccd5u8Kf2tNs8Yd4irA2ajRSPfcY2SbJTDWEvXnVZ
         i7nZn1AUmbHXFQFPJTpxZGwEVW6xm7zbnSrszwe9MfaI6zoKWAkoyx/oRY4K5SM7Q8Gh
         fseQ==
X-Gm-Message-State: AFuF++maL+TZQYXrw0PqMxP97gXY+4drkjU7oP9v7zESSw1YLWn1uQrX
	70Fr+b53HnwL87a5s/wMmz8xJYzR0RNXjxWDFj0JS6CFOeMi5v2ht8++Mp3xf0qMBOE=
X-Gm-Gg: AYBFou0LWk5onttrEywwOgNhe+lNLkXi4I44H20yPECxVGUmG3GcPW+X2irFaQO4cFF
	kAWJSix47p7F1FT1n8y7dLFt8r9h8O67TKaLeAfyLp3kx9PS04LLDAhWcx6snRxDy7jmFmzd0sT
	JI6rnw64hquplkiPw1WCuuxYJxeaoVXRsaSRKSshJGWnMYgiWtjkrf8D1Qd4CsXH0zQk4AnUsnT
	SnEUsV6Z6gQzOqISSH7u/Cpq/jfvLiMdfGrBIGTnWK1zr6VjnG500Vst0GdIsugbCU72Hh41gBp
	9Y9e60ZXyn21aFEV4OqcueGwxjSTVZ0QVPuz0xPxKunslaFWcNt1g74XiOsdocVRQ+9RQy2A0Nj
	+1KJ0tq5/BAclzjMU2Vdyp667Ypchia0rMGsxXCEIJJRVMXczpKvYMzoX6QvHvG2nWDFirv6kjA
	0xTpiN3R3BKtxrRiwPsLXqecJpmX3eOjnv3fLvdCajYS09Vnl1SDOTnZSj5d8AeJ7QlTD15+dcb
	l6FqH+xX3OtWNk=
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr9610775a91.12.1788523683695;
        Fri, 04 Sep 2026 05:08:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf44ffsm5831087eec.28.2026.09.04.05.08.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:08:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] orangefs: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:37:56 +0530
Message-ID: <20260904120759.19755-1-hemanth.selam@gmail.com>
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
  orangefs: fix typo "overriden" in comment
  orangefs: fix repeated word in log message

 fs/orangefs/file.c             | 2 +-
 fs/orangefs/orangefs-debugfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

