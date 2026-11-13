Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563684;
	b=Dsa6TjyPgZKKbzsY8veiLW2rKCbFIbXyp4wGSVJXnsnxBkN0i7ybeYPNzgAlDn041aJR
	 UFWdIOm/puordjfNP73ghccW87outH19OxEswDB/GOZYRdCesXSYHUuqlN9k8J5ij6eee
	 LFnCW8Nei9F/zkDOsD+3ZC+htaclYIW4bfOmdUbculMcWLRxqwY9CGXvwlEor1HhbgV3l
	 yGGzo47TTHNB0/lzHA/GelfWzA5FFYG4nOAfxRho6E8fXyxV1HxPzGTUVgA/SqrPmkE5E
	 McwGnuAJ1/MqkUwm2qkTQpL9EjVJesmpHWqc/DsFhemjwkxTrGsofmL+A9Nmla0cpdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
	b=qpDOP20Zjg8wnU4U8dB4A1g84iKhdTu+FtaPp+tpm4HUDC6dp3Vp/UN572L6UypNdxi8
	 22hRLqpSTaieZ9vZOpfYNlEd1x1x56dUW1SK4h4ONbJTRgo/5p2XKh79TGsJgfULWRGHA
	 A+kKXs9j7w7dpi5qPAU6doNHvu2AJvRw/32DSiKIWtHMUDpNw9HkmeGAc1S5M0R2mCpbc
	 j1dHfquJmmn7I7Ld8Wmew60g3uHA6rx1bwkfpEnxGRwrSjcUi0cK1mSmJz0Ug0jCbHRAB
	 hBvoHIxOfuuGF3Wm1eLUXxgHOVZ3izaxsZAwPFz0LJVAtdtKYhzAEZpqkAmx4+mF2Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/9+4myU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLBeZ0De;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6D9606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C6D9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/9+4myU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLBeZ0De
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VKoD2515663
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=; b=n/9+4myUxHJ2L4b3
	pyRYjtpmX9OVXRcZ4u280wcXS0Wh6f2eEI0+P3AfccewIz2022OOhjrNuJYYSAPo
	Pwin2RNBFEMUw85K9fngCx1mpeZXl/my9cxXS/uAkALam5gVWNwJ2+ksOCxZD1rO
	NZeN+ZuRx0jYzszyM5TqB1YFgM2z+0iZT/B7/SQ+sb0TAAbEaZ1oNJxU4C0uH95X
	5LqOoJiRM6tP+8b/8xwi/33ND75GBqiBf5F9ItCeF+ZSI6NpRs+opJRgIab/7/XK
	8fS2QaneQA0RIfIlxcmytR1czXWTIv7vCoGBsoAhN8rKUyD4a9g8yKm+QDih6YAx
	p1q1Uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbgsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:54:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso7152685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563682; cv=none;
        d=google.com; s=arc-20260327;
        b=DJCCrl5QUdQhvU33IjBRqDnxnO+VXbxjKsvPQuv2QMkjrLVvGj+qVnYr7edLrVNIyd
         eABMNFfOM9lcRluiObDJiV+VR/0F7t+3SV7VUbBXkA1IMuciMZ2ueGCrC82eE/g9S1E4
         /fdrg0wiU07ox7cLddkU+6UShuK5n1KgehEPr9HGIwHUcb4oqrps33T+V6sidfU+Dtls
         EJdtyp5uRaHRPZR9t3km4QnJjKCe0CG2hg215vGUffMT/8QDxBL5uqkQTA0/wcnT7EYO
         zgbVOPYVjtsk/MXhgv+Xu/F1OCRPAzeMsAUC82TVADr2y/lHKgEkCKgKPmP/xmKYoqde
         nSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        fh=qYpFZjMi1SUcxLzkU4jXqmDX/EQrvoWJsq28ohq+RUY=;
        b=VfR9YnmXQWQjUy5DOatH0JrgDnqy8Y8JZQPhuz1GVlMYGR/8n2H87HtUs3rngEBhbq
         ORVEu43OGu1BhXDuLuM7ikBOC0hTiTTUwJD+ESKKYwjbrFYDV86zU80onGxZPbjzVtJK
         nOqXwAi48bI5kLMjcQvlACULFYMcu3nfYdkn1YkK8IJaYoLGl0xinjVQqeyIN4KmxM0F
         8I6SSKDA/zAHRBHNInwBZYQ5NZ3yjravRuGfCtPgQNRbGZrdZyyUJoU3mnt8O28/QUmQ
         4dXEh/d0tGu8UYhzdTsnzB6m/dnWS+RQkScIFdECsG4BmwkGiEkMGS9mNZqOlkcfj07X
         c2pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794563682; x=1795168482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=RLBeZ0De+7RfEvY/cOZx6uuhMrok2LGsjpSfyI9vkMVjG+2kzDGSlBwlDBJuHVYh7i
         Lpw1rdz5m8VFzNV+vd7Y7HOLyeLlfEZu63TB6K1OfXOHJwBigAXiCUFKVMiXK5NYkqKg
         D9a5enkb/wVX2ZstPRP0v3SykFvQASPXZe+RAkKB5UGcwe7YJkj0HRZPG5oC51eeCVUK
         r2COxceOd0Rzvs8eiuuIFDsbxRr+xAxktiPn0tl8o4OSv11iidiApFjZDKOm78ZmWpr+
         8D5e/e3ADFKmQo13eh7G2AjnjWTgMNRumYcgtedVcRy5v0hFgIVJQGSVmfPAiei3xqkw
         wPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563682; x=1795168482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=lF7zqqJY4sl1q3IIUawaZArnTu4/Mz26KLM7A3apxzow3IXY12Yr4Noq3DDYW2ptFQ
         Z4k8Y0ulfE3D3EICiXJWZODVFJT9ENgMAug1mfPY2k3JWox5h8nSG+nlyQPdWrRVocg2
         arjAe9njWr6MNd5WtqmK65pSLu3eEXqbb1n+AN0/uNT2tab4CAdnAE+8DS0Fv3cNtPD3
         r0ju4PJR8xIMCYPqdWTV3SpOS6PS0G5GTH/qNGy6yqafW9p96hlwYe11xcZ8DzXDfYJk
         k2kmD8J92EFzHT8kTzJNemCoKDaI+XUVjbvtK1HZvVG6kRS90x0Ttyeyz+3wGPdO2O6T
         2ZWg==
X-Forwarded-Encrypted: i=1; AL+hErFYzAVASfzSX6b6nRgzDqaW3rTuZ5P7X/ZBdv/eFEPWzjT/MEyAZNNe7DmrO7iyuK4wn0IbLzlHZfTpf9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y9v03vYnX27DXBpw1S6lbhToc4sBqfI4WXgpWN9cqUyW6ZvG4
	pPDXJs3V1rnupO0VWs6sykD1uJZ/Lf9f0DEqJPRm8t0cMFQEWrnzxKXiGL48WKE4bDIGD3Lo/EW
	HDn5FRx+WzWv/im4T5viJ/qorV57zxtfx1NvAqPFfkY1rXPF+sbbXdcFXwVgHolei/nRXjpsPh/
	wNkg59Bci6MkHjScAtuYyN2nlyxADuHR1cAC4W+PptYA==
X-Gm-Gg: AYBFou0MFzFiD9DT0lKsHKqd6/VxHPwrm8ommSLUbTBd0TmiMLnTrja4ygzbPunTq5a
	BJDDBZRNw9s6yaey5ytr1nyhfuvn6W9uR+mClaeWLdOOOxaT1YcFCUcIA+2xRj9QObn/cDxDBTQ
	AEkK5iQhj3VQnpQk02X0PcI2KR2UPpVhkOO5eEdHipppQzEIEVRptBnI3KRnQLEmNcLX+/H6yrU
	1dQGL/cQLTDcfSGYhXKp9YT8DxFYUj+raKCYVUHAAH9K25I+MG1sa7tqgRsnvGLyt5RyvsH7rXk
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id af79cd13be357-9494baf6dc6mr335666185a.14.1794563681660;
        Fri, 13 Nov 2026 01:54:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id
 af79cd13be357-9494baf6dc6mr335664185a.14.1794563681101; Fri, 13 Nov 2026
 01:54:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com> <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:54:30 +0100
X-Gm-Features: AclHuK--hQiioKQaB_FA-5QovlmCsdFTukadEaIJn5s3vWyrV73NAS_u6OCE7JU
Message-ID: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6de62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=x832WoCsc11X-eU8GdcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2Gjp7b6PgLYoGpD0h5HvEJCh5xO7_4Bi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfX3WdoOu9QX8L9
 nAtNgxhVDDv+6qe5UAqq6OFTZ2N0qQ/q/TLHzMmxenXtvAWGwPY1l5UwYl2cCp1omQUgDGRhKSy
 b58hWCVkycJac/PyxCU8CH/GAwX16yJeyQIfasgWb2FkVqIqO5d/bE9JQ08T5JrakJTUxe6plbY
 JJL8lmeL0Sr5O/t2xAJLjOeqBAQRDvRhl5yfaNxqzj5fUvIMSjjjhlbH2sbEAW1rCe6aNAITww5
 N3wgserxtrtNmcwNdDfQJGFawCnKKWOfXyD9SGH34rwX2fEkE79XN0DzrZGbnIBvDvnEGgHAXLM
 m5tn3MF1CYfwz/j+3U0GEIw2hhZCnIzHb2Mcicrujt5dEjcgCqPOVajOEOHCjbI13G40r2US8Rf
 wW6WqHa7LPV0659dHepMkFHEtg3qkZ2LxTzQ8oLIrrWbRVFhrF4GhLxvYpjT4Qn+QA6+TwGXt5v
 A4KShJCngjtisWtd4uQ==
X-Proofpoint-ORIG-GUID: 2Gjp7b6PgLYoGpD0h5HvEJCh5xO7_4Bi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfX4zcDHELbQ543
 rBP7lrVTZpdUNVuj38+wovFwzMQwt2Pc+tpDgU/61JvStc2Cj5uKGqfPXBtzRmuPuo7bTwu7o12
 2gG1LyZOHg9UO86a7xe5jIYY1doHguo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130039

On Fri, Nov 13, 2026 at 9:20=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
> binding.
>
> Limit the allowed ports to port@0 through port@2 and update the example
> to use port@2 for the third CSI2 PHY connection.

I know you put this in the cover letter but you should probably
explain here why you think it's ok to break the backward
compatibility.
Even if the binding is recent and we don't have in-tree users yet, you
may encounter pushback on this.

Regards,
Loic

>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++--=
-
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55=
ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>        CSI input ports.
>
>      patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>
> @@ -288,8 +288,8 @@ examples:
>                      };
>                  };
>
> -                port@3 {
> -                    reg =3D <3>;
> +                port@2 {
> +                    reg =3D <2>;
>                      camss_csiphy4_ep: endpoint {
>                          data-lanes =3D <1 2 3 4>;
>                          remote-endpoint =3D <&csiphy4_out>;
>
> --
> 2.34.1
>
