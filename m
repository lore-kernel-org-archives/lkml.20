Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188068;
	b=tY5RY+CSLXqidWXfWWenlGTgBgdCzwcBLYkU0bI3YAjOfm9szyVDRCMTVnRuLgvCKuJb
	 eAbM67K0uZXs3YArLLMFYtHUROAVFfuY/fwkDjxXPVL0dwXaqVnT4JMx3ccpQzjQLsaGP
	 ScDcHlEzvrim1uQ8VOgwdjgvkuLD6Ulo/SVtj6tGKqm1gsSrvVSpDRaAjCYrfNUvLwj+R
	 wUMUWFgMhIaJntYIFikXMdWWRp4q/hg1s1iGh7D2y+vnj4tS3FbXOcXyPHgrmafQxKrDZ
	 T9HtxIXKYxQ1mmmcQlgYbG/n685e/gfP4m9ZLQqdeB1wxb17P0uXAmtRkW9fxI0Kqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
	b=kLk96kmQdCM0GbiO1YNm8DNE1eBxNgMiuuPu3xYQNMThstsxfheDF5nBr36bUtHHkPby
	 /UmMVnlTs+aUfM69WYxszKMWF89f0p87QRuT2q77KWI1fGSHGGs25gn6u5RkdMQrEjs4l
	 ENW9HFg5RxDrUR2b30EO2bFb+hzhLT1i1EfEJfPTRsvJkZWz7y50B3BLd0sHqsGYAPrxu
	 kDovwZTOCuKny1g/AoVkNoMdbWvU9H5yasRZJ3b3Wy2/C+Y0twdt/ABM/iFigBzl5AZzE
	 JzfkpM1ajdj6wJuWaojbJMrI5EGQFPre/hhxqmDF6NBdHY97GeOJdAg8RxkO+4o5C3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaBogJJe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D02606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaBogJJe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4JZ1053321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=; b=TRk+cJvThlrWvgUv
	rRTBz/Rw9AnzGLidu6z08uAbGk4UazAMri/Q/nTdPIfPe8hV0fBdjTKHzWdOUvA6
	SPNn8xzWgw3TVcz50heEgFer+p8rWas3ePyTTEaALZcRh96qm18UZtAmeWtpetOj
	qSWsXZ6ChUZzvjZ5yLXCh3NOf0RQLMQ9kiaU2NqANrRxLVaNjTYKx7PA0Tpr2c5Z
	4N6mrIVMPeA8iZuMvRQIenS6aV+kplnji6LuVS1Cp7UvxiCA76TrEjjalPZ/0wBC
	ojdt6StbSSxUMu4YI6olw05K347k+YDd0+zZ3W9OY5+Ze654i10JQqdhCqR+H43F
	hG95iQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw974h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:47:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso9373505ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188066; x=1793792866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=gaBogJJeMLEHrpIPUcuq2MfcG/ymrmeZKIm7R1VoIC86dg1od/W/ehxGsa2D3vuk1m
         HPpgvjDOoU4uSyZqatnkkZFc/Uvn95l7CHGo9lf8PQ0foTOG3GwGLIoQj/mRxeJZYx5/
         t6UfSq+/zRypTQef3vk40YlmO/llTe3+P5nThrJZhvgm97RXfujDMYexvsbXo9mkc93y
         KvtvpDqbEhkucqxO1lSTqaPUqxhQAZi8pqvMjtqrqOMSsFxkxkF0mFEf0fcN32qXHDHf
         jZ5rShjTZeqh0i8btQFFO6M/TPi7i+FIThTEQzUky1SbY8XDTnLZExEy8CiD409vr+HJ
         kl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188066; x=1793792866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=P+9wALgnzyjtlTXFZKRseOPjpFv15nT55e8h8TZ4qEVXz5Zecv7jQYTLdMHFoEqZkb
         olhY5T1hDRfyxotwaT1pA0sMnyenFgVuf9v5KoU2fjoC25PcBfz2mHwKzc6ITUEvxFSy
         KBRV38NyFzSGsuc1fXSNZjcc/1P8ojT4o589XaWUIEcYa12uRf+P/F+p587fsuMosmby
         vTNOXE2gnyBF6KNm1yLWKtkuoHf5bEayD4DfMaSvXGDndgvTP3kJgK1ZZ7Nwux2wd8g0
         04whLFgEB19kyWRyA1NBDml7fK8qPMSefAvM0cMJDBd3/hrWbLzO2PLQHDZSrOusmeZv
         noSw==
X-Forwarded-Encrypted: i=1; AKwUvBw8VW/F//cvwtBExPxlG3Db+9uGHArEBLkmufb1iQsiQjGkpnIVGLhgbKhjM1pWKc1JRsQ3RrPNfdZhFEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/7SyEu+2DWzGptETHCye2R7Ku27CRj+6Vs/I/1CBM+mz1SUx6
	UAiYfgDHLgZc4GOfiAQDfypMqk1XcPQLEnlK9Q2jc2/xpkS7awBfqg6LkkZZzKbGvvCF6lJtLD3
	0A0MVdmD+7zPvTiOS1lYsgzfwyhPdyWqn7qic7xSk+XCQpQhRMhjxyxrwXTsm3p6rEJY=
X-Gm-Gg: AYBFou371BypnZBT8NgiFGK5tffDdOl4/2tE2gwTXLx+UYHaZwZuaPjCbPy7PMuUEj9
	zU9eCD1otjpEIwq5368nIALZjeus2rtUckkTSCTE+XTGcT7Y2Kvhsff+zmggjg97C4+5Q2XwFla
	Vlo5582rDP0CS5RqKVcOWdukjZBmMuYGjZ9RmW+Mc1H/ZJ8xfXcvdTj/V2P9EXHWQ6FBEFqZSai
	mJxDoeAAn4OxY4n+9ZBZbWb4Kv3Dx///0gyTn+LQUerXBN4izOCzamB2FWYYVPnank/IuDl7AIq
	eSmnGkeACMmHXpPf0xFUr8lI5KgtJkhIML8K9C94HCBEdrXsjIZmmuPnH1EOFrSYDiuqqRhlSvh
	THpb3oPx7ecqprd/HBMym4OSiKpMijcu999VlEa1jHCb0rW3Opot/xYOsZMHW+T8MycNJq1s8sP
	GJjD3IzjU3+2Xt+XAwK6zRiajV8HO/
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458495ad.59.1793188066547;
        Wed, 28 Oct 2026 04:47:46 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458135ad.59.1793188065798;
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:41 +0800
Subject: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188043; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Fdpc/cwPO/s0yoI6hre67PeGTToBFG3hV8kaAFSlrjU=;
 b=UXyHBEaTAEOkqMTuwB7THPKdjj01ssGYxm/IfpMHdxA7r668oZktRwEdGTTMV42sxolaMW+xY
 FtJ+bPI8nSvAFSvvjAcwSSuLrsk3Jwr1Ce18R83ntKIzfGc9iWxpMzn
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: spYYRAn61L3nhUSYL1VNKXfuFkdhdSEO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX2ZePbnXQ8IIM
 48aw1/k9HV9ALU4ddwX9Pdhn42ZjuUZ256pPK0j0mGN8KGV2v5MhSPRm1LnZdPY5uc1V30HhTLz
 +uqlSxYqvNA2ndS+ooqG+NOR3wSrDfg=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1e0e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: spYYRAn61L3nhUSYL1VNKXfuFkdhdSEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX06xEllfmf2mD
 twEyJs2t2hsx1ebv6fnrsiW+gS8xs7Ey5DZUXBGzNoELlWUnUxWuDhh7v+rxVFnr/IgbNuKmywD
 H6KPkITKj3e5SIn19YVT9saZBLGdbsmkyyrNcork1jp9hPY3pLdFiehpDpZM1obSHkPCh1zCFtj
 8hGihpo5hjqt0eAM7aAPbSTEmb05Trouwifu+uGPqFLEMAA3Flg3qsmvPppZC+Jm99lcr8KsEV7
 64Zqi3X3oLLV9NjA7Fh+HoKiobkizaMNP0fkWrLIx06Bvyr0jYTjykzH0vS6OwTuPPXXcA8XIby
 A/+w3Mn0gb5+L7tugOrl0x0iFGnL7Kwn6kgzXhUxNAQCm2/RbrB9UtOv9z1XzCaEpy83OzNITrG
 VN+FS7C8Zxvk361EZt4r42770AQ/tkF6FcumLhD4F7fSkchuGO/WhYsT9Qqbjc8/7FdXvtnbjmh
 LMipoRrEM6s8o0rJc2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

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
index 48adc49b833c..347a5a6d6a1d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

