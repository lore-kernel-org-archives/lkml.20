Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87320485CE2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525715; cv=none; b=ea3SX0WcXwAiRrFXXRh8FCsPvwX3DC1jXCASfpEAxA9Eztc+oJxPqXXfELuEdTsYM/SGelqVzJBeuFcLsOJC3o51MBiBRQwuGQBTvVd5XXbzrazNVpx8T5mQ77jAo49l52536hlvXH3N3uBW65Q3Hf6SgkUGjb/nJGgYl5t0Q1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525715; c=relaxed/simple;
	bh=rddM3BYVppA9dV/fS1MsXsWj3UaN9BPbMbHWqoojDN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1dAHpM3tyf/Nb9K03PUgYF6r7rmY8isIcrccwf3Gy66gcrclIoFCRuo5wzQmtGCUYgYhTF/I6Kpd/r7Ds015gPsrXmBgp6aj0QBZRA771UYWN2Bqve7Ralxc8cJL5poVM5xqB78sqbO5LWc2iT7eRCkmapEnwiKaOn181rVD28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsfVxHw0; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsfVxHw0"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso561575a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525712; x=1789130512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RSCWnK2VOIPdpSR6iUDccwW6azRfDoOl2NA9SQbWeI=;
        b=bsfVxHw0sJSOMFx2WnF+fkP6vTCmJIRjqzDeGjMEqpezWvXLc3/w3betFrWAXSHaBj
         TDMFLG3KR69fou05I5audVuAeSAQrcW3V673ZxgwTxYFOpgRlq+PmI+S+zYALBcuNMvR
         2h+UaQwbD8B7Zp/OdJm7Vo8d2UJdnqGnDfK1e3A8FAYYAafmufMhdjQ6YktkGMwOVh3p
         ktA2YAjtyZkXvw8iijqIx8okLamE5I9TmFqZ2ndOtga4/WF0CqqcQzf+hOc7UciRaDx1
         OyenMW6OaqOqhveMB4jwSpUHhelWuJ8nDVPBvIau/FF6lQNaeNzUIV4LCx/AurcGWDGD
         0/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525712; x=1789130512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RSCWnK2VOIPdpSR6iUDccwW6azRfDoOl2NA9SQbWeI=;
        b=Hkl9jrG5ZwYWrfFeRDd+ICA1YSkf1rU+D/nFt6u1K6z5LTJet6zgiku3Yi+AXluSBd
         OpJmzSi69QWMQUwlmRbPSenQbKiQ0DcoIHqb+nAQT3R52oP+dd0kEH/O8JE3O89i9Ap0
         HdfC83DILsStkJXttr71duJE7dD4btZN49ca8aY3M8CAuqD3g8ly1SN3cd9zArOn5BJp
         +0IYVgsO8kLB/nqiVqxH+zlQkD5BuxTEQotzIA3Dy8lFT7JCitziLdBJ3BPmlDY8fg1n
         VAksBuOsw06to89SSND3xptJSuwDFcluOAbo/bBShWG743PlROWi/TAwZIN/MZJBgh25
         Jzeg==
X-Gm-Message-State: AFuF++keGxFxUkArApca9wHdikN7UxHkHM0sT+hr75AX4QeuoRAHsf3p
	uKSmVHA3BARYCuTvzEZY/VAGLhHoUkIRb4x3/34O/KVc/+PRg3oYwGC/PfHEBBXgtLI=
X-Gm-Gg: AYBFou31VNRKDme/Ke3yNgRIsDhWjp0OH9REdcr6Bbw1AErwVagebDe92dpu/uLexpB
	EBhUv6YhvhvWWSA5qeNtfmCmAi+r/uaX0JlPsbmzABoUWvK1HJpIBFoF8+suIbgVdByLcyxZAa/
	YAqH3VYlvbtEJDLirQa+8zIocJp91fezq6tsEJEYZpmS8wGaPKnC9xmlEIFyGFzUoel4kDVI0vA
	9wKbTNENv5xlr0yST4Oic56+VNCWvPdW/Iftln1QU9B9p4ByWON/YRGWdmYsy/7yChwfQ2pFo/w
	edHTa5UtNIj/OlvxdZcI/Gfi3fWEuwspIA2F9oURfY97jalWfF94UsIRCChFC6Ly8OERgLzNzwe
	wCBImlWxntg0Tgq41S/YmeWi5xGgzRoOdvynFyk6uPf/k4ByOeXjsm9D/2d+/cAH5ds8o1vmHsN
	Dw7/NUgxhM4hAaah8N1u3k3ksHaBa2jbEbwGF4aq3Vq0uKN/rCUklTJYRxdcT1TQpi1eztY+7cI
	MNw0Z5j9v0JHDdjQVVqt32h6g==
X-Received: by 2002:a05:6820:4dc7:b0:6b7:8396:f3d4 with SMTP id 006d021491bc7-6b78396f84amr1505439eaf.54.1788525712342;
        Fri, 04 Sep 2026 05:41:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6389550eec.27.2026.09.04.05.41.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:41:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] sh: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 18:11:44 +0530
Message-ID: <20260904124148.4575-1-hemanth.selam@gmail.com>
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
  sh: fix typos in comments
  sh: fix repeated word 'with' in comment

 arch/sh/kernel/head_32.S         | 2 +-
 arch/sh/kernel/relocate_kernel.S | 2 +-
 arch/sh/mm/cache-sh4.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

