Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390838;
	b=QL0ILwRh5GIwI6qB4nvl6lEX25WRTbZIK7GSEpsJl1hvKTkex7T+QBlkwldNyLC0rlrr
	 NbQ174ghx2xbi+nwcMD0nBWkn1hH+qLBKNr5rhOuTnUjxcrssKnSEzr1RbQ4GoqukZHx6
	 LYSaUetzZKUHvrT2PH56zng3PQdMiUGSzD5SgDmdXolVJsTeuE+alS0aDb4LS6+YSIbxF
	 LeGYe7oWZNV9Kyq31N3W0cpJfF9ei7KWM2hHPdEdD9/tPxXLcHAyExoq1xbNzTTFlhmSz
	 6scYLlXA9FaRpuvhdPZTQS2McZC/Fk/g4ynBxWKGpSbYwQwF4HU3EM4mEphV99sVPgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390838;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KmJVN+NKveF6HgY1Y/eSpfSbY+XEPQzQszmXYvUfvC4=;
	b=2wFPcZbvn8BPrsjVu0FcVvDRGcgarZtEP6Tn0PNz5RubCEXk+oTlWlpDvJaTgPHzVVRz
	 pqq3uOVD2a1Hqgs8o5UU2k91TXnfWWkUxbKwY1dbTaR5ScHU0MzsJdVtUhZguJ5jRFw1P
	 iDCR1xN//m/EOQED7Lx7aaV5SdBLbT7bOARKGGfLBdikWhkupsp4/Bl0i61JFo1HSbxEb
	 0FSVJPdp2k6ymTzSD9JGNibGQ3Sz3lFVL49Z1y57XIq9yGgNC1TSeK4noIcIvs/HIOuY4
	 7RPf70MW3dbXlFZADXBslAfsCM5zFGXAh9pZa3/3w+LPdyRyaRPTdu329M7Cs2RHQBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="JNfA/ShB";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jzkq7PHf;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4408E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JNfA/ShB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jzkq7PHf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KmJVN+NKveF6HgY1Y/eSpfSbY+XEPQzQszmXYvUfvC4=;
	b=JNfA/ShB/hbCEdIiwOlkHQyl4LSCaeLBvsgm5/L8t6e680hDsHomsrtZsjKSj1fc8XAOcl
	PNzE4w2Py0ooVc7TQkYRfrhPrDZi0cDU9GimukvUcX3zHnTo2+eh8wQeDwV2yls+l3x5+X
	5aX5Bq8ety31HH4pm3PrRd+63sGnafU=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-Nr5_x341NGSUgyViD_HFhA-1; Fri, 30 Oct 2026 16:07:16 -0400
X-MC-Unique: Nr5_x341NGSUgyViD_HFhA-1
X-Mimecast-MFC-AGG-ID: Nr5_x341NGSUgyViD_HFhA_1793390835
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso4930409eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390835; x=1793995635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmJVN+NKveF6HgY1Y/eSpfSbY+XEPQzQszmXYvUfvC4=;
        b=jzkq7PHf3CZp7AsHDDr6pFlanEm5fLjGRAJNZN78d95nRU5gTJiUhQ89yWBd+4dkMR
         IYyl+CrEEmQujw69VsAm1KT7EQNmNYy5nr/C3TmyCoJPqYIbv4/ini4F4Y//U7HsAoS2
         /xty1ecluaD3hWLo0dnaFNP+W/I6VqF34Jd1vLxBzvZd/xW3eR90MM0K9jHEj7Omu8s1
         YiHIj0T/0Up/IWBXsblEDIWXAI4Y1MrE+jr11SoJDC/vIdFui427B+xW4xXGsTcng+co
         Hr0VmQpAmtJP440Mn6tYam6O4L76jFeuSY5WpeWT690kr+aqAyPK/fOZlMffjSycFkYb
         FS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390835; x=1793995635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmJVN+NKveF6HgY1Y/eSpfSbY+XEPQzQszmXYvUfvC4=;
        b=0sQiRPrVbhQyRAgxkkHto0r7JN95Z+MDKO1T8JEvRd+BjpHPeVW3CVekCHyIa0ntJ/
         SEqFHRsljhIavuwXgGBuEeA42e6l3qMftZkBFBZ9Ma2gzK6sfcOrSmEzzGviE9qqHtz5
         WdhI3C1dauD4UJYfbhDeBF/e7/KEKzjZ/b62GDhaKW8WAPbGl413Im2uFBQWMBThYtU9
         ns8RsbmhXpmudjEVbLKsOe26QUO4a00/z51SGgVYL8PbstIjNf2UAy3f74UPKfGlQWnH
         86AaZzpETVOMPUAKblkYxJbg2OVjEdb99iw/hP0ScId+3OtJCgov8qFYIo0vcTpmwzL3
         WkfA==
X-Gm-Message-State: AFq9FYLoT5JkVzEhk3HW9ImHyNSmSk2MfIzrKRm17DfxeVcxkxDtm30Q
	8PMmtY2+DgGpUFukQh5AkhbG7CgFa1b3IA5OKjMyRcj8MoroRfOm00s/b6K26Rej3lG1bkaN6gR
	WHLjEixofbInYdufgV1uYmXSiEsVGVe/LLbMMEDtsEZlklQ+EXDbOrH7qLSGm9LrVR3QdWGgtRb
	bBfaCPW0st2YVqgbK9zl061AGpMf5tODe5m74ZC9+Vmi8jRALj
X-Gm-Gg: AYBFou15FEMPPWYvWOmj20pLYHZ+7NJSxZTg/qcW58U3wQf3ZSmPl4TE5wgZIkRligO
	KnH57Y8ITCdhlfCZv6Q9j+MoSsJ/rXNKVbE5GpHTzSdX6Sz2Zb2bKowK2hEwCxdOhcBRqnByblr
	+3VVBFGK6JZ5S3hKHdkAmsVyzfvuC5ozBIFhY407CeKkmYje3fgIi3VlAk4U33sbTOk2R5Bzw/T
	G+BAKaOZR5obWTFsWHDEhpw9VvufqOj8ENLf8OEq0bN0q1Dme9SetjMR+SHhET040b76iyykVMd
	GgE/3C3AI/bjFLAbLiVBioRCUQ6mLGi9bNx2csUIweJzckfi8nzDQWXNTFVEZvZSfoudhE6UYni
	NC6APTOhn6vUGjvLmRaQ5DnvXYCGOvUg7SR1uNmXPB8cpfEjlTU9SgAuOMjEXo2kNbilbLDiqtx
	n8RbOwe3BdaTX3rg==
X-Received: by 2002:a05:693c:880b:20b0:369:ff7d:840 with SMTP id 5a478bee46e88-36a423e3607mr5250118eec.21.1793390834495;
        Fri, 30 Oct 2026 13:07:14 -0700 (PDT)
X-Received: by 2002:a05:693c:880b:20b0:369:ff7d:840 with SMTP id 5a478bee46e88-36a423e3607mr5250070eec.21.1793390833726;
        Fri, 30 Oct 2026 13:07:13 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:07:13 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 5/7] tpm: Increase TPM_BUFSIZE to 8KB for chunking support
Date: Sat, 31 Oct 2026 01:36:47 +0530
Message-ID: <20261030200649.357508-6-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030200649.357508-1-armenon@redhat.com>
References: <20261030200649.357508-1-armenon@redhat.com>
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

From: Arun Menon <armenon@redhat.com>

TPM_BUFSIZE limits the TPM2 command the kernel builds before handing
it to a chip driver's send() callback. TPM 2.0 Library Part 3:
Commands v185 adds ML-DSA key objects and the ML-KEM
TPM2_Encapsulate()/TPM2_Decapsulate() commands (sections 14.10,
14.11) [1]. NIST FIPS 204, Table 2, gives the largest ML-DSA
parameter set, ML-DSA-87, a 4896-byte private key and a 2592-byte
public key [2].
Loading such a key pair with TPM2_Load, plus header, handle and session,
comes to roughly 7.7KB - more than the current 4096-byte TPM_BUFSIZE.

Raise TPM_BUFSIZE to 8192 bytes. It covers this command with
headroom, and keeps every kzalloc(TPM_BUFSIZE, ...) call in the TPM
stack at an order-1 page allocation rather than a higher order.

This matches the largest parameter set defined today. NIST has already
published PQC families with larger keys and signatures than ML-DSA
(e.g. FIPS 205/SLH-DSA), so a future algorithm could exceed 8192 bytes.
CRB chunking, added later in this series, does not change that; it only
lets an already-built command cross a smaller MMIO window in pieces,
it does not change how large a command the generic stack can build.

[1] https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf
[2] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.204.pdf

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20261029181541.99505-6-armenon@redhat.com
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 include/linux/tpm_command.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tpm_command.h b/include/linux/tpm_command.h
index fc446a1282e2..4ad11068b090 100644
--- a/include/linux/tpm_command.h
+++ b/include/linux/tpm_command.h
@@ -434,7 +434,7 @@ struct tpm2_context {
  */
 
 #define TPM_DIGEST_SIZE		20	/* Max TPM v1.2 PCR size */
-#define TPM_BUFSIZE		4096
+#define TPM_BUFSIZE		8192
 
 /*
  * SHA-512 is, as of today, the largest digest in the TCG algorithm repository.
-- 
2.56.0

