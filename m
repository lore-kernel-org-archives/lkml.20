Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792777844;
	b=pSY9vnyJcG7MVdfm9LsysGO+WvVIPz4riFOCpy/85j89rPz4gvM9Q1NeUJ0e2luVkX8c
	 d/cTuk2GaY5YEuXVlqaE+expCBd0vVX1j7R0gj8cGx4vLobc6NdMCTpfEjFlugn3u87zR
	 yxjQgiJVYiQHZGeF3YGqSuAAp4h8Rc5bor9T+SJCaaOnXZWVNm+AtSIbO4e9ZfZB76UG/
	 Z2l8RF/XhrJQvcpdZTyeyl/ICzWa5azuhOZak3GeF+H3e08bMkcWii3y9dbfyXlerQmQz
	 dXPb7qt/FAUu5zltOT9fdtb6+LUiOWmPTdZy39JRxpGj8wxgDhkv1WLdunhO2YqLfoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777844;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meBRCLrwDaxtspgAamwB33hzav8w5yaWIMRhgDTGTsA=;
	b=tDiqVdhq1BlGrEKlEhyYqDiEGvKtB0jX/pKtxuJk78A1hIYGP8M7JMz9og6aWATCRKEr
	 +yKd/J7V6/yswn4X13ymUZSTvgA+JW+x/f2Ozrd9m/3xF4bX5d7gCx6fH667N0HmqegVM
	 9wmDQgaAj7IML/uPaHH15u2M/siWrY1g1zfO637HYDPk1jsGab6g3WJ8GNc7E65wcGB2T
	 nUD9eVHwytC5XmBjn7Q3zQDSwsSB0X4fINv0tRUwFjGX0x0VBaQWNSSKgO/8Pd9HeNz3M
	 iHWatbhcB9RaO0mYxbxwSbZ35Pry3GTZR3ub0iqeord83yJv4ITJhAPGMAb+ftrRtsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OybFi93o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52370606A31F;
	Fri, 23 Oct 2026 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OybFi93o
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792777843;
	b=xriVuTDv+8mX+qvh+yHbzm26FEUPhTmzZOZnrlooNDuMCAKu7qW/eoO5GIGDytUESZez
	 kjKPbO5f7PbAsD+VVxWnQZRQ0zzA30kpcM/jrEXvA/ASEmbrhbEEqLUAAWDqDj/pBY4qM
	 PIaCxTAOJVztakR/XbTM77lVOo22Jex/ZU0NepqkRuSgaLKqoT/708Q82UYBMA9BrearU
	 k24e6uaeiKrA1QKiF8cQLx6sMa1fwlJj24GvmI2OuR0lNetvDZYtcGMt8/1gBLx4z/m3M
	 afzOGhHfL4ZWKu7CbW4ZuPhKUp54RmfYKJf0azNGgACZZjH6qUj7sZCRwfVtZd8DX/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792777843;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meBRCLrwDaxtspgAamwB33hzav8w5yaWIMRhgDTGTsA=;
	b=gDHKmd4Y1b3jaOxGVnVWnKxoB+MWpMdu2zP8/tVVkgPawF389yu5M+PScwdWvPz8kKzF
	 0NV1VjeOMqC5TvGcXfISm+1VQB62/JuE3+5lM/mSblUxtwgAsEx1p6r3AiUdEiL8gRMYm
	 FLgbUV80uz+71OFBoD0U141eEFLzLqBNbi26aIGPkWztK045LXOKqjoa6cD2mAfaHy5Wr
	 2diawbVCBhvMGq1vpCjBLEoXqe87WTkAk2Itx4NrMhQTqshRw28tY/SDUUOLWernY83x3
	 a08rsNGFxf2w+FZpSeHSbloSW9REKgFhcW8GZ7hOrIKvdl4GNOtHBVnsac0m0oVS7MQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F6B01F01825;
	Fri, 23 Oct 2026 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792777843;
	bh=meBRCLrwDaxtspgAamwB33hzav8w5yaWIMRhgDTGTsA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OybFi93olWUQw/1/Z1JToW+nm3c9XKX6mzBRWeB8M5YPRM5X9ndf4LwFgbXjEA1IW
	 N8UQgWokNwOqmPwa/QkbeS8sRGr3lM7+roR+S7zZzorzc1C3ERf32OPR0Nq2ldFSgc
	 2vlmRLFmXBW+tySf3v95iRHwAkIclT2j9pa1NYHopI+HzJzCKW8zzgrN4b8rPl3XJ1
	 1qvW+SEnnbdh/L3bPGNZuYppKvj99Nm598bTAQRx7PAyHBHRITFjACt9633Y3xF1QN
	 HHpAdZeyWQYluIkkl/wR2gzv04yJAawaNjafd18F1ExQnmvxBmuUDOK3GYzvGVj5J+
	 boRECBQ+6p34Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F0A9D445B0;
	Fri, 23 Oct 2026 17:50:42 +0000 (UTC)
From: Atanas Kunchev via B4 Relay <devnull+atanaskunchev.proton.me@kernel.org>
Date: Fri, 23 Oct 2026 20:50:46 +0300
Subject: [PATCH] binfmt_misc: fix typo in "auxiliary vector"
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
Message-Id: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNj3aTMvLTcEt2SyoJ83aQ0CwNjA4tUI+NEAyWgjoKi1LTMCrBp0bG
 1tQAdmKLbXQAAAA==
X-Change-ID: 20261023-binfmt-typo-bf80308e23a0
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Atanas Kunchev <atanaskunchev@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792777850; l=1335;
 i=atanaskunchev@proton.me; h=from:subject:message-id;
 bh=2pX207vjhqtmwxK8nx0gyejv0Uothbk71WYMMlsUqzE=;
 b=i+SyRbqcik8GaT3nZQP2XAj+MD0WuTUYKk0+RqJXTY1hmJRh3SVhNMZVhmwU6sfTZE4EWoxjC
 SPZqpebrdTsDyccHoSkYYW+NhTYP+yBCsPr7XWkTpW8az2jyHj2eFRx
X-Developer-Key: i=atanaskunchev@proton.me; a=ed25519;
 pk=UZOV7XzSdjoak/BahXi4m/UsbdgtIb1vQI3+u1lAHOc=
X-Endpoint-Received: by B4 Relay for atanaskunchev@proton.me/default with
 auth_id=1293
X-Original-From: Atanas Kunchev <atanaskunchev@proton.me>
Reply-To: atanaskunchev@proton.me
Content-Transfer-Encoding: 7bit

From: Atanas Kunchev <atanaskunchev@proton.me>

Fix "auxilary" -> "auxiliary".

Signed-off-by: Atanas Kunchev <atanaskunchev@proton.me>
---
Fix a spelling mistake in the binfmt_misc documentation.
---
 Documentation/admin-guide/binfmt-misc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
index 9e84b877d06d..e37668371453 100644
--- a/Documentation/admin-guide/binfmt-misc.rst
+++ b/Documentation/admin-guide/binfmt-misc.rst
@@ -73,7 +73,7 @@ Here is what the fields mean:
 	    Legacy behavior of binfmt_misc is to pass the full path
             of the binary to the interpreter as an argument. When this flag is
             included, binfmt_misc will open the file for reading and pass its
-            descriptor into the auxilary vector with the key "AT_EXECFD", thus
+            descriptor into the auxiliary vector with the key "AT_EXECFD", thus
             allowing the interpreter to execute non-readable binaries. This
             feature should be used with care - the interpreter has to be trusted
             not to emit the contents of the non-readable binary.

---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261023-binfmt-typo-bf80308e23a0

Best regards,
-- 
Atanas Kunchev <atanaskunchev@proton.me>


