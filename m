Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043C34F27B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136349; cv=none; b=gxO/XAVsP9JpERxqSKbgJ+gKkdETni/33ecBt+zp9FdLKC+HPj9erMsBn4QeV9ZiQdwU43truIW81b+ra6/rDwkBPa+5UBMux8uqG+0xrXV9ErdToH0lP7qoW0fEJbfXqWVh9iK/QBg7Xf5TDcmSKQ/Oq0YKe5jR4kSr65pZWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136349; c=relaxed/simple;
	bh=+kkiiRjZHe3xphxiX+wbUyacK+O5ScS5yTKiei0y5Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFLOAE7tyMw4DC15E0bNdmV9Ow/s17nzq1h7dyQNzKukijLEyMGJxVFiTN0EEIRlPmLeCjNvfwLg1K12kTXQ9dErY2qbx52F1WS5NRvJdL6WEkOq7R5ZVFGkojOV7n79B3pWDb4TQ/GF/san4HtRVTSOzn9k2mg7kuoc8KLat6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiPiu4L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYmkxDNu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiPiu4L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYmkxDNu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjl561099012
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=; b=kiPiu4L6rMH1sJmJ
	YkLYyXbMNXiTRmOLGv9/1dyKO6a6QqbdNUsJfVUdRnlz9kRm0Z5S+f8MBb31XzZl
	eTut3pl/Ja220Di2b06ysIvsUEHs583BM4/NrBZHbTb19tLGtB1FZNMYJkcViqeA
	b5zw2D9CBAW6rw8hMgmAf/WonJ+C4hVy8b+pNgMglpvULHMKLAy/N+PdViwpobxl
	gFP5Xsp3UH+c/tA5UiIyXH5tKUXo9vDRzjKLqgK99/9M616l7+K8I9AwoiiseFFS
	zGavU6Nr8YNGc6UKDTTti4QTATeYqm7S1no5pPxfgjaVewwpRsTaSh5oY41LMfd/
	fzi+QQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8j4ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:19:07 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fcc331099so38317137.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136346; x=1789741146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=;
        b=TYmkxDNuvgGxLGJY7NjoFKhrpi34s3E/v/aVQsdWWfGKCy6AhteeFzupuWLtd3sqXs
         ERM6pBQjDAkKZaFPe8MQOG+hN8gvktpKfr/7e0LMt3B+x8uYR6jtFff9Zos0ZCx4MWDL
         /KGMG7xh1au5CVLv+njgIRFIASRXE9Py8w5rRhyEk4B3Hv7qJDU/416jQBqPM/88s/Bl
         fzFmH6bwgWP48AMmP8PwEQ1WF4Swuw7pwU/4lTQ47xYko9tVrnqSPlj5LGPInqMnlKqZ
         3qCeKs4cCypkJymJ/mqv10LZ42rlTAOZ5yOmCrbU64/XM4w/7B3juL3sHuRQCFxqxk+L
         bbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136346; x=1789741146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=;
        b=n2TvDY2iDmIhhWyFp1odT3gm6En3BhcqCML8GnNUiIm6tFz5PSNoNI4xFoeTU1GRsj
         c6DNBf7Wt7+y9aIyz+TZXm57q62DKgFZVLnvJrcaX8+FH58rIZu/vbe4ck0riJCR/ls2
         vmsvgIrFv5gHGpsMPjQwVc0zonPavePWDQnQXJlc8v9VHfTMWwUYoJqO8kRBz0DVYKF+
         LlPGilENNBB0IS9ejfYUebSoCIoeKolH/USsG8ePMo0vF095Sd0O4HuvSwp5JaL/A97G
         SydG1qoshz7l7Lmbj4rh702YbDQrZXp7/I5QkFB2/7uQHE7fcEw5pl1/wEUmZVHR0sV2
         WPDA==
X-Forwarded-Encrypted: i=1; AKwUvBzWLji96MoIvVDkRo3U8SCWVhCVumAUAU5YC1TTrSjixEA+25IVdhDRiEPx4vngonBoo6nKfT4iTnaLrvE=@vger.kernel.org
X-Gm-Message-State: AFuF++lsR24kywRjT8UuH+PwtQE/4AJmoJCoBzMHSYRC2EX8OyGyNfI9
	t8d5wXSskKj284B4TfGPKgiUaN71XCxRqxfBaJNLwo64ndjBeYRnoUloNSqb8gXD5tWh6Zr2C1j
	U/tX8bZ2jDXrzpyZiLDcnS11qiFSpl2Fj+d1XO/2ee2hafMDLurK1P2hFKP/o1mYACCU=
X-Gm-Gg: AYBFou1f9SaAq4u5XsotyW0QTHBBu0594tb8fUPvdCe3Npg+jTx4g8+aVlJls9cS068
	c50UhMFz4A9T9eE//1l48Zu9CdhqeDE2AgwZ28slZ+ncU2RzHXEn5MxkBxzk7VWF4O6AyN4WYGK
	Uyxz1exa/VdidaCwSg4FfgOa9Ie9AKmpwA5BCzVdubtM+Pimu4Ynd2adJM4I5q40Ms35i8AJlyb
	p83Cy1OT8XwvbpynyxLgJ+Fu3VWlao49WS0H8cUA3WyR5lREHAicw2lyw7DQtPz2qRW16jRTE1e
	2WMyC/J5CVTmjTlLbLn9J6jd9zte6/vNcNQQAyKu0Mx8drjZtG+srrmkKjfKRdQB1QgFZE500+C
	RJ8sSXtPAxMGkNxiQOUQw6A==
X-Received: by 2002:a05:6122:6b06:b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c8462bee0emr1649999e0c.3.1789136341428;
        Fri, 11 Sep 2026 07:19:01 -0700 (PDT)
X-Received: by 2002:a05:6122:6b06:b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c8462bee0emr1649949e0c.3.1789136340908;
        Fri, 11 Sep 2026 07:19:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5964c7asm839147a12.30.2026.09.11.07.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:19:00 -0700 (PDT)
Message-ID: <0401ba5b-c308-4e54-9f6f-58005cd19a0e@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:18:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ySx8kzTZz-nx9KP-Lr6ncHcrQPuGVfnJ
X-Proofpoint-ORIG-GUID: ySx8kzTZz-nx9KP-Lr6ncHcrQPuGVfnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXyqbP8+YcGA+e
 sv7ld8RGrkY+DerVmrU2Quq9FZ7YZI0zq+fjdXdSnny+v6TZsvwBt9Tsfq1r9N4pV3t52+j/ugU
 XW05feAURqStdaRwjjrLGZ7CHUWfm3HfRr7jpx5/5UxPI7cm5esrZMWZSid6JOl92nGWqZlqAMi
 +uuKvC0azG8c2rDUMxL7XTy5bCq0yK9tmm0BRNHdUtwKfVL5jLrCzE4KV772vN7q6JEGFVWJxlx
 bdKmI7s4ugnC6Qku+BoJRlPlw8F1GfNYhIqXvMrC/Ae6WF34rXWrYz+ql+pxYA8ObX8WUYJUZx5
 7vllz4H/vabl5R7pKQkM3q+MlTd3RQ8gwC4oduwaora3Ffl7W1AcIvNiz5WQZnB04LOHvMMcfKs
 qZz5Qjl0TmV3dxOv1A00/kXwmp+lBwHO+m/R5z0FLFkgfo8fs71eQ+5h7DlCMmPQ7srqydnVdb5
 KtqzUAi/q1Kj+z68pog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXysk7DW3A5S28
 tBtD51XmaqjrpZzw8Xm1ockQMfwni5HpYmFEKqbRGEhQWpaE1ROPO2ZnnKcRPG2w4kFYH576fdv
 tf6Xa+CjQg2ScUr1K0Iu0NIETPtWQWE=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa40ddb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gfYPUWtuRM0ccBUoLM8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110200

On 9/11/26 4:05 PM, Mark Brown wrote:
> On Fri, Sep 11, 2026 at 04:46:33AM +0530, Mohammad Rafi Shaik wrote:
>> This series enables the Shikra audio path on EVK targets by adding the QAIF
>> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
>> board-level sound card wiring for CQM, CQS and IQS variants.
> 
>> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
>> prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
>> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
>> prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
>> prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
>> prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
>> prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
> 
> As I've said before could Qualcomm in general *please* stop sending me
> things that don't apply.

Adding to this concern,

prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43

happens to be "Add linux-next specific files for 20260626"..

while the base-commit is next-20260910

Konrad
