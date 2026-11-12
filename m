Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482213;
	b=3Vd6uhbSoPuI822VYCPCO4ksecLBD1yX7L6EwGS3Os9jk36tnf+w4TgO2OK7ScpRoL2v
	 1TuUein9t9zWvLpXNjMzabZjjVJ7P9tilEU9p8TgaIqNJtKnz+QToyhiYnZFWIYWzLzk/
	 sykkuKH/Tg6N6wQhTchNKmxAXMZ5ycBFYW2AHX+0vTp2n/pGvwdvL4fgEx2OPin2dy72S
	 o3hJJsdUXjlXjo81bx1wpPrJInXqZkso7l7UBs4mijOgUXpH/Ty1m6dr0Bbxj8gh1t8kH
	 MuXMBXs7WJZPOQGOPaD0NjiJrm2sflLJnh2bQWofurh6GoJf6XjpXPo0mHiEgQPwneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CWU2vsXjhQLUV7+EejFdv1HbsrszlavQIA5htXshp0Q=;
	b=e6DA6s4Dtjz1W5vFHHgaWBUSCBCVVub9McIEykmt+SD7hoMieVg6B7OfGlAlVrUvXl/r
	 LGl2f7byusVUOA+y2Fiv7xpt/VQBC0g/Twpdycg0spa1efR9GnLYlmQFv1ontzV2+JI4Y
	 xErPCtvbaCEECo2eUO65QNq5juDfdroutI2NxoVn06HOIJOSZ83uWQlBnqJFUvn5LL0ic
	 wPib2zEbyCytXHjqeX4VTjx2zcM6DbQQEEnyeDvpM30EptLjhgzx7maMMCZkiSioF8aWF
	 6J4RTccOTK7716PNYR1d6XBNdQTuzBqBVyINdIbKgTZwOY+JqO6w5FAhgJoF17noTVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6Ax5ZCp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE67606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE67606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6Ax5ZCp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so34856015e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794482211; x=1795087011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWU2vsXjhQLUV7+EejFdv1HbsrszlavQIA5htXshp0Q=;
        b=b6Ax5ZCpAV4B8xdNDZ3RpEpa+f36xdvmSa51GnfoTRnLjn6WBeMPdDNgu1PTeAL1q1
         Eu+kZTi2XfCcqWV5kkVN8+//JqlJw6UhXV8cMk6TXLnQzbtI0A+Hu3p8Op3r2ykWKBtf
         /8V2Ii6fblkEkGNiE0ZoE06oMtsJSQQqt5XbhndJruw5eV/WaBSsqExMyNxlEV4Pghnl
         ckYv7TW4mxTBLFNnztBqXcwuP5whZr9hJ5kLh2qLI9qVpkQMH5Fi2yPS5it8oCZComXQ
         OYllba5gW105m428aZBrf5cL+1k+y1YJmzglU6wETkW695Va78i8Eu35yH5VPjGbWUrq
         ahsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482211; x=1795087011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CWU2vsXjhQLUV7+EejFdv1HbsrszlavQIA5htXshp0Q=;
        b=gTq1+jwMT6G6pabKyVFXiZNSAot+EhrHg/PCeJEt7h3rSx1x9FAiI5UQ4UAnPgHp8E
         fO3JsBGH0HEhCrm0kClQHoa5Qs/vl30pLcphqxpQ4ZOtM/6sEx/HBPaiPix/2quTFrPp
         NZltYVAGGHA6dCgtt44J60fPO0Hqc2mSZkZ63q8QIxmwF//ubR17QP3sHEB6Z+Xf6XD0
         38M6WE++JcSMiBInCSOkpl4d6hvrdh63f0U1kHMtaC44iw96IbE1WTBQ4MW3sSliovnN
         GEBsjPT31KIaLCrQVP1XFJUXUQacdMhawrMwhA2J8jbuN7eecBXZ821+knfNowvkK4QL
         d29Q==
X-Forwarded-Encrypted: i=1; AL+hErENI35hs6NDalreMR/c2GfArOYz62cQdRvaMNUds7KnuR5OZeybWNMG7dCZ7S0ktvD5DcHcD0Z3V/5QnUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BIiFAfkkQE6ovk3ZdSnYsgYF7St3VtpfphaIMyhTufRKuL/5h
	wIHEDlda7bP9wFselmpE8LLHdUxfT3J6sgKr+1IAQgfz7v3A1wLVdlc5
X-Gm-Gg: AYBFou1oF/pkkx1eqmWmLGsZwgpe+VygVXQiIOqZQeVxg3BWC5LACktQaKkoGMWcteo
	kfjGQm74IVHKBpR4B5M+wFz2gDz0Y+v53+LL41vudorXlzvDZnNVkJZoN6ZbtWopCQDYx5HMMPq
	50VujSS2Qrd7zeH1g/ZBwaX4Do/H7Gyq7D+h4tXsPFvX/2sTxCayleRbzUghO9qgX/FVq72Qy8w
	bjV/Q4MXrzfiq07XmC5JeXRM5v+1CQsAUEtRR0nsyjEOMxaLPsoR6EPSrHr/Ol93fNF8+9H1Ufc
	Y0TimiMfi/5SlU+Lz55WQ7zQYBWXi/Ng8j6dJ2OYwgYWsIo642lU5yh8I3AV7RM48+S4EZFxHEa
	DNuS3t3PUaq9WuSoy1oGgL6ctrW0t9jncxEa6rLHYmsW4C9Y2HSNx4P86qnICXCh3htH6zbE+/6
	IYDjR/1td+0C57L6EOFzJX6H+OFbrSg+wsKs+iPINBjiuYrowp6DMLQ/LzP6XL8NnO0IAoM3T1H
	9NkgoUM+YByhhULX5ZJV6phDkXs4xn3A/gvpqZJzbvOYx2mFkwSpNypTQtHT/nDwLrq9kCCnyIk
	yyKYDq7e8u/HVKE/u1/mrn8X/EkreULevB1YDTbStCjS5xg=
X-Received: by 2002:a05:600c:5246:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4ba09381133mr96434635e9.8.1794482211259;
        Thu, 12 Nov 2026 03:16:51 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm59120225e9.11.2026.11.12.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:16:49 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] cifs: fix negative timestamps being read from smb
Date: Thu, 12 Nov 2026 12:16:37 +0100
Message-ID: <20261112111637.184045-2-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112111637.184045-1-koray.fra@gmail.com>
References: <20261112111637.184045-1-koray.fra@gmail.com>
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

When reading a timestamp before epoch 0, cifs converts it from NT format
to Unix format without normalizing it, leading to the nanoseconds field
to be used as a negative number, which leads to a garbled stat command
output.

This bug also violates a struct timespec64 invariant, as documented in
the set_normalized_timespec64() kernel-doc:
[...]
 * Note: The tv_nsec part is always in the range of 0 <= tv_nsec < NSEC_PER_SEC.
 * For negative values only the tv_sec field is negative !
 */

Reproducer, with /tmp as the local filesystem folder exported as [test]
in ksmbd.conf and /mnt as the smb folder mounted with mount -t cifs:

  mount -t cifs //127.0.0.1/test /mnt -o username=user,password=pass
  touch -d "1969-07-20 20:17:40.123456789" /tmp/test.txt
  stat -c "Server local (/tmp):   %y" /tmp/test.txt
  stat -c "CIFS client  (/mnt):   %y" /mnt/test.txt --cached=never
  smbclient //127.0.0.1/test -U user%pass -c "allinfo test.txt"

which prints (stat output is garbled because of negative value):

  Server local (/tmp):   1969-07-20 20:17:40.123456789 +0000
  CIFS client  (/mnt):   1969-07-20 20:17:41.()*+,--00 +0000
  altname: TESTT~K6.TXT
  [...]
  access_time:    Sun Jul 20 20:17:40 1969 UTC
  write_time:     Sun Jul 20 20:17:40 1969 UTC
  [...]

Fix this by using set_normalized_timespec64() in cifs_NTtimeToUnix().

Fixes: 2ae83bf93882 ("[CIFS] Fix setting time before epoch (negative time values)")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.3
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Yet another small fix I found while implementing ptime[1].
(Still not the last one :c)

Thanks.

[1]: https://lore.kernel.org/all/20261101015551.786044-1-koray.fra@gmail.com/T/#t

 fs/smb/client/netmisc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/smb/client/netmisc.c b/fs/smb/client/netmisc.c
index cf737ede1ab3..033ca8f7e151 100644
--- a/fs/smb/client/netmisc.c
+++ b/fs/smb/client/netmisc.c
@@ -133,8 +133,7 @@ cifs_NTtimeToUnix(__le64 ntutc)
 	if (t < 0) {
 		abs_t = -t;
 		ts.tv_nsec = (time64_t)(do_div(abs_t, 10000000) * 100);
-		ts.tv_nsec = -ts.tv_nsec;
-		ts.tv_sec = -abs_t;
+		set_normalized_timespec64(&ts, -abs_t, -ts.tv_nsec);
 	} else {
 		abs_t = t;
 		ts.tv_nsec = (time64_t)do_div(abs_t, 10000000) * 100;

base-commit: f4692d0e3b5e16d32d4ec7b1e0e58d7dbe74aaf4
-- 
2.56.0

