Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EF3476071
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522053; cv=none; b=XUnJTXqKWasPew7mZnl0v/UA2AfvEn2AUCG9orwydbl2CdjfJyduN8D4uaEvZGps7m9blDjWlP/GKCwn2EW/Z2I7f0tausEHvruhIAoAaHbwqluAGrvBSKjsVAhO0wGMvJEMUJ1dfE+ztedSdXgr3DmbBLltKBILIkpzvYKslYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522053; c=relaxed/simple;
	bh=txV8Qg+FxeOB04em+F5om51rUukg6r6IwzmGhc0gksA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N41m3kwls7PC2ebbWrtKCQ2Nz8Fs1PttGnPzo7OUrhNH07ipNoQSSFDvsxsS9dF2uZMstGFyg6mfVIlVVBXW1a5+RqQaqUiE0jNFA3iO0Yrm87K8QJtdJdhFmn9IcPQJ9g2m4+bM+1yQzrqTg/SGCde+OTcoGVh4etOL55nFzkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Po6uGkZq; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Po6uGkZq"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b1ab6d7239so727433eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522051; x=1789126851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9wdcnXTHjqRxBwghRsF1aqlf4YH5zUrwdx0LlCpxCg=;
        b=Po6uGkZqGy61fdG88oEJVv914RiQ/jR1Wk3mHYnPxSW1JfPrtkWonWOAOPqmgZ55oY
         egS3+rd5udTTecOM/rpxdKkyyGfdnYRX2pqslULsbPJcETgSQVNyurpdW25pTU3RlYkK
         GS+Elq9FpkmZpY/h82vHNR0MISnVT4V39tRgyBF4bLQfo7ELuAXgCrfWvfmsEkgn9gvo
         4QypzV56bwX+PKp8Ffht7xuExnvDnW/3zPAL5722zj6Nr7QHAp9Xse6b3NOOH9WiNxob
         +U6zyUMWIgmP+EWqNZLg6iophJFrHiFdWOEEdIi/bvfxqRvgkEeuQn//ctAuoHVbsHPs
         6Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522051; x=1789126851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9wdcnXTHjqRxBwghRsF1aqlf4YH5zUrwdx0LlCpxCg=;
        b=ObFOrNtM37jehl99lV0e61OHTvv3oDOpRIUW9/BkwNuqd8yAP1McK/qv1L+4uXbVm1
         srb4WidO/tpocLN5vLgJn6eCsdEoXdIIykf5KwLWytDvwiIUN4LmzFpm3QEzQIf3WVHl
         3Ijv+bXIHSRT+yntPFCNj9aJ9TJ53MjX5/OPVZ51kaxvkqG17wrGdgGC2lYl1cCieaEb
         ClvfNldCfiRxqYSsvnraTYtlBgylnlrRVa5XxkV5bKzR36aiktGghEearldzlZjGZeB5
         UOOFOgQM6sHioTql4o9lhMMcd1MZagJEBwuKM9dIAG8Rmr2MXIQK8PsAjJfk6bY6Iwr3
         7CNg==
X-Gm-Message-State: AFuF++mvbSwiB++gXzzZGmRjQC2uM4g4DU/e1o7H8BWIm7XwxYc3/Ydn
	94IRnXEzF09SapGnt6RzWWF4HStfJYK3G7gLys/ROeJbdIsUoGDyHVZiJAtoZoez1Xw=
X-Gm-Gg: AYBFou1qq0qb621B9E31CDxyADlYmdkGcspAXgQ2JGu4CLjCarVqqW2j6knOEeCcw+Q
	ThxhIdx3LafvW+B/+EgqKVWQ3cpWM0O0IlvIUBchHtKRxAf35ICgEh3p22SZekcVamwtY/SiW2j
	TDqLOdRiFoy9dShcY/ubh42OgcPM9dpmSUTzyytF8Bu3qm+tgxbq3jIxUpGNNVYYQUqDOZZHxnx
	9cUipuE5HVahejywW12MJX7iSCQSl2KInbhP39owma8s4JBkX9+sAwAzv0/Lvq5w8MSzzwfpW0t
	oh8gVOPpXJN1K5ow0A6XkTA6I7X7wJDGNIMkE82IdskCNBgvzEj0k81V+W7yzuweN/CGf9kxprL
	rbsPGe0sfeEkavbLtqs0QSGQIGGf9iqy0HuqZT+QgoE+knUhVrihsOpSK7DPU6a4sKZ4MTltSWo
	Tbn9QBmFSvrfPq4754h829nbnYPqBeR8Nh6cK1xbyPn51Wg3XyYphxQ783v67m5aXhj8M89sYa0
	UBZBnTQNNfaPcA=
X-Received: by 2002:a05:6820:f034:b0:6b7:46fc:1c7 with SMTP id 006d021491bc7-6b746fc024dmr2265093eaf.38.1788522050699;
        Fri, 04 Sep 2026 04:40:50 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm2695292eec.4.2026.09.04.04.40.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:40:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] usb: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:10:36 +0530
Message-ID: <20260904114046.24048-1-hemanth.selam@gmail.com>
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
  usb: fix typos in comments
  usb: fix repeated words in comments

 drivers/usb/atm/ueagle-atm.c           | 2 +-
 drivers/usb/c67x00/c67x00-ll-hpi.c     | 8 ++++----
 drivers/usb/c67x00/c67x00-sched.c      | 2 +-
 drivers/usb/class/cdc-wdm.c            | 2 +-
 drivers/usb/core/hub.c                 | 2 +-
 drivers/usb/fotg210/fotg210-hcd.h      | 2 +-
 drivers/usb/gadget/configfs.c          | 2 +-
 drivers/usb/gadget/function/f_hid.c    | 2 +-
 drivers/usb/gadget/function/f_uac2.c   | 4 ++--
 drivers/usb/gadget/legacy/inode.c      | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c  | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c    | 2 +-
 drivers/usb/gadget/udc/core.c          | 8 ++++----
 drivers/usb/gadget/udc/fsl_qe_udc.h    | 2 +-
 drivers/usb/gadget/udc/fsl_udc_core.c  | 4 ++--
 drivers/usb/gadget/udc/lpc32xx_udc.c   | 2 +-
 drivers/usb/gadget/udc/pch_udc.c       | 4 ++--
 drivers/usb/gadget/udc/r8a66597-udc.c  | 2 +-
 drivers/usb/gadget/udc/snps_udc_plat.c | 2 +-
 drivers/usb/gadget/udc/udc-xilinx.c    | 4 ++--
 drivers/usb/host/fhci-q.c              | 2 +-
 drivers/usb/host/fhci-tds.c            | 2 +-
 drivers/usb/host/oxu210hp-hcd.c        | 2 +-
 drivers/usb/host/uhci-platform.c       | 2 +-
 drivers/usb/host/uhci-q.c              | 2 +-
 drivers/usb/host/xhci.c                | 8 ++++----
 drivers/usb/image/mdc800.c             | 2 +-
 drivers/usb/misc/sisusbvga/sisusbvga.c | 4 ++--
 drivers/usb/musb/tusb6010.c            | 2 +-
 drivers/usb/musb/ux500.c               | 2 +-
 drivers/usb/phy/phy-fsl-usb.c          | 2 +-
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 drivers/usb/renesas_usbhs/mod_host.c   | 2 +-
 drivers/usb/storage/uas.c              | 2 +-
 drivers/usb/typec/tcpm/fusb302.c       | 2 +-
 drivers/usb/typec/tcpm/tcpm.c          | 2 +-
 include/linux/usb/cdc.h                | 2 +-
 37 files changed, 51 insertions(+), 51 deletions(-)

-- 
2.48.1

