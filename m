Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756385;
	b=xWAwIKZicNMOgUuCVxAf214U/WKAUJU8K7HQtnX7TSEmggGd21H2T+p/AoW9RYlN4IKP
	 reWfwuEsmBj5uEvHHHaG5a6nlepJf6NLsbd0x0/2+V8edFwDQbBRjJVI3Mmx01FH00Ad7
	 GMNBppz6eeMynR+TCBTRJQQEgXZK/3P0hfTntm2SFotxCD7cBrOEjcAZZaw28kpWlY+Bg
	 q5fD3JXEyLwTcr8fy8WD2Oap42k7LfbBbnXVBrYSuiIEvsqJA25pdX5LmWeM9PMU8epeg
	 GLiJ1aLKES85esQ3Kj4lFL1P3eFxDd5o2zHJhnkEj90p91nj3mNDuDSVxbABRzcnL2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TaTsYfuLxHhBqdkMeXFHx9EDOOo9W7TtKJpx5ldOBss=;
	b=HBNV80gNB/+1aPK586Z7PbCD5pR60hLQsf8lR5EgOIa8Hva4bQs8Q1n5HKh0vVNesRgx
	 WApCTZf5VbabyhreVdQfr/WSC4cfO34Rjro1CvLtoUrQ5p4dGizgp0r81X+1LtwQWdUEO
	 A9kwySxHc18ugduRGA+NcuiUSyHSIq1OQi2rbnyB0azSUywVNmFcIS7k7kct8vFhzk3UU
	 4mR8mf3iUFGjZq2INxRYzl3/nPCRqsCl3Oq4qMVwZ0t1n1CnYYYaFIkTSR7sRaLrbVQuf
	 K6gxkIPEBrwfCxtNBFA+S9NpwqZLi9TlzuOIY7Px1dwCBH2xNavMK6WShQ3lJYjbxmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZ0o7VH1;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B97F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B97F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZ0o7VH1
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso536676f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756384; x=1793361184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TaTsYfuLxHhBqdkMeXFHx9EDOOo9W7TtKJpx5ldOBss=;
        b=PZ0o7VH1T2n0oaJC/6wRcOdYvYc8otyM4i2atn89dMPbvln+coSJUuk/DUQb3D6GB6
         1wCaXj0lHHVp/Tdql8++xuX7fAlREFqqTr8mmVZishta2e+qXpws34pBKfZ3dULkg2jE
         WzOk3yzgoujB9WkwSC2ilvj/aZMkQ5SU1FKzydL6wRb0SUr363HfIdT3QzkUo9jVB66a
         E0WyPefvykFOXyHXyUUW8gFOJU8wFvmLt3Gg17uPiRYPu0rAYhUDELcoZiKtovvmZTDb
         9tlGIp/ICOWIdfN46P7AsbPdGOHFTQQuhRC5Eh6mHK2CmR9k5Kv/+ZxnU3iJSOxQzPZ3
         rE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756384; x=1793361184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TaTsYfuLxHhBqdkMeXFHx9EDOOo9W7TtKJpx5ldOBss=;
        b=HZaCjgi+RgJ9wdIxAR0RsueO1kjfhyGYhZXuBMHFhS9LAAzvYQywdm+4yI1CXFvOcV
         MDDsLDCaP70c7U8mQIFGypoNuUeoCwRkLdxGaoL/whbkOBv9MALYk8HvqV91GRfHjd1e
         KP3DVQJ1WU0UjiDaZzRWw0MMkuQpC94aP1dZbauVnTTe7h23K0vpYS3Yd7t2itdFrz/t
         ZKeBkdgNzCFLM5SkNpdrTwl87+KnHkTw0BnGXPPfSKzBM+xKtX7FPwoV302I9bRixvwk
         jBB5xITyrG+VxbaK1xzbHEd2yUH//AiMuOWHda6mQDQxpXLPeaz3Q424UpwRSDe3m8hx
         kOcA==
X-Forwarded-Encrypted: i=1; AKwUvByTDfUKxWh2xTzzOgQNYazV9V+h0PSLRF4TTckJqA22T1tfCo16KJo+r3JE2Q3MLz0JN7eqdsOP4cBed/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6u0rm8Ru1eK0BbHLJoI++07gYLFfijUkPn3SZpnWxKMGkQK2I
	KMZulY3oRAOW1JuXg4efNqUe31QtbrDHURjfGkVafaF2h+YS/R/LbzDg
X-Gm-Gg: AYBFou2awltFxOkaRJCw/COD7cxIENqjZWHBr9II/5eos/sTusfoCKReF7T1lqtwbdH
	pARlpZd5iNT7EozsLDDhX/2AeDTqlLlBqYFHx9BmIJkIaCIY8+ohztp3nj2nqHhCHmD5TXiNJaF
	T8LiRB8JkHBIUVeNj5C4y6nzUADUKFypx5AQKVgxDbWl74qofQfdwjJcZv0usRXmxB56CgWeqoe
	ibdHXbxm14O6xXgpPfBe0jUzBJk++VkgSg0dQnDcjx2+wvrltSXWSVdQmksf57LeMJQD8AOPGDC
	rc2lRyu2c/xRoCNUOYS0PoOBytbEgPSprr24ce9TJdfkAlJZyImU8NlUr/x4EKkDFnv2hFNE+TC
	bZ7wl1hVtp46eod24B9aF7qqj/PTcMUCHtdt63CWtmlvpxwavnG9WWcJRss4uSFvj+PmvPNUdR9
	VWDnWv67Uk5pXqQThJ2Slj/fVOwD2Yx6xOW975a2Jz2vz4r99qznKdk756aq4Ju8KPgpUi7xs4c
	483pHFcJT+sAZMe+lvTS3A6EclqwOe1VMEfkXzQuYhi2k+HNu4k6vDwkE22D18vz2dxFwhS0ee7
	ah5ORn9GA1BOVmpK/zHIf89fpnItmAc=
X-Received: by 2002:a05:6000:2b12:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e385962ffmr2119753f8f.28.1792756383503;
        Fri, 23 Oct 2026 04:53:03 -0700 (PDT)
Received: from SurHub.localdomain ([102.208.97.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38048ad9sm4787574f8f.35.2026.10.23.04.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:53:02 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: linux-cifs@vger.kernel.org
Cc: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] smb: client: fix fiemap wild read on empty truncated response
Date: Fri, 23 Oct 2026 14:52:46 +0300
Message-ID: <20261023115246.23030-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
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

smb3_fiemap() treats -E2BIG from SMB2_ioctl() as a truncated range blob
and loops for the next chunk. If the server reports
STATUS_BUFFER_OVERFLOW with OutputCount == 0, SMB2_ioctl() returns
-E2BIG with out_data == NULL and out_data_len == 0, and the existing
length checks accept the empty result. The loop then evaluates

	next = out_data[num - 1].file_offset + ...

with num == 0, reading 16 bytes before NULL.

Reject a truncated range blob that contains no range, so the resume
offset is never computed from an empty response. Also require the last
range in a truncated blob to advance the resume offset without
overflowing, and to stay within the requested range; a malicious or
broken server could otherwise make no progress or underflow len and loop
forever. Free the previous response buffer before retrying.

Reproduced on 6.6.87.2 with a malicious SMB2 server that answers
FSCTL_QUERY_ALLOCATED_RANGES with STATUS_BUFFER_OVERFLOW and
OutputCount == 0; an FS_IOC_FIEMAP ioctl on the mount oopses in
cifs_fiemap() with CR2 = fffffffffffffff8. The code path is unchanged
on mainline.

Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
---
v2:
- Validate the resume offset in a truncated range blob (overflow, forward
  progress and remaining length) and free the previous response buffer
  before retrying, addressing the sashiko review of v1.

 fs/smb/client/smb2ops.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 20624f5dff9b..56b3b183db4b 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -4360,6 +4360,15 @@ static int smb3_fiemap(struct cifs_tcon *tcon,
 		goto out;
 	}
 
+	/*
+	 * A truncated range blob must contain at least one range, otherwise
+	 * there is no offset to resume from and out_data is NULL.
+	 */
+	if (!last_blob && out_data_len == 0) {
+		rc = -EINVAL;
+		goto out;
+	}
+
 	num = out_data_len / sizeof(struct file_allocated_range_buffer);
 	for (i = 0; i < num; i++) {
 		flags = 0;
@@ -4380,10 +4389,31 @@ static int smb3_fiemap(struct cifs_tcon *tcon,
 	}
 
 	if (!last_blob) {
-		next = le64_to_cpu(out_data[num - 1].file_offset) +
-		  le64_to_cpu(out_data[num - 1].length);
-		len = len - (next - start);
+		u64 last_start, last_len;
+
+		last_start = le64_to_cpu(out_data[num - 1].file_offset);
+		last_len = le64_to_cpu(out_data[num - 1].length);
+
+		/*
+		 * A truncated range blob must advance the resume offset and
+		 * stay within the requested range.  A malicious or broken
+		 * server could otherwise overflow the offset, make no
+		 * progress, or underflow len and keep us looping forever.
+		 */
+		if (check_add_overflow(last_start, last_len, &next) ||
+		    next <= start) {
+			rc = -EINVAL;
+			goto out;
+		}
+		if (next - start >= len) {
+			rc = 0;
+			goto out;
+		}
+
+		len -= next - start;
 		start = next;
+		kfree(out_data);
+		out_data = NULL;
 		goto again;
 	}
 
-- 
2.53.0

