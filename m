Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE943C108D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442047; cv=none; b=iAwarzS1pefA9Scjc14Wj0EP9yh497DrhBQBBFht/xmuWT5lpLognTxHpIEk9cpXi3tk5KFEIG5BwNagVyWPxz8NLKRU/mvnpTuid2CC14Vha1Nlwgriu45C+Vi0cJvtlK6d5ST/8iilvniD2NbLrbeSpWzya3TguFo2H2Rn49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442047; c=relaxed/simple;
	bh=j/XQEZw3nTBBHy2V5OGs1jS7fvptWPEoH7KwUYRkTCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKkI7ujoN2GfqxZEwk7V9+c0B97ieADemQjEt+wdtnZVhb7HdDwwTnxBhofqgFJoRMC5pYBtazIjLQcDp5yOVggzOsuT5cZhUL1F+Cho/j4+YYuiMjG83AR5xJaI16/S4DY0oHvpirx92U7yxNmbRHqU3mpPzyxDiItCkzPbGs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3gOwE0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdJeNHWd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3gOwE0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdJeNHWd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUlw2895435
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=; b=J3gOwE0UxVt5ASCJ
	avXMitw3WNXtFM4PLC3UgIHCLMy4gVBVfgn0X/tin784mXgNi+QH24Xhfj8OJzEo
	YDEIyOJo/qU+mocS6gbCUT3oNo2o3ueIduFJEUhFG1Q7cN8/aJB+hNYYZka/+a8P
	Y774p77QyQvQGQeDVzpSBh3qN/kcTXfL9Z7XKdSedlIADYftOlScDeqzjGrXGQKC
	9NVB3u/Fn8VvoQhukIPISNKgTNazPMv9V8Soi9dfSWShGL85KvhnbRyirAWHIIp+
	WF781xLXhQl89nIm92/Rj4Cero5M6Dw92eZz6cFUgLZDDIupYyPUXtlf74SvtM2i
	1I0KmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg93mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:47:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so9090814a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442045; x=1792046845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=bdJeNHWdRy+LUTaa0o4HklU9/1bHo/MvELOnASaYqFIadEeFb0nfZF0kBOJjVc1P1Z
         DnYmkuHh0EPeuyvAyXfX8wpPDGHc9j8mkrRjFDoAOBHhidOYFRAPLIScUMI3eDNZQCwd
         Jzn6X2PvDqViLPog0fwBCueLXfUCTk7xsEtR8gL4aCDBzg6IDOQu//w3TBBU7QGAIK1p
         Ryx/O85IFjdxlARk1jnFOmTzAAKuESdrB0r7+nvYTcC2knRYVpxNW6BIaQ9XqRoy09in
         eCGSVpcx6XooemEk71ufstMRcxm7jE15IY2vr6syfjurKN7602vcRDF+2f2M36DHwZvx
         Xrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442045; x=1792046845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=mJnuLsAXUvQyqb27knd4GgWtedvs9qnpAwE5z4feB/itjfxRW3mS1rye60rCc0rjhD
         LPWy0fcPjmyArOBt+/ln+v5IjQqHepW2z9KDJfV6OYkMnRLfqiHRgA/OPrgV6Igjp1cv
         8uMNt/iBvilmlzvT/GfDao0FTkKk/P8yzeWM+ofVLYWZXT9yyyNfymFc0YgavSD+AzZ9
         sKymYZtrX1kMqn5uMzSC2YKyCgR1ObU8MFgHkXvjftD54sSuSyCG6O9y4w4WO0wizOt8
         MYo7klBBOEd7u3MP6RdRQaHmxAofRCaMqaoc+k8HVmOsTVlq7o1XVvvfwS+FOlf3y/iC
         wQfA==
X-Forwarded-Encrypted: i=1; AKwUvBw5hBTqTe9dpv8mZ4s3lpxBkCP7rwiQVhn8uXFQadDV6tT6Ao2S5fSzeDpWAgnfhbWC4+medohB3D7sg8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0jNehZ7HdTCywu3VK2h4MhqsWV48F3QcebEHo7ttKg0Ba4pyz
	2bXsRujh8La7RZakHv5++ABwmNEyXmOFlvgEARDU4nzDal1zgZbzUTrX3r/XUu3JyyiE6LY3rJq
	kBPAyeU4Ffb5fUY1S/nSlRcXAaoFsshCzDJdwuo4kN2tyris3uFqltvDt800Pa9jpvW8=
X-Gm-Gg: AYBFou0V2UsUt4CDclg632SXhjdbzBeKUAhMuNf0GwdaYw3Mc3LRFEtCYxpUiQheiI7
	7kX/57KM+0h61ZNhrO8uSLKZNCL5P9yJG39sydrkx6gDc+XAAhedvBZIipwte2VmG3Mgo5tGuNQ
	cOpvbjaIYMTLje+ebkJEw23PRNNJ9Mz6OVSfbcKznaJT9nsru2hD0X1R1NDgNjX3OH10NagCafn
	Whay8mQXDNrcen1ZEz6b0fYZuQFXbX3oVwC/MkofJ431F4ro5vR8HqhpAK4DyftXG0VNEoc965O
	cbd98eeE9QixzNOcSMW8ZsW3QXmmNvLpGII4N69gxJ8/eL8JMz216CRF9nptXhhxzHgsv6+SMwo
	CBO/wc/bglxHwbKcQ/DIKytgRo5cpAC/kj1umPZlCrQO7Rq2rriRp94E=
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010058a91.44.1791442044787;
        Wed, 07 Oct 2026 23:47:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010023a91.44.1791442043924;
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:10 +0800
Subject: [PATCH v3 1/8] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-1-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442020; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=j/XQEZw3nTBBHy2V5OGs1jS7fvptWPEoH7KwUYRkTCA=;
 b=X7a/wNFXtXcHebbMyKYDrN8Yycqni6KgyknrSkGsyJg9T0nph6PauXToSrX6n1ceCcY99Tnog
 YgErdd+Gx+vDaDYSZ7/BJDwI+zlMJv4B/SL2IWm+SqL0ZqPRgAJk8S6
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: 9uY02ogwZW3K8HaLTrYkPpVCjIaDXwOG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX3EmqwpI71DvA
 QgC+84r5eIpbveqa6lC7kWXkYa0l5pUPblU0T+g8D8AI7/ffwYWX6MrsmpFtsTEQcPD+a3cyiT6
 7h8zXC6Ff/extKSjoCv1Jf5MqB4G32U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXz6iNxzAMmGjc
 kQVI5GcSOHhFHays8sK9nhGJ/XGmVKV80xN9lXu+FhYakfBZpALkvA3MCCiE5pyQ5ITVDhCmUyZ
 ivqqEca9fA/uaaVZGe5PI8hUEfJDlK0fxGQ+Cs/VKkcOqm0co0YY+F000tgVzrI6YvbkIg38eSJ
 y66akukTCO+POpSxoTY5MZVE4dI9SbzzFhGpgE7q6YbTu2n1Ybd9gNI+fVvRUn4OZF3VWu4RkWB
 fj8J+zwPPq/uM53Qc7tIUias3QyqhLnVLvY+IHKgB7LcdI/zeltUO9z/CnzqrLQ+RbPkaPAwEh9
 ubVy+tmvcV8Gq3Uwtpdo3n/QjIrJJk5ajPF76ugzZbuw3QlOyWkcNp9DJCCRzpYFgy3ZHdtWcNu
 lsGd7xEzMVnXEEoR6gOfhwKLTjxEc/YzY1hW16gKXBFzTwNVhCvnon3vJKXRfy1Dl581e8q5mFJ
 SkYNhaJz1t3z0/4SxRQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac73c7d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 9uY02ogwZW3K8HaLTrYkPpVCjIaDXwOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6da217abf689 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

