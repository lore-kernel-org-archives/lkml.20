Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491884AA402
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819876; cv=none; b=rkXuwW+IjI3J8yNixbowK1pdmV7PO0eYbyaXRozx8VTgAnNc2+Q2HanmioCdr7sgC7Jo13jMcKcA/Ib6GFQztaTGI4/g/Pw/9ELvfvmarpeGLJ3pZ4akV9t2sXWjxVfIHOV65+NnzNTKCnzyhTYNnAir+nDtSLlFFT+Vfn+SBOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819876; c=relaxed/simple;
	bh=vMCqB0hD0d33CKDMPrXXNYCt+AWzsNFqf9zV1oFDLmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgXNPo8Rd9Sz6Y3Nt32y5x51vV1EyPkQoL8OtrBCodjTQKF+/C0lA4FCCh4DwQ74G4Piclq1SttPf/hiSQcrvjRdmAzVWBV28I6OUxsAdukCBVC+1pzAL06ePpuD1tREHUbgjWWRAXp636CItlWmdXcu8wsQgE0WfRIV2Uxv/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=W8aoxX8g; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="W8aoxX8g"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1139807a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791819873; x=1792424673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKZ8udCmDcJ4nEacljHli9T2DKZNy0YCKclfYROWFCw=;
        b=W8aoxX8g9fRHdJ4a/WMixaF7GLZkEVMsM6veY5wo7vQl/3Psw6Hdi4mDMkrdOfpDh7
         NBkHEvmVLRw052jr58vpvVynbhMmIinuSvY6jlgrLGwRnTBXC+lABIFKW7bj7Lc02ydI
         o1IU/d/RPx/6OwJRwgoScp3tflxeQfCKDwbLeZQTz3bQZCThKh6WWaoskBiGBOxizmIc
         zNX1cGp/ZCWLNxP4GsAqtvYvktaOpiHAQYbxEl1wbK+upDf8Jp26SFxi6CuhSDb3QBLS
         irbaTprMrY0h2hcJZjFNucpEETI3BunME5rbfusJk4YJMJ6M1TCVmzz7HNmQbO5VSqBb
         Fhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819873; x=1792424673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKZ8udCmDcJ4nEacljHli9T2DKZNy0YCKclfYROWFCw=;
        b=WH1RO95QndMi/O0aGrllqZlyYjBiSpGvUdN4OJfB+p6OYaScqXepCjfOvvG5JKB40N
         JCn6uvQ+OMKnDCTZZphjAKYQbB1QX4K3WYoL4WdOTqLHyOf2ZG40DKNyin0GLsiAKIub
         cVt/5jVOrggs9B1bcV6SS25y8HRocElZ3QSlEYujRy9UW+D0UtiNnswGFsFbaFpKfnGq
         A5UXdAshsJmOyHpEcwaUcJoneEkogWFYg6Jyp6fhY4pbABYntbBOCUOFIboZCgzQdfdl
         154yEnwfSrDX+KDpBBUvFWfVYYuZBbvGrUqNg6P2/PxR42FTGKcDegWP7ZfPtGT6zZcd
         lY6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2iRk69sCDltNlXkNewskzeax/7RQMGP658yrk6i3UAkMrmJbdk+Fqi7p26iTOkziaKlEBMBkDuPPIP6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc8LCnZW42lmZNJ64UfKTqc2Bf9bpg8GpBJ7hEoj4J1zujdpNF
	45Riu6KgYpl4x31FWFMoqCn5rYmI1+ouGwaGeXuysYPUltClxeSSewCBN9SWbbIun9Y=
X-Gm-Gg: AYBFou2ol5idmdnAUY5UjoMhz8OiwX9noGbUCbc/W4pIPiGYg87dnVEtCOL4BngtTVJ
	F5e8H/aRHTZqxJCixQrutvogjCu9t+BWdiFR6sNUwRHiWvto6XykFz25+fv3mBmf79dc/qbvwra
	RJRyfTHaUgqkzeJSMRE7jfcGueSOk+8sl4dMqQJkmLMi9hvtOwSUErlsTk4LyrZynXOQojaBBpW
	kbOjr9JdL4x1LnkD6YOUR9M0NE7rOAC+5gLW/1bJnL7nLcLXrwYvI7951pyPRCbiD1DQNWPO5D4
	aB/ibGPC7mCCHB2kxm3AhLm4QRuRpOR7yVaSnhzAWASl1ZE2Y3B83XM3OQVZcVN8T1O0dadmMTZ
	bMJr6FqlzWMX8nzCwui3NIg1ofMwxbGfph0YqTraRlJ7d3oGj9XnbkYXsFLrFbL/NdBkpU4YeaD
	8/JUpGjejIcU/01tyX9xOS/kjoEQKBwHIJJKBFCD9AUbn69C0SES+BPfjgFRkoYI2wI1p/KPM+P
	nOR4PHsgWYK0Yw4D3zLWCK6Y/Kg7LMw
X-Received: by 2002:a17:90b:3b82:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ab3a94f426mr8967011a91.24.1791819872684;
        Mon, 12 Oct 2026 08:44:32 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7bd2:1202:246d:44ce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm16692102a91.8.2026.10.12.08.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:44:32 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 00:44:22 +0900
Message-ID: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
the OUT request completes successfully, looking only at req->status and
never at req->actual.  A host that declares an 8192-byte WRITE but ends the
data-out after 4096 bytes still reaches target_execute_cmd() with the full
length.

The buffer is not zeroed (transport_generic_new_cmd() leaves zero_flag
clear for a data CDB), so the bytes that never arrived keep the previous
page contents, which the backend writes to the device for the host to read
back. The target core refuses a WRITE whose declared length is wrong, but
it does not see a data phase that simply falls short.

Fail the command when the data-out is short, using the transfer-failed path
that is already there, the way f_mass_storage treats a short bulk-out.  A
conforming host always sends the full length, so only a truncated transfer
is rejected.  There is no oops; poisoning the buffer and ending an
8192-byte write at 4096 bytes leaves 4096 stale bytes committed before the
change, and after it the command is aborted with nothing committed.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..54e45d3c79563 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1090,7 +1090,8 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
+	/* a short data-out left the buffer unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
 		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
 		goto cleanup;
 	}
-- 
2.43.0

