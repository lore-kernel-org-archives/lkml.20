Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28E437A825
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643726; cv=none; b=N/SGuhGgOYaoxZHABHDvDK4jbk/RD8zDDM3zNbnpFLGaveLhgl2iZAT0mN5ma8ONWamIIAcihjonX5l5NbNaOa6lteCH7PjObZs3cIaOnng8kCzO1lQVTvRsh9y/wKoZm8Vn5xnOGq7IWcMSaO3Rj/hz6Az5uQgj5quJVGrSaoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643726; c=relaxed/simple;
	bh=usUxW6MjATyEbGVpjuCjv6xir1cAW4UXdSpBftLGbL4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l4XEglPYqkTwlezXNnMhKazTj0bKHao0kWJ6yUiDJ3LB/1Z+9RlwEQEoaCCs1m3Vh4NXs45FOulwb8MhLE2r3GZSY4OUDQ0YJomW3JZLJgdEV0ueCzN+rGhYb+k1lRt+cypemOAOhP8w0g4lBjTUAreJ+VOa+MZgIY6cEj0kAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyRdPm+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDlKVnay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyRdPm+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDlKVnay"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACVJxu289603
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcsVVrQTy9+oPzMIs3wmnifLrbzfhME2W7FHzOhUhMw=; b=OyRdPm+y16ElOoNT
	YxVLDNn0CxeULMGVfzgONvVKk2MwRS1h18xKrUH9dQ7FkhnM90G+7fJShgMNDFuV
	inbFcytPbprA+Wzo5ZtG6NqoVz+B2SCq4wNk8aSirz7Kox15AJE9UtYMiwYTpMLo
	MwE2qae9kHPUp0BxnzcDIJ0A8uGyABTXdDC3BmSYuahtoWB/4nxjkhJvTlYhYQvv
	04LOayrENCzXSNvn/MX4uEPbZolfZXKLxWD0LYeAjxkq8XyqmoveUaAIEaFBl6GA
	7YQ95QF5WMpEEMmHbqh02du0EVKN242IteSvkVXu/1hT3BdVtshltHkvaWlYqMgT
	5B8Mcg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpghawe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:48:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3592749a017so79013eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791643723; x=1792248523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcsVVrQTy9+oPzMIs3wmnifLrbzfhME2W7FHzOhUhMw=;
        b=EDlKVnayTOAwRj67tWH+JixUE4Z52uiY2wT8d9YmodNkHr7U0KZBbVHgUTwS/O9Tke
         qzeXwfujzhw4Gx9swFg7xgzLQptUncOlp9HFWMQXOGxv104V6QcWxJ8wefBrRUH1DceW
         Vbki77NeMNsyA3IR9SKcsh+50tFT4sb88hMASXOJo//z54ivV9aLj8vustldCJ7dHadW
         2zCZs6in9bpxQasEi4h/yl/lw1woZbCwADUNmQzRqOHww+rgSrTQyImVxrM7ED2dBvag
         F5Gbn/uvu7ShoR5PzV/gLYvcArw775s80rQetgrEpiWgfxShpVcEytYKySe+2nXeuv/7
         eTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643723; x=1792248523;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcsVVrQTy9+oPzMIs3wmnifLrbzfhME2W7FHzOhUhMw=;
        b=DVnrGp/U9Ia0Ezx+HrWNilxdwDbDgsd1af8vEajQ1OhTXU/LAwEKAjWoAKqOUjalYd
         yAEWJ7AKifUvVBPIV4neXdrsPW6+kg4AKld24WfmGmzFdz92hjnFk+mntv2QipKgoOZL
         2oK0Hb9zvMpbPwdr/JaXXNsXrQdKKdJd6sKghU4V9xj/BhrIx5hLXQ9hAISjwAG93D02
         35VIF90096tHck9XYZ5bmGWCQ58wMA4ZCId38KN8aI8swyjfI/VyV8U8Un51T3P6Wpa2
         rIJe2kFLocYgbMBuJwQ6XAS2rIjpTOGSj3hcT/tOG3/FP/x+9uR+iFJ/2nRNScNkKj7V
         /FoQ==
X-Forwarded-Encrypted: i=1; AKwUvByLiE5hq/4g2HMsaNlpYKon9O4OOuoxtU/HRoWqrDK6xiF9XT9ro6hztS7kPxRWh6YjZwlULU7hOAgnVjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8W6bbY/9wWSU2Prj7dXSOmzsQyN8lWmUglHztNK5Uh6x8REY1
	B5CJu8i9hMpL95U6/xN76yBAY2oF22+9LUe0Yk7RwjC0MfMnMO6hNa37Nf4RvtOO+S28k39gYmH
	mm1z9NuQyWzzmeuOlimTh9k6moH4ba9eZAEsaWBmf6ZumUrej4bOu1pxGdv63M56mL8o=
X-Gm-Gg: AYBFou1PRNlajuuZ4PAQ18S1Z+TAj0xtLIrMwlpc8Fj35/wU5T2HPqtXBrboAxJr1L0
	W/RQAk/lxbkAfriWAqvZsJGblj2J1uKaR1S16VAxKt0RNWwK9LVHUjmZ85IrxnbeVHubXkagfcw
	2w2uJV82GLmQ2s0ykdn23nk9BkwD2Fv8o0VtGs7lZLKtCsMRoYvW3oRbJlG3DScZa81wbj4bM6h
	y2FfRgMkXpJBBN2O7Qxj4YBXW7mZVofDX26U65aPJkWp4h+Cm+9rKIWToDn9j6vMpoDKD6+2wEf
	tGM+TIQlfQM+BXWnA37YvOPUKzz91m2AYu7B1uks8P/QR0PW8CYi6Zedsxoz7VgTPklaNbQ80AS
	VHwSqEOGjuVyQd4ICrd09iZ/8D5qmHFrooqqpsoWaV+x4Slbwd8fxFQ==
X-Received: by 2002:a05:693c:821a:b0:357:ee3a:267a with SMTP id 5a478bee46e88-357ee3a2dd9mr3597881eec.2.1791643723182;
        Sat, 10 Oct 2026 07:48:43 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:357:ee3a:267a with SMTP id 5a478bee46e88-357ee3a2dd9mr3597828eec.2.1791643722385;
        Sat, 10 Oct 2026 07:48:42 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm19713287eec.14.2026.10.10.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:48:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Configure RXDMA buffer ring
 size per memory profile
Message-Id: <179164372163.2359474.12323997868750930117.b4-ty@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 07:48:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfX+JkuTEg0Y22o
 1u/eN1HZGhigiIV5yvUaMQAtbcMboSK+NsBG7nwxybFRxpjXtfzKa0FfygQlzw/YVtrtWLqZaPV
 Dut8mKBHqEf+C8fS9gvkFfliHsGV9NQ=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6aca504c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=O8DM5gnZE03VXxh4g-wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: vEzpCUzeU3KgFu46cODyE01QcpGzwJxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfXzC2K/ZvXiBcU
 EQdV1qTyVQ3DJ/9rJkMlyDPCLTvcBT8c7ZTwo2FFEyhgNPbkXbVQrzUUA0dRd33BWLpGTNOKPAw
 yAvWKQzkNOFEWTGZziG4lHKD55GyEtSUUbBFL7LbRNo033NNKwzGFEr5se4udmBjPS9o1E8g8VL
 1l4414+ArOAMZbhpRtEU9l/6kl0eUlxgM/iNpps1MrtUkm4UNMtxb4k8n6REYIr6dvxTED2W4f6
 1Ms+O0YOXK07dkYMBxLWXmt7bqh2amkg5fnRqmjuPuubb+DNK2Nm24N9yB4x9U+QyFnJWvfZ/jT
 DcASAgyWRw3m/lpNDs93GSHQZEOBWmdXTh6zFw7Jb2487EjH0oCgyH8+Bsozwyyp4oLZNmA1Qdt
 lzlY/tAvzqtBbzKGHbEjh9LWzuq9RimzFJXDUgtnBpnnwMWDEtZLwS8Hp3teex6Yj3FKOxn+8KQ
 zDMMoB58bmosXWHFpgg==
X-Proofpoint-GUID: vEzpCUzeU3KgFu46cODyE01QcpGzwJxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100058


On Wed, 07 Oct 2026 14:53:31 +0530, Aaradhana Sahu wrote:
> The RXDMA buffer ring size is currently hardcoded and shared across all
> memory profiles. This makes it difficult to tune the ring size based on
> the requirements of individual profiles.
> 
> This series first makes the RXDMA buffer ring size configurable through
> the memory profile configuration and then increases the ring size for
> the default profile to improve RX traffic handling.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
      commit: 643f0bf936176c114d5631da7547e991b5d99f10
[2/2] wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
      commit: 15f7603b69a83a0acc7fcc8992ecbea6110f9424

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

