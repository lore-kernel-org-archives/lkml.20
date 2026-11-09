Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233813;
	b=vNEac6ehbfgO53a9vfUGw5j0k2a/j2AqI4xT1jgSBy9ktHh5TYUCM/gqa1lt/5zTOAiw
	 kaSdk23Y9yyPv5naCTJBiiMWrP9TMZUb/a2S0iVPtaJagOFfUyrUVmlIdx4DSvSi5x65t
	 //r5o6mLPgvDsMSA0DEREjYRV3q8+LmpcMbtheoynAFbDrzOHkDN3KmgcESFzhBuFgQlG
	 VRSX5YyP/+0IpHzdkzubT7FqzsfKEM2JWoSG8EYHBAtypAze54ZhQeBQzBx98ePf9GU3j
	 bN7KZStOqhABVL4Q1lBIFivTiIH/VtoEWuA68qi0hQEjUvbNCknVEHhTQBpni0YJZvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
	b=ZsqeH/mAZOzIqTSjpZuXa/GYrH0Cdysxzv7uUo1s0b7wOKAUMnPXUBCBm6ZkubogqC3E
	 WkP5ZJenq23y3cI3T95xaO9ezGnUdaovL9qYfxrlOna3Zy6Q9ZGTezpLF3JUiO12bHs1S
	 rhlFmAD6UHffotW7HyqpbMs73BdeNfwMZNseLTKp0WFal+Q+9b/aDf/oeuVkNvsnRAprw
	 S3/RygvLw8SQW+ZzdNLK1WInRup03oI0hPPkN06UpC71Fq3xnanhu1SAy3UKpVxee+rTm
	 0AelXBA8EcL97fI4zFiyn89blSnCB53eCLV8JFgKiiMGXUtjaMRb6Pb1G9Yr+itvRgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGurauri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCN1pzao;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B0606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGurauri;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCN1pzao
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF3Q8334839
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=; b=YGurauriakt763yf
	MADv55l0Mn+7QLIicKiJcxF0lBKecrR9uUxQ+fi0zGuR8lc/szkS+P7JvDYOpJw9
	ARXsfPfFx0Tn4QtkzVcNkyyhY6cCDP+er0J46exeuQFi5MPbt5RyLTfIZBItcUNx
	vuFgYYJ3IL9EYn7pzadZzTIowrWzzzrNZIMMZdJD7MBngTK/3GvCThDLjnYForcL
	lJKBrv6WIMP1+WiO9BGOwnAN3G+lxh64Gl8NJjn3NfySJujCrr7TZJGYe6SYyGyL
	ICI0MRgbxJmKVonVgxLZF6cocaJ3ieiX8bBt3VLl2PFRMD4R/zVaihXL3rk3ZYjc
	v8zzPQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58hhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:16:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so22151e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233811; x=1794838611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
        b=HCN1pzaoKViI0fXJIPDEJj+/q4RVl9Fxb40fjsOv2zknN6I0XuenTA2Stq8U+5I0ua
         Bxkabzjf5YFs3V+ID9f/Hnz4qxsCPlRMozzafwo4munLXzVQGWTYy+n8nj+1LD9DFot2
         KCyXqt9bN6btQtIQ2YUHowVkY+/11nM8el8IZ6RwihHdQaL1mE9MGyFBb5sCfn3b+aDp
         vguhjNgQq0UvshdOYvtLGXytLprvOpkke8I3HiXL8GIwxvNZZmlhf2s69ghmjsgv8NQO
         bOl1xQ/XbfvrDA27Pivu72qDZgtXooh6TNA9a861QdLE1DomEqAHuMheYfYi9RxvFf28
         I94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233811; x=1794838611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHpZtlwhZdrjSEt1e5gRXJpdYleVmU1FJNFJUjqzuzI=;
        b=1MxlhrWZk+HT4QxU7rM4y5ucd5kH8iMDEGK4Oka2ieGe03Hb9F1M7AT8D73PPo1hwz
         mVESqvXDf4Bvz6RnwDckYSwiHp2oO8w1LilSV7tnX64OXQkmlw3V3uDCta9PK+QT8kKb
         ozPtSawQGIuxLJU9HfWZbyVD2pOnmJ9LComFQD285JhNQbP00dPvzsJMFWWeatddGgrz
         I6aqGuv3/d9UbW91ZWaTQjV0bNMFvb7vT9084+xiHUScDbeFGH5Iofm4pyhWUKPlEg+R
         76qiDIyaWre9kHGwItScXZN0iRQL3EAkK54WfIk8r3NDJfcBEa1b93L4nNA43F/Wyrjm
         kFPA==
X-Forwarded-Encrypted: i=1; AL+hErGz6spQ8dkPKrEQLNjJ/j4Pctp/rVQXT+ls4+0f7yROPvoZSkYHUeygSIf6dQ93b0/hEWGdCSvRaoH4sbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Te3ImthtyO08tItuP9FWPnAqZkRUQ0lw7UfEKh1UtwPjc261o
	NDQAWXRtl5H5PHdq79xdAKr6fkSTW3iANj6GH2uItPK6mF4wy51+R/9fVS/aN+1FdnthRLBCH30
	LESzixhllfH7dgbvvaomCK2p0C4eCVyGcPc52E84qiDZRcgB28kY6pqntM4egIeJK+1g=
X-Gm-Gg: AYBFou3xt7IVgxSk2rmQHdvd0qTzHInuBuFE1OSTvIPQ3jmcnLMiTTab/sKwqQHZ86G
	tUDCrA79msNCHeyvXZT6umVDj1SVMIfbLiNaUy2zoc4YSGAlzx5TO0zDbA6xVOsM2egF5bbtq9T
	c5abuYqOQ2/sIrosoD7uwm5my5jCOyOUtabr8ibkKoD0z4ZWQo5N6tNJj9MJUnGZMSizYkBdYTf
	l9tO1kVjXH2N8dLJnAX172awybvlZhoKzm/3/xIohLZQxY0cMKePo8M8ZUynBrd+4U0DPsQ3ELS
	oKNTzsOdf+PEhRV5dUAi1/8Be1nSMWTP03XHC1T/tFFTTWx4t86esfjrmA7jDvOr4nq6TRdqLUL
	dfJHl23r6J8iE6Xq+6j5DSrtFySeAZWbPY6Dfj2qFLTEjUn0xjwjXGg3xkEKEhSHdA+yHOg==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr956871e0c.1.1794233804237;
        Mon, 09 Nov 2026 06:16:44 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr956838e0c.1.1794233803786;
        Mon, 09 Nov 2026 06:16:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9d6867sm171976966b.84.2026.11.09.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:16:42 -0800 (PST)
Message-ID: <a32b69d2-80e2-49c5-bb44-d7e808253ca5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:16:40 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as
 non-secure domain
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, andersson@kernel.org,
        konradybcio@kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: swJhcqALAHqIwQKPclEfaCwzAnlg9NbU
X-Proofpoint-GUID: swJhcqALAHqIwQKPclEfaCwzAnlg9NbU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX1GgBrmb1N2z7
 RldAmHuxwJhQkUWDOeja/1OXOn+dhU7ikm1sNn/eL48Y/wi9EIkRbTk0V/VnPftdsSiXV8Z0jX7
 TeaDMU8H1NkWBXlkO3b5VmIKb1HKNhg=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1d5d3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RWRYIkh9dnzXWyXN4okA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXxjc9Tsrh9lf3
 F1ldLbQeLCYvDnABks57ULxveWuFKq5k+O5l5W4ifDcD21NYZMnLKxmLy8x5xpEpchEYAd/C2Lu
 3w7JDVk7NACjh8lagtb0xmVd7GKvV24TbSDkiUBAPuwVB6jvCE3JVigxQTzQxZuN71qelWmqOJi
 h8khZKyuyz3FDep3tgnzQZGgIeTPkXgpn/ZUuwr+8Me9rgWUvHw1OO8RxTopY3YyubUh9Lbswkj
 vEmX9BTLjBAVc3MlYDe/5CAXp30UcUQ4LGLiDoq/Dxuuctfjmnl1ZwuT6VxU2mVeDKf0YDlEXU5
 un79t9yXU8GEMmkZ5UYtOEP3aOY6hg1DxZvoV+vog68PDwPCkLmZW9iyqIrJxuxUQQ316T5myUA
 mbQdSjRvQdnZtBaCFIxrBJYaYcZPS4A0ytD0arEnO0kWFB4WDJFHSXxiehbtOmMwpJAKTsNTlG8
 SJ0LwwKLqyINIVdBK6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 11/7/26 4:26 AM, Qianhui Xu wrote:
> On SM8750 the ADSP fastrpc instance used by the sensor core (and by the
> other non-secure ADSP users) is the one the firmware exposes as
> non-secure; the CDSP fastrpc node already carries
> "qcom,non-secure-domain", the ADSP one does not.  With the fastrpc driver
> keying the secure/non-secure split off that property, the ADSP only
> instantiates /dev/fastrpc-adsp-secure and userspace never gets
> /dev/fastrpc-adsp, so libssc/hexagonrpcd cannot attach to the sensor PD
> (qrtr service 400) and iio-sensor-proxy reports no sensors at all.

Hm, this is a nuanced case - adding +Ekansh, +Dmitry and +Srini

> Observed on the Lenovo Legion Tab Y700 Gen4 (TB322FC), which is SM8750
> based: without this property /dev/fastrpc-adsp never appears and
> iio-sensor-proxy exposes neither accelerometer, ambient light nor
> proximity; with it, qrtr shows the "Snapdragon Sensor Core service"
> (id 400) and all three sensor types report as available.  The change is
> one property on one node, matching what the CDSP node already does.
> 
> Tested with `make CHECK_DTBS=y qcom/sm8750-mtp.dtb` (no new warnings; the
> single avoid_unnecessary_addr_size warning on dsi@ae96000 is present
> before and after).
> 
> *** AI-assistance disclosure ***
> This patch and its commit message were prepared with the help of an LLM
> coding assistant.  The author reviewed the change line by line, ran the
> checks quoted above on his own hardware and takes full responsibility
> for the content.

Please keep that under the --- line so it doesn't end up in the commit
log.

Konrad

> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index cf947acc57..9302481b11 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2571,6 +2571,7 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					qcom,non-secure-domain;
>  					memory-region = <&adsp_rpc_remote_heap_mem>;
>  					qcom,vmids = <QCOM_SCM_VMID_LPASS
>  						      QCOM_SCM_VMID_ADSP_HEAP>;
