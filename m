Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6C24A5EB3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145261; cv=none; b=Pt960nRJXMCXadLcEH0iZfhQgJ9eCIq6/b0vjBLgTbcVlge8yYzf5VdOXhxGi6BKLRsyvsFnBHaPafGtYreiFARJoevYKTv+SjGGxyU7BaR/UOgzQc2bpBAWBHAvpu/9IJbALQAw6ojt4NL3QPUes4L5OEqhgDcqtf4RKzuo6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145261; c=relaxed/simple;
	bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdLtZRKLdPC2SQ0OE0l1Mq2HOT+97uGpk2jM8fLLLOT87uGpBFKW4WbegxMArfg4SshLNWBSbevNYdbbx7XWySVenb5H29NqVMMmrbbRL7dJGzjR/dpAF6Ozvi74YSQHHTo9YDvcdJj3TRWk1M4zvOtzn5VZjHLm7c5GJlZGAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gyn0CnJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAX8ChM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gyn0CnJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAX8ChM+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BG4Igh3427221
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=; b=Gyn0CnJTq1DkJPqn
	Y51z7WA82r1rUVVjSw+LbPwKv5TyYcKkz/ER8mU91MT7X4QxRMV+s7DCpuZk2b5m
	52QXOrlDZyhUTlPPjDcYryL3lD2lXgYqecTh9a2y3mHAJVNvS4SrAP44gYjnYfLA
	c8i26qWnODbnPajTBDqIWpuY9iWqF/BtbyOa390A4C9PZLSXxo5PatM20nEESppu
	dyk61MmDwWXHDOQ0rN3CkTsjunKzvx7+EOwpjhX8CH9M8NPstxOc0BSvqKrEuLWm
	QauT8eHDU1bbtXYDjt1E42OGUxlfryvWXEznHF4qqpcUsBxT+Cpxfgyf0V5m1Ezx
	vav+Ig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubr5tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:47:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2104811a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145257; x=1789750057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=UAX8ChM+CmdkO3cSxc53ufR7ipCje3IUvzz1YsppVz5/9Staiy61DPLBnjThSf3VKs
         U2sxThZOF4qt0PXDpKBbN8rcELYUxXLJNj772PxywUbenbHJvWJvz0PSXVt6TflPOzsw
         vqZcNtqgqAL/+1ijU3AnnqwNxrI8a/tdfJinU8GkZigVsCOTf+1vQmx/7IiMiL9uPK94
         cDWYyhXBe3lr/N4tUrmdgpBcewrjWcwVKAFXXGjCLWmjuz+hWfSGnj4rLgUQ0niGF5Nk
         bBlLvVyL051ssRJbHGPQrpa3nS09VjrR6ebUXC1AE54W4/favOndMTIvECPsIsks19Z6
         tJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145257; x=1789750057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRRf0K4n/OMGCKpZc2soc2B/PhOw76TarQ44+SpuGLw=;
        b=LejHACfdIpnqt1B8VxJIJnpj/NsxEjEbRNF5NFtAMAbeAx8WmxJb3FR0GlwvKUOlqU
         uxAKIRiXthQNQksPeFHzTpBiaCls+/QM92y8eLqt3EGLaaF9TVLPVybUpJgttmKq4O5F
         ADJxQXvhkk2e5MeCwGngagY8qakGpIM+3WTBB9Hgmx3ZgoXaSLGgleWbX/6NEYwrNYjJ
         yYfjXFEkb4KCmS/wctPra+1p4qOBxRhbL6rsTcka1bbJx/zKG/9YblyiOr+fMMCz1+RB
         1LVh1E2a64J5mSTSwVV62G/OPcWhehuxfGJPuOvUsjzIou+Oxd6pirpXwuGCefm5tEuE
         is1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjKpmTT4r/ChUjdK1mULFqi4+akWw5Vh69QCKQK3zUfHgIRBajRkaj7YsN72byOOyWzV+FfQS2esunqx8=@vger.kernel.org
X-Gm-Message-State: AFuF++merDATxtLtvkASuClKhJKxBrLp0oZV5Z7gIRDCAb98BD88Inha
	pyKKINLWvu+5BC7UjQgcgdUpGNplSVjxKY5Gkxj2dBxearMtvHJbOjVRJjwEhT8LEi25zRFpuD1
	fTTyntt7gPnadESKPNWRHDZ5s0NxAVF1GHx7KqOrm1opJj4poFwuQDQZwY4uZ3l/cNhg=
X-Gm-Gg: AYBFou3uAC53oIERoBI1b0e/oLsWKXEe5rWYektY+woQ7vnQb2gpRK8zdCZKuMZ7PRo
	Hf/7Trw7OvfpCx8OeaEPj/5WzS7QZ9cnDb/ItKBRTIwEbSniS/v7ETcLjYWAp4nmlr2xERugDOU
	xZBNfbx4hz0Q+9i+COOdzmgGthM+aj6tC1rsdWqI392++EZ71fVTqld/cIqUkEkUsBRB+IinjqT
	5urF03cF7KFk3Eai3xet1kuO60LQ3y65/88oqpb6w08c0ekmry2WE6MAgf5IrUQ1tQOaXySXVvg
	vjcxxwH6gKrkgOqgUBZPh1PUcXA7Sr2VJ6zcKuIx2fHvP3KdoVUkArhpgh+e5YA68+Nmgrk5N2O
	PCr8do2YR5RkVBNjuVFg5c1yPdQ==
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr8967268a91.20.1789145257204;
        Fri, 11 Sep 2026 09:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr8967200a91.20.1789145256741;
        Fri, 11 Sep 2026 09:47:36 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:36 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:17:06 +0530
Subject: [PATCH 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-2-b9fc5e2ee99a@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=1348;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=nVeQof90N9/+rn0tz6Y5h6juwjIaGy0PYkqqWpXw4xY=;
 b=QnYHneeV9+kW1ROf5mDkfh/qHaTMW+7cpvw79FXnUfjg6WKLDqWbGEfXyTQNv5/QalqHBFloi
 lnGigFGogtsBtUzK4jB2uGc/GQkzYdQRUUoXpZmvhohD6OrAMiuqxv9
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-GUID: Aib54q89wJuOVGF6BwVJ7fyNMdI2N5Fu
X-Proofpoint-ORIG-GUID: Aib54q89wJuOVGF6BwVJ7fyNMdI2N5Fu
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa430a9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fvqz0uoX0QqgC4h9zMkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX349dtEnWd8By
 dBUUHhZsUbd0+qptCsCCC1GdxSAClGgFbSpz9UEDqM4xSZQY5CIwygzMOXLxiPbtPziCXYliXu1
 E8IiloLrpmHKQ+gfkjKTLp1ISBlgiGCJrjmYsAHmhaZyYDoxyScPK73lk3BtaZ+6p48g+xdg+qj
 bwqcXYnfbMq8Nh6pTWbRsL8WLmfDbN1LZDeiR/DJyOhDq7wbXQSpjHX7xjSQZ8SGJugHs+s8xpG
 IkD+EQ9lFFbupR4wHGdzvWURoCi5tON/XdhIiwv/wWowOCNesMvmD5Q+SbZuZpRK+t4TP/qK0L4
 x7EVv6BcJUhtNu1ElHwjO6qOXpFqNxDORAcNIf7Tj0AtRE8LqnaNFIhddQ4r86KxiOo4UGMXY0L
 LDl6JStQ5TePXwvopvv5DNWKNww02E4JS/oQWAHDQ6mvh4A+7ELPvtW1lBffnFTQ9Ahk3N8xZ9m
 OfK5nKhKhRWo3HG8XEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX6PJHMVAQVl35
 XLtZNdTQCzZG/lHT4nDvsW90h9nR1yX9UFy9+tXNKFGiHPG/lJtVpMHyvd6nXELxhpBqB1OY/2u
 1xXY3o16+YLgu/8KxXA9MsU0qypqTPM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index d03295806657..f132b1a9ebc2 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -30,6 +31,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -80,6 +82,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
     then:

-- 
2.34.1

