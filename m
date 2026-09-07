Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECB3F6C21
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812430; cv=none; b=NCy2jsOZSPBpJ7936n2gdrCtceH1A36yTRS+XdlkWK1Rs91cEoZ5brXbGv8mHdWPWE3HeC7GSuK4wC3BOfxd2GwaHVsXFn4Np3TuD9TH+0yKP4aw5w0OWURa8yI2Q3JeNsy6DFSIDFxaZrKGDMLbA3A43+1TSuhIVc+vi2nRvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812430; c=relaxed/simple;
	bh=avES3bG48BLV1EAoCdOHxxuCdmO1REtwTj45aoG+V+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJb6j9VufSenQMqoan5qJ865MKeItvpjERrEFlzJLk2BQX18jWJxHkaUQNkf06vY1FyHg4GJ80dKl059iURqgCLzgiVkfJMJg9Qrq/UGGRosU52SCNXLI3Sk+d6w+wG5VG9iVtYKbl/ySjeoZY+EppPeLBSKBRsAzU/HVGHndDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=F7ykB1aW; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tVITpLer; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="F7ykB1aW";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tVITpLer"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687IYRNT2945177
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=tgPL
	3vWXO3hhdRWSeoslHgoDQM0KiG0xJ73uDx2uH0Y=; b=F7ykB1aWB8Sd51fi1N62
	6Zn6Xd1AKTyAVV3R06c2AehkbLf6ip/arw4FlV6JGAJu0txRm3+dUZRvPVAb3Vvl
	jdMJede5LUStSiONd937U5aP7iH7rs2RvNc5e42ItzmPg1H+JCPdCwbguEZGF4o4
	Hlax3EyAkl2gPMKsiTncg9shaMtB779VtnA+kkRP0zuwc3mno3jpajOnImW4ukYW
	Z/lgMIwZs/k+6d7W1dd4GVHPsq0RAPukuZUX7777dd0Ag74+JFqHLK6xMXDuoU6O
	GZvWEiY367QeSgP6cqbmmGUevWQtkj/DqrxqMi3H01y9+gCWRirBomFq8V4Bcrjg
	Qg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghepk5ejs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:24 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc0097865so101253101cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788812424; x=1789417224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgPL3vWXO3hhdRWSeoslHgoDQM0KiG0xJ73uDx2uH0Y=;
        b=tVITpLerDJj7Mkh1878bt8vagalozRV1iDZBjE/KduJn+PUyb5Q5jEeQF2nEZNUHOe
         Z7tOPEalyAfP8YZmdcR7DZF/JAwDsvGIYMIjVb8eF3Z5QsQeVP9V63nwamZCxyukthEG
         kWp9ijFn/sJwz7FVNyNdm6/8Eg7LHUvntgNhC8Ow3t3H6Gv9aPA+o3afVhyBOpRXip77
         E5Ipe8BJrgBVUAP63c5JoE3pS7VscmI64dyQcOZjEv1drg2fUdJccbdl/9FgQDNSF3I8
         9Xk4JZ2w9w8UAzQN/IHxXgFsFRnyyTasi6+cNeEWqn0o4Fj1FsezKhpUQxkHLOVs/2ra
         /Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812424; x=1789417224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgPL3vWXO3hhdRWSeoslHgoDQM0KiG0xJ73uDx2uH0Y=;
        b=Zm2TNxkzVCXlPD41wBY81F0RykBny3VTQ0zgPbOHA/rJoTrAnLBRSu+DWAYRWcAL9O
         i06VyiRuwvU9GdqPebbk371ymBeidCCfvoHz9RngV7hHTAcR3RPIBIqLP7YPATsKcm3s
         gmhKK4LFsjMWjO+i5anV6/JbfluBsPlKq/gkPhCMecZuLIEvqQiLnT6vIF9D1x23HSCl
         tJW7k55CAt0vnp38Z669pQro9CTlBy9P6HagFo9NGlRiPP7NbU8po3ZanrFZQZFAdrxX
         tZp3jtFAIxck9DhwaC+v9ox7GAg5Bw0uu0pfyfdP6c/QDFVpuNwFsM9Tzi9ciGe5Nvio
         q5dw==
X-Forwarded-Encrypted: i=1; AKwUvBwnW19ruBsAoBtfr9AGjgclOB7TT6Bts20QohAfZyWTcZGcJUZ1VolVRk2IkXb8EsA0GgsVG2ZmXQgt04g=@vger.kernel.org
X-Gm-Message-State: AFuF++kVo9eTMYHC16qmc6eLQRPZx62zVG/4rB7pp/4vKQWEHBC2DU9e
	T7c1jcS/oVEK0Hrv1o+lNvy3C/xZBe4A8kt/kDuMs628GRzflCm7P6hJGjeIH2ViP/MIA48UVmN
	g3qzyEuAkVG1ZwQzZuICMw93MfIE+6fLJerPacbznktJmDXDLEV7+h8GG0S/gPA==
X-Gm-Gg: AYBFou2DgxT7hX6eTZdw7xkn0ap2VxJdWgkYiL3pQXcfNJVzmFKNETIpIj779dmP4WG
	HL7sMS1Taxc312qHouTxiur0wsmgqOAOwqjTc8ikd86OFwBxKsaU5YbA3/+Vy5INdOVLN/SXmha
	GmO5jDyruscfRS5EbxWaPvQLEkyBmcESqaeB7/s0oz/USmesSwwuP022kVVNdfFic6QA94sz4ce
	6mKG7VK8Fpyh9YfGEcHGxwia6ogtlSRokEjOgwdqeqQYHB0AyckGqV97XnBKjfGxy9f+1PrDdGP
	llcZJWQQgwUmnpuy/ij8JgleXbGJuA38gnaDC+K8cirOGiK0wjzk7HOGuk8wMO1B1RP9pyTkhsq
	tgqoi2af4VURsXsR6RF8PFjJcwTgBpl/qbOEJ1vyM14Q=
X-Received: by 2002:a05:622a:d19:b0:530:74c2:2a59 with SMTP id d75a77b69052e-53074c26c9dmr131540881cf.37.1788812423900;
        Mon, 07 Sep 2026 13:20:23 -0700 (PDT)
X-Received: by 2002:a05:622a:d19:b0:530:74c2:2a59 with SMTP id d75a77b69052e-53074c26c9dmr131540311cf.37.1788812423425;
        Mon, 07 Sep 2026 13:20:23 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm95062351cf.11.2026.09.07.13.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:20:22 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 16:19:56 -0400
Subject: [PATCH v2 2/7] btrfs: tests: convert test_find_delalloc() to use
 folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-folio-conversions-v2-2-b5fe79f7607b@columbia.edu>
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
In-Reply-To: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812420; l=8635;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=avES3bG48BLV1EAoCdOHxxuCdmO1REtwTj45aoG+V+0=;
 b=u6Z/NPXQqwpX9Hxw2oRzDdYGukmK5kzfapX6Oxaso1TnfRrJgYfbRicx7YCy5KNoytDTDShhu
 Y0zOj0toVa7BaQL5HW4srwnGl6ll7TSY8EfT+2MY45ANzrPkuBpQN0x
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Wc48rUhX c=1 sm=1 tr=0 ts=6a9f1c88 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=GGKBf0zGomX5QsxccnIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: dp00c6PYZ1smzjSP_Vf3u5qkfDSFXPXs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX15S6L3be9xh/
 NQij3ZK266x/uSyQjA9E3qm+362XKORFNtqDYCUq/h1GuPnJIXz///61/EOGG6lyFDuUHLBNuZu
 WR2/TZZPPOPCA3s6lGsXikp5DnwBix+CKwbf3uMU5k2aJ9aMXbxl
X-Proofpoint-GUID: dp00c6PYZ1smzjSP_Vf3u5qkfDSFXPXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX/0fEIlCpKGBo
 sk5EumDKrJ1hc2cNmAPLUipUg+qQQSQ6T3PZ4nIwWSbyLfswd6erzrpo9B/4oXQVj9H+dYXRcGv
 h24cdolEWysIeK6RGzs3CsXhgEWe0M6pBSAaKUKa5zjEs7t98yca+NcV0x6dmvB+Qfdt7PJAZvM
 +7z+wMu1v9JE133rmgOFXokfwe1pNkNZOgvVZDovto99zzFAwtllmT3o+wiiuFkexzlKZE27CnW
 XEFQW8eqOo4k2rcTZbFJz+muJeDfaZ5O3PeoEXOAuzbFgemZ+Sq6y4Iod+vyeITENV917VeBIjp
 ZxCqHr2Zagq2m31JuXlz54S+7MAf60rQsJ/zcZqZDK/bB3ktB/Poxqa6isqyE9H6W/MpdegpzlW
 ZuhbkhHHuQKcAfHJa7L5rDB/6aHE7PBi81C0/0EW1YkSOTqVMtK/PC1C6PyJXNEgr4PPKyS2Qd7
 kLyVXciLW5at+KkREhA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=10 bulkscore=10 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224

This removes the last btrfs callers of find_or_create_page(),
find_lock_page(), SetPageDirty(), ClearPageDirty(), and get_page(), and
15 calls to compound_head(). The folio lookups return an ERR_PTR instead
of NULL, so adjust the error handling.

Update the comments and test messages accordingly.

The test still works in PAGE_SIZE units, which relies on the test inode
never getting large folios, so assert that the folios are order-0 where
that matters.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/tests/extent-io-tests.c | 99 +++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/fs/btrfs/tests/extent-io-tests.c b/fs/btrfs/tests/extent-io-tests.c
index 6eb55bfb2bd4..e7aa8bc04706 100644
--- a/fs/btrfs/tests/extent-io-tests.c
+++ b/fs/btrfs/tests/extent-io-tests.c
@@ -112,8 +112,8 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	struct btrfs_root *root = NULL;
 	struct inode *inode = NULL;
 	struct extent_io_tree *tmp;
-	struct page *page;
-	struct page *locked_page = NULL;
+	struct folio *folio;
+	struct folio *locked_folio = NULL;
 	/* In this test we need at least 2 file extents at its maximum size */
 	u64 max_bytes = BTRFS_MAX_EXTENT_SIZE;
 	u64 total_dirty = 2 * max_bytes;
@@ -152,23 +152,26 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	btrfs_extent_io_tree_init(NULL, tmp, IO_TREE_SELFTEST);
 
 	/*
-	 * First go through and create and mark all of our pages dirty, we pin
-	 * everything to make sure our pages don't get evicted and screw up our
+	 * First go through and create and mark all of our folios dirty, we pin
+	 * everything to make sure our folios don't get evicted and screw up our
 	 * test.
 	 */
 	for (pgoff_t index = 0; index < (total_dirty >> PAGE_SHIFT); index++) {
-		page = find_or_create_page(inode->i_mapping, index, GFP_KERNEL);
-		if (!page) {
-			test_err("failed to allocate test page");
-			ret = -ENOMEM;
+		folio = __filemap_get_folio(inode->i_mapping, index,
+				FGP_LOCK | FGP_ACCESSED | FGP_CREAT, GFP_KERNEL);
+		if (IS_ERR(folio)) {
+			test_err("failed to allocate test folio");
+			ret = PTR_ERR(folio);
 			goto out;
 		}
-		SetPageDirty(page);
+		/* The ranges below assume page sized folios. */
+		ASSERT(folio_order(folio) == 0);
+		folio_set_dirty(folio);
 		if (index) {
-			unlock_page(page);
+			folio_unlock(folio);
 		} else {
-			get_page(page);
-			locked_page = page;
+			folio_get(folio);
+			locked_folio = folio;
 		}
 	}
 
@@ -179,8 +182,7 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	btrfs_set_extent_bit(tmp, 0, sectorsize - 1, EXTENT_DELALLOC, NULL);
 	start = 0;
 	end = start + PAGE_SIZE - 1;
-	found = find_lock_delalloc_range(inode, page_folio(locked_page), &start,
-					 &end);
+	found = find_lock_delalloc_range(inode, locked_folio, &start, &end);
 	if (!found) {
 		test_err("should have found at least one delalloc");
 		goto out_bits;
@@ -191,8 +193,8 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 		goto out_bits;
 	}
 	btrfs_unlock_extent(tmp, start, end, NULL);
-	unlock_page(locked_page);
-	put_page(locked_page);
+	folio_unlock(locked_folio);
+	folio_put(locked_folio);
 
 	/*
 	 * Test this scenario
@@ -201,17 +203,18 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	 *           |--- search ---|
 	 */
 	test_start = SZ_64M;
-	locked_page = find_lock_page(inode->i_mapping,
-				     test_start >> PAGE_SHIFT);
-	if (!locked_page) {
-		test_err("couldn't find the locked page");
+	locked_folio = filemap_lock_folio(inode->i_mapping,
+					  test_start >> PAGE_SHIFT);
+	if (IS_ERR(locked_folio)) {
+		test_err("couldn't find the locked folio");
+		locked_folio = NULL;
 		goto out_bits;
 	}
+	ASSERT(folio_order(locked_folio) == 0);
 	btrfs_set_extent_bit(tmp, sectorsize, max_bytes - 1, EXTENT_DELALLOC, NULL);
 	start = test_start;
 	end = start + PAGE_SIZE - 1;
-	found = find_lock_delalloc_range(inode, page_folio(locked_page), &start,
-					 &end);
+	found = find_lock_delalloc_range(inode, locked_folio, &start, &end);
 	if (!found) {
 		test_err("couldn't find delalloc in our range");
 		goto out_bits;
@@ -223,12 +226,12 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	}
 	if (process_folio_range(inode, start, end,
 				PROCESS_TEST_LOCKED | PROCESS_UNLOCK)) {
-		test_err("there were unlocked pages in the range");
+		test_err("there were unlocked folios in the range");
 		goto out_bits;
 	}
 	btrfs_unlock_extent(tmp, start, end, NULL);
-	/* locked_page was unlocked above */
-	put_page(locked_page);
+	/* locked_folio was unlocked above */
+	folio_put(locked_folio);
 
 	/*
 	 * Test this scenario
@@ -236,16 +239,17 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	 *                    |--- search ---|
 	 */
 	test_start = max_bytes + sectorsize;
-	locked_page = find_lock_page(inode->i_mapping, test_start >>
-				     PAGE_SHIFT);
-	if (!locked_page) {
-		test_err("couldn't find the locked page");
+	locked_folio = filemap_lock_folio(inode->i_mapping,
+					  test_start >> PAGE_SHIFT);
+	if (IS_ERR(locked_folio)) {
+		test_err("couldn't find the locked folio");
+		locked_folio = NULL;
 		goto out_bits;
 	}
+	ASSERT(folio_order(locked_folio) == 0);
 	start = test_start;
 	end = start + PAGE_SIZE - 1;
-	found = find_lock_delalloc_range(inode, page_folio(locked_page), &start,
-					 &end);
+	found = find_lock_delalloc_range(inode, locked_folio, &start, &end);
 	if (found) {
 		test_err("found range when we shouldn't have");
 		goto out_bits;
@@ -265,8 +269,7 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	btrfs_set_extent_bit(tmp, max_bytes, total_dirty - 1, EXTENT_DELALLOC, NULL);
 	start = test_start;
 	end = start + PAGE_SIZE - 1;
-	found = find_lock_delalloc_range(inode, page_folio(locked_page), &start,
-					 &end);
+	found = find_lock_delalloc_range(inode, locked_folio, &start, &end);
 	if (!found) {
 		test_err("didn't find our range");
 		goto out_bits;
@@ -278,36 +281,36 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	}
 	if (process_folio_range(inode, start, end,
 				PROCESS_TEST_LOCKED | PROCESS_UNLOCK)) {
-		test_err("pages in range were not all locked");
+		test_err("folios in range were not all locked");
 		goto out_bits;
 	}
 	btrfs_unlock_extent(tmp, start, end, NULL);
 
 	/*
-	 * Now to test where we run into a page that is no longer dirty in the
+	 * Now to test where we run into a folio that is no longer dirty in the
 	 * range we want to find.
 	 */
-	page = find_get_page(inode->i_mapping,
-			     (max_bytes + SZ_1M) >> PAGE_SHIFT);
-	if (!page) {
-		test_err("couldn't find our page");
+	folio = filemap_get_folio(inode->i_mapping,
+				  (max_bytes + SZ_1M) >> PAGE_SHIFT);
+	if (IS_ERR(folio)) {
+		test_err("couldn't find our folio");
 		goto out_bits;
 	}
-	ClearPageDirty(page);
-	put_page(page);
+	ASSERT(folio_order(folio) == 0);
+	folio_clear_dirty(folio);
+	folio_put(folio);
 
 	/* We unlocked it in the previous test */
-	lock_page(locked_page);
+	folio_lock(locked_folio);
 	start = test_start;
 	end = start + PAGE_SIZE - 1;
 	/*
-	 * Currently if we fail to find dirty pages in the delalloc range we
+	 * Currently if we fail to find dirty folios in the delalloc range we
 	 * will adjust max_bytes down to PAGE_SIZE and then re-search.  If
 	 * this changes at any point in the future we will need to fix this
 	 * tests expected behavior.
 	 */
-	found = find_lock_delalloc_range(inode, page_folio(locked_page), &start,
-					 &end);
+	found = find_lock_delalloc_range(inode, locked_folio, &start, &end);
 	if (!found) {
 		test_err("didn't find our range");
 		goto out_bits;
@@ -319,7 +322,7 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 	}
 	if (process_folio_range(inode, start, end, PROCESS_TEST_LOCKED |
 				PROCESS_UNLOCK)) {
-		test_err("pages in range were not all locked");
+		test_err("folios in range were not all locked");
 		goto out_bits;
 	}
 	ret = 0;
@@ -328,8 +331,8 @@ static int test_find_delalloc(u32 sectorsize, u32 nodesize)
 		dump_extent_io_tree(tmp);
 	btrfs_clear_extent_bit(tmp, 0, total_dirty - 1, (unsigned)-1, NULL);
 out:
-	if (locked_page)
-		put_page(locked_page);
+	if (locked_folio)
+		folio_put(locked_folio);
 	process_folio_range(inode, 0, total_dirty - 1,
 			    PROCESS_UNLOCK | PROCESS_RELEASE);
 	iput(inode);

-- 
2.39.5

