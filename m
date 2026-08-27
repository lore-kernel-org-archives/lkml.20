Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0F35CB81
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811987; cv=none; b=pvaPUoyFyGVmRV8kTXF8f5UZHT/hTONrOVcR3hEWpMEEtu3Som2v3Qdqbdf29vTocZ8tZGGeBQu4ePaNil42NsLXzjSmyVfsFsBBRnpoREs4CDtIIRjsoL9kLdFC2/16gH3LpyB01zaMr/q7Lhdproe1X/N9dTEV5xaMSODsAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811987; c=relaxed/simple;
	bh=jEstMRNig94iOnFnqSUINlg8AZr6PTalxNt8T4deVsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PuUPwNA/qPxkXa/dP/URG2oFbcjhC9EM2JKr45tSger742Rl4SWYvbA3mRE8iIUTS6seUqoIObE7QNomqsL2ajs8LxqL9Q2GYYoSSnQQvFvKu1C6y3DclstlqZoXto/FeTa7I1mjWTEN+nr3zZ56lmScExhW3FfsZ5S9KJy1e98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeT2jCvW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeT2jCvW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so1330323f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787811984; x=1788416784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E49tYna2k9EalO9qZ5zTtyDSoIWGyMcB3eAoM0LyPd4=;
        b=UeT2jCvWluFW59rvio0ylte+EVeRZoTa0tyof/XwFCRKb9Rko5mPEvHdOHymAzNOBM
         vw8NVC/FRvJew46vaeCGpL3Vu/pv+1lOdoNy0/PFHzdjGrV/+wuupSe2uGBSs4LAVPWj
         cs7BGuXkrBgr4AXO3G2qCVSYXd4hr/nYklfUD+F4TpULyXdfQ2hlF/+HsGRO1nUKOgIc
         0UDrD3XbZtiGKilUX+A4Sld83hhvmMlXLSL3JxEuRPIxIy9qeqWRwiDnkkz6n4DQ7dCp
         j8fIqlGC45/b6pYk4gz0xYGp4+uE5CYGn8f1p4C/DIDCkOAdNhqWeSr51oValVuG3dHv
         5r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787811984; x=1788416784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E49tYna2k9EalO9qZ5zTtyDSoIWGyMcB3eAoM0LyPd4=;
        b=adS++JLx3niGraKMBRaRqs3dnd0aNlbwDW936ISkuERC3KAaa/0ZK2BVB0xS2KPjNX
         jW76i4MwKG+0tAFMeUkbSlxEX6lUYYAMLqla1vWfLJQwMJg9v1cvC3PhYXTrmFZxKF13
         BTJaaQVXA5gJNbFOjImNfbIbc2hcrhhjbnx9h6XzDXRYk/cu6FkF3+y7kQhznoTuul/n
         tZXEAYSoa3m89wiFKm685fY0kiU1SmGV/TfV8DQk9tkLeRr21NAW9XGPNyiSmPFPLWkk
         KEtB/cFNMlPSgSE4DWiRRgC6LWAsCc+0P3Tr3l0H9eAK+0AStxEqpNitA7nWSOjwQ8IC
         PA2w==
X-Forwarded-Encrypted: i=1; AHgh+RpslWryr93qQUBdmrB7uE7IkJSL+DAIeh6XFmqrlY/g3zWtLZOq8DBLRirjKqfvKa7c5z7VD/iz69oh/Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++kaMeK9Jj3qKzhXyFH37UwpHTSVGsc2qcfD4sVT0H9xgydHiDrV
	aByRot96V8p5l7kKuJkfN7AZTLUV98UIe68NJemxqVfhGBzTHHrbYzkr
X-Gm-Gg: AR+sD10Rx9ZQAbGNfmdgeoh2NAzbRoB5gfaDvpmLbcmOPLdGvG7CtfiVAmwPhxekJU7
	fT1PHTdFe+e+8uMpR5SioAKOTbozDT58bLx6k1mG83E+Wv8e6Z7PXpfn0Rkz5JnwkIGlLIqdfZ0
	FNHZ1s7vN5bWGmCx9EicoIof5FmU7E4PDjGME0c6LHE2k8KecfSduLitedUSBr0FParpFPMASSy
	VIBTerFsO+elEyYekWrqBoFjztLn+WM3mvOPBwoI/eOYQ6zBzMSV3367Fq8vEfo4PcAdxsMKiKi
	L1rbACkOWIjhdV+dv+1nNtMQgI9yiLE7eCyVnKC50FoXX6GoMtJJCk7Aq7mAvvkeVT99lQ1LXRH
	HLnJoW3RcWytcIO5SpST00Hq7av/iO4MBWorJ1erIqc3a1LJmowr4XWryg6TVQOfSdWGk0Gr9NG
	hIqeSw9Zq3gBC/0LdilHfIPQ9dYwXarhRG47LIt+6LzMRyvpHVqO8bEgeC2Wxcu0hZm85gdB3hy
	5tudAxmncTdBHz540nbR/k4MhreiIQAEnyKVCndobk=
X-Received: by 2002:a05:600c:3b0c:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499dc6ea9f4mr136989275e9.2.1787811983342;
        Wed, 26 Aug 2026 23:26:23 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4d08d86dsm24536605e9.12.2026.08.26.23.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:26:22 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: split chained assignments in _rtw_open_pktfile()
Date: Thu, 27 Aug 2026 09:21:36 +0300
Message-ID: <20260827062137.12937-2-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827062137.12937-1-godanaemiru@gmail.com>
References: <20260827062137.12937-1-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the two chained assignments into separate statements, one
variable per line, preserving the original assignment order.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 7a9d2fabc..c5f90a906 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -14,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pfile->buf_start;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pfile->buf_len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
-- 
2.53.0

