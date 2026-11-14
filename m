Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637108;
	b=JiR79PxGhmG5pG26lsO8N2hNd3gZauk/vi5UXkpQFZzdVUt2F+LuCF9YHy94NjBWlQNx
	 JxVee/riat6y7m13Rex/0DRbcl6c+mK4jo5UvnjMH8ePufW1Bu6FZES2d0J+So0i2OHGu
	 QBDmu4B/dCJFlieT4lrCoKkn0qiWa/tTMDaJw5nl1vEOLWM1SHPuk00QngfXxeE0jqWYV
	 c6h1aqg3NVBKLfVW9sWXivCJjVjD9ivfKvHwiQ5Eq5DtIBSvkkXsoWSpNrYUiMZCG8sA0
	 dnRkbuUygUNFzs48Hq8tOJ5GUWlm7LicvzYx3IDo0yg+PU5hm3XSGT1u8FTrelUDLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ptwvPDqNFlRv3U0ViuxKW6/gMdMwdZJqd9nuA2EiDQI=;
	b=UziHTA+2IDflp7H/8lBwocFi8WHGgEhx0Pc7ecmfrfJ5H7EZ5KE46gIHH1Kv/GENYfO+
	 By062u8z+JPXVl1rT4xrPCUIz1z5KytHJHZSKm2V7hibgRlxSgtD7TZuHCg2197s3eSm4
	 G6gdw5Q6qLk8pkXIcDx3nju/8S7x3cqCQvQ7jtV3EeTZy2krXy3cCdGDv9S/G0IPrVJE7
	 SkpWeuPel9jeEEenlaYyGpzzgu7phOQ+BXHW+gMsKzLK3rlAcFk3wFrxRsFeMMh7/RCeC
	 CfCmCFxMXH064JXYZxx9c5AcrtkNwKSjQNMlW+54Y0awpBcdZCHMoGwyPTOcBs+dSvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYHFUH3o;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C960A260B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924C960A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYHFUH3o
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37600b0db49so2437225eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637107; x=1795241907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptwvPDqNFlRv3U0ViuxKW6/gMdMwdZJqd9nuA2EiDQI=;
        b=VYHFUH3oBsRXzu8T22/BrwippvTw/pL+vdWIZ92OxWtyEua02Tt/yu+Cl1RnOTFEyq
         CREGJgh/Ro3Z9HuiS+NIpnyKr4bGUloo47W9QiQwvOQMZ3I0Ff0VkxibWq0Xk7FGrQTe
         EiTujSV8Ujxdz3lRLN60qz/xnLIK6ps/cnHweQQv+uVf06cDrjrASMPcd+D/YMwzgOhX
         uCM59Yu3ZUofmbjyhKAiydX1bQ0Ooe42G6bYL3OeQQqOu0opSll06HFMurRuTIFRpTOL
         jkFndZLQnMlscpytTmFzPpRkMRNpSpzrv3Twls16n42EjmhfXdKSWiODeZHx8VWonXZk
         OPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637107; x=1795241907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ptwvPDqNFlRv3U0ViuxKW6/gMdMwdZJqd9nuA2EiDQI=;
        b=jyzmSL2305/Nj1wZlgeHx+7B4GNdZ1ErGDtEwCu9eb+QVFG++4SMOIYYiqymWpgSgE
         Xlr9qnLMh3lhoQdOM5A7038O+SGXw9A0SXLO3wsHxQlXuvJoOpYybrBCrWM/R3tssGBO
         wti5Sy8dOqNAsIbNs8eqqTHu8oB/bnjews2uFJ7F/UOAE6K4kFdvpxhoudSIgiXvzDtj
         amOMfdVaNPrQktmeDsZuTWgIF3ZNYV3yQ8Adxvt7V8e9iaqc0b2yM5tCA+KRh6kyqkrb
         7cyOSGX9iJ++5UP4+qsG79N4A4U7qvcetUD5GZuZwftzT2XDop8NEsLElAvtkhnL+Vps
         1I9Q==
X-Forwarded-Encrypted: i=1; AL+hErHhckMP6RPCzOwzrAY6fOxHlyaAzYr9KzhHvHmEYocexxxQoAg4yCNg937IJKBzIq+/9cWkKh+jHtjH7aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CLTyptYOQQs2vt0xXlUGaYf3rJctEP3RiHWXcPrIuSPrXxnYi
	bsf4sQOESMwiCx71k+qd5Az5VEB+8o3WVcTf3mfW7+8ZDbm/NC57oWTP
X-Gm-Gg: AYBFou3pSq0dmeL88AeJoSnYqXMxBNjHwBDj4MOY0lgNvwOD7YOFx8inxbBcxxfnh3m
	4fqCW6yKcU2ZiTFxVQNd38BYvKA2nx7pByQz2Vqg1IMKWVJwkqwdgsZnGKocjyrq6w94PqgQCFd
	/EL0bEECAbPJGxkLaVieoFVI/ztlgj0zG8OjWgG1lcUulyDOY1uE9NA3ZUgazizP1yHfon+F1w5
	nFT8eUGJE6uHuRrSdRhTq+KL4c3Wruk0vZwSOIQNxcRGLul2Hq044wBm+TnfXMS3szCfaRsOS/n
	XBTpPl4jchZNuemfvm1hg3XRDv7mc1KokCgNURUPspnogJQDH0Hmw0FAz1tp4JvUiawqa9OitOo
	2rmXSoW+Zmy0lWHO5/NmWN4EY3H0KREnr4s41qt7bG0lVdCMjbKgkLU4Y/ujjOJlohuG8LyU2Re
	hllttoUON/1W5yzvjbcRzXSkRqS/cBu5ps1XoPGaGQLevxFnlhotTQUS/I0ZUWspnSqGcTBm8HH
	9W8Dxqjb8qW+HbaFtTFGLHblFibwSLrWMsH0qmSk/YKEAaBSvakuOzbSraO+52VAwlhcO5Yoimh
	BlYQS3vL6+AHTvOZ8REfVyTg8wI/P/vPTTSv1HpjPGdzuDLci4ZjEbTevkn6OcZ2oME4phhkDJ2
	/mbBCk0+SwzRQinJkdbA3lHQJeA+Mw1SGNSpK5VVeE1vRU2B6gXV8UareepvyB8Io5Y6Zw3fPIF
	LmP6I=
X-Received: by 2002:a05:7300:c7c4:b0:377:3984:5cb with SMTP id 5a478bee46e88-377e15ef441mr6684159eec.17.1794637106611;
        Fri, 13 Nov 2026 22:18:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:25 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: dell: dcdbas: Validate the WSMT buffer description
Date: Fri, 13 Nov 2026 22:17:57 -0800
Message-ID: <e2f8ce920d1fe503bf8b506f3cea2a0b72187261.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
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

without checking that remap_size is larger than the 8 byte semaphore.
An OEM string such as "30[addr;0]" or an EPS table with
num_of_4k_pages == 0 makes the size wrap to almost 2^64, and smi_data
reads and writes can then access memory well past the mapping.

check_eps_table() also accepts a table with length 0, since the
checksum of zero bytes is zero, and then trusts the rest of it.

Reject buffers of 8 bytes or less, and EPS tables shorter than
struct smm_eps_table.

Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
Fixes: 47a94c551a74 ("platform/x86: dcdbas: Check SMBIOS for protected buffer address")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index d5a93aca9c93..af4c1d2fe497 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -540,6 +540,9 @@ static inline struct smm_eps_table *check_eps_table(u8 *addr)
 	if (strncmp(eps->smm_comm_buff_anchor, SMM_EPS_SIG, 4) != 0)
 		return NULL;
 
+	if (eps->length < sizeof(*eps))
+		return NULL;
+
 	if (checksum(addr, eps->length) != 0)
 		return NULL;
 
@@ -600,6 +603,12 @@ static int dcdbas_check_wsmt(void)
 		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer address is above 4GB\n");
 		return -EINVAL;
 	}
+	/* The first 8 bytes are a semaphore, so there must be room after them */
+	if (remap_size <= 8) {
+		dev_warn(&dcdbas_pdev->dev, "found WSMT, but buffer size %llu is too small\n",
+			 remap_size);
+		return -EINVAL;
+	}
 	/*
 	 * Limit remap size to MAX_SMI_DATA_BUF_SIZE + 8 (since the first 8
 	 * bytes are used for a semaphore, not the data buffer itself).
-- 
2.56.0

