Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793234987;
	b=Qi6m+KtwlxkA9Nwj86MN7TPvRBQ7sOwdaIQNi6wIM1BW6FRUXblmIe7IoAp1E5h1pZ2I
	 6WEdhBuPJjwsSfz8frK6PQiK6iwNPrcIBELNapVzGW1vAFCJnYbcrVfNghhnZCv0VaUvQ
	 KHJlVMZu/wsi+VtBiokAF9qxxp0MpHj20JNo3sjdF6OeM71KvopLC22XgHlWiFRyVEUXI
	 oDrIqfg2/3WLwTGeJz3rmk9jGNBxeCVpsmwDrbUfoMpyN6nqDGzy5jpc5gFFxBZUX67Fb
	 WgdLkndH67AwCECicNtOrPfrbNNYokNjW7ehibToJ8Ao7E9gV7r9UmAw2moDjwOUrLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793234987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ln037Pf3YbKMICLinA76e7sVprd2bC8Oq7bCHhU7/t4=;
	b=IAnl2h1qcJB3MkpMnQHnYLs08PGEcV1krVdJtWioBXJDpZ/Dc9fLGVlf7eQ5lZiX+Y+2
	 agNRP22okkT1Vg4EBdxfaX7Q6x3L20KE+oeA5rwMWfTr3qvKReCF3QCy8fMOgd4Ow5xYS
	 MYhjspp/wasFBzcayIBhtz6eSawhMypDYDTQGVMHWLjvjmjWNUWCQz+tgzftWBvoRQAcV
	 m6CTcNbh/adi/zUjL53SD703s+nfj075dfLBQLjn61eAP7RylG4DTBjmYd/i4gkRcn6lI
	 f6hhIwRiz8eCGIcfz2Y196Jmzbz1PxHWJe0t9p1hFDmjvWB/hG1nMXUN5+d+eNxrU0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNxVS+EB;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E3606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNxVS+EB
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so474871eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793234986; x=1793839786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ln037Pf3YbKMICLinA76e7sVprd2bC8Oq7bCHhU7/t4=;
        b=oNxVS+EBLQTXgN9ZgA9vhh/UjS0dd/L1o2EJbRCC6paxeQ1iJpTs7nACX0fUu5MJBB
         CcT5+ty6Viq2+DD1q51ZxYnAWGCRTpVMo/cfWF9TMjBy7xlYAQ2xE+oqlnkh0PHiyDfu
         UpbnY25WeXn8awtDp6O2fY8hp8vEwv+sfckLii7jjTw5sqTQdUW84iK2Posnxr3pXgMn
         BjTJX450ZUXQVfO1JEn+MiYalrtfc6BXBEYsthV7S0QGrtP8aUgkXfi9CIvuLQwtcQkS
         0p5Sw91IuSnqvKlawWbKVhNz9nWgvdY831aucFWtQ0/yyKG8EuzMr1xRxC817atMmMKo
         JBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793234986; x=1793839786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ln037Pf3YbKMICLinA76e7sVprd2bC8Oq7bCHhU7/t4=;
        b=fTbOb5OPQm+w9VnJQzdQBPjwMvputf4+LfaRyLfKXYWwEkU8vRPVvkAWbH4olH49vP
         0/0zj+LC5tkF4g9n58rHcOS57DiYMRScRvTdGItv7BkUZ4t75MuBiMJmV0KOSDwz5AuS
         qcZ6a40tqK4Q81qKEJUqlNMLzPziwRmeRMseWfRxk8Gd7KyhrhQN1SlCsLwUOO1fLlqZ
         +dmnTx2PIFiBZIgsW3AIYjCFOU4FoLwAFMoyl40tzaQlTrFQAyzW2ZR4Ex/FTLDFRMyR
         fKDyuXrrqYlsDyAu0+Aj+i0J20t8yTd5o/EvFh+wXXFG25JyoOXfzkF7jh/3HmxCBOai
         ycOQ==
X-Forwarded-Encrypted: i=1; AKwUvByaWF6axxoHek6qVL0Fi7SeBPz1btUpmUgOwgmtpXbLKssT9vpde5y60T89TUv3G+BxXNuDxdZvsWicKIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYTfJnvS8V+lCxj7uiMsczZtjYJ27L7lsAW5jWkDcynbuOrndq
	aD85MnVk/2CfIs90dc7ocos3GldMKcORRky4d1Gz1c8Um0pBXaG+h722
X-Gm-Gg: AYBFou2UGtxRfZs4uJGDWlk9sNMDNBGjZ3X4K9sJZ7x1ZKPE7FBBUw9+ElTv9xgMqls
	QuxRD/RnRO6kRbdidrmavCh/ATCrFOYRBCzDxE2Sh7CquN7ucncSSb+zmJiBKfMCv/18XysvLyi
	NHli4evcVbFSe6wj1fjRcDtP//w1w8LE291s5WZaaXeoG0nv9i8yeCRcpBubALrr4jeRA6L1Hwz
	lsPn8g990ER7LWjTxUrrc9cyqmZjUuGsFx3b43dfbzf4ZxPGZRcHNV7pGAfyKJiDfigWakJjdmE
	ecr0U5kAzGuxz08K4WfdE9PGt3qUxxu2j8sRIqX3kMQHE6nTORY+zEQAUBVrlIZwUfO71V0plx4
	dcCks20sF4lpm2bMXQVk9xcWtvWWd6+YpOAACkGzmuSGuGUvXRjt4wxkn/zUZXJyLwG+rcYv7NM
	2JZcWGydEVsyXako20o+nC+Ir1U0zH+wm8tx0kBau0fruS/b2kdc/Hm7B1sgg0MGy0GhhZmL1vn
	VmCE+tjTrQsz+aditwq/+bnovLWoGwf/52YyJaixxTmF4PHbnZpfrWXrsGwgM1l1PtHxbKT+AlT
	CcLAb4VTn19o+4JOrzPSIRzSyAZ5h6NvlwR6CM4z6kiKMN1uRJjw+bW3
X-Received: by 2002:a05:7300:d101:b0:369:5583:bf4c with SMTP id 5a478bee46e88-36a200c8c63mr4761503eec.28.1793234986083;
        Wed, 28 Oct 2026 17:49:46 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2399b05dsm11195789eec.25.2026.10.28.17.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:49:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jack@suse.cz
Cc: sortie@maxsi.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] isofs: handle Rock Ridge long-form dates before 1900
Date: Thu, 29 Oct 2026 00:49:02 +0000
Message-ID: <20261029004902.76944-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

iso_date() stores the year relative to 1900 and rejects negative values.
Rock Ridge LONG_FORM timestamps encode calendar years from 1 to 9999,
so valid years before 1900 are returned as seconds since the Unix epoch
equal to zero instead of their recorded dates. For example, an 1899
timestamp on an image produced by xorriso is reported as 1970 by stat,
and cp -p preserves that incorrect time.

Use the calendar year for both timestamp formats and pass it directly
to mktime64(). Keep the epoch fallback for year zero, while allowing
valid long-form years before 1900. Short-form dates are unchanged.

Fixes: 5ea45f54c8d6 ("isofs: fix Y2038 and Y2156 issues in Rock Ridge TF entry")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/isofs/util.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/isofs/util.c b/fs/isofs/util.c
index 42f479da0b28..6f9a90e58a89 100644
--- a/fs/isofs/util.c
+++ b/fs/isofs/util.c
@@ -25,7 +25,7 @@ struct timespec64 iso_date(u8 *p, int flags)
 		year = (p[0] - '0') * 1000 +
 		       (p[1] - '0') * 100 +
 		       (p[2] - '0') * 10 +
-		       (p[3] - '0') - 1900;
+		       (p[3] - '0');
 		month = ((p[4] - '0') * 10 + (p[5] - '0'));
 		day = ((p[6] - '0') * 10 + (p[7] - '0'));
 		hour = ((p[8] - '0') * 10 + (p[9] - '0'));
@@ -34,7 +34,7 @@ struct timespec64 iso_date(u8 *p, int flags)
 		ts.tv_nsec = ((p[14] - '0') * 10 + (p[15] - '0')) * 10000000;
 		tz = p[16];
 	} else {
-		year = p[0];
+		year = p[0] + 1900;
 		month = p[1];
 		day = p[2];
 		hour = p[3];
@@ -45,10 +45,10 @@ struct timespec64 iso_date(u8 *p, int flags)
 		tz = flags & ISO_DATE_HIGH_SIERRA ? 0 : p[6];
 	}
 
-	if (year < 0) {
+	if (year < 1) {
 		ts.tv_sec = 0;
 	} else {
-		ts.tv_sec = mktime64(year+1900, month, day, hour, minute, second);
+		ts.tv_sec = mktime64(year, month, day, hour, minute, second);
 
 		/* sign extend */
 		if (tz & 0x80)
-- 
2.43.0

