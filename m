Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669370;
	b=BYHgUb6y8grO5lfJfFYmOxJhehoru13tpO4VcfYVL3ChlTL+0i+blA7gyDLwnj9tjxGs
	 AdGI3Zj1TfdN/tm5aevTw+IwjLIBmbF/37J1Nouh7kAKeJXCXoptmU03ytyo+dYSm5gA8
	 p/h/tysdRXjL8A1t9AF2kDeUAlDDVBguqstb2ww+A9AA+eyGYX8K/zM6B7AmNAkX4bzKo
	 zhgMPZuxZgTzGUBcsrFHelsUjnu467EKLhQedzy7Ms/8LndxDnRuE69Nd6CUI3byWxyBu
	 O14e2KxVUosxw3UpovgljsJ+7HIucLG/ilcGpZfFnsA2XSwQPibmRlcEpHaJZJ0xXyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3C+/zJHk6WbojkSaRVu1xcp7XcfcDsCBGR+H6V7CTEk=;
	b=wxK5AQ8DgMrAgQnin0lCEu8Tr/j3tSA6TPiKjIi/1GWW5YKyYQ3qcXSE3o3hDg8AhuFk
	 lk7vdKoabV292WydVXGb7BPFtRbUx+TuclsL/dJ5P+sru5l/eZfM52OjSguBvyCy5g/NV
	 nYGTqfmiQNjWz9vGswlgD2XBxhjZV0HgNlDNcbUjupdfpOwTEYp/TnG4s9eCh4k+JeNiV
	 UeFL5T9bbknUNK2FaR5Es05yLptTi1nYtYqUNM0hdkykBSo12tItlGn0UkFpSAF32+Ift
	 cV1IV4effc0P51j/YE0yPm7JJ94DcA603GvwMkR4OoMVKEklk3rzoNxuce4Ih4RHufg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWWiqlMc;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62111606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62111606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWWiqlMc
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be502e1adaso192902e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669369; x=1793274169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3C+/zJHk6WbojkSaRVu1xcp7XcfcDsCBGR+H6V7CTEk=;
        b=VWWiqlMcSkbC/HwnYQ2tqYKnp4hOyjrPbsUYSXS616otXhLnQLNma9hccrXOsyHYAQ
         XhgxDwlj0dFZs5NVXVKyMePXl/PQr/vfu5ZPLLOZx+a2MEW0DujRZF6r6LeIo5hyj3IP
         wpcuEzV9NQkQFyQEH6xPwGDhp6BwsSAZTfvigNPA4CUAD3QdDXuqcLdHiIq4AOpRPjIX
         twKXR0+yQgaN1MlAt0MU3pSjt33FGwfgv7j2st8ppHfuuGfmLbFZe9WB8NyRs8UtDUgV
         Zf3ar66Z/uAyfqvTkpUaH/wdY8415yq6jElg1QoYpvqYJNoaj1vG0rQ/PMFhhf+lkBIW
         gf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669369; x=1793274169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3C+/zJHk6WbojkSaRVu1xcp7XcfcDsCBGR+H6V7CTEk=;
        b=mLrqMExDf8xxWV8YZnjddsj/UByk2TvuY9z6jU3ssE2ifXqhf9ShGCIelm9ahFX6je
         9LAbA9RWLAmr7VNJcIT9TLSVmrtrozoyWb/rcwWWfiTcPfhf4CFHqSNB4RgDVeQ48G+v
         eZekxKqP4vW0fNccPQbWL6nKsOKWyewYc1oT+ZKouIER8Ewt3gY9cTW0KYFe7dh0hp7t
         kVMgv8shzo5z601YRBw7B9jV9eo/0ShyNc3AlIyxhy2KXiRHQ1uT5FNm8Rxr5INHHf+y
         rYftC/2yupgA7FMRJz8GmsR6s0iDXQuSeeIhqlMEXVx9Ud5R0DLy+iIy6rxGmbr3hnyf
         Dh+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYs7njgqx6Y/UmHMyVSLX9uIiWZTfWdW0rZak60scq9m5FPHhZWqIhibi4MNBO7fKT9RN/KTVVJ2eBycA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZBb2M3JZv0ifyg0C0+sFMqKA4ylpXti5oy8UgcmC7QC5pxDlj
	NjIZGFtxSqe1wpmykccX58FkAV9dfno2yHmHvYh+gfFb8owY0/S55EFX
X-Gm-Gg: AYBFou02LEzXjB9u+o3v7Rmek171QqGi9+t3yfaBSX/BeWzNCRNrQsDlsT1HshRJuJe
	kKDhT7ZV60qKCq8owDmZgMJOvOkkO42HqnJiYmmsRxlhYXkgstR0Y84PVYvfgCj4kUDBsnhLufk
	JSxjR+glAiZnpOu1CUMueIiwaFyG1aJy4tHcXqeitxvgecWDReJqw3mYGdjwA3pC2scj9y+ktOI
	qQn0sxnm5iiAQ0ESgtI2+udZe7z40w6S/+IRunt4gOswP5Ywps8nQ6aRfCMOIa3s3kre/9MPyfO
	FD+0keemGH6YuwdHu0wflJpeOVkLLF33PcA21y3DveAUEGjteanWCQV8NdFobQW/D2+OMZggpVX
	CY+NEMWfY7aGVsXj9Wvk4hrVgEAkLG9L7KMAjxWLEealYJhxeTqDU2GioEUzbxRD6gSOWF9YnUh
	muP+BkM9GRM649z8b+weA4yN74MC6wE8nga7UYkL0cVjHtXE3JVvjNtxHYduSUhvhk34lYF2T/n
	0b3O4xLenHFNVDQZLvoiN7qGPFMZ467623MxsUaS37L/vlvVVAOU8RKhh8hnyMvyIZiiQ==
X-Received: by 2002:a05:6512:34c8:b0:5bf:a221:ef39 with SMTP id 2adb3069b0e04-5bfa221f3d3mr1123072e87.0.1792669368241;
        Thu, 22 Oct 2026 04:42:48 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1b94eb2sm987157e87.45.2026.10.22.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:42:47 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: lvc-project@linuxtesting.org,
	David Teigland <teigland@redhat.com>,
	Steven Whitehouse <swhiteho@redhat.com>,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gfs2: Check gfs2_metatype_check() return value in revoke_lo_scan_elements()
Date: Thu, 22 Oct 2026 14:42:36 +0300
Message-ID: <20261022114236.122037-1-dokunevdmitriy@gmail.com>
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

revoke_lo_scan_elements() calls gfs2_metatype_check() on every log
block except the first one, but does not check its return value.
gfs2_metatype_check() verifies that the block magic and type match
GFS2_METATYPE_LB and, on mismatch, calls gfs2_withdraw(), which moves
the filesystem into a terminal state (SDF_WITHDRAWN).  The function
revoke_lo_scan_elements() keeps parsing the block as a valid
log descriptor, passes the garbage it reads to gfs2_revoke_add(),
and continues with the remaining blocks of the journal in the same
way, eventually returning 0 even though the filesystem has already
been withdrawn.

Check the return value gfs2_metatype_check() and in case of an
error bail out with -EIO.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: b3b94faa5fe5 ("[GFS2] The core of GFS2")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 fs/gfs2/lops.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 6dabe73ad790..2aacd3f774ab 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -936,8 +936,12 @@ static int revoke_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
 		if (error)
 			return error;
 
-		if (!first)
-			gfs2_metatype_check(sdp, bh, GFS2_METATYPE_LB);
+		if (!first) {
+			if (gfs2_metatype_check(sdp, bh, GFS2_METATYPE_LB)) {
+				brelse(bh);
+				return -EIO;
+			}
+		}
 
 		while (offset + sizeof(u64) <= sdp->sd_sb.sb_bsize) {
 			blkno = be64_to_cpu(*(__be64 *)(bh->b_data + offset));
-- 
2.53.0

