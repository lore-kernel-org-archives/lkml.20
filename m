Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573B49E5EF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303829; cv=none; b=RIX0xfok/bpSEkcwcggM9ZtbjPlgr6am33sMyVPq9nL8fk4Xu9GnS15D6Mdz2aCPWJW5KGlrSqWGGpSLaK/sBwp8AorHDyk7DW7J3GN9pCGau0aX+Xw4T2T1Gt35woVMmgN0fGU3fPhKbOMBAcDZzW5hWjkFIbDdUK3Yvdu2eQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303829; c=relaxed/simple;
	bh=5QSdoeQyOeaQ2nPRgt43kjsQrDVLF6Qe5SQ77InDBk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gi8nW4l5C+J3isC8VVD4vriXIVlNcyKXqoI2MOzvu8B32JlqAJwnVtQb/0987iGkSEcyWo3yPPr3/r51NI/KPihPRuStblU+DGqy5feEXsGSlHn+Evi3MNuS5tCj8Np/JYyvXbeqvjJCXnXhXXyOU/F88OjIx2wmHhw3+QDG87s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UU59djDT; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UU59djDT"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-91953e11914so10143606d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303824; x=1791908624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NjN0Qep3AXtJMLugfSyEYf4+Yl9Dz3rPxAXCvJ82fTM=;
        b=bIsvewuPeP17f8aE42Nxz853K+I99qkGo2HhTznUa0mSQudFtW5e2DDvRD00DmfK5s
         kk55+m458/bYf97Ip0+OujGHDWDcPj/C06VRKECs/mplH3nsZA9JEDyIsWPFv2sqVF6T
         zITI4njlOTvgw0iR0p8JrIlWq637TqFC9ujFGq9+56Ti2Rlo604PSNazWDOH+9pSliIb
         k5Dl4m59wDywZ71GcWXStsuOwGhj51m0ByK6CPkxT3tdAR2fKbsK+9YzKcUQNelS+fkO
         fyucQswZa4TMadnC002sG1OeWzA9mBL8UoIBII50ARwjN9t6ElVN2jdSGUiQhtkarIRc
         TmsA==
X-Forwarded-Encrypted: i=1; AKwUvByIaEhAWT+9t124prp/GBPVoJQReSBIIolePbsKlakty5q/jFFo7QxttErRqAFn+c/n/oIJUPe/Ac2piXI=@vger.kernel.org
X-Gm-Message-State: AFuF++m8j6duy5jj2dREsRPwjaUbNOHiC9QYwXxiJrXkClopzCd5agXP
	LZiQhC+VDI8QwrdVdkp95aF9LVuCe9g+ftROCMl5LR2AJ42SlNM0457WyK/E+3hTqWb69hCdbzs
	mhJ2j7iRy2VPYW43g7VWKbf2vsrhWTN8bP6uVJmpoOkO8IEwxDNoLIo/aqbh106EGWflWkJ1/IG
	3UV6k2G4ImI8Brt1rbRORjcRHGN9UwJTjEYgTud54uyPAGKLcadL+Rz/2Ql3H8W+lxUCqFyfVD2
	ZxWI0Y0Ba+qlviUNxkf
X-Gm-Gg: AYBFou2FkNnHBGjH00EafeFr5CLMLu9jMgi934TNrdckb/Xg0CZrdQSQ+KY/hUKaaiS
	wDPs32ck4xHncdSYgad8pKrkwMBssFSa+CU//1Q01ahHdF/WtX8+8zkkaVWZ/m0u5EKDHaa6CfR
	2eeMhia3CkHNoIIadqXS13ZSiJxZVilvgVfQeDO0R10u/7T1e2Gv4I/7vLlCSI5QoQGgexUBy90
	1lXv0TkgLGziW7Svn5VAVw+8f9lwuN6klhHlT8ql5XP3gzHolP1PPp9f3Mebyp5rgA1MZMMuTeM
	B0Y4Y+mpOwWk/JVjPu2ag06+oH/Hx2v6uUlD6BfD7M9OGyYkzKTEDgJCAw16yUH5qBw/s/tA139
	izyvphDLIk0OmaD8MdAge8grDibCLKZK4DIVOlj0L21XsjrXEuEsQ44xWrixdfXm4mXb+tlsR/w
	eArc4ZKPGClVIBNnlVlyWwRCzLI5ojAjUqKra3
X-Received: by 2002:a05:620a:17a3:b0:93e:62a3:f845 with SMTP id af79cd13be357-93e8f077765mr368759185a.8.1791303823848;
        Tue, 06 Oct 2026 09:23:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93cca30e892sm513702985a.9.2026.10.06.09.23.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 09:23:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917bab67568so95193746d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791303823; x=1791908623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjN0Qep3AXtJMLugfSyEYf4+Yl9Dz3rPxAXCvJ82fTM=;
        b=UU59djDTh/Zey9jHPkk/KqObwIZSvgL7zr9tIIameDAUmGZm3/5aLURs9wqDVz5r2+
         ilSYhEqkdkiFxrnps16E+mFSCMXmIGa4v7Y/f9tRGsGhzpPoUGgS7oOLrC7jwt7snd9K
         syYS1D5iBtxh7svWwn7Iq6aWRgR2Qo26lIJmU=
X-Forwarded-Encrypted: i=1; AKwUvBzJmxqdOvpYykBrKS+POpyBdyqsTdqlejiVK2g9t0ewkX8HPObHfSCkDvmMaTFbZtHU0b5C1ot1+fSUNvA=@vger.kernel.org
X-Received: by 2002:a05:622a:1826:b0:535:70b3:3527 with SMTP id d75a77b69052e-53570b337ddmr6045881cf.62.1791303822969;
        Tue, 06 Oct 2026 09:23:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1826:b0:535:70b3:3527 with SMTP id d75a77b69052e-53570b337ddmr6045491cf.62.1791303822485;
        Tue, 06 Oct 2026 09:23:42 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5356b860df8sm9020961cf.14.2026.10.06.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:23:41 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: vikas.gupta@broadcom.com,
	ajit.khaparde@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [net-next v2 0/3] bnge changes for RoCE driver
Date: Tue,  6 Oct 2026 09:12:53 -0700
Message-ID: <20261006161256.1493672-1-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add bnge specific changes needed for RoCE MPC channel
support.

v1->v2:
- Created pull request for RoCE MPC channel changes
  of bnge driver 
- Addressed Shasiko review comments

The following are changes since
commit 2c3418fffa9d ("Merge tag 'keys-v7.3-rc7' of
git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd")
   Merge tag 'for_linus' in Linus's tree
and are available in the git repository at:
  https://github.com/siva-kallam/linux bnge-roce-v2
for you to fetch changes up to
commit 4f4b78c1e577 ("bnge: reserve TX/completion rings for the
RoCE MPC channel")

Sachin Holla (1):
  bnge: reserve TX/completion rings for the RoCE MPC channel

Saswati Das (2):
  bnge: Add infrastructure support for RoCE MPC channels
  bnge: Update HSI

 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |   1 +
 .../net/ethernet/broadcom/bnge/bnge_auxr.h    |   1 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  32 +++-
 include/linux/bnge/hsi.h                      | 161 ++++++++++++++++++
 4 files changed, 191 insertions(+), 4 deletions(-)

-- 
2.43.5

