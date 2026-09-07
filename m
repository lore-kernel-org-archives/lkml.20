Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A01441A545
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812433; cv=none; b=uqgQrwYB5v8BplDMR72HWVr7jg+dCuAg0w4rkNiQO25T9IofZKrbGkIxf4UP3lFyCJVgI3lh5Xw5Bo98F8ZZ7kBbFlzMXlt4A2Hfb+iy8AvMonCKWhZQ/zzPnfBzC6cm/DM0YI9vitKI2YL8JT/P7H9n4h/oDQke/1cMu5pTTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812433; c=relaxed/simple;
	bh=D3OoCLzA/WlOhaCyWWm23X95M6jgekSWZ6V3R3jvD8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjyuUh8/Aa36m/lbNu0FPUG2cbyhxfzWQl906ZbsvX5L+/00KD0R1+TtCW6gr2t56GbeXK/qe7XTexJRQlM3XIKI12F2PIT/qTg3nNf2EV4n1VkkZviLZfsVJhLUaoY9z8LFx1K+2/U9G5YOSftWqH2D1E7wTnN6eSTHOP4ghAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Pr4HMSDX; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=er9XSFpK; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Pr4HMSDX";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="er9XSFpK"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687IYMNx2945068
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=hoZN
	7B/J8KWpxSnwN7ipdzq/CJN/u6peLjXlm5haPME=; b=Pr4HMSDXFtAozv5UdcG4
	SATaRJrwIHzMiyuwmYtwklrdo/oi/xsEr1NgUOaB+Zz1P5ZH8Fpwo2wCYgUzvCZO
	O5IeiWk6yz8tPV47biZV0nYHhU7ut2rcQNVacoLzRAq1ClCnraVWyRT93tFY9ptC
	mUrHlfp9IK4QF+f3Qo6BsPjFf5stFjuG3QfzDY84LQxrD09vbBj0vxZjzqmq7WEz
	XioQIiDM/VQ+vGjYWxO5SUWg69M69+hJ5nmPjOqRplyjrEkm2B+IPQgKAj+tovt/
	VE6piwDl4XNGsGzX4ljGIVx6SN8JeJAZ1S6A42sVRPg4NSpuCq/JrIg8FKWEjcCl
	UQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghepk5ek8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:25 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so77749351cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788812425; x=1789417225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoZN7B/J8KWpxSnwN7ipdzq/CJN/u6peLjXlm5haPME=;
        b=er9XSFpK6tZOL7+K8DYbq8ZhIZO5kejWu69Xfhj0n62Mb36KkOzNvSpaagc5k1A5Wj
         dSaKs8Fw3Q8MID2+vf3QvS4gXYZOidghFt7F3md3l/AJRK9NkcenhOtSf3QjEjekwrME
         TwuA34Py5Ksb7DE74j0H8FKtyUMNtkToIJnIEcSwc5h5aC6CCJMU/e+Mt1o2W+TP5XrK
         FfN2ZQb15YAoH0dwp99kZOFV+ZurfZ/6/vZ5PYeIjSA0hmJ9Wb0kR6eTT5KTTZF2ssiP
         gsYG3BA0XUXXGBDA8b3HlrzTzF6+NjMjlA537JhCps5BLE3hT4OgKg2Cr0tXER5M4tE+
         X8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812425; x=1789417225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoZN7B/J8KWpxSnwN7ipdzq/CJN/u6peLjXlm5haPME=;
        b=Zbv5zq7xetb84rfNavAUisVaLZ7+L82YXwxDj/Mchr2+xv5iB8bVcr+8exVfGUChEg
         QnMsowJSAT16BFKZzixd8hzy2c1cWi40YN8OYg6g7oHyXIY/NhupbJomfC1XVypepbk8
         2VlBMe//D0/pgTclcuUDv+nQQd90IrOIdbF2KvEAcv+3Z7WNcZV+lmzfLeXtnVoF2sDe
         pTY7yIlYqD8rnhvJXOGaGzWDiHWjF8uNa92kRCWswc+6KR9CDAFiFi8Rztiqo1XqWc2+
         C3ci7ccccN+6rQagsdqTWhwtwsh8CnC3UqqTWrFC2AGn6iht+hNlttASLkAxkAd3WI6F
         DA5w==
X-Forwarded-Encrypted: i=1; AKwUvByLyxyZV2A8SOc3/BHbsYAZIsZMqimGF1XB6NCoGNj2g34sWf8Wm8SQkb7fVm88HJBuEfZv6QxfXdBKQVs=@vger.kernel.org
X-Gm-Message-State: AFuF++n4+Rtz7JYwrJ4IMunX5FNSjAOPj8Ymz+8fThB05vV7rOrjBhvX
	TqaOv6GyQbhn6S2QAYI0QakZ33GUjS8myRB7Hqt21o5UZeC97Eo6N3k07SGyTMvlj2nXTKWpXho
	6LnBQcpbIfhy1PuJMzgK85hwviL11UGsjE8ztrpTcBRlyFhPZgr7MBy8+/PBi2A==
X-Gm-Gg: AYBFou3NIFFGyQvJvVuG5CMoK/ujelDAS6TRrIWdcpP1J9w7FHwfja8Cy0m/h8IDBwH
	kRAl2JZsWlOpw86zOBgUYJZCkomSqARh1NZdHfOvTLLgRvoBnzvRi27EKpAC5hkH20lxnXDNl0r
	amVDIJYsExq3nFOOjDwuNZ2ezIV2KULVvNRRtsRIzuNkxrr0kUfY4QKB7QQujpOqx4+xi2ETWPg
	aw+in0x9QWWnsjAKKR+azpNoxXpTWwdq1yaB1YgEW50nsS45kRV/oU34WUOeukMigs8QNKMB3Fz
	q+ZZYfkIj7x4DEvHk6h05GEIzyZcfLia6GWkWJbseIlxogrX7Z6lzsLlHSC5QewCYym7KMF4nOF
	5EBUk4LvEp1SrmcUMeKp75vx2XMhRrNyu7v9KY8avWCI=
X-Received: by 2002:a05:622a:1106:b0:530:514f:3c3d with SMTP id d75a77b69052e-5309121d7fdmr30809821cf.11.1788812425401;
        Mon, 07 Sep 2026 13:20:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1106:b0:530:514f:3c3d with SMTP id d75a77b69052e-5309121d7fdmr30809441cf.11.1788812424859;
        Mon, 07 Sep 2026 13:20:24 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm95062351cf.11.2026.09.07.13.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:20:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 16:19:57 -0400
Subject: [PATCH v2 3/7] btrfs: tests: use eb folio helpers in extent buffer
 memory checks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-folio-conversions-v2-3-b5fe79f7607b@columbia.edu>
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
In-Reply-To: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812420; l=2069;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=D3OoCLzA/WlOhaCyWWm23X95M6jgekSWZ6V3R3jvD8I=;
 b=/Y5DThE71Fqh4Inl9uJz9mS6vyWbyH++5OFw3vN3dRa9ojK/V9gBE4fmJf+FPqf6Nue9Rggdb
 oCNsgGJrUBJDAOHXheVo9mmHgXL2lM9dbnVs2Q3kgcYSszDh45vE67P
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Wc48rUhX c=1 sm=1 tr=0 ts=6a9f1c89 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=iox4zFpeAAAA:8 a=Vu0au1qQRFuq_hTP11wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: MzNAuiPPFN5XPiEWvAZMuURVBvNDTWIb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX2BTyxeSNY5Xr
 M9V0vYONuc5sNcAtbrr0sWlX4AHVgSK5BFZ5a4VxRRBCjlfZcdhjzAFrdaY12hUl+mFZaeCKMwG
 WWcVP/v9vn3bDswDM98JNNec30sljkJQh6lHBXwZgHyKCkx5roxG
X-Proofpoint-GUID: MzNAuiPPFN5XPiEWvAZMuURVBvNDTWIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX+IuTpykHhYtF
 WGhWtrKLF6HAlWchJfgEmk6dj4fe9doxKymwc5zSCtD48yX+M1ZIA+WP5P4/Fhy6pE8VZdwS952
 NkgZGvWK90ISdPOiPBKjm016Cq338JMFf8Xl/ZOZ2pUJau1Sqjbtq/W6/vUINKL03ovfujMUfOa
 DhvFFVuyTjWwbBf23FUZvR6jzD0LDmaIzQpv0mjDYGgqc/tQyf7d7x90AHp7loH1c9/PH/WJZMG
 /ON8lDFsZa/HpfISHbZ+tcOernkhV2g5CfXKDHPt3tIxe1NTTPmGIT7jJLQNluZoQ+gVAnoTO6D
 4vvhsgAjDCFDaBTqoMxE7xuhoyJlcSaAXOyyJky4WDS+jOlqsMkjynuN+dW9MB+YB+Ck1rCfrNi
 IZ9FN+9Pzbuup1Lp604ieEtCdP1nGw8uZ1QJxi2ZoVfdjyxZoxl+pdz32gx3kR5WYFqA3bnjew5
 deX5YHUoNvDhtvprl/Q==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=10 bulkscore=10 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224

dump_eb_and_memory_contents() and verify_eb_and_memory() hardcode one
page per folio instead of using get_eb_folio_index() and
get_eb_offset_in_folio() like the rest of the extent buffer code. Use
the helpers and folio_address(). This removes the last struct page usage
in the file.

No functional change. The tests only run with sectorsize == PAGE_SIZE,
and the test extent buffers are backed by order-0 folios.

Assisted-by: Claude:claude-fable-5-1
Reviewed-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/tests/extent-io-tests.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/tests/extent-io-tests.c b/fs/btrfs/tests/extent-io-tests.c
index e7aa8bc04706..777caace717e 100644
--- a/fs/btrfs/tests/extent-io-tests.c
+++ b/fs/btrfs/tests/extent-io-tests.c
@@ -674,8 +674,9 @@ static void dump_eb_and_memory_contents(struct extent_buffer *eb, void *memory,
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
@@ -690,9 +691,12 @@ static int verify_eb_and_memory(struct extent_buffer *eb, void *memory,
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

