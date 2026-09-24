Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0606442A168
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289022; cv=none; b=U+qf40vuQvVxFR/jk94TsKpZ/TThnMfIhVswBvBlCQHqjWcA931BeW45P1M13yD7rsK0VTaABZcCggWeKgmPndXKzoXfeJD9YcQEsiaJ1EnyadYkX+a8Mhdt/dkOikJ6sNjH8UgsFZKBZ/9dCNGAkFSWUueUsBLuRZ2+svSKYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289022; c=relaxed/simple;
	bh=ZQ47v+1l5zFTYDsix1twPUFL1dg0UmT7YbSkRbqgkfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRbj4/Yy3LIz7nGOrYCuC+wnP4T+HdD0KUvyslnrmez1LvAuaw2TqnnSsP/mp+ILqL62loHuG4OH9x3GYPWjJ34X8fykOMoNKPr8gEYswi3BvZVoxqbjzh7Bx1iD4DrvNXXoTOxdOm76y62uwDHcCA1VrRHhphpHqHijml1VKCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPqY+pR7; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPqY+pR7"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32dec843c37so306129eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790289020; x=1790893820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwWp+m0GQ28uSY5o1Q8GNMOoo310QGWQiShKdxdvoXs=;
        b=UPqY+pR7ljdCb16z3Qq5XUYVV/S+L6ue8Ag3WwouUQC6oOkIluMMxhKCIIH0w7QdCj
         cfg4AVa3lrwo6fH4tBmYiJrWUnk526CcrEpirUR+UW9WB3IWygEG8tasfuUeCmS/jg01
         TkJkQb7UbMYJx7Texavivc03VppMu8jwFAeY/GMv48e8r7eajCjkVyeHmxOrOiixgDP3
         ugr5ZZGcyIE4Owyggt6nM7fUXXVq4xtNCCUdzV9Y/JK2qlZmvdF9LfItOasTKV0XVxID
         nhgXeTProheXzjVfKUuRMr3qD2A2ew6LYR1qvVo3T4jCUxDzq4nzvfs4dNLb5k8/itve
         ek/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289020; x=1790893820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwWp+m0GQ28uSY5o1Q8GNMOoo310QGWQiShKdxdvoXs=;
        b=i/dPNM2yxhAQqLUwZRlll2pKG4vaP+j3DS8ao8o6rO46eYcCmHfG3ff1MogfqaWf9G
         tCZ6IEkPXvY2PBsbJffTRG079R6VmFUejJeDyGiSzarctL8h+EkgMqXLxGMKwwA8mw8q
         /ggLT/VST5B2bHgSB7tyMAlhadAw1+m4Q1YISA/UaVZTc1tZ96GR+VD8bmj+inqhFZMU
         DjWwecvo9/YMGnvBh4OmtKiatsp383y0LX9XioVvIiJmGSlqrkn6ba9SpDcUDSDYU/bV
         2bcWYwHfFVWLeccVRPyCDuWKdJZ/t73XB+84zbjuFISfizOTWMjeE1BnB+qFI78trLUs
         jqfA==
X-Forwarded-Encrypted: i=1; AKwUvBwo3SVDJY3tkcE/BRpbIs7QxTg6SFg/cMf4nlf54soe51el4Zz5UAaxwM96rm6JhB0+6kNmMKIrPVHXiQk=@vger.kernel.org
X-Gm-Message-State: AFuF++n/VdPMK0mOWhLSIgZtxgEEp7IxEXLx6KXWKLEG0IAkMH04YHhs
	uDxPWvFeE9y+y9dUNvjZPLjS1qagyEvUTCK2ztBK+16IzZfeZ1jDL/R0
X-Gm-Gg: AYBFou0lzzVgtLnan4eWucshgjbhJp5SGYwlmiuY33SIZwalCmN9qA4PgLN7tYjSOPD
	AlSsyfE/N76QGB4LiBgFSWGRDdSYWDDdihsUE7YucWGCDbNBrYOVdnkojlBNnaZ2vp5DfwH5n1K
	WMKrmSFXidFdkca9uHCFq40HwZI0LPNR1K1eo9t4Wx5UAzrZsqZ0bqrKywM4XE0zxy/gu/66hKb
	9eimGoYeVAtqq52Zk95VVxFLNt1xZECgUBaYc+Ll0kBH9S/FnA8JVGBEKysVxoBRvy3vsYJMkJV
	AaJdRki6Gvnsp4PMwDidbWc3AzpXsjfVMpMBsE/Bow6c+PY69wPylb46zs/rzA4nKKr2Q3rsLwJ
	bTg3ooOPfCrPZMaBzGLS72KEAjVo8uFEZEDvX9fKlxusYG0k2HlBSuUk+nLB5OAoqLXNtmSFLL0
	hNBT7lRxCWNM+g3zQK2XSu6wgP7KO8IFyV7VuZYa7jf6tf+5vaTHSaCN5AKa58fvPtt+HVZr8pT
	XrgPR3665RlTkVqW0uOCSHjbC31ppu0l2dimb5u3g==
X-Received: by 2002:a05:693c:42c8:b0:33c:2611:1a14 with SMTP id 5a478bee46e88-340039b520fmr3021293eec.29.1790289019923;
        Thu, 24 Sep 2026 15:30:19 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm1541989eec.19.2026.09.24.15.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:30:19 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 0/2] seccomp: support O_PATH descriptors in addfd
Date: Thu, 24 Sep 2026 15:30:15 -0700
Message-ID: <20260924223018.564548-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

The Sandlock project uses seccomp user notification to broker opens. To
maintain user-space application compatibility, it needs to return a
genuine O_PATH descriptor when an application requests one. Currently,
SECCOMP_IOCTL_NOTIF_ADDFD rejects the supervisor's O_PATH descriptor
with EBADF.

Allow addfd to transfer O_PATH descriptors and add a regression test for
their flags and read behavior. All 112 seccomp functional tests and all
7 benchmark checks passed.

Cong Wang (2):
  seccomp: allow addfd to transfer O_PATH descriptors
  selftests/seccomp: test addfd with an O_PATH descriptor

 kernel/seccomp.c                              |  2 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.43.0
