Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573128;
	b=VaCk/jKYzZbyNxuR6HQ2LFunlAx2mxSszjVSc0flICLZCFqV5/tgtpEpfHgPNWM8tTwb
	 JSsCH2I4cbNYJTP1QRolLU/Trq3XC0PiiC/9NfKWPjNw1w+yaVtNMX7JyLBO1+DVIFdZ5
	 cUKJtvWd6nmcVJUzeTPJS5GGZcvaaiceEJWklFVdbAOOURBwWQnrlKcfw4MHy/0/d8r97
	 MC1vFyfMlp7ih71hqgKpwlIASvLhS9M6DBy28lxWpa7UNpUCeDrqgPS1h+TkirD1x3Jvi
	 Gw4CEkFJnq8Ks7oj30srgguGQ7dCE4p6Q0+maqDEQ+H+ASlLkknhZy2EzFbZZudcEPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Tz7d94H+7yGZeyFtk8/ghp9+AIhmI2e9QWMgoSN7Y0=;
	b=DBeUtkc5dUpvX8LiRD/X3dwmYXDEFvbdad10fByYNbdNelgYW/vLmNVIkiWKuV3cFkgX
	 HMarfhhXjst/6IGQKU41NU1uBkyWMmcyOsDHuD3dP19ZHnoe1qaMLnK1WfQLPsKDUJigr
	 eOzP+YX2zaBsZ8UBW9u0iPnNV/pLWJrWwl0N1XX7dpRnu+IW3EqlKDA8AzTUzU0dNGVHB
	 9qzud+Xvs9Wdjnju89/HUHd1lN/uczDtEJ5ikc/RQ6DOkc7lvj5udUuIckH7VqQALIeYY
	 QjE+cp9/aVOB5VwtuUddIERp/SHVZkrzpRgKo/ncYhS1sj6h48sRHcwZYa7+6yW2RUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Msq5pkdM;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38426606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38426606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Msq5pkdM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1747005eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794573127; x=1795177927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Tz7d94H+7yGZeyFtk8/ghp9+AIhmI2e9QWMgoSN7Y0=;
        b=Msq5pkdMnt+buxM3fHe4PuxcRmR8lzeP+GqXW5O8a46GVzFQjT1WoMPpP/tddXMHyE
         NhstiUN4QjNrs3ppIo47ZqdHxOVl9XM9kIliYry01IYq5es62otWYiGI50OsRh2crlmm
         YcSDUbh1YntZ02S0Y4AMiFOdu/3xwbg9jIRmdS3DH1VnFFDPY1FKmzTuxe/DnlWL+6lO
         KBbNE2WZ6UPK9c9bLQTOtfhzwXAkkDYFBsE1OW0jvLKtcr6VvyRW1c/mlfMMMKaNBFRL
         E2auOOFjhnrMgnz6AG0rTSK5GNlyWYowDPY6Msm3uRl0x5PPBtAjT/ECn7WWS3reQ/Mb
         btYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573127; x=1795177927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Tz7d94H+7yGZeyFtk8/ghp9+AIhmI2e9QWMgoSN7Y0=;
        b=UwJbIe6YT16u/Bg7ev976Hyxf8UE5UUeCkMgz19W47PSKWZi1BXE25HymD+4n0wN6Y
         WOtHHqDwOZ9ISQWLXHczC3dOe7d+Pwi7pHPGhhDuDpWGq+r2Pn8mLSs+rlEFTr5psuvr
         FlRRCmSwl+mmCMk2FNFkdPPY7he1ngQzd1NvbyVNaNObPma4V0ZTZY+baezgwQZAt07G
         kD9i+kyEiDlFN5MPvUEHwNFQbp2qnpRqm59Jd+tguFQM7Djv7hYTLH4UxtQS//mWJ5BJ
         xkdXKjRfbBcQm80lZNatzphq9vg5/vZsEcV6ch3iQMptnoohCd4/dYrkFf2GuVjKDlzF
         DX6A==
X-Forwarded-Encrypted: i=1; AL+hErGNYtch+vMBs+AicXVaG7SHw+5Dor4bh/RjvhvwnPQL7aEP7Dr4OQ7ZnbQDMJIQWlxbufOOT4VB82GqZBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L2qbSQkRe3f+I4TAD9FlQsXWFSW38azhMh2euaK8ASD59qPP0
	+9zLEHQLELVWisux54Dl/8Gnfz7kqBKHaicHbruWqhEeM+WI5WlTym9h
X-Gm-Gg: AYBFou0Uhp6mMgRaM1lByAfXgRs/AHmgbjmsRcTJskPVmFIE01lcQEs7z/LILRyQBSJ
	vFDTGD+4qUTUt0Tm9fTGbi04AE/Hmt6s1DLmleTXvNh7P0yPldYufnn4/kX5h0RLO69AuQwUGbv
	2IOpLKKB04tDy27pR9Q3Y4YF6T1KePau+p+cMqKY8ptuRVpy6DW5d6QBdy7Pn/q4N9be/ru6iZw
	hU4G417L4CyKN6j7ZYCtHJYE9Ih1F8+lxHfxEIskqsMjqn75s2Uy5iJI/hnCgajSk24Dm0xjPzP
	oaBnu7F22mpU1N9QCNhCBAvvBTrz/iLfWMDpUmctXWAQFPebfXLu2gPEyToFbU6Rjr3OfKM31kh
	fFMyixPGQLJECN2Xhq1uulYpaBB/NIA9dosc+gdGjUV4WxishPNeFA6SLCw+hR/f7QyDBD1npBG
	PmqD1SXmn7Q1mcOARO+f8lDZZHxOQZ17YSxrEUMtF6JUAcrEwzMnkIdEoIj2CR9eCyxAKzgROW/
	ewBkkz/q5VCTq5B2P5d8VeP/tS9EklsHjOmUWQXbC5eDgLdMITvjut1iGmOtWZYB9qoANDlCY8K
	vK33sMJlGyCFkTXG4rl23HAJb1QaVQheBg==
X-Received: by 2002:a05:7300:d58a:b0:376:feb:2df3 with SMTP id 5a478bee46e88-37966766dc0mr2197550eec.20.1794573127145;
        Fri, 13 Nov 2026 04:32:07 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm7215936eec.10.2026.11.13.04.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:32:06 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 3/3] powerpc/ptdump: Show the exec flag of kernel mappings on e500
Date: Fri, 13 Nov 2026 18:01:38 +0530
Message-Id: <074831f06e18d1b8cff91e7588aa7985077dd538.1794572365.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794572365.git.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On e500, _PAGE_EXEC is made of two bits, _PAGE_BAP_SX and _PAGE_BAP_UX,
and a kernel mapping only has _PAGE_BAP_SX (supervisor bit). The flag
table requires all the bits of the mask to be set to print "X", so
kernel_page_tables never shows a kernel mapping as executable:

w/o this patch:
  0xf1015000-0xf1015fff  0x00000000         4K PTE   r          present  coherent                  accessed

Print "X" when any of the bits is set the same way it is done for
_PAGE_READ and _PAGE_WRITE:

with this patch:
  0xf1015000-0xf1015fff  0x00000000         4K PTE   r      X   present  coherent                  accessed

This only changes what is displayed. ptdump_check_wx() uses pte_exec()
which already tests for either of the bits.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/ptdump/shared.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index edc69da19b85..e28a41a8b1ac 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -22,9 +22,9 @@ static const struct flag_info flag_array[] = {
 		.clear	= "w",
 	}, {
 		.mask	= _PAGE_EXEC,
-		.val	= _PAGE_EXEC,
-		.set	= " X ",
-		.clear	= "   ",
+		.val	= 0,
+		.set	= "   ",
+		.clear	= " X ",
 	}, {
 		.mask	= _PAGE_PRESENT,
 		.val	= _PAGE_PRESENT,
--
2.39.5

