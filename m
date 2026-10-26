Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031688;
	b=W0N24llZ2BfneSBMzzw59TnXCVbqNI9inIk45Dlf8DU4DVAmB1+20zBRL0/wUrPXeWDn
	 Gkj+2KPp7u9ACTyXHQRWtfX+BA1582z0FcTZkBJbFRBZAWcq2uZ+6aDdMORiN46uhT+s/
	 9ytiFBMtBMUNsaQ15QH5hywLDkt/X5NHC7uhygc939Jc0yadvk7yRQkUs6jjA/Fj0kxCh
	 R0lx33JGL2RaARJC2xIbTAtF9zPDujc4oU5JyFyEVdGV2EB6qVSy+Jk/n3Uii01L4DktH
	 DbbqrOJZaMka2VYRyL9pngaaqDDpn+9z/C2c6tBe2ywYc8OoyZsgmwQl2Dp+KkaBB+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
	b=Cr90Homjya6V+zTPS+sTo6MULxdVz/uuHl0sXc1o5xy8BF8DzCWcQD9XrizIwrSlKjjb
	 RU4feLpyza3o+hayFJ5R/Hn2jUSMqISrg5m9/JKP1Zq7nOQQEkyF/NthnQlK8ihhHlnAx
	 XJynQwCUeYwUIGo/aNDRZb0bfAqYKp6s6VC8oDQChWbB4ioduNojzSm97N7i07bgJrkKx
	 V1AIhah8KrrfmHs7htmyU0vUJxoQ+3Jl1NpS8/FDJsTRBnDrV1/TK6KH4InbP9ia6C59n
	 4ySykr8JVPcpUChQCjhuur3NS3qiY9BYaTS+NkDqynYt5fTto/GPGBYOlOJbztsCd/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMf6z+Av;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZkI5UAR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FB2606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FB2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMf6z+Av;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZkI5UAR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvj4S4098777
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=; b=HMf6z+Av4hsat1cA
	E3TYRAuFE6bynDgGA8f71po/6+SAGAO6MDF1/HqNk7cHqyqblTeLpKvmFLKes1e3
	7bVyqoquN5l56T2gNhimVi33stpXnVhGaWQmr/+ApfPwemVjDK8ARAR5IbBYGiIH
	mST8vn91Y9x2mJMg5onTlad172Rm5x1IAehPtnbBkuVLSl4bqFBjqjEbHXh7sjlR
	whQpDJGjjNc7Rv9GxSpwUAXIsA6UpRLhOo2VTmbEiis6nte3XQT0qgA6i7iXp+Tm
	gjm5mFYVB8okc+sur/M9D2T5+8Z0Ku3mcuwmkbj3dXkT2eOyjdjFvlGd/iq4O8PO
	LcGstg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91ga0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso9206685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031686; x=1793636486; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
        b=JZkI5UARFfwrUrgZsPPCGXF5PcTCU8oRvU+BpBoH9CSUpx4JsL7Wnsk8mYaU6zczeb
         pU1VIHs05E9aDtw/iK5k1iG76ZPknUbOVfV9vq1x5cOt6aThmoaZxBiMCNUosxV0dz5b
         0Gb1WyiRx9AAHnjC11V0UQj0Brme/9mxypjhSrZJm8JlP/5r/iBqby0Sc/YUFjnxOY9p
         f7jviSZXojXBK3Wjm96LYSmZOCUOc7AjXbUiNACwqNdrhRJVS7zd8YZmF69jiBTQhKB+
         F04FU+lwu5PPuylayylaU9Iul9Cm96Qj+Xvfg8ADt90V3B9k2pvdVuRW3/mk8m4itKRS
         b8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031686; x=1793636486;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
        b=eNQ1szTrO3NTxlA8hxKLW+ZXu90qwp7bPnPlhFRvBNBNVt57Z7brlkyVRJj7MJXTyT
         mrmGf/UrhIvwSMyA8gXqGynmWP/uE8QwHsyqu69T6qtJAZFbupy8mtT4BETkDfGvSKIj
         jx0l5dHVk/KfdNvtMZ2cvwuHqRUwDOW2w49ilvmTdPxhiYrYpyyEo54K48uk0sN7++uO
         uO6ysWHGVRuJwczmhkh3YOGctEtZDzrGme/t4f7orY2SWx0mUKtJuZkNMkdB5LUbJliW
         p5YYCjUtIrfhEr36968q0EAVFlT4Bo+BZ9i0Hq0Lu7jlPFZH1yxchgKxAGOPcx3euh7J
         T4LA==
X-Forwarded-Encrypted: i=1; AKwUvBxTDX8S6GgjwKF8fMsjaI4sbanUVySyI50R4uF01FaNyU9CcPsrPAdD1AC7E+8ZVfS4OYwEM7l8ejEQh0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgw6TbDEy31xruUZDsPzS97mNINu8FC+GJVfFcS095XcnOFCrr
	03MZvVXsFjJZW+XQJMpDw7V9vo4E+VlawhSdrDGbaVi9qAOFL/xYv6gLo6mWffVdNiIL1LHsRYf
	Xr2PNXeSh5JShsaDBDLb9NXaolsq4HhXGO2mnEK7AIqUQq+BGLV4G5j3rHcqTr07UEAc=
X-Gm-Gg: AYBFou364+U6T1SaLT52ltwl/frhsjail3ystvzm45k/zwwj4OD5r1N0wKToO6hCs/G
	YZbVpQFrzU9dgpgVP50VEHnC1YXKhSF+T84K6XvyeYq/AuojytWN1WTj8GwfUdPDvPpBcAhmSW3
	9VVNdbrFSaspJv0GQqTI5oNimr8zZbOFZKlLVMLpLDEnrpUZQXPwymw/Hu88vfpligqFFxqPB/3
	y9KkPHgQFcgD7FcvOfOhUcoPWODQvcl2xGep0UB/zWLm6EnQntc0qS7Kx1QAQ6bMtvX9cbl4MOS
	E572/oxW81utoWemARd8Xgb+CoHjUxXwK4D7v6gR3buZVQbAQBBGxOz5LOpbDETPjRg3hXA9wC+
	TyF8Agn1ZzQ==
X-Received: by 2002:a05:620a:40cb:b0:93e:5677:317b with SMTP id af79cd13be357-943f4b9fd77mr27075385a.25.1793031686277;
        Mon, 26 Oct 2026 09:21:26 -0700 (PDT)
X-Received: by 2002:a05:620a:40cb:b0:93e:5677:317b with SMTP id af79cd13be357-943f4b9fd77mr27069885a.25.1793031685633;
        Mon, 26 Oct 2026 09:21:25 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm16672814f8f.23.2026.10.26.09.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:21:24 -0700 (PDT)
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add initial Nothing Phone (4a)
 Pro support
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011095221.24767-3-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
 <20261011095221.24767-3-oleksiionchul@gmail.com>
Date: Mon, 26 Oct 2026 18:21:19 +0200
Message-Id: <179303167977.154232.6751719629027662314.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BJxzzb/3UaiKcQDTKgmEhodid+jkh7uF5gQsqTcbik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq334DjMKzinGJHiYUKdzYfyhvoZ1kX1hcG9DNr
 ooRk4ZF/9mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9+AwAKCRAbX0TJAJUV
 Vlj1EADNmsMb0hjiKR7BPwXUNIwFTvxkeYgpO1OMPW6XHeOko0EWQtWqUQ+XMaD7klaaNlD8Xgx
 4KGN69Osj+KSoFFQfRpPHt9Jpayv2x+TUgfmnKw15q9zy5WaycELIn7DfEdzSQqu7CbJQwKxEhc
 2IoWZ0FcQl3JoRxZhigLXqLLGkL/Y0JfjmG+6Mqwx1XSWRzrgD7SMwaU8T5phzaH0x7i4XSx3E7
 uLkW5JJ08DPq45SADyhrziA1a5Kjfq8m8qyVKn79GGLifOvt/rQpDGjzy8PNFdtICzoo6VFg/T9
 SNCF7FtipNxPhgiQpLQyHGlUTG4fEWexPF+yOUFwxJ2Kow+jfRvDdL8FWvzSGjf9XCqtIicMFMV
 7HyqChaVMHihMLMEQ1oVcZ6s+ODr9/20Ls69tKJmCk9yVdytdpAJWwcrFowYeYxkDy+Cjc1Ojl2
 7dEhwwJphPtCWkXZT2v9lGD1E7RoIK4YGI8XZ4KPLwrigy4tGN9VP7UbsqE6fKYCmQ0d3YrcuGC
 5Nfg+kc6tcFzyFMpjfagSi28vyEt+CRLh8tPrBh9ywhgIjCsjY4lbyk14KySB+vKDvEvlTF6qh2
 VD8XaMVIxn/JjfRgthLosfLOKPJaU891pZTByX/LvibES8F+Ugr4CwABya67jImz45jugpNK7CD
 BIcyPxY/i9vx0GQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXxfp3gWQMxQ5r
 sZxS+T00AdeSgjdHqTfofARM7aypTUg3T0YljsjssHOzM1o5Q3FpqKr+j+1oXs2DhvnquQ3c8pW
 1jHD45y401XS0xcF7u3bqZWJaWCYls9IW3cE6lRtSpMDa7a5drj78x1opqLbT5bd9OFn6O0SR/w
 +W4XrbNR7KOL4P0ydM/dzKUIZqPkl7pzOYXQ2F1Eep5DzYIau0e8o6vSwkKFIpL4UuYNrKril9b
 axfmr/KWOhDH7R7Nz1OaggdZuEWwVqJ67PyfbpzXlFDfzjEoOXG+n9qKRR1kre+Oz/tAu6JxZ1X
 8KhjmPjXg2ZkD7q6+G0q7j1yrPzEBNu1ZN7HBfxVamyhQPRMyk2FN9RaGGXT9eKMRmD7P/FWiFt
 Jpnq6+VS7DdtOUbbdh/TqGxCxYvxGG9mfcXj9nKJl2Jr5E1vqyQY6dfTi9palSPXDTPS5lyIyRJ
 Gh1S11PY4J8M36rRMQg==
X-Proofpoint-ORIG-GUID: ZlMiaQxTAytwKjXfz0Kfv0B8bkw7Ridb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX/PYbgQGIIptO
 s/BllJ6yJOhZgRFa4ORub14oR3NeYqSdmtGv/SRHZY688tfQ30zEufXazCyLzi1H7cKAmXJkq0p
 zqHF/ofNerzTQQhnVKJnK8ZYW1UnGA4=
X-Proofpoint-GUID: ZlMiaQxTAytwKjXfz0Kfv0B8bkw7Ridb
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf7e07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MgpTML6CSb87B1fD_mQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On Sun, 11 Oct 2026 11:52:21 +0200, Oleksii Onchul <oleksiionchul@gmail.com> wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> Describe the UART, GPIO keys and reserved memory, including ramoops.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
