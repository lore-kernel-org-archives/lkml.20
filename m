Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140540;
	b=4mNgmyqqfKdAlu9AfLkjpdEOoZE8aL3Pgi8fqeZTUD3yZet47JsF4m/CDWOl8lj6luQd
	 jtkwiDGg2uilY5xaPRZiSUlwzJFAzDjQIKGmrcqmJz3oE/L2bw0crLaMewQ8t6dQ/A7dp
	 q+KDjYvYpSJRdRlvqq33jfDpKec5cdim1kbSG6Zz2/3qkvoyCbcKFgX0S6NFtH8wIIOVi
	 8zXD5eeZAiHxFKKuSyqeZmJW9xJknKt6Xb4nHHOMvoUrwdnfkG/lHQUGbiajJI52FqCoM
	 HZUStsdPRDhONsWrZ/q7d5uIqW6imGTWH/8xwWkuC2+ODiYxB5QN7EIo/oKpsfKFcoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140540;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hlwDfAWixxLMJCq47/jSDrmTm/cfckcxssqkHPbjDEA=;
	b=kg7k8jOlCHHoDkbO2KHCBhpXVQicGHoj02llA2s/poEkabGFAbNYiOblVBIIUiFdZ8Zd
	 eug4H/FAWn3hXQc5CiWYNSUVn4Fukv8CjBT6rXTTr2jAgapQrRKEpwnvXCkl1yUNR21BZ
	 HJcdI3p7eDlistQwv21aa/upwKDoKdaD2Akq620SDPpORopp8oldMQ4G25Oi1qVU2vseS
	 tX55F9be3YRL8Mcst49Cg08IkNtoqPCKyWob413xlcBWGyyYBOXhdQ2SS6I+pbDs2GW7j
	 vMZAMD/D/igg/gIDr9KOlaYW4yeDQ+j9iZjf4DEW8gJmWwUemkr6DUpa1ixL4n5ZVrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sr8Gt4td;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F24606A31C;
	Sun,  8 Nov 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sr8Gt4td
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794140539;
	b=kWl3meqhVBD3hOywCf6gxr9DoYc1eOFD5sLBRgvnuEWKNqYfqi7oxyRyezeMA7JAGi5P
	 N9dDgh/oHkCUCW/IXkBGvIWCQvqWhMaqplsnxLzQkPOFjjETFQL75Boo1szwEZvgCv797
	 O7ouD2GQfu24Si5Q2qOQPMJyyASS9+Vb9cpI/s9HZXG8sEht1mEqL01yB6C9hY6vWobjr
	 pJuP9vLpEl+t5J9keHcjeXVzNRy6uVi+FkkkP1HbS3k0v7eiOg26+FmIw8e3hGe+V1Av8
	 fP9ZB4xmkHjdoDa9fbwzAQrdedI2tEiXRAepGhlvko1kx7BQ+q/5XxOw/uq2lBCHYgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794140539;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hlwDfAWixxLMJCq47/jSDrmTm/cfckcxssqkHPbjDEA=;
	b=kMwyFpCo+0x/Jlu7CQdeBsij61KjFx5hYfriddeJ3B9f3BufaVFgqh53Z5UeufMscADi
	 MBnQh+797KLjG/36topHrLYxJNfU8BQXu4YsO/Ig/B/Gm0Ggk2KnsN8Bdj3pwE/Y9p7O0
	 Bz7KVm4/gv5ByI1cRwF49z/r4n1hcIYLz2t/LZYC/agXaKoPIK0EB2ZEy9sjMSTiHDMf4
	 /JR1IECuRDLpJyicqKpqtuYeT3K9O1w3uTJ8k5L0lZHtmXucrcrTLNp3XgHqg/HoG2L07
	 1CzP7oVukK4HCsXtbNwYD0yjFvHUCVh7tqangwwao5/fPV7C/JYB6JoFBbcgRvgjtTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 333151F0089F;
	Sun,  8 Nov 2026 12:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794140539;
	bh=hlwDfAWixxLMJCq47/jSDrmTm/cfckcxssqkHPbjDEA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Sr8Gt4tdn0hLH03YD7ht00AszNrTOtCEjy/MRz+fTYJ0QnEdUFOj/3oUx7RmNS0dG
	 o9gBe9/9DdYd/WJncE1iNiF3XGJgW9MvFUJPTzRczZMVXLgOL5BHFnCp2sQpKWU/4X
	 On8Y5U7BRI0h1goXXSiY62Du/sksjzDtH3Df1F9l7sR9geX9638wH/1cadAGgFdbxp
	 VtCYMgIA3MIujTBWUXTFxinSChni4VI838b/ElWWLqzGsX+GztnhSOEujP8O60idTe
	 rXBsf04xlz/81DRnT1/+MLL4Sv+VQt3Dg9EbuwQoK2lgYf1VNmQuh16mer9nC0ki3u
	 RIST+q3c/pMCA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2D8147F4A;
	Sun,  8 Nov 2026 12:22:18 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 06:22:17 -0600
Subject: [PATCH] staging: octeon: fix parameter alignment in octeon-stubs.h
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
Message-Id: <20261108-octeon-stubs-alignment-v1-v1-1-bafda8c63890@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBG4auQWTsJ7aKgVzEuaPnFSXRqOoWYE
 O5uw/JbvLeToQiMbt1OBZuYZG1wl47Sa9IFLHMz+d4H5/qRc6rIylbXaDy9ZdEPtPLmGCmMVz9
 jiDFQ678FT/md7/vjOP5Fy77AawAAAA==
X-Change-ID: 20261108-octeon-stubs-alignment-v1-ec6892de7bb6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794140538; l=1698;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=JhZbbg8mmsWsZGrss6itWiBifitqXmu5fPEs6ExXPGM=;
 b=97IOllAc7FI5DXvg50t2Si1YgrP1oxIp9SGhWaB+djwiNnLE767P5ojNp74IlZ/XEUI4/CYLr
 pkRoZ5zUHHIDU7VRKtf4uQxGZbPBwf8x4moO5h1IJQrLh4YvCiCoKL6
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Wrap cvmx_pko_send_packet_finish() declaration to align parameters
with the opening parenthesis while keeping line lengths within limits.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
This patch improves human readability and code style consistency across the 
stub declarations of the Cavium Octeon network driver.

1. Wrap and properly indent cvmx_pko_send_packet_finish() parameters to 
   align cleanly with the function's opening parenthesis.

Oscar Alejandro Sánchez Lucero (1):
  staging: octeon: fix parameter alignment in octeon-stubs.h
---
 drivers/staging/octeon/octeon-stubs.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e2d1..7fcafabdc78b 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1386,9 +1386,11 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 						enum cvmx_pko_lock use_locking)
 { }
 
-static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
-		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
+static inline enum cvmx_pko_status
+cvmx_pko_send_packet_finish(u64 port, u64 queue,
+			    union cvmx_pko_command_word0 pko_command,
+			    union cvmx_buf_ptr packet,
+			    enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-octeon-stubs-alignment-v1-ec6892de7bb6

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


