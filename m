Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813914BD370
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822540; cv=none; b=O7MyHERiSqSZ/AKjxDeoo6VXd+VoKg+a9zoZW6decZ7s6+ARdSVD2V+X1puhVvMF63G2ifoMO3UJIFm3drDK5tAhExzRQ13oYJgI1vHE2WgaNZhzNpjoMdkRjD163f8KBwXculBdcXiov/Y9tbY8Ns4rXL/5wd6uS7/NryLauJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822540; c=relaxed/simple;
	bh=H3qnpwwk3wmibX/HXhwBzKOCXHBXCtQ9FoTXfdAk790=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raWqAxsVTwvWQ/HLajziwoApmph2jQiyHFBuiE28KooKEzu3YgRrYDQjmJQlHGlwuYmfHbJeD8NkLi32Ex4wpDU+JeTYrqyd5gx1gh9gt6PVNU3687gW+F3zb16Dk9EiJv3AeQEPj5r2KWGxdO3X/4hl6+OvUVyVY+DXtEOVktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Q5G9UYw0; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XJ/07b39; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Q5G9UYw0";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XJ/07b39"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CExNgh915439
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=lCIo
	nd31+IYCI1CsdE51i+Rzoi6YEhIrulQ6Cr9ZkLU=; b=Q5G9UYw0FO+Uv3U7Xzkw
	nE/6Y26Cwh8DUzhZYxj1dYGJu0Skj3jsayngqtAIWthN+6Ah4TRqCFrK2apnMnWG
	sdN41wTTnHpxayp8l67LTblxPVvCv1VYF5KCUGEPC1hb26c3BawCIrG8f0PCWuo1
	ayQy3+YHTv6CQFEXZi+LeKLWKl6IJFX2rhwXi0xxuLHFXSOplwCNQYH5zl/Wm3O9
	zzDO7RCFpwQHDCHdeIS0Rf4XXfJ3IYAYh5m8jrr6T4ZXAtK2WYoBh2ERlr1ZiAEb
	jTsA5NAgZ3b5J2XZHFDMUUopbD6ocRE14dkxMOL2OvhSnrjzdWoMN0AQqErB6vlI
	vQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91sy911d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:56 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91430af782dso50479576d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822536; x=1792427336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCIond31+IYCI1CsdE51i+Rzoi6YEhIrulQ6Cr9ZkLU=;
        b=XJ/07b39R7MqtZbEZTOjs7QrszZSfeablONFbJh2gKUDCSIg6ZWgs3D8DZQMaQSQ7n
         tf5tWbOL9C327tHWShQeezWDZGi5GrM/LhMM7svUgPYJDq8bizRDXuOMMqhCaMvUbRc9
         KmQoS+LkDfdtjdjbIdGTA9FwTC5eNrm6CCEf+1UmnPuKOJUyxB4AmvAqigjQu1HEqx9A
         ZXZ7m1bt3D/vpTC26J8ecVDMjUpW0H5CgUZlHRpDcz2j6hFFmCHty9O/S2VbR3BPEIJC
         SJrGSXoCLKI1VceQnSNIz+DTVepima+wHKTbirIPA/hUORRDbur/H3+lCIIlDxjkc7/u
         23Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822536; x=1792427336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCIond31+IYCI1CsdE51i+Rzoi6YEhIrulQ6Cr9ZkLU=;
        b=lQpRiLY77mmzVJOg8IB91GpcxRQWzl0yVc83xH+5XKWEZwOkQjKZOxxWJcfGzykdc/
         //1vB3Dw6wYLnJR1etwmrQjB2eiTd02UTu+yRvuPfF2O3CyVIFMr0P1nduGraH0Fsuz8
         WiqgT2DEoEnG7etfjB+2Ps4IZs7H7fU/GDLwoRleUwymtGEJxmNOqNpjCMp6LmsIbEkR
         Ru3a7qgU//gDG4ZGB2zf9111aLa6uWou0Q4pf+7j3tRn1Gcigfeqr3a9fwLiBi0sSoxT
         x4bG5imczSofezCg+taJ22OLM2pREsvivCeFxc9H6TGc09KP/d20qJBM5cXyr7qyqKD3
         Ghow==
X-Forwarded-Encrypted: i=1; AKwUvBytyYv7piRJPzN66eM9Lkdv8DeinzKH9svZRkBk4w6pwe+HBofOiIewKaA8FRhlFLoRGRdYKaRB25dVakQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwksVoqcxtP/LrQnABAwaql1jYT291VgQLZc2ACsH92+FhrYiA
	iOP5JhCCxUz+jj47JOzwjVXJpR9ExWagPJzl1yULdmymVzjMpsPS1mDJgnOkJ1PttyjECnBkWqf
	g7g7x+Rok8Alp55c31Jvn6VV33ZKUZcBFjZnsW+lkQkMKKKPGwBx4Bx77Cemtng==
X-Gm-Gg: AYBFou2d+z5sdRmWOodA+PH0HL52AsmY0Kn6t1o1QPu7jQZZ4U6e/dhigCRU7QTMosT
	Rg6O/k1V6Vs2cY23JWD9wEhIjH0cH8RnoVjbgTjHhUTNf2HaGms0ynA6hAD7ade8DghFgxFfxI7
	QWrPfPYn5bUI5fjHnY+mkUKoHdbSTfn2I4Ifsr8ctzVyAthTfy4oKOcB37Q7Fh+b256QwCy7yk3
	HM1L5mdfWe9aurCzokap06PKafVsWkHDkPDCPl5wTrueTl+6BtuWSdpxWjxVNbneH/mZ/s7Mqgo
	s72wdn+uzVt7WRoLyaXIRzuFav8ckxgTk8+EA+nOt3ewhBC95s2Hu36bcdXnLb6sWvRsZqtVnUO
	iFEDFqIiZR344AfvIRYlASx3kSHfNHrHIDI1Eb0sYksQUOZk=
X-Received: by 2002:a05:6214:d68:b0:915:4229:17a3 with SMTP id 6a1803df08f44-91b5555ff58mr186621346d6.25.1791822535786;
        Mon, 12 Oct 2026 09:28:55 -0700 (PDT)
X-Received: by 2002:a05:6214:d68:b0:915:4229:17a3 with SMTP id 6a1803df08f44-91b5555ff58mr186620846d6.25.1791822535315;
        Mon, 12 Oct 2026 09:28:55 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:54 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:29 -0400
Subject: [PATCH v4 17/18] btrfs: stop reading free space inodes from the
 commit root
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-17-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=1979;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=H3qnpwwk3wmibX/HXhwBzKOCXHBXCtQ9FoTXfdAk790=;
 b=RCCa2TCImaB9jZuWXZOpfA3qnS3BnA3pLtPGrm4U7O7IxHsuiub36UUlCAio8F2MG+aYMgd4o
 p8fPFsG9cZNDXMvMHvYmGn/RjG5Z4+GPmzlOsB/jssn6gv2uGHiZlfm
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX7lvvPLkRfQOT
 XB+qW/uxdidrZLGcbnMq7z8BplRsJpsY5uSkIkZrJ+ThWeKk3Dj2vIlFwXZoR5l0znudvq2Nrfg
 AvsH7EGy7Z8YVssl3/Xd+2CBhA0jVVvmotQ+1a2hIFKya3tGFbnS
X-Authority-Analysis: v=2.4 cv=JMSuIMKb c=1 sm=1 tr=0 ts=6acd0ac8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=F-rX_8kjA07mH5tGMmcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: -4loAkDcabQWV1JU9facWZWkl8vj1XOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX/NJfCjRCm3MP
 TugGVVAj8wNaOwlfAQ+CzPm3H/ZhMpVDwrT362nwANsMdit7HlgkRM7HxNc5SheFdcWjiHk/s0f
 /LOvcrUzQTQ+O+dz/sNiRFa2HzSksBq6p6jgiqeSoXOwecSZaSGKbZ8OgnoaTJYtD14Rlxrdozr
 3vnuS48mpLdW5e2tEZb+0M8t1ZcQnNxy13N13r6P3I2TDcsD28kKF8rDKbylFtukKf8jB377UMk
 3bMZTpQJRZ78Qv6YWAWVhSIk02llThhgcvoiO4GC2YykGpWO+9SaNY7FkBVFb69IXk9T5OQ9nsY
 r6aa6YBvJ3riVdu4aRJ0Qp6bEtWGwYHsUmThtggqnK861aOkmxZEnrd9CL1uiuYqXP3Dh+FWhOQ
 M2TAz+NupC+h23KZk4pKHXzIVjq6TuJFkHaHcdQRPlFMpViGQpHfYod43POWiAYPoU2bujNLDUQ
 tPae3PLoxmhvFL4WR/w==
X-Proofpoint-ORIG-GUID: -4loAkDcabQWV1JU9facWZWkl8vj1XOT
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=10 lowpriorityscore=10 adultscore=0 bulkscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

Free space inode data was only read when loading the v1 cache, which is
gone, so btrfs_get_extent() and btrfs_lookup_bio_sums() no longer need
to search the commit root for them.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/file-item.c | 11 -----------
 fs/btrfs/inode.c     | 10 ----------
 2 files changed, 21 deletions(-)

diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
index ae1fd4da38d3..ff8f8cad00fc 100644
--- a/fs/btrfs/file-item.c
+++ b/fs/btrfs/file-item.c
@@ -396,17 +396,6 @@ int btrfs_lookup_bio_sums(struct btrfs_bio *bbio)
 	if (nblocks > fs_info->csums_per_leaf)
 		path->reada = READA_FORWARD;
 
-	/*
-	 * the free space stuff is only read when it hasn't been
-	 * updated in the current transaction.  So, we can safely
-	 * read from the commit root and sidestep a nasty deadlock
-	 * between reading the free space cache and updating the csum tree.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	/*
 	 * If we are searching for a csum of an extent from a past
 	 * transaction, we can search in the commit root and reduce
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index e715b52fc60d..55be986dac15 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7228,16 +7228,6 @@ struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
 	/* Chances are we'll be called again, so go ahead and do readahead */
 	path->reada = READA_FORWARD;
 
-	/*
-	 * The same explanation in load_free_space_cache applies here as well,
-	 * we only read when we're loading the free space cache, and at that
-	 * point the commit_root has everything we need.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	ret = btrfs_lookup_file_extent(NULL, root, path, objectid, start, 0);
 	if (ret < 0) {
 		goto out;

-- 
2.39.5

