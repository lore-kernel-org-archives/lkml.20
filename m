Received: from ha.d.sender-sib.com (ha.d.sender-sib.com [77.32.148.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B16384CD4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286675; cv=none; b=TNChR3MznKYApQVa+8LitnI8PLHpGlLLCNjgoqAI6/KhIqTiNWoRgueKzEl6DuBLCjgreE6aSYi+uRMRREymnMcTylkHkmQaOwR09R1j5i2B6C0MTtmk0hPZ63EoXWHxztpVBePfhxV9E+mztrA7fyjBCNvrjAfJRZh6yaq4Jdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286675; c=relaxed/simple;
	bh=juTmC3CFhfPPkaIWjFcKlVbWx5pBfvrZZD7LXlAITdo=;
	h=To:Subject:Message-Id:Date:Cc:From:Mime-Version; b=oltqCc9prY5RlTiEr4DLXYdGLeADsIDbXjGYFNRTno+os1kzVpG+Nf2GLhUCf/INgbIwL0S0fvLHZK9YjpQJRZIgr6XFE7qfK9afcanHbqs5Yik0CM1kz7mfcZBbJsa+7PW6eqjbBrukoHMp+JIhyeqNh9LeL0Sk1vCERWGnJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=ha.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=l/asI/qC; arc=none smtp.client-ip=77.32.148.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ha.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="l/asI/qC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo2; bh=q4IUphqETpmEIg6OGGAcnnMQBzMLeTFlCH+drdANwwg=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=l/asI/qCM+ghRNL/X0Y59uvY26fjCzMCLvpqpBpW66OEPBhUEitfXAa+JsHCMfl9ajhzX5FMnl+x
        /OX7CSRKW8I30EAqcMJiHkv6iK8/Wn5Q8e3nPBtBO4AT4X9ywuBupcJ9ASlVC8AO2ZqhHUWUcQy9
        8oGg6EiCWBtO4c/pHwVj63fN3lVfLOTR9RjUIkiTPgKYQKraXMQjoID/KblsXm0ZI8d0ZJ+drAwr
        W+fUqgc12gVPQ7dYGqRQXoyhMRFDg4PPcuFw8QvRygGru6Uoh7HMHNflu6GxRy8ExIOe1/Butjl5
        +PnPK15qgy2h/Xt/BRxa3IJvn47TqEpfFcPwIw==
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8723bs: remove unused EF2Byte and EF4Byte definitions
X-sib-id: VUQFvEehn6tasFHXUYYXJ2manzbMlq9P9abHvap1eZBqftHVgeI8peD2PK-jGhT31sOUvxwMjVDvXn9Ms9zn9so2ihDAtSJIz4H7hCeKjUz1JSdRxtuewmopaku9kSljSPZGqgClwuEfAZnzkSt6TWp-wdry8F0VGpv_N-_NR6V49dAqySeFyYnwnw
Message-Id: <20260913080305.10982-1-me@dipeshchaudhary.in>
Origin-messageId: <20260913080305.10982-1-me@dipeshchaudhary.in>
Feedback-ID: 77.32.148.27:10551297_-1:10551297:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
Date: Sun, 13 Sep 2026 08:03:05 +0000
Cc: <linux-staging@lists.linux.dev>,  <linux-kernel@vger.kernel.org>,  "Dipesh Chaudhary" <me@dipeshchaudhary.in>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "Dipesh Chaudhary" <me@dipeshchaudhary.in>
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYwOTEzMDgwMzA1LjEwOTgyLTEtbWVAZGlwZXNoY2hhdWRoYXJ5LmluPn5oYS5kLnNlbmRlci1zaWIuY29t
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.5


The EF2Byte and EF4Byte macros are defined as le16_to_cpu and
le32_to_cpu respectively in basic_types.h, but are never referenced
anywhere in this driver or the rest of the kernel tree. Remove these
unused definitions to clean up dead code as noted in the driver's
TODO file.

Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/stag=
ing/rtl8723bs/include/basic_types.h
index aaa1e60f4..b4dde1fb4 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -29,8 +29,6 @@
 /*  Byte Swapping routine. */
 /*  */
 #define EF1Byte	(u8)
-#define EF2Byte		le16_to_cpu
-#define EF4Byte	le32_to_cpu
=20
 /* Convert little data endian to host ordering */
 #define EF1BYTE(_val)		\
--=20
2.39.5



