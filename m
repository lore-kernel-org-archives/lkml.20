Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FF3D1CB5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139313; cv=none; b=rrGPEoc86iYJbxwMwgPPtoXQTbb0yl/+IULV6tyZax1x9H8gFHQMPP9unaKag0Y3pXs2Qm6b25rWMgmqG40Wj9sKLzGI9xxo1QdcffMMxDFOGdUIHrYW5pCPKmEK2tC2GqfKR39WvgSbEqLQZZXq3KP9PMhKkdnMK/q9lu+lmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139313; c=relaxed/simple;
	bh=vUD/VtXc8LvpGGNYrkLmiyoc+tB0xhGq5Xw/a49h3Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQ/2oL/KqL7shiHQyydZdU4QOatA8bvU6OZlFq7IUCCuiDYC6BSZ/rjFVkTnI0+RhE22zx4/CkQ/RA5XUL+Fqd+zjVUyNdGRowY+rHYZ2WalN8sw0oaRgp2u534RprADO0SraEN1FBHVU4o8U5AkLIT87XfMBdzkyRouJ83k7Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=LBOTHCSu; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="LBOTHCSu"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc502d509c0so1357558a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792139309; x=1792744109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkLQQcE2uJE3UhEZB2zlpp3KdaEDgDInSe3fSPmJbzs=;
        b=LBOTHCSuEWrtqhydmFmJjtV1vWrswCmUgkypiZ2pPgeZAGAIp2+PwAXyHdarhkNpAm
         NG7O3tzpXrnCpfr87K5oos0ra9Jck3rS6Wmp3I5jAGOVfYbHPAPFZlKEjS0PXFn1xIhT
         M2AwSgl84N61tCcTQrTrt5SF2ms23omi536gYbzGfNAC3NDkhDn/8+IA1U97XQz/fR3v
         4jBW65kMlsBupxtzVe+leowomLjMwDynfitbvosXpu9lDjmffzDAz76payLxzbMOQhCg
         RnVp65Ho/oVvCq6egx8qWNVZDZCTCxvFIKvhLLLdDCXrqovw98Ot5F7OZzNeLO376pY9
         JTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139309; x=1792744109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkLQQcE2uJE3UhEZB2zlpp3KdaEDgDInSe3fSPmJbzs=;
        b=gqOXK6JB294nZRkQINN3BN79wL3xF2W61wxydpVZ1z/6hk0gPJ0fV1sn7v+Ab571G3
         01HNmCuLAIc7Mx6bQ2Qf5Fw7j0fcP4194Vq5H16pFok2OWe0I+B2QvV8Edr2xXpl06fn
         C9JGcz9VhCFWqup27NZwfOZ3Q7OB9DXMVDRTppXOAuMxR0e3/vNxLlKVrtbxBeR6KvKP
         RKadh+rGXYslgRbF+gas1YtvmattQBRxPFf1NjCOo4eWL+8cBfc4/bXuxm8+odVk31Hm
         u+3PSZivFVGlbO3DVOzL0/53/532weDLUNy4M2I+LRCP753Cps9GiHShjDMiDjtp0Umd
         UfXA==
X-Forwarded-Encrypted: i=1; AKwUvByGJp+Oy48yMvEov9iZMhvJcF6//I6cDaqQbeTGZYkqGjETo23z2J+fCHyPVc2SRAinxMIHtiuOb+lAEzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAVGZrY+6JTi56DS6rAbX61UO3WZ5kPHtPOCF9CY15NFJ0dVTw
	j9XguU76zOX2q5zKQIaHihkfn3oA845fLRu3yzu0Gbp3wW4U0Ou1LX4Mn/3bDKO5CAo=
X-Gm-Gg: AYBFou1ERSyksm1UOiXVn2yxqnDve58UI/YsqgoSC0fDJ4lHWG1lGiTPIyvrZyk2fHt
	FugcKzM/Z9GlOIzw1J58fQ93JPJ+FJpFuqyGg+95oLMGSv4baeOn/On3byTHnBgnSQssBcDKLIF
	23Vc/hQomg5IAbL2JgB7ro3rIkR0Pd0OwR4Ku1Z2+J7ovrD8W5XExkPNpCdWIEAPB7ZgTjTb+NK
	xl+qL8qdJ6pjr7igQhcwu9RsikJHdFBOOtmJK72guy4DGOmFZM9iLjE3qiBd/CLDg2mEHo/wMaC
	ApJhxV3jBVrl2I3dBmvqDeeX+8Xd/2B7uvpcz46G/k1i3KcbvFkGECiKJrZmbECYzjlN7F9e+gB
	mF636/oW/wL+0NYjciNG1JQFVipoNgMeYODODmmmHUpcabaTegEoVJpHjzbZ7N/Rv3WQkYzAMv6
	N9GH25cJjxiVmPEOwdsaqt/dtqIPdEKISv/3BYIxIvsGnwqFjsWlE5oILI6Y5Q/ko8wv+nEpgR2
	jv3hS3FffAyLSTP
X-Received: by 2002:a17:90b:2f4b:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3aca7ef2df5mr3692992a91.63.1792139308776;
        Fri, 16 Oct 2026 01:28:28 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f19d9sm3088933a91.11.2026.10.16.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:28:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 0/3] scsi: bfa: bound the unsolicited frame receive path
Date: Fri, 16 Oct 2026 17:28:15 +0900
Message-ID: <20261016082818.1237059-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes in the bfa unsolicited frame receive path. Together they close
the length the path trusts, from where it enters to where it is used.

 1  uf_recv() takes the received length straight from the firmware's
    completion message and only warns if it is below sizeof(struct
    fchs_s). It is a 16-bit field and nothing caps it at the buffer that
    was posted, so every consumer below can be handed a length larger
    than the frame. The worst of them is bfa_fcs_lport_echo(), which uses
    it as a memcpy size into the fcxp request payload buffer, so that one
    is an out-of-bounds write and not just a read. Cap the length at the
    buffer that was posted.
 2  bfa_fcs_uf_recv() steps over a virtual fabric tagging header without
    checking that the frame is long enough to hold it. The length is a
    u16, so a frame too short for its own VFT header wraps it. Drop such
    a frame, the way the block above it drops a frame with an unknown
    virtual fabric id.
 3  bfa_fcs_lport_scn_process_rscn() is handed that length and ignores it,
    taking the number of RSCN events to walk from the peer's payload
    length field alone. Bound the walk by the received frame length, and
    reject a payload length below the RSCN header it is measured from.

Patch 1 is the source and patches 2 and 3 are two of the sinks; each
stands on its own, and 1 is first because it is the one that makes the
length the others use meaningful.

None of this is tested on hardware; I have no Brocade adapter. All three
were driven through a KUnit harness on a KASAN kernel that injects a frame
completion into uf_recv(), a frame into bfa_fcs_uf_recv(), and frames into
the RSCN and ECHO handlers directly. Without patch 1 a reported length of
2400 reaches bfa_fcs_lport_echo() and its memcpy runs 72 bytes past the
2304-byte request buffer; with it the length is capped at the posted
buffer and a normal frame of FC_MAX_PDUSZ passes through untouched.
Without patch 2 a six-byte VFT-tagged frame hands the FCS a length of
65534. Without patch 3 an RSCN whose payload length exceeds the frame
reads past the frame buffer. With all three, a legitimate RSCN, including
one that fills the frame exactly, parses unchanged.

v4: adds the missing cap on the frame length itself in uf_recv(); v3
    bounded the RSCN walk and the VFT underflow but still trusted a
    firmware-reported length that bfa_fcs_lport_echo() uses to drive an
    out-of-bounds memcpy.
v3: added the VFT-header length underflow guard.
v2: bound the RSCN walk by the received frame length only (dropped a
    buffer-capacity term that did not account for the VFT header offset);
    reject payloads shorter than the RSCN header.

Yehyeong Lee (3):
  scsi: bfa: clamp the received unsolicited frame length to the buffer
  scsi: bfa: drop unsolicited frames shorter than their VFT header
  scsi: bfa: bound the RSCN event list by the received frame length

 drivers/scsi/bfa/bfa_fcs.c       |  5 +++++
 drivers/scsi/bfa/bfa_fcs_lport.c | 19 +++++++++++++++----
 drivers/scsi/bfa/bfa_svc.c       |  2 +-
 3 files changed, 21 insertions(+), 5 deletions(-)


base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
-- 
2.43.0

