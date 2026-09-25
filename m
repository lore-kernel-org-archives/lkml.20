Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE3351C20
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329424; cv=none; b=ltSD37Hg1PR48yn3xLllu5sAIW9mWnU0hsn2g0Ar2RM0dbmH8+cv91Skksr/Ojh3fjSNnSB+XMZyyi7qCz2KqvSseHAguSy55l5d1NA8nVIFRkI8jOvWnvh6cePJxbL6tit5jv/XppqqVzu5zowlKYDsGWB1dsDHvrPYSlVs/dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329424; c=relaxed/simple;
	bh=l6IRaI+dV4k/mMZV5b601pyccv3/YeQyQFNvf/v+a+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiqmOmgEPb1+eJAfsriRCeBUzs/EqAEEsb3lIaznO/xiO6npLoDBtUvOH92b6ZHmbG0A2JQJG/knQmaTVJFIVf0XPJBGcSOcaoJY3k0OCjvwkBa6jL3dleDqylly/5GEodK3l1sM3jjyu4UWtbVYNahFxLwegyKQN9yLF+oXQWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1WoSacp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaUOY5FK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1WoSacp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaUOY5FK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yc8a289534
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p7f7+UakoQrWZBiD+hsXHAx4
	mws2Jt4zSWi3n3EVJlE=; b=S1WoSacpazV92PtqOVEedB/xrZFnfrlvMNyy4AQT
	TehCC+ri3g/BSeAYtPM3z5CQW9Z2oSrWwuUxNcN4EJm8dWZV7NXUcZ0fujf8Svpt
	enX6gw6MJ3O5jsLo/DccIuczEjmrnFniJLG8pEZl+pTrKApoRll8P2Avy+1cm1zG
	1psfzUC8v3Pat7se/vyqHRRKJegPCfXkA5UrQjIMLCkIzhhse8BPzBMDM+rCajFs
	7ar5nU+0CnR1hnfvMvtNdlthbnS/QVS69QYwiBZMx38WkqBAe3IoMJrpf8z18ruj
	rSqCTH9NfXWW3f85mRuFEmjEmdaVuZy9BteknIu3cigKIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tydu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:43:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so142523685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329421; x=1790934221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7f7+UakoQrWZBiD+hsXHAx4mws2Jt4zSWi3n3EVJlE=;
        b=PaUOY5FKeRY2ReCkWgWRNPR9BPkIR3CVW40StU3Puwg1OkO7pUWLB1FCJgxunBmh6o
         ZlR3WwNo3tylPdis6fjY30TJ+KSnyiYfY401GdLZSfuRmH2v98E5/ipX+PWjID2Ek1u3
         yb36or+/NxlOSKToi6qMbRUDgDJE+mDf3rTyMFzZ+7CQtUpSGogWSlFdnFqf2lxxVKVm
         VPREP1h8diDU+CbTftjHeuz5+SZznZ/IUVCgpHaHaxKbFG3yKo4f68+v63n9+rbFRqfr
         WYd6UUkZ3WXZOg6SMh359SktXzbdbZrhTcY1NpFOtTFvxShmiHmrWb8aon2OQCKw4zMR
         u36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329421; x=1790934221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7f7+UakoQrWZBiD+hsXHAx4mws2Jt4zSWi3n3EVJlE=;
        b=q4sBZFBrz0ehwha8h8j99kOytQluxzwy0E6OVVRdykikEFwUn374Bz9TbdTpZuAiyB
         XiQxWn3rAgcE9IBjp/sp+lY6NulDjMvnXiOBXqKnrI8WJ0699bQf0iXcKwn74CO148x0
         Te7V4C/M0U0hfS65l1F6i7cr+C+VDS1zf6oPGoeaV1Ezs6+opE9nwiAef1goc60QQrza
         6Bas9/cOdZEsXKjLJR0X0ZPP0ZV32KBhkpJR3mZFyfqC3Bqq28OQLbWepPqRrA9N+2AR
         4EVvCMw5ptDGWNLegYatgntWOWnxFerWbsDY3+pJ8OuUEqUD28T8qQl5aEVGZ6WfjLgN
         uFWg==
X-Forwarded-Encrypted: i=1; AKwUvBx9XWFl4c5aiT8EvmOZzLjm9Yjo8YopU5uUJ2xkdVlg3Z/1Ww63+cH5rokSfNj1TTG2DyZN9fWsjWnx9ZU=@vger.kernel.org
X-Gm-Message-State: AFuF++mL/n4K3UZcpEkABBJJrUdZsLKdoM/pgxs2PuGDUBX7LSzUBuPd
	dUrJ8gYjc7mNWukR+LjVtAolgpK7U0TkaiJ5U4X1HjiIeqUDgOoHscj/C+kEZuGYeSH4jN++mHB
	/IYhAF3X9beu60vbpZmasmQJEvErXFmevX6O8PWQRuyz6SoVwP5owCM8q44NO/+pPcF8=
X-Gm-Gg: AYBFou1iBmJeWZLxucFygWnfJzqAa/ML2CyXGKg0x/vjMi2VgM3QSNlebwUxxjvCWUt
	c0BzQc6TP3+mCFetl7YKNuHDNb8WSaMk6sqfA+5S1u5wHEgeAIOplEovDONWHMLonp0taH3c/jf
	S0u6KUkxIeXyckMBk/CNYVBKZYH02axPL/vL+k/Cqv/P9OWjjE87UKoITeTUpcOZZB6KdhHCwg4
	oF0uPzJ4fInTu1bIhOFQ0nigKlGvthvPXzJkjKhLeTcmXSgXmbL4nhJDH+zgpfvsi/NIkukm4rg
	rY0OB0jND4p/e53E54x6ywNNIgzrlLu02FXb3An2eY+OwqZ4IaGwY80JTy8QHzQXcCgVwQC50BI
	rTH/1Oj1G97M0fWM=
X-Received: by 2002:a05:620a:414a:b0:939:191c:cac7 with SMTP id af79cd13be357-93c43b7e4edmr353675585a.13.1790329421411;
        Fri, 25 Sep 2026 02:43:41 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:939:191c:cac7 with SMTP id af79cd13be357-93c43b7e4edmr353671885a.13.1790329420834;
        Fri, 25 Sep 2026 02:43:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm53968535e9.1.2026.09.25.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:43:39 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:43:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
Message-ID: <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab6424e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=i2aUADT-vu4eOaQSyNQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX849EhFkh0FOL
 AMXmvvCuOvLGiDeWCH9u1RkjMHnyVq+fuRVzIRkrGapUFdlxppZMAKx9JT+E60t4G4Yfk1gc321
 j/lLpGOPKiq7tj7YvdZUVx1UMehw4pMXhG9GDywSpY8OLwV2eLLQfe0/j7gw1J5nGRD+MCCIRVg
 3AdVJUb2ViUTjxd7kvEDQslrF4p2eKz4ujfSBH1D8qa/zWP9bdIzH7Fm4FfHTsIOMoxf93rhua4
 M0SVemR4Hhty97zyHw3OhXPlY3G/6pGxBj2IEVp+aVZfPQFzzX58l4pY2RIXi7sCnRxE/Zt6XCy
 fVYKzzpEGP8noDOEoly/8eqUyiJUwwJ4gZEjoDzFm6PjHq7hvNly/qklejKBcFBF0t/geaT/Vn8
 Jn9dZeUINM0mqpjNQTpPOJnzE4+flgGkLoAqpOH7YtQTE15/UHXSd57dqaBFFjAmfheiMhjpWm/
 h2+/KtgcvEXgoxZIwQA==
X-Proofpoint-ORIG-GUID: Ex_ov8Isr47Qa7Pm-d51KcIVlHjeLBgm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX+Kv63FrBr0uC
 +DFg4djxAA2YqCfeg1Z7r62/kHN2HpQVBMQCQzMRdx1v7FQhMxrV2E8s4ZDlVOoSXBpCtHnqxvr
 R3HWz2G4Evvs7gSfdcAG/ieh3/8EDKI=
X-Proofpoint-GUID: Ex_ov8Isr47Qa7Pm-d51KcIVlHjeLBgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250038

On 26-09-24 19:52:32, Gaurav Kohli wrote:
> Shikra firmware handles CPU thermal mitigation up to 117 C, while
> Linux CPU critical trips trigger at 115 C. This can shut the system
> down before firmware reaches the end of its mitigation range.
> 
> Drop the critical trips from the CPU thermal zones and leave the hot
> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.

I thought that was the whole point of having the critical trips set to
115 C, so that the kernel can gracefully shut down before firmware cuts
it off.

What happens if CPU gets to 117 C and the critical trips are removed?
How will firmware thermal mitigation handle it?
