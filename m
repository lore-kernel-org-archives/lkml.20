Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610CD360EEE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811946; cv=none; b=O3yZQxG2OtIhMpBmhQTBxXvBt7HrsHqiD/aX9QcaaaOFAV7dI6b3u5hWtEn3sX4iLu80csriL7UUt5Yptyk9WRBshMPYRa3h/O0sUv3fRpDWkh7Gr6JFrcV7WaxIPLXFyD9DTlxW3cXfHKyDwyE/TqZ7v0IpcUxi4L33ghGqjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811946; c=relaxed/simple;
	bh=aHTSRDVJrAGh0+hItG8JMYF00k9u0CCqZJdDSAjkTUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nT3EXRvTy+qJst5m58LLKmkprNSazWJOQAXDds5DjAJsGZxYRe3lQqg5JcdV1ruVQma+p+wKjrY8vA/ofM+paBN0uyiOCjC6vhoxdMOtnVzBK49+1HmfWBQNO/HjR82n7TFb0Z4wMs7ILJizFd2Kr38OUYLg1Xbprxj3+JthYp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prALBZau; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prALBZau"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so11187965e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787811942; x=1788416742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H275nmNZhuFySBcS9gUpFxagGHoU0ikfQIf/QoCidkU=;
        b=prALBZauVLI6u9kSEJSrrQmnX1Dusecf800MfW9sSNF6rVzAlEtDj3/W5n58cZADtK
         6MeVHdMJSMj69VHNRNTMamAi51Kc60U44Cf6LnUnv9HslVqjGa8Opb38U4+u2Xdl3TEK
         QN2qbjmP5VhwU7VuhS9L6LEXmwflbqmpdje8i/KOcbkqTurH1nCTYvEbo6YM2StjOf6N
         3QyRzVQ0DDLY/YyS0VsUzR6dgh8bMtu+n2sfaj5CipS8OQ3ey9P2xJQKyzh5BGLi8ETh
         wUGJo55jhXCNbiUkpkBRr6V1AkceDaC16Fwadw6LLZtwQBEipzHWEOLtAhE1ZlCRx/Yb
         7OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787811942; x=1788416742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H275nmNZhuFySBcS9gUpFxagGHoU0ikfQIf/QoCidkU=;
        b=VcGS+Nu5CbrwTL89sl0ROXBBuSiBX8a6LlRgtfDy274D8/F7b68YYaAiUJtt7rudgt
         KnBbg0iDDfIffYGSamRCzEEA8esLo8kescdVE3KFdGUpRdjXTWF7PQEaIY6LIFDeTQtT
         loJbFW79RsR96KgRsmcT6uZRiX1EK0ZQU/NPHE4neFwafDpxhUXuf9zY/Qjvzi8z7uhx
         DpZwxdRW7ERGrxK1fRl5iSVpgW6OJfEM6Oomma4LkQNN+UC5CEQ1p1NoWPveuHCPK5Nx
         VN2WtXNh8n+Nl5NoQxMEsEGST/7RDvz3rJqyoBI2K9gUA2xGtRKTEaj6Bk7AdZDY6hVf
         8liw==
X-Forwarded-Encrypted: i=1; AHgh+RrATxXmptnj0zK/yUWRc6BfcNhgiF88znTZ5UousqJK/JLCiBCMjOuGSzrjDii/KRP74EqhWiAg4RQM3j4=@vger.kernel.org
X-Gm-Message-State: AFuF++lSzNMJmSa+NNAud+lmr1YQmhsvs5VIUcb+B1hN522K1IZVsWE0
	Pg05Risj4rkxa8EYo+D8+khUiLauZQONIHl/6XF+4G9ImjcDraiiPg7z
X-Gm-Gg: AR+sD111jGGfKL0XD/Lv5bD2DWiO55ZtZ5dkNooaHweFSCSgEvJtbm/FjSYqkrXgJ+a
	bUScX3pI1zdK6uKKaYIDe5gen+l6vqD0rl5C2/BMt8DIB01S3rSvDoze0HGYALU+BEYOuK1jiOn
	uVD1DxgtgOztTJQE52yPTwI4feAlKPWI4QCw19JHP/GJzWpONbcB32junfSz6DFDE6nhSbWdUn3
	3gRdoxwW+nYB6iy5DW+kPUPsonSRsJIm00PM3uUnvrdZdXcdE2z4VvxgtpC9Ds4Q4kCr60b2oMX
	QCY4R574UE5+WQP6wfEYJxJhV4nM2z2X9P12HYVGE/N2zPBe5Msb6+gYkkuKsPGnZEi5UMXIzXq
	RiiXRbL9K4ZQxxKy8/gyGIrdm5vPSmIkS/yoZHEf70V8TRbZvp62cjZ9orXPe5Bi+BqLHYXB7km
	nT8M+kGCRPyTpG2TuIz5+iRU6cQr4z5tiTesRfEXbcMeBb9z55mmnz72afMpsWEL5ImL9MyvUZ6
	Jvm6t+NCnZWN4cGtVzu5GvObaT9R0bGsZjsY34bNgMa9JWhF1pQ5g==
X-Received: by 2002:a05:600c:a315:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-499dc81cd8emr110986595e9.9.1787811942355;
        Wed, 26 Aug 2026 23:25:42 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4d08d86dsm24536605e9.12.2026.08.26.23.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:25:41 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove a stray blank line in xmit_linux.c
Date: Thu, 27 Aug 2026 09:21:35 +0300
Message-ID: <20260827062137.12937-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two consecutive blank lines after the #include. Remove the
extra one.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 4260ed5f4..7a9d2fabc 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-
 uint rtw_remainder_len(struct pkt_file *pfile)
 {
 	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
-- 
2.53.0

