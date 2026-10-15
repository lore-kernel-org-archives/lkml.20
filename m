Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775764BD34C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052399; cv=none; b=STPhKC1Cgsb8WjOXvrsIWfjarKp43uzk+aAPKT8u5R7OdflzSilShNHHKg/iiv3iBZjRRmAYhxEi+KoPIWeiXIy2JnhbQ5Z4kWlq5xo7iVSMtOnZzH4d8VaudD80VqoOSo2E5V3xsoBp6oq3+/6nxT5hOJ/Yyjrvg2LdBWflk/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052399; c=relaxed/simple;
	bh=jPr6aHaLpG8Cv9vSXXtGXXrD3GWFGv3J7yyXdkKzLjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJXbpy9Qvn6NgfPzcipqHb3Mi9XZxIr9wdAiGo5sY1y+B5GZFbXe5fmLNqTZ6PN6vml7eX/0hurHdPk6d51s4dCoHuobZ53aj8y+Rzwy492UV71XdzWYxIVZkhEzjlCfuonxL1dinbHrL/xLCIGodDc/94cHlY1I3+Upjw6unAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=P4LOvJGN; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="P4LOvJGN"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso2288097a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792052398; x=1792657198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvbV2vy5EWHtCEzvAlTZKYV1AJ/f2e538Rv/grJak3I=;
        b=P4LOvJGN2dKyX0feuvANyHR8De7LPksG/P0o3d2u7DBlp2E3FCPY/ydtX7OTkI7O0N
         w8Z2cBH8metioXSQfMRvdqI2kWwpjyApFGVyBdiY2C1Fm/zQ+JlY0B1b4m6o7UjkvyIM
         Hh2czmFD58lN5aAsxTW1IV/lizmckO1+9BHV42x1zuubioqfRlvfwMcZ0igUrOZSjaUV
         6sq0uJFenAEtFlcK7qia5e83faZmOmqZ1lNbnL/PBgfxRBwnKNwKzcoEul22xZTdVBOb
         pdazfYEVip797VFefWidwPEuNIDzUf5Eor0rleAR5aGEqO6tbSYx9sYgzri9RwKIBbbh
         A5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052398; x=1792657198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvbV2vy5EWHtCEzvAlTZKYV1AJ/f2e538Rv/grJak3I=;
        b=pgOpLg/qBRk4r/niuKQDUo5XMLPLnJLxGg3c5KwIedai2U9887uwywGquxqInLsEwz
         1UtzTC+dVNsJiHeISFG+W4yFLHPArlSYX99WBakoKna0t15GeTJ8OggI/Bt6Za/vLC7c
         t8GGr0Imwe8VUUR8D1C4I5Nz+hur11KEq1+xNa8B8+U0eJ97zKsCNGAnwWtI41W+tEve
         x+we0oiwcEW093hrzpNhC5bRLQ+1cJ5wBcRly86VREO6/eKSFvMVWtZUWsG82rl4VqdE
         L+RHbVRhaIS6BxGvjzIReUywRhi4o/WRq6wKE4bVjp0aNpzZWm0tdc15NQA6HHhdA0s1
         d/SQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5I08oJ6S+LwUWRIhlkXXmahPhd0IaQ+CM3o6b3X4gHbGpaNUXGzjcpjInImvNjxeECatbeqf3F0TG52A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdUXCAhTbDVhmAbsckB7456iN5zIWSPjSfeZ42jBtFNoWsbX4w
	6Tuw/J9B0GTwWu1K9Wm7X7CN2rR0AZuScqBbO4Kxu+rAj4nCGNwhvgqWzohWxkCAjaM=
X-Gm-Gg: AYBFou1FzNfy/B3QQYFcCH8Pbfi8iEcraMZy+UbrGtyI7b6+ZIp4tey8PQ2efyaqG8S
	UzGXkPp+u5/lA3H6lLRlmrUb4GuRKJlrQOgvjLX3KHO2UF1ro+qPrPnkDENvVnPL59bfAC4nXU0
	ZEypgNP/7d0PeliRJ7KIzenxIXfTnlmgweYyVqFKakOKbERVuO1jQKtE1eSrLXln/r3rztWxn57
	BeIFMlG7ojqpZOnTqLvcoky2ME0Qh1Z1sdrR/cHMUszOgrd69XhtOaw5VJzKskNbUAyusEiAoNJ
	maWJ5nkgqFbbl9U2G6wAACa5mOYMjtxoTi4BZ/UNEKgVuGxszKdYQl57NIa1A/98xYFeqBGSqhA
	m4brDUji5ZdpZy2vQkqTzpJg/5AX4qILk8Ajc2EZPVKFp9SbBB3HiWs6BG3tf7lvPvh2bT9HDci
	Jn152SF1ernymZlSiEhHGUIV6yUQwCDkrAkMH72Yie4ldYuj2IrPBC+P1GeDjc6SS4RqSXzDLUz
	OJGyA==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr16029643a91.22.1792052397731;
        Thu, 15 Oct 2026 01:19:57 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm3319784a91.2.2026.10.15.01.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:19:57 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 4/5] scsi: aic94xx: bound the transaction context index from the sequencer
Date: Thu, 15 Oct 2026 17:19:33 +0900
Message-ID: <20261015081935.4168771-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
References: <20261015081935.4168771-1-yhlee@isslab.korea.ac.kr>
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

