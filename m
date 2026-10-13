Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9501233F5A8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853561; cv=none; b=urS8LxGH6Sc4KnkvHqP5h8eKO1P+zpTKes/XS4318jbHQXca9u2R6tVXzUP/2KOPrnAmkYQZfXJYF+o/SWwWgRsF5MF6CH/nvZiOmmp36pJ3Q2Qw3lV1R6JffwBi6mm0FH6qSzfC6gWRSgwdA8gn6GJl5Na68Lv06K0vpnP5t8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853561; c=relaxed/simple;
	bh=h/MBqoW4rymsrUEs28VvN7VfwrPYsRjNMLitK8/jw3c=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dZkP6XY+Q3nFHBx6LkA+e096LUShitrxVIp9AHKTBC48WoGDe5BEfX2IuOGHyH2RyJ8ryOTsg1pRsfjC7+EhksnaexUwDxGllML/nI3jX9zS9ocVtnDww0YGhu8NEDrPBAL+8JFnPH/2n4EYMNdwrqt1e1TD64ReaLZwt8pEkJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVvlj4Iy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCqlaP9f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVvlj4Iy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCqlaP9f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJN69i2384450
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=; b=gVvlj4Iyu3w+P5Os
	Qzcj/4L0CUPcGh9gLziBe6aVEphPNK/yHDFPlzFEZW69sz8GRgQu0NaDa8/jrGIL
	2Hzqrd9OOSXctD6DH45CCRkXsk1ZfdGHtfzTIOrQhirjA5/hMtbkRwAxbPBIlXhk
	n1Axv4SFNL/0jD6wyBhQyruqVWaDzf6YWfmmfgAwwzOi8APkGlrJQOVwyc5GUrDD
	gVh14VSoarMFlMdHt53+PbzVMeLxHrZGg05uB3kbzFMBfd76uW7NO+m7ZRqm3HLs
	+fj1C8Jo6IgqR4ulYuHS6Hev8xNWu+i4JHNpeLvyavcDLxvDRRDTgswP5ru3UWbT
	GSV8ag==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kuuxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:05:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so3390880c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791853559; x=1792458359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=fCqlaP9fZxxCLg5lF629zo9sSAeirXgKl2s6sNJYYWUdnxVPS4j3YvhWGnn2qfXrBM
         ZFtBd1DqBns1nhxY3unoGvCo4soogpI8TeGichTmy9V75pQRzVNaO3Y2rj8eC2gUdRqa
         CTaOwOpmtJRIco/xZHV0wQqXTNg07BhT3NAb16XYQsFHK2+4Q+L8i7w+o7Ntityabn2T
         UYlrEPl0rH45tka+RdQ27BggNKGF+RHQg/JyYNbeXI/chhhZ1G2QA1NAg2TrKwdYPebh
         DewoiYwaQi72iJar1t7CFeZBnxrP5wYit+ppq+lvwCF5PCaWINb/X2fg4xZhpVdNFS+C
         qNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853559; x=1792458359;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1kY0j8rfR8BCLWSUkl+P7vz1k2BLAGKluDytO7OdqE=;
        b=Jx0IAkkctEQ8zhg2BZPz6kHyvcIuWc6WHmKuVBTxNuObVf4gVmHyuV/VyHZBiNBK7Q
         ges2j29ecfmU28c6rryrlAs5EI18e8aT/Y9M852o77YmB1f9z3HCTaKrbZpG7XNW8FEL
         4FTOl3Q7R8SqGfS2+6rWb80ynZWrC8HdhQJyWDwX2ZbqT/g0ZZNlmVK7Zj7FINgwtJMp
         fq6mecSTRrmE5wuL6ZsDUseQ4TO4s/oOAvfOvmsVwyGX8VOSz2WOb+PHIzo5D8XgvTPb
         KXICuKtnaZYizBcachmVX+2xcEdGabXPMKNtudXmt2c4m3FtzYwGSaP96NhSDHxbH17a
         1JVw==
X-Forwarded-Encrypted: i=1; AKwUvBwDb/39hGpjRNKBnQegt/Q/TYbL/ozAN5g3BlKJnVcZii8zxdSVDgWOctSPsDIWMEspbrhTDv7xMP/2scg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD6Sd/2WiygXcSStC1Vb+YBSpm2pmw+uXKcxTtkiNb/lUKCRM+
	nQs5h9EFfVr6E4bqSg6y2Oz6PX0GFUFD68TaLZpXSBmeNJwn8u2N4WXP+wW5y+RJgsJx3z+ly03
	4WEpdBDJav4CehwAyagLlvH2/+oOiRydUgmltwaJmsnKgtnYWCaI50oENxM57Fg7w+WU=
X-Gm-Gg: AYBFou279uhthWYitnP3tYbMaFt5/8CJGxjzAXzr9Gtv/4Z3sqliXzJ4QcgTi9cYgT2
	fdpVnHBL9OK17L29TNtSJObhV3IVYBIcVjAeHnfT10JWrsEzG5rkIomKJxDtlFRwFATTJXsdOkm
	rIDQClJ0uvBiMq0fyEzz9BwVoaDIz40wEX9oGQlf6JebEDrVMDOit0Nx7nJvlpAAzcuahvuoHmk
	Bx6IwZ4h9EzuIFqZWlMIaLXRAU+niAi4OTjsIdL9kBp04KUr+BG8r/GriLjjBiQha7p45GPAiyP
	xfze3BEE9vmFCNptAyF4ZnjqG+6Ti9cNalE4RPS36te4xXPOmrb4941w9tdBJq+qJEHKixVslCs
	fIUyXy2A7D8y2do11ppNb75SPe2GX2FFxLf2nu13/HeBon1vZT4d2w+Y=
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320898c88.0.1791853558853;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
X-Received: by 2002:a05:7022:170a:b0:141:51fa:e609 with SMTP id a92af1059eb24-16a4c33923emr14320852c88.0.1791853558074;
        Mon, 12 Oct 2026 18:05:58 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm32904080c88.21.2026.10.12.18.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
References: <20261003092104.520135-1-yaojiale02@163.com>
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
Message-Id: <179185355715.3481009.13105817063716132761.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:05:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX14l6Qlm/FfBa
 BV1Vzk63h0JBbblLLAgjuvLCFTXbHGqKeSwPhzs4vKrhkgcpITjCafDs6dJSwCu3mx6qV1SupfZ
 JoCK7JujUkWZVbwA+vLKUDc7v6rqxSiaRbhvJuL30I4ufL0q3T0LJHHf+bsOJE+Kxmhxhpi3duZ
 BMVg5/TAAYqcU5KW3Bwpf3QGhXduqoi32eKL/39xXXyA3gMA2y5ENLkl4/MY7TE8LR3fgl2UaR/
 Rox3GYTELiJoF6k6N2f8aBiyczgLSmtsCzqFfjkRaUwtMOH92rrH46CzLbhtw2bfhUZjIeu0Wpy
 gaznrZzzu3DZlXY0UZ+RxmNnGP6e0VQG5imIZ2QjIpccxOtMkxHmrz/oUvoy+qEIWFW4y+7FCCf
 pqUFUZ1PRpMptjXht8/hkXvJ5+Qg93Bna6RYpXER5apGuoVINQ+62euEeNJZN7QSzOsKZ4dlDXl
 oAmexsiPYpMa3kx4svg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwNCBTYWx0ZWRfX5wc3oSU83OC4
 uVmWD7EuxtUqPRWYa/DqaJ+yt739ZAB3RONEQnCwpQmR2kQtB8D4s0N9oErukhMUG2772HHeJWY
 zy/wCvMc5h8B23VHr3rNCrM/OhwIN8Y=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd83f7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Op5QjlldpLrGc0l9b0wA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 4TsMTLDddcAPXWYuHYvck6GvvWnGjdX7
X-Proofpoint-ORIG-GUID: 4TsMTLDddcAPXWYuHYvck6GvvWnGjdX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130004


On Sat, 03 Oct 2026 17:20:57 +0800, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath10k: avoid IDR mutation during TX cleanup
      commit: 1c1a208e65a08191901cfded3bbccc4a54e4a75c
[2/5] wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 3e7f5d362b2b3a21b3adb4b860aad14b69a896ad
[3/5] wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
      commit: dc29226dada34a6d19af77b4b51e90f8a3a8de34
[4/5] wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
      commit: 94c7b50351fd30e1dfe1b4051197a1445d8547e1
[5/5] wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
      commit: 4aa45334eb23d40bf31c43405daea9b73469f2a6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

