Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562339;
	b=UJ0SKhbBgbepkFaRxcC5JFku4WV376TUI0hsByUid/fviv0tuocW04bgGqaWPzolztmn
	 rLDNTOV/odGOpDVnMZ+rS3Mo/onU2JM4UNCjBvxytyu3jajT3NzLarzyjK/f4PMGXirMz
	 dwtNatEvNKvGUhSg0DgTgx8sXZXdqbyeZTHjwBoNOsaB4A9qley6yiPSmmqAiMs0p2bQy
	 jWjMKRw6Jw8c5G3N0djvIXL2ELHFekpwwWNG1Ea1MeANMSRLFc1m46YKcKEklaNC4OPCU
	 NByh/zSPjjJCNXvlMZF+buw2SLuBFQKNM0fsr7WjA5uOffKz614VBw85bEsADwizymQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
	b=OF1IA21KIEy/hYy4A0/bp5tJ2tDPtwO3SYVQOEojxKlZo4TxbHUcwgSwQtXCJU7rqGhN
	 uW7vKM771SS1TxE+TkTBVW1vo7pbjBt0qJUJ+6WUt0qgr+lmzOY0HFcYCLwSBum/ZkWVf
	 2THWnXdLkGqNXNR15dQFROsZzaVisZM1ksttvbZHXwrXjQrsANU98+w7jithJHTa8HFp1
	 MgW+s9uondclpQzHupSlCAoEVsxFCTzIQ6yEtqcGNMb+CyAsARWy8vHswrnuPRU1mESpt
	 0M2ub/o8SzydBHBPuaTMO6yPamtUTVUuHgqD72MwaoSLJBmmmbwG59CH5PVhEjIEeCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQiQkx0o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nv6dX7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54489606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54489606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQiQkx0o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nv6dX7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQYJq479441
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 19:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ne363uRV0Uu
	5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=; b=cQiQkx0oLy4c8tJpcRr7aL83KMi
	54VJie5sxkKiyuF3D7lI/6ZF3y4bN5rZOJkkyt5ILvhlHyeXjwBsRaETywSfFD8C
	oQuqFb+0yOpdwgoSz5nQuXtlGXZN9FtDCoTSReiBjts09lJK8VvEdRJ/Ds6egjLa
	ub0C7bi6mQIiz+nSCs85cIiNYYBGFSxuzsGZStJG5waf5/PUuMXcbI7D7RB/IhS0
	xnQUr9pc31XQMIkx2OOQtWEuwTlx02vOWPALA38AsOTb9n4YvyY0wCdKZxcoba0Y
	IKCc4XIbbGUkhQ+iRGQ8evHUSH5Qq9Dr4p84oiMGTx9QLzQgw4vhkCHt33A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9bw2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:45:38 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b1a3d8a752so36386007b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793562337; x=1794167137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
        b=M0nv6dX708wwA8gxBSbZZGfQGWo/SJIZ+bOOXGMrHMuz8d2q7G02M22hvBGLbFT7gS
         v3w8cKT+jLrotX+R4CTSQQ97aCfBv13TcCpSzsxN55ULlroTyJqcpLfu0mzS0W9X+ZDL
         KVz6nchHsRIdZZvr5z+mX+6nhM8wSAf6tBp8dfKpX+SGG77tsqBgIz4tUUlDCbuswoQT
         wMwMH0G4uP6DbPQK+A02kAV9qPiTul//OPCyiGvJMMpZl6837MhO6WDXq1SiCAx7pYcj
         Q6JU4BDu4c5Y3W6EHVWN+4BV43tjM91YIzf3relLFV/WFA6ZIpwibAugrRHKbfdWLZ5w
         yfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562337; x=1794167137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ne363uRV0Uu5dBRIJngUIEyq8MSL3B2gNct0ddDnFxg=;
        b=FALIe1KVVYQBxQkS7CZdc8rvsR6m0YAC7qYgUbuj6ct2aws3I6hpVr3Wxu45GsCn+b
         uVXCdWUygGyLQRSNRUePvjt4vGYl7UY+A7nroEguNJv27ecD6IXYkDynlDvoJPgYHfae
         A9Ua4BduDdaz7bw4T+afA2nApqwbUHGvRMdVrS0lc1gij6sU6XoSbmWUFKTcn6hbWGSR
         CnCAMinhNS8yhW3IRP1D3CxKnr/tX3IBAoCIqCuO8MHt58F0hhvh87E7geesypn+X2+4
         +iPuE8H6M6NoeNKZf2vHi/S6qwdtBwd8AZm8TNIm5VcLnmREXmoU95CepCsDc0PX+2TE
         Bu+w==
X-Forwarded-Encrypted: i=1; AKwUvBxcOFhGQtBL6jX4QCnoEZj4WAP1CF55JDQFi6tug4mdWo97R2BEDV29OWr8KCrHwaddg70fF0aGBWZs2s4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ix+eEQUpC9xyeSIf3VWlUMfyeV5R+WRBcFPxacXeyE+IbJRgE
	IsXuX2I4gPU8pIGwrZDpGe8cexT/9MieUeLHO/dCUMm5U3EHIp7OVAzLRnt76dBJy+9PnQEWMC6
	JsGd7cUE21cNSAGjNkdjkfoUOrge/9nosM3m6FsuKz0VAyFIXIodLc/oYOi3iVqAJzkI=
X-Gm-Gg: AYBFou0Qf8w/mB2TTbhc3d7Hn6LH6kH6EvXN1gsfDlCFiskhL3JldHIbbYbXovgVlzI
	0TgOAQpsgPFAIc/MmdkSBjaDXx2NkLXCqL4MhCN+ZKR23T0KFNU7kT0RvyhOvoDTBpTuUuWrszC
	hUu/sD7TIsu0xAgJBbXEO7lGY5iDzXko4lZt7YGkOeOrdHjrln+2e1f3+68UU8bu6ocJRH7YmLZ
	AkQ9dzz9PuV0qnXPfDqlYNW0Ym7uvcIci71SWs5mZqXH/yDi7JR/HuE8unLWD5aXazYJ6VNmIV8
	6VvySfyNmVYxxZtJKGwVN+54F+BeK8EpGuGq7rFl65/npLnKla/Zqjei+ScbFHpiMMHUsnGCIFp
	VA8dptxBE0xwNyj5O6OEEe0VltYGa01tWjHUmEdyhr9ZDIzu/sMzwcnkmZ09Uv99ZQ3PX4oIvM4
	iC9mQ=
X-Received: by 2002:a05:690e:4550:10b0:679:9afd:c0d7 with SMTP id 956f58d0204a3-67ba4fbc1a2mr4238870d50.18.1793562337566;
        Sun, 01 Nov 2026 11:45:37 -0800 (PST)
X-Received: by 2002:a05:690e:4550:10b0:679:9afd:c0d7 with SMTP id 956f58d0204a3-67ba4fbc1a2mr4238857d50.18.1793562337166;
        Sun, 01 Nov 2026 11:45:37 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2e0937sm3698982d50.13.2026.11.01.11.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:45:36 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Date: Sun,  1 Nov 2026 11:45:25 -0800
Message-ID: <20261101194525.4173-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com> <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com> <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mA3WgYZRimMLY_bDSxBDTpIUFJppJ1p3
X-Proofpoint-GUID: mA3WgYZRimMLY_bDSxBDTpIUFJppJ1p3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OCBTYWx0ZWRfXzibVomkgZbKI
 JiehDaF9Z+aOhQ4tVscd/xnq7wUIlvf3wwuG95JURuRgOmu4T+SNcUrZPhdSBdmPepB2N9kBZa6
 GmXZrNfKT1PjBs5FSG1TvUFmXkDsDMke8sNFugEYUXoofUsNqvjBqvHMsyTD8EioSQsVJ8WKn3+
 rUg49Mm74eRLviv7Mw9iNZXLmwAliScs11Ec6lXCbx0ZI2S/HAVLLqPAldJmEUTuDmfF7tmTy0Y
 2NIIJd4JKkwotwd40fDwOPl5WKo985xRMGxRGRRlXzEl8/L8pd2matRvXR9HLwKKj5TFVuty4Yh
 FhB6P4iAumDg7Lv/B1fFZ9tID1wwqd8K5rt0z3l+EpFtg0q/5Y7ATfUamcO3QIf4/dRV6iw7V0l
 MD82ogWWmfj11eEuYAII8aJuJVQHa2FcbDOGnKLkAB2TMvMaz7tjPlF6p/GiGgqleZ0M3i2EHNc
 QJQN+ly+3XxtLp/evSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OCBTYWx0ZWRfXzmly84+j+fTZ
 MsbGJJc3Qvw6QGRxP78eXF2wcl2TOzUu8Qy4+LxPIEkylxGZPsJAGHr+HHmsOVu+TzHHLOOKSI7
 l7ElpoGf9qBG9sWw9VmQQGEEd3dyK0s=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae796e2 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=4qzK_yRzVmX5WmnSQJ0A:9 a=ukwt756SXJsA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010078

On Mon, Aug 31, 2026 at 11:30:52 +0300, Abel Vesa wrote:
> On 26-08-30 14:56:15, Jason Pettit wrote:
> > +&usb_hs_phy {
> > +	vdd-supply = <&vreg_l2h_e0_0p88>;
> > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > +
>
> No redriver?

There is no redriver in this case since this USB is an internal
connection to the USB camera module.
