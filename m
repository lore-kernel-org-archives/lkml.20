Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F741F34E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428943; cv=none; b=TPUPrRhga+KZuIw6Js+EQo8fHivPT5De/QnI2FTLIc6p+movmNOo/Sci9CZcbnA6MB9rqHISxTCaX3/oCCW1mQW2/+B+Q9SsHNCKs9L4b4kPE9/2Xv6swEKOr3KjA4ZtU501pUeEKwCRTL79TJwseXvl/2yO0Qzu5sOSjToSIfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428943; c=relaxed/simple;
	bh=8rgTvvwDFSaspEHo+kCgQNZbcI/BJZf21gNZIv2AIRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0/ExV8Qv0TzanevPX2Mevskj0Ivi2/RsSZk7hvA27eBi10oAFrdYpQy2LqrRgz4iec4fX3j/2jlixX9ZB3+UeR/SccywJemIr/G7oDWMv/5+X0Tnr4dWTfW7Pi6ks7LBMiYgtDf2JU/BtwBotCvQj9FBlaUAluYmHRHPTBU/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=IoYrGoTi; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="IoYrGoTi"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so785150a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790428940; x=1791033740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WY6jVhJ1QtI7aO10MKO0OcssEc831y4vQM9w+i0byGU=;
        b=IoYrGoTi6aru4z9/uiV1wb5/qC7Q0A21ix7UNXoBu9FYgU2RBHjFmFtcNtKLUkGV1w
         S2VijHZiEk8TefWyF0w3KWsdYCoslzg37jalrDrUyGXX0+oZhuacBQk9M3bM6OSH/Lxp
         3+M6xb3nObn4mxHxJzy48yyFtCvIVDM6RU3y0QkB6iQQ3LctdabJcs0qF7L9rAqeLy88
         Df4TB4oZSoSxlJuoTg+VGzoXXqk0FNrqb14shOWd8e+5P60wAAZ83Ng/DaC+MGOY2Xxx
         +l40q48wcJ21E6Aazf1Dr0xGYGQMgURJDnQ4wKDMHnwfq6tEXNTEqOQrPCpgi9PokdUM
         Ldtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790428940; x=1791033740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WY6jVhJ1QtI7aO10MKO0OcssEc831y4vQM9w+i0byGU=;
        b=c+yuQNHmLxi3a4EWmN/7o3QLHqWk3siLAa0PxprgYFfxjeeQQElUEDF4xWMmWZiwnr
         F60bsmLunB/aTkXNvq3nVknzM5jrg06b+zeSPWdYiGclFh1ORIjYnEEs2ke83vFSOcB4
         g2lrIX4z7IKQtvlVBVB82x6m++J7KpmR1ROb16JRHZRxLcjXZ+FaOgPfRn/xiZRlDwiV
         1wlDgHdRzZBJmm+9GBBw1eFxkso3jt7e0fUshPuuRvLvkQ4f30CJmq686h4z9vhZWJly
         IOee0dTCsLH/CyShZLX/pBt5LmfAOFpN+bkANxHtF9T2NAUqdHhAXPbz4jTVUEBtEM/f
         kdow==
X-Forwarded-Encrypted: i=1; AKwUvBwrhbccpKQT274Ya35npJqToXSn/iniQBYaula17uTRpyl7s4msv1b0X6aapzRcUT1UNdKzBPcQZAMyxg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxVfVYNCEzu0rjdj69v9Xbe+PIgmNYaUn7BgJ7jAyrbYyP9cco
	qTCCDYBV3ohXOcHTyBy7bcz18tK4/D4e6rTBiHokmaAIlsJRbWepFoVH5CtqXe9URSZP
X-Gm-Gg: AYBFou1l+C6VOIylD5kTikVn8NSfkzpgZq1Yz+LELscMwg9saZaFZT0aRG2hiZDREU0
	iOv6pqF91pvga8Kjc0SsFGPGzR4t0JhUCm1yiXHy3/Bd+y6BjPQ/9bAFrR1zC+rFJ5SG3J6lAhZ
	IWRoDb2wOYefs2GUJM6d/3ewxpFINUBYtkzSbkfYxvV48kYwW+xlZRYDooOBmbZHWygIfqHJz0C
	Kn6fOTG6Wxj4PoRz9PnXpG2udvyNc9UY/58uk2fF8lGgeKE5Y32LVUR7Y3nhFS2f8/i69vaaC0T
	YPrWn9NLfso+ZnPXMrAE4RqujU1FiPA6/oJD/su70vxq1tgrG8FIkV5DrVK7G1Z+2Kwse0e50QO
	4Pfz3exYgRn7CDgH/5H95zt5fRVCzYaxnhm6nRRPYw+Xe/yweT1+cl+gjM1FelXC32Qyws5N/ar
	h+M43ARSj7evLIF2NvoC3/GKms9yuNrIlHl0O+8PRtMxHhKVh+zMmBt2opaIL3KUqUbWQkEfy5M
	h11/VBKUepsoYdiOCtF2YbaazQGdQ==
X-Received: by 2002:a17:90b:3dc3:b0:3a0:ce5f:e292 with SMTP id 98e67ed59e1d1-3a0ce5fe752mr2448333a91.65.1790428940028;
        Sat, 26 Sep 2026 06:22:20 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm10619253a91.1.2026.09.26.06.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:22:19 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: pc@manguebit.org,
	linkinjeon@kernel.org
Cc: zihanx@nebusec.ai,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	dhowells@redhat.com,
	stfrench@microsoft.com,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH] smb: client: avoid NULL resp_iov dereference
Date: Sat, 26 Sep 2026 13:22:08 +0000
Message-ID: <20260926132208.23360-1-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

compound_send_recv() only populates response vectors when resp_iov is
non-NULL. The final pre-authentication hash update nevertheless
dereferences resp_iov[0] whenever all compound requests complete.

Guard the update with resp_iov to match the response-buffer handling and
avoid a NULL pointer dereference on callers that do not request response
vectors.

Fixes: 62432a3f5145 ("cifs: Clean up some places where an extra kvec[] was required for rfc1002")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/202609241449.HlHmnZFZ-lkp@intel.com/
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 fs/smb/client/transport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index 6e21b5f8754a1..307bd82128781 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -1111,7 +1111,7 @@ compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
 	/*
 	 * Compounding is never used during session establish.
 	 */
-	if (num_processed == num_rqst) {
+	if (num_processed == num_rqst && resp_iov) {
 		spin_lock(&ses->ses_lock);
 		if ((ses->ses_status == SES_NEW) || (optype & CIFS_NEG_OP) || (optype & CIFS_SESS_OP)) {
 			struct kvec iov = {
-- 
2.43.0

