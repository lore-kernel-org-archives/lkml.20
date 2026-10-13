Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EAE3AE1A0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881032; cv=none; b=MQ0OHu7w1Z2mHVo3JnthtEGUlX2OAsndG8lpGtWH6YavdieNmeNXkKJjjqIYhBX4tdGVlwJF7sX00TTxf4ZCM3jg0nlL0FObXJbtsNHngdjTn66tX5O4e1KdQ5UmPyUC0sbWukAZMEs6fYAzdHxhDN4wjSBizN5wcft9NRT2J+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881032; c=relaxed/simple;
	bh=xI0EXxAnxN5lZg5ZSbyRKx+xLuwEawCjGQzNrAZsmZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNkV+ZKvLQdjb1t6mbCTjCO+jxXyV7QWOAiUQZJJvZLvkdEuuRSIvBgh2oqfKrL6Jzq8YuZIhBUhKY4Sqmt+mqp28aU+A9o+NuZgRBh41ixqznnoU1xjH1svGsuKTmW27KOBVTdA1ruknEDe1ndIXTvUTWwTnf2nPD0OOm+ziXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSQQ5qDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1g+TvDB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSQQ5qDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1g+TvDB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D469r5173800
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yc/i6Ly2rNsxUbSaUmJUhfLI
	QFe9Hx3IIvJnLq1sVTY=; b=KSQQ5qDeYM+REXRYZq2zWSqUMlDxWCzjIgsLjc2M
	I4GfGiuSZncKRlBLxhD9KplDvUaixT17R0KXVh5TBKJr1oDIqWFkqrpk0WSpAad5
	Kh6b9pLquS3QS2bn8T7HWhBWiIQyqlgWXB/Dof/Lk4JZk64yEcDfd1h0XC0XOXbD
	l7S3qJLiQmsoKfsyMHBdro6w48vueE6SAPmaPfF7B00eJQxeJ0iA/qxAn21PqnCv
	ImXkCe4q+bPEhRKHuJsp8hy5owvx+dAAOPR77eUeUmN0RbRPgQRcFkXAcGjUIyap
	1yWwgZQsArp5K31OnqAbG9U+Ic29LY1YqnPhG6Z7CdA28g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqs1up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:43:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso943853285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881029; x=1792485829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yc/i6Ly2rNsxUbSaUmJUhfLIQFe9Hx3IIvJnLq1sVTY=;
        b=L1g+TvDBtGJMMAnlfSVOteU/J7IyxvgKSlYF4100soxKLG2ayJm1fAYQypGDJdc9Oz
         2whQuRmcaXd8/aydy3YvPJozRZUXD4inSohEeLwwh7MskZEk0Krx0wnI3kCyQ0pkgX9n
         TvaByzlndtch3jxYmFs1uljEe7lz2PcuVFJHzJtsZyWHdtcQ9l7PQePjwaucWrAykqWr
         FfZtQUUO/zB0/lL4ccKyK8OE9Vq/Y15FA2yARfqKe/jaUM6B7Tz6/OxNo27VBupLkej0
         0+bn/R0C/AXCv5BryvPY9TmJI7XCBqZCMrrVyhAPjn8TWJXwHXdDLBkmE3AlJk06smTV
         8u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881029; x=1792485829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yc/i6Ly2rNsxUbSaUmJUhfLIQFe9Hx3IIvJnLq1sVTY=;
        b=A4yDDpnVymzzQ3pf8ZewdDLVQrChzh4cKa2svd08SJ2heOJD2BGXTrI1KZp7Y9bTBg
         lxiiaplmy2a1sUGet40Mfo22Lohterh1+rUZDXGqrsVW+ohLnSIIp4OrRknroSTyogtW
         2oMITkLYd6Jp7YW9H6QJNXNMdBQYxdQK4sMNazyGw1APytkqA+zxoJu+BsiUjcs9sMT7
         fet5mRRTwvO2DoUDgAqOu4yB51hhKxKmhJj7HCz6/S4SfyI+AbCJfGbSKh1MX7NGE+fX
         gnQmpWBnWPZwKdOF766eLfidDKm4AD9YJoxbG1VqShQ1lmy6Vi6ztRTTIR/Bq+rrl2bc
         Lf7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTeyoHR0nWjXn13kqvhTDwGD7pWK4UT+QoD1g7sOdQjGgMSTFzuk3dOemXuzYz7wfH7OV/9EJ/tW0bBpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJcJr9MAlceV7dYPfhTYGc7E7NFwOZWLW1KVGnHKbdvP0kx3N8
	oForVRZYSglgpaa+tQFNJqfI2Gsgss/a0z4DhORL6bjLKOJNOVa/Xbeyq+ebFGDx2Wa0YBLZs09
	EJ4YrXUW8Vq+y08AI3lhltjaHTWsqiHA3Foc1dzz2Qs5Tr0YR8baHiRvcqI9wGawqyjE=
X-Gm-Gg: AYBFou2+tHQ5IkXlaUBpIulsiBk41MzLJBjAXjMnhcGyelbsd3deCmOXO12ZQ7wrZI9
	qpURuP3UJ3RJ1hz6JJt/yWAew90jWGF3nE/wO9XYGrpEul6wm4BXsklEevlr6IufkLWPfqLiXxA
	9Q9DpdMD6kSRo+SCxPab4r6tvYXMqMiMReiP3cTqSTUtSGcare4nS4exYpYWKXXMgNHnH5Y8FWx
	FY8VlONUib3HhBKKurBhEy+oRUMYX5OHXvPVUDRsakATPaxudKPbSdbqAME7y682jI3jHeiC2Zi
	Y7wE5U8PJ27x2GlmAt8OXe2Vpp+/QL58eac0VI2AyYX+e+UoRvHkNxxwSX6r4L8e1xXMLTt/Z54
	FSdDYLBPDb+TD0so=
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93ec12d5528mr1199091785a.44.1791881029107;
        Tue, 13 Oct 2026 01:43:49 -0700 (PDT)
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93ec12d5528mr1199088785a.44.1791881028530;
        Tue, 13 Oct 2026 01:43:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de2e2ef2fsm2500383f8f.59.2026.10.13.01.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:43:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:43:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
Message-ID: <hhiwnl2hb2ckzmypy4b2f7wzdmtrpdylx2j3vaoj4w6rvgvgrk@sofvxozmsfbm>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-GUID: hpRQJQ8cWCornsG9mjCmPCvMg3rwmEaX
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdef46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ADyQKbfvbAjpQ-Ovcv4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX6Zu0tu1KlDf7
 84ycxUeMMq3tDATKfJGOvQ8btfHOH5BKVxrbpHA81G6xO6TI295ZoosUlSZulTtTSgy355f6Wqa
 ZkeCtmaGYYptEtyAGArHl8HMo1J2MxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX/Cm3A46RLh8/
 v5xae4StkOFfN8eGTNBh/VDt6ERzhaRJ409yh0duEjRX/gvUXJkXRDg2rsXdSSk0n+p/ZKklM3M
 NNww5NmoF6BtWer2Kd9uv8PbBMrHrffknNFaN0OeSOUTEzI/O494AHRHZ68EpV0Sj5s6u/0JN4l
 9xptEYlqluFr4DxAENRviXPaw8i3qv1GvBxSnmSBQlSP5daaebpq7gUwGBj5Y2I2VuVbNhw6lrM
 xF0OAl2VNBzlmTuiFBMoak6YOMMuSO+nZFkHm8+oVgDQWzPRSi/a9UIL+DOX1c3h5KbNE3xkMj+
 GXDTZ9g0KnfTsueeSNqKZswxJYDrr3VphxxdHqPYMBGp4Ng8smfI/Lq/44Qr0e2FVWolwcDiqmL
 qz9mQ7TYx+IgzNNYRWSMhx6Hjp/0pNxG94Ak9bDeNisdmJONPmw9Kjf17f8je4DD0cYiJ3MrWMK
 wBhG/7fqcQOyxAzCFRA==
X-Proofpoint-ORIG-GUID: hpRQJQ8cWCornsG9mjCmPCvMg3rwmEaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130034

On 26-10-12 19:02:17, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates several DP PHY and QSERDES v8 COM registers relative
> to existing SoCs.  Add Nord-specific defines for the relocated and
> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
> phy-qcom-edp.c so Nord sequences can reference them by name.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
