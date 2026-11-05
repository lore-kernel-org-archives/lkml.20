Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890690;
	b=DX0RJPnuGcVf3k3vfBkq0bEBU7uBkdLW033QTJYZgwQkxRXlitn958UsCSkeHK8MKzlQ
	 wDVPnAv+Em4/73kXGG95ICgRsfN15xko1Q+FknNJYE60yepfx4tX98DVlF4tyvzeGq2ip
	 b/S6Jfk2htnHMrruZvaoH7N067YDqK8Frs9Jt7S9z2PIJaUq7I0ej1mQ28sLK/8EHLgdk
	 I+lC/isWRjjopEP19VPYP+DmihJ2k9yB6eqD2Al2m/MxqIfNTM7KhuFFCWggMEQ4jEUP9
	 k0uaNWpva5F0zKZ046OVz8a7dK2eJMxCvOREb5f9fd9MhuXVzIWFjT/tns0UzCLiBGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dkHDrNCnxbRAmnY9iwWb/71MER1I0aFyaj7MSqBXhvU=;
	b=ALT/Df2JVpe3LHRrAfcmD2s0m4qF7WcM28S8M5Lo6cyzK0FL4zVp1pImR0zDjG1pJaMU
	 zA5bMqyKK7kjproNEKyS7KvlftD7cV5m+PT2hcvkYLQC4+Fzu4QwfoCgslSKACajFq2Ju
	 3VlqGHo0XbOY8D7IWzGyCW6Lhvcyiag4Oa5m2mpZUtXo1wOA2tj2Rw5q2ePXfYWjTCNBQ
	 V3zvEUoviEsDRad4WTsCHNox8fVk1OTF6bmJ7Xneq0XuG2Wu0qlV38a2R1A3ZPcqp/JHR
	 uByDXhQAp6TlNTeO59XNO2LOpmckYga9BYqfUmTM8M7XpRYlykZzv6dc13qcdXqGzbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=maL75qis;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE695606EEB9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE695606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=maL75qis
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso922109fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890689; x=1794495489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkHDrNCnxbRAmnY9iwWb/71MER1I0aFyaj7MSqBXhvU=;
        b=maL75qisbSg7A6ZT1QyVY069cHhEGhEKq4v5K5iAIKr5opdzCVaakFSh2Cl7rWv7I9
         vZc+7MEMQXFRvvo17Sa1qPJtfTiQ9xx4k355LxGHnrYoHOEzzZf/IvnBXGjqL7JmhAkz
         wR5cc1UbDiYhshFlVhGut5m7ynVrGcP7zbX8LxsX+efWcQouN5cnN127Z528JqW1XqmA
         WcZqFKY7LD4Ojm4B/kK08gK4uheI2csK9t9EVM5Qy+NJF8MmE0QElidvM8s4xt02wEpr
         4QQU1qAp9QjKUUoMkq+4Gd5MZOGlC/lccXrtaWwrhInaAl+rfTBS6DWHLBLsaKagq/m8
         p2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890689; x=1794495489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkHDrNCnxbRAmnY9iwWb/71MER1I0aFyaj7MSqBXhvU=;
        b=emz9M1DFKQdDlg8GLvzZqfFghJpkHmNYRK5OdrR2XtStgBTaf3WaZvLe2eZ87M36wh
         sREalsZ8fzaEfMfxvBZX4UWqqgrayD6wl6jpVSEm1QzAWtjHb2ysSBFYg5kdx3BClPJu
         /hT4t/zHOBD18w8q2BzakW1zVLLcXF3ybMFDoFBUo+/v+5aigkvJq8Ztx/dLzrLdpscz
         jgmkKzqnGO+ZGXPr8qmnTaO01t2P+P+EpXSYd4OpjpQCUVp83UAGaEXR0XJMNIdt7D1t
         zHh1q6n0PGjJwLmHBiJM/qWN3JomGI90yG2oVXEjGfTFrU7SHtzYCQ5MExdrD8ADnDoJ
         uK3A==
X-Forwarded-Encrypted: i=1; AKwUvByAXlcFJ49PrToEKdW7oZzxrii3wIGrtetVvie9qOyq24veNU4Nu8KhGAcCPFSZoEkR1lxE3ZvZ7F4sM+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C84wKc2VnALu69SI5GFITYZjNHO6Z6UatIcmw4Rm30/16ZQxr
	U+7L43IL6IrQClbBdS9psyZZiJMEFhOL1y3+1u0fn6tUxW0dJkJuP/y4aRHmf/hfwZU=
X-Gm-Gg: AYBFou2LICEMCPH6FpQCf+OHBKqscDUbJE7CqAlC3tjU4lFuVJfoMcRi2SdGR6LNd9E
	uITrbYK9p45MFnHpf5GCrcZnRQOxT0mRuqGoBopupPT6BWvxMLhVoKIrx+37rn9QNuc4bxuOvGR
	kRx8XnNShvq0Hf7KowpKBk5r/X6SHMNYWqi8yIePKcWTpTD3gKtZ2f6q2CPbE5KUvDOyogUfZcr
	RHBWc7ScYglGCcZ09IDLM/wn7VJJkf3WLpQbWXx3NaXN7Hs03iy/tOCiPbMNmt0kHLS4kuxMq5L
	qank016N39trCoRBosjVqsILpqI9X8cQS6+DqAtzsl/8y9uPhwmq/fxvScHrsvZx3WAAGDBHIei
	FR9RowtVY9cGAdmrU9+KdSvQvR2WBqsTL4/UcBN5OUUbwl575AOmdUttNbevjGUK6fihiOEDhte
	h5y57gcpHbSjfa0PeRPWalWShv82Q2cqghtIcNevUK/ChHiv2/+6hrXgm3PGqlpsdWWjxcUOn4o
	dXOa095bk/dLUXSgoEDSndCNFmrdRAs1tnGzOtDUF6GzBhc9RKssf9oqwxhuvUXtEkjKaRweaZd
	F+1bvFZs3KnMo9iVViw5wP9s8j3tiPwPXRKXAHVYP4/Big==
X-Received: by 2002:a05:6870:b510:b0:483:67d7:e045 with SMTP id 586e51a60fabf-4a90761be6fmr12829444fac.17.1793890688649;
        Thu, 05 Nov 2026 06:58:08 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea680cacsm4490943fac.16.2026.11.05.06.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:07 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:56:58 +0000
Subject: [PATCH RFC v3 07/90] ucount: count the id blocks a user holds
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
Message-Id: <20261105-b4-cells-v3-7-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890669; l=1206;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=nNOYagXPS7UuclEa6CcqzF+lG9K1DgR6fFtMR2Grrjc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIMu8+xlcTKBuamFsS4d1TuvaQKBaizx5lSbbA0HZfVJWo4o7PZbAa8Z4P+CWt1buiOR2uGpoPQ
 UEHhTUD2aMgk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A block of ids gives access to nothing, so taking one requires no
privilege. But the number of blocks is limited.

Add a ucount, user.max_cell_id_blocks, so that a single user cannot use up
the window.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/user_namespace.h | 3 +++
 kernel/ucount.c                | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 5c8cf31ab9d4..f0b0fe12c2fd 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -61,6 +61,9 @@ enum ucount_type {
 #endif
 #if IS_ENABLED(CONFIG_BINFMT_MISC)
 	UCOUNT_BINFMT_MISC_INTERPRETERS,
+#endif
+#ifdef CONFIG_CELLS
+	UCOUNT_CELL_ID_BLOCKS,
 #endif
 	UCOUNT_COUNTS,
 };
diff --git a/kernel/ucount.c b/kernel/ucount.c
index 94b70502dc9d..7eab985121f6 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -93,6 +93,9 @@ static const struct ctl_table user_table[] = {
 #if IS_ENABLED(CONFIG_BINFMT_MISC)
 	UCOUNT_ENTRY("max_binfmt_misc_interpreters"),
 #endif
+#ifdef CONFIG_CELLS
+	UCOUNT_ENTRY("max_cell_id_blocks"),
+#endif
 };
 #endif /* CONFIG_SYSCTL */
 

-- 
2.55.0

