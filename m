Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533117;
	b=4CKQVSj4uJmn6j9s8NHPD/aRbFC1X0EW+8Fb8/xPndSkFWKHAaEqNd0u0FjekP37cUhb
	 lvMKqPicLITqrYdEHVCzd+qpTmS4tzH3n+Kew/5/1JhxYV/cFY1nB/r4YaKs1PeGNzUo5
	 6lHLyY4ohHeelc774PTLFBSz5EN2lSAzftCZzcJgjbUrvB19M6mMYtiXZZ2P2J2YDkrzZ
	 G4IWGnWZQaSG9kIBRjlZTyUPzW8e++C30e4DFVznZXoOdEm5rcM0BGR7MDdndiHQYVF4j
	 HCqcwhHcf63isBEWm8ClZ144zCSoLzXefx3IFEuV8FrjfV1NLo/PHWafH7D2v/VDTIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wi28ZO61b9JIXVOR3091FD6X0ybjO5St+FAJ9rvXmeI=;
	b=OdskJrTEvCUAtTk1B+Xp9EvYQ2J9Y5YzCPgYlMGbU9HWpovGHLmRZQmmW07H3MEc0HOZ
	 dN4uqeBx6STVhDVXaGEEgNAhX5GruLoMY6FeujApzEqrlf05/MUUuArGW8cd+LWPsADHq
	 in3awRBcw1twZKjpjVAyoyIVMaVE2z7AWPWcwvLhGdVkOKKo7UmPloU2P1j9h4phziLGW
	 +SQ7nPCVaiMZvUf0d35EEDn+vnkslwh5+P5P2SqUzIvEfPeHjxmpYDvLj75tJzPkkn1Pk
	 xY+8sDSU/w5qqFy8AwwMKNv6zNKnssYk7xLvTRarxq+91TZIdtNQLhVBUmug0EoamjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAw1YES+;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B491606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B491606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAw1YES+
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso4184112eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 03:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793533115; x=1794137915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wi28ZO61b9JIXVOR3091FD6X0ybjO5St+FAJ9rvXmeI=;
        b=aAw1YES+jNGnRe6vmpDq/uw6N/gZSOXQunDBHap+IsV87lKnZddbSruz9OKeDauD1H
         AbMitBsJNkn6tkZTY64diqDhaYg48fy/q8PvqFSf6mrg+HVTj2drgo5yuU8gYf3t23Vk
         uzZKqIUUBpRuzRAJRMtq5dACTSfnJbEeLodtkoRFdgEKIhxSE9sICQog693qNrqN8IxD
         EbhKf+SOJg8WMLT6DhCGKitiHIsJJyAQXZxGfnHpYFKK3wK2oJVb//2H4ElK8eyy2Azn
         ZTPCPxYepJMmlbljajbGuTWDiE4pCEZmAPA5hd265HbC9ddvcXEQwm3SSz6iO3UARvdR
         YjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793533115; x=1794137915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wi28ZO61b9JIXVOR3091FD6X0ybjO5St+FAJ9rvXmeI=;
        b=CcaroyYwALUDK9MjM0Y73AUsk1HGfhbWhyzXsEzDVqvG45zgyYed9L24HDQKAd+vZN
         mRhUYnnWVWExg0Mbm4ofaWMbwECNcPOcLS+Br7GkZ4VhYj7ZyofwKsI3Y+bbFe+FX03k
         DEVpVDkH6lOBM6kNmO0BJcfFnyUXTapp2LJxPJdSaOeVO6i6aQLaH4TXfAsj7fmIM71n
         5b1C+dl7lBos/NXP+NdTANjA3WqhJXKOcXf9KSseX+1iMTYDF/DBjhFlNfPbNgKgI5w6
         H5aSCE1qJrbkMJNt42x+TB82gxxJE2IdZrQenK+FID9JVBWGflxq1G9xfGdbtB1dWh+0
         DzMA==
X-Forwarded-Encrypted: i=1; AKwUvBxuhPh7s/V59CikTTazNzEF0qDAyKJoL91dyUpIBZFfSvVYaen2PfnUWnwWaYmv/zqIvjJK/7AmysA54lU=@vger.kernel.org
X-Gm-Message-State: AFq9FYID0vcM0CxdubkNW+sjxNKb7W55ih1uTRtm1QOEFNwNCQA7MX6t
	V8CSpY5Kr5E6F24Kr0siDYlzj1Khu7C1CeX6TwzTbkppavamzdPVisE7
X-Gm-Gg: AYBFou19+RYdNgI7/EsbkteA9ww9Ws0RMnFrDFsnQiv+fp2YUhWwkVe9byOD+uh97xd
	JRHibLhOT//U70/EDzptIlqVFiK04mrZWGx718hpFRv9PzaaoxyatPautdom+0sRtHTm7miUsDE
	2of6xobYXRKS4ArKDg1L99oiO+9gCE54dtNTuMwZzDgaNQPFtqvI9BpSPAYbRAXAXNfu+jYTlqz
	287Mofhlx+dki6ssRIv/SzltHKef8UweAAFj/BGtNYwbW5f77LFEUjvv+P6OfREN/BdPcCw77Au
	WsPPqw38dDbeErc0rnJO2vgb0m2kesb2C/XwAUZA0Wiel/lDc9R9rGTv6bHROM+SyLar3T4B5E5
	SvCE5aVCz3aMNFISFtHmx3G8CmCdmSXjtbPi14h++Zc7pIE0tC0jtJjZPkwgGnIqWNnaW7AGK4X
	dwug2jMwGILFQ+Q4/m4ZM3D+orQvqVtVF4YCIQB6I7kCVWCnFWplGQt0SwaHZCJsZ0w/GPBmC8g
	Q9EGDepjti1CsVfaovzjXWgmZgjBvqwRWWiCzDudrTr/WEIUy9iB1FTIWZBYrAVm9GXv+ONee4h
	+QLT8TmV7j7wTksleZ+5PEvdMErI99RC46qUJWrd+E/dM+edPfI0chqe
X-Received: by 2002:a05:7022:f107:b0:1ab:fe29:5081 with SMTP id a92af1059eb24-1ac5ac4ded4mr10636078c88.20.1793533115322;
        Sun, 01 Nov 2026 03:38:35 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm20393851c88.12.2026.11.01.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 03:38:34 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Deepa Dinamani <deepa.kernel@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] vfs: preserve subsecond timestamps at filesystem time limits
Date: Sun,  1 Nov 2026 11:38:15 +0000
Message-ID: <20261101113815.52911-1-dennylin0707@gmail.com>
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

timestamp_truncate() clears tv_nsec whenever the clamped seconds equal
either filesystem time limit. This also drops the fractional part of
timestamps whose seconds were already within the supported range.

For example, setting a JFS mtime to 0.123456789 produces 0.000000000,
although the filesystem can store the requested value. Utilities such
as touch and cp -p consequently lose valid subsecond timestamps when
preserving these endpoint values. Timestamps strictly between the
filesystem limits are unaffected.

Only clear tv_nsec when clamping actually changes tv_sec. Continue to
truncate in-range nanoseconds to the filesystem's timestamp granularity,
including when the seconds equal either endpoint.

Ben Hutchings suggested comparing clamped and original seconds in the
2019 utimes review. That caller was switched to timestamp_truncate(),
but the helper retained its endpoint equality check.

Link: https://lore.kernel.org/lkml/12c095e595836a7ff7f2c7b2a32cb5544dd29b55.camel@codethink.co.uk/
Fixes: 50e17c000c46 ("vfs: Add timestamp_truncate() api")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/inode.c b/fs/inode.c
index 1cb6293b237a..7f8e8feec4db 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2847,9 +2847,10 @@ struct timespec64 timestamp_truncate(struct timespec64 t, struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
 	unsigned int gran = sb->s_time_gran;
+	time64_t seconds = t.tv_sec;
 
 	t.tv_sec = clamp(t.tv_sec, sb->s_time_min, sb->s_time_max);
-	if (unlikely(t.tv_sec == sb->s_time_max || t.tv_sec == sb->s_time_min))
+	if (unlikely(t.tv_sec != seconds))
 		t.tv_nsec = 0;
 
 	/* Avoid division in the common cases 1 ns and 1 s. */
-- 
2.43.0

