Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502168;
	b=ogz7KldWJIG6EkaEkSqIvdAPHayyIqPkMI+DsDkXULU+5hUc4n/H6i+EpRApAPm/eWIW
	 2iag2XnTDysl+Ne09DaSMGt567Puxz+BIirK2n5hCagmnpg+v48XeW39yaemjcpxiseEp
	 fkNZ6lsKcfF0ClVENhMFeBZpOfdq1+9tqAc8U6X67G91BdepGotlT14qagMo39VBORw8o
	 ahcRoMqYsqrTtJOn9+K3BJJZ3aIqtVfSOBn15aECg4Ys7SciALEn6BpGkaxVJZibaUs0R
	 f6rQSkHizMscpd2ikVspVoXAYIh6hPYp/o2gg4ivURq9k0yo5wXmsIoQ3p3qZA9kQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
	b=MA31wAsKG/Jekn9l+m+1PQ1cggx8rkq4aBJoIrDLHd9rErsHgHB/R81IJYkPoWoCQxrC
	 T443LkIdVM7KfbwutOkd4jJ1brsC2IRwTVqIjucr8+bJx9k6b6iaNoZVTxEz5T9nywLBV
	 Ac48sElG1IoF4jLZzZo9K8G2yeT5Lgd36m7v+m3V+iCatMlMyTfbwDnCDFLOT6CVhKUwJ
	 b/96cXqius1MkjroglsR8AwwUnN9SaWGIePzpW634NdKZo0zVm8kbtiQ3oDEAq7MppiGM
	 IFuapcca7tO7fJzBlWYWOlb/ixrWHmucJhxDpqEnHjX6Gh6eDpQKHhttUeJGS7z+5vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vk7tVejQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiVTxlER;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F77606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vk7tVejQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiVTxlER
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACGRRjn1768187
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=; b=Vk7tVejQY2qmJmKT
	u7FPB0+6lQXGCVm+EcQ22A94OwNx4mIXU4h68v6AP9NA1Du9N7hSK2yf6iNUmg6D
	DEGmWtCP2fHVtq9xJ7nrwuhpAsn9jfOsX5Y29Awb2ca+WBFEcNwszL763JYIWgFG
	MaL2EFlsE65ZbpSbfoPMORohiYA5fNJdPMAxXAQOjBs57q883G4Re2z1VUUNJ1Lz
	KPNLuK1shOW07zJLZnOvRnYZRJ3eB2ibp+HgcCC8nmiOGEDPvlQlhyoa5WKzwBD0
	vPnlNEGe9SoYMF3JJoJ/ywCbEB52XLO/sf4kw5c2sPB5b0vFJ68zOcEkLKN/6PIK
	FSub0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ag2x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:49:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so47286eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502166; x=1795106966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
        b=FiVTxlERppxuKxlZJadbQZTeVyaBvEmTrEVB/brQmzT06tOL1Y2R471W9vesVXfynS
         zV1lsS8DNl40GP8+Dqa7EMU3qViMjVWs5p5CcVBx6/tbTZZSVw9awnJqyQdUMbeoWsqO
         dDNzEImK+TSzZuqppb7ZIRyM+OnR2kyry3wyooqOGOIVW0n7DLoM2eXttluxeYgLhyLm
         19ZHQiWelwE9p45jWkoKvF1R3VRxlceNzwDt9u7BAvHk3bTGvL9qtUFKW20FDtAspaDl
         n9g3O1v+3A+NLXa7nFL6BM1CjWaLTCg7kt5h0y4GhFLRcwiauHrH95aBOkxUJR/kunX6
         xRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502166; x=1795106966;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsrS7ZAKV95I17yNbcgQPjCjXYkWTNP9phg2HLAD6MY=;
        b=bUrydBADo3tbxj9dduR/4OeXlbkkkkCMvw8Ofyo52aSY3B9c+/2fZMz7MbjZXr5N6S
         bNkjgoIz4ui3YzKlg1aiBdE7Kg8yYBDfQncHCAv97jF5Ix+lRBiUJqjUcdWbV6Ez2vz9
         /dJ0oma7obyBbxzU3j4+nMmPNr8RVoJkOkzlSkW2ESSv3eNPfLGWFs23aFWIgyVuHM8R
         HQZwJsrTv/QX1hjE7vwzrbhzgjaNf+Q2apHFQNM2nz3IKshGjIHQlE7Z0WS2ZSvl+Q9U
         CHrZgf/SVD3DPdLMylmMId/N+X2oJkEHPvfOJ4DXYXWzvBTZWXgheFDczynjGqIBdeEh
         PjCg==
X-Forwarded-Encrypted: i=1; AL+hErHTTQ9bkmI0PVmt75/Ma4GLm0dHSJzQ/mC4bUfgeFGDRiDo1DDDuyqDBDL7gI0r9F2AZ+sq03+WPGG5rPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A3MWFFVtY5oRw2yAzsu+7QhmVnpCgYTmH/AwLlhhN5PP5gpi1
	hirnHw7h5vs3IkMgSuqw54VlwGVkfr4TV0Vjr24u+xoa1fFB/lwhgY1iz9PYvwujTCB30VHimQL
	vcQAdi+NgWmxMzVKlUZ95X8XOabYyLfS8X5oHEkIpq3jQ1rIDfME0qElROCb1IdtKiNI=
X-Gm-Gg: AYBFou02RXqsOLlYGDMyftIA1tTfMb9NbpnIl8I94MNnpKn4LATinUonNfWjd8EMEj6
	lps5w2jRmnDXU/M7DXaWObDCGtDlydIkCOXv+wGVRvl62j8rmEo2bdfhCQJpvqQzECv6NOxTv74
	NrvbrBTcI7cIlPxN664UrQnO0TkTzRKW2vEvR6HJI1bv/EhVtTQGf5TkgMkSynylsKmqO57qE9g
	61CED1WDpsNWM9K0WtQBl1oQFd7IEDmgiGgYkQcpl+HLvmRWgMGLr/LY2tYq/zhAph9PnRx3+v6
	3B3YFdjwxnlxuC4juF37keeWcLlcZD4ez2nj5npaLSAJ2s62xT2adjgHcNxerVrEXR6jaIElTeB
	z9gd2BdHYWFD7wZUjdmL17kCipjO8hUGArfLwqURU+Z7x5N1DZQUnE4xC0hg+6JAaWcTcLuSeX6
	w45I5KadW59DFGnz8+dXoRjMtpo/c=
X-Received: by 2002:a05:7301:508e:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37686173309mr6512781eec.27.1794502165630;
        Thu, 12 Nov 2026 08:49:25 -0800 (PST)
X-Received: by 2002:a05:7301:508e:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37686173309mr6512748eec.27.1794502164967;
        Thu, 12 Nov 2026 08:49:24 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37924f90f16sm850570eec.7.2026.11.12.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:49:24 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, P Praneesh <quic_ppranees@quicinc.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260313094852.3716715-1-arnd@kernel.org>
References: <20260313094852.3716715-1-arnd@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
Message-Id: <179450216411.3069467.7160661678626083545.b4-ty@b4>
Date: Thu, 12 Nov 2026 08:49:24 -0800
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
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX4WtQBAMv5BMM
 UKkIH3V8EhtxNr+5Obh46hlNQj9+hz1Q166Z9j76+yf4nLcyTbpvtgzMarc9PwqMJAAZPcLYW/u
 6VM2k/UR+mUBo0KEQWCHSpkHrCMROPo=
X-Proofpoint-GUID: LKzSzIVJD1ihL7FWVl-j8SKCoIlic9g2
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af5ee16 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=R66U1AtMWxEI_q0A12oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfXyEgzOdK++HQk
 N96AjBZ/jUjXFJZt8zzPwG9LJikxAS1UAZ4k7H0QTUHcEYyvPJRNxBn/eBMRK1WZeMdmj9kFXtU
 2I3xrZ2I7MmnSY8d37o8Yf4vFY5KrGQQ9Pig5YdEI7pQY1/Z2FEspVYjYMxRV4bCVTNlSVAnBpK
 M+tZkxTizFIZItOG1wKyydESnZ9JRGlNPetxYLLtQWmJ5HpfaMfFIzTDxXfDxTxDyq/mnh2Cg4b
 W11aXQW4um9uhIahNHrOQgxm1e1RNhtU2A57eby0YGekx6dUWgwx8+oiQZgte46R74VGh457kwM
 brjDmv/kg54CiMWb8t7NfuzETWlHt35o0gzGx6lUHDtPdP+Glx/3WGV+7OVwJcOjka75rAkbwj9
 p7w/rLeMvQz8w5bo7qSj5KvdjbldMdvA2vLQhlRqthlJdbC/ZhFmFrojdoGmBSVfLL+YaRgnt0n
 Wc7z5qYe5CvPQNS11Nw==
X-Proofpoint-ORIG-GUID: LKzSzIVJD1ihL7FWVl-j8SKCoIlic9g2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066


On Fri, 13 Mar 2026 10:48:43 +0100, Arnd Bergmann wrote:
> The AHB driver depends on the remoteproc interface, which could
> be in a loadable module when ath12k itself is built-in:
> 
> arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_probe':
> ahb.c:(.text+0xb2c): undefined reference to `qcom_register_ssr_notifier'
> arm-linux-gnueabi-ld: ahb.c:(.text+0x1000): undefined reference to `qcom_unregister_ssr_notifier'
> arm-linux-gnueabi-ld: drivers/net/wireless/ath/ath12k/ahb.o: in function `ath12k_ahb_remove':
> ahb.c:(.text+0x1146): undefined reference to `qcom_unregister_ssr_notifier'
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix QCOM_RPROC_COMMON dependency
      commit: f8534946346ef1d5a9899b933013d7438d6a0dc8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

