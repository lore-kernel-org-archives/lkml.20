Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112058;
	b=LB0DpGwKTNC/FC0KOLKylnRhHpuqqSUCtDFeix8olT71hT8OWVZO9C2CleiTBHCh+cVG
	 AcHiGGreJOMWjmXwVOcdr+id32I+/i3aYHnoyT3Ag/kzqST9rz1lDMSNj4s4WyNAsCUvA
	 WVq09vccwN4rwEJqhg35k2Szfpuzz2x+4EUM0h/JprBhh2jEkFEANLoD7oHafUSKgpGZq
	 A53coacxdPQH2GblPpUaDKC+toNintN4bCiH4Y91+RyjNUknG0bG0CPeeh/h1IZS7+jDC
	 eCAD5QqUNV8C9QWuL4p7GBsiPzuDAruIR0JeQ5EO7vajCdJ3xv/Ltzm91Ynx738LOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112058;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mdOCBUbvpa7NsphrvVrMSZbrhb7LhfL56fR8sr1ahbg=;
	b=T0r23QZxgTVjH4+ZM0tSOLgJ5BOaxuBBofThtm+Gczoa+Rb9AG9PBYtAPwA07JjInKQV
	 yZ+Pinobos6CXq+9LrTmmwbEACcVFJ4EjiXr/A8QO9vSYyijFF1TlKt3VhNJPitkkGXCa
	 IKujudV74zFkXPe7m5gXYT8iDgzq7hL5rLwMxqeMYwvDYr1OUIngni+dEyv4bOfc4lAOo
	 9gmy67LBF9mp+XZPc+Eh655f3//kDgiXrZprjRy7wC076w9NNMU/1PP0TMHo+hc7qRvDc
	 Y41ZmDsrY1LfUxwhXUhgWx8KUEdbSsRc5cnH+F1j8Lag8wOhUdz1y60PsaygtrqRdWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fKNscz3Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9526E606A325;
	Tue, 27 Oct 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fKNscz3Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936061F031E0;
	Tue, 27 Oct 2026 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112058;
	bh=mdOCBUbvpa7NsphrvVrMSZbrhb7LhfL56fR8sr1ahbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fKNscz3Q3d3Gj8iZd0RdOtW/rWF8spQIGem1TAKe4QYkdDP/s3fAELbpnTA+dFyoH
	 0cMef9G3xtJhbh0bYyEU62atjuhVxJEijdA+qO9jSaUESSyWoKyNwouwxCEHny8Uxe
	 vIc+qpKKM59NutKqD/q5GxSHHwZCia7CaTbJ8/6w=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:40:45 +0100
Subject: [PATCH 2/7] usb: storage: ene_ub6250: report boot block errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-usb-storage-v1-2-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=menQSd3zvOW2/qFhwzcRL+JgrjNulDQGrdsZolXH/DY=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtn+aZdLwjH8pw/X6lZcVtrWF7xbYOLv3LOuSxh05U
 4ueiHn2dsSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEtp5gmF8T2nX8SouvxQvN
 I2eynRM+31jgY84wz8Zj0sPgMtMi690nzrm11/hF32szBQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

A Memory Stick whose boot block is rejected by the ENE UB6250 driver,
for instance a hybrid card or a card with an unexpected class, page size
or IDI configuration, crashes the kernel with a NULL pointer
write when it is inserted.

ms_lib_process_bootblock() unconditionally sets result to 0 just before
returning, so every failure is reported as success.  On those failures
the logical maps were either never allocated, or were freed again by
ms_lib_free_logicalmap() at its exit label, so ms_card_init() then
writes through a NULL Phy2LogMap:

    info->MS_Lib.Phy2LogMap[btBlk1st] = MS_LB_BOOT_BLOCK;

It also means the second boot block is never tried when the first one is
bad.

The bug was found by code inspection and has not been reproduced.

Fix by returning the real result from ms_lib_process_bootblock(), so
that ms_card_init() falls back to the second boot block and fails when
neither one is usable.

Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr to drivers/usb/storage/ene_ub6250.c")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/storage/ene_ub6250.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 49276ac79402..a5ef1dcf0bc7 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -1064,7 +1064,6 @@ static int ms_lib_process_bootblock(struct us_data *us, u16 PhyBlock, u8 *PageDa
 
 	kfree(PageBuffer);
 
-	result = 0;
 	return result;
 }
 

-- 
2.56.0

