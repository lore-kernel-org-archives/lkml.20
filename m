Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501339;
	b=kg4HUANfD15YgT0megRWxk9vC6Uq9nPFkZi26sb0dCqHJXXny96qBRfJjERFXrb6iiTq
	 dNNfYK3oqb2XZBZIITArNAKSD+yY0C4i0QPrXGn80KcKxovTYgLAE8v/0zSSTRfJQaL6b
	 /0DI+snwZJDNMYM51cK7auTC4dgYeOTqctI16czpkbGxBV5pG1rjob3Jcv5Zxy8OIVpZN
	 eWn9oGLx4JD9YgjoloYT/TMQJFnsG9yPJLjrDT6R0KYRr3WYcU1Iyg5YnxiOJCCRCzJNW
	 V/EGeHnH/hD+n/Q7mLeSNMoruJUiZUa4QbXivx3rXwZW6e10xm6Ql5bT10U9BsYdXSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
	b=jxM1sNjV8xw29AMn7Q491j/j+lP1w78V0Yf58ZZOzXfDsvA4NGfi8M/kr4VNvYohDSfy
	 wHAW1B119q7s/0WQ/3rB0JOJB+wHY7zVF4Bxqn9A2Jk8OIpbheqQk3s2cE9Rz8/Z8Wj0+
	 yvw1Nd5HPM+N5je8t1KC+Cas1s4xojJQX5sDnUNmJnlTjhRACVAzvAosDZTF6omRX+c+F
	 gxKle0QVBLkRCN57zz2qkGEsnukNUHjmjmKhsXl+s5fstTVDo59ex/PklBambAj46kzox
	 oJIzZ22m+4NRC6qbXXGQEIVblXQ/dxAAmkDiJzroVxply4RgntdLWSHM0sjN07IOphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myij8ayj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeA81JMX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F50606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myij8ayj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeA81JMX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBYEo9066372
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E9+isAu1JUaOE8ta5xXFojt0
	4qILV/+xKrOOocJ3ry4=; b=Myij8ayjac/6exWWxw46Sl9cnKLQku9yE5/PRtLy
	al4LpuZucmwHA1anuwyfVkGZaVjBFA8zz1PzXqbsKlxGSiPNa2a0Ow0Bs3QkRox1
	tE+S3d0TtvGHTkVSfSVVKs+5xlBb6cIdRsEAKwsJRSHFNNkF4i0NCMUdSfEMi6Uz
	/4TzF+Hp9KahFPH92mcXbqQW4yDVq8pcyuvnhXfnWi1IffWkoeBbJPkRpsJQ0oNU
	k+fEFjb/oYxdin1jmH81hZXPvrAMNtD4e9i9mKbVvhUndgYSy21UrzxkIcfLcI8S
	klOy1q1vGwQ0H0f/LHRfxJWvSsBVX1q1Lt2VL+rMdHYhjA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv88sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:02:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead3f82944so348598e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501335; x=1793106135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
        b=ZeA81JMXfFBJCIJNKiBUMkJ/T88B+giGRg6DVIaA92gvpnTZcmfMss6/DXCOd3ALPN
         +v7BZS2iIwtgpqKs9iBpJxEZuKcQTGTUKstyvTdlM3PORGTW/LxdikhxZtibeDvndlLI
         LggNJ/sFhTeF+O5OJU3yuxnzehNzeGwFvxJ810DjzRrmuP7/5w2Hn3CxXRx3AtruSz5U
         RHGrfS1+13LlQu3O6HWCalqZLEL+1lfSaGzun+mo7LmkzYTwGsKQmfQ+ifqrWtnL/7qB
         7nT5jekIPrl3kq3OZLG5vXv0TTRoMgJGgQyiADGe6gSKdbNurvohx4gbdubJonwDwXMU
         XV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501335; x=1793106135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
        b=CabfDFFB9P6xpokm1MXjHr/TETG52Zo7gIZVp7kdTnWTloLFq6tHUtfmKfmkIYnzmv
         5yNyTbR0DKt3cXtXsWwTrS/k6wF+sMFrM6mK0WipgcggFvO0VXnhhURkqMchal4uOjYo
         mmvySF2cFIomJkvYqr1UEtJNt8LpVR6QPYtAo7+K7UV0IzV8Ua0FUDnla7ODn6JCkjRh
         2qLlmU0SL/arVlpgKa1Xcwcj5W3ReB9AZauuvFFwOjT7VTWY+R8N1JWuPshLBkolqGNL
         +APE0g2sMB7pqum0WDC4DM6f8CiB2d8MMFQRUAaXFrv37NyeUCKUfgEHHvTF2+kNbkzZ
         Ugqw==
X-Forwarded-Encrypted: i=1; AKwUvBwRgRT9OPhE8eF9azuuq6eKhaZj9TOOhYAFUdlUk15lYDg82o9xu4AB8vDvYsn+Bcr1hwc6k8bram16ZgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWxZ4AK7cf+gCiL/WiNOu+h8FSbgXbnOe0c4JZf+1G4u6Vbbw5
	6WDfpaxxQV0reGDaAKXKcE5tMj5TtldEgCf0UtUuWQDF0N8min/rsRwc6HW7hTVbbYL8oEFbcGn
	1Ch68wmp5OQTdhy01urUGPmXKSvng8wWLPokkaZn8JR9GRpS8Mu4LUvrUxue64ucEZDEWLDw/ra
	8=
X-Gm-Gg: AYBFou2VHdehFhZ4OE8Mxo6daQjpqE/dO3sMJupW6foQ6osmQAX7fdtRba29QrPlJSc
	k/AzIs46DRqwjAEoDnqOR3gQlW1wXHcX4TbXvryAMKh04ltM+19V1dYY7f2hRMagVUv4zs8Svf3
	iBMg1vI68wdUbb729Zzv4WiG5pU0rv6FKWt7DcjjGvPgWORaDmwgKxUROynWD6XZw8h3FpDknIF
	b00GA7DW09vSChU+mwmQWoLhXDtExcnVJjug9uOyBohRyJ8GzT5FXtNNcTrd9VOERzFZ+I37qgv
	VTvkmZSWYeCV6HfW7fuyw9KYnjlByWDiWb0a0x8KSlpgbYy69kkswH35nST707qzJcdC0N2kM8B
	GV0e5lHBiU14ZvL91
X-Received: by 2002:a05:6122:2225:b0:5ea:bbd9:e33a with SMTP id 71dfb90a1353d-5eabbd9e95amr2468877e0c.11.1792501334710;
        Tue, 20 Oct 2026 06:02:14 -0700 (PDT)
X-Received: by 2002:a05:6122:2225:b0:5ea:bbd9:e33a with SMTP id 71dfb90a1353d-5eabbd9e95amr2468571e0c.11.1792501332538;
        Tue, 20 Oct 2026 06:02:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6393833f8f.17.2026.10.20.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:02:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:02:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
Message-ID: <xg74bfkwbpdqvo6roqpnufcffeidgghtnenghmvmyq5ugd4i23@oyl27c746qre>
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
 <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
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
In-Reply-To: <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
X-Proofpoint-ORIG-GUID: f3zZlZlK4vXSfrMJyM2SB3NZ2lAMmQV9
X-Proofpoint-GUID: f3zZlZlK4vXSfrMJyM2SB3NZ2lAMmQV9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX2qpcX2yo/GVR
 qD74EFrIsZY7A0zJv6MtzPvohElGqzdhB7LNoolojBWSx12l7KiMUp/4RZi1CSSx4DEVXVhxFQD
 49Q/vYtHOxRz4ou2idh2DmWAlXnqBQc=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad76658 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4I5MClDQAAAA:8 a=EUspDBNiAAAA:8 a=qo6UdcItuGezONPPF9wA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=1V3rjZ7Gd4_ILS_TCx9Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX5b/NX+Qk/oHz
 Xodx0H0aqWSaDHm7v/DTUXbZhyKdc2+TbNqPMqb7zEyFkU6/cMzkLllAJA4zlMBysHCwRtKLEqB
 6DBh/Au2HhdqWcRBjkRvTH1MI/1Lf4UG/Y0ht3i4V+Yx3aUCWFD8lzThE/uY9NhkzLxxnXPdUwq
 9+flCN+IKqLuSERCMCBWtpH1phaZ37DtijC9PgX+OR0XdLQqGzyZHeFwcSo1NrMzCNaTm4EUR8D
 6p/vz4e2MVcHqxU9BE1UIO/g1dBBuE7R/rXt+EoHsGmWjduGi7uw2nqG9qqFdCpkodj5pg89vAP
 nv5Ce2AMNKUbpCn9vnr3aqqYT7IX4pwXQvTX2u7bNOQlXUi9qmx+eskWXWzAy21dkjYYpRBZ1Z4
 iRqL5uqURso3W5ami9MdwXbbSlQy6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200051

On 26-10-19 17:47:23, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.
> 
> This device's configuration is based on the 'MTP' from Qualcomm,
> as is also referenced in the downstream sources. Apart from the
> usual differences (i.e. codecs, panel), it also uses the newer
> WCN7860 (peach) connectivity chip, which is why WiFi/BT are not
> brought up.
> 
> The difference between the EEA and the Chinese model is the battery
> capacity, notably, the EEA model has a smaller 6000 mAh battery when
> compared to the CN 6800 mAh SiC battery.
> 
> Currently implemented features are:
>  - Booting
>  - Power and volume keys
>  - Storage (UFS)
>  - USB-C Peripheral and Host modes
>  - GPU
>  - Fuel gauge
>  - ADSP, CDSP, SoCCP remote processors
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
