Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750864;
	b=zjksWqT6JyPsAWuxrjPs4+ZeDdev6bzWys/Gvtn2ah5cZ5OUkC17fj3TTVxYVdCsUpyk
	 Gp0Ffub3WCuALAnBonTdanw8/rPUFSoMJPnGwUwXGMfhx+YtcIJaTXzQpQUPz6YbT0sn3
	 iP8Nq2YnCLFFODwV7mpDVEjufVNzw41wSnYTKiksRHZqVpNDB+YqIEda290u6UICBOo0r
	 x8Lm21qCPp9A1yISoMCdqK2cDWRZAb7JWxwhTtCWeCvCOQ+WH6DHYswaJb52AmNG/EnTh
	 GBkcvd1NQ6LmVT6Bdsw1w3ujrsQQTdx2kvI1fVScKHOFYP26YZ2/x38knNETmmlt9FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CsrjTSaohLD9Nmt6PBYemk3vn4BuWX3SlZNVIUXE+5A=;
	b=hbKLPqZqGj/Qwpo/ifFe0TjJ3ZrX8ZXiWh8FWVzYwUd+FoUXmlMGPwdkTlncY+6xbiQC
	 vJHQDyGa6CuWSRzq5d9ZVCmZLUOnFlmNZkTBVdg+xpV2y/U6DhT1mzU+sTJPxd8UneU4D
	 hXH9mCVlJ80pR/McXDUt0PA91D78qlj9AkTVMwT43fiBHFnHgRLnj3zbR8MuXPLKdvKi4
	 /FU+vJSD1nF9OEgJfMKn3vx8T5Jjei7/gyC2D79xo40xha9JDqRggHfXS4J3khGlcc7Dy
	 YzracoHX+NPXJCrAv5eB1bFhgncgTwyf235VxWAYZclYULvhwocmnPFaV6+qYLYThgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsF1GpYS;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC8606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CC8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsF1GpYS
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2839026c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750863; x=1795355663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsrjTSaohLD9Nmt6PBYemk3vn4BuWX3SlZNVIUXE+5A=;
        b=SsF1GpYSQHDgfOsIioxMFkGxHiTX7v+RDtoKiRb/dnAjcdcEm9BGSa1Pl+p/ds2oxU
         H67gUlUhYqxDsWeGtZLNV5ekk+kNLtzuE0m0iOWQl1mUdvawjzt8Xbrg51FrycW2njQL
         GiWRhssk//y4vFEYbYWU1f1gLGp6rq2tJTIbNXsEnGrp47FTPHHPWvCmVyd1eUhilleq
         fS8Sa9JV4OP20yoOV3F8qEE+dcBlRgaah1EuYhzsaC78z2GtXLdzN661ms2d9SHdHr7u
         rpo1soiGOV6lI2zns+b+Vz9JrDKZUQJaYU1lX5Bc99Vj2PiThh+ASTAK+YJMDmJUepT0
         S7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750863; x=1795355663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsrjTSaohLD9Nmt6PBYemk3vn4BuWX3SlZNVIUXE+5A=;
        b=hXUZNe2uVjl6GTKh94sKiKC+1Ujna9ppbRZwBJqjJgmiftN2lLr5eIgTI58rkBC4C9
         yMKr3z8GeyhtEaZpmNiVcDK2PEW/0ILyMtCeavVFNJ6M6vOOZspoaieWg39U4H9DvWdk
         PrTWXaAdI5HyleBmKvJ0+mMuhk95NlwiTMfFCEfvtpnA8HQ3SEybywhB0sJgcAtjuMLb
         GFv2JcPFLBJ9G8t9z+XqfKroZsn68VgbHD4Wx0FTOIBLCSrSj1s8zsBiFtW83zbH7l8L
         XWAHKip3irTMOo5gY3CaWY2HvScIlGfCFYrqVLj4a9FqsGQTrykYibdfro9dDGbhKCrD
         G17g==
X-Forwarded-Encrypted: i=1; AL+hErGrNcweWLMEafOHwJkhCMq94Pf4a1qjPZJXU2LZnJyltDy+88uyTqMOsX8SLWBU8fo02rOS0P318cMHpVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B2Z6TA+sn/3eJLrfeKVTzrf9HeqGmFFJJ1Bm5Onm5zsBpy/UA
	IXKgk3wi/lh0ue773e2ecoFIA9eAqJdkpsXfAWMULF4u0aYo83OfzpS5
X-Gm-Gg: AYBFou1/K+UqZGK70YY42BlzWQDRufnmPYYIFHOb70vMst1xcxKm2geuiLouThpx83a
	GwrP7M+HG1mOeLBj89byMm1KDMo9Joy/fNjOmKkRc39b1OnvcFTOC1eOyNXWE5hSMchcABNJZbu
	cM+97fweUPSKDr6/CpQIYZCCEYM3gO6d3CCJ+SsGr+BcyUug+VxFiDWPHvQvwd4AePNrU2v18Rz
	mjbmLLgj93FjsLUDE5TFuqnTi7tECBvoKMfrxMaofwbtxHXOoIX2ezt1wNAXJMJ1maEMjunVJoK
	AQZh1JYu0+C5gQz3byfi4BdYka069PrR8ERtQt9473GAbGhxbhjBX1vcIJg1uwLZ/iQeCeYB8Cn
	XLIgZEhYe58TtEapOou0TalJ7YdapPCQYj/P73WTgzIRnnrof+WMudDq3KGiRlhv2d3HDXInL3g
	FK4fsheRLj3HMTEnVpks1Si5BWTcPVvq2hxliwBP8tMpYu09sqf/xAxswW50F/Eamo8oTJNJJui
	tU6KlrooLzM1YhbfIcIpqBtVt4Ksfkzv/O7JGfG/VerhdKnn4hKX6sgK0P14svLyR1vpqIECIcY
	3YfDdNKZ8boIye9NKRlrXgmKvijnNgH6y7OirSPjzoVJMUWsD0M=
X-Received: by 2002:a05:693c:639a:20b0:37b:5343:2dd5 with SMTP id 5a478bee46e88-37b5352798cmr3976818eec.36.1794750863167;
        Sun, 15 Nov 2026 05:54:23 -0800 (PST)
Received: from tarun-lywait.mydebianvm ([49.205.202.171])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm27641709eec.23.2026.11.15.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:54:22 -0800 (PST)
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Subject: [PATCH] staging: octeon: Align function parameters
Date: Sun, 15 Nov 2026 19:24:13 +0530
Message-ID: <20261115135413.13482-1-tarun.k.lywait@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Align the function parameters to the open parantheis and change the parameter "pko_command" to "pko_cmd", so that it doesn't exceed Col 100.

Issue reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9c1968b7e..cc1204e20 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1387,8 +1387,10 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 { }
 
 static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
-		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
+							       u64 queue,
+							       union cvmx_pko_command_word0 pko_cmd,
+							       union cvmx_buf_ptr packet,
+							       enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.47.3

