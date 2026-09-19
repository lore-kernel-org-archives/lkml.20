Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD93BD64B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808848; cv=none; b=ICwORxdcrvW53YoK/SomBSbHiLrw8nsAYTriMRrfSZ8Uhc229Q53evJiwQdxGSCKz7in5f9j7UM1wZQh3N0zHrBHFNGZm822ksylGWcjeU+P+fxdHf5e/dg2cd20ihArlbKxVM2uVChP0UoNKHbRc4XXJpCrGShbvSlEbG/22A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808848; c=relaxed/simple;
	bh=oNw+8ORcU5KuL0YV9z2oy7S4xWQTlijjw3DyQFtFOMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hk3hxlXnSD4mqSPv/ttxi6jznFYSNUNMeCs49ZE4wMFHKUmwMIRV3TuQeID2S03KlGuit//TNh939Vt1wMroEdJblKxXiVlFeh0j7YPSFkdsgPW+zStF65CI7/TIvizi9F/+IXjILIqeLeAfzrh3mncxNh7yzgUQIrW7Kw2XImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDAmxfCE; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDAmxfCE"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso1120527b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808846; x=1790413646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w0054VWi5/RTL0jJWEqh7qzJLDYZnlLI6cq03NqyKkg=;
        b=bDAmxfCEvg51RJc6wP6kQjPrRu+UArlkkNJGqQteu5lHSxmzjaWkCYnz4RKOh7/XfA
         rPAtNKZFksdtqSXBMxYczZOG/DIEndtxmAfrlaTBMC99V059byLrkO7dQn4F8xUQGJKw
         nrKmG2FT0DhderRTBjI4KtcXaWTignvV+AJC7B32rOvTP/GcPxBgJE+DvQ5vp1SOl/Tf
         qGWdCtVaM3o2jRxKVxtzWh6bZ+47EeI1GxwIp6kr0w8ywvMWw3JedKb9g+n3cTV8rEm3
         Al4+qW2A3n0JiD7eBNqiMAqkaWOCVUHD8Q2Y0KO7zEcZSOhyMieChhC7REBBrXQgA4E5
         VTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808846; x=1790413646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0054VWi5/RTL0jJWEqh7qzJLDYZnlLI6cq03NqyKkg=;
        b=L+XvKNmdGJOnyt1+dXzaMIc45RxwaBkH5jGRyevCTbf9kN4gDjrgblhPEyjzTB7HwD
         H21SdX44FqAfV1ZtNv++4I7Eyr9QaqOZQPIEDG3mAFyUDWK8QJ4UxaoOD30TMKaD8GMx
         Tw1a6H/X6HrPsyG1DBnWdrofTZyuGRQlTrKL3FRqKBBjQsQf1kqcnH3xa1AGArXuFNmg
         ouDRFl13eKETs06yb80IN5D/xcNk4W4JQ9vcpWeaoK3WeAxo2I1Z6aWOD56nvbW4nshQ
         Ak8QfFYVyvuo2Ws9/48Pae+aglZjgXSF1g0M2lbgkxzsmWCRHJ9zZOE85mrtJOxr5/4u
         TePQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFcDcIVBZSMOnZgTnCs6cIEr0BgfdTSoOEU1klrMl1FnkCFzbcoHn8AgxppUCpbiEkNfJ+9AoYhQ1VAHw=@vger.kernel.org
X-Gm-Message-State: AFuF++lbgQN9qP+Csq7Q7K1DfspKxsj9aXtPClPPImzaiK3CXL6lo/2r
	8cuI8OiCX+7oil8DReXHL5L1Pb3sLQCcWyO2RzdpvThzDl4E4Lh+omjp
X-Gm-Gg: AYBFou1lhj8BH9v3jyNbqOJFGWGixEQgwnBLx7nm7wpIezPJF9iOiTBE64cxPoVofqO
	aDs9guPi9JljN84JSYFcaBXg/zvEy/23PvtgZbhwnqOyCauwXQCQ/T/3bp7oNyWXEpIYcn2ZlIz
	7YC4HS3iOpdY4TO2hK1rhsk+IhuIjbO9vUW5DgTyiX4EDVG00lApy3MQIEWmJ2IKs51nEokwE4P
	ICXHiIe+see/5AE/vmfWcztmi1OV3/S6whnbhssG7oKkWr0ifbTIhGyvw3P4oYggCLD+KgDoC6D
	pUtQGC46GqRU5j5lJeVmOdX/8ppXYcIumsHzzpe9lEpYd+XvT6HsqFa2lu0r55w6D+Ettz4RAK7
	pcFLu02Xi2dgfk+a1Hh50GW67zWelJyzlBV80He3IrYeU9oca9kqHV6wcJwHpZb2xn/XdNvJEda
	L/DyxSTLwxH3CoHYTi733GIqFzJ1IMTlyaZ3A1JLMx94mbN/xwwm/j8N6ZWa+MuJgLdHtdHR5Cp
	SlIaTndCA0/T53EV7F0ZIz4bTJQWUrZ8N2LEyk2J3gvZ3s3GSrhgV1BKnWbulMu7JNVU4TwAJeB
	FHVpw6OCXw==
X-Received: by 2002:a05:6a20:728d:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd8c516af5mr9104443637.19.1789808846042;
        Sat, 19 Sep 2026 02:07:26 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72a26d5casm754712a12.0.2026.09.19.02.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:07:25 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH 1/2] usb: gadget: f_hid: don't call copy_from_user() under get_report_spinlock
Date: Sat, 19 Sep 2026 09:07:23 +0000
Message-ID: <20260919090724.3256109-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_hidg_get_report() already copies the incoming struct usb_hidg_report
from userspace into the freshly allocated 'entry' before acquiring
hidg->get_report_spinlock.

When a report with the same report_id is already present in
hidg->report_list, the update path copies from userspace a second time,
this time directly into ptr->report_data while the spinlock is held with
interrupts disabled:

	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
	ptr = f_hidg_search_for_report(hidg, report_id);
	if (ptr) {
		if (copy_from_user(&ptr->report_data, buffer,
				sizeof(struct usb_hidg_report))) {

copy_from_user() may fault and sleep, so this is a sleeping function
called from atomic context, reported by CONFIG_DEBUG_ATOMIC_SLEEP as
"BUG: sleeping function called from invalid context". Userspace can
reach it at will by issuing GADGET_HID_WRITE_GET_REPORT twice with the
same report_id on /dev/hidgN.

The second copy is also redundant: the same user buffer has already been
copied into entry->report_data a few lines above, and report_id was
derived from that copy. Assign from the already copied data instead,
which removes the fault from the critical section and makes the update
atomic with respect to the list lookup.

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Found by inspection while investigating the use-after-free fixed in
patch 2/2, and build tested only; I do not have HID gadget hardware,
but the path is reachable from /dev/hidgN with dummy_hcd.

 drivers/usb/gadget/function/f_hid.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
-- 
2.43.0
