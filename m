Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826549;
	b=1M2aCgstluf2XP2uD94D0OiqssQclT1qQCVmV8nzEBTfcM/EfzKLSM+EHgIaT71JSB6P
	 xmonkr5f5g9cTkYhC3anV/EyOJsb50z7rhzbbl+212fgdDsKwvTPlJoQ0snDf8ZeiyHKJ
	 9qjwrudBx94TGOFIcz8Mp/oWTJ+OqkAyJ9A7S0MtRzhxB8jYt6/HxvGkR2aZeRahOw1A9
	 w+kLdx9Pi0MmtaepqcDgh4ilazLzrMYHhO25yamusjgQD1S5LzwZffcU02fqFaYIO+0od
	 ufjXJSNvtJswwtJ3WRrtALrff4wHbB4uMzkfIH1fxU9OO+wpnbWhasEceY9XV4OTG0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KSffZYDq62GP7tnRprhjIEMyyX/StOyoMuUB9ic+kKo=;
	b=kVSjUxvqrsp5QoVN6Ggz9NhB4I3kaNObV9aYLZLLDWMU5JcY3r7SjFLjGtT6PNe4rqQz
	 QHt8bP5HUr4xJgV1OiEtRdKFeYOjTV8/1NgzsBoXJMJz0kZwLW3mqQ0hxJX25+dWnIK84
	 raR3fD7HGA20bS3sKcAd2jV5VgHh/za/t3Fv94K2YGO69rCe1rJ/iDSGFNbMFyg/YNmbT
	 U4xBKRU/yVVclvyfE7pDjgD9fwopEpKoyU6DsT+pRAAwv3wimuq53jdmR01CU6Zr5U5VL
	 j/Jf+igEj0E8jXtmmIJlTaEao99cRRlNr0eD5hbsLUmmndGtFEKavGy3sLMmmn6iJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHieJn1h;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19E60A16F4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF19E60A16F4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHieJn1h
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7263405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826547; x=1794431347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSffZYDq62GP7tnRprhjIEMyyX/StOyoMuUB9ic+kKo=;
        b=PHieJn1h9CDxFIUEuSOfcKfnu93q/RQyKGNzAHGbgtTp7cd4pW6mfHqWIjMfE1u546
         UAIkFsE2uDf9ZX7mmVdnFNKLhIEWQamCDDH6Q7ddinEkDbXlMbvjmgWcTCqCEt7dBxok
         gD3jkzNt5sSiHocdHA/Q4UOhraMvQdfRSDdDBAFjf1G9cBk3pxdqP716Tx37ie0uYRLN
         3uqe6dTYMGooJAnVQYWTUrgg4j0WzG23/PihD5Rdc/En7Y9PjTUvfTemU8TeqLT8Ozm+
         /EDYVFkMcvRzL60yzyUVYRk4KryaPsnxuHeEBPsElqQuzRzUVT5rv+o3q4QFbvUuWd29
         Mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826547; x=1794431347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSffZYDq62GP7tnRprhjIEMyyX/StOyoMuUB9ic+kKo=;
        b=A8Mcb0aD5fd1KBU6hcud8vLuyz+P3wMTI4b/7hYLCrAGML2SsNQz9Tgoq4Ztv2578p
         bM4VRViQrKpgZ4BjN05t/Pa3d7MmXm2IoVV0y1RYg4zfc/Zwjz69K3T1mlrrLeeUGijo
         hODN2hoG1lPiD9qXU79TcItNiQWaujxrwroZ72SiOQsmCIZ4Uz8Wex3JzVh3Uz+GCWYq
         FTSFQSe039LrVd0KLh8ryvZ4M7pqxTB0HkzNlzRhv5Vqlytnk0i+W3LekR7CtL+negSs
         A+N/awjc+NYi6Ar5AGkhlI5oCanUGhK/siVcU9skr3H5xkzl9Qy4HZmfXeS+EtQqim5O
         576g==
X-Forwarded-Encrypted: i=1; AKwUvBwG1gFzZ1PEcNVPjmtDU8PcXWJ2OuNCXoQBaWl16c32AKx7hbQ6fhSfO4Ousc1l7iTqQb2D51ImZGzfv8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nr+vyJ3NnfAjd1j9xGUB5XpN3J94mbbu//KOHdD/nerm8mJw4
	bOqjeJqJMHf9SHWz9rgvy7u3VOOk5WK64ORw2+N0fZMCvUYcBEEnbAiN
X-Gm-Gg: AYBFou2szXtEmkyng3EJ2z/bz2Paufb5A/Q5zaR42U4l9eQTFLjB/um/1DVYe+3udxU
	WFEk/zRC24AjTpVJt30NePy4Xw+NR+5actJUkeo29WRySIWEKnL6HR80Dbzez+swctSZTkw3cZl
	PlYnO+1eaBXN4e/d9A2B3aTvsSpLzz2RGo8sk1D4IMZ9RCgM8wDM97zQD3Eg/TwG7TVJd11Vebr
	JZxRs5ACKBYU/hKL85WggLmQUkYtPNDOZvyCbFHX5D+UpIms8BuFFPeM8DJauLjOSPqX3QSPMr6
	hbCUdyCnZqkKkjBKCN0YuBtmWWN4xBDUmKY+yLn/oTOButcrFdx7Ry9kjImezIzIF6PIaYTpNCh
	kc2zDdlUFdW89xA8oDWPFkfd5uY5BpcesDtdycr+zYyjMOtlwnIn52pKIKsc9dFcwv9RKTFtkIP
	QKJHZl7Efo36aUOugL/fAFceZU/80RDE2SASm4HnVLGpXTKOUX3WvNmKSpI+NJaKUzpFyV35Msi
	L0EgFYedY+9C9fZeNpwT/Ec9/LKtjTuLh3QIAKQhxwS2FdrsEAfxNfO6S+pqHmUupOmxK1GXbC6
	bzXjR0k/6aVhayFeFYS1A+Oz3vPkHJPQKrwIYzKyW4cMhjgNfI/aQ744I6ioPFfeMYnIJg1L4yG
	+
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr384799355e9.26.1793826547408;
        Wed, 04 Nov 2026 13:09:07 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm55148665e9.1.2026.11.04.13.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:07 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:54 +0100
Subject: [PATCH v2 08/27] selftests/landlock: Handle a missing control
 message in recv_fd()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-8-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

CMSG_FIRSTHDR() returns NULL when recvmsg(2) did not receive any
ancillary data, e.g. when the peer closed the socket without sending an
FD.  recv_fd() dereferences the result unconditionally and crashes
instead of returning an error.

Return -EIO in that case.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index e29406900c04..6c2aa913ff11 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -171,7 +171,7 @@ static int __maybe_unused recv_fd(int usock)
 		return -errno;
 
 	cmsg = CMSG_FIRSTHDR(&msg);
-	if (cmsg->cmsg_len != CMSG_LEN(sizeof(fd_rx)))
+	if (!cmsg || cmsg->cmsg_len != CMSG_LEN(sizeof(fd_rx)))
 		return -EIO;
 
 	memcpy(&fd_rx, CMSG_DATA(cmsg), sizeof(fd_rx));

-- 
2.56.0

