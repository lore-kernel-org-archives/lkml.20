Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F26480DE9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158111; cv=none; b=gAjl5WR06SWj4eN+N1SJFfZCPquhkOWcDFo1oZjlHPWqhyHx25/RJXBviyEyPzs+AiYxwwbBw1tIhYKpmOrepZ/BufG7g62LKpzlG6LHMYtt5E3yIxSIHzKg0rsvDAA1GzwptgTEvwLMlOaYen4taV6i3M82/EO6nSZeKYNA8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158111; c=relaxed/simple;
	bh=/zR8X6sWq9nDJwlulrdRxs4JEZClf9bzUIbyy6aGuMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mfn+ADbEPuP75IOi5fd8l7tmKi4mTh4BBaDnghFMcucZdJIsVOw3MfXpFdEq0dxPvb+5CgVA5ooE+wuTQclWgE7aVauWX9P8uUNSrHCBV+Pjkng19Zu++sHZmDO9TxebgkB7ZcOWdFXZfZHLa24bt4Sa9JQ29shY9qZG1ho4pOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QMJa48YV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdyI3gcf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMJa48YV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdyI3gcf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAMHL488641
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LLW0dwvOxGWpHegS5C7HG/kvWUkdwyRzWYnnzVJQotc=; b=QMJa48YVEcz4cPgI
	11UqulUYYo5Bi3mi2qAw5JB7asvNfzBrmcf/eIk3pghjWlWzYkbs/Eb6YvYzzk0w
	Y5Q4BtnMFqIuk9yAKmpDkdAOsFy7Jyz5a2B9Psn5NW3pxGZCakFrggMinsHiJDvi
	vTz4P7YDQD0ytBudc+F3c/J1cXkGYcTsg/mBqb+dzqnT0s/gegmPo7XFp5wqlcIb
	ytMOG2ijjrzMlcbJtR2leQABtlUJhvTQg7zqTxPBbDBp0fWcVXF9l7fozm/NQSZ7
	M6g5701lLv3R5NmOxvPalCrmppV8O99WEK6vxmsKrzMr6EU5yl3qfOcUAaRYqwmL
	8zBxWg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjta2x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:41:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91792488228so138378846d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158108; x=1792762908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LLW0dwvOxGWpHegS5C7HG/kvWUkdwyRzWYnnzVJQotc=;
        b=PdyI3gcffOZxlXP50kTuI/UWjJS4ES4Tp+2hFfaofhWhwN0NkTPcUCxWqGeSp4A7Vr
         CPiMq6oOe7FiQKQgd/6Kj8OevDakOW0ySdsvGwFhQcncaBp70txxHmwp57A/ViS7uGQV
         qwvDryrOO9gAeoN5Oo1o0CyX/EuNS7UyOtrNBvSF8QL1VheiU040jJ1Qkrjrc72OinII
         uvZYeY5XKcTpdLwfrl6X2/hDiKGrx/t+iue1IIuJS3i24DNNKH/D0Qrx4Ql0zrl/yivH
         HfAWC6zuGdvTHqxBoVN2XoGCgbMkPfSne8cgolwwDva3Do5ztmZSzQ0R7BBcVx4CG+h/
         AiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158108; x=1792762908;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLW0dwvOxGWpHegS5C7HG/kvWUkdwyRzWYnnzVJQotc=;
        b=VfQSXUNUX+yGws7TpdTgmsE1986F+kLyOckttmBItZhvSuEM4Wb4v3KtoI3SUMR/jB
         is4e2emy6//M5Fpti+uWk5ihB7KoHvq8Ly+Q0kNaeehAXJjMbX6LkCzFSFLkLqfhQpBR
         hWrpT7O2bMvGs9X4gKdWzzQil5ufkBGea8YVRS1bY3RLz+erO/xog+dhhKgFh5FBNRLT
         xsbKAgMKwtl0JjJYE4FutJMbXpR7YPeHlEl6aEGB6SwYH2smmb22cegRzc0BKE6AlpK5
         oI3PeWZ1dp/0VRGfCUciclvJo+2tm/0im6qwFEibTGl3T3pq2H2uuNgIgbBPz7BoeEGt
         h7OQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBm46DtbgOdy0C4bMHp6bUhw6eFaHD9wwbdJQhVfnv11U3mK6T4K6Yd2Zd935Rmczh1yzUHcHRppgnjFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGZOrsjobr2YtzeRxF/CVEJoCXoTJTcUcLVS+Kc27XrZTgzzdF
	zhrUnnDai4WRaECFTCP2JNjWfwanMyXqrpzy56mhSatE5i1chwSWBI0q7X5IjWYsLj/uPsdQ+oP
	ZhI7CWb6XvuyRTKN4/bA7+ZXtFuFmvMLaZSsxE7XWeDTEvdWxhWNuW67drR0UW0R/Qkg=
X-Gm-Gg: AYBFou0mhXBpBOmWOt4MANBdftvQ8RLbiqhb+GRuud/63Kw/aP9pNj8F+go9pLScp4P
	wQFgUmBMPLpuxhfDrPtHzWT0OsVDzgI5L8Ey2YS8Yz1D/XmhUwYfNh0wsy2S6vZzRqOGHD27u9v
	PUgNysQz+r1Wacaj85kEFNa7f06sfDHGFzuEdDSoJRUM6Jj9LJNpvUN0vIe8qs/mMbuDf6puKAD
	boRHBx1FJJsdy9FbHRVoZbShd1lmAX1V9tRObbQz+ykUd1OV6DGjii/CAW2XQlqHTWUfCiUF6/j
	aAwzZN8lMv5AVcIkCGjC3nNH0+jg0X0X13uvI5K0K6UreVqqvbHOM1GQokrpPF8Muxw7/zdAVwt
	AN8FWOeluwQYZ59m2P5GxFcZnbmw=
X-Received: by 2002:a05:620a:29d5:b0:93e:920c:bf9a with SMTP id af79cd13be357-93ebd1e011bmr3417415685a.13.1792158108207;
        Fri, 16 Oct 2026 06:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:93e:920c:bf9a with SMTP id af79cd13be357-93ebd1e011bmr3417410885a.13.1792158107616;
        Fri, 16 Oct 2026 06:41:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm5486672f8f.39.2026.10.16.06.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:41:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, Val Packett <val@packett.cool>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: sequencing: pcie-m2: Add Foxconn WCN7850 subsystem PCI ID
Date: Fri, 16 Oct 2026 15:41:44 +0200
Message-ID: <179215810170.58960.8245836334838240026.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016051745.577777-1-val@packett.cool>
References: <20261016051745.577777-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX4rjVhFffyhb7
 s8VtczPTaN0LqFv2BXsHf2sRdzGzX1F+gDd7KBQhmeouM7FOSOXwrHvyrob3ePc0d7fTrhP2qbU
 cMwt2gJiFUWAvKi6QZG3st7fuNtrmpihvqt8dHMCE8p114EgA6FUk4O01dLHAY5bJGxX/K1xXL2
 cLjkO1wxivVFtXMarDr85KZlcwrDWFCOUzFD8mf7BZFKmGWsDouCoUuh667FcDc/fkX9pSKEVzM
 4yK2EaRO3yjTsPSPAcxva5USC+8z2UoEX5L2HX6SgzaYbqijJq2I/C0g+S0kPm5Ua3e2y7QVsIM
 GMjQBTHa/WmZThAZORXmglCQMQiw21WM4wTntARfX07eZFXGh3l7DjSDSA7L1QfE2/wzF+U4j3s
 Ukc5+hRgkbQF7a1XN40TWa8YcuK4byyASSMI0VpDMOmjShS9lDY5J1nYRDh2kFu9iPCoeXu0n5+
 /ldK4CNYLruwpEAVz5A==
X-Proofpoint-ORIG-GUID: tIV6mykglOiELJ8n9SDV-IlORNh5LhZ7
X-Proofpoint-GUID: tIV6mykglOiELJ8n9SDV-IlORNh5LhZ7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX9tD/bfazUiAg
 F4V3QxmOlDy1EeeV8yAMsUFFaoF2TKeQDW+3mGzQ71/Qb0PZYpL9nsSbdGhoMB/cdH9OHgngHOp
 0Dg7/e/KMm1o+lu+ERK9n1Ml4nrvBPI=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2299d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ac9oEOQn9GJuJuDrb4UA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160054


On Fri, 16 Oct 2026 02:13:35 -0300, Val Packett wrote:
> Add a new device match for the PCI subdev id found on the Dell
> Latitude 7455 laptop.
> 
> 

Applied, thanks!

[1/1] power: sequencing: pcie-m2: Add Foxconn WCN7850 subsystem PCI ID
      https://git.kernel.org/brgl/c/eadea156f11b2c9a780b60c1699c2da145c9d1f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
