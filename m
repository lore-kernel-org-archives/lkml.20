Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237134;
	b=g0G81smBYIkyCrVWgwXDXCVx2UAe40snf7ATSjEGQJZT2RmLkyScaVFtzcfjzAn+G49f
	 sK6fyiUvCKMDtgIgpFmNSKq0c3hLuhqJlkjSGE8I4jjo0lOC1WzXMsSp2k/y32IFKV5Rl
	 fVJetVHtQfQOZdZRHf9OB0Jgodyh0Q0E6EJkugI53IHdX3f7RiPCeBPTbOH3NMKdnDibK
	 NRfZLjjDeK5fQ11X77UVp4hLeKX96bxintZKq33e4VL9q1Nm4C4Rty4Aqr+MpL4gI3yxq
	 WHZ1lsJav7ncAcwj/1KLqhOS1c4CLmdPnY2xelQetKsNuCUgWQ5PK3YuIYg1eFoq35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
	b=r0pJUexYj4QqvbsmG4jN6jqt28pSy3EAJCcomGCy5REqUn5nqwX+K967AlN+SDcYeYXW
	 F9h1y05O2eCctyY5ZGFamYPE904C2iQpVYJqc3KINxm94eJm44EsWctDRfl68RLeB3JdM
	 /lxmo2jwWRDXzb/v1HpbXSwe3slm1FZxdpRxLf2koBXfjW317rjHc4lt+Z496pgfILbs3
	 +0BAGuD6du3Q0dfnpr8UT7k8Wxmw1Pe3FHAgen5x2VQJnVhhXhnV6BTDOQwhAG3xz5JC/
	 M1SAAMdiqO4g4FEBOVTfvdxQKM/2qC0NN/26MX7sLgqgedEM/ItO1jFLfmlGBCrCdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUYYhGsP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F738606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F738606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUYYhGsP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFB6E022881
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=; b=JVHA+WmS28WTu51A
	alo4QMvr0WoiXI1XjKsBEXyVuK1q94o60sR1tEhkiY2tviOamIxSXbW2e4SvWI0B
	FTkucu81+2EXGVGJ5suaNaLkGLtqVzxKWtq5ruWvOOwNBDZI8/88FOsPRUA5JBHv
	JACpPjvZIITH3FJcqZnm9Bm/J0R+cyiE6IYGLJFK8oO7l309Hp1OjCX0HhYMm7Po
	btMjZ1ALCHvtYmQq86wiBt9nEtv5ydZzL5OQA1dARTOb2/BpGIxuc2TxWsSA0U8s
	SRIa4+tiSHSiIPRLKDBLsxrgw25FmtzCpVrDJlCpin4RqaRpkTqQZu+KTy5h/1ec
	MSZ0kw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgvqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:12:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc781089b9so17128137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237132; x=1794841932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=WUYYhGsPiA/ayVa+my4xpBcBT9NANsS1eISAtEueGkqTfcjCrTD8rmcAZfa+h48tbK
         p/wUYPkbYxzWr6VDd49f05ohvvWg1ZNjD9cP1RgSsuT7xCpJZIUHgsdim4MfS8Fu60sD
         GkfNO77FmzLrkjdbUhjsllFjsIC/goZV0UM5ML/HoP/UHeD5vHLJ7fWeNTj03CUwK082
         ZIlQKx6+OXVMo1RJcJP01fE66S9iroo8AXF4WrGhxpqHuNkiIDzmutVi8Cv7y0oBcXk7
         EL0mOsmk2bJsVR5RLbAnCcTM8L71lTeLNXIymIT5mxUthh42EUKtSBsZ6+N4qAcNWtkp
         XVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237132; x=1794841932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=tSHD/4XdYF7ZHL82kcL4xgDAy7fj7ol+NPD9fyLWTwf3hnNQLcaYRe0gFLN4XN0rHm
         t1QS8oPElliqKUjC5X8PXWRJUCmFQXJxOB2Y0d2zf8i/1qGFTot/w0lBS+VxAXyovW9l
         gB+OFRpXXxGEPvPy2K2DLf3/szHi+hPTzox/AuqJkY7nezi5b53XGQWXAq93QKwEZiUL
         F5nnCD1eyuHRWOIPl2Wx27RoUuvFajcuMfmZAvXsX/pnaDQ/DHn83idBJM5YCrVyn8BB
         Jz2Soo0jNe4+E0VFymPOqVTD+7eJmw94RbhdHxFiH/y6WnA1n9YpNUiBj5NedYvB6E+g
         HU/Q==
X-Forwarded-Encrypted: i=1; AL+hErFu79RkbonDvQsT3sqYB2KJiW5Oh1yvkXVcEoJmr89+uSwi9qamxfrgGbuM5otekHkaEguBGtzqbfLlZpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yRw9M/C2fIAscVhx24ELRGVIZxZ6pdu8mPeLUj8hGJ7SbXlEm
	3Fm4YukwCbwFkkhkk7I93SU87SDKy+5AI2N4d3jhjSz18jUmRM/rHgmlJ2ISb8XPNOR2E+ngemP
	AMhFq3+DzcnsnhR+I6w+d50MWRKlbkSluKWyiZxS82KF3385uEKs3vADi4FWKHv5lzss=
X-Gm-Gg: AYBFou3y0XBXfDJ/9SAhFWlg3MK5zSC53k2RJoBlC+VFrfF4YQHazSR1m7OeYcQeraC
	eM5Mn3iVpZ4faXlSc2zv4CKWMjUhUgjriniuSCJQjQiB5mK5TT0KTDbNezZfMTd/XkG7TO7ALDa
	uwL67rYVXfYzmaQHalQAGH57+jf44LhsMh1elBc7tQxDe/HHEsnjHn/RYxFrTEXl2yLHK78wXrs
	f77SuBZ1w516PK/HfgsJAy6nxEdwHpkryJskxu+/n4o7bVKRFJrIEt2NK+jGUlqc3jJQpEKC4Ww
	D3KXTB5FPhXd73cAci8sDkPpULJ3aadunQKgwhDPP45RgBq+whb1ANIgOs5pCZwHD+cXWIGN/5K
	fdmckPIWuSZQygTwJD9A4zLi15JdH22+P3KnGSWXfVcONB0vMFZHZog6m4cWO66l7Ts1Edg==
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229121137.0.1794237132515;
        Mon, 09 Nov 2026 07:12:12 -0800 (PST)
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229073137.0.1794237131982;
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1765456a12.26.2026.11.09.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Message-ID: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:12:05 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXxKIX9pc+K4o4
 2kjpk+gtpm9QL3IK1CsRsSaew/N8kt+oR5lvM3rHisatJ/hxTXHC7wo1KeXDU0FUpQXQhyqGlWC
 CzrK/RlVUU0hpuzbBc4JGCYv/yKHZKI=
X-Proofpoint-GUID: BilvbZ4wbNhLxBh3uwq4jy6C_z8PVCg2
X-Proofpoint-ORIG-GUID: BilvbZ4wbNhLxBh3uwq4jy6C_z8PVCg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXw4sBA8yP0JPz
 8imEOCvGwcNvwBWgbbQ0KA3Yu02D9LLfq7tB1W1zL6OzNsog24pSvuFUtDsLB45OMWvtzUfzXV6
 SQCQR4/Kv+tl0Qi+z7LkUjULRCUSSmx/8WWL0G0/JR0Z+j+BaXM6EPZP7co/mFzHl5H8Td7FVZ0
 2rbDX9qNO3gJwZf1VFvt9fZUOMAeq7HczUrxyOEds/eqsUOdXU+KistSxgUgAw5NxYRjjD49j2E
 eXJ+PFSxd7VC9bVCNAbWX3rGaI9pHA1KcWZCkg3A23Vlzg8DG0ohMAJWzB6gJWSycQNrr2WdgkS
 u9qyEpjYkXHBdwURlMo2urbMbCsiXsZ34YVTXAwl2AqPScLIHs919+ewQxOwEMtezw5ffWH49Uw
 vqpvr92ZvQ6JPLhgxZEmQPhT6U2LelWEZm8EfgIdJxN96Uf/Qmue5+wefYPwtEdOrHRNxN4ltl5
 /SVhexpWSqNHOAhxtXQ==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1e2cd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=Xzw-RmQiYhs1fFvV6_MA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090060

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]


> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;

Is there no superspeed / dp altmode in hardware?

Konrad
