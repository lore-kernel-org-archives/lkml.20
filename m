Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F227B35F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791506146; cv=none; b=qUaRvjMLmrb84MmV5uf7TnvXJO3Z2cuXAsw0aDhyXYaQ/QvOu9eDUurB0EBwYTZmXl8QwbEEiTjmITg0tCB2fn4hQarC+MUhQnK1UxoAPcCOAIhiUuF/9+N+KWOMwjfHSc2dCnAFs/3BuzxUaN+ok1AAFHckZF0NFaDWdBXxqwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791506146; c=relaxed/simple;
	bh=yka6JI/V/V6RpE2ODPGrIdu0dRDsQCDABjiTa+/MLIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyBasiwv0Rq+QU+/JIQSkbE+vx9RxFzWBIwtDN9xPtF2tRAxAtYHwAv4Mq2GE8CCioBdXb+eRT9QM2qo2jXwkoANiitXPU5JGHGveSnMOOZyeK/aHPUPe/AqQkjg0R9DggqCmX3JQH9oQkRsf4piMPBKLWHSPfUHr4zvGo7m3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iylsnmkf; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iylsnmkf"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5e095b434acso70195e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791506144; x=1792110944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gtpd/G2gn58KFoYIjlWFKfZTxGRss08rArh+p0s4NsY=;
        b=IylsnmkfxhZqTkHyee/TApqPd9+QaU6TSf5MA4RiIs9Ll7ZHbJuzcPTAtYsGHXwxeg
         +lUc/N8UKgFBMb2M0k+0CDcXQ6i/bWnX/AaiCZyLA4Vbol34UzAfVwQwSyUwfSu36FVd
         VG3MRM1lVBJEdg42JmkFnZqV7jvq1+I5MCiCg7I087sWyuIm8znLPMrBCAtY+MqeZmah
         pWNycjEXVxQWkrikpp9GGE87k/RBw7Wxg7E8z+VJnjq9yWjIJZmC77rvQBDDrL/JIMFr
         Sz3ky+lamnRykUCDUDu6OafNLHXBe78a3rx4WrxmMSWfhEILzZd02ZLXKUsBpo9gFwgd
         qJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791506144; x=1792110944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gtpd/G2gn58KFoYIjlWFKfZTxGRss08rArh+p0s4NsY=;
        b=Wa354zMOvxUUWTLlYLGwT4nMbt1QluE4qhWdfe73/L/jbswJDFzwMBQRADCXmYYkfO
         qBrjruyntAXnFoaW7LrDLCb6b480o4Vyig2S7mqZRP5UVBT5wLuAkR+6d8/1euT83Q7c
         aRRDJeUHRgp8OR4PjvmaHwBhHTPaxf0msywFIC5V9M+5jlqMlMXxikgp6+pP4aSjgXxV
         S/KxZPQdd4IDgRSzn8/hiWRP4O8T+xf4SahBtyBLOrt9hOM5pygBdbAKMeP+pyjVDDu2
         f900SNOM/6/3LU2T3dJXrb11XeTpHGx2TkbsLgSm8XBh6IY4ZWsUk5zen6T83uOZdHHK
         gOeA==
X-Forwarded-Encrypted: i=1; AKwUvBzHmsrfwkXTyhYb53AmG5eGn9K47HS/hVDWyOICdVl5y4BL0sFzT5u9NIqNIAwPjZ/UPGBHtMfqdaDg+gg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0GLhtmi+cH4Scybt+QRarWzFbgA3qv5l9RBp595WIT/rM8b9U
	qiO1rR6+hZnAtSjtfUZLp5b1SiRfhceOMFlYzqgkd7kNvWX6rpy7i79f
X-Gm-Gg: AYBFou35hFG5Pcxfn+qPHEILJ6UYbwVoTtSyFQioInJcC0NUJF9SZ9fsYKZfiqEANjz
	a9XCwfp/O+EmEJuKG4giGUOpGOMVB9YoBUrhsM0WYmW0JUqdocZMztl9rMHRHfY3GJzMdz5BKVo
	hYSusydBKz08AKy8PHhwqy0Hl5Oip4EpCTbZ8V8QcOKFPIcBNQraTMeluytTq1HMUWOZveGqwU0
	dfrT4CwbBRysFf6PYdDZIR/z8R0ntGtAOTFWl6N7DqXNn/AvnK0b9aknjk+ivjdN3QILcbUoZaM
	Sg6aUrQ05JOM8mQXrLf3KuUak6nMn91ojGHSbxHVlm/nTMjsJ1U+IIyLDeJqE0bg7deXprdofHs
	BZGStzRQy2Vv55Wuojyl/RAH4bNV43Ts9uOk186Sjfeo8wkCxfXFbnt0VfGOOtjmqdhU1a604fp
	+uB+UcOsAGCVgVk6Jehccm18O5DCAt15g0C67HgeXaWXMVNzTtzICsj2VU4gPCRxrzcjw5ArqwP
	qMlQA9fk4xKmZw9TJdKzoL+90JjIE2HsKdZ/wQTi2Nu2oKk+bW5JD4FYZvnTeuI0ME198a5AMpk
	tTf7vI/RSoku+wrdt9U=
X-Received: by 2002:a05:6102:448d:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7cb361ccc15mr165871137.0.1791506144167;
        Thu, 08 Oct 2026 17:35:44 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb3539092esm488922137.3.2026.10.08.17.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:35:43 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v4 2/4] scsi: target: rd: Release protection space on allocation failure
Date: Thu,  8 Oct 2026 20:35:32 -0400
Message-ID: <20261009003537.62265-3-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261009003537.62265-1-sanan.hasanou@gmail.com>
References: <20261009003537.62265-1-sanan.hasanou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

When rd_allocate_sgl_table() fails, rd_build_prot_space() returns the
error but leaves the partially populated sg_prot_array in place.
pi_prot_type_store() then restores the previous protection type without
calling ->free_prot(), so the pages and scatterlists allocated so far
stay attached to the device. If the user writes pi_prot_type again,
rd_build_prot_space() overwrites sg_prot_array and the earlier
allocation is leaked.

Build the protection space in local variables, free them if the
allocation fails, and only store them in rd_dev on success. The error
path then only touches memory that this call allocated.

Fixes: d7e8eb5d9216 ("target/rd: Add support for protection SGL setup + release")
Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 drivers/target/target_core_rd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index 97c63b122..b52d703d2 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -259,12 +259,14 @@ static int rd_build_prot_space(struct rd_dev *rd_dev, int prot_length, int block
 	if (!sg_table)
 		return -ENOMEM;
 
-	rd_dev->sg_prot_array = sg_table;
-	rd_dev->sg_prot_count = sg_tables;
-
 	rc = rd_allocate_sgl_table(rd_dev, sg_table, total_sg_needed, 0xff);
-	if (rc)
+	if (rc) {
+		rd_release_sgl_table(rd_dev, sg_table, sg_tables);
 		return rc;
+	}
+
+	rd_dev->sg_prot_array = sg_table;
+	rd_dev->sg_prot_count = sg_tables;
 
 	pr_debug("CORE_RD[%u] - Built Ramdisk Device ID: %u prot space of"
 		 " %u pages in %u tables\n", rd_dev->rd_host->rd_host_id,
-- 
2.48.1

