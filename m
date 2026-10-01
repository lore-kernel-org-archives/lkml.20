Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E24DEC37
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849376; cv=none; b=R8XtPuvrZCKy8ErRs7UGFzEp0DeeXKIF/LxD/Zxnp3ldBvH+d/RSBG33tlHb8jEGf1T+kaa8sAoiZdbTVdbEu06bNbIBi2J9ystUUmUxSCe9XfLMfs7jGqbbl0YDDuoIUACpCO0i8rRuI99uljTTq5UNQH72Yh20BMOgUBRQRN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849376; c=relaxed/simple;
	bh=xprPyU7TrusFfOa1PFgToEkbIpwlSZwvH7LAs9IVOQI=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=taEdm03aLzFaMoNU3f+McvMA2YYYZOh49fgoij2evz3ldFmT8BwJ0T95pc3jlF64Io2vkpSSTkbMnQMx4VCngiKVk5pBlWisPxPTmJtqXRdioS14U2XEZJahQsuyTUJKjC58fHBL3OCSlTSnrKYa54BJh1t3oGNFTd/d2EF63VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=boyJLL1D; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="boyJLL1D"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3f641442so52179966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790849352; x=1791454152; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmIfg7X274fPHQkgHqjnd/g4+a+Z3V7hCSSiuLRRpOk=;
        b=boyJLL1D6RhvTsaCOcPUIz51StjRn5mta2IqI1yNX/WCN9sQ/zXlURBJcOxpooO3RQ
         b3Rg64EvDcEqitIiYJpzLvUjeMDehaayewTqkM+923VKMgf+uHoD19Hn6ESjmxViLmKt
         874pwt9uFyvyBl1AMiefSiTFwOzwz+V2JopbvptxQNX/qE3TKbRizj6GSU+kfC35GfC1
         JTnvJ3SNjiqSFuNXb2oPeVSBqnAov8ego9wUmPnohD9QO17WVDNtcqJUiIuQKJH1qhlG
         ahmYaOod3KVsQhEKU9PC5ZQhVHETQ/UjyGXBJQaevwv4OwNBujer/QhtOMv+r5dl+OTa
         yWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849352; x=1791454152;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmIfg7X274fPHQkgHqjnd/g4+a+Z3V7hCSSiuLRRpOk=;
        b=rQDbW2T44ROyNDVBKnV2FQ4airfH3fc2dV0cfJpUKogZOCURTDiapTwOWoVKOg539S
         Rcw9YBvZAkNUMvfbQBpFoukwgIxawIi73M1aKx83lGdLuAEYZZGpgDa004o7mZYoa1im
         mQ8oQMB4TodY9o8B4I5wft95L13Q+zgPqR7lwAB2GkNsUAI7AZarS78nFlWg4ljfm0V7
         ctLgj5mDLEYDcxW0Y/tunmfs9+dio7Jdw6ieOmtvcnYqHMNFHRtbbXZwiXPlj8+8icYT
         QxWjI5pgbO+7h1rOkgTD79DFB4j+joiDAGxawldZXzVAWlrgHhsOMtngKPDvU1ptGPVt
         urFw==
X-Forwarded-Encrypted: i=1; AKwUvBx9D78wxKpaycJUEZ63mBSpjhhbi3HlIlvedO2wmFdgG4lx1nFPR+tubVKWIRQJ2bjGI3Qm6HWyPscv6Qc=@vger.kernel.org
X-Gm-Message-State: AFuF++n+8SbJiHHb9CdUbn6WsnJpVxBpIKgGlSLkrvBeEg+TgSoesu1d
	VPyQFUf+KLvZ7zsJlNZDioCu3taJJBHzGA1/kPpL2Vd1iPyGWq7xpvr3upV06ehtXvo=
X-Gm-Gg: AYBFou2YE8YUhmZaTzlXO+Cbv17v6G2dbbh0LC5Ss/4heOBLv1duwoBcEVHbBkGloot
	vcN1IMMERTCPvXD2BmZ631LHmQuAfKIOdFOlh2YG+7RI270mCp/CiI31T2gQwYNLzwaPpWiMeSk
	hHuXcp5hCR+DDepJe/iklk3sHK5YXRVfTNpjBA/RLXrB358TB0IXvPr9nbfAl7PZfHgItplnhql
	xXG5Ova6EM+ySh0+SFRd3rQoQnKhOLit8o+9owTKEHOFGOndQ0xDBDOjeEkdrx2o5uB7yRsiEAd
	gJPWO1CtxwJbSDDastcOhnPUEYQm1r4inPtRtSGDf/B27my8iwZ1kDQ8hJU0XS1fyURep/kd3ue
	qmPCfeV/nhRtdYD74kvoRA5ZBErgoB59qGtaDLTCkukM/6aGL/gKma5F3Hv/U4V4tAgP+cPe6Eo
	luc75Qh8n5GHuhb1hyc97/L1eDJOWljVPEhOt5dDytPu6YwyXBQ51+PToX7yV1zYFXm0zd/XweC
	xmf8DWAxWM=
X-Received: by 2002:a17:907:6095:b0:c2a:50a7:d052 with SMTP id a640c23a62f3a-c2e2374b5afmr337709266b.7.1790849352212;
        Thu, 01 Oct 2026 03:09:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.14.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce362esm123790566b.30.2026.10.01.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:09:11 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------WLdK11N4WwQJ910wlPBOAesZ"
Message-ID: <89c86aa0-b1ba-4055-8835-256030828068@linaro.org>
Date: Thu, 1 Oct 2026 11:09:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
 <20260930-purwa_camss-v3-2-0fe2a5b11208@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260930-purwa_camss-v3-2-0fe2a5b11208@oss.qualcomm.com>

This is a multi-part message in MIME format.
--------------WLdK11N4WwQJ910wlPBOAesZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2026 07:57, Wenmeng Liu wrote:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..c401d4d2367022022ab4159d5a08806c27990f00 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
> +	case CAMSS_X1P42100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -2014,6 +2015,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
> +	case CAMSS_X1P42100:
>   		ret = 16;
>   		break;
>   	default:

Lets take the opportunity to collapse this switch down to a default for 
all of the new stuff making the old stuff the exception.

Would you mind picking up the attached patch - assuming you are OK with 
that - add your SOB and resubmit the series. Then we can.. drop this 
part from your submission.

The ever-expanding switch just needs to die.

---
bod
--------------WLdK11N4WwQJ910wlPBOAesZ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-qcom-camss-vfe-Eliminate-ever-expanding-src_pa.patch"
Content-Disposition: attachment;
 filename*0="0001-media-qcom-camss-vfe-Eliminate-ever-expanding-src_pa.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5YzRkZTQ0MjcxZGM2YjQ1ZTA1ZjY1NGZjNTJlOTRlMTFiNGNkYTBiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBCcnlhbiBPJ0Rvbm9naHVlIDxib2RAa2VybmVsLm9y
Zz4KRGF0ZTogTW9uLCAzIEF1ZyAyMDI2IDIzOjQxOjMzICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gbWVkaWE6IHFjb206IGNhbXNzOiB2ZmU6IEVsaW1pbmF0ZSBldmVyIGV4cGFuZGluZwog
c3JjX3BhZF9jb2RlIHN3aXRjaCBsb2dpYwoKU2lnbmVkLW9mZi1ieTogQnJ5YW4gTydEb25v
Z2h1ZSA8Ym9kQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29t
L2NhbXNzL2NhbXNzLXZmZS5jIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12ZmUuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12ZmUuYwppbmRleCBkZWYyZTFkZTBl
NThjLi5iOTJmMmIzZTYwNDRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9x
Y29tL2NhbXNzL2NhbXNzLXZmZS5jCkBAIC00NDUsMTkgKzQ0NSw3IEBAIHN0YXRpYyB1MzIg
dmZlX3NyY19wYWRfY29kZShzdHJ1Y3QgdmZlX2xpbmUgKmxpbmUsIHUzMiBzaW5rX2NvZGUs
CiAJCQlyZXR1cm4gX192ZmVfc3JjX3BhZF9kZWZhdWx0KGluZGV4LCBzaW5rX2NvZGUpOwog
CQl9CiAJCWJyZWFrOwotCWNhc2UgQ0FNU1NfNjYwOgotCWNhc2UgQ0FNU1NfMjI5MDoKLQlj
YXNlIENBTVNTXzYxNTA6Ci0JY2FzZSBDQU1TU183MjgwOgotCWNhc2UgQ0FNU1NfOHg5NjoK
LQljYXNlIENBTVNTXzgyNTA6Ci0JY2FzZSBDQU1TU184MjgwWFA6Ci0JY2FzZSBDQU1TU184
MzAwOgotCWNhc2UgQ0FNU1NfODQ1OgotCWNhc2UgQ0FNU1NfODU1MDoKLQljYXNlIENBTVNT
Xzg2NTA6Ci0JY2FzZSBDQU1TU184Nzc1UDoKLQljYXNlIENBTVNTX1gxRTgwMTAwOgorCWRl
ZmF1bHQ6CiAJCXN3aXRjaCAoc2lua19jb2RlKSB7CiAJCWNhc2UgTUVESUFfQlVTX0ZNVF9Z
VVlWOF8xWDE2OgogCQl7CkBAIC01MTUsMTAgKzUwMyw2IEBAIHN0YXRpYyB1MzIgdmZlX3Ny
Y19wYWRfY29kZShzdHJ1Y3QgdmZlX2xpbmUgKmxpbmUsIHUzMiBzaW5rX2NvZGUsCiAJCQly
ZXR1cm4gX192ZmVfc3JjX3BhZF9kZWZhdWx0KGluZGV4LCBzaW5rX2NvZGUpOwogCQl9CiAJ
CWJyZWFrOwotCWRlZmF1bHQ6Ci0JCVdBUk4oMSwgIlVuc3VwcG9ydGVkIEhXIHZlcnNpb246
ICV4XG4iLAotCQkgICAgIHZmZS0+Y2Ftc3MtPnJlcy0+dmVyc2lvbik7Ci0JCWJyZWFrOwog
CX0KIAlyZXR1cm4gMDsKIH0KLS0gCjIuNTQuMAoK

--------------WLdK11N4WwQJ910wlPBOAesZ--
