Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4BF3F888A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155283; cv=none; b=NTnqs78IORQA5Ji8aht13OUtw/6M2OFxbU9tvvQmGFD6QaYVXk0fqR6ZQPzFQHVbgpBHwvVbUlF0kHqFdoMrRazu1ySfGfW/CDasO9ErHM4fEswJxiiNln3uE6EfnYwWLtY8LHXd+BI7VXyGhZo0+iZ5lrVxOYpd1ZVRP9h3eko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155283; c=relaxed/simple;
	bh=x96yRi+rg72nO2L3bIVmQsQ6SzwyjfTCHUgMt0kpwJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUVtKKF3wK3ETlGGd8UuB4yueNaI9rMuOZ1eEyL951vFRekMICsWyyIwnMeozXWQD93phPa15jat82QGfc6qgLcBBo3Ikm2AQ9WoZLx+kyuZmOqRAtFuxoqCZKBeP4llWmOA+0OHX35KJ6EjDh+z3ZEAUm2r7kiFyFbsRS9TVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TW+N774G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDyReAd8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TW+N774G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDyReAd8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAvH4J1503924
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XO8v3O2VsXW8MiGFrpI6qTd/A+X+oiAypVl/y9s5AYQ=; b=TW+N774GsmFf3Ae0
	R7RfnvUC0izCPo03cn1m4VU5C4hu2AjW/+vvrKO6z7PGzPfOn1RwjjmUXCnCCgh/
	JCyZ+o52FRf25aAt33f+zlYKY14XDelzPEAKeWdrkg57oNUtZSvsMlwD41ZKnsDc
	NGM/gdCtmdUhJPL0ULfEPSUnfXw+SegxQWkhUBkFLTRiKurA+i67pz/nZytTKKiN
	59RfDvcl5BHOWaba0037OETWiowYuVC3fa04Y47tMuAiZ1v9j1YIv0Le+0zt8bDK
	uq+RdTcsEtOGuoTJDMHEdqwqPwMzfETJTs89hE/QO7s6+FvhoBNTa0HlR0V47JjA
	jv5v6g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8c86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35d4538fd74so9140821eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155281; x=1792760081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XO8v3O2VsXW8MiGFrpI6qTd/A+X+oiAypVl/y9s5AYQ=;
        b=KDyReAd8Nuxch1yBO4/+t74xMLxcuUlwUGdvkitE/1qOtiMDQARU39TbbutaGxLwUc
         u9CGkGm5rn22Q01IuuWV3POQLnIDwqEIl408R4Ky44fpPfMBDl7aHtZJoOoHl+W57DOG
         TnZg/BMMaLyrcrO6R3YtW4Ddgich1j+4mdhM3XHaXVD1TMaZzhDOyP87kKM/d/FwtMRk
         CYCWjnKV3IiKbleSVLWbiuJSAUNqMOAAwRbgxa+l0nMpUBkGDOsNTJxIgxt50fAN8uf9
         6lA3UQCGv3j2ep84pxudQWR/5B7Cd+SStveAy2I0KK0BzcX6Ef9nSaTWG3OwMncyH/oe
         trVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155281; x=1792760081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO8v3O2VsXW8MiGFrpI6qTd/A+X+oiAypVl/y9s5AYQ=;
        b=tA2zEBFgQLDKBOewe+FMN4uVUktSAHRIndkJP+rQ0hqcOOTo2g+qd/1Ii9GlusEd6g
         9RX5MD10RENgD8/CFR9Ss06aZgXk912sxhIKWITRaEEeCK3v9eevAoU9bmTGOicoFL3v
         y/poFpijlFOwsXCcp6Ww7kckLW/mG6mtbRcXfqzoG5ItXEct2KZ0KJFQqjd5wEGWQHbI
         tGyXSpYburX5WgmPpr21eHaXbG7EIDuSCtbVDSsrcogd7UkUryUktNjJNiL56vpy1tlV
         bx6QNB0auIleXDSte0axZfRV9mN7oTpJksbni5re9bbJbHbgS6xI3u37/teMSJem8GDW
         XH/w==
X-Forwarded-Encrypted: i=1; AKwUvBz2pRnIPbi2brtUqDciG8Bx/qRgmvsSbHwt3Bgw0+r/9YVC+s4qFhnORjY8uXX9JdoDcxpxbhfY+IxVFFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAHjKninRdEWM5eNki7N4KQQiefdYLMCm72aud5q5deWvpAYFY
	Yg8G5OZZXWnEulPSV4PAixsJ+FIpgpcb9+cvhMIdkL6hpRjoYzMABN13iHzpqYHeFWbTHbq0lew
	t7TlZ2C+LnmUB17wp1D8hVPli6qYRqfHZgjIH0HjLvDsg/SCw4viDMy2JkqWxdjQT8gg=
X-Gm-Gg: AYBFou118MorDt4Vq4YrGzy+RyGG7XkqVuROgdkvxOAO2X2z6PWNhpD9rgPE5Z9y+FR
	3HYV+Wez9SBYmOQslWO582/XJzl/XPGdotH9TT45zRpzM6wP3QgqiHtrUIfC90kOCTjyN1JUlPx
	6n6D+8fzR/sBB9WwiLgGaVvoGHi/wxkDlAYVNyLZTsL7KwKMSgo38FRZ6HNEkXilxr29K63lrLS
	rJrcV1cEyoNXvq/G43NaORV+psgy7PJggg/BSMgWTTPqDY7VeIguhkQV8G+heNFLmc2CdaHZuIL
	Np9PNCGMZyL0qoHhcMfgbkcFhrhI1wWdshC1bVqL9vScwh+mc1d2denby5r8efJOqvlonC2cd2r
	kS6ORBk+L2lmgva3jOUABKSfjngUAxw==
X-Received: by 2002:a05:693c:8959:10b0:35b:da8b:f88c with SMTP id 5a478bee46e88-35bda8c2195mr17030978eec.41.1792155280697;
        Fri, 16 Oct 2026 05:54:40 -0700 (PDT)
X-Received: by 2002:a05:693c:8959:10b0:35b:da8b:f88c with SMTP id 5a478bee46e88-35bda8c2195mr17030931eec.41.1792155279953;
        Fri, 16 Oct 2026 05:54:39 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm7184042eec.4.2026.10.16.05.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:54:39 -0700 (PDT)
Message-ID: <bea6d8df-88b2-4f03-9da2-1be7d5788d1e@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:24:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] tee: Add kernel client object invoke helper
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b4PNeY1OTvClgSMwiHSJal8f3--YRgUg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX0lrxRVXlf1hd
 Yk1HczR2hvmpYfaKxNWBRhQqG6NrgDMht4ssFmtX3A+T0d4y+wcO/L0jwz2tpzSFiJqa+/dYpJf
 hj1mQIJwrbY6VPF5hjrbuthX49mRoeA=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad21e91 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IkwWU5-DNg5bmC6MlS0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: b4PNeY1OTvClgSMwiHSJal8f3--YRgUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX2mchUL6Iqxmh
 uJODXwZwysk5Q4Pd/EEUVYc6UT6EDmQ+q0tgzSyqFOeQuv8HAT0hcWl7INV7SDhNsMk4HoEm3gK
 AcAJXDZ9yx/0nK+rIOpFUoTBUfmxeI7d6bT6oJNbQPg+y5KGKlfUhjTxIxIGfcjTyKULVcgr076
 hHpP+CTIqdV85aOdjveggVY0j3LyJQn/WiEcYyFd5TwH2tVSYyrRNQoYQsL9ZJldS1XxeGNgBUx
 fGLit+dQFZn0KV/W4Gz6L8zIv1lkbarOUtYArkOnxUu1QLXgQf0M2EQvYPcvSccG0gZHICkni9V
 eDV9f9EIpilPOERGv2Y5Xk5a/PB1teXSjU+cMJ7UgAcQkCGbU8OQ0Tw781+XlOJMlwp2j/mn9Kw
 bf6NoExtbV+2BACc5i7+dT9ChOGLSWgzWAnYxJs2kGQfPrjxBWfrqm+X2FclvrrKQdG+6ZfkaYY
 n2sps+WeYzbj+iio6AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Kernel clients can open a TEE context and invoke regular TA commands
> through tee_client_invoke_func(). However, there is currently no
> equivalent helper for invoking TEE objects.
> 
> Add tee_client_object_invoke_func() as a kernel client API for issuing
> object invocation requests. The helper checks that the backend provides
> object_invoke_func() before forwarding the request by setting the origin
> as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
> privileged object-based calls from the kernel-space.
> 
> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

