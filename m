Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA847DD54
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523965; cv=none; b=tZRL6JwoykU+KSEd3FADl1hE13rcARtp6fdMnQZtDI0VErIfbXx9L+fppCf5VOPVsxCoi+m44n7C3ja//tlJbur8m7EU2eoibf2VgYcfi05rXlJ3n8FpjcAFZHvlPmpJYjSgFsw3t5Td1VbbC55yvhhmsM6vOpgCP+heUEk/mV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523965; c=relaxed/simple;
	bh=xcarBNs4mJZI83gK4Db3hpktDBPqsiL7sjYDUDwq2Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lITGQyepOrgC6meFbZql8+i1rSXWCXb95DYPe6xzo5yte5Tu9guTauZTH7OWVOWCrbMSzL8sXWnM4L5mmmiTWYnkQLXMLNI1kInAbkhTBAM011IDFYhsR32Aro6W6iEwelRs8bUbVB7Q7zhkUbRdOU0Gxq11UBfP9XoqTYL2TYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxYExYvA; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxYExYvA"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1ab6d7239so757135eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523963; x=1789128763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHqFc2mGX+CaMIBkySoDIKiS7dCIdlSLbp/YI65sUM0=;
        b=GxYExYvANKm6SHivcYGYoB20tmeYqbASydOY0OnlL+FuFjirQtYIdAHoItV1+3uNtE
         Lavw+apZDJ11uaFTXCHndH4u90tDuavd1Yu8uKFqNC3abGwm7XJec/lQVsuqDAWGCaX0
         IW8zn0BtqwKDKRbicCFhFe6rq+E9r7HaCOOuoHQeuTZALgH+Xa1rulnb0e5bIYH+e7ex
         ipedIuFQO8QFq5OaUKYiLPNF2ESpuidE3MDmhdp/d9GQNhH9qOtCtxeb8wjI/q3n5KuC
         lbsLqsvZzdCJESY4u8eglu1sUt/fcaoZCRLJ79gR/eSaehLXWVY6J2G31VhuMnhd5Lrn
         sRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523963; x=1789128763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHqFc2mGX+CaMIBkySoDIKiS7dCIdlSLbp/YI65sUM0=;
        b=rUGA453qFG+QYf0At9ayKjCEX+aHSUdfCChs1rTVGoSfFOJPMWchXctaHcMBM9Q8vd
         9tXq4BXvEPH3zrb+9h5CZ/WZneBz4unPblO5o6KYBmw30k8m5GURQwu2FETTP+fAHqJb
         j4BZXtnROPw/filsF4V6YbqaAhZRqHwDmPx+RUs8k/S3g3a6N658fIhIqs38dwg+PUtc
         ynk+xJ/5zLiR7vwOMMokEcargoYyLERamD4KwQ2RuLiNmD5ZwuWyti36hrQNaAvSq8Vf
         cvSDk+SuD5X3tnkyM67CdoVIhKoGLqH4FdjLHGrpGB1xztB+zkhxAPmF7rp3KSa0L92R
         YjVA==
X-Gm-Message-State: AFuF++kq31ZDYnShjIxJNTGmpPtFGM/mzCvBZabVIxiAABC26AI2hMeH
	ijT7wtz2AD6lbEs9e2Tp0UCmk/j8HeiVwsRPuv3GfyFSQPUVpMpbbq+p
X-Gm-Gg: AYBFou0K/K5pJFjPeqrIWFCFh7qf0dbpch1ODjN8UN8TuzKswgRnwErHSy8XKO3Afkf
	CHblf+wIRW3XNiq16+iwe0uxPIUCVr6oSuBCBqVO3iOG4v/i4ChtNcQpapqdIzhRvGF3s8t7YLp
	8a1cRABBaDg3tzPp20/nm8R8fgpDnLePqSMVppnYsSS3lO/ZWbIeZYA6PZl7b5uxMC4s/UXagWV
	Vtikx7fnp+MRbt15Qk8wXHh6VIc5eKOJo53VfWhkbter8JHzJlJ7dfcFJvM8hcnfgnzFGmT0izX
	iSL9a+s4mczMhSiuVRZfQBBZtlfnjoRuwJ9zCbmYilLyjFNpiNjqtqxgPw44B0zA6NWVCbQfjCf
	iqxUCDUfPcJaXNOmlYQLNp1RvfcugThTreDbR1iu0RtGCofqEEOhxQBDWY0C2ZYtlhFI1mvFZeC
	MeEf+i/yEFwJhagMyQRus1apnonZAFKLgUXh1Mq9iJTzzedWklrxi2JFL2QO2SW+j1fOZegZCdG
	D3OgTCpg64vDQw=
X-Received: by 2002:a05:6820:16a3:b0:6b0:d7aa:5c18 with SMTP id 006d021491bc7-6b6fdbbf6acmr3679392eaf.29.1788523962635;
        Fri, 04 Sep 2026 05:12:42 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm7140534eec.2.2026.09.04.05.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:12:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mailbox: fix repeated word in log message
Date: Fri,  4 Sep 2026 17:42:36 +0530
Message-ID: <20260904121238.22991-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the word written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mailbox/arm_mhuv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
index d4077cd49360..94e25678f0af 100644
--- a/drivers/mailbox/arm_mhuv2.c
+++ b/drivers/mailbox/arm_mhuv2.c
@@ -610,7 +610,7 @@ static irqreturn_t mhuv2_sender_interrupt(int irq, void *data)
 		 * iteration if the interrupt came right after we cleared it but
 		 * before we read the stat register.
 		 */
-		dev_dbg(dev, "Couldn't find the doorbell (%u) for the Tx interrupt interrupt\n",
+		dev_dbg(dev, "Couldn't find the doorbell (%u) for the Tx interrupt\n",
 			priv->ch_wn_idx);
 		return IRQ_NONE;
 	}
-- 
2.48.1

