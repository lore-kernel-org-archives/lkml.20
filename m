Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569528;
	b=0M3ClEnuGCP/H5GWtVBXa3Ry5kGlJ5Xlpa9ShWJ6ylzzZ3OLxAuveHM0T6PaecA2sNEZ
	 7SAf9HKbsbJcARNhhl0vqE2WKDNf9BsfsrKzMrYUG3N2poIe5opZNbq3Rpkeniku9f7sv
	 c0gg6OGUg1OlOpRXq3JTK2flhUY8m9CREZpCHMyz82pacxzMJRUM084Va3LIQXPqEgKYF
	 s0erkxIx3q59nF/HQ7x7zHVvYQOzsWofRvqLEyxsnBeNj3Q49Q3kpNstg3UPrs6c1eqnE
	 EH3XhOiC5ZDPx4TE0G169Q1V8Un1mXC76iXBIDf6Jd7fhOzwDWMhLH3TY0fP4eXZAGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
	b=0lYfRII1ztQKwRP+RNtUeQCyVMDgeFAoGCOzNGRYtepDrIP8wfexCFYl7R7XkbS8YkTL
	 AzMTbS2RcKmr77aQFWETHPYEGyFnKMHjvtHZDgX4zBzMGhrUNZHdlb10SyPUiQg4CQC2M
	 Ao6VjKjzKwaYYW6qoVRVQjj6EODfNYLI5PX4RDDjHSjhEmIR53r1LLmOy6WalDC1rmAhc
	 2Ui40c+i6VRt14wrE5yfzClq7aNzWHRlJp02uTm3Q5dEmQdu3nb/MCm0M8ZMVzUwx264G
	 f4PzK+Rd7F/ZCKTEsJpKJGei9KoI2R6QenNwDBFowkKgYslfUEOv8SLFIjKdpwU7X/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCppyAF4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhvGLjr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B847B606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B847B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCppyAF4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDhvGLjr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1ZN756378
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=; b=ZCppyAF4iD9eo7Ff
	djLO5MAMC/3oIOxgBbLUCm3c/TYVxQgd5gX3Q7VHl6q24nAEETxzzq/OPSO5/xC7
	jwaxAAgmi2HFC8A43uxcM0Rsd6KymfI4cGtziWegJu7deyqe9GdryUD8Zeq/8/lQ
	Jm17wYZfM3arSKuT2tRaD3DKNYAjgHNz45seLuGZ/OHT6++qnZMpstzKvGFFnNlR
	lUm6gIkqAZFdaNqqsVmTpv3Mjm4KO2+9j4ZaY4TnQW2E+MX/CWOYUqWGmClrFE/q
	EqS7TNPcNladRqFbaD7YxP4yVoq4A/3pzmVWFZ7la6I3QTkoQhk8uchyO93UsZVh
	CoeNAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4tn8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:58:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so14232185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569526; x=1793174326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
        b=YDhvGLjrIDEhuGo7Fhzm52vLvD2utcA4m5Oiqfv2ezQiFUjOe89/DvsIUx5l4fFWfU
         CrrpWR4H2CggzX/tZJyID8pVQ1VRysvgcwoScv9FBV45AsR6CS92fMibsl/bE97488R3
         y00vfKQN+CXajTIVbUD/exOmeMR3zy7fpj3UY2ARX14QIujiZS+cofW3SrPZRxfhjqiO
         +GmO0bMMiwzE9AxOTlb19AWokgkN1+bkkRqiqJASZIksxwxSSWcIrSpAlmAPgCObf7O9
         wJ0h7s661viptUrrN1fc1USq27mX83Su8+gSChAl9P0dZuOSoHPxABBzWVWiiyJeoNj9
         FZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569526; x=1793174326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/AXDMg9l2eWOjQuJXDZBYdgVgc6l9PLPze5lgXhkRM=;
        b=qNOaoY0Ob57h99KjDbx5evFLNNTHLcf4eXz9fsb2mfnBg60PFbY0vo17E9DKNHnrsV
         78AGglf/yBWyCIgbd+HggBK+zS0TY7Gx9LDDm2Oscz0wL/6g09SDdSSFLLDGUW6zIN8k
         mIzrfRTNNoDPsSwQ8zqROpe6MKzgmBm35uisYEa2b/YMaL3G/5/WyLYd+aeUdzKCue8D
         Rt/jk5P1Zjk2kkEBV7CV/JiflnTsMVXlt5N8uIjZo25b2WmLXNWkNyjTzejjahi6evOK
         HF37lt/vE0wodSog+bC3M5ZDJDib12isn4t0XWemUO4yMEF1i62yi8Okzc8BXaHAhgii
         nI/g==
X-Forwarded-Encrypted: i=1; AKwUvByTdQt2dwN+kWhY7/hAJtgh7+0IN5LwbtFPDrdrb7QFuBPGzBC2JgcQN0bbc5cQ32GaQFeZqRH4oFVer00=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfiTdMZMDJP8kZNJyK0F/vKcjU2VyqzChzBLUpOar36HH0Ljfn
	ZZLqE2ktx3Yt+k5vCTbZqOnRo8q+VshLVQDzDRNA57bazWCIGzOlrdG4KPTfjrYz8rzh8BBe4Tr
	oz2RYRqHBQFJJowRVFplT+Y0/9/EeCXQloEJbQkgMQW9D+LDahbeceqotAxdOeDwSy5o=
X-Gm-Gg: AYBFou3c20Wd4uK2ArRTah4ZQ0XaWks4IQ0Nr9+AtaEZs0iruM6g5dCaRO6VYwBmReS
	hZU1bA7tW7RbgbQyt5GKbpg9AeZsVELlUUPvQFBA0ThHntqKAHsomh3Goizz0Q0T4Kkcon4IxEe
	qTerJih6Sur7nwRrE/6uF9XTa9qKOwqEgxz03qHI8fIweObgY8kgz0rxhr2953G2yNCrkeOheI6
	tH0LZO4kEofx8iodc7sV0SmBVdMhQFyaNlSv9dx5XYpvKGaeGuYKgalDnNpA6MdrSsD7vUoEyT6
	pOYfx/jQeYHt3rjweWnDRDE9D4FnqvMq/Nlk/qCAifYmlBQUDXuzfdAfRHyHaQi8cA95PKCjYIl
	G4mtpcVrC1OJmGrQeAB5cZg==
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr22605691cf.2.1792569526086;
        Wed, 21 Oct 2026 00:58:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr22605431cf.2.1792569525647;
        Wed, 21 Oct 2026 00:58:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fba0fcsm49248266b.48.2026.10.21.00.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:58:44 -0700 (PDT)
Message-ID: <ec32a20d-bced-41a2-8993-6bafbfb63159@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:58:41 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UsMmqDuV3Jh9KIEpitaKxNvSBJwSAVBz
X-Proofpoint-GUID: UsMmqDuV3Jh9KIEpitaKxNvSBJwSAVBz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXxcrMasXadcyc
 +ZcbbK9I+LmCHwXc6Mo5P0Gzjf2yXWSgwRH58sOd7stzrMSAjqd+Za3CsuGFPYZbtHhX2mmTlbu
 SCcEZPw/YDtuI15kYpmUQ8DJ8cQjoF8=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad870b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W3aFgimVbiLOBcthf_4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX9x6ZwdDeEuJ5
 BPbtohmfbAF9KybXkJ+DNyG90ttVSixASA7aaTKqwtGIPyTkXjdJXVcU6NAlhzvl8KBkt4XDu9u
 d70+bbZrkK6LGCeArV8+iFFKAS2EFJ04EfZqNY+2P0IuKEpfKSnqGRHmOFsxgonCGWhaoBSg+cT
 zDonx/Tv6h4vBDraO19oZJbHrOC8SNrZwpa8UPXGCH6fnbDQyGkjPm/1hbp3wMQFG0C+3/HCy9u
 iyoV8g0f9YBznp7Iv8fAqflPsa/pPdpoVutog/0gsxpzPTlTE0LBEWJLrVGSviOxHZt+pE9r862
 uGAHJXgvP8cQlQpG93B0nj/mVzoPrJ8/lr4QS6ejki9VvyUxeOuRbM33GNus1pIWpwrTxyOLklS
 82gV15j+mHR7FADomKNt7H/1hrOTUSZw/TpgZNOj2xKHGc/8+BnBx3YgKVXeG8BocZN+eNAONo2
 SP3P5XI2ip6A5tvdlTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 10:45 PM, Jorge Ramirez-Ortiz wrote:
> A PAS ID of 0 does not identify the iris peripheral, so the
> remote-state update never reached it. Pass IRIS_PAS_ID, as every
> other PAS call in this file does.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
