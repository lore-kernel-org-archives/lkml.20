Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ABC3AE6F5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235570; cv=none; b=GL09cHg5Z4dwFWIs5ApiclTCnbk+XnhewrVyRdzLzySPRvuwzhhkiqjrEPTF09jlvuq72skpup/lbvcGaZWIiPU3LXfb3tQN8usqzbMNxX97Uwz++eTrvHwksaTEm+hLWfsQ8u45Sl96FYMGDAGBRR1MHSD1Fy7m0+KvGk5HhDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235570; c=relaxed/simple;
	bh=nAZX8R7H10g5spIAmS49lDc0sQxcL0bHv+WxBJnhyPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+VMoAaihx/IBJirG1cC9zh1rjTAXms9MF4bJYdBswBKk7zLvaoJTEWT2nZTtDDBqjEiuZnLEzMp9Ha7pES57z2J85gc5GVFWBIikqrXtfjj8N5mCXP9Mh2w/gwXTvWUs3/Ub4RKmMtc5fAqaPRbd/qvdVVfXMBF+y+zThIMjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4nrUmRF; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4nrUmRF"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87ac7657a24so759738b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235565; x=1790840365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjRGNfMF+BIQhac//kksViQah83udRYtRSHNmn5Ukpk=;
        b=o4nrUmRFbsq0I5CPbtnWP/dzUMZTCaRM+2rosFc9HW3P0NooEKNwtDijhWI0X80xIX
         pgIfn3XuwhgrwFqLr75AMaMFhpjo61mLXEHG8w+cbZz1wKf2TPZh1Eu54UuKgdX+OQk6
         71pCyotBca170zvDjJ2AWj+/i41w2Q7eGQ6OH8bSjdBfeL/VrvB+KRw0QYuGRh02NWWF
         y/6iVE7GFS7Lc4vwZkeRBSBfI7LiMR9+/TPVzND0bSr79hBJ4mgKTZF5b7wP8BawBYl+
         WR0gplvnLyjvQV1W1U4l+KyBdH66whhperbrCOnxT/EbncY+xFGBHo1R9kvu+N2cgbTj
         e4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235565; x=1790840365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjRGNfMF+BIQhac//kksViQah83udRYtRSHNmn5Ukpk=;
        b=ts4GoYPhQ5xYZ7D+gdORDVRXzMzJrDe8OVydalLyOEWHwkliSTuxEXtLflMmYZfkVo
         47xj8nW4puXldKm4lbpPs5Jpcwi2rXTx99UfUOEB1yPN8lYuSQUp0trXbl+0mTcPdqhi
         QHhXw2jgAp2OI0cZ3mmcmv+Li3Jl93YO+JpqiR6dqSPfg2pAqSpQU33ih+mQTWekqw70
         VvfqVntKyhdFMpazTguSlSUXg8cqmVgS6mu9YHRkmaYWnEAi69dSIqfjD1WmQZuVf3lA
         ha59Cuqdltq77gHhi/67pYAqkLW1SmVFhgAttiItXZgQvqXEGoznIEebcmIRDA2ycBdz
         bF7g==
X-Forwarded-Encrypted: i=1; AKwUvBx0ljMCUnzeHpQJDt2JZ6O+TATrkkuSBjmeOAQo4ZcaGiVEJaTrgouV7lDjwOxMHRdjOiFL/VaHGit51Ak=@vger.kernel.org
X-Gm-Message-State: AFuF++nao2wNc56Uj/Cksxp640+v+Gjfl5VPz+IvRedY7UEvq7eITPdx
	Ij2Vy/OAm5tMkU19uWQGeqN9N2tfH8w1Ikh0tArsenacINXiW1aosHu3
X-Gm-Gg: AYBFou0jAcGHcTUbczpziJG2JuM4uiEaX4OvkDxgT8E05tALXTbIIDrHZhAbXh6ITdH
	NHAz9In8Y2JEXsP1kiQpOeNX3nNKYQ6PjJf9/XTfh7Q2Q9E5wQgiox/cXCf8RdE3kgmaNu0o4uy
	67D0kv6Ps+IO79JdJGgWlNj/ulNzgr/9DxyNWKSKOrA8wEgP5c4qiXi/sRqIuAh/ULePFFs+Npj
	uXua4qbxzXP2xzOEagc8UJfNo0s7fRqfcBgqZiauuhkMKZW31RukDH+L6+PEAFP0oMsNbL+LE6u
	jP9dS34BY2qcn8jTj1+B4CIMp4pBI4LMmxQrf6II8XoSs5PbtKo3y3cqsWFfQYJbS9OO44SxCBl
	S2AstCJgjxss3MvFb0KAAhVgVCSAhg+1qm21fnZfvNjVsYSsJzYXrRi3VZgesGUkFPnLaD4Dw6l
	74ppIumC+7ciG7MwXZ/9oPV3H07S3qIjNDPXIb2g8T4Vua/UA7K0Oc8SN0kS62eFWX9A+DsM3nu
	zaAx+cxSJkTre0hnXI1xza69Cm+iISwJ+yHKN4N95Y6f3C4SLOxhz7yt3cWXAKDwysRUYDSeuGE
	Nct3lMGZVQ==
X-Received: by 2002:a05:6a00:8c02:b0:874:706d:9629 with SMTP id d2e1a72fcca58-87e9956a116mr1273156b3a.27.1790235564551;
        Thu, 24 Sep 2026 00:39:24 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad44c6sm2393739b3a.42.2026.09.24.00.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:39:24 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: al@alarsen.net
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	matthias.goergens@gmail.com,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 6/6] qnx6: validate sb_blocksize before dividing in qnx6_mmi_fill_super()
Date: Thu, 24 Sep 2026 07:39:19 +0000
Message-ID: <20260924073920.2782917-7-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260921042511.1473629-7-benquike@gmail.com>
References: <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-7-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_mmi_fill_super(), sb_blocksize is read from MMI superblock header
without verifying if it is zero or non-power-of-two. A corrupted MMI
image with sb_blocksize == 0 causes a divide-by-zero exception (#DE) in
qnx6_mmi_fill_super().

Validate sb_blocksize via sb_set_blocksize() and verify it is non-zero
before performing division.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Add Tested-by and Reviewed-by tags from Matthias Goergens.
- Update Fixes: tag SHA to 5d026c724220 ("fs: initial qnx6fs addition").

Changes in v2:
- Split out as patch 6/6 as requested by maintainers.

 fs/qnx6/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index a32066d98188..b8f9e6022e11 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -375,6 +375,11 @@ static int qnx6_mmi_fill_super(struct super_block *s, int silent)
 		goto out;
 	}
 
+	if (!sb_set_blocksize(s, fs32_to_cpu(sbi, mmi_fs->sb_blocksize))) {
+		pr_err("bad blocksize\n");
+		goto out;
+	}
+
 	return 0;

 out:
-- 
2.55.0.1082.g2b9226bbc0-goog
