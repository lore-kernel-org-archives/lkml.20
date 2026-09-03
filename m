Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BAA492188
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432898; cv=none; b=PkZ9V0bOZzFkLzkhUIifMR0C0QRZxoZ5rOnXIjNL1rrOnE8phPCagXzIwo3c2CvrUOPSNNhfowlGKxOGMr1vDMudxkc4tnPhP1X+A81bv1603i7Gtz/IRO5CA/L3zqRTE3QGhdEaZrXJ8zRwidnipjsh9G+GU6ti+VBOfEUWuFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432898; c=relaxed/simple;
	bh=kI6mBMisckds5bhX1KvYBpiAzm2JBa/PQnpgMUAGgpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJQT0dUol0K2hv0ANVObHIlPWv4H+2F5KQ40sXH/sLHF2kpqOzfX4zWAkNQ2Ry7fJjama3kyBGl4x69/llFSzNUf3sy0K4HgjRzG044M1TZwxYBtdq0HcIZbyMLw8GSRJuYazvGRWyogL7J8VZByxH8AlR8V1CJj8oEkIVr+SYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOP02KLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYRTuAJ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOP02KLq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYRTuAJ6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH2MV3720091
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 10:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3z3SYNxLPifOc3S2NiNgUDiFUQuwZnxnUvCNNI817Vo=; b=TOP02KLq8bQsPjTc
	+YIG5oM6Ud41ipP0HnINmIwo9VJXoDmW7qhR7RHI6xZDXdWbu/98/lFjTRtlWzA/
	dGIQeR7SenF1eIPlNmxYH/Hm0K80/29oESfqTjBwLmzDUyo7NmcQ+RmfpWJq8/0Q
	DYwEZsKGFjWbUOoR/Svz0nLi9uTJzoi2KzLjhPb0EatWAh6WBAiFSDJ/UdBsaoY1
	8Gvj+L2csG85ki3v4ELvyyXFytiunHzhyIPAuIsLpMxJTn9BD1brzgIeR4L3RpIh
	8g/7SBs7d98bJJIvYSeteqglfjiLWds0Kyg77iR1v4foqWRykb/Vjz9MFjEKEJ92
	rhuAOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjsrj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:54:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494b1e35cso46403685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432895; x=1789037695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3z3SYNxLPifOc3S2NiNgUDiFUQuwZnxnUvCNNI817Vo=;
        b=fYRTuAJ6koVMbGH9MMUkPpkvED1ZApdBL64spdvCMjkNzMCAFmthZKBFFnzJ5yEPPY
         YQO0sVTrZ9AMo1VyAVK6uW87uSTrhluwmfqpcPefNHZVAWtgc+CypHhfZpki3Eu96lWj
         AIiUMWURJD1memqkU6G18wd1W5PdztbCZ7mS3fGH37DHkLOj3R8x6jZuPZJq+tr9hdW+
         /ENPOfGfC5bfghOJHJe4AqGmIogquPtz40HyA1AzKNbZmnlQetsAws2qsRdJjudolccn
         Ned/mHNrpGYrLw35mfk0PCjMQpmr3vM3W9uaEIGHhz9WLQL7IRJnkLsGdzLXMYoSOa3Z
         LduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432895; x=1789037695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z3SYNxLPifOc3S2NiNgUDiFUQuwZnxnUvCNNI817Vo=;
        b=l82uxiqFjcbtWGXmibMTopKfodAA0oG3kchVN4A+7+B4fpwBPm5AR7DYgku6VOxzVP
         HkQtqYzCr1FqbSzP4KlseNy8ez8rYWX7r5qnDKXqWAMqARnDcThsFnT7KcTcIIPnfj/A
         +BpPXccHFugbY9C80wsnVayLn8BL5ACD3Dm+XBhuAxJgQpkw0FNYrewaQcU4A52fsQgC
         XEX0EDJg7D8CITCseC/PC5+gUIoEMcuczkEK8SKv662/n1Q9HEFiAUWweb4OGXRsPMV1
         h0ItGVph+AtM5OM/rPJEXLelJrnZTHCkKqNhUjaaZhZQD7wceJGVPZsJSN9uikINueHu
         Libg==
X-Forwarded-Encrypted: i=1; AKwUvBxoGDwwbkA69/LiBX69yQaTNdFIEyRVJoJ/5mCR8decQ9dlHCcHAWfLpZWRZ+YbvF51fpKpkd8kYKLbWH8=@vger.kernel.org
X-Gm-Message-State: AFuF++kjMdA+Em7yJjNytYJzPjdI4KYVGLVIVk8o6aE9iu6UJtvc+nsT
	fT28+rQfbnZtuu+UDyx66m56/nYdx4glKvp+ny41rV19oDNheom/vCRXrtANokRLvixXeX/QJ57
	hsHbhVNYIn0bCJrrO86L1nGx01n2arpBpfAGOm4d+i/LrIcDeypVPIro5MQ5S2Hh4XSw=
X-Gm-Gg: AYBFou0d1RVge1oMt+adXKNyNzAQoBs2U06fnVRNfjfAg/lYia9e5NkuLt/vHMqf/ML
	QRH7DQoY3ZbX5rPOGetYZvPebzffle+icN/wpdlIgKLVFpyPuUL8i567doDdFl5Gl5WLONmrhiF
	iZ/Z8zaAGZru7Tf3mVBcqbLoeW+qsL2eA4LJRCRBYrJ/G2uHq/FatHpF6c35LXYw0SMYbSxwVzT
	XxUkEaQzKals0/arTOGcd/1GAyGOuuXvtGoXwiO6hPbc/WyiXxeDe0K4ISyHmVen+GPlH7ASMeY
	NrXF9aqJNRWfM/Bt8V2iK6NazL3zlGyUjuZgJsgd12JWSRS/HVY4wwE1kwsKT6+Nt08Zr7eR8D9
	GIym2HaArjJmARIcnSJshwQ==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr818595785a.3.1788432894829;
        Thu, 03 Sep 2026 03:54:54 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr818591985a.3.1788432894307;
        Thu, 03 Sep 2026 03:54:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42861c1sm82421366b.63.2026.09.03.03.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:54:53 -0700 (PDT)
Message-ID: <2a4287e0-639d-4bef-bbfc-a6e192084b59@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rpmsg: glink: Request the RX interrupt already
 enabled
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com
References: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
 <20260824-rpmsg-glink-split-protocol-start-v2-2-362d7c233f66@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-rpmsg-glink-split-protocol-start-v2-2-362d7c233f66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NCBTYWx0ZWRfX5ozavN630PKS
 sJXv+2FG97Xi7wHijm/pxMwSiyKQRis8DQE7fsBq2cbYfzS6EKVkiHwY855nXdL81+CLkhVQ6dw
 01bQ2q06pABZF13pnYZYYC/02T9KQ5/8dD0BRxwRyJz3TxqM0MfxX1roDPZZGhVmrJhRA12QFtJ
 yJfAEyNexx0ZwEFAVfr8POp+ZYYDhfSdb82mCF5pOXcp3kQqhp1voT/eYnyHJHVsrH/B2CQTugL
 Wrc+jysD1Jc37hYbS88YIyUXo0Dnm+bnZzM31FkboUwNe2urOOgWZOxLr6Qt9W27UjCBmyzcrAe
 y51fSwKLcV3Lm5cY81Jxz6e41pbOHNXlFMBxQUJOOmfaO/DsTW5ZxrMIaD4lvrV1iPQWlraFyPH
 2qTxevqP/Zj/tMBimifqnns8Jhb49vXRb85BbP9H05tPXUuMqpWIGp3Ze60AFmwG9cm+ysVqwi0
 9aXmkZLYDT9pBg8csew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NCBTYWx0ZWRfXwG+QUfkM3zON
 64wHIOeaAZHou24ZnD6te62dvY6PA84uwsT6QURSbCza8QDSpZnwPaEnSPh8MXNJnepdBcKRnOs
 k1cifMT8UFWZYRfB9moYfaDetGq3oco=
X-Proofpoint-GUID: Bf2eIMlYPybbQJM2D3obCfPqOLxkgf85
X-Proofpoint-ORIG-GUID: Bf2eIMlYPybbQJM2D3obCfPqOLxkgf85
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a9951ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qvpHLerMFRTuEK5DOsEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030094

On 8/24/26 9:05 AM, Chunkai Deng wrote:
> The receive interrupt is requested masked early in probe and enabled
> further down, once the glink instance has been stored in the transport.
> Now that the version command is no longer sent from
> qcom_glink_native_probe(), nothing needs to happen between those two
> points.
> 
> Request the interrupt where it used to be enabled, and drop
> IRQF_NO_AUTOEN along with the enable_irq() call. The RPM error path
> becomes a set of labels, the way SMEM already unwinds.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
