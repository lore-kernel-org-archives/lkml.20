Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC32411F9F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405786; cv=none; b=EgfjMiQ2wi08Sb5OIdPfPclN1OSa1hEFRO3k7I1hNWwd9chRqW3thf8HGzOrmXvnrFRIoi5webHC3dlJz4T8iBbjDtEeqbFcpi2AiVPzQF5vBSu4G3CGd5aS1K9JK/e96vkL7PCdIbgaNwjC3InUuMim7S/OhxsTnqQzDy++3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405786; c=relaxed/simple;
	bh=qcrvjeZJeNSTn9Fz8mvN7hQmR3JSJ7hXiLENlRyYO9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPjEoVOaIaT0a/GOGliu41AH5hidb+LdfVi1i+VMcx+9CpmaZEa4S3Szf+WU+M9TfANyGGe4U5p05IgY676IAR0yUOs4x3edtbDdUXv5gqT2Hd3vZe1YFLRZkRR2ED2Bz+9oKsI4fcDe9BZO9AzazTUIKHnJB1Xr5TxpBGfvhMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=VhwGenem; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="VhwGenem"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so2288982c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791405773; x=1792010573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWyewnJ/gWz839fiiYscHDhAW+308Oy+O5Fj0veyk7Y=;
        b=VhwGenemPVKHfXNyFOpuH2EVRsR0zGQZwpRahxi+WfPxdaTTfDBbw8BGHe2jTyLsTq
         zLXluYYsJcYRXOFZyr3yhA9u79ao79LdwfBJX5SuNZvOaz8GDbkAfPnRX1HOcSe4off3
         oJJDqXvaznaVZ9Q7FuOfQ7oPEVRhUJ/f0M5XFUs3+K0m+5PpCy50VFzxJY61nIbauSo0
         dIOBHoFQivF8ivpuODq2hiCP4JIhS69xxdCKKh3bFnYtlWSI7GTiiasLrlDaslEo0d11
         rHOTdL2D9vyGlEQxRL3rcYi4h+hwY0M+XJrL8oVaGV2KrNt2wc+ECf7HBuIUbVN1Kr8m
         o8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405773; x=1792010573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWyewnJ/gWz839fiiYscHDhAW+308Oy+O5Fj0veyk7Y=;
        b=ZqoRUrHok1puJDU4l/yW3D+ZGxovf280GQACcE3xKhISsFNcqJ/Rc3jfb/r33hXdZN
         ZmlIvzISnuZ96DjZurI1Y1LvBz/ciQl/OA+GWfcmz/cRokV8Urm9Sv1mMlecEWPnUir+
         E2hiom52ZPagru1nQ8NGJmMgjp4rNc1LaJwZMfFxmtRajR43rgsMET+jznKbQuAhzmwu
         Z2RiKNJRj6XJLdDmrb2oNbxPiENW2EQ6+ST4q17qfZmddx/yHdJwrw0kS9LgmPPM7wal
         1chFRekn+VHO7umQn8PN9cvRyJuFJ59RBE79+d0xZ3oZXRlwfSLl15ZUFSChPivuFTe1
         dOLA==
X-Forwarded-Encrypted: i=1; AKwUvBzsXdCSkeepgcFoPK9YBxa5futMFPJ4rm9pO5FxhALxTMAuvbYVLw9dO5oRFWSR1kPMbAbN1c0FIaKq3Dg=@vger.kernel.org
X-Gm-Message-State: AFuF++mXEX56YCKP3if1yh9R4XOcy4dwZIF3VxUKAj3iFDBw8DaA/YvH
	9leECv/jIOYPE/UqDQWakvnwtJSVLOPBHDRkbQ/0WiMpDUOGglpGVPLNDnnn6hy4HyE=
X-Gm-Gg: AYBFou21Z0ioTXLCJzK7+KQPyHx1vSBiq/0zbnZ4Jf8Qs0ejbyVbcdDsu/FT99HU5W+
	4+5kiMW+6pPIaxglPFcVfdCer9LcANQcSEVXDUVeAsyD6D9UCFZUVsDdenVKIsO2Jjz7UnhKnYe
	fbI84PDB9uT8h1FPwv0u0NbH5I34/T2aa0+kUnmQTHu4oRWh7Ou07GnJ2O/Fp6r2SRwexlvoXgy
	cz+XvMFQyBL1cxLLe8cdgdBPEB61EFTGeas/+LcJ++RtxcC0Ns6GohqRGuXr8dGYOPOhtIPln8p
	CrQKxjUaY/zkRp7tH+a6E0VE7wnY0SSq+JqzVh7OOeoxNvpb8hSHCO0FThurhnNZIkqGIhm5LZR
	MVnoZZ7ETMJBwmbQvsGdj/lfrhYiY9RhPZkLcRywiyMoxCPzmb1TjFrmyrVLIZOxHj2e5/Q3Xt6
	JXAWqNcIQ+NOz+ElmXS3jA7FdW1u6T0l0gX1qz4oP35b2sl+cCu1YCsJQsRWH8rhxZ1po0f2qUc
	7Wo105uN3fvwIEqTiEyJG0c7MBpmX75nM5/YTJ59Y/hvbY/cxpdhXxefl2Rzq6tsKsj1h4=
X-Received: by 2002:a05:701b:241a:b0:152:92c6:8b10 with SMTP id a92af1059eb24-16208ebdcd2mr3213456c88.45.1791405773303;
        Wed, 07 Oct 2026 13:42:53 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:7854:1520:fd4f:2a94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167ef2e54sm7586938c88.10.2026.10.07.13.42.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 13:42:52 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Helge Deller <deller@kernel.org>,
	Helge Deller <deller@gmx.de>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: [PATCH 6.6.y 2/2] apparmor: Fix & Optimize table creation from possibly unaligned memory
Date: Wed,  7 Oct 2026 16:42:23 -0400
Message-ID: <20261007204226.47033-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007204226.47033-1-artem@trailofbits.com>
References: <20261007204226.47033-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@kernel.org>

[ Upstream commit 6fc367bfd4c8886e6b1742aabbd1c0bdc310db3a ]

Source blob may come from userspace and might be unaligned.
Try to optize the copying process by avoiding unaligned memory accesses.

- Added Fixes tag
- Added "Fix &" to description as this doesn't just optimize but fixes
        a potential unaligned memory access
Fixes: e6e8bf418850d ("apparmor: fix restricted endian type warnings for dfa unpack")
Signed-off-by: Helge Deller <deller@gmx.de>
[jj: remove duplicate word "convert" in comment trigger checkpatch warning]
Signed-off-by: John Johansen <john.johansen@canonical.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-45893. The userspace policy blob may be
unaligned, so typed __be16 and __be32 array loads can fault.
The source diff is identical to upstream. 

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.

 security/apparmor/include/match.h | 12 +++++++-----
 security/apparmor/match.c         |  7 +++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/security/apparmor/include/match.h b/security/apparmor/include/match.h
index a86f74b59360..14c0401f97c1 100644
--- a/security/apparmor/include/match.h
+++ b/security/apparmor/include/match.h
@@ -102,16 +102,18 @@ struct aa_dfa {
 	struct table_header *tables[YYTD_ID_TSIZE];
 };
 
-#define byte_to_byte(X) (X)
-
 #define UNPACK_ARRAY(TABLE, BLOB, LEN, TTYPE, BTYPE, NTOHX)	\
 	do { \
 		typeof(LEN) __i; \
 		TTYPE *__t = (TTYPE *) TABLE; \
 		BTYPE *__b = (BTYPE *) BLOB; \
-		for (__i = 0; __i < LEN; __i++) { \
-			__t[__i] = NTOHX(__b[__i]); \
-		} \
+		BUILD_BUG_ON(sizeof(TTYPE) != sizeof(BTYPE)); \
+		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) \
+			memcpy(__t, __b, (LEN) * sizeof(BTYPE)); \
+		else /* copy & convert from big-endian */ \
+			for (__i = 0; __i < LEN; __i++) { \
+				__t[__i] = NTOHX(&__b[__i]); \
+			} \
 	} while (0)
 
 static inline size_t table_size(size_t len, size_t el_size)
diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index 19b44e705b26..0a3307cd4107 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -67,14 +67,13 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
 		table->td_flags = th.td_flags;
 		table->td_lolen = th.td_lolen;
 		if (th.td_flags == YYTD_DATA8)
-			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
-				     u8, u8, byte_to_byte);
+			memcpy(table->td_data, blob, th.td_lolen);
 		else if (th.td_flags == YYTD_DATA16)
 			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
-				     u16, __be16, be16_to_cpu);
+				     u16, __be16, get_unaligned_be16);
 		else if (th.td_flags == YYTD_DATA32)
 			UNPACK_ARRAY(table->td_data, blob, th.td_lolen,
-				     u32, __be32, be32_to_cpu);
+				     u32, __be32, get_unaligned_be32);
 		else
 			goto fail;
 		/* if table was vmalloced make sure the page tables are synced
-- 
2.39.5
