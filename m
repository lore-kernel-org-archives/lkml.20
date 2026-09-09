Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E775D4BD10B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958354; cv=none; b=XEplvMtivIszdtQeqwHRw9HRebWujDlQXf6Aj4CXHFPbQPCi9jUllesHjMPKQX9q27uDyAjvGSSB8F/U8zBDuUmcan8B3Od3GoMIq5JXMw0LWqtLdC7vVZ8/XA/8al5UpPvBzs3+XbBSUzBEFMBL1uxyi0pPH9UriW92ujs3s1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958354; c=relaxed/simple;
	bh=cXvKb72H0RorSkYji2BUaKKOmRWzyLka5DqCZ/QXA5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aj/4NGmXs6DCIEEisculaxUJk+pGhb6aOwYm2U6L5G6wlhduRkj2aXB2XiqaCyJZ6mfsWdl1AaNG+7Q4Xb7uN1GLeh2kuHS5jOBigyXemkrxOSXnrIBV33lzZtNMbih4JBif4Q1TsaCN1Sr3w3ZOFqwkJx4Rt1uZO/ronU4RjEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTmkYS9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCEhywbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTmkYS9R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCEhywbP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUBTV2171847
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=; b=BTmkYS9RPRLzZtgg
	ydHh+ZUEKk15dXcGuRmGDIihvg+taWZBQvfLY+5f7DckGqs1bGfAIC79VUAxI2k3
	byuF2VDQWyiQRrk90F9SoXxf4oehlVnNkTZFj6l2L045As7ghMagDyYWQMUWlp4G
	NxVONX7F6B0aLi+v+rlzgKoO4zAJgokh+C1BNd9uMSVl269ACmk5f20a2XwjQ2Rp
	KYExKvu8bKvrUDELdWewxi/nvMa3nMH1smsYZXu7ltenxCvX2FrEmc/aid7/W5zu
	hgYwe8cEUKa9pqzRlI77lBLFrQa/4MI23w3ADSQ0YMUcRsworkxNUpxCAP4En4au
	lT5KKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgggax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:52:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so965196085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958349; x=1789563149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=kCEhywbPrGoVj/HMoKOXauZv/9wy8B0dZHx12vW9LYa7J0KSiLBxCizNN76HBh7Hwu
         ET6yB5pD04Iic301RX4HV2BmaqFJQZ+97HilIydTpIeICl5lq8arWuQcCkiYCOH5qNsz
         3V+puWcvK2lIZfM/CiEb01ZRqGw/HeNVPp6FSyODdVYlrIf2XaZY+7RkMegXc6RTINcw
         FJlYWjbAz9CbVjgIOhG8nUAoO7Kb1KtWkgzJXKU7gK0cHEHfSomfQ98OWvdL+UhIyjAV
         Lb/ld+HbuEnnVZBKPFzXmh6WlOerP71sebq+YX/r7Jpu9IGhqwj/xXPwo6kYlmnBNWqb
         AKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958349; x=1789563149;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=CYhDuxx8E96eX+uVzHeKk1AERxkTEVKlDVyxxwrzXOsuamiRr458ltFrVDcwKGzx5i
         IOIv39i2Pq7V20iIbiprlux5Xh5N1GP/HWok2YxY2ZthFq/8vPPrTFbvi0dZ69xaLT59
         5SLKDj2P15pf/iTtck6Jik4LqQ79b73u8p6spw0ryJJWdQtl/2FAb9Dr91VqoWmkNSl/
         SGMSDaupCidLuna5fS3kN+AL10rHtwIKcmxA+/KVpSMS0Bvn2dAMsHv5ubN89UfE0Qat
         cdSBxvnti/Z17JtWByvB8YhQy0fkeDhVlzoQDdRmjNn+e0fwqWwNpWhi647h1HiqH56f
         YXGg==
X-Forwarded-Encrypted: i=1; AKwUvBwk7FOOlv9rzBi+DckI62mhhYjIGfHJEgYlqk7Wrdop4UQcID/ghrsiZITR8XathuHmdjSdbviB5Odzpy4=@vger.kernel.org
X-Gm-Message-State: AFuF++mItIxjyyEGW87X8kU4/aao8CS1ubR/uuoVYi8XBtmGUzMETkwx
	D0e8YRrpGe3Ny/VUadYoygD7O/pAfqn1AbuGPcIELP1fLVwERLc3Fb35ab6siGUtXvC4h/5RRhv
	tFhSfcr2EQ+dWSRVqJrRzo3HM2CuGzM/fLizsQp/fMZfxAH1H+dVrQxIAby+JkhL1lT4=
X-Gm-Gg: AYBFou38Fod0dP6i3F+FmJt74oyEsMzCbd5vnYpHEzl4Ei+LusURyYtFjMKrUtdPCJz
	7QILzTnW7gMjJ24214M9ThEXurWSIHTtP4RqM4agpyx0ce0Tzsb2x1rP23VrF+cmAU91ue666Am
	Ik6l6yPvvKuwbB4fVYJIyiUJB+RDitugk+UIjMYpf9BRGoGwVUPZYSH0XIidJVomD27dvNdWWb3
	z1y6EfjAHHCBM3ttzw67ktWHuf2UHFxeLHyHPgdn8HzNbWKs428OfdulLky+CMhz3JEwaqchcMk
	ze+KAIH4Z0KKTsjd2TtSJRu621qdJzUJQM5nb8B3si1QOaLBOg2st3qryqXi7YjMcdW7y4M9M6f
	m5lu59jR7sdsX4gmIAvtIr0O+Dko=
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268673185a.29.1788958349506;
        Wed, 09 Sep 2026 05:52:29 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268627385a.29.1788958344263;
        Wed, 09 Sep 2026 05:52:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa0b9sm768027666b.11.2026.09.09.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:52:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Add pinctrl support for MSM8952
Date: Wed,  9 Sep 2026 14:52:20 +0200
Message-ID: <178895833828.30492.93870770541896598.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
References: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX1C43pSWv2uS3
 UgsuXzRSoyi6cPbg9uUSYe1e0djpHSxya483zcjErcp2nnEesvrU0mcy9pfUP1hw7szLG3JDGAd
 YJKjWa6aKKhtvbCSkq9AL6xJD9ovOYE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfXxKQJ7i962xrV
 ilrS/oCgU4MTWIk8L0qb/rD/uQPck7sMscfKYlYUCRx4UGxZHA0LVqyjDNoNdCSByttkH6ZiHkk
 niOVZg8EoSdzHbiXb0KgnJsZ6fafzOI9Setdy4M4gwBj9wTtssS1qjiX3uutbgJJdf6w9yB+k8W
 JiAUuXNh/DQYq0YROlHIRiHsvJCpOEjrUYch7QwNaNEBQgQ2RnukiKCp2OBhJboxBz6AWHf7WMW
 z6zjh8T4WWZ3kLach9Jh/yWlMwQHsdJeazkZx3lBIokNN1GowvTKyu+uMn6duXMGDjfIATyPOZU
 oDjfMYo5JITe+Yi9CNNhIJOYZUGhyUSLbwKM6pW8PWyHqsf7vh5JD7zS0NOyYV9qd3PmjSnMmlP
 9uZA5OOPMM+N15g6PK0NsgUfq3Xx9MQmyZVG1r5t5V6q7dmLR2UUc85X16X7AwWK6L2op6FJv9g
 LsEmRO8FjicAOCKrkTQ==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa1568e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mPusQoNMmh5jHkL4POYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: DBAqBSo57WQX_1118z-HW2Ei0T_NfgC_
X-Proofpoint-ORIG-GUID: DBAqBSo57WQX_1118z-HW2Ei0T_NfgC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090144


On Mon, 07 Sep 2026 19:05:23 +0300, Muzaffer Kadir wrote:
> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
> has some differences in some of the pins and their functions.
> This driver tested on General Mobile GM 5 Plus.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      https://git.kernel.org/brgl/c/2f006f5c617a56afe7683b607727349e0aea7814
[2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
      https://git.kernel.org/brgl/c/b53a6210af0fe559670e298349968beae2c7448b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
