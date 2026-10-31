Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793439294;
	b=Gxe4YPf2nM2iJNunRo6i9ohrc3rKP72IWkQNDxVZeveGFBl8xmTynB9adIyL63NUYJdJ
	 jAdw3iVyuTPrbkIpaAI/YAN2qdJ0snSB5b7lv9C63+lA5Fyu8jAMnVSJRoM2X1lyjMENE
	 Iys+vee19O+7Z6moo3gVQyOqs9Y47npPd2aMCGOewQ2TaotE4qh0quVfifGOqWa8Cg9ED
	 QKeh3ecUIPJElw7Mlng8NeOiMOZvjyergANYhIPOfaAH97H2XVV/QPksECY/1w+5sNpRm
	 yH/sPZkskhO1UEE3hCMa7ujbmexBsmHvvNC9Ym+BNWp4mt1szf8x4xVTnW5J5u09X7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793439294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=piH3lxdjVU4RYaignxMIKWlUZiFBMo0J6b65E2PX6yk=;
	b=CgWmzrT/8X7UREeRuJw7A8udSc+emDrAnOUyvdt+xiZ9i8u/yrRYdFrcvSIFGhi2xPQ9
	 KNuOt3Q0cTLbs7UnDtFkgJmC+OJBjeMprAKE9jToklhj5F0/robnFGx5IPUfc2gDakbpb
	 XynmawTrE7lSniY3J30gcls0HtBUh/foh64934W/77Anrv8adLTtW7ngLT3M5xgZIls7n
	 mQILdImzw8iJu2Je97BNwke7tXFin2H0rSs2x/kExvuM6FwgIBCky2ihvy9hkMhb2WpeZ
	 C2xQs/VsMQvtx8aJmDkgr9MIUHJBS5xOA19LdleT9ryVM68k1cXSAxsbcSlEPycInRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v1DszmgS;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A5E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v1DszmgS
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2539460eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793439293; x=1794044093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piH3lxdjVU4RYaignxMIKWlUZiFBMo0J6b65E2PX6yk=;
        b=v1DszmgSoZYMDciLZ55HJCRRc+CJ9TvcBBsl49gDkS5UOp3/4un0PAVswBOrQhIra/
         f6rG+JXUgqNfMc+tTMiThbhWP1/7tBC7rUEyOSf2KVMfK7+J7s11bqLl4fBpdIYjJ8g2
         XyX7JOjRK2X7fED/VyI+zJRNqYa66nKzWa5yRtcWQj8Mge1b3nt4v2xv63zrSdKu3x6k
         nHyql1r/DRPDMCoOMYNFSgfBSCENkdL+IAYABhqMjDUwI7Xbuu/kh6DTNH5FA9mDLYHd
         rLP6ILwAXBwfersVZZpALvjHkS4reyOtMfUpZYqWxekYcifZXkdGeR7y1dOxtv6NRyZe
         tAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793439293; x=1794044093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piH3lxdjVU4RYaignxMIKWlUZiFBMo0J6b65E2PX6yk=;
        b=BnbrX2lv4w4BwM0zlbrHsAAy6ePLNEg7NSg0cSAoOlDcoi8pQLYvPt58Czk4PVEVNt
         bj5u1/0pWUgm4zKE59UWr7eZ4TlfqUla0GvGNhLMqn+TAUD2TalZNY3Lss+yhMbJ/pJI
         7+kxx5WsP/O51yvDdud0EHuBVLhfsC+ubLBo/nzdz7/UyyndMv5jlzh5lEOwwAMbnBAe
         WPdlY7y8ph97XhUQw/5JVCACJINJ3pE+5F8tfQZgowbYXqoyWsUp3lIOM5V8zcUeeng3
         zdDU5P3N1KfDgoS0f0km/PBG3gqtjMOQE9++NS8wLCb7Exwkot/9q1HR9ZXVvvG5TTMm
         a0aQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5loSQTzy2tYdirr9XxfOfhXaHX2Wf9O8GJoHuZlLI647eUUZaFktvENzCTjlHeV62XZwkgjG8jC9VQ2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZQ0GtAPEzrQwLSvdC8Wx/5rV2KWcsa4zYORyWgo3+XLUQiXbc
	UzPWPEC5DBx7Ov9c44mIcd5ug7A0cdrVW30pxiwTj00J7hszmVE0nBVk
X-Gm-Gg: AYBFou11q8G/cNa7tfZuny8zg6Z/3GkqIezkMigXuhBvoavr0Bprv4ryq7x1ZsBsRhF
	WJPgv5JCE478jyYURlOxgin0yT8q3DYkRdurX55YWQGf0Mj9Qfges3K1T3TCxgJjHHbLIedKaDQ
	Jolt69AQb6rKabNKG9yDbsGaCVNg87XG7ppKI2v5o5IRRxUiQB7kldRNdMq4qApdBmuTnoasXco
	lvzj0FYCu/AumVzJWxqaaXA1q3NBw1QwHIUwrmtXMYv0fEh1Q2SBosNp2MITo+e/unWP5Dk2qZ7
	oZifuDM+m6flq1UaUY0jOLlxxUhnO/waW6gs6E5579nONuamT4+VWJGwGtsuWKb5Ae7yzUqHr6A
	Misq33Lg1XcuN/RRjbTdhrO1n4+SXVMx4fo+PWVHbalzIF3WRka2R+Oq3HTARckI9urNwpB7A/s
	yinbEb3dbzGAfUnJ5ZfQp96Al/gVzHf6EmSvcq/5ORASfwP0At03aumg2eSi4qgxcOSnzSi0jIU
	VGQyMqifNcjZIPYHf8jDTP/vn8nluBZ1xkXlBJPOOWnZ+lS+wNTfXjO6jdOFGk8Tjyd0TvyVnsB
	XL0Cqg5SIj1Pb8y31qscoDkAcLepWShxbiGf87vzyW96rCLWQoJnL58fglVTSwa4QuXN9BY=
X-Received: by 2002:a05:7300:d0a5:b0:36a:1b23:a1cd with SMTP id 5a478bee46e88-36a4239359bmr6654389eec.9.1793439293236;
        Sat, 31 Oct 2026 02:34:53 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm15850027eec.21.2026.10.31.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:34:52 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: hare@suse.de,
	hch@lst.de,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH v2] nvmet: preserve ANA log page copy errors
Date: Sat, 31 Oct 2026 09:34:20 +0000
Message-ID: <20261031093420.3017-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031083505.4767-1-sreekuttan2156239@gmail.com>
References: <20261031083505.4767-1-sreekuttan2156239@gmail.com>
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

Preserve errors encountered while copying ANA group
descriptors instead of unconditionally overwriting
them with the result of copying the ANA log page
header.

Ensure that allocation failures are reported correctly
and that short ANA log page reads can still return the
header containing the change count and group count.
Preserve genuine descriptor-copy and header-copy
errors.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Preserve the allocation failure status.
 - Handle short ANA log-page reads by checking
   descriptor length against the requested transfer
   length before copying.
 - Preserve genuine descriptor and header copy errors.

 drivers/nvme/target/admin-cmd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 26028be8fe4d..b0bcfbc94b93 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -542,17 +542,23 @@ static void nvmet_execute_get_log_page_ana(struct nvmet_req *req)
 	u32 grpid;
 	u16 ngrps = 0;
 	u16 status;
+	u16 header_status;
 
 	status = NVME_SC_INTERNAL;
 	desc = kmalloc_flex(*desc, nsids, NVMET_MAX_NAMESPACES);
 	if (!desc)
 		goto out;
 
+	status = NVME_SC_SUCCESS;
+
 	down_read(&nvmet_ana_sem);
 	for (grpid = 1; grpid <= NVMET_MAX_ANAGRPS; grpid++) {
 		if (!nvmet_ana_group_enabled[grpid])
 			continue;
 		len = nvmet_format_ana_group(req, grpid, desc);
+		if (offset > req->transfer_len || len > req->transfer_len - offset)
+			break;
+
 		status = nvmet_copy_to_sgl(req, offset, desc, len);
 		if (status)
 			break;
@@ -572,7 +578,9 @@ static void nvmet_execute_get_log_page_ana(struct nvmet_req *req)
 	kfree(desc);
 
 	/* copy the header last once we know the number of groups */
-	status = nvmet_copy_to_sgl(req, 0, &hdr, sizeof(hdr));
+	header_status = nvmet_copy_to_sgl(req, 0, &hdr, sizeof(hdr));
+	if (!status)
+		status = header_status;
 out:
 	nvmet_req_complete(req, status);
 }
-- 
2.55.0

