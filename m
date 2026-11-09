Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228492;
	b=pMW7XxOM6nu29EKq02qKR+0G7mXYe0oaEQczgFmL74sfQEBaX5Rkzn7LHLxz2ZzKcA2I
	 VdZR4bTtSXM4yOj0mfVDEu0odtPvpmwVtZIJAmtLl8eDHxDFOjvUCH+3XUlT4xJb66YZn
	 wbD+JQfJ/mLgdqKKmKUwyz+ASvhyhrNEMNFa/MgEq9htqakG7JMtsEpAXV3yCCW4FeD5H
	 p0TSO9W9RXAGC9ccXO+C5N6qqCt8KM13ukdUD7VnUz9jGoG4aiPt5D5Xfd4VImql/N/nX
	 rZqfDprfIuPD361dJKeUPyGRucZQWZAGGwGnvI8eAIgRkwtLhOcy3vq7GOu7cigHMTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
	b=xonEm1mzvnSEcXMBm97zclzubXWBZbeZrJ7a0xeLrFhFhei8/JaC1O3copeX6aV8GWsc
	 EcbyMzHlwdxTNt+20lzeqVEpNfvC1ZlgE3J3aqZ8aWIY3AVYrnpHStpqbirzB3sWPedbC
	 HyxaXO0vmcF3BtC+YE49LX94qiBY+cGKsCPDAa60Vymheft5nkJZ/GJv1e6/HBZN3JCqM
	 eIssPIpeY9SHCOKPv9nbThjaqXydzZwg4YQbv0TjDNJXLUfXXEQmhk8b3phWQUu5OYaoQ
	 UOuDzPhs4ykb3X3EL3tS8t3R/ePGpxpRroJkbsSDEua675DJCzQO2e2GYa7NQpB6FUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T16fdjRa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HdSCyqDe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FD606D808
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7FD606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T16fdjRa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HdSCyqDe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99usKY550770
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=; b=T16fdjRasCQOR5b9
	ouA78MlzVIhS0F6MubY67EZPWYYT5AorsbHCQQL2yunaL7371J8c4otojw2xKCel
	3+zsCq/kId+BGvzZmkcmqLi2aCDW5zxRUosBMr6ZC25SYc37WyVV44tmdaXK/WKw
	Y4WGuaM99a6uPeHUj5HXQ/sJD8WAqkaNNZyYDrLfCxpVQGJuBe6ypcXN+/U5YQAy
	whAnQxBZFMw85MtPNBqOeQsc0VaFwrcZaUPGiEo12kT0XOazln/bZn2aLAZOOBnb
	KiaJPWB5aYiSBiZWLIOAbF6d8qD0/PGy2o7aoKdmg3B/oBZQFMshJN8qp9aneAIY
	SIieoQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm35pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:48:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d978e4faso11190197b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228490; x=1794833290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
        b=HdSCyqDe9cIES4e6G8k+jTMnHB9pmcvD2G0FgwioUolpwFFVSDnYW0mEIdpetDPKay
         waC+Yd1ysA8YXyChIhBgISJBw1qilsdb3uG2Xi8QHSQo7t783EZCOjHmb1Ud+SX0JfL4
         QvwaS7DeRbBIY0VnV20oe4aWAPKrxp9TTDLCG31OZbQss7c33H0c/cG+Ae0tMNtECF//
         G28Wexa3p4pcnwaLqv4KpeFz+1oK+ChAQW3/RVDg0hUNY6UKjnxWxbj8jWND73tYJD4K
         29u86SggPzlx6D1+II35mJjBOpgABH1XAe6WCcEN95dFgN0fofIYGTli2iDghz27OjDy
         KojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228490; x=1794833290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
        b=TA8UB2sFDtqVO9VL03nnhsUQOr0AV2xUhEIpZBKZKp11vV3B7rfYLUDsg6v+6l1PDs
         F8rFcqQ5mquwXPk8+4YAE4z90TDREVEmuAqexdFWFJ3Rr//uHH864talwSy/CuIRT+Ir
         0PMp1Hfv7niItUmmq/xBKUyWk2HTNprgwurIiYYRf9/vWcGIkJzLUU/mHpYxdUSDE9/S
         6D8D+FibtCbWQ1Ns5vDtz2KAUq2QVTxckgX3L4x1RjJTxKKWjc4R6apRnGLEWlVsDMD5
         uLGK/YYM8rm2x9rPYVn8F3uK2uOv/U1IqPO6/VxFUWzcmtcowCuGpvX9JMkq1Xh7tdXW
         Xtzw==
X-Forwarded-Encrypted: i=1; AL+hErEwG9lzTPRYj1fYRza0IQYxahU5hJrvZPzzWWXGqyPbnkUpXK9zN21wrKuydyrAbSukZ+bByFEdNAxwTaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bTR8AZAuFMM5TwpYvxrMsAnnhXrESBNmU2sOx6dOhvQr3um9i
	M8cZcJWrvaKyBvzJhaDDObQDlb0e7Xlj+7Ky86ZT1dY4Y52+6wCpwXzjK8Qq3D9Rep8aJb39+uU
	2BmQfQGyWZUSZq8QWu6QZuTo5C5ahHwI62q4qigQvqD6odt9/hoQ3Q3kzjwd2aa8MfSs=
X-Gm-Gg: AYBFou3hzzinmcBJHzAdkeVYuCeP3kJHLGZyyGKKDSbMu7JK6Fblv/trF+SYHw62h8k
	/BqyJcLe1Xff6w8v3LurGdJ49+Y+rckMr7Sl34PWaTSF7zAos9gvU6bMe/ZR2C9TStGvWdcOINj
	sgBru4xXBVplNOBGdxnH1zk60O5enBKUhSqz7NxVqCu37toiYbrDqpaJwCCpr0ZYeKi43GDGpK+
	ujULszbZu/4uY1pBeVPwCOuRD05LYpzy31EOoq902IVpZzWN1zRfTNpqX4DTqGVt6GUb69PQ3Ti
	eSPa77gP6SOVWFY7nU9Emkr8hbThwruAN4QKTy6YVp7iYZXVSWtVL9y23zGEw7D/UOBiHDIOmKY
	QhBYoCtKRGNPQNxIzs4u60yDjKuJqRZRUdbbg/zUTxZYkPWJbtG6cuF1Yq06Gp1VUXFBvTd7rP9
	Fn6ZboEoIoEg==
X-Received: by 2002:a05:690c:4:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b36caecde6mr19899497b3.56.1794228489526;
        Mon, 09 Nov 2026 04:48:09 -0800 (PST)
X-Received: by 2002:a05:690c:4:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b36caecde6mr19899117b3.56.1794228488647;
        Mon, 09 Nov 2026 04:48:08 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bb42553sm34525217b3.15.2026.11.09.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:48:07 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:36 -0500
Subject: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
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
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6764;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=ybtAp8KzOcpqJ/eft157GhybQwstQ8sSDSOgeJAecak=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB15vVWQzMI1rF2dcaLTN7+6DqtxYoTkiM/4t3mdjU
 bRYyvRURykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAExkjhYjw5vFus8Nw644VXBG
 VZZnL7XPUEn8LKuqmzEhUeLzpGNfVjD8U+NtfPFP+r3xvqNzj21p11dVbNSZvOvnnjabiUpmYcX
 V7AA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX4jVUid+xHfxc
 HiSjPG+1/lqzkOzq3YssS8Bk3uHqX+EP4CZcXbC5lmJHuSPdKFhU+LQE88dLrG7e2vgW0JL+94s
 uRwhR1w3BBZ/LzISGWLwTZYy9u+P6Lc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX6JDVtonV7PsE
 cQVw+ikcNgcDGER5qzcTIuRiXk4Ah78/Lv+tqxzW0wfwIRc/6z4ANTM2kL1QutS9femA7i2EmZa
 TfRQGTWy/4RGFGneoM1VjoX8nlhGFgJrDBQTqvWvzltcnQE0narRiusTO1h2gjiFGFutfu+laOO
 1INO1ie87KZl7+GgVFZbltbtBlGbGHQBXObOAy0fQL/zEQOnS9TSV946PF62coKq61hGyq7PEH0
 nwmYb2XNvIjaI4AQZNVyF2swb9G5+J4kWgHvfp4FZUu9g+FPJukxcqaqCtASrG6DMWK2mSpRESE
 8yF47WDysdvy8HdHN5wVo5nxCzvp2IG5dxzQ+Zn9+NltG/KhkbeZ2+v3FbuPWLy4RCvtUUc44Ci
 /Z1nepEpsj37NuwY5P3xnDZLT2pES9cGwIYKdHlgLs3SR76uat/8h8xevdJPhqboY9CcXLkriqM
 bsBRQJj6VPfoZuVuYEA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1c10a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=phefSacXyxpaYYCapdQA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: 0_PIh9cSREImgRBCsMZw6nKfgUPT5Whp
X-Proofpoint-ORIG-GUID: 0_PIh9cSREImgRBCsMZw6nKfgUPT5Whp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

Provide a hwprobe base-behavior bit, RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64,
so userspace can check RVA23U64 support in one call.  Without it, a
consumer has to test more than thirty extension bits across three
hwprobe keys, and still cannot confirm that PMLEN=7 is selectable
without prctl() calls that change the calling thread's state.
Userspace treats RVA23U64 as a new base, so expose it as one.

The bit is reported for a set of CPUs when each of them has the
RVA23U64 mandatory extensions.  F, D, C, V, Zicbom and Zicboz must in
addition be present on every hart, as the kernel handles these across
all harts.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v9:
- Report RVA23U64 only when F/D, C, V, Zicbom and Zicboz are present on
  every hart, in line with IMA_FD, IMA_C, IMA_V and the host-wide
  Zicbom/Zicboz enables (Radim).
- Update the RVA23U64 entry in hwprobe.rst.
- Reword the commit message.
- Revert RISCV_HWPROBE_BASE_BEHAVIOR_IMA to hardcoded; do not compute
  it from I, M and A.
v8:
- Add Co-developed-by for Andrew Jones (Conor).
- Say in the body that the IMA bit is now computed, not hardcoded.
- Rebase onto riscv/for-next: drop the BASE_BEHAVIOR case's own
  pair->value = 0; hwprobe_one_pair() zeroes it since commit
  d0fc6fab2046 ("riscv: hwprobe: initialize pair->value in
  hwprobe_one_pair()").
v7: Use riscv_isa_base_available().
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 +++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/kernel/sys_hwprobe.c                    | 34 ++++++++++++++++++++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd15..c24630c672c43 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    Each base behavior bit is reported independently of the others.
+    Hardware that implements a later profile whose mandatory set includes
+    RVA23U64 therefore reports RVA23U64 as well.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b4369..4f5d51788c416 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cd7cf272e6e11..5be5776b48e6e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,32 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	/*
+	 * F, D, C, V, Zicbom and Zicboz are RVA23U64 mandatory extensions
+	 * that the kernel enables for user mode only when every hart has
+	 * them, partly because their enable bits (sstatus.FS/VS,
+	 * senvcfg.CBCFE/CBZE) are managed across all harts rather than
+	 * per hart.
+	 */
+	if (base == RISCV_ISA_BASE_RVA23U64 &&
+	    !(has_fpu() &&
+	      riscv_isa_extension_available(NULL, C) &&
+	      has_vector() && riscv_isa_extension_available(NULL, V) &&
+	      riscv_isa_extension_available(NULL, ZICBOM) &&
+	      riscv_isa_extension_available(NULL, ZICBOZ)))
+		return false;
+
+	for_each_cpu(cpu, cpus) {
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -309,12 +335,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 	/*
 	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
+	 * extensions are supported on all harts, so just cheat a bit
+	 * here and tell that to userspace. Other bases are reported
+	 * only when detected.
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

