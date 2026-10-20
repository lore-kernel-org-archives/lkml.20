Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483881;
	b=qWuwUWBp93ny8Rl/GgFKfyak/avXee+BO6+1wTczJPLVBjpauKekdc0q/FLpIpTUsYbL
	 7VqChS9tCG1C5tBn50S3h/Q644cJqMuyc0MuQP91rUbp2T/M43wrwIhkvIoynPZJgNguA
	 CcMxcEv0RNm1Yqvx0omJ677DxhC2hQrjmiqoLJc2qaLVm6HAjypyDcNlpa0M4gRR1ULek
	 UnYA4Mti4KfdDKfpO0RnxOKab0uieuZxvIS35+Rz4mHWTlzBS2hOspnXUoVteSLB0t9c5
	 XeXYVi5V7OTyVpm9zbTquLNalN5L9uBWxrfdn2MqzYFVRAwme3QQ1Uo0QJspDyFSHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=;
	b=xu3c4HPVBpUBMSnVdnhb6CU7RYK4CFwp0tCsWbZcGF82lw7qRqst2ovXy+y6gyM/5mM/
	 dGUI3gFu/0Uox2jectxTRmSPM6Q9p9EGTOiGC1pLAA+P9fCIXZzFgxEi9NCNxTe3gWzZ3
	 33d0DoOhPO1139JX2And8m4tnVaJj21a0WXNhiaNEW5ofG30rLmVPSRUTjtmukpiEYin9
	 ckuL9RI32nvGvlbF9uJgwFXyK54qnZLtUz4ZA63aX7tuaswFm5QRMM/XNky5lYK+Hkn0u
	 D1UOH72F95qY4ND5fTH0wT5oztPO78R5ye7LvJIbCKGoUwauGAt7rux1CDqAUPrBoJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNuZAY2C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nempdmhd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C0606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B43C0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNuZAY2C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nempdmhd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6DdPT1385432
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=; b=RNuZAY2C6t0dngjN
	6QYzz+pUG8Zli4ytOvPQvGe/gaMR7MIQgQPz+JLRqjMnzL3FMoIhR7dr4FaBD9eG
	wQvbdRXfIEZh96c1Pb0j8Y63av3Lj5z2DBOzL0OUOreg1THuzQmWqVn44XxCUCng
	oL+OnIMwx2g1uxnQtyDtR8oSvxCiZ/4WRJaLvrhIUVJIDJIwV7ERJNvTScVItk2d
	nMprMny3uloY6BKYu8FEZBI7FUStiZ8S7qBy+XIhqQtapb8MepB+jTyH+p+0SkyJ
	adczw1VwvDCwfH6+X0RW50Vc3FojxrL789WoeRNmKcfrTw6lgTpWKhx/1a0nqFA0
	DqTKKg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phjwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:11:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so4749521cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483879; x=1793088679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=;
        b=NempdmhduzKFP2EE+uxvztF1mqYRDRQN6RBl2SnhurJCxpCl2IrUfTprkvxpbSKQls
         g8h7/HaQJ0skxP9RQAl+ZkLzSAiOP8QJV7EfgavX1aBWLAVsej1E7ycAxffN7k+dHywM
         vilTmVMTy91fUjWvdr0IxVoxJCPuvuo6zPcGz0UmlDmD+AFVVVazAdvwmfJhUhodO6Dh
         ewKwYv/PWViYPv+EkJjs6JIwG8+g5RkyGfBnx0bRtNng82i2l55NvHbb8npjXue9tHSx
         dkprlhusITvsLz39D55t1W4TilgRafaEOfZYe9zMpl6SdW5282spwHV7d2k7awvSYt2w
         zh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483879; x=1793088679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaw7Vw5fhMfMSdjDzwyrNEoSf4wZhTYsgktagKs8aGc=;
        b=KITgojuQovzpkfjByRtUqcjBePw9/2RJ9gM8PLzeHwbpYzZucTHn4p9nW0cP9BIiea
         pMctqqXlCJg1fuAw5Twl+yHHDekTmJ7w5KYNBrHJFJE2NR45h0JbFaZhf1b48fTKzhXn
         eMcsz+4mzfCkpkUQEffLiMzXhjSjMmo6LGe7e++JavYyoRSALDcfD38Sj4It6/Cdlx8I
         XmNtxdnBeXTlnS7/k3d9rAFl+uPr/6hnxNn27EI/f/UoX8OOEhD7UDQ3YC8sCgCO6d0k
         0s0Uh8vrOtCC4Kh0QZh3z/W5zxODSqV8KqQMzQ4vM1j6PRwQOAso+XdsM6nU0Sib0TBh
         4qKg==
X-Forwarded-Encrypted: i=1; AKwUvBxv9iky0E1JKhrZb87n8DmbFlVYVOSOdZdJuDvN6FK97B6YjInAGxg9SuG8A7WHMQL1zwZ2xB12JTU77vU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKW51T9lwKl387rSaJxd2f227lRBPWgga/vD+avPIwziSKbgRK
	b2JghDabLbeK6/LQPlMetWKwBDulMU/MWaz/H+eaahgWVDCu+lDi9TVCVSX8WR0THHIvzVLAT9e
	fn0j3m5EwnqrPdxR9WASueTF+JhNCH6tH7nZ1n4CAoslzlliMsIQliUqYkBlw2i+d/H8=
X-Gm-Gg: AYBFou2DLhSnzcQ4H8moce92NSgFR3kYt3OdJKt9UM/my0Hw7b3H5+zF2AMHsvD/FJP
	puKQFcdjbqupTsllH1kmPFANvgsk8V8FcU2EBwpzmaAOOhBSNnnPaNSh+lvsXal+/zpOAj6Us2z
	H5U8XkYagWABnNewNyhxyz5xxp0OzPeR8dws4f9/yXsqbljPPX3HXN2Cv5/krpQUj6wZNPMzxA5
	rX2K/a3VMZt+1pjVpJDTzCzSp8jPJd3MoYuxRL5r06osuTxMvg0aKUSMSnhYGEQ0sUaHeYaJqa/
	hOclCgf8TLyYUD2RBcQAQgGWHsiuXS8sUdv6a0cUekCOMeHI6Uf8euBBA4Hkh5SwDrfMHAvq2hf
	x1wSHhhJle7W110sS9ANMOA==
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr177951891cf.5.1792483879063;
        Tue, 20 Oct 2026 01:11:19 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr177951731cf.5.1792483878612;
        Tue, 20 Oct 2026 01:11:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm461340166b.61.2026.10.20.01.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:11:17 -0700 (PDT)
Message-ID: <40ca2a9c-55c0-43bb-bfa2-f6f94f35dbac@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:11:15 +0200
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
 <20260905-hamoa-sys-therm-v2-2-1cb8c958c981@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-hamoa-sys-therm-v2-2-1cb8c958c981@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad72227 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4__AJpt3kqbA7IiQeHIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: boSBbxCwsZEUnWOXsl_-p5ReFpm9G30w
X-Proofpoint-GUID: boSBbxCwsZEUnWOXsl_-p5ReFpm9G30w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX/AM2+u0Gr6fu
 es4IHXS1YtFENSWcUE6PWExb/JOaojwXVT9yh5VEzmzDe4nlYqjhiWpwRwGrnh6/lCGcWbxTr6y
 jotfp2kYVJqH2/a+3ltbEo3OBTIVA05Wbwx6wSx8LyT17TLG1ij4bpecbLEz4Rh3JVtv0FezTty
 q8qRtKi2c6RI+xTtaZ2kvSvENHhBDV+qQDuwNZtPuTvbO95PGfmlv29tkEkNuWKNXzIfPPnkYwO
 2sVHvXEX/mgvofFJ0T1oZzCo4X0RTe4JhVathJEFDcvWiXPIU7YKNzqA6z8bQABRD+HzI/nw3RL
 l+W64LuYlMmzbHr1laeBge6J0JNf4PqAi+ypF4BSWY1sTGSfK/FtRoa7eF6BNUZ8Td/xdR/kLoY
 eQP+EfspffT4gx2LqU306aCB5ii2gHgXGv4uBt/336PST92O9heTFFVAF4PbyDXVXIjkw4WeAwf
 fCvu4Y8ZVC+UdOvkh/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX9n8LesLHXxFP
 G8+VUUxJ8e7NVvz7pqTEJzpkha4xcsIGJOQzWxXsTtYRkfmtPtYyWvoqodc+BQzu5jFZgmvFdIV
 JybbHQDbz4lo3y/bSLEJBIbOBi9pt/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032

On 9/5/26 5:05 AM, Bjorn Andersson wrote:
> The "limits" hardware performs rapid thermal management of the CPU
> cores, but during prolonged CPU usage the system's overall temperature
> need to be further managed by software.
> 
> The reference design provides seven "system thermistors", connected to
> the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
> thermistor", which is wired up to sys_therm1.
> 
> Use this to throttle the CPUs, in the same way that we're throttling
> previous generation laptops based on "skin-temp". The trips are chosen
> from those existing examples, but are comparable with the ACPI thermal
> policy.
> 
> While not used for cooling/throttling, also add the other thermal zones
> for temperature reporting purposes.
> 
> Enable thermal-monitor mode for all 7 channels in the ADC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

A good start!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
