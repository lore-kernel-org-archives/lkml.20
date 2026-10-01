Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598824A206E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841534; cv=none; b=iygnqk8rmKY2+2yQifqoGaUUBUth+IWQoM16LF9BdUKtNI70HvdTE/+Hkihw9H47HNszxk4pFdtSaJwi+ix1mknaOsg59gwD5ln2APhiY7p3kxexnmQ3FBeMyMVntBX05FMnad0Yfjf/gyze5MNMetN/lntb5dY+gRgCkkn629o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841534; c=relaxed/simple;
	bh=o4WRSh3ylU4jB+2m7Tsef/0w3oHGjiMTYD7zQ1XHpOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHaQO1Ns9Gisq+qBqe2VbOqc1zBKEhwLZ4+5PSXiomsYgwdg9YHyf0dYgAWVibaZu8jsRBcWD0hKHmk04IH7K5TQ1H56c7MvVQmWpCHgUvIkZzQ2tIQ8yVcsgVsVb7TXo033j4JhhhCLCh2jjJ0UVMPeQOhOzMUgT4eLm1ZbB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLTKOCzk; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLTKOCzk"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3428f70d7e7so3635781eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841529; x=1791446329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwXOGWnaQ6wHI28E3mJBgUO/SJXhASkewtrPuNOpg4M=;
        b=cLTKOCzkP3z6SUOoxqjvWNwL+CXey+MFpnkAtuwCcKErzjQ//5OYahx7SoG2znul91
         kp9dIPWLY+GpVjQQHEjnGIbq4/KKvuyAJFeakKuBKL9zhtPjDa/RqL3WnRZHNY4aJ2CO
         xCNv0BcZ3//CMbuZ/nyQKH1OkqzBAGdUHoIKH58ZW38Nfv4iyWeAFNPiHUt+44+9lqni
         /osEwz5xfOVx4XWhpeSlTUEA9gyLKqAOBs4cKmrqeO2NMEbTDWggW+ifhgnioBsP7e9R
         a8rLdDfUSh6Xjz4slg1d8MCsF/VVrpo1194T7x8tFdQb23IjO2NMM77PgDB5L0i5oWeV
         7Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841529; x=1791446329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwXOGWnaQ6wHI28E3mJBgUO/SJXhASkewtrPuNOpg4M=;
        b=DaMXl2eNJUVHhxBkgPTTfm+EDzhElOVF2gA3tGXnkTDW3jIoPBUtoPPWjOl2ZNpuPl
         YafI0KkDIr4CcV+u4ICJwz3nI464DzHvnrRWjfL/ItHsKDLSRu5KQTsoRhs6kRG4UITs
         c2Q3+OCe8DDZMx6ocBIZDa7ebNOw0qm30bqxsSAaopA4WRBllsH+vfz0KwhUm+MdP0C0
         AC1drvO9MjhHte2AMuyNx9m2AQ2vbS0ccuTHW1NwsbHBVqBKhgeX86ra/7a7eOqnXvBX
         En6ICSUU+e39KxrICwheiS7nWdfX8n2CV/0+Lu7dt6/mb7Xp+Qh8bna4WMAqQCSVz70/
         QFdA==
X-Forwarded-Encrypted: i=1; AKwUvBwEr0n5yIHMnvvtYllZRiZ/JWywM6ZvzKu7mvV5uo7CqT0PNRDhWfDtOhtPMD2aLlCEgOmYuBWrSazTmkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHZxJrlMVMMb0C8i2ipolZOnao4szHtfH9rec5fPTgpLjsvy8v
	WoZzMVRcQEcTGg+QpPFHGJ43DVCJThaJ3rg1wUPs16wIfubc6001Gw5c
X-Gm-Gg: AYBFou1oL6f7wTkjCSP24Zg1aBZdsnfZo0LHwXgs+5c37/SCTE6GwAX8fqxWP/gku1Z
	uCOPORdRx/F692HxpXoYSox6xKdbOZn6K0BfAhAQdiElSM0uh+m4htr3StIEajlrVtfBuxaNNi9
	uPgR37SGY6CltLvaKthgmttJ7vG8B4N/fDayzTm9eN4PiH7w0HP49j8N2iAbC6fTfnPMcXSsgN4
	3KxTXVOqG71HYSerDf1vFApBXdXP6svSV7J8O0Q0PcarA/eNB15K/t9CQ729gvwTIC3AIrNV+iZ
	6pIKiDxwLgKw1hdiBOnZ/qTwVX6NCapGFwnzRh2jPBRqlrkKmajOJ6cxoU79W9lPw5JPINtMcjO
	xWDWsn/OamUWsOZnUdby3NjlklrrEFEMUKdObOLRGv4IEmnkPha0CYMCGv6nwLzWULc8Pv9CP9j
	37ahtbcgz6/i/PvE/Ja1VaFvK3NYc/kq/3YnSuFTYHM6eCNPBO+jpPUkBl+qnv/AmoGs/BbQThp
	239t38CKn4=
X-Received: by 2002:a05:7300:6902:b0:33c:e82:70c7 with SMTP id 5a478bee46e88-34cdcdb285dmr5181331eec.30.1790841528992;
        Thu, 01 Oct 2026 00:58:48 -0700 (PDT)
Received: from yocto.amd.com ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4d1d560sm5174829eec.29.2026.10.01.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:58:47 -0700 (PDT)
From: paritoshpotukuchi@gmail.com
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com,
	Paritosh Potukuchi <paritosh.potukuchi@amd.com>
Subject: [PATCH] usb: gadget: f_uac1: fix ac_header_desc in descriptor lists
Date: Thu,  1 Oct 2026 07:58:08 +0000
Message-ID: <20261001075808.2156188-1-paritoshpotukuchi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paritosh Potukuchi <paritosh.potukuchi@amd.com>

ac_header_desc is a pointer to a dynamically allocated
uac1_ac_header_descriptor. The descriptor lists incorrectly
store &ac_header_desc, which is the address of the pointer
variable rather than the descriptor itself.

usb_copy_descriptors() interprets entries in these lists as
USB descriptor headers. As a result, passing
&ac_header_desc causes the pointer variable itself to be
interpreted as a descriptor and can lead to out-of-bounds
memory accesses.

Store ac_header_desc instead of &ac_header_desc in both
f_audio_desc and f_audio_ss_desc.

Fixes: 0591bc236015 ("usb: gadget: add f_uac1 variant based on a new u_audio api")
Reported-by: syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6a68b182.4c659fcc.19cd90.0021.GAE@google.com/T/

Signed-off-by: Paritosh Potukuchi <paritosh.potukuchi@amd.com>
---
 drivers/usb/gadget/function/f_uac1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 7a81cd176abd..94cc90389f6a 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -260,7 +260,7 @@ static struct uac_iso_endpoint_descriptor as_iso_in_desc = {
 
 static struct usb_descriptor_header *f_audio_desc[] = {
 	(struct usb_descriptor_header *)&ac_interface_desc,
-	(struct usb_descriptor_header *)&ac_header_desc,
+	(struct usb_descriptor_header *)ac_header_desc,
 
 	(struct usb_descriptor_header *)&usb_out_it_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
@@ -332,7 +332,7 @@ static struct usb_ss_ep_comp_descriptor ss_as_in_ep_desc_comp = {
 
 static struct usb_descriptor_header *f_audio_ss_desc[] = {
 	(struct usb_descriptor_header *)&ac_interface_desc,
-	(struct usb_descriptor_header *)&ac_header_desc,
+	(struct usb_descriptor_header *)ac_header_desc,
 
 	(struct usb_descriptor_header *)&usb_out_it_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
-- 
2.55.0

