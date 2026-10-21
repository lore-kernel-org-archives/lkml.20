Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591167;
	b=mRzo9eaHZYo5zdzmID8/8W3OTUHIWfSiIxBWa7CTV3Ab1+/Jd6LSyyec7h7jbWRmg3ps
	 bRYhNJ3jlzgDte1f/xN+UqV838G1E+1TAesUm9PLF48K/IQfet41rgC+4pNRgeHFvHwCi
	 zncSgkjAwrrQWtb/S/EK8nDWOuvErfojWeLFMldg4Cp8EqM/j7AnN0thOGmFAmS+BcZFF
	 Y3cZoz8UeTNzZsAAay7+xym0lia8puWD86zDDHLvqHCe+bYc4siIBi2nvaDatXGFrmUi8
	 UhjYcWDbasBsipSaVZJnyhGYH5j0vNXDsru3AXEukE2VLauxCJJj7TTri3yceIF0mwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
	b=nH10/reR6QQ2BGhynIMU75oT3MOPknMvAIn3fTkMypW/HSaNprjzPgfkmi8alnLtmVHT
	 Mf36N8CUdG4Ra+asK7p9eAYQhaeL/gSgjoxAr04xjLRL35i8/PIvHsuCmL1iatFY/E9aW
	 NMnSMyfbGuOoz4IyB1E8cKRvTUU3fPTAbBeZf1K7HxRm8zhLldqu0Fhtzshg35ztyfMN/
	 T0OSF9dCFybodmYG79tQJ2J5riF7nyFFyP75gNhHmLHpwIzbE5CYLr7GKOKjsPKTQpvfg
	 1FGaGhgOr/+QdDkw2aRoZwkfQPnCQwiMCc5AoaA0pqeILf4WGWG3X6pJCE2VvhJOQTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC55606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEC55606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipwKjsa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xc92wjmO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDHOuX4038116
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=; b=HipwKjsaFTPLlEni
	mKbIfwZBmmxxgZFkWfSwqs72ZheXRop+st7cnpzo6zrP0M6LO70KS2wXXNSzwjsE
	+2y0/aS5l/5pRd0G9R9v6ja9BUidUh1PG7noWIdn4acWUvvnjhKduhbpTawAd5G/
	b+lXPGThKktduR3WAEtE3aSrmOYAnO6sys/xP93f9yeFMpqSkjm+oa8Gm23Q5n1M
	GnNZ552BhxARmlbtitdGmNrSrQWm3DjXS4PPg/jkQRiCDaxSNx4ZNSStPwNz/Ua1
	dOa/597Hgf/xoQGwiGJF8iQ3fA9T08Vhd7E4/Pp5R+4xKyihA/JfmJDU4b5jcRss
	8kzCVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5885nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:59:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso12967985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591165; x=1793195965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=Xc92wjmOZgrL7qjpfUAbZYvpffg8xd3EcpDEbYLHP/pubfyFVFPftTb4r6kiKaC4cI
         CKVSSc12VwbGdfq+s5q++25WcDyWdpfjw9L1u5qS7AlaxBBHRozHm9bEdIsMP15ho3NM
         MOYUldAvdGKfPilzvEzU/CW5qZUEuyNitnd6AJC6woOYaJaUvLyIwNeS7gza0cTEaunD
         qOeVby20lC5ZeprHICPlSYIyygt9slLilxl0oplp61+yGgXLV+33G1sAhj/QjePUYISF
         HG7MOP7+dzcWlScMxr/zi5NmJD0lXYYna9Y/wtjWqRsuImcjNyDLfOoAeGGuaGclnRd0
         XwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591165; x=1793195965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7pESOuNoQ7+2mmCjub8hEr79x+EvIKeMwX6F60/Bkk=;
        b=f+jNz5pT23BJ4LgDhGaT6m+kahZriWXG8bPPZ8LT1izINwAdS1rPAZfQryvEkDThOG
         eL+i+BEDyaNiIWkJ/jhFwaHi1fE3VDDI5PVKbyY5g+hgROFyDfBYu1iiw3v5NuwUsTDD
         dlGZIWUdBpPnoMe/df+pKoKh7n+Enj5tJCFrBnXpqWA7cqDksWbx7VM5BdAdpheLrkC5
         4DqDdojmn+eBzMEYNMp2F4dZfaZwE7/xF0l+uvqYkKzcQv3s6xfstbzq85Yqc/0riEmr
         aAuAcKxUFkpIvNe41putqjjlqVu7uAY0L393PbqA3vvNDxQjsIXmMQybIwlxJDVdCGt5
         81PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu50PDYfQoBM0b3kE4er9lJ/EsgTKO6H091+d7aYMYulqi25SDzHYjR/bmb9yak4FQIudpkGWqW1wJ+KA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKowlFRNZ6NZJ1gLd3vUZNp1yoia25NWGUElnJZOkwnd3aCegnG
	Da3ZkOBKXBSbETJfMkWlXwA3VEpJQUvwG9lMEAFreLmt0ysTOy84wryiGZsqd5SNreGW6U4OSTk
	Dmx1W10axPSuJqWtGCC780rHPMc6ZYTPTVeWACmEkOLkxOQQEteHn474j0p1X72MlXoQ=
X-Gm-Gg: AYBFou2z7H5CshTPdapBCrF3YxEbreJo+ixPcMzUYb8tw/qVh3cO6ic9YU07AGKMcLz
	w0mi8uQ7LkDsdXHrcRdHQ8OK7BDHIL9YDn+Vv3m5ILnR8OrGtj+nQRIrOo4KlOAs5lqZ6v4atCs
	gebf5TPfq9OVl/7VcELvFN7LWRH98nleyrRVahf8Z8094GE8UqsYB/XQCjt5UYQ51qvoz6IUEFQ
	wnGTi6mAnRq/fkR71fMmvMXOqHdCESodB9m6CHLiJpE9vYQ5gP25UAhmS+SiSqKbIcI3Tmt3O5l
	F2tU+tRlklc4r5GhZVSF4cwQnddD4MEfqZvlyn6twTQdUU9Mlziu4ooBQhOHOULEgw4cg1/2hIN
	LnlnkZDnFl7UGghmH7bSw1g==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481260085a.2.1792591164916;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr481255885a.2.1792591164457;
        Wed, 21 Oct 2026 06:59:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403167e3fsm904154a12.34.2026.10.21.06.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:59:23 -0700 (PDT)
Message-ID: <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:59:20 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXxjuw+wgi5X8U
 vcWFNBXs3Fkpx3VY6CHgGfovaIwXsuxHMsScbD5phUHq9P5wRiCXtDzocWtEZWEH+t1ZoVBAEmB
 gd9TUE6bwlttWXWCOb7WcgVqAMoR/J8=
X-Proofpoint-GUID: Emm4kM9wbUFNXnL4mZg2fjlwI3Zc0uOh
X-Proofpoint-ORIG-GUID: Emm4kM9wbUFNXnL4mZg2fjlwI3Zc0uOh
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8c53d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wTWGZ2-w8gThuRR8FIoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXyg7KSoEIbuZq
 uVBRjb3V0ba6CGiAFD9LVnVPEpL1j+uW1kd4elyoZsoX/VyXrqCKDfLUDCrx27ZLvcGLVI/2hLw
 nPBmaQNtxajWa/uqngMQZ7bscMl34E/hzuFc0itTKFjE3rh5PTN8Y8uYXVYxNqRsYQs23ydav6/
 wNXSJAuUcEx7ui2yALWpK9xThbs7wL6T5yOpZ4WKIvAoDWFcYmss+vezMTsIHqet0207kGViVcT
 cHT6Mf/IGXCCbrJYJsFZ1R1crChZ7ECcZMXQtNpAC/WoJGQkAUXtUe2pknrhwOtwROpZry4ebNz
 oPKXxizAPoNexXyYK3aepoyd3IyKBbHKE11jULG/ww5la/HYcE/2a6Pd/7fgkNozaBMRj0LZzww
 ayuIbb5zAPMTqdkZN/uK9aQJlPrzxFnvmFf9PT1PCieY3kV51M1lEava97bNNlC6R2yEm3l7bPw
 mZ31kF4Km/lvGg+hKvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.

[...]

> +			      <0x0 0x09191000 0x0 0x20000>,
> +			      <0x0 0x092dc000 0x0 0x1300>,
> +			      <0x0 0x092f0000 0x0 0x1300>;
> +
> +			reg-names = "csid0",

Please remove the stray \ns between each pair of xxx and
xxx-names

otherwise

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
