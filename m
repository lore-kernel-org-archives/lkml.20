Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486157;
	b=wY2N2KEvLMJulCtqI9ffEjvmPUGg3UCeRKbQzhAUGnp9kx4IGr8IXBq6VfRggM7OV/+3
	 QBNTrlKpFSfX8AA4gPzF9DiME8JjWrRIOdbvaR+puVa2hMwToVKqzYsABqbX0e3ewT9lZ
	 vDihWbKfmwbWB0myuMSB70HUEPVYt1SZxIAAC/4MH/7fdSPfiXCj3v8QA1FnAFHn349W8
	 kJ11TOAwNIyZK/h2MTgT9Ndt/ngpfDvp1NoXsBrVROCp67JjNtJTj5bkbMthkZEoiSRgA
	 p/0C1y6rKO+9/g8jVMaN624LlrBk839i7TxqDKqSQOdd9krw2fIIRspjw6ov3+Jm2JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
	b=I8tY8rZSKA6GOtydTfhEvFhHkuvALrIOTlLLFXCW1uph0EQuBWPziEmkcjiCVg2F97yq
	 sCmZMn/p4R95UpVrkgaeT7TnPL9jjhgy76/plFqcZieA3E748giVrpHiSVWEJ4h/YMObu
	 Z6y0cBendImSBRqGwm97aDhY4TdRN4+Ag3ARYZW5grvaMtDG2UCsQ5HEoWQhPfvm6Ay+t
	 GLE3amnd+o7S+a3fnxn46r6NW7blMFUzu+BVzJ5oTD13o1U4XJe///jfCM6eMeRMaBKi3
	 L79A8d3E6BvdN8kVed7jKac8f1PSWdSoEvXGlYygZCOvGrrLMSAvDUOYOfn5e2Huh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GGApLlW0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GU8MIr3t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC2C606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC2C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GGApLlW0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GU8MIr3t
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8EMUQ1254528
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0/bwyW8UsnwQhwKI8DmK2Awa
	AcEZQ5pGOOAly+nFvG0=; b=GGApLlW0BJVZ/RIvl5xIBB5hxywoiAKZgzOiFuLe
	11FLS0Z7tSAl2YgW8XgxLNpU279wunc6zotOOJqeUP07RhR/Hxpjr5P8CjFSLjxc
	pBGamxuNp/sCWgzJqSZBK3pRHCK/J4S/Un39tiiWb7jmIaeKakjJYmjMpPdQCBus
	A5nFCe4Xq/D1LmH2U/cdX9TelQiODCFeXLAx35U0wtmfTIRs5OmpVcYFmQORliOD
	Pxh55DyXxkP2DFPe/GLIAFH1d2qxt9elA5ME1RJ0LOfzzBTH2U6Jm1hv4hYdMqFO
	PR3Ee7f76k5kohnE1ElBk3X+dLPOOznZLjRch4bLn3I2+g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9p6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:49:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b7e90fef1so10576106d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486155; x=1793090955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
        b=GU8MIr3tPPPU8IAs7prEc2CUiW4KNdX3azdR0qJDT6aXg92zMVFutWjXb6Bor16QIj
         32ZC2N/i0yJMdBoYZpJTJ1v3znWzuYusyjRQSAKN9BFv/xa6UnZAoUJcivPvDhSOEgBl
         JNvSkD8pa/jRgxHVxvZLq813D/jJRGaaaJpFFASH5LBfURKQOhPgGI7n/QDrMSkumiAG
         IIeXV+u7Qz9Vbt/zEShFu9n+OXrEdSu9uJbMZwlxEj+eOuuh2/GCZ7rdCjGZWXIvFyWr
         fvCaIzUCUtRT7OLGcvUU51GeKsYuw+kHKAoTx4nnAjsWf++WELs43AdErnSPARA4EsUJ
         BVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486155; x=1793090955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/bwyW8UsnwQhwKI8DmK2AwaAcEZQ5pGOOAly+nFvG0=;
        b=P323zU9GaSlZTReOkfVIYVZsIR673Tp8O5iN/TksdjWugUzVIOUu25qhvHNHRiYSdN
         fCHPGGc/aSqMYgGVgi1XC1+K03h9qI5Mfj6clkkKTwvjVIDGiSlHKAbDDcy+DT6t51xF
         ddrT7ZCw7Pe9fkA2GcabltflHQKfxvaw+iTyVRs5N5Z3X4ykwq2CdMoTElUvoX5Ybx8M
         cnmXz2kNbxrRHzhg7nMHjk9BW0+9uy08ePndchvMY4wHrL98C44pP9KlIS0TODk2PxUN
         Kr8ut+jIlSfyjnFYRm14oraD/ckaUYxjszB5l/g8h7Bnj62guVwdRz6Zxe7+q1pZ99+d
         La6g==
X-Forwarded-Encrypted: i=1; AKwUvBzXi+XoHFixxjtSMuak7Uq3VtsBpyHiZHOckGH8xBOpbvBqfYKwbCzaQb2CyyfteLL5HcmvCPqu2VpkRxA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwkRX8WiVU/YQGtq2lQfSJSvMa73zFcCNx5ilEhCnFqW3Jyr/C
	54+8+nZHOzqWnf8ftJdFESCcsojvxMJek/HnJOifftCVRodrcudTH7jFn/rCgb6ST2rGeSmR48F
	PKOqHc75lpZsm5+6fNZkAZFjDlNgjaDtU8BabSZp5GR8Cx88RYFZecgzHBsm3C7cnWWE=
X-Gm-Gg: AYBFou0HdQ6yaMakjud7uOV7kiR2exP5yhxGGYiC9c+0q1LPwY/TcjXolfUfPUPEuow
	qj5lUI2B5xOOGK3dKNdoMa2H5YIYHMguajdeYHWKSKrDaU6ZAG2+TqyArUTQtROANK8udjTjGJp
	tFUbqm3z0heIYDzbHHe9IbRuMezH63TyCpelDVMiELpCLXVSaryA2S5Q1M8DXV7gzY2vm1BEQPN
	Qn/D4Cqr5Z25q+FIQPC4E2sI4R2k2oW/UqyqR+92Uyj+Y4XY8+iPPxTa3NSJZQh3KklKt/6Wqty
	LPK0dMJWtXQ5rQKssaasP+T00mv4oVGlonvWL+TLQ8SgW/pRBXhaVHGW1r3LJEGwCZxJkRpv+8Q
	5aQ4RpPh3jU2Vnrh0qy4XZ717Yast7Ta5QMoQx41xn6VXteIXtQDW7cxe4izZN8ZpAO72seRpVS
	QQleqlnpum6WsR
X-Received: by 2002:a05:620a:3720:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f4c1c4284mr210096885a.10.1792486154562;
        Tue, 20 Oct 2026 01:49:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f4c1c4284mr210095585a.10.1792486154122;
        Tue, 20 Oct 2026 01:49:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm23596581fa.25.2026.10.20.01.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:49:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:49:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <ec2vb232k5u6w4pqoiqc5lhq2zj3xuf6yaifpiyzjjgaffpcih@ulainigpj4l6>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
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
In-Reply-To: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kNSXQn5vKEiKUAAjMRyiNRe2FK-qy9yN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX+hYt7/X72QJx
 DXe6XIxUQ/KXDlNXKwWzSWYag9zj8ZbCxjQrByM84nRj5k3iJFNqS0jwQbnDvv38qhZ2rKjBPJD
 ceoZ2gvtDaZTtyW7x45ShLk6S9C41Z1IMdbME5yIljmAMIi6liLuM5ZXBxSOWp5dPN4TSmXVp2r
 z5KXnpHxzDkZDrym1FqqdzoqWGPPqKMFOFgzqujFAkW1EVCzdNUW9p5lXmp/Giobb/7Hm4Vnqzq
 /OVhyXC6ysC8gxjfZ8Mth99T3xFXltlKFjs4tjyaxrXBmjZy+s41zLT5ODLKy8JOkMEbaUFlfH1
 8BTxanCkJ7riZ+NDXmcEqasHSGqukcPb3gzkrEhWaFJYAqBIg98ttSWWI5m70l0My+XhlIMBcwf
 EUk0cFm1y+V/9XWoSr8aWlU34JlVFvhjhPG8GGYFb6WrkkVgtER3wxKDzhursZMWjLfjdBssKcQ
 3Ix3H1dgejQ8r/VVADQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX6gtk/0M0gs92
 Tb3kcGdVJSExg1nsNgX+ewBrhdFLst5m99x4i2zzGSFpgaJwZOfI71iqvIWN/6l88in9qrwQ6o2
 ryvtI0iKnNM6/qi9hOUUNof6t/Lw/B8=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad72b0b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=aMj0She71zyoh_EkCE4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: kNSXQn5vKEiKUAAjMRyiNRe2FK-qy9yN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

On Fri, Oct 16, 2026 at 02:17:10PM +0300, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> the ADSP remote heap memory region needed by the Audio PD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebase onto next-20261015.
> - Add the ADSP remote heap memory region (no-map) and VMIDs.
> - Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com
> 
> Changes in v2:
> - Rebase onto next-20260915.
> - Drop the CDSP glink-edge description, as it was merged with the
>   CDSP remoteproc support.
> - Use the documented 0x1063-0x1066 secondary ADSP SID values.
> - Drop the undocumented tertiary ADSP CB7 stream (0x1087).

Hmm, you still have this in place.

> - Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +
> +						iommus = <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>;
> +						dma-coherent;
> +					};
> +				};
> +
>  				gpr {
>  					compatible = "qcom,gpr";
>  					qcom,glink-channels = "adsp_apps";

-- 
With best wishes
Dmitry
