Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3E439F75
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524299; cv=none; b=QYGLh9gipFbvhyXIAr9KIaABhU5z9gkkWQte6mnwaGOOoVplu3t6oyRKISoXfn9m99b4ZnW9nDmrZbjk5LbItWtku9L7XAdv/tySuLiGfPS/ZA+m2PaaQMbbsbUB3Z4PqtvKACiKCEgLdyWWN1jGY+pDZz8e020m3DcVBxWZE34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524299; c=relaxed/simple;
	bh=b5Mja3Vfyf2KQYc9SER/WBaKaDfNEDcTEffklm+sefE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKFmJ8IiJtFL3VEBtxNgRjv0jAcdVx3ZhpYNKdLi/9obmR1YN+a2CwvDQQuRBFnxvZo7by7OICzeCoXimfzrbiU8A0vp8VajX9PZvvl+ND7nJ3+e7e8AYwdQz3huL7KOFQyftRTRWNbZ3Mz4WbtUWfymRkXN3+3nXvYyH3TMOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFiF0rCn; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFiF0rCn"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1159209a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524297; x=1789129097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYOrzU8uqTiHCs9e4ClmReNfwhWJk3MTvkkOENkbAlQ=;
        b=iFiF0rCnS1Fa0MHKNDtcor5uKKwUeQIkDRxkoxRA17sQcp5vVWXTP/m6visHRVzqup
         ukthSoGSjf4nLmY6Hm7YB1QE+GUfSZnFAtmxwqytf2AhqnlMuUWUA/JmOLZo8VGxvTjf
         IZAyyXK0O/T0heFaJY5emzTeeLtedygH+qZl0sDp1oHjJqzixJehAWADzj4vCsYLAumo
         BZfqRl510OsacI/2JAE6NYR/x516R4R8sOqyp8JiM86FJLSXcicKFKJi7ml2SE3ycmbe
         whWcpELobnHwNI0QDxLR5SBlCHbbP5FMtw7oWNuP3i5ZQqk7E5tAdYaQOZN47ycb+qt6
         yWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524297; x=1789129097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYOrzU8uqTiHCs9e4ClmReNfwhWJk3MTvkkOENkbAlQ=;
        b=py0ZUMcAf6JralcmCowmoAmTyJEk2A6IfYBYY6yDbH3SjlfaJxJCl7DvAPJsNb8j1O
         6+i95Tv3E47H8Y5GbGitNBBGwuZp3/zApqaXWVoJvnAGPFZ5txg/ydpz1wCTyGRNd/sK
         npnpch6D1ZRcMCTJUKNfyydDmd/2CU5xixA0EA7Y9BqUFhjGKwrxfrkki+Devfn4TmAg
         UH2l6F6NTSO0UEjCfNKOJOIyYm4Tv6rWgODtcHllWKy1xerzGd0Bi9ATnx6EblCbbvLb
         ssHStJlZOaRd9YjH3R475hWwJ2noff6peK2Z4j5Z+pqek+z19WRUSLyMD7bz2qKaJ2ID
         LD6w==
X-Gm-Message-State: AFuF++k5dSvMikyDL1uxYVWBnyM0GR9AjrJbbDkQRGjO5PStNEl8XDCP
	Y6Q4W2u/+9amsx1cV/4NFYcho8jyuIwBNHhhOP2WvbpYCuB2ZOxRkd8VMAV8B+JieAY=
X-Gm-Gg: AYBFou2A4nOdfxOqhcptr6qJhU8dDhS93brHRYaVUWXdv9nl3yJgQHjOtYJ662UctJN
	ntREwirrmS3orXWq0y/dIKIqYLQzfRDYQ5lIQXSONhlp3ux7oPVBb/7zjz7JqpY7KDoGo0iSg3V
	/rISH+3IpSc8VRt3LnzGokB+XHWC+j/gbVGiKqrEG6pJ9Tr5+MYZIRtKQjzBueICFtF1Vpmx+yN
	X67TByg7OLAHnOO9VN/Z13AZEMX71TVpvtB9qlDe3gxgfsO+GUu1Uzg7W52b8qgbWNEBfK6xbXI
	9QpeT1DBn/haA9GemyEl+JwZOHCBLg2B7J2x5iOY+QGM+VnV5n6mhc6drzBbdnLGbVuctC+Qdi4
	4ryWBLu4VCcexy2lbByldcQ13Z//Iay028gJdKn/vFWePI8fUnyeXAXzrqR/zmp2QvW8x/K57bc
	Q/wrg7e7yaN545i5ky5dn6pFUcjycKXxErsh//LKN6ZJrgIkjJXHcv8ZPFpL9pIbRVqzGuFFdsj
	V7zH7jxElGj83wmGJQXFNQedw==
X-Received: by 2002:a05:6820:20f:b0:6b1:c376:d35f with SMTP id 006d021491bc7-6b6f798bdc1mr3779302eaf.0.1788524297380;
        Fri, 04 Sep 2026 05:18:17 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm7181575eec.2.2026.09.04.05.18.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:18:16 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] usb: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:48:09 +0530
Message-ID: <20260904121813.26714-1-hemanth.selam@gmail.com>
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
  usb: serial: fix typos in comments
  usb: serial: fix repeated words in comments

 drivers/usb/serial/f81534.c           | 4 ++--
 drivers/usb/serial/ftdi_sio_ids.h     | 2 +-
 drivers/usb/serial/keyspan_usa28msg.h | 2 +-
 drivers/usb/serial/mct_u232.h         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

