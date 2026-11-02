Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622499;
	b=deA7TWqEAe4v1PhsKEx8SjtsxOoejitAvK9OQFjZvCVYaQehF75bv8f0x4egWw9G0lD6
	 gE2et3MRcNAPCp5bZAwxjwV4T7G3Mc2z9FP71A2J9TjmhhBuFnWVhca+Qxb7uH1PC571S
	 i5sHenFIXeZmYTRO/16tB9DBxAco3Fjdewe20BfNsnmQX9uLeol/lJzDJEnyxVjvBhi0m
	 fuC/IqWAu8Q31A0LPvPsb8M+V8ErsV5tnvJ9dEk0q4T1GRtOAH70GX7Q2sEEU8dGIVoVM
	 a6GTVkHe/Jq/j4bPZ5BJAQ4/KcPtVObnXC8gtsDpJCMCS4Iezv4ob8VAbrpWfThe8zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=;
	b=Xlpvq9StnfvM3oQOmeqYaSCTLvNXjiZmYgs1a3tu+ppUdy1ajMzbv9WBPVIsxz8VXiJf
	 NS9F6QpSV0ulIkTJl7TX9aIzqH4/Bm6EnHVaAVT0AtiIoWN9QsQ4c6a6ENM5j0AzED5fO
	 2B2yKz/lPRvPiqWMcKhvy6xUaYer4Hp+Egc6EzOx3q3sQFY0V2wmS0ee43PYDB04UX38k
	 Y7sej0Wto8j2tjBnrfO47Tu54y46T3Lm9Npetcd82OtwZoLAeZtrgOYve4/RPqoe0mrng
	 NrihP5njM1+LRNSxiy4UWe+Z0ANV3UmHH8B/VVRo19VYRbh4Ocx6MOHHmDdvshk3p0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDOM69yh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlYACiOz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE1606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BE1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDOM69yh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlYACiOz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJmU2880820
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=; b=bDOM69yhCw765fSf
	cZsU3z4KYTVIOGFIsSmbKBkhNaaatfw5Vm8SS0Og9YTaFxJEAIR5ad3ig+7fOA5O
	0Cz/3WqJv/KQI1sdNchkxURE5XfV9Enq3VpdOLXjUDzBXFh3PA6vhMKEuoh1/X2H
	waz7xFP5l5S08BTbSZn5YlGvnBDd3a4JywcRVNcLbd4UwKh3KLWBI9fuPWlu9MqI
	ToIF31IP7PtYNeec2s1hkNPT7dpeZ4uYD8yxyxseVGkJVMwQPmK7C6TU4obUEuNo
	mX/LGg/5z6WyjBsvcrw+v1Y27VC6VtQicrSy7ll66CrSSB6EzmFYOR46fhRX0fId
	efBgyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgtag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:28:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6872931cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793622497; x=1794227297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=;
        b=UlYACiOzLLcbABGxvACd+SU2L1vYXm5dxA/FVTaptqddtXHwbWlfqv/eN7Ul3gYEtr
         g7HfTCrcQ2W1b5km+7ugTkAo2Ska8v6RQRyli8opDEJgVqNua/XD1RmlYVnKvwJjjeVi
         DyW36leRe4NnXb3QKYbiudOIkrFABGAkGCTf2lhTvd8E18/gOtbUzFTe9Q54YSUo2VUc
         /tYrzPX/1dbKGXqTLR4nflnnGnC6muzPeoLmJj0EbvmGxGgWfs0X1wk1NdCHpVP0cwpo
         sYTRys8SIjszgKkCMqxrydE5ySoLfEs+agqDb1me2yCN+nD0z5HCWAk4dMVAQvFBzv3i
         nbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622497; x=1794227297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLa/UXGozka+Lfg7iouPlf1vtQDZ4CcZRxnLf0xWfFo=;
        b=Q1sXUk3A/Y4TkPWM0Tw9aKJkaGxPU6rRN8YnwQJuV7sTsVVaJwy7rnaofBptAwXFoD
         Nw7WG8sMpRXvPEG1XX1OfD5gOWnomwqMN/AyQpXgR8DR8ieJRjGsYtIQX1p/ZGaN6+Xg
         dqXqUrTRvX9KU8XWcDKm2w0YBxlGpxSuo/WiZ057hJf/rxEQm3KZmf5SU1E+xpPZzf0E
         08ahYjdDj2SCPbvq2cFGGA0STw+e0qIzT4sDlHoZ0LeP4rgW+FIaMmbvAUIxlfMaT86a
         S9gYs3Bx2a0PPGuBk+eVT1U7cJtGVniOu4UWYKMrIpzmlu4KW6TjMO8PWz+kbrNtFFgc
         G9Sw==
X-Forwarded-Encrypted: i=1; AKwUvBx7Zo1iGgXB0RXohULf0o3ZpX2+ye0OkxXRRypmwzHvjzGyVI/xIjKouH1HH97sCabPHzETT8DuRdRH9n0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nBPvxensRKM3ZNEiJUll3/NImPmIkEGNgVSUnyMzkZM57fk8B
	MD/+W3NCBtgXA7YLPoMxyhq5tt1UFn3s8/M2k7B/FpxzyCZIUTDX6cOsV+BsHOj7wE4assbu3cq
	BOXKNuilvOoRGRXP4+PVZhbnHD8mh5xz/b0VhAXayUKXbOkTnrL04YV0BxLL66l4gtA4=
X-Gm-Gg: AYBFou1JNI7tDukCoqt9BL8eE89ITD7O6RpPplx7Aw+rGUlnNyfTVS0maAaar2RrVIg
	wqi5AaMknDaIIMcCoiHGVeko25upeAWcCnYDSk1a+4yU+doDa0B0rCLNvKVibG3wUi9xoV+l2lW
	b/VN8lexyELUPWaYZ0SnNW23+WezXSv1p91O/JZ+eUxXbIZ2UI+6gVEKPkVy2Wnh1tB60/e3lNV
	8+Ynw/iqzIAGBPjM6V0hTOuhIf3NIdGenDOJcDzvHx7auI3pSMuZldB9W1nZHW28/AM/7Rdeun7
	aJWs9YEEpL+ojDpbbgCFBN9T44hkt4M3p049dYmHKTXgcZ13o8uq1c7ro+gj1L5mG1h3WB64lge
	KSDF2OGlq8ohbmVQrV1J9sV037+sdjdHSIUQDO3WnX3C57oq7KG1J1mQmLa2rZZc+rjQKEI4=
X-Received: by 2002:a05:622a:244a:b0:536:91cc:465b with SMTP id d75a77b69052e-542b687b629mr246512101cf.3.1793622496798;
        Mon, 02 Nov 2026 04:28:16 -0800 (PST)
X-Received: by 2002:a05:622a:244a:b0:536:91cc:465b with SMTP id d75a77b69052e-542b687b629mr246511491cf.3.1793622496237;
        Mon, 02 Nov 2026 04:28:16 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1791832sm1508937e87.23.2026.11.02.04.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:28:15 -0800 (PST)
Message-ID: <361131a8-4d30-4e8f-92a3-697dd93e7e30@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:28:13 +0100
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
Subject: Re: [RFC PATCH 2/2] firmware: qcom: scm: Handle QSEECOM listener
 callbacks
To: Haozhen Li <dezige131@foxmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        =?UTF-8?Q?Dawid_Wr=C3=B3bel?=
 <me@dawidwrobel.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101160110.3622-1-dezige131@foxmail.com>
 <tencent_B6F75567FAE05B5F2B1E793A9FC916E3A608@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_B6F75567FAE05B5F2B1E793A9FC916E3A608@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae881e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3N2OMTQwUvkGbx2wNlcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: fOazpbGHoRWRvllVb31CMR0sJuGoM2qj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfXwEsz5fOdwTei
 eK7f5rsvRVpYMuVe64K/JZNsa8AYMKsswtYiKVex7y+PjNOEMt2E4w80q2Z5/PWSco0oyBBIp2T
 Ms0e/70gEKIZGViHiAw3/Ly6IiEz8co=
X-Proofpoint-ORIG-GUID: fOazpbGHoRWRvllVb31CMR0sJuGoM2qj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX4hUq/MGKAwjB
 g639I3CjrEtYDQ7NC8xO/Gw+xEcyVI0juu9mAqTRZN6PmS5v/q16C0vTUV7R19hSGfOHv+KvSM/
 LJDk593h6yA92BdaVryKboKy17VavmsdktAWI6DoQJl1NjNoFmjH6XoFxz3gQjNLmdkRo3THt0S
 ebkAH8mWJGTxyXIcxAX2CrOwOgu2MRQOHR0tf7VGsloM038Piw17COmHa9efaVQPgQIt3+69piR
 8fhx47boEgYRAf7b00f+ZubbbTyiTfI9eI5RtDBIoVfUPCVs0i/KQWY/LVgh+q6+r6we9HacW9C
 94a3ISB48iL9SjZ7KgAvEgUNMHHdRMnK3Ff79kR9B2NXvhG1DBCzgCamhQEhBqOUNLY0PSi+7Ca
 J3j8QO8nl+U/herDJoP33hHNJB4IuPnHPatW0dTvpnnYdrFwWg8Y/AuDmxkte+c8Hc25OCSj6SS
 QSzWD5IY3hDntLQQqFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020049

On 11/1/26 5:01 PM, Haozhen Li wrote:
> A QSEE app that needs something from the normal world -- nearly
> always file I/O against its secure storage -- does not return from the
> SCM call. Instead the call comes back as QSEECOM_RESULT_INCOMPLETE
> naming the listener the app waits for, and stays that way until the
> normal world answers. Answering is what resumes the app.
> 
> The QSEECOM SCM helpers have no way to answer: the TODO in
> qcom_scm_qseecom_call() turns an incomplete call into a WARN and
> returns success, the app stays parked in TZ, and every later QSEECOM
> call returns -EBUSY until the device is power cycled. The machine
> allowlist in qcom_scm_qseecom_init() exists because of problems of
> this class.

Please extend this RFC with a user, we generally don't merge exported
functions without an in-tree consumer


Konrad
