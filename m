Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC3D4FB9A5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055893; cv=none; b=iNiiyqbGe/1erGiNK/n6pgWR8Ays82XUK/J1pJp5A2cBH4/UKls13+VsStMk+M0iIdWgRM5lWrUv/BRf009CcTba68q89qIm29hJ8CunH4erbURm0u2ROmfpWeSEQ6q6Qb/E5Nofzbp+j1nkbh5on+0J0NeHM+2fM0iaZ5bn7sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055893; c=relaxed/simple;
	bh=jPr6aHaLpG8Cv9vSXXtGXXrD3GWFGv3J7yyXdkKzLjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppY5LbPILlIbU5cEd+bxUvuCGLdIG2w61CyUqzfgsyOZMKDch93p0uoC1XhcpuYggsBPRv7hn5w2GJBmkrnhvMtcJpHseaTPB76Q+HYofOVxUsXWJFEiWdFr8DOOEm46fCq45w3uV+pvgbMg6pQOkjC9MdBs/igx9R5t5zFPa4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=KRvTqxrq; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="KRvTqxrq"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1206178a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792055891; x=1792660691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvbV2vy5EWHtCEzvAlTZKYV1AJ/f2e538Rv/grJak3I=;
        b=KRvTqxrqa0fhAOcX8Ka6qFo77GkglV4mwL3QJnSiPE906tL8QEfYm/Z+D0yc3/6hFH
         B+IOIqnmmjHA6Ff+Ab3DrRM4aTh2m6eoS0xLJrRS5Pcnoq8aRHSiM6PMaNM917OWpzza
         1P7RJYoGS1unuAuV9mhlb+y4tofRWP69mkgZxWOG0OdnQMikw9wbmSC+afuLBzDUx/sb
         p9n9npJxDaPC1PdhizMVIaHVFtTGgGKz+knAkGvNgES4cAKR0uG8gK+WTGnbpUEw1I4P
         56xAh7bE8OtuDcbTF2psT9kLF4K/yE2/PDwJHvm78Z9US9cWJnt3UK0KNB94KalMicRz
         yM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055891; x=1792660691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvbV2vy5EWHtCEzvAlTZKYV1AJ/f2e538Rv/grJak3I=;
        b=unDaFzU9SBrKU3iRkB1BtM38pNyMmIPo85OCFZHslf1ZE3D6zdQQ/apnLJEx9h4m9R
         /JXcMvx7qhfvrtSUIOMSZAQ+iG/xirieRfHZuP/jJ2clQuvQh8Y9e8qydc1daK2epGqM
         gX2YMoPu9303FQyBRAwHDs+LKn1KVCLzoQoAbdy8nfOhucH3od8V31cn5J4XwNO94qzq
         BaXob2cCw33b+CUSIV35/M7Uvi9Xl/qUob6sooipPmXXwmrQIl+q0S0Hst6BiDnFA/Ao
         fmXB+wJVqbFNL5xu9dHvJZ/IHXLp+ZLx0N0aoQOkfq4iUkmLLBZ2g5D4a7Fyus6cujLi
         cO7w==
X-Forwarded-Encrypted: i=1; AKwUvByzcBbLWw+L1oy+Ke5JR3luVd5uGIlOANqs+NJNm34yd6SG6NDFfPKyCL3Ajd8TJf1HIE43a9hUuD4+3Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTynQYVjEoFIGWW5AJnIyLlVLMYcFUNqJVXdQ2kb98m0HWc0PQ
	gkVUkvsrJHRPENWpOpThd0CM40YC+H3agteyicOrPt7L1TqCOMyCjyXV7U+92Wt/QATiFaEk2YR
	PGnJn
X-Gm-Gg: AYBFou0D3tKxBPUhLsdwWWeCTnXfCvx859SRq7D8sFIfR+x/xuGmf6uIu+G258sH/Nn
	WToSVCaW6HQnorPzTukUeasT0yIFzOa1rMsGGf2vJUeypLUag3RB4Uyxibj6BFu1BMDEIoajHUV
	R4FuZrly13rPOUcubcIYEW2jnEQHqDp2W0Nw/0Aw6h36NBLDJ7irLoFeh4TyXylL6k0fDDQubM6
	NxPryAJCjCr3qhziWrEdw3/I/J0+CtLcX3wEw3GOf/zn6qgy+n+dw+sLnu+ZgTM9fgu6rn43XrQ
	sj+at7ZsHIj1+flSqJwpCUW5/t+8B6Ie2i6FT0l7TRuMKUMTV+dXIUJw1jkEt3P9ghzSZOaz3vz
	LeeVxc9xjVn+tkHJjUvh810RIGzaLgcknlARWaerEaySrr1rYEtf5DDO+5hS15t6HG4AeQP7Avh
	6toM9FvfgiIF/Z+QNCSzO1lqHb0OZEnzeYUB2vP3iVy8uMfBdS4zwX5ivm14hhy2w8A+Wh4z4Xr
	pj1Jg==
X-Received: by 2002:a17:90b:574c:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3ac83c10467mr2921470a91.64.1792055890770;
        Thu, 15 Oct 2026 02:18:10 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e821csm3412408a91.8.2026.10.15.02.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:18:10 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 4/5] scsi: aic94xx: bound the transaction context index from the sequencer
Date: Thu, 15 Oct 2026 18:17:46 +0900
Message-ID: <20261015091747.4184349-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015091747.4184349-1-yhlee@isslab.korea.ac.kr>
References: <20261015091747.4184349-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every aSCB the driver allocates takes a slot in one shared index array,
and the driver tells the sequencer which slot it used:

	/* asd_ascb_alloc() */
	ascb->tc_index = asd_tc_index_get(seq, ascb);
	...
	ascb->scb->header.index = cpu_to_le16((u16)ascb->tc_index);

The sequencer hands that number back in the done list, and the driver
looks the aSCB up again with it in three places: asd_dl_tasklet_handler()
uses dl->index, and asd_get_response_tasklet() and
asd_get_tmf_resp_tasklet() use the index_escb field of the status block.
All three go through

	static inline void *asd_tc_index_find(struct asd_seq_data *seq, int index)
	{
		return seq->tc_index_array[index];
	}

which does not look at index at all.

The array is kcalloc()ed with tc_index_bitmap_bits entries, which is
hw_prof.max_scbs, which is asd_get_cmdctx_size() divided by sizeof(struct
scb). The two values asd_get_cmdctx_size() can return are 32768 and
65536, and struct scb starts with an 11-byte scb_header, so max_scbs
cannot exceed 5957. Both numbers the sequencer supplies are __le16, so
either one can name a slot past the end of the array, and the pointer
read from there is then dereferenced.

Check the index where it is used. The three callers already handle a NULL
return -- "Uh-oh! No escb for this dl?!" in the two status block paths
and "BUG:sequencer:dl:no ascb?!" in the done list handler -- so none of
them needs to change.

This is not a claim of a reachable out-of-bounds access: the index
originates with the driver and comes back echoed, and whether the
sequencer can echo something else is not something the tree answers,
since it is firmware loaded with request_firmware() and there is no
Documentation/ file or MAINTAINERS entry for this driver. It is a bound
on a number that arrives from outside, in the one place all three users
share.

Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/aic94xx/aic94xx_hwi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_hwi.h b/drivers/scsi/aic94xx/aic94xx_hwi.h
index 930e192b1cd41..841769a8130a9 100644
--- a/drivers/scsi/aic94xx/aic94xx_hwi.h
+++ b/drivers/scsi/aic94xx/aic94xx_hwi.h
@@ -306,6 +306,8 @@ static inline int asd_tc_index_get(struct asd_seq_data *seq, void *ptr)
  */
 static inline void *asd_tc_index_find(struct asd_seq_data *seq, int index)
 {
+	if (index < 0 || index >= seq->tc_index_bitmap_bits)
+		return NULL;
 	return seq->tc_index_array[index];
 }
 
-- 
2.43.0

