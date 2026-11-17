Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896849;
	b=flJfUvcas+romtSVTPBlskJTOMa39ou/eCH+8ToCLGvRF9PQuKga3mFKRyaPF5Px0jXN
	 dTYHQIEIZl+jb2mXcLAAHHNgKC3/Xzhriv92U2I2Gdwd7CvilZZLA+Mri5QpIvOtrBzmt
	 dlOMhMUmzVENKImuj0lRnGPpiJzOmXSzGjqqYNU+fhn/XzVjs7BF8vxP6Kmjih+nobhms
	 mU8oipxFeqAXKQOLuDLOUZ+MLRSultXzoXqBk0Nb54GylPPM5ZAck3WRDbjpdQycSyAzX
	 +ofJAznk2lCXSP0ATV5Im9rTKFSiQiVwlejGQBsdv5jHzHVPQSGCfJOJCzR8FqP/SoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
	b=uYpWDpLRG0QyKN7Gud/WXG1fSpykotccK8+WERux/nJ4GzM5fdzWT3qlWzFxVctodykb
	 ZwH0PwVx9pl/4DB7pcXzAxcw0fqA3Flqkee89kObdI6Nwj2IRtx8rhA6NM+ap+t/wFK5k
	 aglo6u88lMRBEAm1KPhZWk8zeviKN5uidK+WJHPgZn84ZceZeXqJ/1AOyKs4bJ6qZj/UB
	 NGjvtT5fKxHFOY9M8T8Wh5huIzcGVx5plfU/rPWpfMc6cnP4i1h4hSew0ndPExJXFZAMK
	 d4mWFGFZ3qq+1QsOhV7NXBWqUH+w3zPhBVVzreAFPiE+jX8bOdN2Tw3s8OMiIU/v3Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF30606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH654Tm3595427
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kGocrnhODpwc4HBS0K3dbxJ+
	9nBTUl+OfB38M/5zCpk=; b=RttC8X1Wi3rineAEJsXoClK0awK/HZwO3Pd5wbU6
	n+izFuGy/jM1k6iQY6Uv1tUrkcMVmWrjMiX9MLU9MpTSRs68W6MQQmxp5R/+Sp21
	JbKHf6Hx6mqxR0cqsETQyCXNMDiJloBu852Qzg3+wwqsYXexwgqpuvKPvdbAvtR/
	BUT/ws0+ytVtLSaLadBc6ZvDbfITxfX+YxF1xJUro/SEA7dEzhQONrngHzPw+ybu
	yXutTCmkRwsqNbRM6RJj8zbN0uEd/jn6dendsqozFulF7L0h1QrPUvmHzdwzUfa2
	qB7huaRDz4zIZxEy/k+iGZpagm7xGmxCiQOAaXvOXOqsdg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh88r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:27:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so4858064eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794896847; x=1795501647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=MF4Eey6XMU4u0oG/w5RB3nqp9nUvCnHLRCIUhvDmN/XTqzjCHzc9GJZ3HTcLj3e+bt
         QC5abb2z5NMsdpqWCcCCTB4wP1isgaFl6cA1s7wRe20dfQiJWhLOarkpDOLvPoPo8wld
         TYyvApY08gHz7+WtyHoIPM2IO30kQcXelGwCM5ssgBAntR8rIsbk3IPMwX5jL3WQMHkA
         Tuk+mJjYT1h7xRSnHqZEdJzFaSvporelXF2IGAybK1tRN1PrcZVDqvc/aMxCTO4No9MO
         UI0jcrH6yDLM/5NytdNivJ8hIbBjXhjuwUA4+xVIy/JA1fpCF+aUgtdYTyEZJ5Gxvj9G
         RjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896847; x=1795501647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=FzL0P05TxsCF1Ngu1lUIwQupbZh/lwBoMlOqPvhBVuL821Kz/1PrZnfSOvs5U7ASd9
         2YuaTcMEd6i+kUIj+OLpqSmIQYlYBUdwD8h3yH/38OHaeTeUR37qNeUdFhYN1IWBt5sa
         Q4LRcIJKU6fobdLX77mHV4P3/mmnoq76KEaGlwvE+RWTU1M1D9BV4LLPMOkl6p7PADDv
         vjsT+uN6dUQCSsMXuj6+MHg/STaMjOH+h9rFzYY+Gzimf+VbQWk0dZMHx0AZ6fw+ekoz
         XNjdzPbKZnOet8Up63heDBFa9QbEyr63bGRQR2WNuSCJx/alyBTEnHwRZRUmH+ViCTPg
         veHA==
X-Forwarded-Encrypted: i=1; AL+hErEdsPrEXW4Bt9U28sf2MU7Xi1d4YNDdM1JmbW327c3WZwJiyPjVBa0xmvF8y4BlZIpnMd7vyADkW2kGmFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W2GNas4TvrydwmIThLQWLoDu9k7A0JJASvPuQPYsNOlMCZ6Gw
	lLnG3cwy+JZ5oxBEaZGTrdIpYtrF4MA8MyZfMdZRmzunWhIokyeCOBKZLhR8tAMZs6q+YIXa+1x
	1zryb/inNeuoMdoHb4dY+bw2P+WKyBHbr5AvGmi1/vQKDmWv7YR9fkkwE0b3lS/aG638=
X-Gm-Gg: AYBFou3gz7K3Tp6otTSx/IiJJd40/XE1w38pbZs56Lrruapm8vE4PBZVsNq79ee3nKg
	9amGFcgb3XTB1wqTWvBU28vseGAq5ysq5gYgObbDWDSbb+ffLuTqcMK3s8P+OvUAoDpxTXyhDNH
	YYwKmixfEsj2C6jqNudWEkf96e47+y74V0UnK7bqd0+d7UilzJjuu7jHvUVXPpWPCpt+/5zHFLw
	c8dX6SRbWV96DICuchRht+bJOHk1XZE8nWPia5ffzBgOQDqubU5HNRHdfXADFtbOGZQa7lJa4da
	X64WZlV/0K0TjQ3jY51iIj4ECq4/qdj4FXfSWL4ioiExo2tCOWAnsOL6XPZWqh8PCFr1iF2KGsG
	FL/g+nm0pL7C9G7zZmjEVsnYa2BksLIcI04GDcpezYTdhH07oWX9m5+D55ec0o3NV4BddGzPZ/+
	PPQaASr3vUdDMXk0w6pBkPBZ8LxT1z0zluZdDhizx3kbuGslkjZGnlgqunsUEZ0lxurrIPQnSY4
	/+/vAA=
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663836eec.40.1794896846994;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663806eec.40.1794896846413;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381cf17c443sm713717eec.15.2026.11.16.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:27:25 -0800 (PST)
Date: Tue, 17 Nov 2026 11:57:19 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <avvzxzjzzHP3o+4k@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260930-striped-copper-cat-7c4fff@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-striped-copper-cat-7c4fff@quoll>
X-Proofpoint-ORIG-GUID: c9AcmN5IwIRbzkJCmOyYi_fHIzEEiNAw
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afbf3d0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xdh-gZmfb6x7HAvpyVYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: c9AcmN5IwIRbzkJCmOyYi_fHIzEEiNAw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX7FPA9/uiULcy
 ClMSi2uN/tJXyzaabUdALIxf2sQz9hv0nxsD5wfOxcUWIuMrcv2OvnvckVZRw8MJhWjKGt8AH1A
 IjEBDZKbfHy0Ov+51/t6lps6PkS2XaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX7lNtCcEqzfZF
 5Oj8HNkrKdZfwBK2IU601rprXDZTAxZc2cLskpUpVp5yVDMiz9DhnF0hGu6r5dEkYRZICOViQCa
 TxEgi4pt3nEtyamP0oIqekduzY+C4kp/HYb/21S40zymkWjhqaSi8AfLcCiV6Ti4ssxhvkSy16E
 +zl7TB7XALo5WY0IXeBsUPBuj51oLa0jjVVXaaDIo3V8lokIhK2F3+ZQdc5aQXW3MqA9DnC9LV8
 L7RgRW008Saz+0GZplmywsQqm1x4XNlWI9TqNnxxh1cGom/0u1LnCl6IgrqoM/kDaZlUKN9qE0W
 PRRzfQvBKnJ1Ulw8XKuWSJkm4KpiPQbiOhYtjVS1E4bvLWC+trj8IYZYiHkMq65xv7FkYfW7ba1
 84z8kmdNenitbrZ/ZwKZ3mww4u+OmuyxrZdcXoxbkhns3UQiyFtFrPbQgKG2CU/tw1kHdHkQBpA
 2oIjwQrfGK35KpwJJHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

On Wed, Sep 30, 2026 at 11:17:37AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>

Greg,

Can this be picked up for merge?

Thanks
Varada
