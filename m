Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CA339705
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888750; cv=none; b=efsfr2Xr+c86H0gZ5bGdkKe1ZcbsNLQ4Q2dXeW9G5sYNT1BmzGi37o1PkECSKs2iGB8eI9407SgsdemA0vzKBbRqfTx80tKWh9noSt+5xX5TueEBNaPeiLESwop/mTD8H+yBYSz7K76DR06eg6xRZkWpMTsNuDNrZA9iRsv5yVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888750; c=relaxed/simple;
	bh=YtizxNhzSjBCt9sQnYHFkLSFuB+kE8v57Hh6K2S5Rxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFB+N0rZTAybHdGxvdfylVD50Mu+X76phJLtkQSZeyaZEovXM3SA8XywmylpQrLOOA4UGyTRR7DW028TFnbBba7qdDul4Tqo//hpvmgjZo6Njw7obUVa7eN7Ot6F/dneMjNPpW4Z9bLspahSz72DsNxkcEkvOVSJuNn80g+dDOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsswISVR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODgpiNA/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsswISVR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODgpiNA/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54lXO1609024
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=; b=NsswISVRApcxNnWd
	q9I7ebIEijYBgNSzK53NvxYK6vfDmnBchXTGFnd87W43g4i/ZCnmvh8ERfITtzrC
	Q4yrhbhZvaz2cc+4afmKS3BoDvSsKa4X0n13/qMnrPluqkmcP/5V9QXQadq/AJIr
	/MukywDiwsY7CYzgQN8fReDdaE+PFwMkYDsZZlpShm1LQpJHhNs8XWVDZFZ8LIrn
	G/eMZJYlavH2jybYjYA5rSMgWF24ZBpEVDnm+FlLaJ2zRx7bI1lFmbkMw26zzhEV
	8aqB+7otClsf3bOiAkhIIqRAeH1JR/QBiD1weknie4Ekou1ovUtNuF55PHwuUDdx
	7CBebQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32fkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so29207345ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888747; x=1790493547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=ODgpiNA/jtreFfD7L3Z3+LOo6DOM+7w3q7K8H+XDxJGPoZMKUy8yURoH60Nnndfgsf
         JGgKKubTmQTJa6w0gLQBbRYrXSSXQfHI9iD+cyWl1HaX9mCFvFfUxfJiO29d06FVxt+p
         ubKRJ4ss9RjftUyySCJEddGwC577KV/yWg7kDttRZXfDafuAVFcNCDP+9Rja81zmuITh
         pcrCZM4eav/NSfH1nP+zxi39mBoOoRVQd+zdC0ieGjxnjal0tiPBDwPHRJLZIFcMNdWT
         h1IdoyuGHeEOzVdANX+7cu+1eoJq+uJvELvaSvtp9a4CcLUbY2NqgUNnaCpcsMQq95r2
         9bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888747; x=1790493547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=vqDYhtyC6ZWNbKm38H7rNjnhVC1X+ChIq4WSkT/wTQXmiPvyqkKJigPhBhcNONxVYK
         dq8gYKaVq8xZcqAF4pzbXtxdeokCDAB2wb8J+E24EVsK624VtH77JyrsfuR0K1qUDvKP
         kuKIr4calxoDX/x/oDQ3/R6fltb0PXcUM7WE1Ze/NnyniTnKc3qzZrLRsJSXF45EAW7c
         2icQWd1MWlyuHPVP/h1K/tF5S3aepghfLkskLRiAkOVtVvUiTR8ibAs6npCmBGU8WzAx
         BxEwxiPnMrMhBzWBhy+S6dkMVJI7TOCTkp+za63Yg9/sHG13SccVtkkchnzGetEadTgM
         xvGQ==
X-Forwarded-Encrypted: i=1; AKwUvBya8XBtdUo/yt2DsJd6Hx5yjFevKe1UhSDXBgVHBP4dQmfeWRXrLawKy5dOUfNCmgAhbqJfRuQnfmbUxW8=@vger.kernel.org
X-Gm-Message-State: AFuF++mhjjABSI5fZRKct0ZMUjRM5xu9VnTPPmb0L0GF8DjTZozzYcym
	Barkkzp8wa8YvYmI/xSvD45up4NB5cvOeD8n3/tE9qPbK6n0hwrOe37dZgd97yIMTcD2hj669VK
	/5zCzkxFRLzzmafB3ixC/6HpaCS2ru3hipuaZQm7/omDXzl4RgIecPoLZcCt9Di5zN5M=
X-Gm-Gg: AYBFou3BDf4s3bxuMoyW/hKGO1tcNjSgsY7ehIg407E9cHtZ+W45v69upZ8Y7x3H0jY
	seHABRuVQbD6wNwL2FFapDhFVfL/gsXij74xKcT42DksvsiQ/sfTIv4rgn9EdX1UJOBvjKf8wqB
	STFGqeh0gCJS3nQ3lTKMfjXst6stQ8J++eCPywvv9eU4lcIfA+ZAcGnoSWzfM6mLghMgiGP4+K5
	vE+VnNIftKUgD4C9os+Cxv8KZi1HfTNCUZlive6UkxFMh0Jrsca+gNQ9a+TLXkOvX9KvXUnJo4o
	ro77imvYwUqiRYPrbuchEfF2ynspCHcL8rNjNk/TidqxrD3/XQfAVZZUjNE=
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653525ad.19.1789888747490;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653405ad.19.1789888747065;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:06 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:23 -0400
Subject: [PATCH v8 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-3-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YtizxNhzSjBCt9sQnYHFkLSFuB+kE8v57Hh6K2S5Rxg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSeumV0wYZYK+vLtRbLJ6lylrDY+nTvdCdoiixkD1
 2Stu8fdUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABN51srIMCsoe/lpzy/vhKV/
 S/9pkJ3Hkm6TZL9H7rLShfSXAZXnHRkZpk2ZoRiwsild9cBTqV0XDt58dW+J2Rrfme+LpTJ+MRx
 M5QIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: m8YVpE8AeN86SEo-B4WWXymFcTljIXOS
X-Proofpoint-GUID: m8YVpE8AeN86SEo-B4WWXymFcTljIXOS
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf88ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXzu6xk7W8Wkkr
 6GHc7MstDpII8j6ddtR4u9aMBtbExzytVL9+pEDq/4yDk3SK00pXCupSkb+Um52aoT4aFypVbYD
 KcYWxCZsT26v+n2VV5XfeXDmD6CMBIkJEr1ZhqcdhLrm9DvsCzITezbbdNl1yntQncm2CCCRiQ+
 s7v9IkE12tG5zwU3828kwc4tx7LbhK/9Z+mmI5BsrVhvT1YKzuMcPPBvxcOB/q7nhGjfhACnJip
 MC4DgpnDOkmnHCOILrntbIJQLHKvXCuMCDgu4unI9nU3T081tWz9TIzdkN+OUm6m3jYZFlm02GC
 S3Txz6gTFXBxSOKNcHrhJesxkSG2vQ4QTPffTgFyDH1dLKNNDM6qFIQ6B0WrReRvr5FEgiiLnpv
 I0T1anSnKhSI8nMhcLgaO1o/DubNL6TcqN3+DEoLtHLVxzBrZ5KJoX2TC92js1/ge6itHlKiVhQ
 12pntTELYW/KcYATFhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXyqfqA5U4CfNT
 /6c7niN0WaUFnBbK4XtkZVujD7SVTX/p0BDYJaSStc1rYxqer+5JTDy5niGgsnhlOM7gehG3yPc
 vaEjSlOnxrIdJXtrWVlP51YvAj1/tc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: Collected Acked-by from Conor Dooley.
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@   riscv,isa-extensions:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@   - if:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

