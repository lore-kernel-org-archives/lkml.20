Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245FE369207
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648996; cv=none; b=d1i5M9vUrgKBjvozprWaFivhcdGgcM6N2nl4ZL3XNMgIJOV54QnGRrKxvqd2Xtn8Owq+T0ckeuUtoGwooHOPSp4IH73CYx3J9JwwT26uzH/NsLc1fPO88dDLG7vn6Mp+W49EHs5jpwPm01FIoANVTD5EZ8/6CGn5NDF3KsQ+n6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648996; c=relaxed/simple;
	bh=yxoxZmGSqvIPcrImakjIUGsaLNToxRhFjaiZF8tsmR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Awebje6iaGHN/4VXWngDmu6HuKNf3AVShz5sNuYAALmwmWaLKEL2GgLQmlITYoicAW6hlgyy24Xs7CTxPtuvN73t1EOY3h5yfMetg62Vk3u1vyWjhMQnKodBy1fVCApaGtTw3oMhvsP7kIW3vEAlA2ylq0C21bAUoo2miMlwmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTCiOfOB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTCiOfOB"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso120791866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648993; x=1792253793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YS2hvS/618HryJMsQ1ZZ9gBCMap6EYSMZfX0Cp5Lf/E=;
        b=NTCiOfOBbsqZZD5EzbAm63PDdRwav5FEMpUyhaNXF1AboZ4V0/Pd31DECTlqs3A0Co
         cJuVyVsY7Tfn+eXBD70llnNGZ+iALDV60UXOhSNM0iYtKS15ZnHYIatAhHyvqUHWncJv
         GTq9PArusJooVeYyAjB+Qkd1JkUVzVFZZcHLkObO27zV5ZtEyeRKy9DzdKR+rDQAWYRN
         Dz3QAewxxXfv+aHfZezTvdAe6JtSCqzioWGL4ZOMXRyPtzNXb6WVXJIFbCHEumuaH7Uv
         eVfhmqQ47b/14DldYQpSovrQBp3TrJc/fE/t2UOlDnAKZAjWeIX1lmyQWNKTapZTwCJ/
         46Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648993; x=1792253793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YS2hvS/618HryJMsQ1ZZ9gBCMap6EYSMZfX0Cp5Lf/E=;
        b=WX0LIZUNejN+rlU7BXrp+GL9xNV1LpfWpWrocsUDqD/e0/So9eaVptzfM2kAsEp5Cl
         6DlrYECcRXBOm4iUB/9IiRrtU+fg5lIKdbt1jti3TxHB6u4UHVYsu2MH/iZ0l4tRtxW3
         GE9QfiqwGEa/Bk0pB1S0h5MHvH8ZC6g4C/UQ4FlZWMIUf/S0lv37BPRh2Hd9uOOytI4B
         wIMOUMUldzwZTFehhcJkn5AzBkC0iPSyCZDILnezpS9vtt3U+tCKUeFp15h4Y/oTIV+g
         BKzJNYnwTr44GK3Io+ArQi3OtuIHLuOAXeYc+qUZKT3S4EnIMWCzARP5IsLYlpmCXhwg
         gsdw==
X-Forwarded-Encrypted: i=1; AKwUvBx8TRPTmjlTW+OgywfDOoDxR9ZsfB5TMR7WwL8ec9mZ4fP5wKKOhsPkA1LKtaXuRI/PG6IP2J0UoHVdv78=@vger.kernel.org
X-Gm-Message-State: AFq9FYK90vvCO+SBf7RLQIQV+lSnZSzZzmTrRTTEhPzVNUVBrnCr3zYn
	e8q7hJlfOi4GJVl6pwZsn9imMHN6J5msril81d8/rbMPyhewCAF8AuR+
X-Gm-Gg: AYBFou2I4A7QgOW6OeNf7FZYt4WcOQBmo4/vHiKq7dkDeRl42dUVOSJb1W+AnE2bEAU
	X/rZF/R4XaIA7K7gTuEHLmhNYJ7IHCXMJWvehMrYVw60I9OhySTbGHmRrrqbGmAUdv2098zZyAR
	IZRx5LDI+4W3M1TNsQ/242ojeSqhlZtByXUbU8ucfCAH2Zp6OgNjfAgxKV3ASToOddqbYDWVLFS
	vrMgJaU954fe7ywTxocvbmhZNRrovt9+014117ghNyIreoYbrPzSCYNgR0woTKzP9Lh6IiThK4Q
	Ju84WoW2XrWsb1aEeica4TdpiDhU8O77Fd/9HGHcsgo4E74gMZRKZ/fLk/kcNrmnwPKQH6uuxS+
	RqJb2YyQpmWotQn0QRs05QViDr39IBU4Hfezx8d1LUkYSbKLa+jk5xsQSUqTIO8SEdBbMo6y5Lg
	9t47oIz5p/KhsaefS0G/fNr92AzHgYBIx43iGp8237Z3u/3lT8GXF6Cb5UgYpU+oniqyk/HM7yQ
	6jgAe+0HM28cYvcv5gkrYZJctr+5Td5b73vfAnkTBJ0Hjo=
X-Received: by 2002:a17:907:97c8:b0:c2e:4de1:956f with SMTP id a640c23a62f3a-c31aa0c34b6mr528057166b.43.1791648993023;
        Sat, 10 Oct 2026 09:16:33 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a7b988sm263929866b.46.2026.10.10.09.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:16:32 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: linux-ide@vger.kernel.org
Cc: dlemoal@kernel.org,
	cassel@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ata: libahci: re-enable FBS after error handling on a port multiplier
Date: Sat, 10 Oct 2026 18:16:30 +0200
Message-ID: <20261010161630.431-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ahci_do_softreset() disables FBS before resetting a device behind a port
multiplier, as required by AHCI 1.2 section 9.3.9, and re-enables it only
when that softreset succeeds. If it fails, for example because a
hot-plugged drive is still spinning up ("softreset failed (device not
ready)"), EH escalates to a hardreset of the PMP link, and nothing turns
FBS back on: only ahci_pmp_attach() does, which runs at the next boot.
The port keeps working with command-based switching until then.

Seen on a Marvell 88SE9235 (1b4b:9235) with Marvell 88SM9705 port
multipliers (1b4b:9705, in a Synology DX1222 expansion unit): after
hot-plugging a drive, the kernel logged "FBS is disabled" followed by
"softreset failed (device not ready)" and a PMP hardreset, and never
"FBS is enabled" again (twice, on two different ports).

At the end of ahci_error_handler(), re-enable FBS if a PMP is still
attached and FBS is supported but disabled.

Tested on 7.2.6 with the patch built as an out-of-tree libahci (the stock
ahci module binds to it, symbol CRCs are unchanged). Hot-plugging a drive
into a free port of the multiplier then logged "FBS is disabled",
"softreset failed (device not ready)" and a PMP hardreset, followed by
"re-enabling FBS after error handling" and "FBS is enabled". Afterwards
two other drives behind the same multiplier read 259 + 259 MB/s in
parallel (O_DIRECT, 4 MiB blocks), against 268 MB/s for one drive alone,
so their commands overlap again.

Fixes: 89dafa20f3da ("ahci: disabled FBS prior to issuing software reset")
Assisted-by: LLM
Signed-off-by: illofspeed <illofspeed@gmail.com>
---

Notes:
    v2: no code changes. The only change is my author address: v1 went out on
    2026-10-10 from my previous address. Please apply this version instead of v1.
    
    The controller is passed through (VFIO) to a KVM guest; the tested kernel is the
    guest's. The two earlier occurrences without the patch were on ata8 and ata10 of the
    same controller; this test was on ata7.

 drivers/ata/libahci.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 08ab56e9556..6f374fd79f5 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -2233,6 +2233,23 @@ void ahci_error_handler(struct ata_port *ap)
 
 	sata_pmp_error_handler(ap);
 
+	/*
+	 * ahci_do_softreset() turns FBS off before resetting a fan-out link
+	 * and turns it back on only if that reset succeeds. When it fails
+	 * (e.g. a hot-plugged drive is still spinning up), EH escalates to a
+	 * PMP hardreset, which never re-enables FBS, so the port would keep
+	 * command-based switching until the PMP is attached again (reboot).
+	 * Restore FBS once recovery is done and the PMP is still attached.
+	 */
+	if (sata_pmp_attached(ap) && ata_dev_enabled(ap->link.device)) {
+		struct ahci_port_priv *pp = ap->private_data;
+
+		if (pp->fbs_supported && !pp->fbs_enabled) {
+			ata_port_info(ap, "re-enabling FBS after error handling\n");
+			ahci_enable_fbs(ap);
+		}
+	}
+
 	if (!ata_dev_enabled(ap->link.device))
 		hpriv->stop_engine(ap);
 }
-- 
2.43.0

