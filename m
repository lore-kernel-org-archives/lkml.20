Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23B4734CF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521190; cv=none; b=Ebwdtb7GG1JDFhuM+75pLMM0NCUcVYBD8MGEHPIGtyuRwSMPKEYu2kwv6x4SerJ/90JFqLb+hxcM8WUdSgDCDwW/I01xWrdWOc1vEcN8hhqmKQKY23rTDG3HgI9Yzslaj8greZUqRbnMOqfgLLpVumkKA4RUUF58b0LcQD7X3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521190; c=relaxed/simple;
	bh=tEAJsrvOD9NKGswDWcz9YQKnqy29dbEqhKuYesKMf/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMbAiIDurTZQLvjT3rbMdnidOX1CL0XoULcmKCZwmDnNLTktXx2XC+WU9bfCeWn5a8vwFLfr+rwPek5L3jwqvq44McIaLECOA02fRlL9nXI0NK8hijJAneqDDbM6bO08NDACXXweOKtM3qmm6sA/gum+IJNzHN/gJWKDlxE9cTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwUQUL0r; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwUQUL0r"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso708547eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521187; x=1789125987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWhsSYSyHzdFqhQ4Qsm+lC/40URBKaNonz+nhtZuPLw=;
        b=QwUQUL0rifmd2IfnTriLTc/Ji5QUcJ+trKkutjy0X/Nn4eKFuFAgJt/B6sxtd1sQ1e
         QuXcT7lJTNz5cRntAQhTeTFRWZJ6Ry6Mw+vNpNCYpHiOCHfU4m3Px93UoWTZ0c8ZP1Tk
         jc43ANCQ/ypzONgF3nWIdZQPr5WFMsJ77dX+ZnLLDIkj1HoM38Qm5CY16tml/DtuMD8F
         u05xXYrxC5r2tUty2Wdp8k5mx5GhHUJMB4K62e50cu3o2godUb8C69OkU0u0XZZ4vDtk
         ewqL3LHUHEQvDQEQ9QTv6nkpUrXVQMBopS20WLw0DG1C0W1N7SgEz4KMIzQAqMaIn4HP
         nM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521187; x=1789125987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWhsSYSyHzdFqhQ4Qsm+lC/40URBKaNonz+nhtZuPLw=;
        b=RtgRYpZ6Jq6dIBp7fXQqnLGW4Xl1JoecjQWjsakjbOymQ+86Uvk41Gle4yz8i1lbwF
         qbDvCzUnVYQM9baEzBEFDbHgQWz7Vy0WVRZ0e/Rv2gkwAmna8sIAfvMSTXzz6aOO3/yB
         zh4HaXS7jjd9wA1I+0g2VlS+kkXKPDhe+ssepOxxvv7WFTt6ro/n5IOGPP4MLjQhUJRV
         q1cmI05+9Dq26eWMvUwWMxEHTY3KMd7RxxTOK1jQI5zShDgXc6Fzz6dqqdUOnfo0UsSf
         qRAX/u/2Oh/4ZuvJrmbGQkYyg2VgGFWaW4c/yB4Sv3iwzTk3OXZ881Mpq4ILDcUuEhaO
         A6Qw==
X-Gm-Message-State: AFuF++kXBd7LOz2s0HlzhcDN+DeE9uVOowoP6aOO9u6SbX5OoptuD7pS
	CS5zOjLucXaOzT9szY82YxWVQgBeuYYwjX2UlJwJAhRaAiVOD3oZ6fDUZVW20yApGlg=
X-Gm-Gg: AYBFou1TKMaEumXzVmgX0XWe25v/7ZclpPSde5zpCfddaTWijaZ+OWGlNoibMn+Nbgm
	3htTkyzu7ZWwP05COLuS4N8yLDkqUHAEv7li9dMPDu74EuVmGmdfPXvrR4mE8tkLVvUGPAUz0Pv
	CGBEvV5tbcVpCjaIXW55rGcs2VLAYGOVWKOAl2tpIimMx4npTDGsBmGXNzG0MkWR7wJJ0BBOxUg
	ZYvf3nFhOHh5j4nJWG/ZDoS/+QbZtJooHofwGkP4p/TaYsg6rTMxGt8KT7WkCjPXYUA51BrXS8a
	T+XcU9L0LJSMxyT4HfKS5xoZRrusANFHMaBVbppejhmkn0dWTt4qyxI8ysy3ewt452q4RENkw5V
	OvcHVbHO+jhWxTTWh9kL+a2Xm21IAm4y1z+lNmc8fju6InqDoUFTuP5YxEQW6vuWwpe497bNYWk
	K8DXO6DkvOcZI5y3BDzCi0ALTQi+TzU3066EiwKEI7hvHJ+ljSS6w5qpt4/hGKdjEMNewEUL1FK
	oWHwK57oeNHplrW2pO9rDlrHbY=
X-Received: by 2002:a05:6820:858a:10b0:6b7:46fc:1e1 with SMTP id 006d021491bc7-6b746fc035fmr1517597eaf.64.1788521187342;
        Fri, 04 Sep 2026 04:26:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm6698786eec.21.2026.09.04.04.26.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:26:26 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] scsi: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:56:16 +0530
Message-ID: <20260904112623.4208-1-hemanth.selam@gmail.com>
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
  scsi: isci: fix typos in comments
  scsi: isci: fix repeated words in comments

 drivers/scsi/isci/host.c                      |  4 ++--
 drivers/scsi/isci/host.h                      |  2 +-
 drivers/scsi/isci/phy.h                       |  2 +-
 drivers/scsi/isci/port.c                      |  2 +-
 drivers/scsi/isci/port_config.c               |  2 +-
 drivers/scsi/isci/registers.h                 | 14 +++++++-------
 drivers/scsi/isci/remote_device.c             |  4 ++--
 drivers/scsi/isci/remote_device.h             |  6 +++---
 drivers/scsi/isci/remote_node_context.h       |  4 ++--
 drivers/scsi/isci/request.c                   | 12 ++++++------
 drivers/scsi/isci/scu_task_context.h          | 12 ++++++------
 drivers/scsi/isci/task.c                      |  2 +-
 drivers/scsi/isci/unsolicited_frame_control.c |  2 +-
 drivers/scsi/isci/unsolicited_frame_control.h |  2 +-
 14 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.48.1

