Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302175;
	b=uMF1OIxlB0U0asKj8XxyhXJxq4+0sg/G/s1WCg+R4WXS8pyagQcrh2l6LCI3BUnkFQri
	 STCqJhnpxPnx9Co0xFwaxCgvFj+BEFjUvn8Jl0cf3i8a+OSIB/X0DQt0ygtgujcg8ov51
	 8e4EMlXFIvcy60R2GfQU6NsATT/HGApQZKEp3j/kNxpfcwoNeGZIRLFK5+lT+XOd7Xcke
	 UWJ7fZ8psDDnbXLKRN9MzGSgJETeakRpqa86Pm1kS+nFFG1+oUhjhJSMnFpMsuNeyzG+r
	 714FnVw3lFRKgZ59E4VQKYXmGfHgjuZHGQvhE8M2yQH9xwC+3flfMXXyVo7nprkaq8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
	b=j78+9Uqc8iTTPtueZ5JOwknjpIc2y8Bromt8N9mRnZmBp46+SoCJqayyPMwZbK3UM25I
	 NLboSue40iZNi7uedjJC6sRnFkCo7fpwFNTMt9BpmwpyXM7nf/qCCw7Q7pcIQq9I1O4rz
	 e/BxxsyiTSNsIXHKj6pRNFsk4ZxRkiKgn0O4NjRoo8lt6wcXyIA222Zww9kmXRi0fadOH
	 diIZNmBgubAVMikTYCxrRDfoqztkQsdX6xUNPwmWMedG8PJxGmyO/6qdJIgAHu9wqgMTv
	 PsmBsD2bq17KanZe2rd0kqRaNMbCWLpyhuUW4cDpGltliNs+Df+g4g/RuKct4XEt0BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BEB606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BEB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W31g2833612
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=; b=M1xZXcZkHdP5kZRa
	S7BjIj09qSnLZ6/gl4fhESylDLOZgqgobSQb83wNpE6n9kYhv3shZxrQ8MH4/VyN
	l2g5F3mkbnwqKn7d45aCWZ4F5np+d2PdCETTR3OvyqL5Fh31fZfwAP2Uif4/j8Ff
	BT9S9kVCMwqsU0py68A33cdwQWwE26w5joeXhv4JKYv9tSxe9Uzbr2qBZeCPpdsq
	hOxgahLFzUhm+kOX2Ydh4am5OULhrpF0ojIhZo6VnN7wQwDjgLqA7bKAelN/AHjO
	YJX3iF8iOR6dwEbAGWsf3e5fnqKcYQHxLIY5Dftt8Os2KKL2aYAWL2WwjgMdXkfS
	8KFVrA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufr604-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so340464285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302172; x=1794906972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=VPgoMVHe0tYN12oRa/KuAaocdtVbOjLTamwzxlhCyx+oMKmX4c42ahsw3vaa3fyQ6O
         sLMamX2RawLejZm1Da0Wis2qDEWQyGWlnOHzRXnECxyZQJhA/VxOMQ64kiS4zZzA6/qI
         NQVHFfSjBsPjDXVEuREh28jUH8fQ5/APUDjQHv1/BRpGh0DRnqu0lFRDN05VwsNa/NUg
         3maEtDg53YAYyORvX1J8DLD8dRpg1mLMASsu6c3G6pbayBTcyGTvIbmgTmOvOQt2oroP
         gm0DTPhE4XPGtXfyUuyY1NIESyT1W+vKDqnooQEUJ8yx1MQL4taBmEUgZ2yZ5xh8QGO2
         nT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302172; x=1794906972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=Q4YZXiFDXBwsjGAOrMTv6q7yUVFv4VsrmvK7XI4ss4QhL/E+PCX5XcNmPZ8HYs887y
         WyDvxAOpNbDsshxcB8oJz46th8GJ6PqK7kr11GmsxxSmNLVmFtt6XDBvKBSPF0pkjT1p
         KVHJsQaZ34t5AyyUqCHiVS+8IZaU8QN4E7gG8DDK1uqQ26UUGUBLTqI/HVWGlz1jZ1ha
         Nip2ZxIi7Och+Tx63fitoSA2z2THD9jwSIar7+AQeS8gR0ytmLTS0NKQMrgjPIrmL4Ej
         VhrkNgxgXytFk61ELq6iVk02E7+6GzmSJF5FcYBjR/MVh+Vxi7otP4cTrJdZXb4aDf6t
         +pjg==
X-Forwarded-Encrypted: i=1; AL+hErG+fFqvhamAl/0oKY9pyiFauQ1rKri0p26+ptP47DxIp9eaSOTL1utgl5VxNGP7uJwqxHTb9TljQbNuNrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z81FyzjSDlTLe8hb4NZNhefms/7JAnx9e+nOXy8D15D3V1VeUH+
	K/q3b4JC2Lr7ew3zwCok22vdApqmQ6W2obRnoCEHvOwAVv0liHwbm0GSU1YilZoAUhPxswXjqY8
	ZboD7hgsAdFk/tK35lX9t/Y0psnZcoOJq27KpE6QlCc0LUS8CH9qbMHfFgUOll48Y3P4=
X-Gm-Gg: AYBFou1jJEt82ziSqx81andMBkj7LspYGK/plvdnzgtP0XTI5f3sqU9ta4O5GMT7iX7
	gU/BS2by5ZaOFGAiC4+aNrlpE1/YuDP3v0ks+I5iWYHRCfJe9A5ib59KeumWi7uJ8L67ey7CQuI
	4LKhoWecF2UU806cstGOtyVVtBcHDdVchkaTp7sqLxXtDcjEallUaBS7oAD8IUGQ2qzqdxX49C3
	Oxnh6XuW+9l+5uYql2WVnanvazq1MNeogPY989AzX2/KCagimwHnLuXLHPd6b+pEWKPX60Py6Sn
	nphuPjBGw2bktEs05DbX/sW3HubwGcxI72ZJHZsnVdfPAd+rmurl3tvd9iDE1CZUbH1TMJLHxsC
	Y+5eioi23q5xCz4uxDZ3xZO1ZZnUMroEP7K51jAGZgdylZ+ANUhfvNfFyrCRqFiiNTUUUCsN11L
	nw
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319498585a.36.1794302172344;
        Tue, 10 Nov 2026 01:16:12 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319496985a.36.1794302171899;
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm3833527f8f.44.2026.11.10.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
Date: Tue, 10 Nov 2026 10:16:08 +0100
Message-ID: <179430216678.5751.5703304035925028288.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7tcp93sdmVad5GhkwZQqz1cKyKoHyhgn
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2e0dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qIsIWIQgnqTSJORAk48A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7tcp93sdmVad5GhkwZQqz1cKyKoHyhgn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX6T0Kr333yYVH
 2sqJQqjSBJGPi4+9HNFg1Zhnhdp34B2T8UVlh07QfqepsLPSkwFiv5X1IOXXm9ATGD/kkbyAQQe
 Q21ca6DCOoyyYEBGk/5t78OSs3zADJc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX5nBp9A3NR06T
 nTllZHBQfGiRvWSgL/TtbDA8Mji00oi35+vAEFmutIeNOsYNIEdP/qx+C0yFa1+gbTpfehHFhZG
 tpxtS8xsraX+T7CmLKuyuuj+iK8XdQo98Q8LFe3oC2HoPec3HoNd1HFG6QnalHJOb7iSyOcx5yP
 NuEMLYODHekV+m5NR7owMkHEcsC4MqVC2yPjNIS44JOSa6uvOcIUtKZ49sgmL0uOU4ycFdC+D3G
 VN8Hj0zHcgMQYjzXsSillXyVXkr9R9HRCtXUl634s3RHzRgaWeR3/1/Yez0QCkCwnnVR0Uv4NW0
 lLWavaRPZiyixYpt8xs4Ygf7hM62dvXz2t+DswQyTBXMn7aA4wqbUYemT/pnUiVOtB0R3MLEYZh
 ESi/esovtT2CIA4Ieo7x19YFWNz/AEMiU4OaXUyLUjJfvPxA3FMML9Mdvbcsa8bSn1Vh/NbQP4Q
 J2bSl3mJPxsyscQ2hBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100036


On Mon, 09 Nov 2026 16:57:25 +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
      https://git.kernel.org/brgl/c/54820cf15cbf657df81b10838d8d208d01d6c3c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
