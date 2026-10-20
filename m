Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499627;
	b=MlOJ6Q87d/exkuWH6j+Cq6adoZycZdI2/0QNF7F/j64yd+jo3xDq546yy6JiNX/FgVOJ
	 DYBKSXEWtnzY/v4x4u+9KaFJ+G/mhnMylGhn1P5R7jQYlmVe0JR4Oe4H9WNxKfuW6uWME
	 t/eNCH6B8f5VtU01Y6/7PsbHQ4je344sXO2jqqd45Z9flbjIHZ50pXMJ4FCHHHQr5E387
	 ArMkQSa0X4rD9NrrGZaAU4cMJkTXQ1Neykj/SfWbQFA7M+k0MH8b3u7vnP9TkZK/z+c/8
	 qxPJHZdHI5vZUaTg4/XLo6SxGDFlhIfogGtfCb3kpTgrzCv1KyTOnuzzwPPnJ3NCtyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
	b=YOzPZL4lTRMNJwzx7Ik4hRUHY+8Kk3Z1rX19gs81Fio5qyo3O26iAqkJ2+riMGJE9iLa
	 A3Oft1jAZgv8uhzZePD2Vi2an+B5YtZ1y9bpSU5G6IQCxGJUhPXg5E0erpbW4EQOQD4Vv
	 M7wbokOB0UvSlmQKKrTyYhTHybqu8p1EmxciHEifw+VdHxD9ew/MaCbeSYUim2qSTTSxX
	 +7Q7Ner71ylUrDAeDinUpvfJSRui+e1FmPZCRs+TIsXSrgA4dT8MwgCeZBp2eIajD0KB0
	 cFebUd49QxNev1l8GZMFZYLZ7oWKO0IdUeCQoy2MqlesmaG5A+y1Z/t3p1sTUjy+Lyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=moXlNRyb;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87610606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87610606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=moXlNRyb
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b060ec084so2251409f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499626; x=1793104426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=moXlNRybKsi+YYZKq0Q3asEfV3YDzcvB3qfJCX+321IBZRILFIxjIEadmipqFSHNW6
         mJifA2TelhN+sBTDP5WI9GlUnQy2SW/YzBKHUb6HUpKSb8x6VKrfuQUJHCoiVKVVLXm2
         IiQAJM3ytyptTj4gZ/0QHHgNmCnchiWe3re/2gdfXsluwEjhz0JtgwmYo1tGmyxvWw86
         2/zNcbGoIC9bIyhciIlg0+mvF+Rn4KUSeBG2QKkRfu2C2SpQyvSovouxbz9+jc1dJOit
         L2HJYfYuyVN0MpMesXGiqtzfiU5I+bDW4XHBd4WmJUhjvhge3Te8b/hMLJzsMy0d/aYv
         mScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499626; x=1793104426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg+L8Blu5EuqH3+tb0kLb6K4c36LfIR58PtQ8yEr2DU=;
        b=q055VuwQFrIyDAPPVF4qdavZ5jC4PV/fIPQY8tkifVTZkbqItu28xsigcea4fKo0Yd
         x/PvufGZG04tTycZXxwgrh7mVfp0ZohteXLqBdXZJ0lpdD/JGo94JryG54nOPZ6Zopd6
         wmRRL2NYGVtbxGLKrKsXFXx8qY+HrRU58dTGAbjKcibvA8cv6GVMPyZjk0SY5jA9prWW
         zfiLyOJddb41lmISmMCPksYzAjTbmhTQollupLlexOkH/C7KAdScFrP4tPrv5g/PDrfo
         eARFyaZQk+WyfN2xBLvTxPxxs30SnH56nIKmDkxIBRLyqxVKKRUCs2oJ4zJQirQcVnUH
         qSHg==
X-Forwarded-Encrypted: i=1; AKwUvBzu8XFjIGgQkyfgAwatzmYzQkILNXIDa3KCtR2ybi4mQP2FrURXoURs0R6zXC1RJw5MbiWVSmh+8/jei/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvKZkb1KS/uaK3Z9pzEUIdGJMXqdkyLuZobhJ7ZBGK8Wt3MCoF
	89hnR5HAhJbHsDRdEfSMtidojKd/KL8DKb73PjGMLxDe2ofELAVaKEiu
X-Gm-Gg: AYBFou31XfuzsTp2l/Hsabu6EZ3Hu/tfpUU2VjCEtAq7fwQ/iZHI/xJEUdzkdjx3GCU
	Adtcq3UWVsPS27QyLGRf/LB85xIxS3Cu9lxvtWiPw1/Qh7JXKTxLM8l63zlWVWqoQa1Gf/PM66Z
	DuNMlNUGPjto+iNqJI6BmiNxhOVz4PFXe4PiiksIwEBphGJjMN06usOvkQBdiH2YqGUdgbnK/2k
	KJU/C3a3UcO8io+LG4A8mkfMk+WDQQ5Vt5KuLewkdPS/9W0mDYUUCtoXB05xV0jKRso78RAAmcY
	MuL3pa5qOkDxXygtb6ZNVivuQp4sCl0BlhbEU7ILVZDdm1O3dAZwcKLrwEsDCjWe19K6/31uubj
	vdWuzBXiTWohmbOZAI3kE7/X9DoPiA+yKFFyjRia4BrhP/gZov6Kn8iMVEvx6JAUrldPRBePeY4
	x7EiYFmFw9eP9cUn9GPIs6FNzzFkQGorPnP6TGMm7vkIkHmZ1nLRK82/gG/H0jgy6Xssobze3S9
	+5qRuc0psbq66TRlSv6OqNm/rm3gSoERHqz
X-Received: by 2002:a5d:60cc:0:b0:48d:f14a:9177 with SMTP id ffacd0b85a97d-48e07fb9180mr15932300f8f.56.1792499625481;
        Tue, 20 Oct 2026 05:33:45 -0700 (PDT)
Received: from Ubuntu-vm ([154.192.10.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm5981575f8f.54.2026.10.20.05.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:33:44 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH 1/1] staging: greybus: remove unnecessary goto
Date: Tue, 20 Oct 2026 12:33:10 +0000
Message-ID: <20261020123310.5625-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/greybus/loopback.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..284935fded12 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
 	kfree(request);
 	return retval;
 }
-- 
2.53.0

