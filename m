Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049013B95F9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523853; cv=none; b=Z5aR6+C26I+zgnlLduDKg7Lxiqvw7kI/Mt4W4zU6uNLADnzZV03ny2peYDQUcWj1VbFbXYZU2PMCKNXToTsGLB2s5vEMG1nYAddtKKpKZ6m9BE9i/wbQMeNxdpDxI2S4Vt+jPh4WpIy/Ul5CNFkj5PQRvooWLKK9x+QjrdYraVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523853; c=relaxed/simple;
	bh=j6IFB8F3nRTMKiTExbElZrh1dRn4aCIOqegHovvgY1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBV7Di/Bgu2eVhcZ/mTK+EjIABggWTHeyrGcTW+c1Eff922RFZuhkQz8R8nNx6YjdkFcCl7tf6thK8Jj5+olz+6H7GUOJVg08zPMx0xCUgupk8UPe+XiGy1DQ3ljZRMxCSJH5vGAEGeM6Cf4lRjQgrQeB1WkxPmtzlbt84pj+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eT+8VHg4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eT+8VHg4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc147d86bebso958580a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523851; x=1789128651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qR3AsksMeTc2mueCzVV3hHtT8bUxRHpslxSBmbRMvNs=;
        b=eT+8VHg48DWWndgGrhTiURWlFJoxqFHffEk5crYiBPBLIB+INX54QTm3tcgOrGLxic
         v54MXtUGYNCIEfdF1EtfFgPuwd1zfKlL6rgRvQAcT6+r8mL+2hOun3idHp+2m/WRJCVO
         nwgVFl9Ti3WzWZ4G+mrBXyfLTkuvd0u69rx08ZvKwiOI9H5/wChLTqcFi+ipg1Ryzoc/
         stmOFBf2Bu6ebavs3uWyIe2vAKL8Lcsgj5/gFBFB1IyrN/R5DCRfjwJ9hM8hfyNlALEU
         NoElQDU6NZn2xxN5w8TYqzNFW6Vs4VXnJv1yBdVPh12KFPqPe8zcPERPipzh5zBxDQzY
         hJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523851; x=1789128651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qR3AsksMeTc2mueCzVV3hHtT8bUxRHpslxSBmbRMvNs=;
        b=iZWkQ3zSq0iKVrXV4iknbNZBlSSFoLvLsxrRXan23QWgSZNlmcqei50rB0zsMTz5sN
         lejpdCEW819QVnFbyw11+Tr0be/eWlp+/Me+tjbWHWbIwUzpMl6dj3Jzq4S4poTMMX13
         6oGjJMilTmWB2ArcK0krHe9j6MMrrLU/4MQEqOMaC3x1DTwlSSbWF34cC0SHAafTj3qZ
         JiHGbZplsg5Pyp4aiIERQnv6AbSR6Ujj4MK5LZygRF9OeT4cLsiYi+YFagNoZLu3DPmG
         boFC7Nu29zC8/ZePIi3Oz7CRHulxvDJvU+S4h155bOCCMcoKsc6DjqxN2ULOIBB3LonC
         z0tA==
X-Gm-Message-State: AFuF++k/3Tv/idB+I3UoQakb2wdvIk5Kcqw5WCmVGdXBAWtBMdptVOkK
	55POwO0KLlHOtDIn4pNtquUUqVT6oI7oBvXo7Ueh4A4lhiIPZfOX9TBgeNvuAHPmGwA=
X-Gm-Gg: AYBFou2KcFvZLQ4t7H+G6e/xcUE6EBp4/FbGCVA5+I4AWsgndnA4V4wC4DAI70R7vD5
	21pxM7NNp4s7T52jWdauq6P65oFI1afThTdCQsaOdlMReBpPRAouDEG8u3VoHRl+r7QMIIMbBqB
	4ZdveEfrK7OBjUdOvgn09lVTJU/SfrfTqXmR+9miiBO7WMFcTKcrpzHRj1C+kPYf48OrSf+4ZXR
	VYKX9i6c3JG5ZXusJ8rX+39A7cTGZyM8rbg0rVxByDqu//awLERUxe7rwMB2lFWZfm1lZBf+UHU
	CLcQ1UaRFYecoarn4uRZ8Heb0uDdFwa6DgRwIN4cR3lH/644MDS9gYKNVO8FPeVvCnkZGLPiBFj
	l8Tjt6Bm+XwSTkjxrejEGc8odSMJ4WtMuy1OzcwYdzMeCpIz6+zYWyYg9EPzqJQU9v0wMm794Zr
	gnWFL612kb8hMhhov+CR3RLFcTfaiP6XSQFzs81fUvp423e1NDTgmlJiUka3v/wNvUDDf6qDi28
	FzRBhGy3spmthIwFzxgYVOPTA==
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr14865790a91.16.1788523851093;
        Fri, 04 Sep 2026 05:10:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm6461237eec.13.2026.09.04.05.10.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:10:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] iommu: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:40:42 +0530
Message-ID: <20260904121047.21701-1-hemanth.selam@gmail.com>
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
  iommu: fix typos in comments
  iommu: fix repeated word 'have' in comment

 drivers/iommu/amd/amd_iommu_types.h | 4 ++--
 drivers/iommu/intel/dmar.c          | 2 +-
 drivers/iommu/iommu-pages.c         | 2 +-
 drivers/iommu/omap-iommu.c          | 2 +-
 drivers/iommu/sun50i-iommu.c        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

