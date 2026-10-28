Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793205390;
	b=HMrPjh1tlgXABesgIiDL/SRLjAG8PW+C6zvjryoXPr8Axty9+RbPugSJY27/Uxs68p73
	 RdiZhp4lQPR3V7RjsBr9+6CBuG8iaK8UyAFrZ3vVgM18CrJ5DIU/IQcSwfH70fadfIkpF
	 Rfa/GJ0Avbs17j0vJmfnsnC7c7fva5J5+SBfQC6mmru3V1VN6rllWOqYRMMDLxDfXIfT5
	 76cI4fi9ncAO4kignVAZxU7i7WDFtq4q1iwtUtf3XOiCHzP9c4DHvwIK3xf5Vv7/0hMxy
	 xtJZF+bJ9w94wdtsHu2ozhRidiqEWU53+Ci+Fqq3OjhjAPLhkDfZ0Qp9UL4Ja4WymHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
	b=veGuNeUBNVXEtb1dNEy0uXl9ax9LC0ET6csOWs+5YOXFq6Pz4BDhiRDCqV/XYUca3Icv
	 pz6ii5TqfwWi13Ontj16rAGn1E5IOlf2Z8FyHBHqJtNYFJQ/afwYlPbUIXSyuG+ExmAHc
	 olQ0L79kRSExPKHlGmLQNLyeRJPb6hCRNE+zGbRD5Bhg/VwLA32kdZUUVvwG4XC4I5b1e
	 3ALBACAu39jAy/C+Ksn+LPHR/1wT9A9YicWv7MxhsTjScZ/JUrMvlXRFgwsZN3GoFZ3iy
	 mXEaX7aPutvXAp1z9GejNHcC9kVShdAv9ySZ6C7TrRx1WeRjkY///Agc5HqgED0vH9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOzzyruz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaDKKqAi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D1606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOzzyruz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaDKKqAi
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB49d2070703
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=; b=cOzzyruznl/3f+kd
	dF8gHc4ZnOyeaQuF2Wzu+i1zbM2sU17jP2pI56YSWaZCcndRivqpYnA0iUAF7t5R
	dR4koZyQ7itVu6aj1uhpT5IclnlqeqgIUaqnfh06ic7KoVCQLuUXSg+F6neRTUpg
	kJOqf99d1xlzYx5FxsO//GZMilHJvro/YNXBLW3h4yeCTXxlI1qd1ctEhF+vQJlZ
	8WXxQ19Ajyb/ZHNqXsa8wYI6oC8hR4bbBJr7hdQYpQh957PukZDYaXLKDTgZdcml
	3KMJjQ+hURRL8V4vbToS2yodWc4Tmgr/D+gm8enyenPi3XNO/L37vYWIhvhyV869
	hy7VDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7k8ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so197414385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793205387; cv=none;
        d=google.com; s=arc-20260327;
        b=XKoejG6UGoU6cNip72IyMVEIOcEFequDEs7YKYOQRk9mcYWl5Mhe2eo/sFtNxYmJW5
         +Uc1PbvYM2GmvRGD4PL+282njrJkv4HDt6LRuhI3W9fucOIeHp0VWjJLK2RRA55qBUpB
         mJRWLDc52BJiG/9Lv8Hboo/KJ8XJQw9vn/rQG72Jt7gYhbI8c3Q2cWIbPArK66sIdNwu
         N0edLEvJCMH11EC5MJRHWHd8un8+ggQ8G/a5Urc5updJRhoFqIYZePGVlirT3WdqlHkL
         trIkDZzyN1BBQh0y9fT+yys6bw830lNTvkmaVyGjfjfsr6kzHK1TK2a7kUYDTxV9IJaH
         DbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
        fh=mLD2EnotEib4bmRUmIJhpbYOorzufTb49XMKysP6p6Q=;
        b=OQCavHXtsOL6LrpA31gY9jVZN9gwJTkTD1AFHi2m5EIHfR+112bZMjyd/8q1SnFHId
         S8h3lnSMguR1/gvZsR5tS8U6Y2LV62Q8rmhFoQKXawqdLWPAcGdkOrWc3bfdRTlf8czM
         t0OPWt2GqxkUjLo64xZzW04vlpsMENY/BUzpj+0K/7WpLlkI3A/03d4GWPOBW4jJzs66
         EUc5S/BC0JLIzHRyqpJnAsDcd/wgVFVoNeVXL+VHhXGkKk4/UMWt7S4wND458avjmJ4S
         PymjRRhdmgsVb1nUrnmsbMPztomKxB26YZDUUlhZCsHCOvvVAdl1srMRwAmJZDZt4IgF
         DNdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793205387; x=1793810187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
        b=eaDKKqAimoKXzHBvGTzw7/eOwOWxuwo+uodnhWumVpLTcMvC0z7hPY4+8GOhZMS3aY
         X+FOFOqViaAYip5I+8xuA9fdDrMsPakSPJweijA+fZLk4HzoK5kiwgsxFZHKltcz1+H0
         tMJHPAIcozBFN0B/DtXTsW7iK2jR1tQp353mLWouz7AHAr2FAF2F9cFR2rNYufyKYkCz
         Pd0tIXOIeuYacYZiB2XhqNtiuWXOTpdfruQ8+UxoOj5vXrPVjOMW3TahOnR0k/qkWxG2
         HsoTunswRH7ubdGN5LFtml0WmTbgzeqXiKOdXkFIbSj6RU8H9t9GNb6kNUbn1mGeuRPk
         YsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205387; x=1793810187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
        b=EH+bK2QIniWJ/Yi/p0ypjJqzZmArzVrtBGvmk72ZmZ4t+eRFMN/fMKCYNw/baC4qXR
         YrocwTiYHDgyWkcOl12v2fhBxd1FNErk/cUFUev4aTGL1LUIIDETwuQS1eBgeGgv2r5i
         ZUQNiO5Sy9cwcZhpS49s47LqrnCqLwhfBa/M6CM0DFXRpxama8S1+EC59NjnnVrnMEju
         z2tLYmhZOO7wYTHWT7I1xv1fY1Ht2nmMvw37CnvJf/eh4fK9w966tCcKLQaeh6h9wW3t
         C9Cah/lqA3Vt5AocljTtUMq2SXecPrWKvI37Q+GowOJjiJiti6a3X9snVd0VofB7ZxNW
         Z4Vg==
X-Forwarded-Encrypted: i=1; AKwUvByUuKb3RdZogu4Z3SQ/qLAP/Zn/oT7sjoUGCInm3A6tCRJiog4J9JfY4IKOXcwC04001xqO+5G8cYeXKDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl6FONveNQMLdWeu1EQHd7ML+IKxTjTSehVThfXXnPGoJ8rHpg
	z43+Dm6Sy6KDuylIY8o3DjsZcRaPhq8T56HgWyEF1HK7u5WBEg4MiewCadh07RuizLDy2dgBNP/
	h/dUmPxUXlNK5Hlp2lygSk9Lmll99puZMLi6EwzXVXhFin19MmgHoJxVIP6PQcqMLUzxJxdI0B2
	+r3BdJc1HYvw9pJ136ot2GWYp8uIux3HkzjeKtTZ0PVw==
X-Gm-Gg: AYBFou1xkm58m1Eaa98XT0BcPcMbAVWXDeGV5TH626/0MkF4dVyS44Z4ohsimWUVyYV
	76qC20/t1cCqNyYWxveV5PueU2dLYHobbAsdCrP9pEZ2LxP7XNUkHyfYMU82e/c5I7/u/pIphGx
	8bNoe5PuH/yKHS9Pu7AvapRIgBqQT/ctk84LIejazhhrXYPT69+N81rst25yV4SbWx9TVlpDPDf
	O0bnixHdfIk/zZjg8x6H8SZ9YunYTl81Giv6GPCdiifzmqVTtsTObNAj9e5y+eyWylpvQaC0z0y
X-Received: by 2002:a05:620a:46a6:b0:93f:2b23:481b with SMTP id af79cd13be357-94408aa219dmr459956785a.22.1793205387056;
        Wed, 28 Oct 2026 09:36:27 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:93f:2b23:481b with SMTP id
 af79cd13be357-94408aa219dmr459949185a.22.1793205386506; Wed, 28 Oct 2026
 09:36:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com> <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:36:15 +0100
X-Gm-Features: AclHuK_qZnIsa3_FMMHTiw2iXEoQpzgN5rjHWMbnvqMU6BVIbLYMNtYuWHeQqVU
Message-ID: <CAFEp6-1QvF+=XQQrdDQS0kM8f1zoz3s3MZECOOdmYjAaJeBZQQ@mail.gmail.com>
Subject: Re: [PATCH v23 04/15] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NiBTYWx0ZWRfXzE1SnR6ooX8G
 qUACt0nSXupLv6t8rdcZZ5v+O0QFUbfdLG7/5RepZIYCdtoBeiFfPA0oZUEVTuyJ3ciSXMXPPqe
 fwmmmRI7zohMpwRSJzz5Z6Lm+dqde5A=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae2248b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=vOQjydwpf4klcLd5GhIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: w7mi4HxzeXqYPG5n95cvCSeijwecG29i
X-Proofpoint-ORIG-GUID: w7mi4HxzeXqYPG5n95cvCSeijwecG29i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NiBTYWx0ZWRfXz5GZPtJz8ZyV
 yCk79qdYlQgh7yZf9v+ACJMK1l6+klungzAwCzfsQaaxjE0S4Eu5tsoQq/wzgEz65i52R3EUXpb
 eiIGHocleb0z/WoamnCNOy3f9WcWTydFIZRXywpkqby2ofSFLz3fihXdORr0hNfWuWrENjOgO8q
 +ET88zDVFvtr9mVYyuHy4mHMoUJBPhRxFNUqrI0c3vuhiz+BhqCgYayVUTsOtVjV7e/twMNvFzQ
 Zv2bbPpyYekwZhclfS5Z7ByhHHiidRXcSz3TMG+2vT7DJW06BgUNMKM5TYAvGvpMxhCsRLel3k4
 C7X1cMo3DoEvO6T7hoEiZeY4tELnoS0FOMc3pL9b+g1nWmlLCYH6gVFE6bHMKk7AC9DeG+aeIMn
 fQAtC7oRaEOA9OZsxlsLA7Baw+GpiHgyRGg37MQ3KVGMCkM9yo9wI7Lp668rmgyzRcXs3AF11yB
 aadf6TjmSymCmP4brEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280066

On Wed, Oct 28, 2026 at 4:21=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> From CSID 680 on, CAMIF was moved into the CSID and the CSID became
> responsible for issuing RUP commands. Starting with CSID 980, RUP and
> AUP are issued separately, and each command must have its corresponding
> SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.
>
> CSID 980 and newer require a specific stream-on sequence. After the RX
> is configured and before the RDI path is enabled, the CSID must first
> issue an AUP and then a RUP. A RUP issued before that point would leave
> the VFE without a BUF_DONE event. Therefore, once addr_update is set,
> the VFE must skip the initial RUP during stream-on.
>
> Add addr_update hooks and camss_addr_update, and make camss_reg_update
> handle a missing callback safely. The VFE keeps issuing its initial RUP
> during stream-on and behavior is unchanged if nullify addr_update. The
> skip takes effect once a generation that sets addr_update is enabled.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
>  drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
>  drivers/media/platform/qcom/camss/camss.h      |  2 ++
>  5 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac..2f7e593defed 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -137,6 +137,14 @@ struct csid_hw_ops {
>          * @is_clear: Indicate if it is clearing reg update or setting re=
g update
>          */
>         void (*reg_update)(struct csid_device *csid, int port_id, bool is=
_clear);
> +
> +       /*
> +        * addr_update - latch buffer address update through AUP
> +        * @csid: CSID device
> +        * @port_id: Port id
> +        * @is_clear: Indicate if it is clearing addr update or setting a=
ddr update
> +        */
> +       void (*addr_update)(struct csid_device *csid, int port_id, bool i=
s_clear);
>  };
>
>  struct csid_subdev_resources {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..4f8867daea4c 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    output->buf[index]->addr[0],
>                                    line);
> +               if (ops->addr_update)
> +                       ops->addr_update(vfe, line->id);
>                 ops->reg_update(vfe, line->id);
>         } else {
>                 output->gen2.active_num--;
> @@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
> +       if (ops->addr_update_clear)
> +               ops->addr_update_clear(vfe, line->id);
>         ops->reg_update_clear(vfe, line->id);
>
>         if (output->state > VFE_OUTPUT_RESERVED) {
> @@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                 output->gen2.active_num++;
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    output->buf[i]->addr[0], line);
> -               ops->reg_update(vfe, line->id);
> +               if (!ops->addr_update)
> +                       ops->reg_update(vfe, line->id);
>         }
>
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
> @@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>                 output->buf[output->gen2.active_num++] =3D buf;
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    buf->addr[0], line);
> +               if (ops->addr_update)
> +                       ops->addr_update(vfe, line->id);
>                 ops->reg_update(vfe, line->id);
>         } else {
>                 vfe_buf_add_pending(output, buf);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index ae9dad353a37..8312e4c91e98 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -99,6 +99,9 @@ struct vfe_line {
>  struct vfe_device;
>
>  struct vfe_hw_ops {
> +       void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line=
_id);
> +       void (*addr_update_clear)(struct vfe_device *vfe,
> +                                 enum vfe_line_id line_id);
>         void (*enable_irq)(struct vfe_device *vfe);
>         void (*global_reset)(struct vfe_device *vfe);
>         u32 (*hw_version)(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..be58a39f4a8b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_=
id, int port_id, bool is_clear
>         if (hw_id < camss->res->csid_num) {
>                 csid =3D &camss->csid[hw_id];
>
> -               csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +               if (csid->res->hw_ops->reg_update)
> +                       csid->res->hw_ops->reg_update(csid, port_id, is_c=
lear);
> +       }
> +}
> +
> +void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool=
 is_clear)
> +{
> +       struct csid_device *csid;
> +
> +       if (hw_id < camss->res->csid_num) {
> +               csid =3D &camss->csid[hw_id];
> +
> +               if (csid->res->hw_ops->addr_update)
> +                       csid->res->hw_ops->addr_update(csid, port_id, is_=
clear);
>         }
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0..431afeb381aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
>  void camss_buf_done(struct camss *camss, int hw_id, int port_id);
>  void camss_reg_update(struct camss *camss, int hw_id,
>                       int port_id, bool is_clear);
> +void camss_addr_update(struct camss *camss, int hw_id,
> +                      int port_id, bool is_clear);
>
>  #endif /* QC_MSM_CAMSS_H */
>
> --
> 2.34.1
>
