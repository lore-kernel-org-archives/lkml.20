Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6953E37FF56
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812180; cv=none; b=obvsYZkPq3HNzcRYnNcRo0DRpUj8wnLUlO87SFR4QU8VYiLt6OSbix2W5ehFEM79MgIevk0QY/8UZLwI0aQCumaHU4jUFRDmbJnmaN+phGDFbvfSALgME4TXB2InQtrEENtBpIjx265FhfVCM0EBXwJ2rKSbdZIfTJihbVlP2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812180; c=relaxed/simple;
	bh=wZLW2XdypAhHvwo+GHAiZC6sjIcx7C3BCwY22tUge+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRuChZFiUq9eXXZSxA4DgL36ipgaS/ufIHpzbIqcqaUtAzr9s+yL84nfack1WxglrvXq0NJT2nwCwm8M7FkyY93DlVugC3y9q1F9wxhjCt85Z+VURPHj94Ttpgf8Uf5q4F2NNZH1Lq4nRIzjAPIa9HiOWqdyLlq0hp2ldcL+68E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWTnGaxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duvHiRoL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWTnGaxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duvHiRoL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxsqS3363786
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX36Oh0ldjKH64bRULghbP9zkZHVCst58P7qBcvJdOc=; b=YWTnGaxXDF7dV0Xz
	fJ5z0RlKpai35YN/BfCDko0TuA8fMf5HQtijMWL+Lh8mhNWnzkF6aJB+y7aw2pCU
	HguhYficpp5M4Ef3UGOfu4z9o0PlpTOAL3RfJuTGMvwOhJf8QWCmSgLF/6aiDiGt
	wjaCvUhAhsN77vShkA77lIDQTuLB0HjPmlHZ2cfdlJ5f6n8q+SkXibBg0er3bTNI
	0hxNbdsENvG/1sIek8XxLio3dVfJHTaq4WxdppLcFiSpbUhaVvOyrZzX9UQ2H4SZ
	Kxl9ow01N54pH3b5BUSaHB05JR0jYf5KtOz/uRTVp50F1XJnKpGjsbfJ7Lz9bl0W
	TzMekw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr8y0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:36:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b8c60c550so13207646d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812178; x=1792416978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mX36Oh0ldjKH64bRULghbP9zkZHVCst58P7qBcvJdOc=;
        b=duvHiRoL+rP5I2Avx1SZciIrprvnOSG2JFJec7v9VdXMI794K2JOF8VqwklvTARbkr
         gatmA7fOmdoc+wqLmdtpTBmjeyz0jL2oYALKKiBviI7NyOg+KWy6ggoU4Kpu6yKIGq6U
         4M9lUUA78eXfAkR1pTorcIQP2kyRqNkaAXe0hwTInJCVf7eA6vsgNcqbcw6d+w6WvF84
         g2qmiP5/tcGXihpLLgwtahh25H2PxDSGfk+npIyKF0XibhO2wcu6FGkbF1qzrCYqN3Df
         3Px9EdZ5eoPtzsYv2JJG42DDR5kTe8Qz0L16qRvE4kt0j7Clpa3Y6seGBfXE0kVD81wr
         V1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812178; x=1792416978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mX36Oh0ldjKH64bRULghbP9zkZHVCst58P7qBcvJdOc=;
        b=bjydxH3EP3RH7aCoyJ2e0IbpAk/xL/cRzVemYQ2YomchkvLA6tFSKkd/ZHp+CYPsB0
         VgAzB7fQfSn1VTZ1LTS7XP2CdgRrBWqxan9UA4cgHEPAT1UHDv0KyRLik0AZtCerljaE
         G/rr1nLYF2fmH16W9KW/EM5pxafgQx0fLzyZonGHKYk07MCC57U+Z7gi4MVa+Nm/mnqr
         7TxrV+kncUb3++HemPEDRxsSK5t8Gv6vydI54iZzOdlNoM7E/IrLjeFwNeLO+f9UQ2ix
         jks9oauGXpUTsX9Vf/rRxj/Dg1uo5vpqJR5mfgO+HepaMS7n5h73LF5GVfpIYUWDM4IS
         vYhA==
X-Forwarded-Encrypted: i=1; AKwUvBwfrJDeaG6j4mQeIC4YOk6niuTQcETv0bhBcOFU6TiUzsF9yVGiP/l1PjlwPrOISTX5Xp493uwvOJv4scc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh4KNzGQbzkFNOnUBBlLJcE3Ouy+FP8TOxOrs1P1TdL6ts1Vok
	4mQkscG/kQrK9o2K5k7oB5ZANqJxXSFETxEz8hBATA/CjJ4d4TBe6KeUt+ebqE4bxgZUV8XmKZ+
	lGAti7J0YJ27axwF91hBGpvsL3HiK0WFpFx4PfUYYIhxTrDPUl/KGwLu5ciJLiY81w8k=
X-Gm-Gg: AYBFou3iK2f5kE6qImNgs8mAPYSbmHdgepzz0a6KNJ61yVAZ+ToRoEpmB3GCu4+8+d5
	0dDxkHKuVpOxZE8f8xcAyTGiHgkkFoEmix9IVbQZFGqmzDIy807r8j/mTlXxURaDS0OME59f9dH
	RASO7V7srMnGNVs/jqn7LF0ZLeT8WH0athl+LvSgY89f4/PTr3qoQ3ciG0porFjCA3lBamB9UJJ
	+4V3E/OGxOmO6DZs/1bRKT9+Hlpuw6bTh10mC+fA90zA/A4Z26gkPCPf8DgArb5furI6C1M4rhx
	XrCxoort6uHKizskeK3R6v9G9/Z/N1XsYSB7VvLFMwfeykJi82mTxARnr9Ai707Ps7OhLpca8N2
	kmc3saARaxscVVcynorM2JQkvwqk=
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr1649957485a.40.1791812177535;
        Mon, 12 Oct 2026 06:36:17 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr1649950785a.40.1791812176979;
        Mon, 12 Oct 2026 06:36:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm121124535e9.2.2026.10.12.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:36:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] power: sequencing: qcom-wcn: power off WLAN at probe
Date: Mon, 12 Oct 2026 15:36:13 +0200
Message-ID: <179181217126.5143.7104145391205542787.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004165124.4277-1-franzelfranzel@gmail.com>
References: <20261004165124.4277-1-franzelfranzel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX2x+juEiKHBC0
 cnQtm1HMU8ooszL12u+RaA7OwWClkc0d0mNiaolz13Z7zVBL7bZrdg2nc60E2dvE0B80ebcXPUy
 nXGhn0Oohhbo7PqkHMSBv/9v6I9Btnl61XD+aTzJ/WrbblPfgOFWK6iMStxnPKLzwmINCkvW0eR
 sR5QFcgmbsxwboufEbF6bE8K0SYrktIs1gCoTMVVlF4WVEo/0V+FVikLOiBrFfEem5BgrVNK8Jb
 xZmeQj9J1wqYcX4uI8Ak7MSusTIVkIGk1BdDR4//F9LVZ8nAQcU/MIz69Ol3XjHYsu4k93nkrPc
 9lrquEL8TtFGGOpSeuFvQOqG0Os4Ww9v8fmWRBcXKRva4o5Lnuv06wyQf9RRP6wvU9YdBAjJnLq
 5esPZU17ni7hmfd+7saQKk4Cq3E1xwEvqp7rvwb7VJ3yXhuJiiaNOZKaFx4ESUa5at53mRtuAbb
 BgToMTepkCdW0hczL8g==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acce252 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R6-RoArAaa4DRIP8ZZgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX17TGYd6K2vDP
 rXDvUI4aOOpEKwxkyM+v+G6h28QGNgSsjPzF3yp+ddSmx97TA7PVuJ26w6XwIx/dJH5PUok7vAx
 oX7brbAf+/xnplZNnf4H+G7JtWjbFQo=
X-Proofpoint-ORIG-GUID: DE5bGIIL2i89SSy4wauSrRjUHMrS15X2
X-Proofpoint-GUID: DE5bGIIL2i89SSy4wauSrRjUHMrS15X2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120054


On Sun, 04 Oct 2026 18:51:24 +0200, François Roux wrote:
> The WLAN enable GPIO is requested with GPIOD_ASIS and then kept at its
> current level, so that a WLAN module left powered on by the firmware is
> not switched off. The FIXME explains why: toggling it would take the
> PCIe link down, and the controller driver could not recover from that.
> 
> That reasoning held while the PCIe link was trained before the
> sequencer probed. Since commit b921aa3f8dec ("PCI/pwrctrl: Switch to
> pwrctrl create, power on/off, destroy APIs"), qcom_pcie_host_init()
> powers the endpoint through pwrctrl before it starts link training, and
> defers until the pwrctrl driver is bound. That driver cannot bind
> before this sequencer has probed. Power-on therefore always comes
> before link training, and keeping the firmware state is now harmful.
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: qcom-wcn: power off WLAN at probe
      https://git.kernel.org/brgl/c/dbd674ccf30f66f5eccf637964a93910df8dbf84

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
