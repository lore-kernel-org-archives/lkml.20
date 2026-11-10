Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306575;
	b=qX1defNy1kLNOZ5vkB8hsDl9+5Dmyentu0PbTh0JGgABCS+Ovr31BbI3PRGhOH5CXjVt
	 qxcP4lupbV8iT1kSkEd/+IHdSsxoI0VeL0uiBLsVUdzBZETEfXMyop7WRk2C5YDIV9ZoF
	 StgtnZrG4L3lYO3Mog/0lALhqbdLTFUf2PMuvXt3mNTBwEKw3icuG3DAYEatFoXnCdyjk
	 kFCZFg3jfM2QanqPx4zV3S2M3P8a7hJSnR7mLUw6FIWhFk3Ok6NNWFDFbHAColte5X0Kr
	 q7ty8/R5jcRueQFkc/a4qPGM1dgUnAf4h2jGG0Udwl4IhXp0QeQjjqIJzDozxA1nWvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dILZ68T7wp/M0o8943hftgoIWcEo2YDH5FXujf4WAwU=;
	b=DGQvTjlMIujxnIkEODkU6kytQTg4RQ03Cc/WwtN8g15o7S7kTvdFSpEks4CLVCax2bxj
	 2p/N7Smn2o/PV+AfCU5UlONq0zoWu57Jn4E4KBJKeNgwpX0VmroTYI48x3iqMehEDKkGP
	 P7HfITeR+0scVTbj+cd7bcCLECdacXcH9vSs/5kyQOO+L4R/h/VPVbxBVzBdTS8jtfitN
	 FBwgkc0yt/tldvMLjzZ/J4nJ12ZkfBhE9YnF1pLbWXhPw74EGNREnVXSyNONYXKIdDpaI
	 ibdgC8EQWkNFuCFRWFxSZafdHRTWsq2D6VAu2abUCgUUI1DifPUArOuKKPRpPzKlUSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bDueU7W/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+g24FZT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F5606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDueU7W/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+g24FZT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8Z4IC3849681
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dILZ68T7wp/M0o8943hftgoIWcEo2YDH5FXujf4WAwU=; b=bDueU7W/JI6jwGLN
	ZOUmqB+utVWSdOUpxhz9dOE3rK7LMcX0hOIEsmN0ZZZWhHKqmBxzZZ1CNU0ltor2
	vcu9GQTbEZJXv2h2tm74wzdPrljskM2MecQnyWLKeuL1EwCbhGGp4uUaoMcKfGl0
	sP5eUDR0NNLvJa/VcMgd1RZShikqgwMRIPVjlp/eVFjf84uCnBBvnsnRfcEZ8Zbf
	22rX++tHWmyxU6PShVpwBGow3UggUQycXO5/DZxE7XAJ4fkhwGyS3uEmsDDLIGHj
	wViyKL1KC7+D+ViUb2MMKaiuGSsVyH8/STmrt4Y8EHYR3eriLYQJOq94hZOmNxUD
	oAM5GA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgdd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:29:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so21534785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794306573; x=1794911373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dILZ68T7wp/M0o8943hftgoIWcEo2YDH5FXujf4WAwU=;
        b=Q+g24FZTmOYxIIE47+dlBYfIyC0J5BCPWmjo73l8rbJxOD+f9TRASBGPbq0Sy3YLxa
         dSVKMjaxmsF3+u94NHxhTA2ze2gbJaAgytsQfyMJYJKKobVJPP+hNt1jXw1zFxteqXOJ
         NWWgRPMO4EGXkPqkyQTTn/r4q/E+1qvEeecglRgGCQZWq3yhjfkJnnieYCdwBo2/JxoY
         FX5bezTlau+Y2qAEM/19Nw/wuTi1WkAfSIiPEwJegvOnVfdYJfXgphJiOFiOU6/xw7hI
         c1LIuP7EXx4VoDXg183hXpEnW6H8N2ce4eOk9LVRJCubz6FDjcPiljG3ibwUGwF0RbFo
         puRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306573; x=1794911373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dILZ68T7wp/M0o8943hftgoIWcEo2YDH5FXujf4WAwU=;
        b=cuJVQIhXfGg8sCzUpcQRqDnO9qO7eMLTPB//nr85dZ5DsnEugsHZ2vRjp9MHt/bD4a
         TXeWYLutr82y/Gx9XST4OA/iMTwT4umODELZquMpZLBEHzx2SYw/8I2K91NHo0edNf0i
         Bq03D9JalQLM1VjJ9+gz8Q/7xyZalUA5z+wrtxao0WJ5fEksKVzSOrJ9nXv4FXIbVGUY
         FZGhgZzpXPKecfnpoVMwD3H7EwYn5aaTumk9P7E660m+KP/Tzi/49wbi3ZfSbAt7f16J
         BSs/Gu0MuCmnhxR0wpseTA7qb8+Q6R0qQSKqJcwrBskOvITQ/W/zaGNSrdW/x1a7dwO5
         bImA==
X-Forwarded-Encrypted: i=1; AL+hErFgUXwhFC6o5NU4QfxbCuQU60CynLuokKI9Y8EsiOP7nKFN3YIjkAkeKiETELZExKFZjYf7M5tBCqIMOgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iiui9U1AL/81HUDXNnr4eiPKOMNSsOVOrIFr6n3MxuNkkFAIL
	HYE5jZwAC/8vZ7jgqE7RBGCgJdqptEZBuAkW9xzp4sEMQgIB/QUtk5PluaX6Ibbza8JZUCepzwN
	pai2HOd+WTAxIFLCg03KPojxoMqimljsE4yqTC8Eyu6G9whZ8IcgrTkiaAHu4sczq9SE=
X-Gm-Gg: AYBFou31+waYR0tcPgsuTAqUX3pHr+RuOkqHZGd+8hg21oZp7Hn4kk0zhQwaBbMSeQt
	t80LfgMUho7PfElgqAva4lnOPzOMxCOY7H3ZNpReAFjUeqFSKd1jSxNqkqPGTphldaKzZrQ2RCr
	ISQYhJh/DsZHQhiagC7uMXrEgQV//h7OHahffts/0mcLsUVwkyv7nke+cmfwqzzZkMSs9UpJvXF
	7KYDmpEBrrRHYbrnqi/Cc7ZaJvgERZgLayM0AqHly7PDG8qQ6nXsQ9usoxVoDCB3XlsVaoBKrrk
	I2syjDUyVW6kPFPaEKe35AmRwCQW95PqddA+/e9vTRYPRlrsgBMky7krx6DKWLTnxKKBfUCZ1E0
	zhhEC3dF5wS+j6G4abi7ueomwmT3H5Xv9nFznERmydI6JCxusifeREon1k2TSN4J9soiJfMRR3s
	Qfm/SHYq2PkINN3REOLG0jvgJH62oES4EQyEUbPrlMoj1DgiRx8OiiLiaYB14N5Q==
X-Received: by 2002:a05:620a:4514:b0:93f:211b:a7a with SMTP id af79cd13be357-9479f2c42b0mr351213585a.29.1794306572774;
        Tue, 10 Nov 2026 02:29:32 -0800 (PST)
X-Received: by 2002:a05:620a:4514:b0:93f:211b:a7a with SMTP id af79cd13be357-9479f2c42b0mr351210785a.29.1794306572282;
        Tue, 10 Nov 2026 02:29:32 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm54994175e9.2.2026.11.10.02.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:29:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] power: sequencing: fix serdev controller reference leak
Date: Tue, 10 Nov 2026 11:29:29 +0100
Message-ID: <179430656698.56244.5559839363678053917.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-pwrseq-pcie-m2-serdev-ref-leak-v1-1-e2e022ca17ec@oss.qualcomm.com>
References: <20261105-pwrseq-pcie-m2-serdev-ref-leak-v1-1-e2e022ca17ec@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iqWQcx3_Dn767jlmZw7IK7ouejGWsd5-
X-Proofpoint-ORIG-GUID: iqWQcx3_Dn767jlmZw7IK7ouejGWsd5-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MSBTYWx0ZWRfX16NW4bq16h31
 9CdGwY3yjU8ILIPpVr7sgKesqTUgrRk7q2wwnybReYlsHdRR0iD/82+6TQhJbIfZtVfqN3lv8Xr
 fEjP3Ordh/7fiXdP4ZC0c7VYvBDm+Bg=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af2f20d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=heQ8kAePCfxZzHD31_sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MSBTYWx0ZWRfX2841HfQ6esg/
 NrC7E5b+ih0E8DI18NgAhp9sxtTTGY9bvBw21qksKPH/xiy5SIlhHLEXdASdySTbnHHBRHBmP2p
 nYN/2ohAf0Og0/33I7cdYIknstmLC7rXrAQKVejGeNPyMUfUwsVdSG/33Zfb9i7kCxlVZc+Aoin
 F31EyW6cBRIivAHp364SO4M2QZechqA3SCUFDQLOSGSPo4ul2KrGLWAyrMklnRLS7eS4vZrn4l5
 UfsDgP9e2S9fT+xQO1QyBjOe/iMxX/suTF4mru22rIc5f98lK05Ho9x4mkLsZQdCB/qZSyh2Py1
 no5rdXuQvOU/0QZrxGWT1a48H5DK3ZtHOyWi3p2jDu8rC9QMIzjBMO0lZOUxCcaDPSyaIEiWrzZ
 nTlf+ssBfG6MblDJsKfpGdKEvEzAURXxYmwtHdwyRfKbH7+HVKIPA7X+3E9P9+SiqZBVQqM8HAx
 5xjfOZLN930IFHkk6Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100041


On Thu, 05 Nov 2026 16:46:45 +0100, Bartosz Golaszewski wrote:
> In pwrseq_pcie_m2_create_serdev_one(), if serdev_ctrl->serdev is NULL but
> pdev is already tracked in ctx->pci_devices, we return early from the
> loop and skip the serdev_controller_put(), leaking the reference.
> 
> Initialize ret to 0 and jump directly to the label that ensures the
> reference is released.
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: fix serdev controller reference leak
      https://git.kernel.org/brgl/c/073f01043e79fd76f4fa648e58061c80329a6eef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
