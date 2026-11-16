Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866905;
	b=Z5h3lX73VC7OzuaDK8cXbcbKttqQfsyTMF1XvSSLY2wFhitcbOTz8GuLxMyZMiVi+GHh
	 WYlnTf1UlkUHYDG/HkggzV2CkraPSy9IcMhC5GdX0R/yrKkML3g6P+aq69GQBimV3pFhP
	 GSfhaDgIzzI+o/hNpEViDHAaAy1Itv6vtUUQCoxihMhcagQjLIWlFvBojgltCYYEzmz4m
	 fk2uFfb8xma0tpCDVF753tONPZEkxTCfrkb30ejiV8UNr9xU9f3F27Qa0Az8EC3IjJd+q
	 4EBr3eC4hByZLbNWRmIZ+MRVxZ+P8mTeixUfA9D8SAZ4h/5W5Hmye8po3a1IGHEtZ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jCQCdjWXGwSTK6KbBHTCoC610xQNusLZzaXj3lRu9vY=;
	b=1BJnrMjaDUQKnMn9Opl1cU1abrYpSeFSLa7zxnZOQQwN769ZVLSMsED1OQC1tCIW1YEV
	 ueSBiRh4XElp4jvGf5LzeItSrphyGji/gTlmfRfDdsEzlqiNPP9Lvvoc7CQkGJwhQ4c+x
	 Aexos6rzV291s5NxdHJAsrUSwvtlTbeW+uvwanPfzG46lR11tiOIV5LwWQjwM9x7LOk+h
	 3b8dvZ9fegth+/nJcD2dX94oP06cxB1sUWqkcERcrWtbcY7cOQqonvyd8wJj+M1edcDiy
	 JFoicZmyDKSYoL5BDvrKIymSgqsc/i+3BYbEmOoBDk8I5Fw7QNZnyH2QnzNwq/ySmHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Jj0cwWoT;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=kgxTsO3k;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A56606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A56606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Jj0cwWoT;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=kgxTsO3k
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYvp73935889
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=jCQCdjWXGwSTK6KbBHTCoC610x
	QNusLZzaXj3lRu9vY=; b=Jj0cwWoTPJ1LT1nEtYVY+g6wopvZb2ugEOPQhvYuZD
	rZXjEdPYzTBKd0n/Xn2H0QkYSXsJO/OUQU+SG9NXan49oxGdVH3tQCnG/gj7tMz/
	3L6Eh/do8aRZfoMXmalg6p7RAsCNIzgG0FVlNk9wo0DHSKmsyfPVtP/NQI0Ctmpp
	H7raP/Dx74Sy2BfJbdthP9WDn2DDVzGz2lEkkrpAHqIDRLHcIQv62vB8EAxUJd2D
	+55kJzkTDg4LUOlHrKKY/4VyAScWN0dBbcVdYdR2QMXnkXNXe176zsyOFAEbqW6B
	Z9ZV+K15NNLLDng6fzrtofQSHdK/dm0t/zgeBR6EZsNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059ck743-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:22 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso676755085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866901; x=1795471701; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCQCdjWXGwSTK6KbBHTCoC610xQNusLZzaXj3lRu9vY=;
        b=kgxTsO3kCmxOpKStl0WRl3Fv5IpTEM0ZAjx1hq3lLxquh3kRbPWT4H5sfnKa/Lgi3Z
         tHz0hN8Czyt2c2AqWdf3g7Ej59/vr2bKmvJlpENtOWAd6Nc6SbUYl2zIyEyvQ3Idbalb
         TnlmuP73o0obty2k59mgD/n47lYa+FE7Xw2m15rJczAmJJBSfHsVKr7n3AOCJmAgDjGA
         zHvaqkIbGScGv5Fj+8xRL1cwdXz2wrTo4NdEjJ3QqEyvLEwWSj9NwCJTG13JkepDH51P
         ZCFCHFz45L2KZUeoEIs455eNkwo4+GXnMhNWcQx4rPLgq6hScKz4j8pbvWDjh45furhO
         sqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866901; x=1795471701;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jCQCdjWXGwSTK6KbBHTCoC610xQNusLZzaXj3lRu9vY=;
        b=coPvELtTB6eBj0zuLLCRIK+A4jdRGm/L3UPK2gjV4CIfieJF6g3h4GBEA3Qluq9OWu
         E5KRHveZzCXh2eiw4cPEirvBqZrPcMIoN1iL32J1vAM2KZkroTw5Ob0a875GRwdDtUvq
         7AAH2Zsz0R+XSN9N3vIcCvgFJ+mSxbWa25iYCilKVncpkI93F/NJuFzc0oZbDEfF+3mp
         psHVfePCYpTQuhV7TAUraVY2wQFLgRUm4LBahB+9Nx3pIK5dTbo5YQ4BhyJA40Kx5zmD
         QQV7SqyYaKb8/pORftfF67OI+zxD5EDblqbVXxQgOGgkGArDi4v5H6jNfiAwWKbt3ceY
         C0+g==
X-Forwarded-Encrypted: i=1; AL+hErFBaiXCOnrYtjjNoWPi/T6v4pJtWo8gGpMmN+L70JccR3Xq8QxA7At+cq1mI5YxYNm4eD1q+RXfFzmKlMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k3TIVw9KxWCRI32B26fa883dvU0ylCVwu16tM1AbJ9IJGBsQA
	8NVOvH8PW7Eh64i7Cgi31qZK+4oAjroAvYC4ovMakR0oD1FHccibCf1yb6HIia9rWUZ8zBF0zAk
	CzClIEABfrZEd5BAJZO+oiRH2QHNBp6QK7XIyfd/Uq/akz/5BpEiexH2bJ4LsnIrRR8QHDA==
X-Gm-Gg: AYBFou0WHPoyYSl2caK4RvExQu75rWxDBVDja/WbaKe3xr2eX/O1IqfVCN0FbLfItLM
	5adPQAfpj9MujPazJ0vZ8clA7eaRKtdEUn0LLAWBy8lV1d/8NqUv3jy6ctbESJjoYkThgbBy2qK
	gwmgeTPVDuEXx1qv3ltlCCknuooSev/+BF+Znks4EWix+bpGoR0OVs6Px8gybETWjDNm1bsM+Yu
	m1+gdc69OTKyhb/WT7OWg2wcD6iodVzXyym+nqNLEoG4ARkPV6a3SucKyfqhABdCLzT0O8UStlF
	G9uQsk4nszxlqziOilv9PBR0NS+HVuHr+ambMXvf4cxkbIOHA7mdpKrV6THk2fvK3lni/YIdgMd
	3kgHbxEboyxcstvym6GVlgVoQ7Zw0gW6JhxAynulsYljeKEheSMA61V2Xcpr+tsSV/LIc1ELNEE
	EHDwh+EmScBTT+6WnlvmKH
X-Received: by 2002:a05:620a:6cc1:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-9494bc57948mr1946978285a.65.1794866901703;
        Mon, 16 Nov 2026 14:08:21 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-9494bc57948mr1946974885a.65.1794866901277;
        Mon, 16 Nov 2026 14:08:21 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:20 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v3 00/10] ecryptfs: remove the remaining struct page usage
Date: Mon, 16 Nov 2026 17:08:06 -0500
Message-Id: <20261116-ecryptfs-folio-v3-0-1aba8e620eda@columbia.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMZ++2oC/3XNQQ6CMBCF4auQrq3pFKToynsYFzCdSg1S0kIjI
 dxdwI3RuPyTN99MLJC3FNgpmZinaIN17RLpLmFYl+2NuNVLMylkDgIyTujHrjeBG9dYx3NFhUA
 kVCZly1HnydjnBl6u7w5DdSfsV2Vd1Db0zo/bxwjr7i8egQtusgwkFKoCnZ7RNcOjsuWe9MBWP
 8oPQR5/BLkIGg+pAZ0pfcQvYZ7nFyBUA7kDAQAA
X-Change-ID: 20261014-ecryptfs-folio-67e80ccec7f3
To: Tyler Hicks <code@tyhicks.com>, Erez Zadok <ezk@cs.sunysb.edu>,
        Phillip Hellewell <phillip@hellewell.homeip.net>,
        Badari Pulavarty <pbadari@us.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Stephan Mueller <smueller@chronox.de>, Adrian Bunk <bunk@stusta.de>,
        Michael Halcrow <mhalcrow@us.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=3051;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=e9ns/mhrua12V9cs3nOxOTFGBfzridFhDLFScimnOns=;
 b=iBVxfPIBdPottMuKyPmmAPo79Z1TtTJ2eIEFxn5bup/BvRzKZWhGSUSVKFVGq+hcJWd/M6Hi1
 ABps9rU1r/nDCzVpL6RuvalHXWAsLG0wm+gt9MHin7ZrhDMws2bKUL2
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX1bR3UYhP9hJ8
 9U78cpYzlDd2Q2+PLtidTFnf2WnZvTxhiK7mf2Ob+VFOLJpQW+NKpB0APj6A8MkUuDHxz731GH0
 URHqPsdyHrKJ0EParAdv5xoMuO+bweVDX4TVjNC70fz01R45xDyh
X-Authority-Analysis: v=2.4 cv=MsPHeGae c=1 sm=1 tr=0 ts=6afb7ed6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=bC-a23v3AAAA:8 a=yHkjf8DjpYn1_ea-2f8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Aou5jLGa0X6kKbXlHi7LIYOM3nwp23sA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX9EQTYTakevd+
 c6H2YlWgixrDJg4gjd0/V0tC/DpQSGsuzOPENhoJ8FQGXmDqPkAXBMrEs8MlWxV+Ssv02AMuWCl
 GyBxM+WIRs3PESBRLrGxkY+km0/Dqr5mJFv58ZT62T8oBtUj55F6DdR3WiYJkqtN7eciVgjEANG
 tXlWm/joL8DU8RhNOkbDaRn44hV5QwsxbWpHn79554fPJaPFb5d5Fv/ip6cV1YomMFvvkc5iCiQ
 tARu/xT9cpmES6ZRoRUdTejy3dtyY9wljsb7NrIjLGDKDyQA/kOS+FKNIQllM+QR1wzXm0Ny7mb
 dJAfo0FUjWmMcAd2U4/IKpEhgHe61QitKC0q2msyiovoLHI1z33w41v7FbzsKaCMLILF75YonBK
 KqvjK/tLo4R8VAbJcOQlwHdIsL6CIqRJFimNDFS+4vmB/RRTNjvAlcfnfqrnZ03E+AzOcDN8iTQ
 TA9/dpma2SIJc6k9fuA==
X-Proofpoint-ORIG-GUID: Aou5jLGa0X6kKbXlHi7LIYOM3nwp23sA
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=10 clxscore=1015 impostorscore=10
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160088

Convert the page cache side of the encryption path to folios, and use
plain kernel memory for the buffers that were only pages because of the
old interfaces: the ciphertext block, the header buffer from
ecryptfs_get_zeroed_pages(), and the scatterlists built by
virt_to_scatterlist(). Also make a shrinking truncate zero the tail of
the last folio in place, as other filesystems do, instead of copying
from the zero page through the write path. After this, fs/ecryptfs has
no struct page usage left.

Three related fixes come first. ecryptfs_write_lower_page_segment() now
writes from the right offset in the folio, which matters when a truncate
extends a file that is not encrypted. The packet parsers now reject a
zero-length encrypted session key, which used to leave a file set up
with an all-zero key. ecryptfs_write() keeps the folio locked until it
has been written to the lower file.

Ran cleanly with fsx and fsstress on ecryptfs over ext4 in the default,
xattr, and passthrough mount options.

---
Changes in v3:
- Patch 1 (new): Write from the right offset in
  ecryptfs_write_lower_page_segment().
- Patch 8: Skip zeroing the tail when the new size is page-aligned, per
  Sashiko.
- Link to v2: https://patch.msgid.link/20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu

Changes in v2:
- Patch 1 (new): Reject zero-length encrypted session keys in the
  tag 1 and tag 3 packet parsers, per Sashiko.
- Patch 2 (new): Keep the folio locked in ecryptfs_write() until it
  has been written to the lower file, per Sashiko.
- Patch 7: Hold the folio lock while encrypting the zeroed tail and
  mark the folio not uptodate if that fails, per Sashiko.
- Link to v1: https://patch.msgid.link/20261014-ecryptfs-folio-v1-0-f4412187b1d3@columbia.edu

---
Tal Zussman (10):
      ecryptfs: write from the right offset in ecryptfs_write_lower_page_segment()
      ecryptfs: reject zero-length encrypted session keys
      ecryptfs: keep the folio locked while ecryptfs_write() writes it out
      ecryptfs: remove struct ecryptfs_page_crypt_context
      ecryptfs: use a folio and a buffer in crypt_extent()
      ecryptfs: use kzalloc() for the header buffer
      ecryptfs: use sg_init_one() instead of virt_to_scatterlist()
      ecryptfs: zero the tail of the last folio in place on truncate
      ecryptfs: rename functions to refer to folios
      ecryptfs: refer to folios in comments and printk strings

 fs/ecryptfs/crypto.c          | 145 ++++++++++++------------------------------
 fs/ecryptfs/ecryptfs_kernel.h |  21 ++----
 fs/ecryptfs/inode.c           |  55 ++++++++++++----
 fs/ecryptfs/keystore.c        | 118 ++++++++--------------------------
 fs/ecryptfs/mmap.c            |  60 +++++++++--------
 fs/ecryptfs/read_write.c      |  54 ++++++++--------
 6 files changed, 169 insertions(+), 284 deletions(-)
---
base-commit: 8f6626bd6594a78f454d02b27b74a580c890cab9
change-id: 20261014-ecryptfs-folio-67e80ccec7f3

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

