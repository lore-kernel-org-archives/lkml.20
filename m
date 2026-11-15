Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733152;
	b=CXOSioc+vjQS6MeYrn6ZccIt6oXa0Cc0petAINuB3Y4EAJRDhPXGCzpbAlCcOCLQtQLq
	 SDAwPn+xi5IAlxMaHR4ShwcXE05ooMKAgYMklYnHjoGWjqkFj7Fh8nteOVWOeD4PEiecM
	 WfHeejdGEIJCbYJyO6Fjhb2Jk4nbPmEzGQzWmiLVZW45JU8cdphyvc3B0YaiRFrZXTzqV
	 HrXEmog/fW7nldq5Otm3QEDLDStOG0SdmfOfTXmxyp9Q5rFqax/14v/nkxb0/s3M1qr2n
	 3GtSO6IWsrvopxHQFjCEH6W1zTRccGty6qtOmEwYfImodaoLZa3LZig4F/ukhn+nHYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vBzp1cbJBkZ9i3fvRMznU3Qya+xemyFA2/5bJ6Wt8wk=;
	b=U0vk4nMJy74QyYi2Y01PE2jO7cFKRcvOzGZ3UFzpZkSF3KnhQ8+9g6+KbA7kGpcLzJHT
	 WA2WG7/2xVTfzzSjuqQlzbJ6XUzNOTVBwPtIPL6EuFq9jb8UJ/U8qTWlb7Qh+hAlk2rLx
	 RT33+dD2dJbCuorGNapff/w/3jQlDom5S4hEntW50W/E7wn1ts+We2yz6MMAQmnM3GGja
	 HEh2BSyVMCn7TJY8r3XTDi4ktl6QEPZmLDFWvjBkT1pzPf/Xwikdn/4Xa31QPqnGs22SD
	 2tOvTXN3qbaEtvqmAGRkcpSm1Qy8aVigYp2Xf3Fl7Oc0WO2w5tRpjUGM0AoaFpMtu5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y3lgp/rm";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223CD606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223CD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3lgp/rm
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1368057a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733151; x=1795337951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBzp1cbJBkZ9i3fvRMznU3Qya+xemyFA2/5bJ6Wt8wk=;
        b=Y3lgp/rmcuHXtGgT7jiOpAhUdOJjUk2EjyColK+tRWTsylj3O0EhFIqbVdSZ8dov2S
         FBYbHklRubGQqGKxI5Rwp2PdjLLucmeIFSLVw53xmyOcmSti1Ei7PsQMrnNtQDws/HKf
         bDzaFYiVA7pNUjapbfk8z7ZWCO0o38b2UZwPSIrXy1ymv/W5H3VghAjcogdi5NJkk/U8
         6jnrptXeSZtRn7mgMe0VQrPuh3ic239zz/vUfWyuEfpJCZf7kWeGfC8zBzAB0msA/49d
         SdTDWwI8obh+POjb6QClXWMmV0qDnf133Ieyh1z8MY3c0rWNwifB9SUlDqaNea7VhCQC
         QsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733151; x=1795337951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBzp1cbJBkZ9i3fvRMznU3Qya+xemyFA2/5bJ6Wt8wk=;
        b=atPy04dNzQ5abJVLVlJWtHL2p+LLwnEaa8BqR/ISVQQf9CwaZ3YAS8goeyFC7FMND/
         ejWwuAD41l9rqo2zkgvamUv94NUdYVAJoH/LblZ0UxqzWWMSX2u04Xae3bXiYamTbu+V
         n+R8rKRtj7Pof0Z2Y39W4Okky3Y6m6Y/V2bt2tELjibbv1YTQDFQ036lR4SFduNET2IM
         Lnt1EHpMzGWZyIORCK8ImUxpoenQUyxdUXGmZIu4ypIevmzHzKuOQ9Ha/ISDbt59srP6
         HsNn3Z7VFynePSW/dOr2rowN7ZRxE9zTn8gUj+WoIbmkWHiQ1Yc0KwuBanAl5aoqCH7I
         MuqQ==
X-Forwarded-Encrypted: i=1; AL+hErF1UKzbXXvR48WEasjv+OOPrjJ1hHm8Eauj2sp9nnnNicxgDvQdwEY2Yq7MnDG9nCXMqjP0ny6nEgHMzXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dpJwFfWJ30DBR8Dkp+oZeD6JUvNCimnnd3TInOSr3f1EMlMt6
	ggAm7Dls8EMLGxsX524twQywwzBNRZoVEfzmnSpuiaP8sPnWEMNTqrpw
X-Gm-Gg: AYBFou0k8l0yVTb1vWietjctXgOCOssnr0G34AZt/AuwGeq9rK92u0TpP7siW1UskI+
	a/+8gN4lL8I7igg61uiOSnn6/7S3+qjQpQAW96psvaEjCaguWKTUfMz3HGFdQn86C41vRa5GoA4
	qpJuNaE2CMN9v/efcnf6+9/hh1Xmcj5IaRJTbBflQDIZKH2GCAfND56O3bR+FG0FeHFnNKPy3i0
	yL++GgHKUzHAhhIXcik5sg1JG2DTb2+RXJU7FwbIcjUxkwJNEYXvFE3gpwkHufgf6TMQoM64ER/
	BWL8uE0AgP5DEs8KrMUTIRSl8bXUXjmYfF8QqoMJIyVFUJuj4EsMQAyxcQJet9Qla6Q7rd6QcJ3
	zwHf4zixcJ5KSzvCnya+orYjh2EoitSiFDUTXqSxfLlV5tRmHOfvrCIcRVpNzfRaBWaldxA80OI
	vfDOJNykq/EmrQWd4f2bf+C4Gu9PzjLZyrWeQjgR8svmnBa4OW2FvutO0nex4/V9gs/WIGpJSLx
	7IvoBx+bV7ZMtTdOllIWBWZm9BB6guwqvAu7ZTyURQ87E7IM8um8LBKOpHkjlZAnzN0xQ8jWc7D
	evXDnfXQPRZ6Anp781AkgpqRnoSmKbqP0p53mbOBG6l95VfwKKtnMeDfBeU3qC1EkHyOtsJ3Ahi
	mUVcvtHhqANIF00DFYEm+9uc7xZfrZ3kUj5Wd28pFCyNH/mzGUOkC92hXSACUTEElTe1sCsWSK8
	PhO0cRGiPyrkvJIf4VWVRMEOCLpcRJiyYLGC2ALzKW7mtvO2FwHGmUGaL7DbAM/PNfIw+vMmOqP
	MjTVJTkpidt+k21zQvpvPTLqTAD+LOSteEuia/42kRxIcFGe1iCKoUOH4eN4NWl
X-Received: by 2002:a17:90b:2e0b:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3b1b09f3b6amr7513724a91.12.1794733151364;
        Sun, 15 Nov 2026 00:59:11 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm16770310a91.1.2026.11.15.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:59:10 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sujal Tuladhar <sujaltuladhar1231@gmail.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] scsi: target: iscsi: fix session use-after-free on non-leading login
Date: Sun, 15 Nov 2026 19:27:43 +1030
Message-Id: <cover.1794732723.git.danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

A non-leading login can attach a connection to a session that
iscsit_close_connection() has already committed to freeing.  The
connection ends up in full feature phase with conn->sess dangling and
its NOP-In timer walking freed memory.  The same window leaves an armed
Time2Retain timer on a freed session when the login fails instead.

The bug dates to the driver's original merge in v3.1, but the fix keys
off ->session_close, which arrived in v5.7 with commit 57c46e9f33da
("scsi: target: fix hang when multiple threads try to destroy the same
iscsi session"), so a backport further back needs adjusting.

Tested with KASAN on mainline against a target with authentication=0
and one explicit ACL.  Compile tested on x86_64.

A reproducer is available on request.

Daniel Wade (3):
  scsi: target: iscsi: factor out iscsit_stop_kthreads()
  scsi: target: iscsi: don't attach a connection to a closing session
  scsi: target: iscsi: don't re-arm Time2Retain on a closing session

 drivers/target/iscsi/iscsi_target.c       |  6 +++
 drivers/target/iscsi/iscsi_target_login.c | 66 ++++++++++++++++++++++-
 drivers/target/iscsi/iscsi_target_login.h |  1 +
 drivers/target/iscsi/iscsi_target_nego.c  | 17 +-----
 4 files changed, 74 insertions(+), 16 deletions(-)

-- 
2.39.0.windows.2

