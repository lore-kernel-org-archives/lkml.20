Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB9547062
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519676; cv=none; b=I5PdmcKaJlAcsn1D/X/ni4Gat+xsEoXFZ6YxmpjEEVq0QCGRavPt1d925TiwABIrD6/vn1CaoBeTJeq8Pt6XbBVhDydM8rAICKAXZZFPxM/jOzOu6If7H/LdupQTBKFOlB7YleG/X0VC12mjY9GFNKSh40cG76AoJBixWL5Wc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519676; c=relaxed/simple;
	bh=2e32D0YDiNKOgqLerrBZ1IDzwlwg7yRLpAfj7fza8SI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bOmex5SijTik9cWF0F8TMjj99bU80aB7pZAt4c2vZRrI1OHoRVlt/7fbq7np1/Hy+iGvoAHnXxuh/OQHuKUFKSIxaUGpiNLwKM2toNLh9/wUiZTxRTOa64MJX4S6NF77NXfKKyN4NO4uCtrXBuEvFNUJkMuBtOMnDQM9JYYi8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtbDjVVD; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtbDjVVD"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso3421013eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519674; x=1791124474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNsYrigQJFRd0fgglNuyNwcYfoFVPQhmuqxLt0lFgyc=;
        b=ZtbDjVVDm4WfOdDyh4fsEq6DXWCfFySav3JTn9lzbxfUNUkIk/O4+3IM0FL0iZ/49m
         5pYnq2aPvvWEnGQFw9n4gdc+Hjt/QCxYdSAy2bUStMDikfn+A5d6yR420xiCSxb7Zgp3
         dCVlXeyH8BjNCQkqRmVvbZGbBjOg9pW/ACl4lOtajr5hAqC9Pdmp6cXT7y3/JswLBuE4
         JHgvZarj4EmEki+YjId2uSSpUqM+4xD/UteewXO/BhZ9+SFKfBDpfwDjCtEN6WghCaAU
         FZN4IKemDb4yiA5yyXnQY4Bd7S5Df9Rs+yfcsEK1f/Nug9d57Wn2sapbbrPS/4rFVZ5/
         Or4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519674; x=1791124474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNsYrigQJFRd0fgglNuyNwcYfoFVPQhmuqxLt0lFgyc=;
        b=X+DgcBc1CRr9ntSBBxZxUozUgxNDbABK4bj7QXJjxKQ5NeFQlHObj5/t+H4TatGHku
         Q0wnnj2winR6lylAGcefkaCg314bJDm1kxlVaUPypO29HRrbJmpgv5DmD6HRsgCYZyGk
         FaBGqWo1bFQq83wS6yCphmQIqHq/V3WUIsdRNvDRsZZ9yy7RYTfHl9iXsrb8w/J6p8RJ
         n8e5Er0q+xo5PZfG1e2ALx2jGkPWPHKc7P7Fbvwy9OcSQcCrWsU2HMPm3Cwu1OAEzAjS
         /EltzSApFqK6ujC4F7tcE9gsoQHOfWaJihkaQjf8scNCUJEEfxkAcordCtkkytbCCJ47
         KiSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDKbNjaOC158AoALk3JjGf5VyELf2TBB1dzqPuBcstFBetEoBPm2IEU79pa3iXFovZHVfkeLdDHFXyHUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6yVRIKke5ZgByxAqR7h4kn3atlJ2St9DtQPPhvpLTMDfQJ8vR
	m9PESe3lnHPdIHYD3DNbCxQrTiGJk81S57Y64BHABPqwrBGpg6Ag2rTvQjCZpA==
X-Gm-Gg: AYBFou3w5K+KtGg1F+JqoJq9HFta9vwJiSn1p4qF6xdx+4um2nKtint5ZSuu9B01VjJ
	IS4w62r176fari8QO6yFoigjeoL589OWct8uQ1RVQ6l+jzWxhRP1D8mUPrvY39njX+xRoFOgDrc
	B1cZXKoAXtQwTW9oXU1EPgyAeRI4oG99RCLedAEdFhX+LRojBL+bGUMTZ+rzVHO5fH47U4N8te3
	yq7ArTflG3AssXDLy13Ns6wSy3xyJvw/DDrSMDqo94VNz3OwOQikk1N8ib/Mmh59ZT3g55UpFBx
	456VoRNspQP0s6MVaZLTYatv0Ox61twGi67TcDxISW3B966mDVxLq3yzqRrA7cr9HgHuRf/8bPM
	cZvkOpPgolDRWpLwazI7jLAlNWb5oXJKZ6hO3RKpqTQvOCQVRYw363Flg911oXf//LaZ2zhN9ho
	08Q8RS2t43TJrggjkqoZoEFtELDMRRz7kgZ8/UzOl5rIICmsohA3Ua4SzP10xB2c623ZJxEMNFN
	CfkIbggBFGrYluRiazvJqckbcCM53/6hPTr9PYWe4N1+kn7CQ8H3byC6vboFg==
X-Received: by 2002:a05:7300:fa15:b0:33c:fd92:a7c0 with SMTP id 5a478bee46e88-34273848bd2mr6697950eec.39.1790519673985;
        Sun, 27 Sep 2026 07:34:33 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:34:32 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 00/12] powerpc/pseries,powernv: Enable clang context analysis
Date: Sun, 27 Sep 2026 20:03:41 +0530
Message-Id: <cover.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Clang context analysis checking for PowerPC pseries & powernv platforms.

Lock acquire and release checking used to be done with Sparse. That support was
removed [1] and replaced with Clang context analysis [2].

Note that enabling this caught few real locking races in arch/powerpc/mm.
However, the fixes for those and enablement for the rest of the subsystems will
be done in a follow up patch series. Also the more invasive checkers to check
what each lock protects is again deferred for later enablement.

The series was build tested with Clang 23.x

[1] 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse support")
[2] 3269701cb256 ("compiler-context-analysis: Add infrastructure for Context Analysis with Clang")


Ritesh Harjani (IBM) (12):
  powerpc/pseries: Drop inline from hugepage invalidate
  powerpc/pseries: Rework hugepage invalidate to remove conditional locking
  powerpc/pseries: Rework hash flush to remove conditional locking
  powerpc/pseries: Add context annotations for the DTL worker lock
  powerpc/pseries: Annotate the VPD sequence lock context
  powerpc/pseries: Annotate the RTAS indices sequence lock context
  powerpc/pseries: Annotate the RTAS physical-attestation sequence lock context
  powerpc/pseries: Annotate the DTL debugfs read lock context
  powerpc/pseries: Disable context analysis for the CMM hotplug notifier
  powerpc/pseries: Enable context analysis
  powerpc/powernv: Rework OPAL console write to remove conditional locking
  powerpc/powernv: Enable context analysis

 arch/powerpc/platforms/powernv/Makefile       |  2 +
 arch/powerpc/platforms/powernv/opal.c         | 30 ++++++----
 arch/powerpc/platforms/pseries/Makefile       |  3 +
 arch/powerpc/platforms/pseries/cmm.c          |  1 +
 arch/powerpc/platforms/pseries/dtl.c          |  8 +++
 arch/powerpc/platforms/pseries/lpar.c         | 59 ++++++++++++-------
 arch/powerpc/platforms/pseries/papr-indices.c |  3 +
 .../platforms/pseries/papr-phy-attest.c       |  4 ++
 arch/powerpc/platforms/pseries/papr-vpd.c     |  3 +
 9 files changed, 81 insertions(+), 32 deletions(-)

--
2.39.5

