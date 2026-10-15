Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EFC35B636
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028171; cv=none; b=TdzSRYY120x0eFahtw7me3zu8DGBlVzLzm1rElPHGmZW/olECnzRTge8Tib609mu7BCaTd04ESA9el3ftTlTEsB/GBC1D1mOgpH02//OpDZchywcMgZMkXftPkkW/x/MNRKrP+aUrNwzavJj9FxPOi8FrVgfDyI7eibmuPscsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028171; c=relaxed/simple;
	bh=cRIq1QUv97IJN096GaY9tUL35w4J6tU4ZFfZZOXQOo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rYBeoTxo92MBVvvvOSNyrcWHqwiXRLMEowvLivJcjKaV1bcG1gg8OhbHaW/5t1WT3f6t/V8TL/2lSydZMlg8/C6et9TJXTIAj3vcn0URLR5Lmm7/nQ/n4hXxyJOzw15/oaTPghSUtQ+ouPAwPGi3CupO9hLSZsUNxTkoU4dTbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=p8rscXwj; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kKZyoLSY; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="p8rscXwj";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kKZyoLSY"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0XaCg3424591
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=glwKdaK1A1qncALmabPoLA8Ok8
	9JBO6bVVFLTgZShX0=; b=p8rscXwjLLt5gqKp9IL3VyZVUXMVEiyNYbyWP1SlYz
	Akk7+y5z4lSqHoRuxvJUssCNotWJew+6cFYPHQiXu24phB/3Ai975NlzLOTRCdMU
	IjQdTHAkNlzzb0GyfyIGNYzRTc9DHM52vLsAikEBGcIjErAx8D9yy3MWV1PK3+Fi
	zS6XhQunD9aSYVM9AKyV1XpQzrxnHujUrQnkIHfLY4PFe5TFhvyIpqWA/ikI5cdd
	O54kqYP1KqDcS5MdtxsM0G43R7X/7806hMwCuGjNwDhUdKDk2xCs9YXYNTcVoIK3
	Vk33YtUOT+dfos53LNISTa6mmxismvpLFFJBxhIhsPCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah0esmnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:36:07 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-532f343a55bso86180351cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792028167; x=1792632967; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=glwKdaK1A1qncALmabPoLA8Ok89JBO6bVVFLTgZShX0=;
        b=kKZyoLSYJmxVZ9YOCx75jNIhzx5Y8qHVvXHi1PuRn4FTuZQWfPYYExFTy+LN/CLKAX
         48N57GMuRkapbTMz+7xGnH8TpImgsA+c9eOgksPj4nFQKLfsjl6LsxdDl/a6KCfWWkLm
         3+9exovluoIGYgkrxRR5pqnNF5Hs8USpGwGBw3EPUS8gZUMrOTver+1Jr2Eh4IxxsQPx
         mDoZNvGg1R3qliSQfKjgdRVorsu2uEUWo7D2qHbetPUPI1iWSXnt4ETN5vPEWzimC4+T
         RMB+C3gXS4Woiu0OkcayWp7dRz448AzRFgjkVlGJQkNZ67mlFiOm37khEAbYg3bYwMJ0
         omEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028167; x=1792632967;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=glwKdaK1A1qncALmabPoLA8Ok89JBO6bVVFLTgZShX0=;
        b=VM2j/Mop+ejLy8WysFM+Y7fLQSYJZnYy8cepTql8XE/9hw1rDnfgMjI4G+eFQWDr/s
         gyoXTgBnNXkLEHOxSexU+3oHvHXQxFY3I3i/InMoK1451H8Vqw8yeJd4VnJibW9pOa84
         EmnoxRvfIB7DhOS6Ap+pM6mGR4UZePosnbw3+D+ypd9TUuYtS8M3UTs+llZXI7YaWnei
         eXiZdb39P9WRkbjCu8MELFOIcShOzNTygunWuIInsLOmjfAeVPDgVcSt3pFdJ0nTe6VH
         EKJjc8OI4hS/+LfSZIt+Y2Ky9yoT8nOPZ0LPFmZmwLbAfL3iyRZtjxsi9/Lnz1JXvAuJ
         7wYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2bJkNXZipdoAxr1xF5O4DnEXmlrvDmg9+eXr9pCT8zTHZ526IiV0Y/zw+7TYyCc6QEHos0bj+/DPfw7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxo9vYSXl+iGw+JEGXiYzSe6aR69olPhtzDmCqOXwIdHRpmsc3
	mfCH9Yrf8ygEchZlMPnGLFnaIh+z55iuGK1fk4BigY09M1yXLI5dCB9BoPoaj2QTts9vCHE/PGs
	mT9RvNn3N/I3YSVyDPzW+kZKRqv+wV3tpW5DqrTLqLezf9gz6S2gCiqbuQ0ibvInUQw5R4A==
X-Gm-Gg: AYBFou0cFRvjUAcljQ9ZoBlRybFVrTtCgHQB0Ck58bvrKFZ7KoxFRbSHCvCmUXQv1eY
	hUzGKMXVmbbca9bA9NIfYWWSiw2B5bErFoc4yhQ5+iN4lQ0buVCFR4zDKiUeBFbEhtXAVoSQUop
	jjBEN+qhAuaJL2xXgIb94k3qOMS3XySGxkdgrOFsnAKCojdHntGG4C/HpDgcwKvi/qTB+6WBpr3
	5CVFhIJTgpSyxxhiFJB5UYubLcLqwk/hyQfFi/i5guB72RPKCyQXS80ORkaaWpEYgShtspYJUHR
	sZmAaY9n2ZubBHI/EN0biry0sdVA1THAsspaH+X2UUCTtXniI8pNgcV9C1F+XH0wuRgnoKtPiIo
	JQ8uq51wVHP8wEpv8+b4cec393RHPATzWi0WyG63S5mGc
X-Received: by 2002:a05:622a:992:b0:534:5df7:ee51 with SMTP id d75a77b69052e-5359f464b65mr270309701cf.9.1792028166755;
        Wed, 14 Oct 2026 18:36:06 -0700 (PDT)
X-Received: by 2002:a05:622a:992:b0:534:5df7:ee51 with SMTP id d75a77b69052e-5359f464b65mr270309451cf.9.1792028166140;
        Wed, 14 Oct 2026 18:36:06 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5361279a933sm12657661cf.6.2026.10.14.18.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:05 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/7] ecryptfs: remove the remaining struct page usage
Date: Wed, 14 Oct 2026 21:35:44 -0400
Message-Id: <20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPAt0GoC/yXMQQqDMBBG4avIrBtIrKj0KqULO/7RETGS0VIR7
 25al9/ivZ0UUaD0yHaK+IhKmBLcLSPum6mDkTaZcpuXzrrCgOM2L16ND6MEU1aoLTO48ndK0Rz
 h5fsfPl+XdX0P4OV3oeM4AZnDZM5yAAAA
X-Change-ID: 20261014-ecryptfs-folio-67e80ccec7f3
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792028164; l=1658;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=cRIq1QUv97IJN096GaY9tUL35w4J6tU4ZFfZZOXQOo0=;
 b=ZMC9cq355mguvjA23siqqPmMIdHQG5WAyWt+4ajZMMCtcfdZnU8l4GF0ruhb3ElmiNRcogKC2
 B4NDEEFFEO4Czv3CSsLEDfnA+JIZAG8JFq0DsGs0duBQqbOArlnmxsL
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: kgrs-CHJGxmfd4FqQG4AQfWGWRMixow4
X-Proofpoint-ORIG-GUID: kgrs-CHJGxmfd4FqQG4AQfWGWRMixow4
X-Authority-Analysis: v=2.4 cv=e82T2qp/ c=1 sm=1 tr=0 ts=6ad02e07 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=L2jCAn2j6CsyTPMwZHoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX1gJLwrzbOki6
 Blbcus34gE8okVpfdprJWE02pchjG1mDvLim+wPmJnVSGhEKs13UBOgcUoAgWM8BFojL9BxAzSN
 e55dZsHr/+dzVb9Czfv+JxCjDYsXWP9gYAk8K/DQp1aLtFe6tj+I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX0mTzWG8Gyfwq
 XTgjLFnETR0P0VRUTWyJu6M7ngyFcid5kSJSkonIiP54/NG/9knR7A4vbHtLTYZibs825twMvlT
 gclFrXEGl+bAl9gcLJUWQ/vF345WCu5sz0+GUAve0pqqQpF+PkxCWYyHyEk2jEWTU0sc6VnyCbc
 B+sXdUWdbH74OLNRyIde6gXQy2km3FuWqsBys5Cn+q8eXwNKlUiZ+biBj6VdipNG6hhCQ1jLrtr
 PrI6rTTddU7HgggxRENFu2yTqNXgm3l8Ji0hR2UgC3sJhhgM28QzS1LV7AT7VaN/rJrvJQ53qF9
 xvY4cylV87FleVc59E20AdnEWp1z74HzvR0C09SO34FH9lLDhHxwyo/HB/UqwZtqbpVFjrPwvro
 SdQYEtlb0wyLDzP/ASkEjmRETnluendmPP6/lwEuDYL/R6W3wMwxREi+XoZUHnJNSm/hBwVyfIW
 D49/sOrbnT9TdLc+usg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=10 priorityscore=1501 bulkscore=10 impostorscore=10
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150006

Convert the page cache side of the encryption path to folios, and use
plain kernel memory for the buffers that were only pages because of the
old interfaces: the ciphertext block, the header buffer from
ecryptfs_get_zeroed_pages(), and the scatterlists built by
virt_to_scatterlist(). Also make a shrinking truncate zero the tail of
the last folio in place, as other filesystems do, instead of copying
from the zero page through the write path. After this, fs/ecryptfs has
no struct page usage left.

Ran cleanly with fsx and fsstress on ecryptfs over ext4 in the default,
xattr, and passthrough mount options.

---
Tal Zussman (7):
      ecryptfs: remove struct ecryptfs_page_crypt_context
      ecryptfs: use a folio and a buffer in crypt_extent()
      ecryptfs: use kzalloc() for the header buffer
      ecryptfs: use sg_init_one() instead of virt_to_scatterlist()
      ecryptfs: zero the tail of the last folio in place on truncate
      ecryptfs: rename functions to refer to folios
      ecryptfs: refer to folios in comments and printk strings

 fs/ecryptfs/crypto.c          | 145 ++++++++++++------------------------------
 fs/ecryptfs/ecryptfs_kernel.h |  21 ++----
 fs/ecryptfs/inode.c           |  49 ++++++++++----
 fs/ecryptfs/keystore.c        | 114 ++++++++-------------------------
 fs/ecryptfs/mmap.c            |  60 +++++++++--------
 fs/ecryptfs/read_write.c      |  48 +++++++-------
 6 files changed, 157 insertions(+), 280 deletions(-)
---
base-commit: 5b00bf0f3b7ad05eff79b84e3bacf3f98ac67dc6
change-id: 20261014-ecryptfs-folio-67e80ccec7f3

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

