Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627504;
	b=CjLKoTyCPDF0IeQ3njas4evdNCBM4jjQecaLlBj0A82D744WcIn5NBMkZJtdpclI+alm
	 aZO/XPaa622eFItJReUbzjlgmolce74no0E2U43IimzjBrMCtXFW0h6mBXFfgJbGokkwu
	 6o+E+PlYkOg/Y8uMLi0y75knvra51Tmey4HEMrKclWhYszdo7NAopoqjPaldqyQ5h2r+C
	 FYLB0HExJu/8au1FaLxylgL8quvYQznE/vfLomo5CeYbbfGsvUX2O7TfVGyj3pa99rh4x
	 X6E6i0qAaxQXdF8IOr3Fvaf61BaxAfIdyJhGqUtkJZeD7QtrU9f1LlTtibt0U3h43Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XApMTeRiMcqMGBClJsYA/h0r8RwI8hz2qrd5pPnw+Tw=;
	b=yLVPI2U/exZee6W+m+Ub6srUm69qp23+GCaiC3eb/JSRo9QXSTmuDlkBbaeJccxmADOe
	 HSJONlcevxSOhdpipdsOd+8/+jzXaFSKePeFFfml8uw3uLf1ndqNMraBiDuMpu/oYJOPW
	 X5OmEgj1Yn8CDdw6QKlCTHFh3JfzuGjs9Cl9pp3gj2aAqWYLGa/d9oowpEIBmZnEkYgsr
	 ax/WHJXya0U1p9LHCdSVRHm7bFe/RZxoLL2GnCfeYYBB2tHRowhCLAYKnCXttNjRHGOFA
	 XejM5wFrX8SL6FkPw2AO6b/O8Y0X5vQMX3PNJVM4nxlqhC6chcGt/OJGKs2Hvl5TciQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t1LXlA0n;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED1A606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED1A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t1LXlA0n
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1351639a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794627503; x=1795232303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XApMTeRiMcqMGBClJsYA/h0r8RwI8hz2qrd5pPnw+Tw=;
        b=t1LXlA0nPq5/PxDT+AAAb00hC5E8MFOJkTAG9lQtRUPtk9xI84h96Zhn5f/+xcMAVH
         yiQONaeSY4785hcIXl+AGRH7VfZ9G8RxyBbpyOvOKqcWasi0XXDOFGaWfqCR0qWoNT0J
         clZ9qa2mC0Sl8gfBmJwn92zskVSycSXiY0FaMwMwZJZPwM2hZAFeF/KndItNg8gW0GGe
         j/cp2M+ckZ29KhTdQlU5C5k02XXlVyEHGB554WXYnP5Oh345WkV1ib86eNp7GVjwJhQo
         4RihW2Wk6S4IgO1am1+nxVcD9B/XPX6z6I3bikk6GxU+PfKS5nqavRDUVXlOEaTCghD6
         u/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627503; x=1795232303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XApMTeRiMcqMGBClJsYA/h0r8RwI8hz2qrd5pPnw+Tw=;
        b=aPyCpSEwymVHYX9pVBTeNGtTh5K5yLJ8kyq2I0GOXXUf90LPyRqL2b5n+JK6JiNGqY
         3YWpURanJlQl/G4Uuc9H7PP+wI4R2C8CHX7hLiYV1bLYVR6BcSukJGTN0i+KdrRu0OcV
         Zr6LJYQDFX09v1eL8R/5k2fpJem6VMQ7CmXi7HrOaZ/Sc1vPCiMGlk/HouQP0eiuYw14
         2GdcscCYpfxRZ8dkpKQvPG9Npu3K78pdeZEPoW6NrmTAXcVTEKMmQTslRgV1qPMAy/CB
         kJcIEAMqxoMK35d0EnkNi8t7xYbExVyiKlHyQZF2N8/32qqIWydnd0Pg6y693nktlwxA
         ek7A==
X-Forwarded-Encrypted: i=1; AL+hErGm445EHyNqe774W6AdUYNDQv6r5mT73j4KHRIZPp+fKUEYJ0Mymloz3XpxfI9jsonYuNVGReZDuQ324iw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EN/v5oo9WYX4XLNpeGqB5wYCrT0SpP2wc99Hpo7zDbHqpvG4H
	cWO7TFG6iuV8+IND+nob67AwwKjn7F5y0ZkBQB7KShWhJRZOFEFzE6nfIQ8aAD5GhFY=
X-Gm-Gg: AYBFou1Lhs7VfPL3Z32H8SXWRlGnxUeUY0vLQaKLUWt2j7HSRFHlHMmFGFcuFNqtfBB
	9tCfXp9vc9UbRO5ADSxvRrjAOcd0s01DFUg7qX7TLW5RSyFfElUnKBw2FTfKfIyG0kxn14qexJ+
	l32UsPFyXQsd0K3JtscBC+n+e+6S+xrvAqdVs847XFvoQI+VdV9VtkvjOvqhPMb5wprjMhYHE3z
	bB2KJCFonChWWVMLtlF4GZ3dYm4Qeh/23T+WcSbIWaCrt7E8dNTwQiv9E0PyYn7LUH7e5VWGHps
	LhcCv9lDQOmifryhLnwjelALPs5tcpfjNCP9T/jOvnGts+mVT8xtIGRYKBGjf0g/nTsnTB8eGL9
	M+a3zOc5FBUoMnzIGiDnz0DJNwW2ZE/9PFRqP5lOsY8Sty2ulnLAtW2Q1PFjCJHfRQrRlHUjub+
	gelov3L6AJONw6dE+JegQ1tbQA66sQrHCfRU8CLaOHCyfazSeL/erKr3nv7+Dq5Q98sYb3F3/u5
	ABRzLXKuYTOWce1vwxh4bVP+F3A09Fc379igFC4XJ1N+QBXFBzpXGoakNJ7qSvthCn4IjQH1HrR
	wc4SOt27Zouw6Bf5vdkJJN3bqZXnS5dY0JISkfZaEVxNXlmNFnvObb1KnuuMcLxNncmNBaR29Vr
	ldKFXcfuqZl8IfBS++0kCKgrt8slFuzKwmHMSrQ==
X-Received: by 2002:a17:90b:28c7:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3b1b0b63d26mr3878240a91.46.1794627502924;
        Fri, 13 Nov 2026 19:38:22 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm3412380a91.4.2026.11.13.19.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:38:22 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	erich@areca.com.tw,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 0/4] scsi: arcmsr: bound adapter-supplied completion indices and message lengths
Date: Sat, 14 Nov 2026 12:38:06 +0900
Message-ID: <20261114033810.549787-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

arcmsr uses three values from the DMA area the adapter writes - a
completion slot number, a type B ring index and a message length - as
subscripts or copy lengths unchecked.  Patches 1-3 clamp the length,
reject an unissued slot and wrap the index, each reproduced on KASAN.

Patch 4 is not about an adapter-supplied value.  Type B is the only type
whose completion ring is consumed with no lock: D, E and F take
acb->doneq_lock on the interrupt and the polling side, and patch 4 makes
B match them.  arcmsr_abort() masks the outbound interrupts but never
waits for a running handler, so a working adapter is enough.

Not addressed.  flag_ccb is unchecked but is the CDB address the driver
posted echoed back, so only a fabricating adapter leaves the pool.  The
data_len double fetch needs the firmware to change the field between the
two reads, which patch 1 bounds anyway.  Type F polling not restoring
cmdSMID is also handled by the dedicated polling function in
https://lore.kernel.org/all/91fa9048-ae23-4813-a8fe-bd64d5b374d5@areca.com.tw/
so I am not sending it; I will rebase whichever lands second.

v4:
- Add patch 4, serialising the type B completion ring with doneq_lock,
  as raised in review of v2 3/3:
  https://lore.kernel.org/all/sashiko-outbox-167892@kernel.org/
- Patches 1-3 unchanged.

Best regards,
Yehyeong Lee

Yehyeong Lee (4):
  scsi: arcmsr: bound the firmware-supplied message length
  scsi: arcmsr: check the completion index the adapter reports
  scsi: arcmsr: wrap the type B completion index before using it
  scsi: arcmsr: serialise the type B completion ring

 drivers/scsi/arcmsr/arcmsr_hba.c | 45 +++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 4 deletions(-)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

