Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAC352B1FF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912955; cv=none; b=UXgbemKDPvlSOTJtl9rZZHy92+/cul/TSHkrSm2Zw4/VoaC45AS2gwdqHLnQ6W2krvlngUQdRk8QnjCygVbnuSMUO9eGe4BCkVB2Q7i4bNzWAuUpeFKzN0D+QAVNM3zE4avHLxcWn6p2+JafnC2xfoBi9K+by71pZSvKGtFw3IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912955; c=relaxed/simple;
	bh=lgDJ0JtWigmwOVnRmfUIilQcNGRXRE2L0/dPjGSB/6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXIPCuXszAl8zvp6Eo+YRt575eq9GfmLu85kjkRgJi2/sE2f3GBvcJ0Fc6lHCjX/Jgalyd7ZBtvOdNwLM+8py2DtDDQmEUcFxBiQsHa8tSnzs9Ow2ciXVXbV7ZUQT40KuBrKAAayf9q+DgdWNvZfIZaeRTddn6xi0WDREQeQ+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=e/vdyxsS; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="e/vdyxsS"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so51758a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791912949; x=1792517749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvR/1ROxn6YzE4aqrudO/0g8Dfn5SQqN2g0aeRLqJ5I=;
        b=e/vdyxsSAqay+ilYXvnwdyNbraHvM5qvSo05Pn342eqBME6naAIJxHsnGoVbWCSFtY
         oZl6HTBU5EtJcw+PxCNK71K42J0pa2yoiJVbgs36HqlKKFyznoQcYc1Bl/TNnY6oREx6
         YoMcYy1u5JI0MQQpNJbzpWlqmGiXpeBLm5G4O9/3UUFHw18GgGvkiK8pCkvsIOufthsH
         ASUQWCedgRAtgv/egm1u1NZa3dY4wlNeoyiAjQA0m1ig6Scqdd+BmGlAYGL5YJ1m+5dq
         /SyeUNAWZWF4MhDT1KIXfifZo8WAmjj/JYfWFaPpWoNYSvq7HfTcPB0+eC2gKvYRxCY5
         t5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912949; x=1792517749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvR/1ROxn6YzE4aqrudO/0g8Dfn5SQqN2g0aeRLqJ5I=;
        b=wB5aIalxnys59VV+rERmElWPiS0o3HhrlbIhFqJyOOGW0CjxhCcSN2tHti/ZbUoko7
         6aQfQI/Z0TA29/lA9hCdFEuPd1Bnb6iXNf7pT4ZlxNMx+So6U8Nhkq+f2JxJytMz63+w
         dVJE7VWXP9L4jGs2MOpAdRcnsfLBW3Siz1e4dMIPbBxUNpEPglR3wLDVg5s8f1PoNTEt
         YM42ML/8J00fFahnCeqvUh9WAnNtcrW2wrNmTe2D/0Ijz2sWxBXimc1sWeqIdvmc53hj
         XCqzFWu3L+MgTgR4BcZofWec0/b0vtlM4/x4vZ93Skq+oXK7eBb1a7jR8gufryHFQYG5
         kplQ==
X-Forwarded-Encrypted: i=1; AKwUvByFyHUyBAwva9RHYjmQqLwMCHsWBHp7xABq0ST80io5Wwhh0YVITVEdOInxiykKl44sAlpSEG3v40rtVhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOXgS9EJYntmy5mXOFshgsZzSN4dojs0d6A8723rDSfmA9V7oI
	OF2iylr3FK7tBJnX9JTCUcS5v+t4Qfu0xv1mn8/Ywp+orTOlZ8938/5qwMDistP2y5Q=
X-Gm-Gg: AYBFou2nsWvsUzf5julr+UkSm4y/DEwgTwvwDYpCU7KpVPh1je0xtevZQPKTGRO5GZn
	+oGPHKwJrxxwD5+Zjhent7g1DhJUxKRRe+MjWcjKY51Uj6r8dg1yIfV/o7V6viYlIqMuqzBLZdh
	v4yxKxRv+zyPduWtRiLIrKHbiszPHbxzN/Zieyw7hf/JTRzdFl1DNeqpeR1vm3dsQ23AGBX6lLD
	QJvmFiareKCegbQ5DfYlfsFNfp6NNW0HSNfMkJRteTjNtF7FedMzWK+jXZXW/5te+YmmuEMv/2x
	iF6pVbf7pRvufzE8YkrxSLzgzvPxpeCcdp1NHPExrQSfRC6V2uXIfB/5qKuDkcSm0brccDb3kIv
	QIw5NRH+XqVsb6yoof3Kra4m4lf15dkomW/2aCucPclDOLyV2ZjC9UL6O8A7uixeK9dsZrcTEZi
	C7pSxx/RCAqrJhcLrj5FbBbDg+YNXaTvG/rNJ7AVaiMUhMSWVUCAozAedxYZ/ONBmndhSSX9vNT
	163QfamLdHS6vLlTw7T
X-Received: by 2002:a17:90b:5346:b0:3a8:1830:8b9f with SMTP id 98e67ed59e1d1-3ab3a9118aemr9797166a91.16.1791912949063;
        Tue, 13 Oct 2026 10:35:49 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6325e7afsm133859a91.3.2026.10.13.10.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:46 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH 2/2] scsi: mvumi: reject an out-of-range handshake frame length
Date: Wed, 14 Oct 2026 02:35:36 +0900
Message-ID: <20261013173536.3414059-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-170111@kernel.org>
References: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr> <20261013161620.3210533-3-yhlee@isslab.korea.ac.kr> <sashiko-outbox-170111@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

[High] double fetch: fixed in v2 -- the handshake frame_length is now read
once into a local that feeds both the bound check and the checksum, so the
device cannot change it in between:
  https://lore.kernel.org/linux-scsi/20261013173145.3412863-1-yhlee@isslab.korea.ac.kr/

[Medium] endianness: frame_length is a native u16; mvumi reads and writes it
without byte-swapping everywhere -- the existing mvumi_calculate_checksum()
calls and the driver's own frame_length stores -- and mvumi.h uses no __le
types.  The bound check follows that convention; converting only here would
disagree with how the field is used elsewhere.

[Medium] handshake abort: this patch already replaces the unbounded-length
infinite loop with a bounded rejection.  The remaining behaviour -- the
handshake timing out on an error return -- is the driver's existing recovery
path, shared with the checksum and page-code errors.  Making
mvumi_handshake_event() fail fast on that return would also abort the
FW_STATE_STARTING restart that mvumi_handshake() performs when the firmware
reports a non-OK status, so it is a separate change that needs the handshake
protocol semantics, not something to fold in here.
