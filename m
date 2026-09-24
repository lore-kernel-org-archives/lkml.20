Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB62E266C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246307; cv=none; b=tg070xzI+a3vqJd90VSkZ/yq7EMCAge9y//0ymYUVXza4vC6avlmTlp/ic/VJhJPg8FoeX5EngwruOj1eOSS+Uj9DM1Bs3dCK8Gw/swtC1yY166qf52kTWVc20mLduyY+6WUfKmJUect9kMrpYnXv0+msUPp3I8OxQCOIO9xjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246307; c=relaxed/simple;
	bh=iRYgEa0QAMnnHBbeXblwmyNrfIIZOdOkl2Cx5CFRM0I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TuZk26BSj6ZaTuudvCMvLD7PO+nC1v9kCi2XZnpPeit70VKv32g222cY4CWQMyatFGyQzoo8KfzByyV5BhQnioJEksnwELXAZ9jULm1OUk4ypVmJ0p1JE0ZwIsNrrHxaoDS/34aEmniMuz5NYMyIYoRkHZQyEEt0YBKySYpKQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jvz+aEYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UO/hx7dc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jvz+aEYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UO/hx7dc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA6BXs2333186
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=; b=Jvz+aEYXV7Apcmn+
	vkfNaEKwF0eu+xAlptFyaL/dkXTPeYDhmrqrZLuhpNAXELbL/lJgXsqlOi8zFTa4
	Q6/qou+pPsUxkWlb1zrNHBtOg+IZKhPqsTr7VgozrgFjRGOebms+0BhhUy3EFOcD
	yYT9yO/vd14VNxVoyZ0uJkkF0f2bI6CYtsPH8KlghzAhoqXbmC581JoG4aLU1M/S
	GZ28uDcLPkDcBh7SMfUxZQ84V4H5EzqkU0kSwH2kU+XWqGxTYsYLrf7FzoUDIwFE
	9ev5oRCIecUoWpi20Z0tcSHyDifoPLgy1JWCOUhmbTLN7ebQueJtmCus/XUcgyQK
	R6lILg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjg3px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:38:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86917d18880so1594904b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246304; x=1790851104; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=UO/hx7dcIYinePuIWSw9uAiDIIaOfuC1qtkkE3TaGQH6NZ6wj/RLjdHtdNTwnxRc69
         l4ooIvuokRWtLAyBpM7RH+tvJBL/PU+qrmlBGCcBnmAqqZ0nc+MmEhweA+9L0Vd5JA71
         sbJMe4JWQBa1bowEn8o8EjXxfu3pGUDEP4jruBhn1QwgFZOu89H+3gKP2nevZzw/8yIk
         aSgKsmadx96blW08aVvEo9DGsVOYyuEtbtMIBFG/NrUbknHGTKppIoXKeHCc4RHPdwi+
         r+1fvF7zp/KPJtRrIXIzlZqKIkM5NAKL9qpHtjsomxT4yzqmYonzV1tssdHxBrjHGWDr
         Ws4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246304; x=1790851104;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=Ww6Sq8x5ybBrFxjkbWU2KZIdms1g3zYeYDWIj7d/70Fpu8CIsAxI2Py1xU1udmzJPv
         HS+ORR4224hf8jgsf2cphrmxamvaM9zJTJq9cELdjngXv8f4tQF/F1HN75mv5gkO0vCa
         uZJR5KpM1XBPe2Pxs5MCwAdX2ThxeqPZlhuMAHamAdL6fcH+4OnGroY6jpCDqvhvDruY
         lWdWqE6R0M+LLUBgZv23JxANaP6PnJA8WUPONO779u3MmG6fjIrhvsn+MN6mz63+sMtN
         5YaFnE31ISybToEs+no62fFjLl+TifUHGJmNBHfQdu3ejEw5MzDh+YtMJ1RUFbG1zxLU
         4WSA==
X-Forwarded-Encrypted: i=1; AKwUvBypFTSoXGKgyGpshUh5vxrhdOFdxcDerdPGFq8p5dZdXpBVT+2d6nakWNm/q97qUP9D7Q6+JFW6PMQfFDI=@vger.kernel.org
X-Gm-Message-State: AFuF++kxVTn40YwJ4Rqo4hu5VO8ApoGC7czPA6RgrLWLhku2Yw0nsrpn
	dGk6a1v4FuIbl8REje7Uez5gZLeESqQlo3MeRFg3+02BTJ5JDhcNhsZj3ccJG8nWbznGWMJzIUO
	zj0a8Mn/Iee0jvkFIcaNq+T+bu1JtJBnbzTo13nPAzJhG/13ozP0QDrBgKdHHjzpHztQ=
X-Gm-Gg: AYBFou2tM01phE10TO2WZpXIzBURf2qnSwmMuro7MQzTa4pZzc3r+JwICPZzUap+1Cv
	jOE96f+MFuid78AqXs29+USz/yX0aodHnXMQZ56SziLdtFNaQTq8JDqdcFg4cmbwnYzzKVo22DL
	8E52d9Q54WF+D4kJpT4PK5LciIsH58ul+xzi0BgRVT/6CWr84vJKj3NJyalDk1dIdsF2TLUQfzA
	kgg2fR/YSj2iGbrvtP72pZJ3e510BA6BlT3OLecPt/mjmcLnec/LEE6n3S4goIZ4z/LprE0c+Jr
	aLF0r/hZufDTvgzG2c3uzjzMXzbtBWhF8T5chRtbUKZJasmVaH8Vheyt
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904865637.22.1790246303361;
        Thu, 24 Sep 2026 03:38:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904783637.22.1790246301600;
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2691132b3a.38.2026.09.24.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:38:17 -0400
Message-ID: <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: bei55TUd3J2Y3k-p6cOt4fY01f9wr1OP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3aTdjOr+e9oL
 phbJ2BD7gNZiIfu1ClsauAcUjFmCRwyqHyHgCb7kGPjj/U8WTHvPNFv7L+7UxrGIXsrU2TO9cnZ
 x+yOYzGqiCPLhrMPTDh8GATKxusSAx+80poF+YsGo0+bXx/urnxByH9vK4IjWPU6Vfc13qP+Tgq
 acdbQ5oPhoNzyQUHPH51rQuAVb4Ax9jYJmlWdNZtWaoSPR/2zRcxroq4enX6WW2Kk34IYo5Hvf+
 jG0keHQI+YstVGRgjXzxE+wGuTHutqMPsMuh3JP66cM4o/qhRT43VWW/VaDmF26juofuCuuvDqI
 E+Mx/ISuH/cIVwdH+R/FWb0PfijsUKxTuDTCnxJhuAC2wc3Za/UkZq8THwaWXqJ7h7lyKsmYITX
 hsogNW3Wl5CPqSKrC31j3OpratUKgYwGlASoMes9B6qSMIACOCIxNt/AtKtLT/ck70fwbU+jpXc
 wlaKhzu6AUyD/6puPqg==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab4fda0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=TMGBcqugHITK_y5VCRUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: bei55TUd3J2Y3k-p6cOt4fY01f9wr1OP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+26Io8rtfnEd
 q2gmiqOi9VDOpFSRyW7k93jxF0rm2Xy54xwkhAgkMnmjNylDlusREcCC3J7rsEEJ3nriEf6DS9M
 Fe/rc0x4H0uU6SkzTDA6wTec1A/3pg0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Hi Heinrich,

On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
> On 9/20/26 09:18, Guodong Xu wrote:
>> [ ... ]
>>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>
> Hello Guodong,
>
> The RISC-V Unpriviledged ISA specification has this description of 
> extension B:
>
> "The B standard extension comprises instructions provided by the Zba, 
> Zbb, and Zbs extensions."
>
> __RISCV_ISA_EXT_SUPERSET would imply that something else but 
> riscv_b_exts is in B. But such an extra seems not to exist.
>
> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
> change may be needed to set extension B if riscv_b_exts is fulfilled.

Thanks for the review. Intentional, and the difference between the two
macros is whether the extension gets a bit of its own.

__RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
the name only sets the bits of its parts. That fits zk, zkn names, which
are shorthands with no identity of their own beyond the ISA string.

B is different: it is a single-letter standard extension with its own
misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
of exactly those single letters, so the kernel needs a bit for B itself.

A is declared the same way; with the spec defines A in the same words as
B. If I can take that as a precedence.

IMHO, "superset" in this table means "also sets these subset bits", not
"contains something extra".

Guodong
