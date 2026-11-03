Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690600;
	b=nJyI4krr2GJBWxERjXVBBrQ3pmIiY6/34nKbxclt6xLJKnukgHbpG5m0HEI/neuSoQqb
	 4T6Ith6o9cuB69lXIEID9bVIFxLDFX0KykLwgUiosXHFx4ahDvjMc1d3tjuigUTkq6mnG
	 AhpjY30OVdZV/+RZxHfSz652iCJQQQEfx4wiWeDuwFwpECmrrTDFAvDSxlkzY4atc9A8Z
	 clDMaghsJQohr6bFonBly3V9mSpEvg2e3YwshlUR5WmkCXmyu6binENym2YHtNmOYRlWF
	 KhEtT2JZike4ONVPVoSgnI4ZRv1R/or/rpP9JUoHFfdEXoOoHN5Tjfald5wMOvN/ZlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p9jXNwa699IkdxAM2a5EMXt5gcZr4wwka5kn1dl+WNc=;
	b=uNTc843PVtqykmdd3FBplcwD+FTfQtmUFA2fBHAPmo/NO+aYz+5WhTcsc2jBOFiiSVDv
	 oPJ8jpNYglUCXuYQ2B58aDhlbOA6uOicen0FSWIDPaPmAZDuicwXTnhrW6Fxb4EoaNUKY
	 NPLBM4eIXTjUsqF4xQIty2icEJDOA+51Af3HSanK+J0dp4o3qDIf3HzMVwIeCfG/i87mt
	 XyqBQOK3g5HVgjiHKvmVoOPxlzPM0H0kX0Ye9Z5j9x8k4pVSPaEx7SDNBk8xm+sLTZBxJ
	 1i6YRZmCbsl/5ExUJX14WY1fq80T4tFrXfBnF4TkGDfTC2/Yyp1ZbmNZUc1TwhU82Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7vmWaUo;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9170606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9170606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7vmWaUo
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae1dca6bc0so2159436a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793690599; x=1794295399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9jXNwa699IkdxAM2a5EMXt5gcZr4wwka5kn1dl+WNc=;
        b=S7vmWaUoyslEfTjkDmZaSctew6UQ4i5PRtOOuyCzM7AgFpelmq58vuA8N6zvfnNGe3
         5GKfoprGk8jrR/28uvvos3Kem8HmxNs352a1343rJLf38vwB9YML6h1+CrfPkpnRgYGT
         hhtLUnsu4fpqtKUvDypt6zAEKiuz6rmeFkoOUpn8eDlHx92KlXo8W4w/uSUcxqK9NH2b
         BEwDQTwyJFKwW+xRo8v4UER8narutqHKkjB1vXxSWZ5Srjq4iBaIOBvrb07j5A3j7w4G
         eWX64gV/H5Egx6cFoYKRGfyfmMqN1v5z9G5WBmV8+EMksIF5wPl5I08kLUN/KzVQ/aTR
         N9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690599; x=1794295399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9jXNwa699IkdxAM2a5EMXt5gcZr4wwka5kn1dl+WNc=;
        b=ueSI/YiKsjqIpqjqW5+l02I1kJfQd7Id3fx9q94huR3QE33MJOWuehHD01IaPt6fKk
         9q8QxiTSdRXRkcSBm0wtIH5CgImncZaQXwVbDyK0SiT0CgkKoUYVUTjxqMCNJD49XjTI
         4By8oEKQDbi2kECYffoJzh7afSb4g4pwdEip60o97if5uKCPc4v5HNFe4aaDoc8bLKsc
         30TklOABqrO58/f5sQRx3kezy5Ej7fGMPN/+iijvb1h8PCpH4Jk1VpB23xRCzxGJmAQ2
         4h8dHOzHCqBId/y2KgTOuG84nnGOZI/HlHlMcfmou3r2+1OhWK2RKva6e6YncD2rBFMp
         e9PA==
X-Forwarded-Encrypted: i=1; AKwUvBwgnoohiq9Q+wG5KXO9rpebjng+26eVCJ4n0rC1i4EtNIsynt0kYn8MUvQNZ5PV3OPTXq6y4VSy6jWEyhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Vm4m/AH5WFyGIsDHhdfPNbqcubst3W5RRpJRvOJcafv0rmmN
	ft5+EzHcdDrIMLqDKXFrL+TcoPIKzI6iJdtBAerR7OuE1AuKKqGMFeSy
X-Gm-Gg: AYBFou1x4qGcEpMKN8pMvPMRvD5kDUZiu9uK4+AG8M4DPodedM0zz3tHJktjrGNW/Nv
	FYoymFNrGKXOVdk+CjhcAUKAxK/GYBV3SmEhnsNIpRJjlFyUkP5r7/fXv2td897hW/Q7kWDnFvC
	I3bWw5+Gdm6zbf2vEMX4mbD5aMd23dNh6BPh+Hh5sDbrlAPYiVzof2PW6vRss6az4EosfGFUE1x
	vcFdUKt/Vf9OD8N8FmJuwqSt6lS8jI6GwbX1rnYBsPZgVO/xnNpccxKbIEmZ712shZLoLurBofF
	F2Ih6tKm9cx9msn0SLKOjeedqneyUXut4uJ1G4IiTU0UfeMNeoj8/f/hIL2HE6oEHOTept4/Aep
	Fr7mzC1wx5Qm+iKqMP0MsNYJscJAKItNkLd+ZwrslYreGlKW8XRaPLX0rQ+tFu3Fr1S6+Y8pViD
	84MZxQriV6yYawgFkEK8GZKllsLHNcVWjhAiA3CfK9E8MZX4x9+Y0pslLKqu2O6UcdrYxaUlzVB
	pF3Bww3dA8PHDdoHLKEoupcCQJLq0F+ATAXP/14lZZfAWXoy37aU7eLQCMrEv6bXorFRvqgWy9T
	hKC0Wks/1cLnNyuyOsq61Towhbbf5MGdiE746nwycWi8bnZV6RwJiAwngbr+wv79PsWAh2zcLIm
	M+g==
X-Received: by 2002:a17:90b:5686:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3ae89724b1dmr10286440a91.21.1793690599284;
        Mon, 02 Nov 2026 23:23:19 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f662basm8638824a91.1.2026.11.02.23.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:23:18 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	willy@infradead.org,
	kas@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] buffer: avoid extending i_size after failed writes
Date: Tue,  3 Nov 2026 07:22:34 +0000
Message-ID: <20261103072234.55611-1-dennylin0707@gmail.com>
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

generic_write_end() updates i_size to pos + copied even when a nonempty
write copied no data. Since prefaulting moved to the slow write path, a
pwrite() past EOF from an unreadable buffer can fail with EFAULT after
extending the file to the write offset.

For example, on ext2, a one-byte pwrite() at offset 4096 into an empty
file fails with EFAULT but leaves a 4096-byte file.

Require copied data before extending i_size for a nonempty write. Keep
zero-length write_end() calls working, since generic_cont_expand_simple()
uses them for expanding truncate operations.

Also call pagecache_isize_extended() only when i_size changed. Otherwise,
blocking the size update would leave its endpoint beyond EOF and trigger
its warning.

Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")
Reported-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/linux-mm/at9xXRhD2xZhszEj@thinkstation/
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 5d3852b726d6b113542e9761315cfdaf99f14587..f88ca7c079bee3462288fdebf57131da60b74798 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2203,7 +2203,7 @@ int generic_write_end(const struct kiocb *iocb, struct address_space *mapping,
 	 * But it's important to update i_size while still holding folio lock:
 	 * page writeout could otherwise come in and zero beyond i_size.
 	 */
-	if (pos + copied > inode->i_size) {
+	if ((copied || !len) && pos + copied > inode->i_size) {
 		i_size_write(inode, pos + copied);
 		i_size_changed = true;
 	}
@@ -2211,7 +2211,7 @@ int generic_write_end(const struct kiocb *iocb, struct address_space *mapping,
 	folio_unlock(folio);
 	folio_put(folio);
 
-	if (old_size < pos)
+	if (i_size_changed && old_size < pos)
 		pagecache_isize_extended(inode, old_size, pos);
 	/*
 	 * Don't mark the inode dirty under folio lock. First, it unnecessarily

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
