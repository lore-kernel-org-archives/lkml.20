Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8AF4C10C5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212994; cv=none; b=ufmnIRkpd620K5JnMy0mSiWbBVG1swVeB0rbGL0zCpetYDGYzK5+5G84GTWqGIXcFtXiFhg62BXq1JNtSoxfCTxjpBm/1RUkAPY4QTJX/rLQ0X0nv2A/wic7rv8KVPwD2xMklvpyAOgVanx7WTxMNtDVYXcx0KwqsOp5EhCinGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212994; c=relaxed/simple;
	bh=wtI7oVDUhsht2iKk+bjn2I94OjNNDcnadTbMhHCgNyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UFt3WPrLXR+vx/bnk+S/ACmFRCqTku2S27IdQ9J3e+EmlI8RkdXdN/BS0wHXRQFhBq+S6l93asENUSUpldSl1QLpusbcLlrT2SQ27ylsR1Bbk3Faqssg7S0+zWw3MBUqAPH6IhOnbwtjcHYjg3VzVmoGlIFOLztkxVIWBd0422w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPgqw66d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4NbScrJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPgqw66d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4NbScrJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EOv9B1358096
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 15:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVaB5GQWmscg0rsYJbxE8vQsJhAyc7OQmJS8eF/75jc=; b=VPgqw66dCbZZr3T/
	vYEoQZULY6WyvCrsI/P22CIqOIEadYzZVxzY14pyaJlSd+yltII6PJxxBHl9k7J3
	5oxliKGHkUHU90GQRkFDEd3tyl1Ec7nb6LYZLOSRTJuqBQczZW/jOLweqb38AU+q
	ky/Eon8/vfFpLt03MWF0F36i/Et/sa6/GNdA5qO6YbpRJManxLQbNa9R8vyNVq+J
	4CiW+TO1N8wFKBNuszUVlQHF48fPXxhdT/970tADddSWuQLQrPX1yVj8TsBPIR1q
	yg1CUFnnoSYmB8v3saYAzx3q+QYgMvw4wCcCTTAl7fV/2NXLiS/wFvLPkHeOnWfQ
	+Uz/8w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cvngcne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:09:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8d1e91c9so34150975ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212990; x=1791817790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVaB5GQWmscg0rsYJbxE8vQsJhAyc7OQmJS8eF/75jc=;
        b=F4NbScrJw2JA/WrD27NlTBEtS1KVgToyP0YPQxo/lAlwyMzpPSp4yRJ1rTIxOqNOtG
         lmCD9s8vsM+QQBf1tJukryCCdWXFZX8SXlETGj/lD4R0smpFaTHJU16wbZti7jZjyu8h
         GIXMoXMEuFgxjhDoxg6/jwLwP2G9mn9XusMMr2UfjfLcNrZiaD2Oft9vZ1tB22mPMMix
         Eve3D1bO8eoHVyglD8A3Jk4bpNDx1CEGF/WfN+izWK35QfRzNU+et/3oXNVvsLIEd4EU
         ETpYUGxf7ZnD0t7551JOxDJa1/OPvDNrRT1ZLd60tmNEDGwxoOQwN8F4OOzc3i2aL+PK
         V2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212990; x=1791817790;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVaB5GQWmscg0rsYJbxE8vQsJhAyc7OQmJS8eF/75jc=;
        b=bQ7P4v3aF0XUDHy7mT5MCdIB15ksQvH+KM9TBFlolaXL71qnjeh1zG5YoPkdd3s3VU
         Csc2G5013aarj50F20pXgOoO66zVq5PgwXON49JfM9ahNGJqlFZ4yz4Lyu9S73jxf68d
         3GnB4MBI+RELp2XzB2X1EwqZT7kfYBoQRa7m68pU9zALrsZFPVRI69UttAxzs8uTBF+0
         r5Qtl/5Hwtjkva5dAC8KayhCp2zSlBL8XbpQYRxJdu4mPKMb/Cmy6EqyH0xoMbZcuySz
         +UOXnxwD99U9hKmOT8+jJxiOehHuFngEr2nItT0IKP/+O7fjqeDuDpqnRCfTvinLKM76
         A1xg==
X-Forwarded-Encrypted: i=1; AKwUvBwqggi6H1lTbNupJbw4XSNu6xJMgOFHelLN4QdUhWf5Gp/2A0Y28EhwGj7mNRpUM/MUzAQx9RzQjJ4PeJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaumtV3KHYGVrCt6Q5L8zhVJ0oryrrkL0VGar+Ln7NUucmvIJD
	4l8wQGQul89z2km3nAeQ+x0N05Tpf6JOW9c2AmGo2hfct+nNsJSaf5XXdoQa1WAfxbPwrMoRG8w
	ayVN6iBTZYOUexI2cs2O8t20QvIA5rIpuUd5k15M6ZjRoeRrROkkgHfCc5wlvEzSEQUw=
X-Gm-Gg: AYBFou2nSMN7ZAuqXa71mgUmr4oJd4GUplug0fFhXL8kdvnVqzE9OR31INwsJGG+Edw
	KV2IYKH952D5H/V/7oIGWqXSG9xLL1b6Wwbdr/222AXlbraGZy7COk6JRUtvoTdeMRUStursHvL
	GSw0iD/Gr/lAq1SDtpOZjM2GES4GLJvGBrn9frRJxZ24pOeSgwBV3YVSGCLLHeRxNJVUc1P/Cie
	p+Nu6ZOPs5RQvaUTIEUcd9na/K+0IKmWI3RoIe29TCJPqjmAT47hVu2MriQqukYYzWa3d1QcRxE
	48NRsWqyB1z55EwwLCtmzvtK1MipLiWq97JR/Z7CtpIDpo/TJqDHon1NMhtY+cunI/GOg7oQPsE
	xNx+SIwbIFSvZ/W5tNPiSRyYhyvg/oF12aBtkph/WZh1rtrJvJCj9hzw=
X-Received: by 2002:a17:902:d4cd:b0:2e5:a350:34f8 with SMTP id d9443c01a7336-2e5a3503728mr21624195ad.3.1791212989865;
        Mon, 05 Oct 2026 08:09:49 -0700 (PDT)
X-Received: by 2002:a17:902:d4cd:b0:2e5:a350:34f8 with SMTP id d9443c01a7336-2e5a3503728mr21623775ad.3.1791212989310;
        Mon, 05 Oct 2026 08:09:49 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm9130075ad.28.2026.10.05.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jiale Yao <yaojiale02@163.com>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20261003095913.575108-1-yaojiale02@163.com>
References: <20261003095913.575108-1-yaojiale02@163.com>
Subject: Re: [PATCH] wifi: ath12k: Reserve space for a string terminator
Message-Id: <179121298789.2358654.17588785788531487721.b4-ty@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 08:09:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: TKZKUyJcwPZseAD49hz587VIpSaEsYQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX2CTCmyL3ri75
 5CA62NGGKkGVOGcQNzg4AzBFZOtVemOKrYPO4urxXQ/k0GfjxnydDUy8ggPVN5huj0kwXlPqsCj
 +UrmZruAjwssEx1g5FbaqjjOXbeWPK7vcgawQ6zsJBz8/KQB6bn5/gmwiZoF5XDocquCFgcFQe5
 aAnIgvy3Jj3K6y7pUpolJmS4mPonPOOZbq0AW/DqtrGJq2a6EVOfOu/Y9YPWMRf5vLlmprbk2Qv
 RmNCWC8TgYplWcj9dUdVkQZPeNqFB1MP1Vu7dguoT9r+cQxyyqoeziLaTvbpQrWHV052S8jdJi9
 uLwChw6Tu1zX8/SL4zj/6jKAk7K6D6PdQoW+T+vQQ0TgxIfCpPFTVKUwVKuu/Iuvhd2gXgkDVib
 2f651Na1/NBcouGYIweSNkeLWv9ha+WbLUFm4JaS9N/y36YhTWj2gPt+iSGKL5N/79bwWavWcc8
 CJakpKCzk4sjFFcvQsA==
X-Proofpoint-GUID: TKZKUyJcwPZseAD49hz587VIpSaEsYQY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX7KLsSJJEZiNw
 DC5WLKXSX5U52yBw92M8uTnT+Btjr+ePTfbvVle41grMctFldw629DWJoSNrbCf0o6T5DySnXXp
 GhdpIMk0f5Kfp3qVG5otajjWzKI/gKw=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6ac3bdbe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oz8bYcBotx4uxxnimfgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050059


On Sat, 03 Oct 2026 17:59:13 +0800, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Reserve space for a string terminator
      commit: 13b15eabe2c541b80406166964cdc8ccb5e9c32a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

