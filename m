Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB72DD5F6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830403; cv=none; b=ID0qIPKuzzHGEIcqOmzHCvZmIxQzXOkk7fFj2r/edsOkARjwmy/bFdERMxK1wc1delcqO/GScg6aoot4s+4D0NBTLR8Zw+ZCdk77pZQYfNrjLOzL65vHDVmzS5FI5KXw1Temc0n5dbE8ALec9Vls+aiUxHfo9+g3sKCPCFs2wJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830403; c=relaxed/simple;
	bh=lp6N7P6uRAwF4k80VrSyckftlj/cB8cKUNVuGaugFXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKfAHHLlQlwAJqmjsh2HNPka9koesTXrfdB2rcrPoiEtM6FR5jUwmvSBXoV0bq7DheAIl1UhveazYLrQdLoK3UXt6SpSk1XP6V5C7mxLWKDBrc2/HSPjtwOcl4SrOdNtNKLZze4DIRJmsuBgQ1wb1k5gweMIQX9AHEPVZET8l3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=GGFNQ8el; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=zr3hgV89; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="GGFNQ8el";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="zr3hgV89"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880vKTb3906570
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=vZNh
	osrukSiX1wNaSmTI+ZUk61C0R//VPNgshZncD6Q=; b=GGFNQ8elMGqtaso+GdcV
	MSlVH9DB7bUvhPZQM1gfOKOEsz1GyCGtQlkBpMmLcLXTitWeTCaXjOwn4vwknp5f
	lWOF94QgsdzigPrYDDOu8jOK6AqgYyj0Hw0Mk6CYK/NpdrAiO/xXnyT63Pm3lnhH
	hbj1368ToS7sIjv7ycqdRHZGbmNYTTVRTfnRsuJenl2/gs3Ot2wDH3sE18lZNw9r
	n9UO/L9ePPaT2WLG5fJ3YyWWt3+Fzh3QKfYlNX1g4h8SxjBfjD6qO3RRwAErMEyI
	qnvHrafHslKMJAOe365xcRsUHLRBvu05OfJbeGJHsm2MC5Nwpart8+hZjLYBjDBz
	wQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4yjryep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:19:51 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530006c6d43so72699431cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830391; x=1789435191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZNhosrukSiX1wNaSmTI+ZUk61C0R//VPNgshZncD6Q=;
        b=zr3hgV89CkdmLVlqco3AR7TavtMprbUU6g6P1v6RTj/AB5MrIGBJSzr8nEfeEnSaew
         sRw/ME6QZmd1ImOSznXi0jJZ8B8tjGVy97kIBhkiufPrY8qgx1QUEXsfXNpOWBJHYcj/
         j3kZwTaIi7l41vRxeMg0pLGbngBTkh4fRYFU7PTsMtzrFYj4Nrv0uY6xp13EI+YA9qT9
         quUtpgFes2bXEi1S6Ou9LCwwe5E1NzaQg8x0qDPlPHvO3RhfyIUtXTLP5BnDUz+fLYK6
         qxYAMTfScBBIBlNbuHz7hWonioxq+dJbzVptud22jER3bkg6f4knXUbxKlIgpRVG8hxJ
         2WHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830391; x=1789435191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZNhosrukSiX1wNaSmTI+ZUk61C0R//VPNgshZncD6Q=;
        b=cxF3DIcIeKrrojOhtWjNztfcpzdlknpadLfrIh76FlAnhrqbfJa4YcriYvjGBpgl92
         l3Uzg9qJJTqjv9+loAc88DVsk84ZU6+XXLYKctWU4CTIMMAtLOXwKf6c3YeFcSTz5rXe
         upeq2zn3HBL/TSck+Va43HqBdpJIAXQzrnTEwRZKNzPPfYBC2flL7e8V/4DgRpl7Fd8f
         wP99kE0GVmD85muabrFcrQtL6ELZ2lZjMwh4hDoo8pPYx9zQPMw1dID0ZODXSb4QN312
         dBzIxXgHlUojlMZiFEJ/Lrmj9o7P0BjMuDmKG2dwx9jfShDxVgwax6FcHAoE9x4uVYgv
         Zebg==
X-Forwarded-Encrypted: i=1; AKwUvByAd51euxPZvSGT17NtM2gngMYtfzfNIyUL7HKrdDn3PGEn9Zu8hvqpLpgG2hSjK4p+pW57y9noJG0YDoo=@vger.kernel.org
X-Gm-Message-State: AFuF++m+61ft+lw9uKWAHn41QNcaGpnND7H5yj9lMGNWVNrWXZIR/Q4L
	Jowl+O+T8HNVRdvCLbWPXJWNsBrES7LF3MxhsrMwXhtAWCl1m2aH0oFf1ZqFKlRFg6hP0h0hFBl
	Ik3ULDtfmQIn5ZvRbk5DfKMx+ndEa7XOa/hk1tlC/8mrR0P+8859rV7qpyqShFg==
X-Gm-Gg: AYBFou1JufzyUcIIdoKCK/jQF8Bg+iRWlSZLRno5A3I1ZKwHNvK14VzMWt+sT5eNrRf
	xbQAMtbmpOoA1/FgR1FMC4sbx6eFH4bchCrerIYTrzcX5QiOZQa6F4hJ8AqJktoU4YX5yEwwXFd
	l0TARyIe+0U68tFl0Vzgno6ktt9jd8KV6QiGnEa9PO2UNEqLHmh8wdWs9nN2Q5T+ryXAnklzl8f
	3336xCP0PvGORAinkqhgRiK2/dBdJFFHe58E6zsjYQZWeaFiq1sn+2xfKRotqikKt8WV/R8RFMH
	GQPB6Xy3QfjjTTFytL1Ahx0++hoalq2OARSTla6xnan5mSOjWHH8emn4F7RIa4qgY6XIRuoVwbG
	lxtMUE7yG/4apwcXqgpJ5KglDOtvxf96RExa80x7TJjgP+v4HqPs=
X-Received: by 2002:a05:622a:5c05:b0:52d:8257:666d with SMTP id d75a77b69052e-5305483acf5mr345357051cf.11.1788830390559;
        Mon, 07 Sep 2026 18:19:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5c05:b0:52d:8257:666d with SMTP id d75a77b69052e-5305483acf5mr345356401cf.11.1788830390069;
        Mon, 07 Sep 2026 18:19:50 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:16 -0400
Subject: [PATCH 01/15] btrfs: stop enabling the v1 space cache from the
 on-disk state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-1-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=3265;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=lp6N7P6uRAwF4k80VrSyckftlj/cB8cKUNVuGaugFXs=;
 b=IMvkXE5GdPNas7sHyPPQwTAp/61WcaYW99DKn1n6QvUNWjB9tm3SWAY2+9Qii4LHZ5x/oBG96
 ilUy6ok7bUnC6YvNAOF9aNND90b/CoBmBaLGvxMlkFvDQFRzOPmzxDg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX+3UDQEnMgkoD
 ZQg7Ap5bedNmlqBuUI6x68edHinsMD6hv9OEo4zR0JtbnVzoEgDAJUhOjT0ZK8EHLsTsSGt+wPS
 EnEjvGL2BdrJEUUGcLzQjNHhaHDsjmWctv5s4Pwz1p3RWxWVtI9KuS4k60+3OApd7En/1lfld8x
 AYUzA39IOElDKeK+BEm4+oNARnp9o3TNqKUwB9dvYjnLSeqySLyR4VYVAKiAJbSUnXutPgs7DsH
 OqkQDSTU1lonqWjksrasQ6M6xT4l3TeaHo7zbzlkHuCPR6J5eyj7vfvY8u1mhjI+iWnHFZblRrC
 VieNQhYUWL0wTKpzNJkADhBkEawZq0AIm9FW5THRdASiWbf78E1qe+nidM5hSODm86D/LDzXCM+
 FjatbeuBfI3U03/d3UWTIBZ34Q/xdpzry/iJincohXoWGPx8WRbyO9Da1z3z6tt6MfKMRhE/Z9r
 ShCzJ+Hj4ASZXsAxXsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX7Kn7sEUyR2l9
 0piTpIo9kie8zHP3SlRQ6W8TuvPWAqM1lrbyOo4fWjBUd4Cukxya0cpDKKt+X9AYLKJ37aiGPMU
 zkPIE6h5Rx8X8vfIiMLF5rIQtdVS7CEhRqixlCsfGXVe5t7rQH32
X-Proofpoint-GUID: wrY4tj54cN0mFVdoSOLAYpjoemgjkUns
X-Proofpoint-ORIG-GUID: wrY4tj54cN0mFVdoSOLAYpjoemgjkUns
X-Authority-Analysis: v=2.4 cv=K/QS2SWI c=1 sm=1 tr=0 ts=6a9f62b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=6xji9QrKO1GPOBtlZsEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080011

Since commit 545e560a5b0f ("btrfs: disable v1 space cache") the mount
options can no longer request the v1 space cache, but a filesystem with
an active v1 cache and no free space tree still enables it from
cache_generation, and remount does the same. Drop both, so SPACE_CACHE
can never be set.

btrfs_start_pre_rw_mount() then sees the on-disk cache as active but
unwanted and cleans it up, as -o nospace_cache does today. That covers
the read-only to read-write remount as well, so drop the toggle in
btrfs_remount_cleanup(), which would otherwise start a transaction on
remounts of a read-only filesystem with an old cache.

The cleanup is now unconditional, and the first read-write mount fails
if it fails, as it did with -o nospace_cache. This also lets an old
filesystem mount without options when the page size is larger than the
sector size, which btrfs_check_features() rejected once SPACE_CACHE was
set from the superblock.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/super.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 464129b1b0d4..77443ded6db3 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -759,12 +759,12 @@ void btrfs_set_free_space_cache_settings(struct btrfs_fs_info *fs_info)
 
 	/*
 	 * At this point we don't have explicit options set by the user, set
-	 * them ourselves based on the state of the file system.
+	 * them ourselves based on the state of the file system. An existing
+	 * v1 space cache is no longer used and gets cleaned up once the
+	 * filesystem is mounted read-write.
 	 */
 	if (btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE))
 		btrfs_set_opt(fs_info->mount_opt, FREE_SPACE_TREE);
-	else if (btrfs_free_space_cache_v1_active(fs_info))
-		btrfs_set_opt(fs_info->mount_opt, SPACE_CACHE);
 }
 
 static void set_device_specific_options(struct btrfs_fs_info *fs_info)
@@ -1264,8 +1264,6 @@ static inline void btrfs_remount_begin(struct btrfs_fs_info *fs_info,
 static inline void btrfs_remount_cleanup(struct btrfs_fs_info *fs_info,
 					 unsigned long long old_opts)
 {
-	const bool cache_opt = btrfs_test_opt(fs_info, SPACE_CACHE);
-
 	/*
 	 * We need to cleanup all defraggable inodes if the autodefragment is
 	 * close or the filesystem is read only.
@@ -1282,10 +1280,6 @@ static inline void btrfs_remount_cleanup(struct btrfs_fs_info *fs_info,
 	else if (btrfs_raw_test_opt(old_opts, DISCARD_ASYNC) &&
 		 !btrfs_test_opt(fs_info, DISCARD_ASYNC))
 		btrfs_discard_cleanup(fs_info);
-
-	/* If we toggled space cache */
-	if (cache_opt != btrfs_free_space_cache_v1_active(fs_info))
-		btrfs_set_free_space_cache_v1_active(fs_info, cache_opt);
 }
 
 static int btrfs_remount_rw(struct btrfs_fs_info *fs_info)
@@ -1535,10 +1529,6 @@ static int btrfs_reconfigure(struct fs_context *fc)
 			btrfs_set_opt(fs_info->mount_opt, FREE_SPACE_TREE);
 			btrfs_clear_opt(fs_info->mount_opt, SPACE_CACHE);
 		}
-		if (btrfs_free_space_cache_v1_active(fs_info)) {
-			btrfs_clear_opt(fs_info->mount_opt, FREE_SPACE_TREE);
-			btrfs_set_opt(fs_info->mount_opt, SPACE_CACHE);
-		}
 	}
 
 	ret = 0;

-- 
2.39.5

