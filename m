Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F63845AC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768170; cv=none; b=Xe0p+Xm6dDAUOlg+RGsXBgYFwuVJVMZsBwJI8quX5+v7KUonMdoDXu2ZrUx9YgE0EEZVdAyO28FjBz+QRecHuwE3vWm+yHn4w3GxOlEDS4Dht04aO0dXWu+0DNQGcvNPtfpzOYMfmpswO+YS5l/Xav8dOb2C+xhkvu5afQpDoq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768170; c=relaxed/simple;
	bh=Dzxyn31K18wMcByR8vcSiO2kisz9KWfmZLWAn2OFRO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfEXSy3UBDuWXf+yzoaB+L4D3aQGhi8CDyNr1/q4UriInpRqiofvCLJ6OBrHGDO29A/ljfC4Y0xXbH8BylwFCSFWN8S5AVpujHg9z6/ZJG2aPCC0df2AD38TfqsFrNKPpgsN0kwjuMtzz6dJL6IvPbhJ1Ugj0eYMGe7/5oujBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx8mTu15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO0nx8zR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx8mTu15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO0nx8zR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Plp3352558
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=; b=Xx8mTu15gUC2hCdS
	d8UrURUu3w9OYN90GrAGEB3UeSXz1oXSIoTqPURho5FVVCp7fhdH6kegs4uF07Au
	TaSxQW/YcLG4LBSTgwq40i5NIrI+krYDB1HVaeTdCbtAyl8q35L4OKa8ooqdM3Xj
	IFVaPOOCsL55IGjSlRvagHxiOCwgUfrXVNjDNB0dXORy33ALxUJcmG8st+luNBAa
	0ZkpG24B6cnHE2GoRRhtA7l3Ogub7z57KC76mC2lt2mXs4I7sjM7x2DsjLSnNihT
	xTXeh5UrjnMIduE7s1IU0ipXA72rr4kKj1IHHYMDC7HBeNOjc92yWoFEKAT0N74b
	/7xBwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gpu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:02:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5193691cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768162; x=1789372962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=NO0nx8zRK64am93qscSzzkrkDIA3fGzUfxAAHXbjEaWxlLZeKQ0DyNYIVr05zJXuQz
         n35mcLtn58gmMrqZufiD+KhikrlqWCbTLMv59QQ4BmSWn6lc/n8XoiYherMcdFIBYc54
         JNuUHtHkEfKxEwuZwq6BYOZDDMqjBByk4zjx7OEE09pe50lv0KHMMrsq6BsPSRztyrHL
         ma8uL7g2EkHIyaRPiDGWOUwLskkrjibTJJnid2s79b/LpRgYERsrMm8nN2yklMHc/rb+
         Yaf1sGwUPEJ+UgnGdNBfrxNsUqHS6s9LKAMl1qEdRtmFjyDIW8LgE6Qq5LkCyrzlkNYm
         E/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768162; x=1789372962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etZ+qg+qB0GuF9OT1fMZINJd7O6DGD/wUtAisFXtEp8=;
        b=Kr7JlrcquRWN8uym/vqvY5sQHb9rOTu83pIhNRrykNQFPpmimXWa23RnLtsMAm5A/E
         r0IG83tCiBbDCLqPv3F3gLJuPbfKPPNQc6oRrsGUG5ySQE8UjqL4MP22AnJsO0o364PD
         BPZA5StZ9ZzmCuTVifoAvp3kU2GMeD4rF0mk5w2QM4puxwPv0Au668Fgox2tzdG9iVg2
         au+SDCyXv6AIb0Rebn5ZYzSU5ZlbuscQRrEvfPQlq2mTRcY/KXdFohqdDTrvyzPv5wgh
         mBWAUMUkeQuXOm37ILj1tEqfpWNXj4wvpp9ej5Po6H/P4uRVFBxH1xE3LFzWJd5tXMMn
         zSgw==
X-Forwarded-Encrypted: i=1; AKwUvBx0EdEw1m2bwYlUlWEG4zk6VWZBMILp2fdrHTupFr7vxHx6aMjFMOpTMwOC53izJx6kfmSFfYtCUGNiGM4=@vger.kernel.org
X-Gm-Message-State: AFuF++nDFdEa3aEtTXPpJjUGohLT2gy3UgByc5r1l9KcrDNEqfTTNSkW
	LAKpnwSooGBnCRFo9Na0RgNqs5apHVCnC9KhytZY20wmwaCzZf93gdTFDWuhYvoabgaKVmQyTlE
	Mp7WsS6PULI/a+8Slwm/qrbnwk8zJJzI5oIcniHbr7yAyvJW5Pl00yLbdLinUplUNvhc=
X-Gm-Gg: AYBFou3VMcJCafWTQdn6sKnjK94CU2zTS3iWjXULdATPzNMLsJvNSQ513qJBRSE/qjr
	chYtZw+hnhdFPpFXTuV8IQx1/jiNP9tPzjwRTrXobVZCYyWl3Np6fc17d2FGAnlX0WK6CzlZOdW
	la2014H5XX3KuS71EfN6P50+bFMCT+JjiRs8R/IWn2qi7pD3zt5mmxMgSk/MROTZ1YWMVyVb/Ep
	iaAqYd4lIHrLpbzrCqNhWp9M9z8h3S7sYHifLDPrx32wHL3bDGOkcbDiTnOnFPrjERAcrPWdQSZ
	eZb9Mdgq0Qc4uRXw8fA+cBjva88zaAnAgUlCJ/UeXOZdKo/+kmTjuB5l2xswCZs0xuYwv10hTOb
	sI/EaqcO6VTFQvgQ9E5f0uQ==
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84190085a.6.1788768162210;
        Mon, 07 Sep 2026 01:02:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr84185485a.6.1788768161652;
        Mon, 07 Sep 2026 01:02:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm433050766b.23.2026.09.07.01.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:02:40 -0700 (PDT)
Message-ID: <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e6fa7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7NOcbVF-i3gUCoNk4r0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: nvi7_HK2b1gELI7gzEEEmtKfyIfsaWae
X-Proofpoint-ORIG-GUID: nvi7_HK2b1gELI7gzEEEmtKfyIfsaWae
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX+pVRzC5bj/lS
 H1I6NU0CMUCfbXXCNJ6gTK+Q9Baex7ycmeu22+9vDoYJdu5/pzd7Ul1kcu4cJNWLvVMJI3eiiUx
 3DZKHRNTlR8JDIMr5wMGz2KwLB9iY80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX2e/jnsHmlW9f
 S+nCF6Iknytc7EUjE7hv+5yJD3rwUBUNeAFpsZAkF38XmIoeDAAYfsoc2uIdpF7+h0ZYVtbsbY0
 Nj3Q67E8gUGs3dsBFQCVD69oY3gMTF+n4qS1+kAWmBSJ8YbLD52esWpY+TZceVTxDzZ8+mCH3tK
 n1WQ+Fxgoj994buKX0qgD65plwtRL1bc0TSzbht4Wg78cJCn9kuxFyUGmdvVlCazxr3YkGY6NmN
 iAsyiaChqwRvOOb2rWo72JlJ+4I3WryK7nucibhN211ZvrlebxGtgX//YNloQxp/vNEGXqiJKqF
 6PZeO7wx4FMmygqjQcpswqHE4b74UUG3oKUSlbkT7KHGcfoPM+yJgs0krHxEHO7Q2KDR6AsR953
 SbU6MKoL2oPMOLoqZfpHvhJXDSmoXGY1TpdHXCOIrH4curAaj6TCIBrBKBdfmTmFY65e1HqrULu
 p1VeQNKA+KGcZ0Py5jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070086

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
> during clk registration.
> 
> This ensures the RCGs are connected to a valid running source clk before
> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
> sequence.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Is the no_init_park variant an actual problem here? When reading back
_CFG, is the parent preset to the UFS clock (which isn't running)?

Konrad
