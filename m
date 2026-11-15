Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758004;
	b=XzYqWIdqcNlnFvtZA55tiNkEwyZqEMCFhZgOCq2W8pjO+vWB9KF10Q7KQmY0Gtrsd6mC
	 f/75vMEzLznYAEzAfCjgvNTsMZqXbpnlZCgqVyUlPy8SqRIuPgdZd9awg+65qWyEp8eZi
	 9Iv9FgQUuMb3eiHVgxc16mgFjkkM7VocDBNqSvgAJEZ3IToEdqdDC5sq3HUQ/OZW9s6x5
	 hfHpyw7RGtlnF3DpVtkaUIDA2nXtAtGSySK1V5UMryM8P793cmL8EMGwGeVC+A0ZDVloS
	 ewPEs3Tz5plOJYY3NcclRVw2F3xD+qSUMib9NVdfURQfgHsr2XMLwbzZSST/D+6uvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O9VItWmi9UHiGij/i4Du4r2xIwo+QaJVFaf5QD6qzlQ=;
	b=s2XSafFC3dmNI/bItFIAKBGXNg0pPxWFPccxKPYK/JvVeihFhqdOB2zjWdCBK1DcqtzG
	 eb1Y8xJcpktNC1/AaE5g0rmRFLVi0oVFuGeFnKOSAlS69L3jsr2PhKfj46PXPmhiP76ZM
	 w5RsurKoOk5W9jwsODlJDL4/vCp5m/drFg6EMdo0uUr+USDM4K7caohOqW1NzSPd91RnR
	 81GZnU1R1D/KPy8N7pRafsNyBav2tWncKxzjVfBILnfQN+plzMG3RO6NvLVMHtNfJnT5Q
	 xFZW7K+Dig1uayHq7y+sJRYSk+k1S3wwTsWpMAurUyqJEQi93ugnpWJhmG7UAoLf3Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuIlweFe;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2DE606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2DE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuIlweFe
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1182608f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758003; x=1795362803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9VItWmi9UHiGij/i4Du4r2xIwo+QaJVFaf5QD6qzlQ=;
        b=SuIlweFexL5SYa9O7lC+ikAmwwOEAqre+cYxlWzMrIdJTOVAcTVJLVRXmxYYk4v5Lb
         ZuvEd6pXpS7BfGgB4m6LdBUurkJadGlVGJAg7RvxZSHKhxAxhfJt/+PFTdPmHuQD+/Vv
         ojve3UhGaj8ZAOO9E/c/JHeOpfvd6wzMJNf+ZZ67sedwDyrR9z5IqqbPQdgP4FFh2kzN
         5QPp1PS7F7ZV/xPoPa9NlvfQ9L96fnLzpSJy3kqkmMitzYwwIJhF/+7ummjrLyohxFoY
         f6tgZj82gD9W/deAG9w7R13yhHsOo1nWLOj8T1MZhgRzRtZGXOVOtaS0ORyPRTg2LpeS
         FN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758003; x=1795362803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9VItWmi9UHiGij/i4Du4r2xIwo+QaJVFaf5QD6qzlQ=;
        b=QSvoqCTCaEqq9k26O2tAi2bKLo9BQDLqDX4dlqFvK8XsizZQ/GwDnsQ3IFC6kvo1+Y
         rpRhnkOsAZuYp152uR5wpXulUJ6W+k0TIZpk9AgDN6/Cb/3Egn0OHXig4CYxe556BD80
         FcRh3VtFLKM/Ycy+XDPcrNAXIOXdrkrmklEwYGh96JL5qjkwVZWf1th2xFkT0fwTqKEx
         0rD9kJkHIFQvlnsZO4e69JbPeP+FwWiin9C4DAiPrZWOsz5FJ1ot1cZZvi6kY9BzuCpF
         BVUXmbGeOE6EVGZ3yk/CqknuOgeQq+YBbfAzP3tBtvzxGol/RPuM6z09lE+z/+pNriPD
         DwtA==
X-Forwarded-Encrypted: i=1; AL+hErFsdK+3+Z4bzmtBOphL9KdrOjDGt77zShHnY4XGs3TJ44z61sHX35e3+D/PmZgap2HAu3ojn4pDECPPbWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vrhxnReYuNV9N1GctJcIvye2GkdYwH6TDJQfSY7nv6buTVcyL
	el/1N/kmYELpaDzR2lXisXqOk9k/cxsXhroFFE4fFll5MbyNtdD1lFcv
X-Gm-Gg: AYBFou0BEWxtFnBPFJSnLWVww6idZzgOMGj3g2CqVhyAl30NYYwygGPD4c0ALm4rS8B
	vqUV5MUwNHnp/OBr+pWdcctep9kxaS8U4BEJh4qWgK3oxk+JpxFvLTLmXxdkYUG3nPZRRI05SnY
	xXJlMYnyHd+QAh8s7ZDphyn+pHQRG3LjPr7GFdTRl/Rdpic93TfkYDGzFIg6lyeyN9Jb1XDfLO7
	gaGBx8PWlTuALjWXUOjWanmRJeTJu2VYRDK6HOT5apnG3f76sOTHtBUZzV1W1HD9WUpfV4APmDM
	+DN2pjCert7D1UmxnZN/aDkCFpIyi1aKADDoNK6rVZj0FnuzckN8pK1YlrQhGXdU1jAfvtL2UWg
	uQgfRs3qZnHG3GCVsTS2UGCG0vlty+00E8z4yyXKfy2/AQiwOh8wFlJeRU0w1gAnGYu1RSWBIPY
	HZeGbc3XrWvyb332kmeS0EbaAWRXOxSAWbQDQYDiX2uyKUmVeI32CEZtphoq08YK2ZTydEf9Cqo
	U3Tt1j32OySl3XxF+j3axWYahsOJM+EzT4cG9RwwkaXxUbqv0qlQmq0WDCZEISP4aOTRpYFmMsR
	YmAplxdmY8/GLa4xFu18ew0q
X-Received: by 2002:a05:6000:1885:b0:499:d9a9:5158 with SMTP id ffacd0b85a97d-49c727d1e47mr16775237f8f.31.1794758002517;
        Sun, 15 Nov 2026 07:53:22 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm17215084f8f.23.2026.11.15.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:53:21 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH v3 2/2] ksmbd: decode version 3 fields in ndr_decode_dos_attr()
Date: Sun, 15 Nov 2026 16:53:08 +0100
Message-ID: <20261115155308.415734-2-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115155308.415734-1-koray.fra@gmail.com>
References: <20261115155308.415734-1-koray.fra@gmail.com>
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

When decoding a version 3 user.DOSATTRIB xattr, ndr_decode_dos_attr()
discards ea_size, size, alloc_size, and change_time into NULL. When the
xattr is subsequently rewritten, ndr_encode_dos_attr() writes zeros for
these fields, clobbering their existing values on disk.

Fix this by decoding ea_size, size, alloc_size, and change_time into
struct xattr_dos_attrib so their values are preserved.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
v3 changes:
- split out from v2;

 fs/smb/server/ndr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/ndr.c b/fs/smb/server/ndr.c
index b5190528340f..1376d5a59fc8 100644
--- a/fs/smb/server/ndr.c
+++ b/fs/smb/server/ndr.c
@@ -271,15 +271,15 @@ int ndr_decode_dos_attr(struct ndr *n, struct xattr_dos_attrib *da)
 
 		ret = ndr_read_int64(n, &da->create_time);
 	} else {
-		ret = ndr_read_int32(n, NULL);
+		ret = ndr_read_int32(n, &da->ea_size);
 		if (ret)
 			return ret;
 
-		ret = ndr_read_int64(n, NULL);
+		ret = ndr_read_int64(n, &da->size);
 		if (ret)
 			return ret;
 
-		ret = ndr_read_int64(n, NULL);
+		ret = ndr_read_int64(n, &da->alloc_size);
 		if (ret)
 			return ret;
 
@@ -287,7 +287,7 @@ int ndr_decode_dos_attr(struct ndr *n, struct xattr_dos_attrib *da)
 		if (ret)
 			return ret;
 
-		ret = ndr_read_int64(n, NULL);
+		ret = ndr_read_int64(n, &da->change_time);
 	}
 
 	return ret;
-- 
2.56.0

