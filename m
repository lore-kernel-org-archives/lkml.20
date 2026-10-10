Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0648A8D3
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634929; cv=none; b=fZaU+q4+qfKLlV7BuYpJoxUUP2TfaySfNrF+qGzPiiw8jnsC5VPj3so6Z0dKLQAtpvhZC/LTRf1Eocv+bueniyPIzX4//3wrH7/x95aBIAKgGe+dBdRry245M4QDhvOoMWJ/Nw3CkrqEro0BvOFyX5xyh26KZjbcWdFd33+TVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634929; c=relaxed/simple;
	bh=OQBXMXTlhy1CovXj6ndFCC7fPIXVPzECjvtJukEq3LI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ljaRn4UfaflQgyQ4FTYmmUw/lBnST+TtVDbYKAYIiEO1Z7gXjzVqnFzIoCTVrIcI3emFQyXdqFrDDJMi1Ec8vw5+lMLnc2fvquTVr0KhYN03nAS/gBIwEu48gR+0cxV9+yAO1xjB5L0rqHTDvMe9TiRwGyeEuRaFq5bqwGht7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9rTUIX1; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9rTUIX1"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so531024c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791634928; x=1792239728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQBXMXTlhy1CovXj6ndFCC7fPIXVPzECjvtJukEq3LI=;
        b=Z9rTUIX13ri6kw4vGwQhshwPLD5UzKLTLMsd+tOM/hwG9raOLkP7MejEUzgCo3krVZ
         Bc9QxWzTlcNQqDWqMGxbVZFrZll3bhyHMyl0aGaUkYG5uLEQehcWK9mW1FQUJLq68+eI
         J8IPj7qznFCkCGPmjVo3XtR0NnyRy8iTkYcBbe1zSc5y+94VR81Bb0arRTGcEpemx70L
         /4IESH3SttIItlC9rEs8XVPspkqhcMumv2WQF6MP+twUGIDC+J+8ShhqxyQ1brbbgzBg
         t1dCR3ZQpwb2mZCkiSM99PR0MpRSY6QZNHxV/g5GnYvwdELZUpQo8mX4mvGVz+ixK9mR
         6fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634928; x=1792239728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQBXMXTlhy1CovXj6ndFCC7fPIXVPzECjvtJukEq3LI=;
        b=0++xq6XHy1ev1vVLugO+PbTZziqxQ9By9Jtu7/W+wUywPTwYsGXFG8omlE0VHIGGR9
         kahAZFFNedMwttKz5GBocspPqWeAyqVKsaZBhRG8FmtTKckdd1GSV1esefwmmdNftjhO
         6ThMM5N+da7cFJ+UarVuL20YgPffPNyqtfIY8v23DCLZFyVvVCEpLqrrgrhlIjB2eIpB
         JLpUW5+XM2QwYWxF9UdFexN3pN30EDKriwVQszufqNF0WbNo/P/VAwn9GTcICjiixl5C
         IVQD5jSkhvyDnNYlLkROuCcF5HFK2a1KIjsOxCy3l1uW794JQAZVeKE8oujBbhjOb4ed
         9Mmw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ExhMFwLVI9kq+N6TrEu6809uiMWOyzlvcveCXyvwQ/XTOVacM3JHeiPhA4s/ARiKEUqfynBiNrMTOh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIsCKWh8PdN8DcT3kZriGTMHlqGqFthzWG9VRJnou/pgUCPcV2
	ZQTDId4LQhYPxTOdBvk0cm9weUl2+zohllWUHZenixRi5UeTdeDP15y7
X-Gm-Gg: AYBFou3zgy7jmmALhw8Kyab1OUUYt/SKMJlkt51t8ph9yoLVEk/ZUjqa39eA40hVXHp
	DOdRnSe/xsYbC1QqpGGuwtaZCYbm/HWpQOGBcD51UCVhWcRbnyhN4xLI2oaGPAZp3yF18VpcM+2
	daHUK2Qudgit6oEILSNa85xMOh8Zv830HUyPRPgcCQKoU2ks+cMA8fyislXRbdQ5qc6mBFwX2RV
	NDqyDkVni48P7ro2YvNYoBhnaRJrEquUy0hoRE52n7lKXjYplbvcgzZeTQLNeRGvJbi2pKxbU9m
	AMhMrNCwz2a3R0Q2ZKCqMt6oRQZfAKfPETGg72Sn9zUvriT2X/e9SeGzTWq2qS+FaHAZyJiodLM
	xV4csdUhS6mXO1Fh/WMVXjMO3lbEmdfQuCpx1//y4wr8o665vYFdj05H9YMuxsKkw84YVSAHijV
	D5kkob6a8Cd+xroeWQyLHZLiVTPkyNCGd//nNsvzxQufTeqV8YOGXFbFchKXNtpqyr2wLnE+q6C
	UMoL1iBr+fMYxdGRsKqr2zn1ziICiOQuzHC+/UsbaTshqoJvvErsb2ge+eQ
X-Received: by 2002:a05:7022:3a88:b0:14a:88ce:74fb with SMTP id a92af1059eb24-16a61d5c320mr8327477c88.45.1791634927663;
        Sat, 10 Oct 2026 05:22:07 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm15401816c88.5.2026.10.10.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:22:06 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 4/4] selftests: mm: Enable memfd_secret for powerpc
Date: Sat, 10 Oct 2026 17:51:12 +0530
Message-Id: <80c52d3311e732619c0c339b4a03e92859ba98a1.1791608423.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791608423.git.ritesh.list@gmail.com>
References: <cover.1791608423.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have the needed support on PowerPC Book3s64 for
memfd_secret, enable the necessary selftests for the same.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/mm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 2d5366196e30..3ada7f5f4151 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -70,7 +70,7 @@ TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_populate
-ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64))
+ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64 powerpc))
 TEST_GEN_FILES += memfd_secret
 endif
 TEST_GEN_FILES += memory-failure
--
2.39.5

