Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3A739A073
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965332; cv=none; b=rKlhlNulMnK1tsQ3S0waxSKAVlf/3QW8hNFykdlPtkRf9BalQ6SXri6WlZWwdCIKrDjJ970ok9SDOsVvFGQIM5PdMeW0vpUrLgiaT66Xl84uT5PYDHIwosLf+8/gGiwISszpBvGzUAgolsjXeE8J7b9hk27lIjJhXc1V8cMIMxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965332; c=relaxed/simple;
	bh=OmZ056pmE8+XuTrAcBI80z+F4NvkY+1WYs3uFfA6dFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HY25b1/JKUjEi2msQIwklNTFjCaQu/6D26W1v+sWZU9tfkciDaiuAVkRy1rn3m+Os0fO68N5axoHmEA7k3paOXG9Xi+xSgJdyx4u2TnnY8LyTY5DfmrCmsGd9AVd8rYzfHjYLogDzooDfY5KNjKOKkn0aWeo+tY4WFxKSEz9udw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=YUaS7erp; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="YUaS7erp"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso3880408eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790965330; x=1791570130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1c+AY9BIFo0QsNiuYQN2LRK0yYw3P5G1Duk5ldfMSDA=;
        b=YUaS7erp4DjEMTmicFflWCIkZt2ku3n9hmYKBIBMcaNhMd9TdOyHqga/yYBu+iDjBs
         zt1I10CopicUzE1SBbEuiac7/daL/rMCOjpEjmMab8/rlvAhYUTdHPhJFvgcu5a9KQAE
         vL19bZKXGVz/0+TL52Lg69Uw4KrA85GjdZ8GSzee2IgZ3v8iVkm0CPT1FVtLfr9+nczB
         yPrbROREOK2bqc6gI+EaNnyjcmVXmb/n3aiyrNyyo8wwgHd8t3nFRlTVIU04ESio/vQY
         Mbx9KHWOoQfuV8D/i8X0iE6KLhqMdz2h6dq3YVFmxEj5E27QE+hodmoWd7NDzYVK1OA1
         nl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965330; x=1791570130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1c+AY9BIFo0QsNiuYQN2LRK0yYw3P5G1Duk5ldfMSDA=;
        b=m3N7G84P+6g38UfYb82EowCQd9UunJIdoj9t1x5qLP0toYmLG4Yx+8ttI7DwU6cvpC
         T5u4H90dBuve1H5R+mwn4WcSfsVLMAZ34O7y5Pl3WCSeMDGW6kE5znSUlB4BBTCMx+Cl
         C0Ues1t6OhO9Oh/KpOpf0nrtv/oolQQGbzTuLEiFsXsC/Az4jHdv4niMAen0St0GqMVQ
         Wl/UzycqkFWAZpznR/dr4CyHkzlkyEIklJxkhUdlglJ+QeJFHs79/aIJCIlvIgz1NGSV
         ccBXzCArg4RTvcjziGDsFyDeT/Izb+7F6GByil0DIoFIFbjkG9o8PX3X2Y+kIt3R31sB
         Bfkw==
X-Forwarded-Encrypted: i=1; AKwUvBy6T7+kEbIDqvQtnVqzTxqbfQAH3TS85EvhQnM4510Zj8y3dR2GqoNTvutR+55INXoIwu+MM8BW1snd4+U=@vger.kernel.org
X-Gm-Message-State: AFuF++nv6pQD+SGSXJrCnKgufcEgblK9bSA77I8o6ifNLsK10JKnevxB
	rJOqDMuQIYgUT0xIS+1Ky8XeodCfzZx6SVgf2K3IjjnLDGyqBFkeIGMZgHdHrZ3nb3Q=
X-Gm-Gg: AYBFou02LKKOn9wp4M1esIJsdoHT+/xFUQyMx4QZ77GSCuxV/zjdRO/5aRfftZtiTz0
	apDZFgDn1+2kmyo0vchTBBdxUbxvF7VB8ubNQwN5B4Wp5tLl2XtRk/dj22JwhT5WLTPQnF2jv/N
	z6AAZahoeGX46Xr8acxAMwe1x/6siSRgxnM8kxKIXuUzutwbD/jpTQ68Rs2Al5jmgWuIFFX5c4W
	cVO01ZAjbWhttdAZZ0VKC1LykIrvUGD1WBDpOUfwpb85Q8Sib3ODF3w5th021DNAakly7hTtDaU
	PLudhRWNzvBepIugNfR+/vBAlosLrKxWO6snuTUEG8KF5+4p8i+AcP9NJyUHqrefk5623k1ZSbk
	qunaJd+KgTco2fb1rzbQRPxhih7G0vMZkTxr9ZiRDXsF7MPozIo5fePUPiJQuUgbLWEIay03OKq
	Zk91G5QuAM/2K3jWoHH6Uj+h9o5BPmB7P2N63z7NYu+0J0GEdMTnEtrgT8jz0nX25YxQjgaTXEq
	7VkE1yCJ8+MvsBeKUBtg9FxXLLGSrSRYIAv5lZb/wcpi7gOgoHW6EiLE+Xvr8A390ucaFVK
X-Received: by 2002:a05:693c:87d5:10b0:34b:e2cf:43b6 with SMTP id 5a478bee46e88-34f14f2b9edmr3878021eec.2.1790965329727;
        Fri, 02 Oct 2026 11:22:09 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c2d1sm10551449eec.4.2026.10.02.11.22.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 11:22:09 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	James Bottomley <jejb@linux.ibm.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	Martin Petersen <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 0/2] scsi: lpfc: Backport SFP mailbox timeout handling
Date: Fri,  2 Oct 2026 14:22:01 -0400
Message-ID: <20261002182205.11550-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sasha and lpfc maintainers,

Thanks for catching the SLI3 overflow in v1.

This v2 takes the ext_buf portion of upstream commit 115d137aa918 first.
That leaves the SLI3 response in the existing 1,024-byte DMA buffer while
ctx_buf continues to point to the descriptor used by cleanup. Patch 2 then
backports the original CVE-2024-46842 fix from ede596b1434b.

Could you please queue these two patches for 6.6.y?

Changes in v2:
- replace the unsafe ctx_buf restoration with the ext_buf prerequisite;
- send the prerequisite and CVE fix as a two-patch series;
- keep the generic upstream ownership race out of this backport; and
- rebase and rebuild after the current 6.6 stable queue.

v1: https://lore.kernel.org/r/20260930024505.96440-1-artem@trailofbits.com
Review: https://lore.kernel.org/r/2026-09-30-1-daily-reply-0014-lpfc-sfp-info-mbox-timeout-6-6@kernel.org

Thanks,
Artem Dinaburg

Justin Tee (2):
  scsi: lpfc: Define lpfc_dmabuf type for ctx_buf ptr
  scsi: lpfc: Handle mailbox timeouts in lpfc_get_sfp_info

 drivers/scsi/lpfc/lpfc_bsg.c |  2 +-
 drivers/scsi/lpfc/lpfc_els.c | 21 +++++++++++++--------
 drivers/scsi/lpfc/lpfc_sli.c | 20 ++++++++++----------
 drivers/scsi/lpfc/lpfc_sli.h |  1 +
 4 files changed, 25 insertions(+), 19 deletions(-)

base-commit: 79643295eba17affbd16ca97f3ef04c90266b28c
-- 
2.39.5
