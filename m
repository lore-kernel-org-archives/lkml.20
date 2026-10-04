Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D253B27E8
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085282; cv=none; b=Mnv0ptLnDvAUh4I5JBhgippDwTUNF9OMg7v/4NUPXhcjhvuwD9BM8jn/hEIz9r9bysEtsQHfWUSgdaUf6HofEvPXsMgGsHBpO8ERu5VtgpKeOLJFtaTWS+fnzUM4RS3lK+AmXfLUn3KSScCEHHvrJGvvYPqXsSNFH/Ew1xCBHt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085282; c=relaxed/simple;
	bh=YwMfJfhS8WebAaG44mb8R4k8SEc/1J/CFXwbQ9opnDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQQEpG7KrkYVPFmQt/L8uqwNowWEPPCTLXqWMLgXxbQSOOGGQrd5tuyIWgwognD14Kv39oTt4/xLXMUchVFJjF4Y06fmyPgeYALkqXBT6PsMP45xsCIRwyWoSEPKHYUxlwtZt0MHCPVO4HJrukwbE/g+GTPX5UPhSvDsEQkqc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=iM52JNMg; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="iM52JNMg"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34ca2d54925so1197287eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791085280; x=1791690080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueRz9cc1D5SmO9hExT7+LDHNk+3Y+rU2JJ/JFsE/Ps0=;
        b=iM52JNMgXFOiZyoEfN3YDwpmyoq5o+hb+R+MmEW/LBwlAWaqbIxtLbkvNtagasa11k
         Ppuw1Qoujn2U0s2lucS4wdB3Jw+LPuY3Y5G+Tto5I5uuhIYihcdJ8X3uErKkiolibmGE
         ANHbUQZf9AXwkG5kA7bu+7ctf9QyuFQz8eiyJbPUda2P4QTfjbFPboOifs6EgYFMFSs4
         G+UUfDSZY1fHuRjjwH5b68+MZH7rtJ5/cfxu/gUUhi3bLGPiukTlESG7TeJ4FhTsXena
         fF+vyB77TJhfD4k/2yF+/P/PPLVRENUYwe5nb3Xnj2cTXW2rjrSM3NmtsxckAz+Tlxzs
         0voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791085280; x=1791690080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueRz9cc1D5SmO9hExT7+LDHNk+3Y+rU2JJ/JFsE/Ps0=;
        b=MX7eVnC+I0KJ7REH+fSB2ofBKo2aZ4+1cqiinCIiiqdFhVx+uMeEPvRiySS05oG+Ba
         y4bJ8CJbGRsKIiz3sMwTaY+lilUQrTHciCHxHoc+C8NW5z+qEcKXfqfOtPU5Rjfng/KL
         qyZ6U3/EOWgcVqKYP5+uuviXvVygq/dD8bKKdiBKWeabiE7ydBdUTQaUhiNCB3QUyFmf
         G7QEbuy8D0XzmKTTsyUwZ60mhlkeu8JK6B7B0aN7+lmzbAx4sSwmpMP6VdyXIuk5iirm
         TwzBwSroAXPtM+U3pABH4rgk9AUj7VYWyYNlfJcdEM1EdoObAIprbcZuFmC5ywGnKY3e
         nwBA==
X-Forwarded-Encrypted: i=1; AKwUvByNs8zspN4RvbNbY6vWJ5O5vcenNIqXrV92woPhf1kee80Fet8qN0/7uy3HU3rM9MXK4rJ45ha/1XNs/DU=@vger.kernel.org
X-Gm-Message-State: AFuF++mohs4ZqWxr7c7K0Rxs8xKOjhFVGajnk8TBbN4uxr6BVOTCGlYI
	sx43HK7toufkWGSc7lqmO/R3Ceiq4DhA+jL/xnvq32f6of3cfhznOqBDoHTKiVeHFEg=
X-Gm-Gg: AYBFou1jb+jCAHxeQ+flB6XXw/zF5VU62/5Tvl/OnXkRPf2MXW83N971qGPw9H7WcjA
	9RJv0s/k90M0csQcgUcy9A0z/B/iXbRuD/fS0n1K8/druMzd/zDau5z2btpnOhQQSWU9hGmb5wl
	7ZnNPI7oquBK4+FUU0OKvx5/y8WXRHKfY5R0K4cHDA4Q1HPzW6zNiHxI5+lX6azw5DfwwrBOZYu
	SZrUertKg5ImXuT/XJmEce+LFkPZVzBNIDmeV2P3VBe3u9t/892NcJ123svpQWFGFTokDd2LRSl
	iDf30Aw+gfzfnrjIZDPejusdxHhHo8KKisT6Ru4y08Ex/Eei6b/cyjwKKGAIvs2tyhTZF6wec6E
	PnEO2ymTk1LrEpWwtTalmGlPR3lZooRY8NeZLO3rdbyd8XonXtHTeHi6K9G9fE285mhdWpDzQrV
	u9ucHxj00tBq/TvTJ+aCpAtDRc0mmJJD1Co2P4UNJ718C/kRAerKyNIKi3k3p8EB50AN2/s+CY7
	2OBut0N7sDZE4C4G2t3rLnJWYlcg1+tG1EvS+MYmVKgHSM9pBjZqnbQsRY4KRvqgpIAPjg=
X-Received: by 2002:a05:7022:28f:b0:143:298e:913d with SMTP id a92af1059eb24-151c4356cf8mr5292396c88.47.1791085280240;
        Sat, 03 Oct 2026 20:41:20 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:a817:e330:2fc8:fa47])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm1246801eec.19.2026.10.03.20.41.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 20:41:19 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	James Smart <James.Smart@Emulex.Com>,
	James Bottomley <James.Bottomley@SteelEye.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Dinaburg <artem@trailofbits.com>
Subject: [RFC PATCH 0/3] scsi: lpfc: Fix mailbox timeout ownership races
Date: Sat,  3 Oct 2026 23:41:08 -0400
Message-ID: <cover.1790968549.git.artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Justin and Paul,

While preparing a 6.6.y backport of
commit ede596b1434b ("scsi: lpfc: Handle mailbox timeouts in
lpfc_get_sfp_info"), I may have found two ownership problems in the
synchronous mailbox timeout handoff. I am attaching patches just in
case; I do not have the correct hardware (nor can I emulate it 
in QEMU) to validate the issue is actually reachable.

These patches were developed with AI assistance, and each carries the
required attribution trailer.

Patch 1 fixes lpfc_get_sfp_info_wait(). After MBX_TIMEOUT it no longer
reads the mailbox, which the late completion may already have freed, and
it cleans up after any other failed issue instead of leaking the mailbox
or reporting a zeroed A2 page as success. It is correct on its own with
the current wait/wake code.

Patch 2 fixes the generic wait/wake handoff. A completion that loaded the
wake callback before the waiter timed out finds no waiter and leaks the
mailbox. Because the wake flag is set before hbalock is taken, a waiter
that times out in that window can also return success and free the
mailbox before the callback reads it. The wake callback now decides
ownership under hbalock and runs the default completion itself when the
waiter is gone.

Patch 3 adds a hardware-independent KUnit suite for the wait/wake paths
and for lpfc_get_sfp_info_wait() itself. The issue failure cases fail
without patch 1 and the stale-callback cases fail without patch 2. The
tests check mailbox ownership only, not an SFP transaction or a timeout
on an adapter.

I built lpfc from x86_64 allmodconfig with CONFIG_SCSI_LPFC=m and
CONFIG_WERROR=y after each patch, and ran the KUnit suite in x86_64 QEMU
with and without KASAN. KASAN only covers the paths the suite runs. I do
not have LPFC hardware, so I have not exercised the SFP transaction on an
adapter.

Patch 2 changes the completion path for every lpfc_sli_issue_mbox_wait()
caller. I am not sure if this is the correct approach or if there should
be a different fix.

Thanks,
Artem Dinaburg

Artem Dinaburg (3):
  scsi: lpfc: Do not touch the SFP mailbox after a wait timeout
  scsi: lpfc: Resolve synchronous mailbox wait ownership under hbalock
  scsi: lpfc: Add KUnit tests for mailbox wait ownership

 drivers/scsi/Kconfig                 |  16 ++
 drivers/scsi/lpfc/.kunitconfig       |   9 +
 drivers/scsi/lpfc/Makefile           |   2 +
 drivers/scsi/lpfc/lpfc_els.c         |  12 +-
 drivers/scsi/lpfc/lpfc_sli.c         |  29 +--
 drivers/scsi/lpfc/tests/mbox_kunit.c | 362 +++++++++++++++++++++++++++
 6 files changed, 410 insertions(+), 20 deletions(-)
 create mode 100644 drivers/scsi/lpfc/.kunitconfig
 create mode 100644 drivers/scsi/lpfc/tests/mbox_kunit.c


base-commit: 5e0f8396d4805a3e7f753fa58c8c55f1f3cc2160
-- 
2.43.0
