Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0F3BE161
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733798; cv=none; b=bFf6GVLt4CfM5XWNq2VmnjIqfiVC/N/uHltN3qCS/mspH55uD6GXjI68AT5JmoAtP1iu3WXs7sTIsyjgco0Eg0S0mcjOjxc6GD8XWbDzOHakxKkHbnDy0CXrNt2nHDI1s4cMBgWB5PUNZj7Fes1eA5nks4aJEnS1HQPjXZqWQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733798; c=relaxed/simple;
	bh=Hkc9N/wQnPcy5buqwz6C0KvUQNctJoFaOYafrURHzho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3ZJgamLa7W87GQFMyWlG37/mLccXJkApT6a43ru/gsThBu0vOKQ2TtneVAt6Fog3HuWjY0JB6mUpyVauiXBUiTBgkGfWseXh1HS36JumPXUnDxqNk+ewM/iGrffIxm3LgW5hmD6BvcxWk+5Ll49rBu1sG8Z/vBx8b/L2ugBKBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Dju04wNc; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=GG/lBvVG; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Dju04wNc";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="GG/lBvVG"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686KY8Fn439540
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KC9I
	uSFqPl2DT5AtFsBj64BwQeweoIQ/q7eyjkLDXpk=; b=Dju04wNcmnCDsyALxLYg
	e/ZsiP4lJ5+iN4XqUgNZrKyLkIVYi96HAjhBEkSHvsgzy7hXH32HwEwINO9FeeJP
	VARsqPIcSQvlULQxkDyQD4X2AObqnj1ftHqw9u7LcD4JeLhLDD0WkB1gremLpYXu
	DIB6jciiF+8y04JCzViePOz9HIqoOPxH6duqmWwkW7WFJzzSQLdtgMKUscYjFBRE
	j1lod/a+4qm9b1MJV12nC0khHPYPUe64RQWTAqjYmeYQ32sVON5E7QvfFpoO8tR5
	+OcLTR/8QWqsDmJjhjYmWaM8BTdPP6dnLmdhwYN4cSNUqvuTpjqtPebWOV3Y/jwb
	PA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghfawrbtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:29:55 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283df62d68so53352591cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788733795; x=1789338595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KC9IuSFqPl2DT5AtFsBj64BwQeweoIQ/q7eyjkLDXpk=;
        b=GG/lBvVG4RRo2Lm/nu+aouq4Xajo0iEqnWzxTySJZDiTjabkER8oGmntkZNiBx65tM
         hia9Mj1irw77GDfW/R7ihlInumHYtY1477WsvvE/209HNyVpppOL1FyJh6nUzANN/Q0I
         s1ooF4YekFOxrqjPDvoJwPan8Rt3tmXOfXC+KTYK/0OSnzkVxjkVSUD1d6x7ckCe098Z
         JA5OgH6xRqVxYO/yKHadW5/XyrzKbD5ITGg06roACER0sD8Dui6LAXn9umBvWE3MNft6
         5cUjmcJfSx7gYkv++NF0HPjDAuKt+bWgcW7HgmHIUeC9RR1EPdChFegisAMP/gEzs62t
         XYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733795; x=1789338595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KC9IuSFqPl2DT5AtFsBj64BwQeweoIQ/q7eyjkLDXpk=;
        b=H7WH0qNVO5mWOdJDdpfDpRDoB8msoXGVzAPPP3+rRNUQkQd2qCusJsIK5cdtMdSFk1
         y5kI//kP9DeAIBxDaEz0tefHfwJNoMV7xlhIJGCURstJPemeFAaV1cFDmGjwNfyPgiU6
         drlhvvJMbCNwcNv8mXGsBBO+9VE0EsUPrqfnOFkEPxtuvbSBHTpfvmVaSP+2CnNn4Mqz
         dqNCxs0O8B6a503j41Rc9FX4ZAm1lQipLo19AvScVkd0hIU5MP+GJK7rBhcX9IwwlUfl
         MV11mAbrLi32Nf/3kQo+IMRSrcqtYY/k56MYboAh4PRXDkxZ7bR0wrtnvX0BkY02yF0v
         c7Dw==
X-Forwarded-Encrypted: i=1; AKwUvBw/8VtUa4VjYor+IX4g4YXU8+V08kgx42dg5NCBOlmE8HOF6vQJkx3Cf9V7ZJWHppHQM6LFPuBUAHAVHQI=@vger.kernel.org
X-Gm-Message-State: AFuF++nRTtJuxAmD04VTKG6CNNThafl/NKzg41S02PI2Ycte1DmDzfQD
	MRHQu4E1OCaTbFWRzBq6A3kdsg2tcMUaYuRWJxkY1u4ubuojgdkgaJlNfGQ16YWOv3/03wie4q/
	vU6Bi3lzAQBVGanBlCNpXZ2QwmPxgGCNLU7vzxX6g17JdrdxqcnvH6b3pdYyqZaaF4Lzeys8H
X-Gm-Gg: AYBFou1V/B44zBwIa388qLXIVv3zuinrbTpfCQo1A0HKOvZhOlShrkv/j9X+vsB/MIG
	Wk5X7kAQXEy7i85crJwUNur71m9QLPlOu3Vi8Hoa6+8w7+k6CrC7iZUDbi2BlZJ3GIHBhIrGdjq
	mlatKmU0k+SOasCON6q5/tdEilb8Y7uD0bTMXzm/vQ02GUdMLGIHLAo6Mp4F1XiFzNCbH3+JzIs
	zhbNgWD6jnD8+P1Jr0qKtpe0pIBmyJWOyJkFdBaBYVQKergfbqtEp2xfNjMMvRHFHriTPoiz1dp
	QCh6UqTki5+awisicIN8oDCSbKZ5gw9uWFYPB6RyiNRTNHgQs4TY/3gUJiMa+PhohdEO1bj5ajm
	Fkwm0byN89GL3F5i1al4ewq8GZsM/Qtc/ECKT9wmjJ2lOV4Nn
X-Received: by 2002:a05:622a:6203:b0:51c:f3:34e3 with SMTP id d75a77b69052e-53054962126mr222231771cf.28.1788733795270;
        Sun, 06 Sep 2026 15:29:55 -0700 (PDT)
X-Received: by 2002:a05:622a:6203:b0:51c:f3:34e3 with SMTP id d75a77b69052e-53054962126mr222231461cf.28.1788733794785;
        Sun, 06 Sep 2026 15:29:54 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm73048541cf.3.2026.09.06.15.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:29:54 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 06 Sep 2026 18:29:30 -0400
Subject: [PATCH 03/10] btrfs: tests: use eb folio helpers in extent buffer
 memory checks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-btrfs-folio-conversions-v1-3-834b9d7b06f5@columbia.edu>
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
In-Reply-To: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788733791; l=2030;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Hkc9N/wQnPcy5buqwz6C0KvUQNctJoFaOYafrURHzho=;
 b=zyP1Otl9DtQs1g8FRbFXY4ZcLAv4fMzrlgC+7GqkKpwLKAjzopBK74GyXn46YYwn9IXfcdhfu
 7vtAK9PsZA4CPe6zooKDIIBXIap8HX5liFoDR7ysbK00hm0CBEZOxj5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: KqXH6DgZlYztGtKCyzk3UwD_oTX2qnVr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfXxTY3YUX64Lsj
 MtXW26CxtYLg8bcwZH6DkDn4uf372QHAdZofG1E28Rc40Q1u+Kk0b5jRN7kky/2XNhJBAHqgIhk
 VOvzC65vwK6ppozNjPrftknip3CzSEGhLU19hORpOp4RuwEypM9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX8klC+AieB3Pd
 b0IoXXgKeYM6ta/DHKbklTlClAci1MinpS7VGkgWlBK56P13ThCRwZ1HXiQSu/plZOpytUqZmm1
 BD4+ioyWYvRktQbX6HHkcLuc2Lq/CKyXoyf9kRLriYYogyrdTAaPaGoPPsOFabM2NeNJnNwffvY
 Y8wnh/OJM5f4Zm1RDEZlOTIpYxah/gXND4d7ap7SLxZ8uvgp+9SErIFQkqPVqubrqsvrg9WknLt
 4O9suC0vIzoHTguCBcLTpoWe+U9PWl2kcihmzxyNhb8y1TDG0xPbmEwNAi0tK+aof2TG+1YKq+V
 h5XDtP8RsMz9PHijtl/87k7l+rC+TnERV3pWmYg7e9aKq8tdsZg+q5fHytuScpjTHBr3nC9b+P2
 DS3vJzKHKnYUF89lieh13ZQp6AN4isXlP2lMPwIc8XZXNWMGDB/RBtMmMb8GSv0RVIgTPLpxY6s
 cNdIZdCwMxqx2J2qVwg==
X-Proofpoint-ORIG-GUID: KqXH6DgZlYztGtKCyzk3UwD_oTX2qnVr
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=6a9de963 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=5XjfI53T0xRJ3RmVdd8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 malwarescore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=10 phishscore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060252

dump_eb_and_memory_contents() and verify_eb_and_memory() hardcode one
page per folio instead of using get_eb_folio_index() and
get_eb_offset_in_folio() like the rest of the extent buffer code. Use
the helpers and folio_address(). This removes the last struct page usage
in the file.

No functional change. The tests only run with sectorsize == PAGE_SIZE,
and the test extent buffers are backed by order-0 folios.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/tests/extent-io-tests.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/tests/extent-io-tests.c b/fs/btrfs/tests/extent-io-tests.c
index 3056dd934b54..7a68b321608e 100644
--- a/fs/btrfs/tests/extent-io-tests.c
+++ b/fs/btrfs/tests/extent-io-tests.c
@@ -669,8 +669,9 @@ static void dump_eb_and_memory_contents(struct extent_buffer *eb, void *memory,
 					const char *test_name)
 {
 	for (int i = 0; i < eb->len; i++) {
-		struct page *page = folio_page(eb->folios[i >> PAGE_SHIFT], 0);
-		void *addr = page_address(page) + offset_in_page(i);
+		const unsigned long idx = get_eb_folio_index(eb, i);
+		void *addr = folio_address(eb->folios[idx]) +
+			     get_eb_offset_in_folio(eb, i);
 
 		if (memcmp(addr, memory + i, 1) != 0) {
 			test_err("%s failed", test_name);
@@ -685,9 +686,12 @@ static int verify_eb_and_memory(struct extent_buffer *eb, void *memory,
 				const char *test_name)
 {
 	for (int i = 0; i < (eb->len >> PAGE_SHIFT); i++) {
-		void *eb_addr = folio_address(eb->folios[i]);
+		const unsigned long offset = i << PAGE_SHIFT;
+		const unsigned long idx = get_eb_folio_index(eb, offset);
+		void *eb_addr = folio_address(eb->folios[idx]) +
+				get_eb_offset_in_folio(eb, offset);
 
-		if (memcmp(memory + (i << PAGE_SHIFT), eb_addr, PAGE_SIZE) != 0) {
+		if (memcmp(memory + offset, eb_addr, PAGE_SIZE) != 0) {
 			dump_eb_and_memory_contents(eb, memory, test_name);
 			return -EUCLEAN;
 		}

-- 
2.39.5

