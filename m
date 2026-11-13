Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532031;
	b=wiSkErpQK1vVCpJsflqhGakfqqyQGBGbnKaHQg93uo2i7Rm0SGkJDIApEl4VdpJdwALq
	 Bsmthk0zuR1Zkq/gSx8I0MqvQNhoO25Do4PBniaN7k0RsgMcqPgNaTcnZ2wa/cf/Ld7fq
	 NlxT6W2mj7Rtza5u/wfxkryGjr65vz/1xKb2eaUfSu7eJtnukMhculNRMipy/7CQs1Zq5
	 i+CbljlGpt0IIaqtHCnqSkBvtajwT9qctZ2Og8rQIuNzOSDAFdrAjecFLd1BjeMI5p80n
	 mj5PRvU27+YOuu5+Z2gRGU8Dp6a5i2ebfK6dbBdMcbpRH9NuUA0iRveA4PlKwXnn2eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wg6WoOBQHQjyYluK4L+0t2kDVevkuffjDXIFvLTMO5w=;
	b=XtGRnBsVZdukmTRbRTD7dya8CzHQGtcTIpYjn1tsuLsHZ5K3fPE5hEP0dzIaJbzgKoBz
	 ipAM6bo0sFuTQGdyy2qRqtmKdSv1eeSk7QnDtyDSCxWMPTulaQ9WdyXmiSMmg55mIw+NU
	 PoDUOBUiV72dw5esWdHxoYl8zmDIWS5Rl6+9dc68CJLxuKWYJd/lvMYYGzHDDLL52Yn20
	 ZUA6qkeAmTd9JZ69vKJl70dLUCHm7nE+7D+dwauU0d0I5BR7UL2l1AYXI2htXrhR4JUtR
	 mEeL0/Vk43ozMh77Qh7H832gH1jUFke31Tlr6NSLJSC1UhYM/GYVBjkgsuEQrpXIj7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPXEfF20;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FDA606A8AA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FDA606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPXEfF20
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adef977ad9so4136271fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532029; x=1795136829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wg6WoOBQHQjyYluK4L+0t2kDVevkuffjDXIFvLTMO5w=;
        b=cPXEfF20llxI5d/9D4GvK+Hfe3KNJCcc/Wlpb+vVT3jd2hxVEH3+iaBD17a2tuS0hj
         UA49lj0e/5Ok8tpkwMgtFy6axX8gjf6/QP7+nHr59jwvT1saT0/IUZeE5NZayETDWUDD
         pWUYtqxASyf61n/zJ/bH3Ze+AB9YmBwApWfmeQLMjrngXafoEXvfiE1u7ewThlU6vYKf
         R/zYBScMOGl22VezzRuuCbdny5p8ZjbXGj1goGYLaLAeErOUqdfwiFjWX8tljlLVNFq1
         3XjqBYdIpvhIf5A3gIV6eY0WO7mfyCfg0iOxqxHPfsIL9KJMJeEazB1x776ZH0whaOcf
         Un+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532029; x=1795136829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wg6WoOBQHQjyYluK4L+0t2kDVevkuffjDXIFvLTMO5w=;
        b=kCrPfwlwHrzlOABJWO6YbZoFUhpKMq99b4r6GlVW0QJaCxgCNl15iQh5kfwlkOxqmy
         xhPGESV7GE1ZD6OkmanRGkz0mfYXzzMPLhbbtGcru/5jzjW/DFaBlKM4MOi3cw1UzAwA
         +CsDmRPBQt4pfOORtu/UAC7IYGDHRPHH2wTEGIIvvO+80jMD1VOPNVzjYCcIyDgFBIYc
         htZF47FoDJubNjcKE0LTJI6xYHabSTs0MuCGW1WGJZZh4uIj58wBHoA1pna+fMZLYNsE
         9Bqr+L5C4Pab2v2rzAU8IRBXb4xgh6WKZsZetOv2BsV0F1uIzLm1Azf1l1FBNFYMv02Y
         HzBQ==
X-Gm-Message-State: APuU4Z92lSoZzECnUoDs/ee4YA3DdxyfOazA0BRj4ZpPzjnl2ZEBa/Gp
	TjV3oKusOkiMuzlc7iDIZf4xHQRhqYg1IOu+12xNcUv1b+ScNmaSXfix
X-Gm-Gg: AYBFou0kRqyM4yjgR2qTqQXiKThtC6Mx5afl5H1HnsRxyqP3uNwWGPss0o+7+E6Q+YT
	cC6Zja2lzoAqn5WVaXsW7RQCzm+Xs816AbEpjqZcwIChkxw4FR8Uto+egtwtKZZ+1eFDz2DgxGA
	Y7Kxj4Q2LUKGzaNtjIzg5q4LvzW925T0Y5+7iDARrll8rcRcjqBorGf3CaKr+VqBJf1sHqoBM3P
	yeTxIlWcaHhTQsYqszvMkQApUQK9Dg0fg0Zis9Lyc0YuIccoyqz73m+7w7lA43pGL1I1OsZwXYT
	4Q6X37TDRXhmevoxgNh7SMOMmKH9vzX2pG3mQZ+JPTX2KucstlzRr7x1eu9MPCH5GQaJKvh7Nxh
	aXafB2nen+Wg+4RmzTvWIL8/IbitK+UnUF9Imxyt0AvHJhYqDeXeCLxhnzXRrwzkKyJ12XuZWmC
	w9b5reTn7CqkKpNTne5BfQ2N7SRrgmbwX544cJsBklG9TxWRSEN4xlRR1oEUpXWUBjpHyrzIyVz
	tU99A27lMDfk5ICrvL1Tu2qIvXn63xIwrOjfa64E6WIVfsyNJExJJ7rZfKlN3bfcYJhomr4ZsZ6
	mOwyopi7kgph5/bQo6sHa4n2tMSP7xQrfrbVcRWplWkFdopexrhkMklo6hlqz86vE8UrbXRG/Ox
	jXd9K+mIw0Cv7zqwkZQKxoTxUVs03nDo/
X-Received: by 2002:a2e:a809:0:b0:3ab:716d:6406 with SMTP id 38308e7fff4ca-3ae2b511123mr3715531fa.17.1794532028747;
        Thu, 12 Nov 2026 17:07:08 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:07 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-openrisc@vger.kernel.org
Subject: [PATCH v2 05/10] openrisc: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:10 +0400
Message-ID: <20261113010631.139191-6-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/openrisc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index 73ffb9fa3..c46899806 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -129,7 +129,7 @@ void show_regs(struct pt_regs *regs)
  * Copy the thread-specific (arch specific) info from the current
  * process to the new one p
  */
-extern asmlinkage void ret_from_fork(void);
+asmlinkage void ret_from_fork(void);
 
 /*
  * copy_thread
-- 
2.56.1

