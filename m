Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F87548395
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419188; cv=none; b=Bjzhx+nZJEwlWVqsOLjeOBs3zo7EDWSxfSlxD4jhiDGTGnU65CFdei4MlXrcNoLYywA8qDygtMsT90Q18FlDkJ8eQWqUIuPaKpVjutaolirKunpc6d+E6+D+e1ETb28Zw9EWTTaX7RPqWhjbvqldOUYJpgcb7q2gN2j+0m5aLTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419188; c=relaxed/simple;
	bh=euGCF7vlJ7tviXbgPXD0p30PePJa4iHAiXmyIakIcTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTJgPj9SuQPox74umoxaPFyLEo6//AFad2WELXVFwokMkfuPGHe4g/H6VpG/fADZztFP/fmrskKLmYnBr24eWgR0PJjhBdIBcbo1Sj7YjTHRSjhQd+VT87z/dfMBwEwS0mQZFygqvEYiIK53NESCqmHzOGVpG4HETPsDHIHZho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOZcg2PT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7z9qoqk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOZcg2PT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7z9qoqk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0bC92774664
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ6IX3Bi1N/pFxaNhV3k9dGyEuz1rI4zEqU9K1i/R6Y=; b=XOZcg2PT3oS7gzZR
	RMAI4F9SmCUkMN3kEnPkcGSoxsmIDB2YpxSzhE4bXgLsLNfFazC0iymuQ5wg6wD+
	vftxo3ZpsbzAIYGR5LlNgpx/FVTYOuFqJJJK2DGEtIpit/EwM2KYLWrTCnqKUe5N
	yrtUXdIB3gHNvEiwRj7FLExFDXd4Q96cRteWFba6LzBbjQIEPG6gpqOdlwsLaOxV
	W8QfYzNk3J20IuBFj2JHtfgO3dXwTVual3vUU7VVRhGTzulWwsTP5FF2TeHu793S
	Kp0I1Bl5kyshTyjF0C7/eiCGUkFBgTs8spplKlqBQ9y9HJcJXNRMYLQ3ICUO0ztc
	zphHoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur35x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso431435485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419184; x=1793023984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJ6IX3Bi1N/pFxaNhV3k9dGyEuz1rI4zEqU9K1i/R6Y=;
        b=T7z9qoqk0UE9VkGAT5Xv1wgeKH5xXwmabrFOo8GafL5kbsPBvM0p3WHYKTphr2SKvS
         IPsoOkUssJBwVofWPi0Xxtk+hSaCFhQiRpSI7X6pCSe23QBsFD61CtJcQ272CzHI22cR
         fvviX92Br46R3UXerjSXBF902tCjhgPXcoJ5AFizhxa8kFh7aeIDoHQSySm2YqfvVOmZ
         MNosSVARMdVbDHK8xVD2xv2Zm9TTdu2udHwB1D3sresG5H3hqKbQsCAelO+pJ9PzWanp
         sas/hS2XMOnb0XmF6tDZhTvojUK6ngNuxAFr9FnDVAkXAquLYnaisSx2tPIXhRB5rgvp
         9b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419184; x=1793023984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJ6IX3Bi1N/pFxaNhV3k9dGyEuz1rI4zEqU9K1i/R6Y=;
        b=vROPkCajZEgM0dkxma3us7hsyJKWnree6WTCVOIFT4gB0u0z4xtgDtAkLdHdtl8iJ2
         tae6b7ZJ0F1OoLUaYUXAnxbIwtbRfrYS9o3RHrXu/qB2pkHlTqlRvgalXIMEvrk8bN/Y
         HkN27zIBoiSEAxed89gsI1jK/ojUlPeVAHg45dKqeDQUQQJX9MmgTNjy4TRUVGZVpAIS
         wU6IJH2SvNlTseIcGlzM7i1M1G+84VTlCK7l6JG4rMIyKpbOmtn+ovF3Ip9vE1HMFdkl
         SalAMiModH8eh3hEfSUQm6oUWEFHK2YtDoJilIrAag2GwgzVrRKTw5saju0kRx0L8R2S
         1aZg==
X-Forwarded-Encrypted: i=1; AKwUvBwCwIFszxWR9u+waTQUwulz9nZgvWdjJaTEe/KQSYZ1iKQHXiDM4GETJkYWa+A/8cp/Rybgnuia515ZfG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIckTL3G1e57M3z/mq7xQkV2vj4TmfwXSZZw60uRgDjIP+DH2uu
	5UoU4bThgT8q0JLnfBU18YlazAmr39tJyzRT28MTWsEIHG9W/a8ZvImnqgRZJD5+KQ7yPCXIUvV
	HNbRPBBpllTKO/CQB2VWEChT0unZS3hHDJ006+wiDC4xhOpaaZvLp3YTqD6nlPI0EjSQ=
X-Gm-Gg: AYBFou1gQOFm65cYSaZAlqh1xMnlLIlqh1ic/RIX+GmSW2FdH6yB26MiEqR7ZwHQMyH
	3wLg6ZgfD0vyFRqr9AZOM1gV5gSu0I/DHJrN0/319mQGMDbG8EYq01/ldNSP1NxzPHELyeSCfwf
	Vhb/SfO837q+YCLJxcXgsSHTM+MgxUqtxsmz0BGXO4bCmPGOb+4m0CVeJxR2JlEl7uaJZ1vcglR
	fUGe33FAY8Osv2quCht4fO3OvGwEVquXh9RJTa3yZK6qqjwMY7+8dCyjjtE0MPMt4beILTRgufX
	qZ/roB/OMyMG7qlgPDEIEu+9AwX2NxS26pwmQ9nVQJjYlaHaK5ETS2Ef3kudiupqlrAhDJNEV+d
	DEfLoAtVrEkhFsuWIlPXMniiI9a9cH4o89w/BmhKinf88Tt9mwjpQdkljc4qo0MfPEJRkrhsKnl
	A5+7eJnr3tOjUi
X-Received: by 2002:a05:620a:2844:b0:93a:2150:ec06 with SMTP id af79cd13be357-93f29d24c2cmr1268447885a.31.1792419184375;
        Mon, 19 Oct 2026 07:13:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:93a:2150:ec06 with SMTP id af79cd13be357-93f29d24c2cmr1268441285a.31.1792419183806;
        Mon, 19 Oct 2026 07:13:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:13:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:42 +0300
Subject: [PATCH 4/8] interconnect: qcom: icc-rpm: skip duplicate SMD RPM
 node votes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-4-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tG9dgYZYOQhTj56HMlvwfNGgHXx2GOhjEbM+2NC57VY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVgx0KmtoJEqYGJ8E8kj0vDBKeqP014Tj5tX
 NB3obxeT9OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlYAAKCRCLPIo+Aiko
 1fLDB/wLpryvznYCUI1egnVn+M3p8rYTcuKhRa7oVbJy3N4B+ZyJuJ3Fua1IRYWUTG/ByUFwqF+
 OzQ/kxi8lwqNdrcdEPbsB+rP3ivFKgSWJ4Sl09bH4VgMmrMY89iK/YHp7ck4fLX5XQoZKSErApz
 fKGQST0WtfruddqawjByE2zX6JLV2xhBNhg6fYY7bY17okIXTqj6hyOF3xm1H1kJjJMVb9UhAyc
 sD0ZcakTapTqjgq3fwEK93NrhzaOjzPlExe48W5PrsIueELUcp64cA65pBJMxaLxnUeDBax+/fN
 yZXdy0TgMdnM785yxT4ML6OxM8hx8KfemJIDZtO+qaFm57qv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX/1WFYrMK81eK
 NrSfcpL6Hp58hGK1qkwHjZmrZ1WTbXyPmtamWcjErK4YIEFnZmhoCx1dDK2XHF9qxa4Dzmx/2TF
 ksQjJagTlQHeQD5eVVCfcQZXKp8ryjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXz6LwmX5/Q1II
 sOcL7v0qVQFIjJm7hcpHusmxQ5z+oHV0W5kJ2I9n3qLXkt5Ig8VplyQs6gwcSiZUHGistemfGhQ
 90uIb0d/TsQbBZRzTrIdu0H8hg0u80NhsIqSbjouFwrmIvU8EmX4uqS34q8GfORyK7a4CPtL4Sn
 BUDp22nR0KjBUVqEG4HJ5F6UQaoDpywmvzRq3K9xHs4Qga/V2P7pzIKHHn0aDTA8rD6K1xOjsEN
 JjuaDEjulQhTINHxRO1A1Hnnd2hrnL/lATmgF887QZ287K9h/H/VYdL9JAS9B7bxMrNpD95vjrT
 ITz2vaAE2+DsnjVP6x8sseEJQdoKyrqS4T9nSuBPJYay/a/rjI+jVQROcZ+9qpnf7m3Odi88de6
 8EoJL1gNYIIt3CQvt6zy58IRM9oDfOlwl/3wy0++ky0YvD/470fgIKZxeKsCt/XSqERTrV9J9q7
 zWFbZDl4hxi2r6lc5Aw==
X-Proofpoint-ORIG-GUID: qYl7gF1wmQGCNSYm2AyunTr0ZKuUCEjv
X-Proofpoint-GUID: qYl7gF1wmQGCNSYm2AyunTr0ZKuUCEjv
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62570 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eZfgsOZKXB0SoYOZxj4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

icc_sync_state() can invoke the provider set callback with the same
node as both source and destination. Do not submit a second RPM
bandwidth vote for that node.

Fixes: 751f4d14cdb4 ("interconnect: icc-rpm: Set destination bandwidth as well as source bandwidth")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ddc7df31ed33..6e8e0bcf79bf 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -427,7 +427,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 	if (ret)
 		return ret;
 
-	if (dst_qn) {
+	if (dst_qn && dst != src) {
 		ret = qcom_icc_rpm_set(dst_qn, dst_qn->sum_avg, qp->ignore_enxio);
 		if (ret)
 			return ret;

-- 
2.47.3

