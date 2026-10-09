Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5835318146
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510582; cv=none; b=pgsZJqtbQiFsFio5KhFy3ytIftQiZSPjTR6q9aiZNS9pjWHhN3KHrGRfx2V2shvRQez7D6oR9bgq3kCTzIR99du40ZflYxFrCUTAkEGyHawcYxDqNRYT4A/rpkUa7TR5k8lE5seFyvULSQ6O38DkgljRDbUbY6IJ8roH1vZU+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510582; c=relaxed/simple;
	bh=ca5Mgs+luSErxHnEBUS3+I2ZBtbK8wRBQhy3brjHCSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0QCxV4WIx8XKeud/hA8JWIgqDoi1XCHCaYWlW6Gch5je3YSw8tCyX9SiM+AcywrDoGBBnzsoOtA0+dJqHntingqkbhGR+m+jBlyjb0k0Fnrr5bnoFBqnjDys4IR5KB1BhkUcGZbzJH06zg5wOeAepuTxpq6jVV8w0f2tY9++uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ik0rWI50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrufmFTq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ik0rWI50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrufmFTq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990YKAO1252676
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 01:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	reYM3P+nlWFzN0k3Z53zyDtS0t70RVoAF/laZ8YyJOU=; b=Ik0rWI50KOxBilrS
	XZf/mw5UmwiBYR71M0YEfB3+x7S3JoAJd4JhNDqKnREsbV9aDoXtE0bWnWOPSFqm
	7QmikVL/8XxAfiCr0tgwVNq4GUlqttKgEaG4totioBflBr0GqmE/VfG51i6qZ1Fg
	Z/VwNn8+06SoTXxZkbl5rYYQewv202TJgG16PHcbCrQCHhJVlE9eF56NACtVFtGh
	hfPcrVifJ7q7W8Gg5N3HH444/0GhTMdQwc9D1X5Csc3Dzuhw0m/4zHmEK0EeCJEt
	7RVUH1G7dMfcMbJM6YBmwPC1Qp/KQxw+Su9nAyMbMg7T8YsYpi/+A8Seah3kW/Ls
	UNK/iA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufr67h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:49:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7773408a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791510579; x=1792115379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reYM3P+nlWFzN0k3Z53zyDtS0t70RVoAF/laZ8YyJOU=;
        b=NrufmFTqkKNZaDYMdck7OIO7VOfDtIKiQyrv4SIepKwY9M8DNTeQ7pCaufg/vdXVW2
         oNtqsRfsbw2TZgdBJFqcnLqQ2zEUDFWrQELcWDBcbd+W8AlhfcRQSkZcUPs4iJAUFsGB
         Rgv9iQ/jiZa7J+/QMElko3NQJ8WNRfpHA/VNBZfSxFNXU+ImeGuCPGdHlo+3+ACVd2iB
         tjHJxXuRSLFnuRXOQ1LHDWYsc7eo7uWMrBUVDQEcrIzbBFi4LpcTB2/Nr4mS0q2MrjWr
         R/q3Cn5K5YiHsA44BbQKL0cpsxo5RxTFNuglYkEI/rAydK2MqjWb1+5fU6SNjC1dEPux
         cKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510579; x=1792115379;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reYM3P+nlWFzN0k3Z53zyDtS0t70RVoAF/laZ8YyJOU=;
        b=hxQX1ikLDj+oPVD46SpfhxsupzuMXgijJVy3xtLiFzezWLAp2I4kbisDKiJh0wifXh
         9HEBcFLt4gukeJO31b7KOsJBBn4kfW+lE4IBnwbSHooWnYeTy9niWZiSP/lHjkSEMcFY
         Wd2JrTr/8hu6rs0kBYbbB8mLqCFsu7R0K30HskhAalDOShzSwsQpNyhzi6ohjd9z06JN
         5mhcVIJHyO4NvVeSKK95EXnGBU7EVHN5/61feXiPk+bD0vtQSSAQlfI8NlnkSihM2s63
         wSxwrrWxZXR6EqB36raFADsGZ7mdvFPXuF0dNAyJ25Gbp5MOlu/cb1lcm6MdFOYJooha
         o56Q==
X-Forwarded-Encrypted: i=1; AKwUvBw66A8XmpxBqHhScq9KYQlm39rxTQex9lCgGHo5D8BIKfq6o31LIjlqRFGNPaZxQ6f8BlBPgW641u3ZOtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPFANcqg4Aa3giFed3ZbC9A9HRvvHTCi/R/oRyqIhCBP83obGW
	ptIDwlUPA7IeP3hzHV5ZxL/l0X8iOLRm0k6UqzrGaV3VERxJDbUtgCFc1g2KsObs2qZ0L2PC7Aw
	zTqbTAGg+ImNjr12rWv54oNa534rnO4fIHof3yA4ZNlh6wmw5sa1yeagvDIkHntPKi1w=
X-Gm-Gg: AYBFou0eaR7EYh8yyoTFyivS5Zf2cxIr3JyvBHDowc0JaxFVwpjkmpAcKbW+3Yq6BjD
	EkO5MA2wzKJPPtt1R9OA/D8tTMzTvi970ZYWgV5U1rMGd2OTtm2jJmDgraTvi+RphQ0rP2902Ua
	doIwB4EX3T08O8zAjrK5O6hy+isEiVdDkJggV8hns+BSqYQvXMSwG5ijEM3AaVh0LdJncKujo2b
	o7BJD6TS/JLNtHWVl9Us0j6swP4jNR/U0JCxv4qXT0bofomQlrJx0j88L3yxo8pp7XZ7xGywzyL
	S1dG6CB/STsr/gnduG7cyVo1WjyVi9FG8UzWHL7a3u6u1J2XBZWwNT1zP8UewEt9JJk0xvs/8Ki
	7MYEd4qgl57jGj4+nSdPD30Iq6cpRjHbAGyrRjr/HQvokn2i84J/dq2jEQOnVBW3jRjco8SI=
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr595793a91.50.1791510579451;
        Thu, 08 Oct 2026 18:49:39 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr595778a91.50.1791510578920;
        Thu, 08 Oct 2026 18:49:38 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38e041d4sm1324187a91.9.2026.10.08.18.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:49:38 -0700 (PDT)
Message-ID: <9a82f0ae-535b-4493-a5b7-07af047d094b@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:49:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove unused
 HAL_RX_REO_QUEUE_INFO macros
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac84834 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ih17vKD8RMQI-mVctmIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfX7F2MfsVXw5ml
 7exwGEfCC7tUmzyZb7cQUSX9knxJTyYeCTuPjbKdPF/Du+sfmWO8n3osPP8TFyt5qpzmQ19NW2u
 Wqz/pz8NwI8YhDkMXAe9u92lxjSRWrY=
X-Proofpoint-GUID: c8hYxhIanRSa-7vGX_nA0x7qrl7rNnOx
X-Proofpoint-ORIG-GUID: c8hYxhIanRSa-7vGX_nA0x7qrl7rNnOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfXwi3vd8SIr5tg
 VbxvCZXC97xnrXMHX6idJ+Lcr26ZDo/ZkczQJU/dJu1n9/ALqEWpFHoAk/287k81l6HbjRFJPEx
 VgcmZBA/fxcLeLSzjMDoTlIVcCpFPLhZs75dg9L7Glm0tMKiNpNWwd1bMPhCNSSRQTEgEjGR4i5
 B2GhNHsV76DsrSc2Th5B3RJmEzYu0JM9YYG9A8xQiCgSJgLRvANq71vifUhYTQxYaJBPUgA3loJ
 51Gyyk7HCqZYN81HKezpJwL78dy6A3I6qaD/QLA11zNB/ZlOK3ateShdbBO1gv6JghSQ0txEcmS
 HXWl+1iIxRTpWRfDLwvgDCyAO4dT6AWlKJ85CUQSIGLNEwci17yE6E7Zqorqfzri9E5ad7Ag65y
 yu/HdotrqfsCTCE+N4Avl4lvIUAbYwQ1NqGO+JD3E5gFJ6M3zk3Ca6vSRJ2U8ElhQ62xHys/wa0
 f1iwlGxyhfcqxnU5lbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090007



On 4/14/2026 7:58 AM, Jeff Johnson wrote:
> Many of the HAL_RX_REO_QUEUE_INFO macros are unused, so remove them.
> 
> No functional change. Compile Tested only.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

