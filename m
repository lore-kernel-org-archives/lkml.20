Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979904;
	b=2PQElYpzsrSpF0hfy3+hbVFESEO3Js5IPkyDEmUFq4e0guCJJER+zXpjWsJiwN5dTvl3
	 M91zCoSQLewBpypvq6jlBmgFQEU2qtPThaMN2yU+Fz37Jhx2QI2j63a8ZWg07MytpUQks
	 V5hsEdoVuI4wO169JhX7TJ3pUm/vWAVxMJ7qKqPmN65mpZKX3XTesvWTZg+1t82ydL3W0
	 KvNt7+XffNLME39u0KgUdtsnwrD1tKcgOk03V5HgO1CrT1D+CFlvfLkZYnLsaZO5Dx4np
	 Mt05IWcXGh0LdRl2nNQtAT9mliiIZJZjW/7I0R7RtCI+P/XDrA5/zKUg0HkeEmq+Mfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OJzaqNYQam3G1mnM1dtOnV/6df3rTe3VoR8V9wQk5ak=;
	b=alje7VvZKz6j+qBexz4wEFn4v6NrHjxfTwlArmWSevoqwnU36lAV8iWrJmp3CvWmZzr3
	 DfKO+O2kAwUQiquJGXAuOwssG1vSfuZC3Zvgg/s2tlFdVokNVBp291rlFqBGZyVQsTm65
	 r9nFVcPuReoNRW2qISiOvkDqXwhyKEw+tgpArQJ/icS7q7/WYJd35Ye5jx6AoIjS542y4
	 GKU2DzOad6Ezq43DC30TSXNVX0szNMJ55teIVKyxcgpW4Z72lwsVnZFdzy9qIDIxj3ll4
	 EnedVOC45swhZJzCUUUBB8Q3T0U9mInCPA6ypYnr+FWZHFa/6U1qSwPByv1zC+/HM3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BVNzoBqP;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BVNzoBqP
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso4887459eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979903; x=1793584703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJzaqNYQam3G1mnM1dtOnV/6df3rTe3VoR8V9wQk5ak=;
        b=BVNzoBqP3fDN0Homwj5TbELiXSBF/6BGiC6AumkF+bgVwlaskN1zSKmD2txEKEN8ZE
         TJlflk6uKjqJ0VPFqleroermHqpa994qUManfiByxpJ2zSnlZDCGpfCA9NvceUe8qaG6
         Src3Sb9aC/IA6n99PLVg9DPxabxPsizmLIUhuuMBw2EqWag+RKLa5CxAVVdnIwe2DAHd
         /bGQOWyx7BOPkW91+aAxpKguys3il2O5BEtwZZzm9vkzu8dflLPEOIzDRTa6YVOT6PmC
         ScSI/RJ8ziFeeD1Zy4LIBMDxlYpnjFR25S6qFfGzfg4X7Vj2NOC16HQAwNLOwCIKjXyJ
         6ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979903; x=1793584703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJzaqNYQam3G1mnM1dtOnV/6df3rTe3VoR8V9wQk5ak=;
        b=ZpcV6t+fYqzxScJTKK2pVx2B7EicVLew6/A17rSpMwFOTatZ7qQd72RXXrSt516P41
         4ZakcYHrT/Soas+PTWaTf7B8WtdpOO22ETbcONwHMGSNslpQxRpQzjxG4p/EimSpfgAO
         piT1HhXXQSvNgtksDShFx9mPgbDpf/uMcSJmsfshYcUM0uF04l3Cfct8du7waOzlWcSK
         WXJAi4ctEGuROrxg4yQs2XuuMQ1JyQTyK4GUgsta4k3f/pUIVU/b/8/HxnADt8dX11ja
         eLcQ5OC57cDul8N1IyLtNuBI5XIm8zB618iQ92ITxlbPplXmnTmlJJsUW4V/Df3lt/3m
         Vysg==
X-Forwarded-Encrypted: i=1; AKwUvByMO739LEnHwlUT/beelqHs3Du79oRMGUn5BdkF33t9vU0jfhFYAg2BEQgllcqpENGDgBn/6rHZLyv4Qg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXArhu8/hlB3lS4ifreRGcRAjnShs7mcyUEPDtz3ZeKkQVPW7E
	IKxcFUfUspBiCL70D0sSqINhzwe03T2N+yQZmAZXDZXREFVKtOlMvn7z
X-Gm-Gg: AYBFou3FHqmzrfk2pHobP7d9xHEp36RND7wRgov0wFglPiasR6FLF1ckO0ytFcqzDNR
	zr2VownlNoSvgIBrf9zxxiXjeupblvHOFzXGzEu/gaoSgJgCyPdPT7S+mUKcZqcTkBbHr9H+la5
	Ca1f6Ep6P2AQ0oDpT8ouXtpRr+jKzQ1qnY+OZ7XuQ1iJt/W6JIVGBVy7z32Fcu0vIJIU8Xj6Mzf
	FhAeMNBtn/Nwi8g9HY0Diedmw8E+Tr1+r4toP2gHZeU/7zVwPG6lrrXB6cp9i0egww9GMZr4qGD
	wzIj/H9pQYuCAg6ihFdjstiD/6+dhvma9HDawkmxmHYmgWtY1ZD3iRUm1ZSpnShnfYTGrAbBygq
	QcUhIR9J1Px/2Dt40jcoqxQFxxTiTztI13UTaJe8wAXA9cRMVq/rOIvLZR2qjJEnsUoEv16Rrfp
	cZWbAYoBnqj2peOCFh5Xox+IaWF24m5VboTwF8BKyePv7JlZrfXjprFb8k3LDWCwu4o3DbpAkjq
	7rw5iger8NrskOrpSGaiP2v1w4oYW6lgm0Bxf880USpgP9RG6wxd2dS1/bJY9QC17c6emvZ+A0r
	wYcb62w=
X-Received: by 2002:a05:7022:ea48:20b0:183:3140:3ac1 with SMTP id a92af1059eb24-1a0ca49ad43mr2284534c88.24.1792979903481;
        Sun, 25 Oct 2026 18:58:23 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm21301850c88.9.2026.10.25.18.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:58:23 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	djwong@kernel.org,
	amir73il@gmail.com,
	dchinner@redhat.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] fs: skip copy_file_range write limits when there is no data
Date: Mon, 26 Oct 2026 01:57:38 +0000
Message-ID: <20261026015738.46230-1-dennylin0707@gmail.com>
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

generic_copy_file_checks() reduces count to zero for a source offset at
or beyond EOF, but still checks the destination write limits. If pos_out
is at RLIMIT_FSIZE, this sends SIGXFSZ and returns -EFBIG even though
there is no data to write.

For example, GNU cat copying a 1024-byte regular file to another regular
file with RLIMIT_FSIZE=1024 copies all bytes and is then killed by its
next copy_file_range() call at EOF. A zero-length request can fail in
the same way.

Check write limits only when count is nonzero, as the ordinary write
checks already do. Keep the other copy validation in place.

Fixes: 96e6e8f4a68d ("vfs: add missing checks to copy_file_range")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/read_write.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 4da846a2bf17..c05ad2c42e75 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1531,9 +1531,11 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
 	else
 		count = min(count, size_in - (uint64_t)pos_in);
 
-	ret = generic_write_check_limits(file_out, pos_out, &count);
-	if (ret)
-		return ret;
+	if (count) {
+		ret = generic_write_check_limits(file_out, pos_out, &count);
+		if (ret)
+			return ret;
+	}
 
 	/* Don't allow overlapped copying within the same file. */
 	if (inode_in == inode_out &&
-- 
2.43.0

