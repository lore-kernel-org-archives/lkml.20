Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A105476E4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170404; cv=none; b=E3ON6WBSJjrA56Njmp1pdAFLr7OljNdF8aKFDIEYCc5uMVQWHu9lPBcwQuAaVr9DK0SsCa3BHCsiIclquiNCrKTNkbhPzqm+CfvYYYpC/6IZSOSIXLKYH8d7NfisaOWAAgzTw0vMprH8r7B3v0FZOMs3VtYnjx5mJyNaancqATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170404; c=relaxed/simple;
	bh=jBWZwIMiOxyxYojRsXD6S4nvuQkHBu+rSMXSXxQ5PZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bnnxruylVC8kaVhfwyWGFsD7GPqcXazfAFoBOcDO3WarUdVfKbKoN7dlK4w/cW5m/cDVNCOBICRcgK/Cxt5AttLWKbOcerFruMO9wBar6qUBijDqsSz3/4JmYlA5kf7iWjVCo12vXuQzagTp43+BxIdQB7E4y5j3qJACe5Cs5g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okRFUC9a; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okRFUC9a"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso187355eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170402; x=1792775202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gl1azP5WKss8k1lh9wXiZ7oCRnOGPPksswe4Q0rIdDg=;
        b=okRFUC9aYG6Qz37SVSCvJDn1mV25j1sTnenL1GEtSwRJX5foGTU54BDlWzEqM7RBDK
         M34/3s3smRzjVHKzlqyZC5/Fsv3qKVXltWO5KztHqhclRjNmTZ1pQBFlzSOIQsGszorm
         RvJJluIHmS/HoyySL9TidEzz//YJFPxWOLKenIo1DGj2a9TlBGXEdnbycusbAPvrAgpe
         HVlYNZ359sD9I5dKZx0PH2ZSAZuaPVDpRocXc8OH2l8+PDdp6FGm8VaL9R+CgCu0Rsfk
         +5uUzVUD5r/I9M0MAMD+vXfp6Kgd3qMG0x8BtePbgOCAXJMLhGAm2LlR9i60gS7E4Ssh
         4PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170402; x=1792775202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gl1azP5WKss8k1lh9wXiZ7oCRnOGPPksswe4Q0rIdDg=;
        b=hZc07mOEy9z7K6MpdGh89C1lNZcXdYbr74Z28ToMzXvFCAfKIxuVos0IzXJdL8tEYM
         ndamp8NfU/OPBk6GO6AVHmwMMbkbF2+rumP4so7ocHovmcL32xuR/DVhM9gPXfOlZpOr
         V/0TaoYJxXjL7/QCuSWtSwW4vhnVJ1P79wci3sQud0rhMcB2CFPTprJeLR/2ezhZX4my
         Z0f58AGalkqeNup+gXC1tnAS2WjKGXq6+Q+L+FU+MIQquzGbS+IX9mjt+WCbdY/mb4jb
         jL/CSkUlkDuhEvXCXQC3EVfSJSl2aDTJSa9VRJMdormoCO66cIkXoOUne0wSKldNKBR2
         rwQA==
X-Forwarded-Encrypted: i=1; AKwUvByP2oIe7QYwpX7P61mBpNFOd94CA+KTK0fzLjfpDEe9Ga1JcZbMoxelskh9oVmZRhlQbHLOkUmS3ju1MRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ+rI5R7ZvDvuFHFw/zetKRmR87M0Zy+11TPfgPH0rf2468QYM
	ajqiwmT/2NBamxiHTjV2WWB5i9I1lYUoFALqHXyLJfO1JxICqam52BIc
X-Gm-Gg: AYBFou1sk1cSe98AeOY4+An9fFb0zJEAho8V6MfraPBY+ImOzmXG9lD0CuiZ//6lntA
	CVNZ2qk4RA1vf96AT3Wbq71utlVJxTApw/okHDBlxQPdodxzf58/x46zW4Yv1TduK9KGNJ3B6ol
	qZ8gV1cNlsA5w42jDtsNoPnGzwPGLupJrEO2w/OjbLc8BasjBOwBjdCIVTNK6GnSzB30/GSeant
	bH8H3dE0egUJG1XbbtheVuuKR0aTWtRYxLJrzG/m5c3R+tV5D+NUlm2GqxjYAXmt0D2OfZRv76G
	NwNx6naRGwLntI8b0PBrEyxmr2DhDb/1PS/+Ad0g3U/jk9vlKuPurXPcZbXroU7lbDa9Kr3IfeN
	iDhXWVg8VJLn7rK4Pq1m0By3r87K0r7rWoMLivmDNb+WyALlcYf4VqRG7ymBMF3fCRE8wcIec5K
	RZrl8n2FdoQqdI6n3m/wn4TqJmmtkrLvT4jLYavLiFkFwJKQnpVstj5pWNuBcK
X-Received: by 2002:a05:701b:4291:10b0:166:9e0d:3b56 with SMTP id a92af1059eb24-18513e7c690mr599794c88.38.1792170401713;
        Fri, 16 Oct 2026 10:06:41 -0700 (PDT)
Received: from adriano ([186.40.6.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm11285825c88.11.2026.10.16.10.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:06:41 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] ecryptfs: reject short encrypted key payloads
Date: Fri, 16 Oct 2026 14:06:32 -0300
Message-ID: <20261016170633.1415240-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reject payloads too short to hold a struct ecryptfs_auth_tok,
as a key created with a non-ecryptfs format is shorter than
the struct, so the payload gets dereferenced past its end.

Fixes: 1252cc3b232e ("eCryptfs: added support for the encrypted key type")
Cc: <stable@vger.kernel.org>
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes in v3:
- Split the v2 patch.
- Remove Nguyen Duy Nhat Anh change and its Reported-by tag.

Changes in v2:
- Add Reported-by tag.

 fs/ecryptfs/ecryptfs_kernel.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..d4fef71738b0 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -88,6 +88,9 @@ ecryptfs_get_encrypted_key_payload_data(struct key *key)
 	if (!payload)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (payload->payload_datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)payload->payload_data;
 }
 
-- 
2.51.0

