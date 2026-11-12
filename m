Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501005;
	b=AulGM1c7rO5oFnl5GtyeqHhFNI6UYycgoTVVpggJxYUONlrB3yQl86nv3O8J0DK+2P73
	 oMObeSR3WHf9E7HI7VfszdqqN55ClbPt/JGsdmq2xsBdl9PFXozcEqZ96vcax61ZpC+jF
	 oAuTWBERMWHbEbvPPTlie74aRXRA29Bs7d87xFpbcAcGzuE2HOLGPHKT53EchUvpef8ja
	 9xdw5a8bKPSFAAPq5QNbeRP5u6t8Ag6xa0jXjrTb651ed+M6u2V0PkfVl6S8WBxVZ6cp+
	 3zW+Kaf+g9+k6z0dkAWwsgKrMcbIYM6k/4XnwtrparPDBSf5TwiGrRR7ewzcml/9uWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nIeidz39YEWLTsdrWkspKgvwARrIKlL4u59uZHie4Bk=;
	b=fXJh4dzkfMX2haodMmJvSgKSMiHhhEcujVpyZSx6ihOSJsjt1pOhbNdcMBFVcN73KloF
	 E7kmVhkCVy8gFvRkobNWwD06V519xztzphXIVDvfuh+PQGBT/PdN5VYyvqr2vzGqGKxnv
	 TGtxzaQFb+9XV0Y7Z/yT3DWc+h3HneOdvtlomFo3LRHmIiG1XpapNQozgFMEMqqIXn2ga
	 /SsHJR7ywhXTOvQD5D3RXPe8tyksKjeHn7FAZW/pNDLHXPrzzEStwEa3/Ntpd8sS4YfSs
	 zxmSP9BKBdqemAAiLMFzqGA5KzhW+K78HyANGEhnkTvoxcBLaAsgRj+WnBSdoCChRbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGbbynci;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B042606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B042606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGbbynci
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so76644eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501003; x=1795105803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIeidz39YEWLTsdrWkspKgvwARrIKlL4u59uZHie4Bk=;
        b=uGbbyncilLtXMuA7FCuPCR2hXppaswn/eKnx6cVUI+wGxmWGn8qPfnoLJe7tncnZsN
         8/fFr0+2GjHUh4NWOy0T4/pdfJqH/+SWX+jM0hq0kPk3HaWc2t70PKIvoDGRjmt40SNF
         n8kb587+GDI0TKNmyP/ByOQowRvXIOyn30WWG2L+800frxfW/C1AzGxu4njCKRO95GiP
         8cHkBFEwnwX7est4qrXSFoJbwOQlW7fW4dacKYeRhirSU3U7Eiy0de/siUv29gzpPNJE
         bkLb43Upk3tuuLaG4vo34skJI/wYST76rXLBNdBo+LkQLdPYsPTEv/CGXS8qfMRaRhrG
         VFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501003; x=1795105803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIeidz39YEWLTsdrWkspKgvwARrIKlL4u59uZHie4Bk=;
        b=Q4mf/c8EDLy3XRuWpZWhDQktBdagXyrjk4v0bBmjDXCqVFJYJXGEZm5SCBNPreYq2W
         VfmakMibCubsZsaqhjLsNEWWflu8vQxYauGsRwuwkRnCsLh5/d77H21AkaMHT9j+dQqH
         K1iS8X633xV+IHSUDiv176bbPJ0Pow6hzQKD1VQjawLzAjXPFXjC7O8bkrDoBeIHMCI4
         1gjHnG52S67GBO5DjaHMiYsVK8Phym2bl4FrepcFeBrAU8drn4zuSQjMBBQKjC5eGXW3
         hp2ol0hGGVHR6IXRA3Rea+hfS/Xd1nVFqJ5eNeUDSmgl2QauMHbsq+AXHYaiXMHnCrTU
         3/3A==
X-Forwarded-Encrypted: i=1; AL+hErFAyXvW6a9Beq6NH7aDGRL/+ca/f+N6ol6jwPH0ImbO8L99nZX7q1GDt1g5WGRl9K1SwcSAdsRmfCASHpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xUE2r2zhdM4uqz1ovK+uduv7OVB0L+pBqWABCxKbk6+u9Z0qA
	B8A115PjP0gr2roKCJl7hX02NGNvfjV4QamdZ9RxaiEgXV+xnEEGR111
X-Gm-Gg: AYBFou1Nv/LLAdRCz5xeOpsYEm8CnJYQpMVcqXjuebwcsOlloJomqz95kTsqvNMY/HJ
	rwH+apDQJvQWC60Y3I+iLf95nFa9CD04hmBr7sZvMW16NMIoQtxtu2mDxput84sgpUXQt+YNCnz
	AK+uc6FCPJ0gAx8UOPzeRsaZy44qtGQHlOB7X2VHDTlB5/mdz1MGU4ow1u5pMfVyfO8n9j+c0AI
	o55OrzkeB5ludCqq83oMKfldrvOjIvXmYIaIaMC3bfIPdZp3E2YJYrUbHF32XH8OppECT3UXaDF
	akxwsE421NLvw6Ovulm/j6Rb4jPhTSENpgqjQa8WzB4EMdrE0XbTs1yFz8IM5/vA/JOuYwig+je
	iyUHxN4fRhi/oJVVoEXvkPw/uNJwQkm4OfUZRKHhyER+7nd4Yp6frIOV57oNpem/pAoIt0h1xsN
	VSxfDRvDqrNAKG/9lalzf/9T+oPR5qL+Wm1IAuJK0daQ5aKw16MrAWkrnZ4rhWXYlvEM2cg8px5
	h7wzRaLgL3NPNAW3ixc6o+ct9zZqJ2lxciWqWkb9W0WJ9x5KLH2lySQ+MdmdBROrsRAk8DEPqPK
	F94ulRc6fWyCxJQsp2vM29JgMpI=
X-Received: by 2002:a05:7301:4184:b0:36c:ec0:23ef with SMTP id 5a478bee46e88-3768617340amr8581887eec.16.1794501003121;
        Thu, 12 Nov 2026 08:30:03 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:d30:9c98:e9c8:b461])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3792003aefasm1209418eec.0.2026.11.12.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:30:02 -0800 (PST)
From: mdshahid03@gmail.com
To: trondmy@kernel.org
Cc: anna@kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2] NFS: idmap: handle zero return from nfs_idmap_get_key()
Date: Thu, 12 Nov 2026 21:59:38 +0530
Message-ID: <20261112162938.14329-1-mdshahid03@gmail.com>
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

From: Mohammad Shahid <mdshahid03@gmail.com>

nfs_idmap_get_key() can return zero, but nfs_idmap_lookup_name()
treats only negative values as errors.

Treat zero as an error to avoid reporting an unsuccessful lookup
as successful.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 fs/nfs/nfs4idmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/nfs4idmap.c b/fs/nfs/nfs4idmap.c
index 06b193722660..8f5f0abf804d 100644
--- a/fs/nfs/nfs4idmap.c
+++ b/fs/nfs/nfs4idmap.c
@@ -353,7 +353,7 @@ static ssize_t nfs_idmap_lookup_name(__u32 id, const char *type, char *buf,
 
 	id_len = nfs_map_numeric_to_string(id, id_str, sizeof(id_str));
 	ret = nfs_idmap_get_key(id_str, id_len, type, buf, buflen, idmap);
-	if (ret < 0)
+	if (ret <= 0)
 		return -EINVAL;
 	return ret;
 }
-- 
2.43.0

