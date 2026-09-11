Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7132E443C32
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141608; cv=pass; b=Zj8sqXz+M2qncZd1WZke52jjmsd9S0paODgwa6kzpa9keMpd+luwHH3cRwTqxEgXLExBIQMDWHYhPgLct8yy/sucS4r1JUC+/WjZ+hpbrjXmKAkV5GGh3bOxMAymF6N+i6NV+Gt5pWgLLS0v6nmKPOzBAe4TTJYpX4Er0qmgAMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141608; c=relaxed/simple;
	bh=i2dZDGM5Sr+QxvM5pwbRnREy1v1y2yLtEXCVMfXf8Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuWbjEMdkVa2CTrvIK5UzHA7/payyMY+X1gWbH0m0NIDdMhc/uDuvXFvRMQ7yxIoigba9FCPenPpsHSkT/RK2Ew59cLGA/ON0Uvy0tXgX++RVWq9Eq7472APLfuPUL+mZdTmHq/X9FzrJhotArxzVj6nE3+p7hxaDpUF+OSKXSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaSENI5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxxBdn8b; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaSENI5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxxBdn8b"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm62X3251750
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52LmfSF/J6JBmW22292igjmnk9P19fKWJ6xtkOPzVsg=; b=ZaSENI5xLcl6rnxS
	k/nC3ESu1xgrpPK6qJIsP0IM/uTdki8F4SjYtLdL/5/nnAY93Q23SRg7gYvPj2rs
	M1xsBcVt7D67/uSdtNKBoUyOfNWv3WA3C9+X7flB1smlUB6zn0KIQqpvY+gbfJHF
	3uY40MkcA8lysBp8xOwo60+BfDD7WSl9w0iYbVqccwTTRLne+UZOAOwam3Uz9/T+
	ebVUAPTdA0JjYWK8LBz1VeAAiR07B7QH1zGx9ZhSeJEthXmnDEfRDzEZS6K3AwuM
	NpYBk8oYEQUkoGMVgbFhbXVa3TJOVaijADIJUSfTSUfZqff96Zk0uuAPCoWU/2g4
	UW5KPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uckb8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:46:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso22419855ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141606; cv=none;
        d=google.com; s=arc-20260327;
        b=d5kYJXPnAzu8QwHk6s2K4Zwg5CNPQEnMJ2RK/C+qf7x4rrjIifrLaki3AhPIoauBs3
         ZtWmh5CBtPm0sSzNZNACNgVguEMNf3DUQBTmqrAOk73MFFl7+G1HR4V/NaIoBVchTvi+
         mcVbN5Nf8kH7wX46y0p7wbhIQ19lTlBgoEyF8BnPQuYOWIsLPMedQbMDRgS7rAnmuayJ
         hu1MeeDY/pV4ClyznAPErVOTvJN8lOuTfl9P3QF/fLXhdi7yqML5v4q328onRygdEjo8
         dH0XwiHu+sM0K5erZv1geF8ZEadaO3W3D3bTsoEtIDcMsh3BWW75gHP1nmKVeCoU1wNd
         oRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52LmfSF/J6JBmW22292igjmnk9P19fKWJ6xtkOPzVsg=;
        fh=YvH+pCBZDlfDB7dn9lZd1i8K2LzdVvbCQn99/g7SgLU=;
        b=VkgJfX1JJsnS5c9ZJUIHs32/fkuwuHi6zD+FyFJX/xOLUTfba/8zVJGhIswPXw6yEu
         //PYPVJJ8eCcz41fvQSB2E8Pyw12M7VmeQPItFqZpZDYyNIXgTTNV3FMIsEIBWi2BW3M
         xFuwzaacLJbKrAK/AK2uhrafxJH+AXoqJ2nH5FuOapqyrAFomibTPeqTDXiM0IHxv2vI
         PhqC/BVyFwiUkcP8R7ohZkl9IAhNKhdBxd2bkpodQZ2Y5lu5/SdL5zeLfiTYTtWponSQ
         5EhLeOWrSmzL4LCDxvn8wYRRf8somnyXoKdYSRu9dTmNyjS3bnH7yW0xHv2vCTEr93XW
         0YKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141606; x=1789746406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52LmfSF/J6JBmW22292igjmnk9P19fKWJ6xtkOPzVsg=;
        b=NxxBdn8bhVOfbuEmSTjeK8riHbis7U5yydJ8/nUDKfsDFxXZIw/o8U63rzHLswZLDy
         T7rJ8z/GrpdO+uzUAP/KVJGX3bRx00by1pZeOyqhkWvD8eU1UGalHiHTp3ktna6l4ybj
         PBoRltjCr9BGc7BNynQvRaFLrOmOad5O1xg024jEMVKl+c2wmg9BHbte4sFW+47FaiqM
         1vafKKHsx74Z2J70ziNRLhGFJA1ZOmjleR4YsPPIDnCfypkxcZoa1IEMmt4MY3tBUoos
         txVoWXaPj3OaRmsuXoUrWiIkYrwmhzLpbxS0x/Q5C5DAKSJ0KdbyFVNllzdJNkUFh9Ew
         yQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141606; x=1789746406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52LmfSF/J6JBmW22292igjmnk9P19fKWJ6xtkOPzVsg=;
        b=LWBe+U/kcxbBdnEwU7XQhP30oJ0Vs96DcMg5p9Wz225hDpb34ITJ2pfKGlALTmJOO3
         YifOIlSVzMnxrSb3XpSMbjWJx/CELtuENOGP9jyLpjmbWf8SFCxBD27J9lKGqnwI+JPo
         ivfIWtUhxsoVv37dFrLmTYd1h+dQkOBwiGxYcUbsRJWuZLE/PXZk0CpU3LcLd4Ya6lek
         uv5UPxZxOEMqiAB5cAUehk7fG+Jz2CqTzfif8eK+dqfAZ7b/0WWdE6DAT2Y7yGL9h6uh
         tphjZBiBPM6S6jQiA7GCsfvzCItubm2ZUw5wppxBu7o/ssgNHsj2SPX+9Qwdfl/HaBoK
         FePw==
X-Forwarded-Encrypted: i=1; AKwUvBwNNMCcRbCJ/dcs27HL7jheUZTclDLt8+kjbad/oqLKoaIm39HgTp0V/wUTSqtFBDYxo4uc6i/35+YG1yU=@vger.kernel.org
X-Gm-Message-State: AFuF++ncf6wo08gTwmDMB6aF2JqnCZwQJNMGL+udCB6OrTbb4JIU1oBO
	c7W0VUAx7LdHJs2OKRvue79m600Q5fGE0Xgd5rjzriVwU+H+l06d0GTY90HkWqiCLRUiqPmTPjX
	3Y3cTp+K7QS0LrtZIvvdRKyHNwrUHBliLfUa5NtmGSBT8YmO+P0EPT59YUMP3c88NOzc4jJHzIi
	euwlRkMKUMZqhd7p6iWKCjoYdUExqeeADiZWDZYsi3qw==
X-Gm-Gg: AYBFou0aY8Ox9MseXrv90/5gJO0nrd44Y1/9ttl50umVv6M2J3rDHaneYB7NGtaU30F
	q5tPyoq0+SAQPeP1cEIiHwf4mCIWNLy1JXEMdvQben2JV/Fd+KbS1ldc/CBWjPxf6SvA7MKuGJF
	ikwJt6AmEkUXOEkExOGXFtIz4MWKHjE0iRHa3NoAxmVKu/NIqbEH6HRGbNRg==
X-Received: by 2002:a17:903:298d:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2dd2a1c3f97mr94684535ad.4.1789141605770;
        Fri, 11 Sep 2026 08:46:45 -0700 (PDT)
X-Received: by 2002:a17:903:298d:b0:2d9:383a:30f1 with SMTP id
 d9443c01a7336-2dd2a1c3f97mr94684105ad.4.1789141605249; Fri, 11 Sep 2026
 08:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827091436.1339716-1-xiaojie.li2@unisoc.com>
 <CAPx+jO8Lc3iNNBVjBB33aJYUfdr2EJqpL8mS8weKnZcBaDf0vA@mail.gmail.com> <e69a63062a43456097939c622395cc7b@zeshmbx09.spreadtrum.com>
In-Reply-To: <e69a63062a43456097939c622395cc7b@zeshmbx09.spreadtrum.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:46:33 +0200
X-Gm-Features: AcwNN1XpSNpCb6Sqex0tj4LveTilRiuSH1LF9e6Mjhq1EAXcAAGcWBtruMj2r_4
Message-ID: <CAPx+jO9Sw=pTq-925h0S7Urw2moANp=n+aScfwRxV9Dn642g3Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Modify the CMD1 transmission interval
To: =?UTF-8?B?5p2O5pmT5rSBIChYaWFvamllIExpLzEzMjMzKQ==?= <xiaojie.li2@unisoc.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?6ZmI5paH6LaFIChXZW5jaGFvIENoZW4p?= <Wenchao.Chen@unisoc.com>,
        =?UTF-8?B?5byg5aaC5rOJIChSYWluIFpoYW5nKQ==?= <Rain.Zhang@unisoc.com>,
        =?UTF-8?B?5ZSQ5pyI5p6XIChZdWVsaW4gVGFuZyk=?= <yuelin.tang@unisoc.com>,
        "cixi.geng@linux.dev" <cixi.geng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa42266 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=icsG72s9AAAA:8 a=qdhnC9VRJiNP359Bn14A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=T89tl0cgrjxRNoSN2Dv0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX0rI2CgwrALwP
 cWWrU2AnnXWJzsvEnk8Bnyzg+C4kQJDVc4cY+9qYIiWIn2EGXF+YZl6z//U7PUj7WpH8RNTpSnj
 7h81ZnPiCdXtjp5Cj1BRnL4NBLxd+RNM6bqyHjtWacaPqrjSPoN5olY7LjdFiZs/cFq2bn2nNLd
 Cg+K1KAJ74ieAl5VMUBcJ0owGHsKo6Bs+NQgeHfDz/zDuWDX6Xa9PhFeuQLGkL7jWXYzCsOA1Ll
 1mvlfll8Jijt4jyrzNPsletHaipAmm1grSfHs8Rs4CXkRYDJOerAqGCBSM2NM0UxcXJItu/fuK6
 wr8NoJ/bkH89UcikjOQ8HM5t77DETHSaMsaKBRguB90MJzmosS+NLpJtKS3wVAc8c+i6FUUJ/uM
 sonDfOnTssNDn1tfXzFZhySJfuPNGyZQpSgy+VA1li+RTu8SaHPfFcPJD1h1m9AGuv5ROW/G0aG
 tuzCliD2WnHLt9ebggw==
X-Proofpoint-GUID: rF0RJYL7Wo90Gw5TOWU8sGRkR1UzjHjt
X-Proofpoint-ORIG-GUID: rF0RJYL7Wo90Gw5TOWU8sGRkR1UzjHjt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX2l70ywFtgKmk
 wpR20BudcnqWM6jZ+rctGB6NRdbtAUtYNcb2r7MtECk5dXnS+B/GbjYbKTo237cNX6Jmj9funkv
 fIUNXuVElu3M/y10v7zuU4YQtadyTwg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110220

On Fri, Sep 11, 2026 at 4:45=E2=80=AFAM =E6=9D=8E=E6=99=93=E6=B4=81 (Xiaoji=
e Li/13233)
<xiaojie.li2@unisoc.com> wrote:
>
> Hi Uffe:
>         Thank you for your reply.
>         However, I noticed that __mmc_poll_for_busy() and mmc_poll_for_bu=
sy() are invoked either directly or indirectly by many other functions with=
in the MMC driver.
> Modifying them directly could potentially introduce unintended side effec=
ts.
>
>         Would it be acceptable to implement a dedicated function specific=
ally for CMD1? We could create a CMD1-specific variant based on the existin=
g __mmc_poll_for_busy().
> This approach would significantly minimize the potential impact on the re=
st of the codebase.

No, that's the whole point. We don't want open coded polling loops,
it's just a nightmare to maintain. Please try to extend the existing
__mmc_poll_for_busy() instead.

And next time, please don't top post.

[...]

Kind regards
Uffe
