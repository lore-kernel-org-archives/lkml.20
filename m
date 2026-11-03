Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686302;
	b=IyYmaTLAWcqEa7yCYyNEOWXJdvTF1OSdAwP1Yn5G8cAwGqH8FmqF1kNr/GlH8iY5DZuR
	 MYE9yVdfNGoLq0C6xFkdAKbrFy7q9RjvsUJ1+Pwd0GMKvLiwpSaagLhRAusX9fq+cbFtz
	 Bxp3jbc+4Qcz6CB2n2s90SClMByMpNcC3wIqaAYcVYua1Rv7XrvOlU3JBa/8NSOptoYHl
	 ELe43ztlXHlV/ZwQTc5XErBaLSDwKdlO9ijzp/swvqw9gUnaRVeeE8JVJctSWHBXb20eQ
	 1ZcmL1NBuXiMglirqTpMNTQ0pOs7IqUGACGJmKTgf6ZnUaU/ffXABklAVMg0h9WIMHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BYXUCwkPXhE2WOYZgJcFT+Ca8H8+sCFYPzL9CHP8/xA=;
	b=1x4VyYYEcaDn6Bj5uPLlZ+/YQvw/AuCFZqXE5eLuY7DHLrfsoOFcpO7BaGtFHEPRMwIj
	 w4noT6JOapstlC9XXOgYb/G8vGfMPouUq2RhUnYj8pzObal4ouKyP3YgVOTKtg8jGe1wp
	 HfDW1WNsZldzQvERa7jGu/kOTM6q7v3Oa01rUXlQMBHP4ezOj3pMJq1w92P/N/8gz//PM
	 3rtzkrBgwyKtPXJpdIGcnXXo2dS4FoVA0ftw+wSuizNlPT/sHjIDhgLUCB7ECAnJpEzal
	 3UfFip3kqCzkahkwTpBDgKhjSn+coFcwCyMvqNN5nh3Z6/PAU/gROKqSmkqCfVVsZyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdWGRSa+;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7EF606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA7EF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdWGRSa+
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd693e0942bso731452a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686301; x=1794291101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYXUCwkPXhE2WOYZgJcFT+Ca8H8+sCFYPzL9CHP8/xA=;
        b=wdWGRSa+d1G7wMGWQ3kVcsIu8QnaPYbLH27zMi7SmQORKsqMByHfw9zsaEQ1OSacQk
         Fx4Tu1yYv1cbAjyujStyK3RGbUjkIEZ49iKCbT4OjDgqcOwO7vYiB4V0e8etoUsRVWJj
         LMvyDtUG553U05EayY0Irf6g40naNT34PZT4qt5H9geoHSqZOWMc959vwuEGRm7gd0fO
         EoZ/mSV/OmdqSsfV98mcA9g64VAKXyOy6QpfsDUWAs9km6x/nVaMxUQb5KZFQYh7wzxo
         16BJQqKYVYN15LGVtoZ1zQSj/oUdpYtDxLeYnSwCXbD1SVS22wClSgRNETan+n618/SZ
         WR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686301; x=1794291101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYXUCwkPXhE2WOYZgJcFT+Ca8H8+sCFYPzL9CHP8/xA=;
        b=ApCWdk2vkgFBvhx0ejBxtQHjGrVXYupcdnl9i73ujkKHPt2RqgoAJAn10xtO4AktQC
         AOM5dTejeHz1R4MP8Ajsj54/D4u4lgeui+TQ0AeTASDF6tdqWPfdopWKIDhBLNiul3M2
         uVWhpQ4kw0NTxARKPWoS5vz94fvsGbKw+/jzYp3GaICOtKQgB5j7e+UXs6/r09iHcWN8
         1BmzqFEe5YljV6v6QqQPTcYf4qwkdaFeIjT4hmsoSKfuZCwM8Rbaji5UU7kCQp3FtzwB
         bFQLcITfSPdowf28bVH1ZS6dkNunEtAjVxJma/HV9vRCQO/t3Geo7KrjZtlL75/pRaTD
         bNcw==
X-Forwarded-Encrypted: i=1; AKwUvBxA0QFtShzwvvw28TJYa4RZbeXlnt4+H+sKsaG8wcu9YNjNKfdoT3j1t3qECMK/xAcvR7yWeE7sAM4J+Gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DGnMy3BbOrlVc2V/rmssxuw+3kKDukrRw5VUAMwXZu8GpaWu7
	Zqa2o2QsSFseQdMZGdSXBbr9si61+dm6AuNOuwZxej1spQtLsijmonT0
X-Gm-Gg: AYBFou0UaQWsQcQONQFLzjPsC4TVBma/YD/fyWPUKlk3zT0n+2JcIQyNPf0103k7VoM
	5emOvvLvn5g7eD3zxnBrokifwxp9qDpzmsA6v+rzVtTLgSvn/OyWlVnj1mkifts/9B5gnPxCDsX
	YK8yxh5XaB/fGMr3bn+AdUj42cKljLq5EjYkuyLX++914qA0NdMfhTr5qZEIBaXvOMIscqVlreV
	UJY6HbCgxH64ADNg/TnSQLnWBmkvh/v3cEucdWinCBzvRJspxROvGGpDD9/uQU1VAkazokNfFhQ
	0pHZcJ9iFnoA9SrcorihKTgpHpF1U9XZwjb4HmuS6QLc9NXIkhSoB46zSYBtNIL+ulMvFqNcbbf
	0hVfGEo5XXsj28JudBucQvbq2bybAGCVy+mkD3Hp0qjtMS93R7J4YlUpFak2c4A4MS2nisgOgmo
	cn18eQwORajT9QuPidyW9+U6IWTw7Cq6TCe7ZnDhO3HKcVbBr30xJk6o+3u+AS4E1fQgszuEuDo
	hHKOaLvBOAi6kKPsUAIWfmX/38W13q7Jg5AdPsew16+zjrz7wpWxP9DR+ulHaF3YRrFr37VyLMG
	L6AhsxUSPJ7QwF/pORGfDSyPBZhRjQth34E14bP1sruroypR2B5NDrUF
X-Received: by 2002:a05:6a21:a101:b0:3e2:a9cc:3ecd with SMTP id adf61e73a8af0-3e928aaf420mr8144984637.7.1793686301096;
        Mon, 02 Nov 2026 22:11:41 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb363a62e3sm748229a12.4.2026.11.02.22.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:11:40 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: end trim runs at fully allocated bitmap windows
Date: Tue,  3 Nov 2026 06:05:56 +0000
Message-ID: <20261103060556.55571-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ntfs_trim_fs() keeps a free run pending across bitmap windows. When
the cached free-bit count of a window is zero, the loop skips it without
ending the pending run. Free clusters at the start of a later window
are then added to the old length despite the allocated gap.

For example, two eight-cluster holes separated by fully allocated bitmap
windows can be submitted as one sixteen-cluster discard starting at the
first hole. This discards allocated clusters while leaving the actual
second hole untrimmed.

Finish a qualifying pending run and reset its length before skipping a
fully allocated window. Preserve the minimum-length check and the cached
window optimization, matching the analogous handling in wnd_rescan().

Fixes: 3f3b442b5ad2 ("fs/ntfs3: Add bitmap")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/bitmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 60b362f388d960558cd8ea65680df266e26dabd5..8875e6feff9c9715933545dc2fc173a191302ddc 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1447,8 +1447,16 @@ int ntfs_trim_fs(struct ntfs_sb_info *sbi, struct fstrim_range *range)
 		if (lcn_wnd > lcn_to)
 			break;
 
-		if (!wnd->free_bits[iw])
+		if (!wnd->free_bits[iw]) {
+			if (len >= minlen) {
+				err = ntfs_discard(sbi, lcn, len);
+				if (err)
+					goto out;
+				done += len;
+			}
+			len = 0;
 			continue;
+		}
 
 		if (iw + 1 == wnd->nwnd)
 			wbits = wnd->bits_last;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
