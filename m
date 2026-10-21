Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591232;
	b=DnNe2IsugkD+R1dm9HWFZ7//IM/2CKPxiwU21bz4XqGI+nSe5CtA3w/tsFAlk6vJgRLf
	 XOHCxW7Wn9WqsUCsaoRrOiQaXWSICAc9xs2UdXpqwnth7+E515QsO2UPZ1YfmVoAEUwt6
	 hGZgxzrdt++KwEEfT287RcQzlhavFyK1C6fchIcoin8+JXjQMd9gp7RfDHfcB5ST5QhoQ
	 T+sKR+jCWPVYlvKJKNjzTN6D1Xzy9oyymtklmqZQOaSbplw5FDNpbAc1GxfrcCXJNR+DI
	 I1WExuTAHnAqLD/bEHCNe5k5zBW/Y6rV4wMDfVI3XNl+Tg7ri53QWzAAcnTDFvZBJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
	b=Mpa68mgN1jJg8peZdw98/5ZdYMQ0wjmkR6CYlU+TuiLiVCe8bcmWrL+LNA7dD9JD8n68
	 91C8DEG7J2UDzRekbXOA6yRftEITk99Ld5gWRbLf+U4ansSgVf6cIcltAhO5xTnnY4WO/
	 IBehyaGa+HIXJ4dDAMVlKlq9Jj8olee5tfMCWGQy9hJISGrog0dZx4UPdUF5rL2xUjxha
	 2QnXRlaTU0+9RnjM3OJN1f8T3yYmrGfa1IsE4jLTDuAkuE5p2beGa9dtz+Q7CQ7t0ujLK
	 aQkcDu/KKKYbCtfNlob/4hJ5JmtlDODWe6lhFNZTaSPQXw6NqHbh5PMDoBZxAuFUtxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EQsrY/5P";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FA606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQsrY/5P
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgNiQ978101
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=; b=anFs3YwuuX1o37vW
	4zYwv5s5aGMgXz8XlFBBMG+cu/YjA00QUe6oESLTHCOM1WL0EfNjYPu/OCUcz20L
	woYdt0/5SoOV92XMti0q0YpmZPOl5UEeGCQ0zuUYY9r65N+MVWh6Gm7AKqU/LmdA
	xBQ0L6lxlHw3+1nSiTk+vmylMLLa/WD9kZRa/FxpC+U4mIVl179fBN5Dxccz6hOp
	5pfqk5yB49HeeXBBo6RhTMZkaq2QnELVvhaduiN2hLykk2eQK4g/qWh/vQuNHYDM
	l/5tPvo+59rV1uX4nzAUDK+UPxqStx4APjpKYhbdDH3Fl3JTb0kLRoORSHBLUiB5
	L/utcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03fme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:00:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso20885385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591230; x=1793196030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=EQsrY/5PSNz7Ep85TauZxetW+a4dPVZufNxcgOZjDkoZOZPGnPgbJtskyeL3J4O4/i
         w8eM0fzjTPCJ5ukFV8/tUoBTuyW0/kmKzTjEXubotbwWCNRoJXJOb5DWM5ihgqSZfsl1
         FAWlBxxYGm4ETnLFnclpTJf/z6jLNgTJhBrMyc73vEdv8DteL/ptKJUaMGt+MbLp01IN
         hMvq40Xjrysaw1Fh283v2QWX0cZtZiDzhU7SMJhCg2FeE3yUI7cZxF/OhfAFvWwc7Fer
         pH5xxQTkLbZdKxHDrUV1iTGGp5G29BSPUOOmppjb+rcjt5YdWhvRkc6w5S9uTKK6+194
         6NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591230; x=1793196030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=c7KBAZAZbNBbkwbSejTjiuo4CTFOR356uZlmmBXkyQ3M0Moms9Yp7T+3Ire745QjE6
         Amyj5UqHZz5VNeCp+X2fRNyDwZYP96sSjfPhF0DHwwZGTL8mH5OQnZ+nMWJlbmTyXf2S
         aTpn6k9gadK/mMtEWD392Yqk4QzxYGBgHASi9C7vMfrquZrueHkkIwMNCgpYcltnyzdY
         2pcrORCDECLzgVV6unNXU5y8ByKarCMwGvN6/jm8962hvbz9Ci0Jlqb1vvfkW7CzjxuP
         6NB0f6LYNe4ICb2VOcistyYUESP6Wp3dGHzmAfNiPX94ZNXI/zP1W+Esg1OSyTaDmaNY
         HdWA==
X-Forwarded-Encrypted: i=1; AKwUvBwz8+Bebar6VSB2unB0RFTuDX32c3InZKQuvypW9ZjvhzEkqPEorBFWcQN+wZYEK/DlbJ6ZU6YPGnKWhhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5mvoEif0h2X8CRSG8rGOXozhLM/Nuh+xZpnL52hvvvAd7+33O
	r2m8nAf+2qlAk8o0tIWqmNXCQBaKt9pUkAjLaLRwEhHURe2pLQb4/Gy/XYulzL3eioO62ZypSYR
	v04rFSmxGImRPxXY11ZflRumwboQR9EznxqOI0VwgdlpFq+AgWsbl7b8Jf2Hl3C0YyAQ=
X-Gm-Gg: AYBFou0odVCYEABAJd/6gawdL87+d960rMFjwveMVhnsaqmdauN/96kEjq4IrYkeI7E
	ZlcGlwifl5tR3Z4Efpvrx5EkOTPqIimdT0EfXnsARY9lNO3LyuJWo9OPa/4cVWK/2TptnOSDsIU
	Kk4Q5u8wv2NqjYwQQiBeht3sbfr1mZCLLZ5YVUHRpkz+BLTT+/ROobDU7mcLIVnLXg3DGOZcZJX
	3I2HF+symhhAyq5739lzviCb0OCt8+xD2adfF8weTqjztWMElFhU7GWbPqVjcN0fFiU1SBu2Sfb
	rIhOCHn9N0BUqZ1xJwn1CNWUvnTRWeDbarCfzgLmqGjRlRIsl2hgHxVJArYX/cQQnCvjba+cNV1
	WcHc0Tx5+ZWuy81GDX0cgZA==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518058785a.6.1792591229827;
        Wed, 21 Oct 2026 07:00:29 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518034985a.6.1792591228650;
        Wed, 21 Oct 2026 07:00:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcc5sm7861166b.26.2026.10.21.07.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:00:27 -0700 (PDT)
Message-ID: <33d4d460-684b-4031-be45-3768e8d6c092@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:00:23 +0200
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
Subject: Re: [PATCH v21 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8c57f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RPG6soaBvYURGeOPBHsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXwlb35RMhNx5Y
 l+ld9G5UoNSfLq6/k1xZc1nFGlLwYx2LajKOF+yW/OKoVpYV8Pzr+Z5tu7BQr55Xuut78xE83Pf
 kAoofozs6gdhfVnWDOPFLLPwaU7fuMYhNQ8bunUM3gkTIcPx21RshRKSOh6N7i5NDc8uSPN3xso
 Mb+MtRadHKt8BPXd4kpX6mGuVLNJQmKW/U4VmcjL2SORF56PL6qMhYhDCsN5DN+N/f3MINlmGvI
 qKF6CkQQs2xmfweZzlHNzScc+NwRsQEqkpPJ6swzUm/zhfjTIHSt2+TdN9y2xqIW6G8CR8JalC4
 Na5pVan37HAFD/rL7iUYk/JcYHddPWuJgQlX3CagZCd6KUozDy287N5SDN4qJFrhpxCZWNXD3EY
 1HptB7LbF1bvsHtbu3V/yYfVPTwu02RQyDJk1Wl++3tITxDkuEhEI6swh6Vv09AGhvvwoaiILhZ
 Zs12zD9sNfRsCAlzCwQ==
X-Proofpoint-ORIG-GUID: kUmbkNG_w4zVXzn_m0uv1jwZ2H7Vem4R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX6I5yup7y9YO9
 1sAQBw0bPfe96xZdvBc2vuE6AgBPO04deyXuv5gcf5zM0upAGXe9m/+b0nqe0H/aP6NOMLciQiM
 QzvwmSEckdETC3ZW3UqF91E8vzc7VPg=
X-Proofpoint-GUID: kUmbkNG_w4zVXzn_m0uv1jwZ2H7Vem4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
