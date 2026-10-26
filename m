Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031184;
	b=D10ClAA9+lhIoA5Bh3rduDoA9wTCjKQzViGDAM7YmMAnJTCYhy7Lmh8rYTIsHwQZKeHG
	 TY1QggHTb7gdXgxDuScxy0Op6xmW+XZy3K0IzNUk8qGJN8I7lTA7px5i4xjeKVZtl2Ljy
	 yM1+uGe5XSHDQOVwS5Nz8bbb7GbXPRBSaA9BWIfJOGJl8tMuv94j90gBl2dRXD5UCZLNY
	 WDM8DolFiHMmS8HNNpyMwxuBT2KQYiUgTdsvtFZjfNccJ2PzaOOcYtwCk/SMM8yNMW/KB
	 ufN1l/rO74h4cjKnNidh+OT8njEFx7Mr0Y/Yg9oasT6aFbQbBNdlzraHEE8YYgvx80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7YaGQskNIcBSxlv7EA2prRfFbmqBzNuO34oMXZxCOxU=;
	b=0tKaVINpa8m5ujB/viEam+qo0LC7v7Ulz72Ii5kXCDM00+ZHWTnTMGL09A1FIXYCrcsl
	 9uDnTAicaSRMnD+BKSP1FImJ6F0YxT7cTEtxluPAx4WLgfYjH4dJ04G3+YSNOyf/U1fi1
	 +7yyyKNmpRWoZ6G4aq5IjxNZr8FNuHNEILdZXy9D/u5XFtKlj3F20nnrSiaB9yB1Jwdj4
	 GVFM4z6w0PRaZ7JpxnfO3vMKJaJgOn5Z0RX2iRsmKvc/B2QyenAmjlv7AZ0uGvQcDGh5V
	 uhWceJvP4ZFy9WiXngcIg6NKMJgT8pZ97pq46Pngg+SCG769U/t78qu7lHRF+AxV2zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lZpc2/4J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECvEdokZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A635606A336
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A635606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZpc2/4J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECvEdokZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwVBo3076356
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YaGQskNIcBSxlv7EA2prRfFbmqBzNuO34oMXZxCOxU=; b=lZpc2/4JJTBApHXl
	iCraTsRjG727qkU/3+Jc8M72AVTofA/hMIwW9CktwZi2RYHisWm8ARyQw82Vjmnm
	rOWwZxz9m8DebDVXMdf70muLVI5ABr6tCXWHwcZGwUzXYA6dsXCZ82PtZfUBIjQT
	EwRr0xdYD2f4Ojz/7zkFRZbZIw/FTF9RFf5XN6Jdq41mXxVd7tw7K2LTa/as0GXQ
	PTcFOmalZBBqluu+pbyPa/zCKuPQlvjKVAaS1RP89ThetVpVm3XV88IFdOsQNBG2
	KXLlIve8FUgu8uDPjZIr2pPwxhuy3YEBCh0tQPpSIATvZLIdcr59xLUiEHVTbLlL
	Ssoeiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdb9p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:13:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so612639985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031182; x=1793635982; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7YaGQskNIcBSxlv7EA2prRfFbmqBzNuO34oMXZxCOxU=;
        b=ECvEdokZdZsADQH0PTAwAUGDjh/vCT5ocQdgLTSADM7E3eLb/iW3yZQYRMTD57S6Zw
         665FLxzPkMsltlzqDrG5W4UqaGgJa0N3FYsn9yX7O7klDHdIPerTDkl6eJ+eVuJ+pcmg
         BbFevAMMBrWJXMX1ZOXHCqM/j5IYPgGcjwf176FZbnfoAnLkYFX2kV+xavNes/7aSJPU
         F9l6P61ACL4JOGYXholy1qmNl5IzGpV+FCJuNb+yvw7MTBEB9l2Cz6/u+xjfL3aMmy+O
         KnMbyNJyR4MXCCQ3jjHAm22ArnLayzT+NkVJwkGXvmcOVM91Zc47fuEflucqgHuDycu+
         sPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031182; x=1793635982;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YaGQskNIcBSxlv7EA2prRfFbmqBzNuO34oMXZxCOxU=;
        b=X0SsMbRpbbsKm0OBqE6XprBBr28CFx/Jx7bVxr/8pf0Kyg9Vi4lpAo0JUGz6vk+qEX
         smUDfrtpjOUt6g5WZF7jrpYHkhwhaJ8re4AwUkrWE3CF4h80CbN6QaHRVIvWs8ENZx7t
         UsGKVh574iufs55ykpWrPd7TmHEaZnxvjUO2reBx7SBAv33kSUPcfJuiwShj9fCUBA3z
         MoNc8AeRhIYhpB9vbgG2SVV2QlLQgm+3NmA+6qqy23GK+f8S+U6A3FDdomweDspHl8zW
         L87G8H43p4InylOkmrY3Wz3ZuLaDozlPrbDP388VtZnzK6IIsaLu3YkVF1Ln/kzKhJkx
         6UGQ==
X-Forwarded-Encrypted: i=1; AKwUvBy34l7MqvrFVNljEqYVkcVu/CFSchEipwaGzY+FOvw/gowM2KYnHggGOfpAJfdYGYhWe8SSCKtM9zkyxBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyLAPwCLtgXDdutQnxvmb60fYKFSFhLiL6a4QJiMPmvE1H7e7n
	Hs9YZ1FgvOjMyeX+g8TEyHPQf8/7oPqgB3Oo8ZJVj00rxmI6tWKf9QnT/Lvoofrzl9yv0cM7G//
	KbceGNW3JhMbPN9H/egTdg5NRaom6UPHwRYkTzJskGupWw12twt+Wj4npKKZsmpU7wsc=
X-Gm-Gg: AYBFou2krPH8cfdA0i3kB6gf7bqBX03aAJrDhaD5bGvvk4mVxz9mkm7DNDP+5KyYG62
	+D1tDOluaG2F1xtnddzROGA4Zq+M09e6cnsNpOsdcmCQ1J+u0R0wvKgyqm2DCnNJGfoDfmJ49zb
	6FSk8d/PAhByjnejEHARiOOQSJ7I0QnwjmrMLsFyHFx1tamEK2C9l5Mrv2gqdDesOX+kBlcwI1d
	ht18m5IqoTlyP1TgQ638/lB+OP2/FfEZVXTOMXFRzTAAila+LIWu4vUiJejOQYeoGoUmjuHVSgI
	2vr89U37WOJnadMw6JUk2i2o22IFuw4KlLlyKlZmA3AXoLgHI553J5zO0x5zBgX6h3WmJ9NR6wR
	oAwS574Bzqw==
X-Received: by 2002:a05:620a:45a1:b0:93e:95ce:539c with SMTP id af79cd13be357-940ef7b5358mr1023656385a.2.1793031182307;
        Mon, 26 Oct 2026 09:13:02 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:93e:95ce:539c with SMTP id af79cd13be357-940ef7b5358mr1023649385a.2.1793031181718;
        Mon, 26 Oct 2026 09:13:01 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48eesm17285385f8f.30.2026.10.26.09.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:13:00 -0700 (PDT)
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
Subject: Re: [PATCH v4 0/7] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:12:55 +0200
Message-Id: <179303117523.150406.9620841341326281603.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9TfO2KR6FbWjEjh9bD5cCLIAuh1sd0jIYWSuHk9VgJU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq33wLTBWj1bksFy7nA5sk+j2NGrviWjKqufRKV
 YXqaabR3OWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat98CwAKCRAbX0TJAJUV
 VkvbEACAthY7fYDU+kudhPtXhao1l0mQ2i8uYq/KkWWDjl6AjI3xO29sPSSPBC2O6QEXC4xvhlV
 UIy0MWy3X1rxepz+VN4d2mmUYz2Gbvy68t0IkoXtTKhqx7C6JpwFWI7SWx2VUweRl9spxvEkvAE
 LAJcDyzN9oNk4Eo+P/O2utrX/lXD3JJAh2L7djPyckfQU+UR/WUOMeejAiC1JWUOYWlihDKzZFL
 wn8pW7mDsy4NY2qTidMK0WSUxNio6j5Rpr9WMdnthHcJhzxGJstPWnAZeL7KuoKaUPDzZuwFm7c
 pYi89g4pufVc6+Lm7bYk64erZQDpSnPxKKFkzt6bhelMSQp8aMArT67olyDF1P91oMVo/UZJYJT
 lDXMpu6PrwffcZzjTXxUV/KRFmC7+/meed06uYiJGm1KWxfx78HYwzzpoLz+MTSQOZpYOR79nRR
 mfxUAvrzjnZW31WXm8LU90GNUsfziKHMGJdcWe3orCl3FSkraXcpSf+YD3BWUHvYn3UkFRxnp1J
 svPfemyoLq+6V9RmOeIt/PatROd4g0G48luPGy+tDX/D9MFYyVDV0vsJlgVz8fYIdvKCXPA8MNw
 ip3ca10C2lZ052Lj0EzS2YKgsAgmN2JI3BI9pdmwVTcNE26WcQ4GsshdtQApZ4sfXAmo7fLAWU6
 yI9iypSE2hTgafA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: MJNGsXnxDSqLmZXp3wR_OxmpSOnvTJgQ
X-Proofpoint-GUID: MJNGsXnxDSqLmZXp3wR_OxmpSOnvTJgQ
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf7c0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FTV9ytXlIdVfh_-C-1sA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfXxNDEA5H4zBah
 YrESL1PbbJauFgpChwXJchu0Ll3AxunBOD1iEzHibk6jrRSRtKV54JU4r0N5FMODGgtHpQOqZ/d
 vafkuoxncZXcdsTUfaY8ll2g7JaJej4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfXwYD1M7hK8LRg
 cUrlJkjWkoHwq4pYwIhNgUtmiKxN/T3ko6f6MhdteW5AK+pkQQeY1LzW2bHcHKzEj43TIx0unUt
 st+jYA94Qfeu9SQQXMzDmrRkZ4jG3Qy2kXbO0YixprZ+CUPHmuPKXmo8TRzTwni62PDEnrqkmJw
 e/UBj2+jDufzIzQD9xdgwCv9uJ7DYoqzFS5trsjjRIBAxeMI0oru6unPre9EF+E5DjULi+U+Uaf
 TDzVbsjXIzy5aEWa0WKv0T1yZie+bNxbxdc6hVEbDyyMhoSTiL3+FFm8UYVzZhNhVyvsk7AywOf
 ievAJeGD1yXVE7YbUbOW/C+MPxj2+pe5OpTXIl4zpYlUHRxC/82EuInCpQnS5Nyu/r70ecQlODI
 uwndwbFwvLjGOSCb5N3rZO7quG2baMGulUGOciNvBzu4ff8FP3F4/5xNd8jIpkRCeExrVakx3Ah
 yWZt7w+PCZvc69ub7rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260064

On Mon, 26 Oct 2026 17:14:28 +0530, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com> wrote:
> arm64: dts: qcom: shikra: Enable audio on EVK boards
> 
> This series enables the Shikra audio path on EVK targets by adding the QAIF
> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
> board-level sound card wiring for CQM, CQS and IQS variants.
> 
> Shikra EVK variants use different audio components and processing
> architectures:
> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>   PM4125 + Rouleur codec components.
> - CQS uses modem-DSP based audio processing.
> - IQS uses a third-party MAX98091 codec with modem-DSP support.
> 
> [...]

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
