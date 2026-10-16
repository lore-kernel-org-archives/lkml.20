Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156214DDB35
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166103; cv=none; b=oNarEF7+0LPPtWWjeEQfxkAazO5+5+JtaVdhqVhtvX3PVKRs5PvL+hWo6ca3qGfJtBMA6Kw1LKB2i1REJNPrgeFVNpkn5hqkCDQdjZBTue1r1a/2dakloA5lTITMag97qzUw4NmwbP3OMmJw42nFBaT0W7n751NWC62nmRpdYpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166103; c=relaxed/simple;
	bh=gRgnv/IQevsZYfLRzxg/t0DGc8i+gZbRxYZVCMqrshM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VzmHlC18jPeuWtPfVMaKLIjnJKymCF2sm1aRNYdMSZmfk1fenCxf+4ks/+ExFUjcuSi2bMy4gmFTKBWpdQRFdXTV26iQsOfCjUXqC1qB4Nb2Fy0q4UjNqe+fAZORNgzVD4HiH4j7zXkVC7IihzjLe06JowwmC+k7Qq7CFP6ybv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Sclj/08e; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Sclj/08e"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso26783b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792166099; x=1792770899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=57L18zSrRFWSsLpFFSYCwnP86s5rXFtM+UU5HcWFB08=;
        b=Sclj/08eUXYS9Hyr6GXzjS5KN+ssTfEzFeNA44weFUQhWlulBiCtGpeacHwotq3BG+
         H0gCmDusZHZcZUzazoYbzcsfz5tnpPJQvGvTkFEPQ0dXVEVxILai6pY/76EIe0WmBc7E
         ZVO+X99dDmhzn/P5E+aFXYjI0QedSNmHHTR7SLKSFO9aOAbJ+wBAaZPwppRPk+F4a5M5
         2PN7dIspPzJIxq5/lzCEJ7vYLnj2LvtTgW51A+kkPBdA2QN6qRKNrv5VZLf4oWypaxZr
         aEaErrgkCfhMQl0vMJbVuXTVyMFE7DKWitmSqZB7fm3R8CdYNVqB5+tIKJ31gosu8KQp
         ZifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166099; x=1792770899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57L18zSrRFWSsLpFFSYCwnP86s5rXFtM+UU5HcWFB08=;
        b=H5osGnw1YVFMthrOYutDcx25e6msqgXLfqpJ6l9QQ8tNXXyrkIuVbCwq+EwzmCbKAf
         eMmjt/IHAmotmtCVGCwc+PnLVAHv4kuBxcNoyX3Kbjwr20dD9mPlpoJXQoUDzLo/wwwg
         DWq+BX+2aRQ5O7Ec9BBfFVJpwxKMVh9ztm5D8PYgMuOV+jcbS0Pw0V7M6LgVfhbk/JU5
         71jA0YnAiNxmDSulMfe+LUSforg/nPC5gT5aBiRER1/Jb7ID/aTJF05BXHaH410Bs3kH
         BiNpM1zCtZoIS7osC5U4od7Whcg6FU4Y1eT2N5rU/wl84osTa44d9q6F+d2E6MP5fUHE
         joJg==
X-Forwarded-Encrypted: i=1; AKwUvBxxtkFFOMhfMPQRTDG+YwGIjNr9GYhUU2Ss4pbd5eirld6bG/W5zBt2fPWxv0jrrS795NmwR9vZ7p3UB0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXu1Y9T5bB3wjyQ9K7SoNPYa3XIb8GHxt+CZuCmNKmHRb4B6tM
	b9B0ocfYstSVCYBjhqrbcPcaI/HSgH+3+Bdy2KnVxufOuvwlKfKqZ85gc6Uo/YEQqiI=
X-Gm-Gg: AYBFou2YBckF4daqL93fuLgLRlqpPWw5iuSmTlAFU5mkcobKzRHIR4duvC2PbIzjZiM
	DpAe5zJd57OMxamcizj57k44YVJ7W3AJcjkkLM4ZsIFroF59JiXKIneKaz9yIer896dxT2tfgpE
	cjeDPo05+/SegBLISllXMyNO4yjEg/LG8rPfmHqFdVTsNgNRggBRK5qdg62k4fSGfufbmOmDLzu
	2ATg86pW4OTb32ctgrHauXZUCYS++2OCpj030VJePWyHoVU3ATOpp9UyfiOiqMhZ3y+GTPUgCbd
	/QAeJ1r/GlscDkaShqxFXLyki4B8NeAK3wixOLqoON+R1slVd1zEuWG5Bn+dcTtavv0Sqblqqva
	FIyRhFR1R5hovkgdU7f7m+oWCdzrM0jaht9K/o3S1h6oQRv/Mvfa55i+1U8ro52tPTzqmUTrou5
	Ng1f2y1Ft44TmtkHsPUsDfwsak3X7JBG5gGz6i54M79wt6rQ7/3ShQodHfmMhS2Tfi7CHVZP/oM
	M0xN5LvUIgYay4jVAuzCg==
X-Received: by 2002:a05:6a21:7a8b:b0:3e0:b7c7:5289 with SMTP id adf61e73a8af0-3e16bf12fb2mr20162868637.63.1792166099216;
        Fri, 16 Oct 2026 08:54:59 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5e7a:332f:f584:a3d8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65ab63cadsm983076a12.4.2026.10.16.08.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:54:58 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 0/3] scsi: bfa: bound the unsolicited frame receive path
Date: Sat, 17 Oct 2026 00:54:38 +0900
Message-ID: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes in the bfa unsolicited frame receive path. Together they bound
the length the path trusts, at both ends, from where it enters to where it
is used.

 1  uf_recv() takes the received length straight from the firmware's
    completion message and only warns if it is below sizeof(struct
    fchs_s). It is a 16-bit field and nothing caps it at the buffer that
    was posted, so every consumer below can be handed a length larger
    than the frame. The worst of them is bfa_fcs_lport_echo(), which uses
    it as a memcpy size into the fcxp request payload buffer, so that one
    is an out-of-bounds write and not just a read. Cap the length at the
    buffer that was posted.
 2  bfa_fcs_uf_recv() does not check the frame against the headers it has
    to hold. Below the FC header, bfa_fcs_lport_echo() computes a negative
    payload length and hands it to bfa_fcxp_send(), whose reqlen is a u32,
    so a six-byte frame asks the firmware to send about four gigabytes
    from the request payload address. Below the virtual fabric tagging
    header it advertises, stepping over that header wraps the length.
    Drop both, the way the function already drops a frame whose virtual
    fabric id is unknown.
 3  bfa_fcs_lport_scn_process_rscn() is handed that length and ignores it,
    taking the number of RSCN events to walk from the peer's payload
    length field alone. Bound the walk by the received frame length, and
    reject a payload length below the RSCN header it is measured from.

Patches 1 and 2 are the source and patch 3 is one of the sinks; each
stands on its own, and the first two come first because they are what
makes the length the third uses meaningful. With both, every consumer
sees a length between the FC header and the posted buffer.

None of this is tested on hardware; I have no Brocade adapter. All three
were driven through a KUnit harness on a KASAN kernel that injects a frame
completion into uf_recv(), a frame into bfa_fcs_uf_recv(), and frames into
the RSCN and ECHO handlers directly. Without patch 1 a reported length of
2400 reaches bfa_fcs_lport_echo() and its memcpy runs 72 bytes past the
2304-byte request buffer. Without patch 2 a six-byte frame reaches the
same handler and leaves 4294967278 in the request length it hands the
firmware, and a six-byte tagged frame hands the FCS a length of 65534.
Without patch 3 an RSCN whose payload length exceeds the frame reads past
the frame buffer. With all three, a header-only frame of 24 bytes, a frame
of FC_MAX_PDUSZ and a legitimate RSCN, including one that fills the frame
exactly, are all unaffected.

v5: also drop frames shorter than the mandatory FC header in
    bfa_fcs_uf_recv(), closing a pre-existing lower-bound underflow that
    reaches bfa_fcs_lport_echo().
v4: added the cap on the frame length itself in uf_recv(); v3 bounded the
    RSCN walk and the VFT underflow but still trusted a firmware-reported
    length that bfa_fcs_lport_echo() uses to drive an out-of-bounds
    memcpy.
v3: added the VFT-header length underflow guard.
v2: bound the RSCN walk by the received frame length only (dropped a
    buffer-capacity term that did not account for the VFT header offset);
    reject payloads shorter than the RSCN header.

Yehyeong Lee (3):
  scsi: bfa: clamp the received unsolicited frame length to the buffer
  scsi: bfa: drop unsolicited frames shorter than the headers they must
    hold
  scsi: bfa: bound the RSCN event list by the received frame length

 drivers/scsi/bfa/bfa_fcs.c       | 15 ++++++++++++++-
 drivers/scsi/bfa/bfa_fcs_lport.c | 19 +++++++++++++++----
 drivers/scsi/bfa/bfa_svc.c       |  2 +-
 3 files changed, 30 insertions(+), 6 deletions(-)


base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
-- 
2.43.0

