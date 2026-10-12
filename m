Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA943499F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787567; cv=pass; b=cM7JYbPtbwLKx8W+bnOgzOOVubwWSsa/kO2s7RXrfqYn2nwAAvdbohKz3CLIM0FpsgudRFNnro+jtMzzBKTr00NcdrQ/Ei3FYfZiNv8A5xwuRpEMoYqD3xCIIs0uBUdWrA63tkb20ARa+opfhIQaL2Zdzv1bUhfbKyiOt8z95AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787567; c=relaxed/simple;
	bh=mN+1knXYNtngeeWJgfNsIN5o5VTXNif7Wc+A2lc9JBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgNqL0nYj7K7lSx0Y6pX6k0uzkxqiCwrWLnylqHO8/NfzsTmSwncU+wobFVBtq8UtIJ4nCuVL7nRYt8MKZvWMUZIog72LNcGTLIssYshpWq2hy+a0qLKxcx0+8Z0flSgzlseQInUGyPB5hF1nkC3ic1bavG74PlRmV8BsWdMNFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMmL+GZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PneTYvbY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMmL+GZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PneTYvbY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55g3H750870
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=05mRSC4SMhgre7tJEuCkEGqI
	JCIZwKO88R6uiRwMZ10=; b=iMmL+GZetnGmQafs0KDkpH6OunxOR3dffjKLwsE1
	H98384Mww4/3NHhmaI0uIR2UShGlGnUnF6LGuLtIVXy7FZmdeM2qQkdbhR9DBbsg
	Ic2C6HaC6jzhbQP+S3/SIJPn3u9Tmtdd7sTrLf3+5TAxRbHz6QHRUcf/KxKXrG7l
	p1EzyjfYSXhb5OHwoeK+hVDozz0R0vO2CpoxsZHtQa9UF2HQkFctg0CozUNHuKhh
	2kS0cg2KGKN9r/Lfu6QWDoLfoYo+uMNlxgEKt918g17LA/h5dYKKd6gzaXGQWNCL
	PNQtD2M1756pYb7dd6PRYkI+DG0UuAOky0Rzg+J2ereueQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed2pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:46:05 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0a4f77582so4991257b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791787564; cv=none;
        d=google.com; s=arc-20260327;
        b=b0t+HCQz4FXopVNTHV/hSmJ3eYOZKZGkvVvI/A+xBaNUc1rM8fpfPjyOWUcxOi97Q2
         v7yiVBPm03zqXWTsZKOdxhWWpSiBeuWKauPSyfZNlMM3bpUWoO2co/qs758qUCf2FNAU
         7ADN3M6yMBAyTNojF17OnPdOQrdJnVyPoR22jyex+l4ASA7dxYuKR/nposncowrlYMOS
         m4wrWBMlIpfM/FH+utfZIeepb53LZvQqNn3iuk/HH6D4HKHnj7qcGUiINXP+PB/KxX9r
         z57rNzpQxMJqH4/0W/NCVb1MimL9gLth9PKP8+H4GypQU/EYfCparJx6Jm4MCRk3V5uG
         3smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        fh=o8Oyy1f5RqFvat10tIS+YFH9O/QDjtM1VEobUWua2Hk=;
        b=l4qIqrRlw+WOnm69pey828bdPxELkW4E+hVjdMLQR+JkRUJPvFTfwX3p/ibzjOzWO5
         s1gQgDDgAc+YxqD4gdItr4mR0Z59WMtewiTENrS51iSKBxfQpCHUIjM034UeSzmZUrTQ
         krelpgl6wIeEWd/M/pVaPcyXsKRNM8rO2CRAFF6SDAP25BCT9hvI9/z2Xu2Sg4ErHXJP
         9YJb2rIuOWFm84VR9HdQdlRk6GKuOZetwFIZbzpaZi44iuIojaDhn2HsydZgbd0CssHd
         G5NjKaAJKQP3DRR5DryMHPDpsc/FzFPVl356z034GSAG5aa98zofNMH1ASOfmQDTKv9C
         c4aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787564; x=1792392364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        b=PneTYvbYu+0tJEmuwhtylgHOAaNmDcToMIweu3O5qBBCNfXdy6uEBCZphu0KvIPTtt
         pi4MOSfS/ImMoSAHj+0F9qYp9+MMo1DAnHCHOxBdg9YPsaDAzIqCxyuPYZlqqbJlzDeT
         rPfaU2tKP3ecbxOABzq9QybqoHPISidnwJ0kTKF9HVmMszbU5V9/UBdGqLM0CtAlA6jv
         oltir6Wp0TNfFhrQ97u99SbiN77eje6K46oUCd+H03WUBwnLxA2fM2hacEnpWqoftzVp
         pNKqQCdueP5hWehLtU5K2uVq25c3ZVgyg0UwT6oB/ciwKPRHgBqqF3ItjbyWsbLSyqsv
         Chdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787564; x=1792392364;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        b=swbJVUGZ8CNzfO/bkRx7hH5iFAk7RKoLNeoyxinVVFl2KAV2WW8aFXc8l35UsFSQ4H
         1x0RbvCGRYtpnlIybtuVDZt16WDrMmHc4qQVvGCIZQy6Po9nCfNn/M8sDGO6mzEyX/Pc
         3KBiq+jXCuJkj5li7pEGaaBXw236LdngAjF/8CtoMK34J2c5BJxYwrOdVR1WaQSL88ei
         9xNrTjL6W11vzBPJRQ6Rtr2TfFS6E3/NjQHD/vrxHsropZ2CF1cagvmXA1FBqJnX51vk
         DwDaoD31TLuaBqhaJho2diS0WPocEjBPVq3dWPSBp+0Zs+QyZPRuCFmedFEpkCiHMDfB
         QkeA==
X-Forwarded-Encrypted: i=1; AKwUvBwpD7bxmqZjWXONkA4kxdp33oO7U+8/oSbpyXH8y8LMFFBYa3wnAQcevgCQgTAhd2ea59Klgn3eg2d0mcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVkTReFb9TIY5kQSMJoqAMNs9zK7022so7ndakFwYajI+KOIjg
	lJ1ZCltiGvs6fGPl4FxcqwMmH60RgGe6+YFf0fEid2OhjuXr0lOZo+xs0ne825xb6BHzyH1Zx0g
	0NnEoqUILOkQPbMoCkDu9poM19IQXc+wm7hl+l4NwipjkLWsTdbqVoMsjKgJ8lPCrxUXvBeJPVr
	ncV846p9PKqICBx48b44JKbg0jY/Jn2J/kxpMImGGH7A==
X-Gm-Gg: AYBFou3UBzxAXRvOGocDnCOQ3R+qEE8uwtXke3+X/4JrbYVO8lvD0YP9mDES9hvflc6
	bR48ti4m8mKPq2QEdiDRZQ+iGpD3RE5uL8r1WPX0GufFf7ZrPJAYOkrDIDd1prENrFQfFAgWqif
	CexcfLgTz6kBJO2Ug/x1G9tXzoikBkMVDpCD78s8gsozHEMISv7zA5rO3eKOw=
X-Received: by 2002:a05:690c:6987:b0:8b0:a1d3:3823 with SMTP id 00721157ae682-8b0a1d35c71mr7404997b3.24.1791787564349;
        Sun, 11 Oct 2026 23:46:04 -0700 (PDT)
X-Received: by 2002:a05:690c:6987:b0:8b0:a1d3:3823 with SMTP id
 00721157ae682-8b0a1d35c71mr7404927b3.24.1791787563981; Sun, 11 Oct 2026
 23:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com> <20261006141620.GA1950759-robh@kernel.org>
In-Reply-To: <20261006141620.GA1950759-robh@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:15:52 +0530
X-Gm-Features: AclHuK_Pj0noF1c11z_Dxs3SIV9mM7Suyi8CwWbvl8dTMFkFuJ253BEfSkuBVG4
Message-ID: <CAC-tS8DzW88Lu_k-yKQtyfYc8u5-rh9WKTSanJ6dq6Xo3wp+kQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX+MQNoLimOFm+
 jAM5ODaF+J2T1AhJjQzkH4lHT+bKAzLRNpafgtSbI2UKUBpjVkOtqNCwH+UL8I+WBu2+MYm2FxT
 mzKmC460a3YjDBKzyNYHA7R0isZY6OVZHQtrdYUhCLzwEKgzYpT38icKjw8tPEPKg7WeKLAKGI6
 dK4vDu2RlvPs0SvQ4IhEAbHlJux48bMMwkkHNMNMmbemE51SJbrLZjZB1CcsyWd+eZ4GRhIWmwh
 UR7GzJzk4Vqx0dhrgWt4sJ3oFmwlej2KG1dfbHLN2zBBe8PlYOadmbMSnVTb7lrdsRadJKx2Xi1
 sZwwr9MJbE6IYMFW+VFxLFAEe1cxprEtO4o8bno+rYgfr5l1+JfM02LPe8GgIt/mUlBIp32BbR+
 /fVCo++alxou0ocYv1rE6KBJ82/ovWnRqQLyB2tJBsPtS9ivcYYMD6rtBK2u7qgpCQdTEtqB44+
 ughqThoNajUR4RjvWWA==
X-Proofpoint-ORIG-GUID: ZD8KKgXt-_0xkEL2SggH6EsG4QEJZV3Z
X-Proofpoint-GUID: ZD8KKgXt-_0xkEL2SggH6EsG4QEJZV3Z
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc822d cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=IkqFnPuR7rtTU04AMzUA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXykpT6NobEz9Y
 1x6jkZ2Cx2PfZ11G5bvDqXxTeOKj6sXp9aXyRNYZoCoN9pPGzwYHvRJVb0HW0yQIzc+HIzCiN8E
 cQnajQdGO4ihzo6N/S1Jy+JSa9jls5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: QAIF core registers
>
> Drop the description.
Will drop in the next version.

> > +
> > +  iommus:
> > +    maxItems: 1
> > +    description: Phandle to apps_smmu node with sid mask
>
> Drop. The exact provider is outside the scope of this binding.
Will drop in the next version.

> > +      dai-tdm-slot-tx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
>
> These are all common properties. Don't redefine the type. You need to
> reference the common schema (at the object/node level, not per
> property).
Will update in the next version.


> > +
> > +      qcom,qaif-aif-lane-map:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Per-lane direction map, one entry per lane starting from lane 0.
> > +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
> > +        minItems: 1
> > +        maxItems: 8
> > +        items:
> > +          enum: [0, 1]
>
> Can't you use a single uint32 bit mask for this?
Here intention to keep this consistent with the other tdm mask array properties.
-Harendra
>
> Rob
