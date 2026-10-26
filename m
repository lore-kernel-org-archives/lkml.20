Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020721;
	b=BG6cNj6QZ8cHzOutKdaGn57EkFZ1O7soOh8Lf7nK3yuUoeqMzPbUymkBt6/5aFghS/qo
	 SA4BcOEdT7yZB1cX7hc+DxCqumJfatuckHSQ0i1otcL2H0wPc6Kywbq1qAm57zc8CXrkO
	 f4EESnLzJkRLyYjcIEvqzCIXsKQkP2upTffupVdx2pwG48RhqjSZROZQGK7+c5HcWfO5N
	 Nd2e3Ja07AxVCmtW10654m5BVCq7WMl9n2T9cPj3i6qaEmO67kp4EW6EcZXRcGhrlFbMT
	 ed+nOJG2yFaMdhYFkNxlMVfMZBF0W1A1DZ/eIy55MuEMoJoBJwHEFxh2Ewjp1cnsFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
	b=BaiNmfGriQOFSFsepsMZKn6/5BchmX+vf+0RKbHGokkk0r1mCtccUElPbV0XFz59NvUN
	 +kCM+LGo/TAsmgdjldQFwBjGc8ErK28jNx6pcuVZQNyRd8YeWac5dZaA2tU7JMZRN3o1e
	 h2kDc1w+KpEHshbIfeWlxvWBnDx2UOIL+LASrsPlETBsc+dwcn0RepYa3FJirX59syXVW
	 I4z2qG5jbXg+I67DkJ38yGYyUBq6pDFcMPzjaQlec7zS6YxfzDN0qCnmcHuPMrXa7Rzjx
	 Kcc+MtyMtTXOyNVq4E8cRB762WqEEUnVKPiZUR2Y5366cd5UhO4DCq+78t6JW7/Xf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqXfStaP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgR6STkw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938F3606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938F3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqXfStaP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgR6STkw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9d44126506
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d1ntf/q0XoO
	vro2JpKmW8goo34C/1E6I72Zm2anXLS4=; b=VqXfStaP0M0uiyuTOYe6IT+O1SS
	h0IofaVGjPN3WKApu6ku71FGlGyYiQtLlxhNmk2xEIQlsivOZRSo5DEbEW9I/xtt
	Ns6uFJyMtN8p15wPOku4AgkQBXoLgNhdQE5zq9k+oRDTDwhwTbR6lTNEkakJpzBu
	t49gbhuM4IcoDGqzyU/yf3rskIZFsWLLnX7DgTfGk3HWf9SsYZJMTGOhsRg55ay7
	zJjFXXV9de2hdgLJiodkSFm/l+JBh2UpH9cDujJT19U5ocnflkixYQgFspeuKecC
	5kamEJ8/BzMGsYRMhyxrMjZmtuaWbC/4QKvh/B9olben7C0DxcXfkYey2IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpthug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so678962685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020719; x=1793625519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
        b=dgR6STkwpFy622G8ukK+Zp+OVPfl/nsil7i9XGoOXQgxhko6IrtArEWPqHTTOLS1rJ
         Zb+whEVEDM2YxEgfwHbv/SD25UmrOuXelRYb2uf07qUUkhWpdtq5I83+uKWKPWJ67SV/
         4KuyvQM4thc5nZwW2EDXMK5gnTqG+XKG/YgZfadJNhtvuA8qGsl9Khp+c480I25QMvxn
         zWsjUYehz0xtSJmOXWP6rmmHk7maI5raYgrS0bcqX9v9NFsVQQSqPh3vZUMSDcHcTvU6
         WF9zBmvmkip1jzRzdKGQsf9zNdh5Y/OpAIe5WXzebbSqAdG2HB68DcprU7GuP1tt3azC
         LagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020719; x=1793625519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
        b=P7II+0kZikgIswhsjO07YhV6QZsL4bvjUL345MrgODPYYTSVO/IdGOtg46YZ2R2/Ds
         9PfFCNkZD7SzGq0RN7X0W9f5gXwXNoK0GaD8fde7Kd/TEYgaOsKDsroco8MTGDQuXnsZ
         zFrAcYa5fPP5RBNn9bK/8uXpjtmFmNxqezr1yiTPW3x507OcZUXUbErBP1rYAkv3oypk
         HUr1KGp3C0Vomqru1FXYQ62RiH/hrpc7MX0B+mzFEExahz5p/Mi0WsGCRnUaqmlJsf4X
         n0RDg1jsURr1AeuyWZA1wWrCkQ3xyIFblMr9W/EnRREjq9gF4Ic8M1orkHP8DYZPK1HL
         5Uww==
X-Forwarded-Encrypted: i=1; AKwUvBzfWey4GV3RG/bfrkyr4h1GAfGwzmMSlZlUSVp9L91Tp2qDdLhbc3KIMok1CnyQG61OfkQUNWaXj8I4ZSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYISHPnOzthWSntskRNxkeOyAMqUlkikYjwNs52neyD1xGyIoSDi
	/bv5g13jCG8bAzTdgvCfCyWQR3lvldLVITzIuMcFYrrDcPZS0X3XZN0Fv1g1SXGErRY98sA6VGA
	16wH6v8WBLqMbEr57a/S2WlV74xp8cK6D5Mb7RNAVQpo8vxtOhuIci4r3hxE8igW0234=
X-Gm-Gg: AYBFou10OW67fgd3wqCheyOAOL5HCUz6yhWgjnN/+f9h6to8KfmBcWgxd7NTSyUXm0U
	ua7G8CEE5lQLS3kVty01o5URpuO9ewN0DE93+9KuL5zehT8p21IBOzjf5L486BUYt5tXk9iSMQN
	Zjcstcgw0KwQk1dqmnVvuEKIeB1tBtNJlYxw1WviM5XTtc8Lwcb6XNM9kY2Z8W+nTO1d3yVUxSO
	4Q8OaIe8aPpKUwccUS49ylaB6PRuq++bJEW0vEmQb4QZcIHu7PNz7SaCrQUZpqUKjHu+NqEn0Y7
	Q+Ut2v1j6k8RxpBAaIXOPaTb5AQR8U48PUtxTS/0qPnPCKO17rArVJnEiiTPmCBfyIDAlpRJ0k6
	C39wY6YPQwqIPHCzi1wNeKK+a
X-Received: by 2002:a05:620a:4ef:b0:943:e872:f521 with SMTP id af79cd13be357-943e872f5bdmr325826085a.9.1793020718776;
        Mon, 26 Oct 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4ef:b0:943:e872:f521 with SMTP id af79cd13be357-943e872f5bdmr325821385a.9.1793020718181;
        Mon, 26 Oct 2026 06:18:38 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:37 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Mon, 26 Oct 2026 15:18:32 +0200
Message-Id: <20261026131834.3247963-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4d01af69-0942-47a8-a1cc-be52f520184d@nxsw.ie>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-5-atanas.filipov@oss.qualcomm.com> <4d01af69-0942-47a8-a1cc-be52f520184d@nxsw.ie>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX4DyjgPmjQsxj
 /IBA7AVD9StZfLciLkQ3hRDC9TSHLMNNHCEd8+fwNRcq7OVqpG4kVH9nVX1I9QPC1UJqwojXIkJ
 QXSOfYfVrCecRMS3YWTrJHgSAY8KYAI=
X-Proofpoint-GUID: eV_oEIhyh-bmqkldqLhzodAb3FeaTmUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX9MPstbI5qPHX
 TCBYxnt7PilnA4XxASbtxjS4T7gVRVtlPkJMC9npz6UlbEVPxx9pH8HlxQytUCtWWJGlpirPhzD
 /ZgLhfcjZl/WoAyePI0HgCbN2JXxdHUEq9nWoVnUKmfe2SEsBo8SScH/i9ms9d62t5rfshDvjEP
 hJ0hNVVfWyNxIHJna9R4qI9mpSXZL2K9vkAVZ+YXm2UyU9ldQyXIzfQjkXO2UAFS9dr1elMuD+C
 9VopsxPFifB4AcHQKLhdeOE0+ZHMO9fa61D3tJgOO0tUbGjo340JkBHprU9Sk5x4n5D36DbhtZR
 LGFu26Dd2zjZAKWjOL04CxmFX0DVg1apQwEeW3+2NaAtknuyn3XiddpPqZwXFJxr5qHM24hnMgL
 1ZU6iBf7rCeqb5xQyVjCTV05V7Up142J+RJVdLZRJeyXOJ3GRfLLAPSsllRi5IfljGxrYvgI2Fd
 ZWqqDUjWvEInudNBbMg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf532f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cPx-3dMFXJ-tvbuS-X4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eV_oEIhyh-bmqkldqLhzodAb3FeaTmUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:13, Bryan O'Donoghue wrote:
> clk_set_rate_range() is a CCF provided aggregator which will allow a VFE
> or another consumer of the same clock to set an effective floor -
> without having a driver-specific voting framework.
[...]
> On release, relax the range first and then clk_set_rate() to the lowest
> listed rate explicitly.

Agreed, v3 will replace the clock domains with clk_set_rate_range(). The
VFE will set its rate as a floor in vfe_get(); in vfe_put() it will drop
the floor and set the lowest listed rate rounded with clk_round_rate(),
so that the result stays within the floors of the other VFEs.

Tested on RB5 with two concurrent streams on VFE0/VFE1 and on the two
VFE Lite: the shared vfe_lite and camnoc_axi clocks stay at the highest
floor while both stream and drop to the remaining one when one stops.

The floors are aggregated per clock only. The AREG clocks of VFE0 and
VFE1 are two clocks fed by the fast AHB source, so the floor of one
does not protect the other, see 5/6.

Regards,
Atanas
