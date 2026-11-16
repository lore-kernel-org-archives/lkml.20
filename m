Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861667;
	b=J+pdvUuaxealSE2P1QhjV7eaXCu/VH8b5CwS9wTVsAavOBrAH4q55fPrhDGwnvbuosha
	 dSg0XkVP+mEDlZOR+riBH0WKsF/dpZvbZy1v40JixhZ5R9bnGu92YoifgmY8hhJc1jMSB
	 m7a9+caE2aQ57smZ88PmQPHHWEfZg517uz6yum4n3yPj4D7OhJwwO5w5QQhAeokltM3jF
	 UHwK4RI3lBD7WBZAyj2/OEXvmdMLBeWID4yb8qQrin0zNBoenorVu5fgx8tBmbi1kk5EZ
	 uaKXbbJvsN1LKPNelGU9dSLIeh5WAvV+v8Ms2nx/kk5SwngQACGyU+O5WQi06PcXmBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b6aAotgSj2ida9OGwpvLAhTzVh2WT+T+YjpuCGXLu00=;
	b=dlCDw6PrAnwZTbbn9l+oUNnap3fdFtz9l1BnG3YgqDYiQ2r0A/SbH1yF3m0qA+Xtgg6T
	 oHRx+MJD71casRKOCuzj8QFCn035hjGrjdhAsj6fnvbuTcbrEw0zsnCpvzm48d2zPddKQ
	 Q6BrDfdQv/lUJ5ROStf+aiP/LL/xhgf9RSiqkxMdoElXEmmZ6cWVwCjz2AIp98Rx24D9e
	 lN1jEJGjwKMiD7mTb/TBMqpxoo8xnc9YIPzx3Mrgig5nHy2NWjx/UW7ejMOSBrisuatBQ
	 MfSRQZ6tV1iK1UTaZjMAY6OO3m2eztGNCeNXK5X4y5lOtshzrBICUik7hHnNkgBuUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCH9XbpY;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1B0606A8A5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1B0606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCH9XbpY
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9eb579c0eso21889345ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861666; x=1795466466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6aAotgSj2ida9OGwpvLAhTzVh2WT+T+YjpuCGXLu00=;
        b=JCH9XbpYqo1mukAvoY8Hc0s2uA1GcBPgf9FDCa5NhK6xVbX9qRpPCEqyb1CBrrRyhE
         ssB/QC2IYCbao6hC4DCZbW5r3AqAnENTkaSvBbrWMfxWIgWMfk6orW2nAh4r9IovUVpM
         BCdLlZoQsKw2fyB9rdIqa/bHfoafMHpGeuQ2AUeYwhTJJl9EVvXPeBoe2Nuk5F8/v0s9
         VEkZnw4XrAEQeUSjFHVhi08AytOgezkn+6yyPPPmAfABYR6Vq3nrG/fexNa9frwFw60O
         k7GhKhxBXKJaFao8wYrCtKp5yWYO8K6vFsEVq+RuSrPVGKoH6BH58hOeuEJSCfdPIjH3
         KkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861666; x=1795466466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6aAotgSj2ida9OGwpvLAhTzVh2WT+T+YjpuCGXLu00=;
        b=RrhirQELndywGLPq8kc5n3LYY7ftlmD69e4zqP5Y4rRwv9rVYErN5cARasKWY6lf8g
         1EqtKWceAxT7YuSx2/Enp082aKUCBDnq2LN4A1MVFK/Tnec+nZTerm7XtocbeJXr3Eh+
         azO2qsgIAwIVKt/EXOWOGSjSo6+CECYRPeZcFcl7G8TGDqXDdjhlMLgzYbKTThSzuiOh
         CTaDgPKS3tz50qSNH93E+l6sC1LLuwjDl6A/12f73rILzbLjUWpCEkKg35Ct/BKwcsmB
         aHOEnNn/Y+lUPvNFk3uRc6eNRmvritHR9CgJ/whtwTpYsTVHwt5i71figGjBLJxOTgEW
         VcBQ==
X-Forwarded-Encrypted: i=1; AL+hErGap8EQaDm5GvyaYV/yGg25mCQvneClEXW0W9wQQAeFuPvjtkMiN0DaGDNydArdtxaixj4Pbc1Rk1jl1MA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xdWxxHZo+eHqWepKvYy6UMiO8VxDq5yJNCw4yKmmqqi9I7C55
	0hih6TSjvrExLffcpdrL/WKCts5HPP2j1b2ErK2VNr8BiLx8gomUzvPi
X-Gm-Gg: AZFdTZeplI3hobIIfvFc96/Gkg2+Otfs6bFsdpxt6eoOjfd/rwk4IX3u81qeuZbNeLm
	0p8guK/NNhAaLNjAk1b/CPFwglzHWyByajWfEBSvHBBFMqlO0S4aMdcssHCV8aoCqe2UYUdYMlX
	fJeIZ6fGqW4Dimv6Sv5uot443sS2cVSZU6a2MNYH5Dvp4ycAQFGXLoQtYuaCrLzjx8ktjMO0vhp
	5HnykmI4jdUUTQS4dozzQU5nfRjkUAIPEUd0soI+wcLBKb6I21btJ0SW5AaeJCFxfgCIY50/YL6
	tKlOxols/1uh939K2vIg4ngb+r+Vo4F/CWU7tTq6ZTMcV2r/m5uqmteL796sRMRyqjMKkImej6q
	86e1RAdDkqg+9Kjg06xyLDnfkWCQ4lVWUOOAh1A8x708gvfksv0596QKZglZd6kPqaUpXim17pA
	D8gxLBMUDr1WpXJ/ABPA2wb4ZYkx+agIo7se9rRRLwO6kTyQg7VMLdWmTiZycnY1PD5yZYzizty
	CHHhbvKl34sq1mouK3hliYYPlBOCorPyJExYtdHKZ6or6Qfpyg46RLDLHDh5prtgq2ehycFPdQA
	8FMT5Rdv1XfkVMmISFTTS4W2BAXeddsEw9rUTJsX/pA0y0LrEebUqA8TCA7yUs2YbtSHOM5nZt/
	1JrVws2PM7w4V0b9BhjAhaCcYzHraqVvveqh5tQkCLkIEl6phlCPbYx6om5O4fL2tZD+Ca3Ng9+
	3pqGVbZAZSnPOhDjPKLLrzHKc=
X-Received: by 2002:a17:903:984:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2ee0da7f5acmr106014125ad.14.1794861666125;
        Mon, 16 Nov 2026 12:41:06 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:05 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] platform/x86: dell: dcdbas: Validate the WSMT buffer description
Date: Mon, 16 Nov 2026 12:40:52 -0800
Message-ID: <aa437d954b48790ef8a3d770c2ec4207aec4d8f7.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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

dcdbas_check_wsmt() takes the address and size of the firmware SMI
buffer from an SMBIOS OEM string or from an EPS table in the BIOS area,
and sets

	smi_buf.size = remap_size - 8;
	max_smi_data_buf_size = smi_buf.size;

without checking that remap_size covers the 8 byte semaphore. An OEM
string such as "30[addr;4]" would make the size wrap to almost 2^64,
and smi_data reads and writes could then access memory well past the
mapping.

check_eps_table() also accepts a table with length 0, since the
checksum of zero bytes is zero, and then trusts the rest of it.

No firmware is known to describe the buffer like this, so this is
hardening against malformed tables rather than a fix for a reported
problem. Reject buffers smaller than the semaphore, and EPS tables
shorter than struct smm_eps_table.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 0db278eed5d8..1e854f02e171 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -538,6 +538,9 @@ static inline struct smm_eps_table *check_eps_table(u8 *addr)
 	if (strncmp(eps->smm_comm_buff_anchor, SMM_EPS_SIG, 4) != 0)
 		return NULL;
 
+	if (eps->length < sizeof(*eps))
+		return NULL;
+
 	if (checksum(addr, eps->length) != 0)
 		return NULL;
 
@@ -598,6 +601,12 @@ static int dcdbas_check_wsmt(void)
 		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer address is above 4GB\n");
 		return -EINVAL;
 	}
+	/* The first 8 bytes are a semaphore, not part of the data buffer */
+	if (remap_size < 8) {
+		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer size %llu is too small\n",
+			 remap_size);
+		return -EINVAL;
+	}
 	/*
 	 * Limit remap size to MAX_SMI_DATA_BUF_SIZE + 8 (since the first 8
 	 * bytes are used for a semaphore, not the data buffer itself).
-- 
2.56.1

