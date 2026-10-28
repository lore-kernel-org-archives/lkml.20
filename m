Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201058;
	b=HAX0TG2FD8Xdazgbdf1E9j1wvWbI/qOyb3IOszBS5fG9ZK8BvImygHZnGXGh5A47eviP
	 JtvlQlib63wGW7Z1cms6Wjz2RJdozCLc1hYDuCK8ZX9GllLrZbrLzXvA9qfeKN8zQ0AMx
	 7STQ1xOmF6M8TVu/v+RoN3PFKj57CrOq+gJFtpm48m4DW+61No2cN2cZfLyzEGBPlOaFw
	 +0OniBMjoOhWxSIX+4ReGFb11rkQ3SxWdl7XkwjPHAFaRhXElGOXJz7tYlqUZq5bMKTFJ
	 L0gb45D3y5wjGraAUbSko+Zjyu8+H3nSCwbTMEGrm9vvvH9MnCvmtjcYGTvZwxdsU3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o+skqlyXi5KXpeKCusnyGNYLBwDyHqAI99UWoGRFSrY=;
	b=viLisHtk61I3oGvHHAL602tGCDK07SlqFxSyGHUsBROn6fCOWx8hWpVHZWt5h8EHeZRE
	 i1XujPzaDC+PDA+woEqbk5pKgduUC9DxSh54a/84LDeP8nfSwP8zthRmF63cURDSbft02
	 PGaB1GMc8LLIqFw4+M4U4itpM2e/dfriAJt5ePI9kwADSQpTQZZ+6YnW159MAQFXutjHN
	 J6ZgI8dqshlomwisozHPhS1pKidc23Ccae/J5TsPh/QcVtHeQEdaAWHcPaw+Zi7w5knzu
	 4Hfj84QlgRcIIvxzCFTZkjrN4ue+e1Pxzh+yBotkiSEJUtFfbEcfNECc842Oq+PrbGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khin68Hf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJgkMfik;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB34606A335
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB34606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khin68Hf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJgkMfik
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA7q61471918
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o+skqlyXi5KXpeKCusnyGNYL
	BwDyHqAI99UWoGRFSrY=; b=khin68Hf4FSigvAPJXoQdZyBQsC5NwXBK2xXMffe
	7Le78ceeacrTdHJ/4mOUdZUtg/yf2p0mLwS+ax77lI+6FKTuEK6ubEbHyvOIArv7
	EoS9XEx9AWiPj296hs3yiJGY4hKOKDjpBrWzJQGf2ufnc8Rm7zdpFPu6z4vhlEF2
	vyZ5MOToHwHDZPLbmhJFSlPBxLSyaPOjStBzHR9tUDuHtxHVexFix4iEHv+Qku3M
	88iNfterTQK2dRTClSZ8359btgLHFpgjSkoyiuXAoWRR1LtqXMdKI4LiseJYpqbg
	zKscRMAxvAQ2X9jAt3OwjaTDZsygHLsD2yGE6dWBFOf1+A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh4w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:24:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6fa0f0so1228428e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201056; x=1793805856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+skqlyXi5KXpeKCusnyGNYLBwDyHqAI99UWoGRFSrY=;
        b=TJgkMfikJIEHw/1JFdGuQNVr7Ae5xVSLAAoKYpF0gTi1QgEelxHmPL2U3ykeOjaCyU
         dpwNdwqDnLRrsAoJVZPYJJJYKCvkeLXsglK5uW6jawCocdDYcfzLPO7rH8invqurdknn
         i2YZNIPEqKELuzWpncepKS7Xx+gJ2LX5K9HUTulLE69cvMCsdcx7bj3cozAqHi0/i0Ee
         Ml+BKu07iauj/EEbrVBtEXBESY/ZLldzEIZmbKwLoxJDNmvuHm6HKFOj8zmTeuQ/A7ts
         4eQRfNkCU7YYRQIM7rRlTD1jeCPXJgxblxTua14NfGL+iQCsjusOq+QxiJ/lR8cN9qXw
         wzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201056; x=1793805856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+skqlyXi5KXpeKCusnyGNYLBwDyHqAI99UWoGRFSrY=;
        b=G0lNbuGf2ad1hscyCBOSmr+qjAOdtffwDIHgxs1D7GIc0Af6E61QGpu+miD5CSDKEz
         wneVBEHKislZwoGRb4yV8yTnckhmLiDSxMwtrZA/Wx5Oosnzis1qab93uJjzho3gsf0r
         p5XE8dCwj6Rl9SRoqUX2catOqth3lKQA2n0n4s1xinIc3bwVplPwfHLQ+fyHa3WChybl
         j7h039Eeml2f1+Do0EIoJaErJx4D1V1VhlmI4md1t6YxsR5EsqGLosxNT5bW8ZiyaGdr
         DCD6+A9O1olTDFMLoV3wo7tiMuMVwckJF0pbOQRLQ/UZASXujOlDVXj3dmbNpJH+dZ2P
         bfsg==
X-Forwarded-Encrypted: i=1; AKwUvBzlffIoSOITLEs0dN1gdNysz9soGhTjlhJ/fDCYW9FAXxv76vb7z+wCMFW20IQohwIRbNhXXW+0RUVbdVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEHhqbEf8kXvxu1X4W5g00A5ktzBHNveMKxYX8cd7eW4PK1Pwj
	Ss6VH6DqZ7nhdaq3cq321bT+lau70tQUwo91vgVDkaQkfRYJF/hytSw2PryFnOOvSYUey940jor
	d5LxZxhX3+mEan4rD1sQT/41pLH5SGM1mKAqLpHQvu6PPALnD158n6Kfl1JWmj6YV8AY=
X-Gm-Gg: AYBFou3mvDXn6pS76uQEIKrGIxMPPt+wIF6kZ0QmaZHJHUmLy4EB8ZDQX0BYFgBAJ/U
	Fu714XVvwYgXKoLctTghIibH9GR77XQYS/hYuH8xGb9n0e7+Wrp0bt1StYGKsO+fcKTqbqHuo/4
	iUS2+7dGWPFDgSt0Hdwmlor3jNiM3qN1IQyaSfglbIDWl+tfzC87oJsPB9xsYb2+fySxLmoLcvu
	k+Kl5HnJouSCemd6hq829MuPAOOy/zcR8ErlnDLM2nfzwcJcBe2e3xYCfIbqKLxWtUOnQsPwUg/
	ndHNNQ/QMMhO1mq696+vW1oct1nt0gM7agZnxAEWqd0wdaJFFEkKqw7QNTrFx6lIygtfQQemrvw
	VvJ5j0mGEuDk4/G7dzQt6sMbH2UqjdMznbAHlyR2yzoGX9EdoFbXayErVJC6KPL2KIw==
X-Received: by 2002:a05:6122:4b08:b0:5ea:c874:6c4 with SMTP id 71dfb90a1353d-5ec4cc46813mr1425391e0c.16.1793201055829;
        Wed, 28 Oct 2026 08:24:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4b08:b0:5ea:c874:6c4 with SMTP id 71dfb90a1353d-5ec4cc46813mr1425340e0c.16.1793201055187;
        Wed, 28 Oct 2026 08:24:15 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34673743f8f.45.2026.10.28.08.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:24:14 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:24:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Message-ID: <fk26762ufbssofc2hpm6skrxk5ox2yie3zusviaimik3ueowkh@2tcgguspvque>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
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
In-Reply-To: <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX35Zmh0lwg8j6
 ZXXvMP6sLWxEWj3NSFXEkXi9njbRDi/IO4ZTj1xJhMgx9X5V+k61u9LB8AGGXa1hgPnF4NcsQao
 AgeSdbDge6CtMGcSTpgCnVvHYjN/lXMfDZDaWhOjX9TTXQBOjW9DiPfuz+mqG42MDQdUdKVs6S3
 /858hZv9nIFvvv7gGoxM8mcGZF1hWTgh5eSNFDc0vk0qydH2U7nKaHjL4C+N6GVtUnmv7DOIanR
 txOYslb+PYd9iRieuDW8tiNO8ZgsvHckLQVMSBYRLLHFJ2Jj6knYU2J8R0E5GvUzfeOGUHCpOpR
 LH6PYnsOmcXpDzoW+skLX07MGP7X4XLn0rBNEsVcpk2K2ZzDwLZyvjJBjvfeLnNTka/L++XX8lG
 Jsa/yL7ad5MZAEJ1s0TZYfGghDbSE+PJVqDQzhPtz6c1AflNPYpoTGLAB3LWF0iYWlCLWzL7WsB
 7CoYnfbmmtoDIA4eEDg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae213a0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_YrMRA3nyeZEwJ_tkEoA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 0RsOxeKE-en3OXkV-Q_8LTGd523JA-WY
X-Proofpoint-GUID: 0RsOxeKE-en3OXkV-Q_8LTGd523JA-WY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0vhEteQ1xMDM
 2TVkO+5jcvqVSvAwH/0BrQ6APYy2uakFuMMQM2nLVNgNRezfS6epj77OaGsurhDUCGZV02w9ban
 6YBMe9pcuvZuqjiZzgZnIUL2gg2v/fk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-13 03:16:46, Qiang Yu wrote:
> The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
> two power supplies independent from the PHY's core and qref rails. Add
> support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
> glymur_qmp_phy_vreg_l list.
> 
> Update both Gen5x4 and Gen4x2 configurations to use the new supply list.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
