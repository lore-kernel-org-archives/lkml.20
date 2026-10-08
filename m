Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430B3BB9F1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439853; cv=none; b=o9sOE6Nf5z2a4RQnkq03N7o1nvrV4DEaBH6RYZdvreRusm8FtwkZMM0fIvn7G3Ql6Yhs4aPGPENSGuJo82B0h/Tq9wj1x5F9aMDZjMVjvZvwZKs9V1KbQTLMm5nizuYvq/Lm6m35fgQthisL7g0fTv4tnBbUPKPdCC4/KXTPIm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439853; c=relaxed/simple;
	bh=9sm8KXWdUgCKJZiCqooRJIQAmVgG+nvnpuC5U/+qK1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJs9P8+f6CR0Vrd31lIT1/fUKrBfprFw21oVsNGIb77iNN91r6+Wh1d0DenYjGKxY9O77U0zFJLEFwM6HxR5js2OSpp0oOxr6c6mPDEBalDjH3V4Y2x0xBkUl6oMpmbF3Hj1WUOx42lgVmCahzJTvJe+OuhtLwroErLVaeloKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc4000Si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0GVfskN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dc4000Si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0GVfskN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BitJ1776068
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=; b=Dc4000SimgsXN83I
	YITP31k18mKS8yvh2N0PkMiaGpEDdJ1SJkyWtWR8nd8dNsK08a+3gMNEiOkvWil+
	f4ghUYYHSZSMorWYDYWU8JFLvLgghY3cIyOyKguNn6rcz3Yn4Tjok5whiWbOjXgK
	H39+T5pc/gsps0BY71Vgfx8/2brr0pASt9UhMIwoE1GPgzE+RaYBSDajq2qrBMar
	jR7f8c46nQwVFeP773jhNDSL1xmLKrNZ4awcU+2uSweWbNuFELm494VU06PrkbIY
	nWzcf5O5T6yCObzS7izBeZhsxeUjQ/qExP79TwM8XwWujinvUluVIagcz+I2I3UU
	gbeEew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39bhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso4143265a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439851; x=1792044651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=i0GVfskNnnonHBtPpzSvEjwBqR3BnWwL6togfrRB/t8YiApQ2QHi7ZngB0DkRi+RSa
         q39bc3V1NitaDdBGHUbW1xbJeiCI+AZIKgLOrJseRCld1IGFuyHiuZB1fb1EJSSpFv3r
         Pf74TwS+UjvMIrMOBzAk6hCOuc7z9y1h1Le5t6/tJax0eJXoG7xguszXXVLSdI+hkufO
         bv/5mSHC0E6wuKbvlsR1y0rfPhwx2UUzQMxNO7k2/P0G6wk4qmdYznSwhNGR93lLAlsk
         +DePcZVCxNqgiraigZOuMRK7lR3O3AhPmNHbaN8fN2qmSRn1vvLlAePSbwQClg5lbWGu
         4U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439851; x=1792044651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=izYztG+X6X74aK5/wka06zcKPwV4sjx1dRoXAAnvHFFjuOG6Wv1bY7AkIDaXAUk8rg
         NMT7Chep2zpQ3g8i7A9gbRuRAYV/MnAyJIJDo8NPIC9y4fY/mrnH26BWG+voGu0W3wqF
         7Hq1SScoN924NrfxrvoJdd3PTlElek+Ez4shBQMhX3m8XpoXvR1kQb5MhilyqMkX/2l3
         VduB7hk6aR4Mst3C3hZ9/1oVuDUxqP02/ZG/0l4jh7Ae0bwyivLsHDjOCDdl7wTu69zv
         WtjlKrfhqcCu9XvmvTi8Oj2/I0p3nwwRAgJKOOsZRYGst3HUVEot5/O2RekgYBbOhM99
         602w==
X-Forwarded-Encrypted: i=1; AKwUvBz8b4hOxZ8tWQshy4C0BRN6bewB1s1rOP5q13xN9Ln+8s7EkFLzDusVxu1VqIJEj5Zg4Gg61ozt1AilvYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaGvWYs+ipDRSoB2ZftvLJHuXU3E8M6g06lgBGpowfWW8sV8ec
	10ylHfATEB6JEAl5L47ioi8SnPOchJ+2yvm6eZxEO0j8NLHoJSCY44lYpW4xnZM25AEUBKcpPbB
	nWzPtq79wF3eIA4YLLje8eQCsm7mwTHrrKqwQGECmPKuR1BgFAd1FFyN8tlTBY82ZSew=
X-Gm-Gg: AYBFou1gwPE8mvTXGMJPeNnMPfHWXKv90NUzkRXZJm+/22l6O4EdCavF0qxSEBGEngc
	EYT/zibK70W5VuKcrhVGtEMi5Rle3dmDdqlhboxUhXJ4ie3JBXucH65ij8boXfNViZnFQGddecf
	vV41rkJVNrfGjuqMw3hSgULYpzeIYtHDCPQ+2h+JyNhfRzmmmqbvuYyevobTeT5Zs67WH4OaTlT
	mSSNs9ct/HTIyR35uVHrixEf5Qb4mcOShfkk9CHGKkELCyy9HRgRxMja4NNLsgpOzsxC0yabYKP
	O1UmBFt3+0Ahwb8VjSNfML6ZUSMN3OIkPmJ4y5aSExEpuT+wEENae1YWY8YiY/26fOGc8qV1owc
	qAguD0mvfMBtaPw9qmGaa3Jfp8a/vJSU=
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492298a91.41.1791439851101;
        Wed, 07 Oct 2026 23:10:51 -0700 (PDT)
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492280a91.41.1791439850602;
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbc6e23sm2785258a91.14.2026.10.07.23.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Message-ID: <f69b350a-63a6-4a66-afc7-8421ab86877b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:40:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] Add documentation for Sahara protocol
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
 <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac733eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QPSRtYdQVBWiSw6D44AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX7jz1EkNgb9ZM
 cy2M0T03m65YoyIIMdC19MbBNspVKm6Z489c5PQnE5rWg4ufVrrL9mSbkvfCQK4deeVQxIjdDgz
 UKZswy0haf5Jcw8ZPwgHiUaiceC3cDU=
X-Proofpoint-GUID: FA4FVpjMT4Ifmresuon0ItcWzdpiabcJ
X-Proofpoint-ORIG-GUID: FA4FVpjMT4Ifmresuon0ItcWzdpiabcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXwve477hZUnjl
 cEfBmQTUTpQT4MhudxaETWI4/ihdhXbQUnLsY4g4TD6rSWFS9Dw5JsFkxeA7RN+V5WPpCCrw0fG
 bfOzmHhPgspFqD5PbXcjb7o1JRnMy+V4RuPl5WyIARPyfinfBifiUkdElev2+Nz1WZfO1dGy1hj
 iRU23fVPr03Hr7lPMJNCSDsejbrK/yqC5GfX9KR8AKOojtERJgel/8M/JP45zP4PX3s8YTJ9K7r
 swrn1PVJ98nHLuvB1iMi/qWCYyLi65SIVs59XN/OvBl81FxQL8Ee+zgCtDHnM2+DnsIglhGixCK
 bCyXlPFQFzR3IJL4nJmpmPLVqsn043+edcsq9zcpltjqQlNf7ZBNSE0zUZ/kb2AIsjmNWSrDRId
 N53wEAEfLa+cMGhcUxZFto0j+ONFUCF5JRN8Tb4OVsoXsrYLcvDx4S80OVtEc+HiALIj0YWNlu5
 8zZ9JMV0HHxNRHBhBXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/8/2026 10:16 AM, Randy Dunlap wrote:
> On 7/1/26 3:37 AM, Kishore Batta wrote:
>> +The packet flow sequence is as follows :
>> +
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
>> +
>> +2. The host sends a hello response packet with a success status and sets the
>> +   mode to image transfer pending after it receives the hello packet and
>> +   validates the protocol version running on the target.
>> +
>> +3. After the target receives the hello response, it initiates the data
>> +   transfer by requesting the size of DDR training/calibration data.
>> +
>> +4. The host sends back the DDR training/calibration data to the target.
>> +
>> +5. The target decodes the training data and does not find valid DDR
>> +   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
>> +
>> +6. The host sends DONE after receives END_IMAGE_TX.
>> +
>> +7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
>> +   not received all images.
>> +
>> +8. The target executes DDR training process to generate valid DDR calibration
>> +   data and prepares to push back to host.
>> +
>> +9. The target initiates protocol by sending a hello packet with COMMAND_MODE
>> +   to the host.
>> +
>> +10. The host sends a hello response packet with a success status and sets the
>> +    mode to COMMAND_MODE.
>> +
>> +11. The target sends CMD_READY to the host.
>> +
>> +12. The host receives CMD_READY and starts to get command IDs to be executed.
>> +
>> +13. The target sends CMD_ID = 9 to push DDR calibration data to host.
>> +
>> +14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
>> +
>> +15. The target sends RAW_DATA with the payload which contains DDR calibration
>> +    data to host.
>> +
>> +16. The host saves training data in the kernel buffer and exposes to userspace
>> +    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
>> +    IMAGE_TX_PENDING to continue booting.
>> +
>> +17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
>> +    the host with the mode set to IMAGE_TX_PENDING. The target and the host
>> +    repeat the packet flow for image transfer to get all booting-required
>> +    images.
>> +
>> +18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
>> +    packet with a success status to the host.
>> +
>> +19. The host sends DONE after it receives END_IMAGE_TX.
>> +
>> +20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
>> +    it has received all images. The process has been completed after the host
>> +    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
>> +
>> +Subsequent boot scenario with valid DDR calibration data
>> +--------------------------------------------------------
>> +
>> +The below firgure shows the subsequent boot scenario with valid DDR calibration
>> +data process being loaded from host to target.
>> +
>> +.. code-block:: text
>> +
>> +                        Host                       Target
>> +                          |          HELLO            |
>> +                          |   (mode = image transfer) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          |   (mode = image transfer) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |         READ_DATA         |
>> +                          |   (img ID:34, 0, offset,  |
>> +                          | size of DDR training data)|
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         RAW_DATA          |
>> +                          |(size of DDR training data)|
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          | Subsequent boot scenario  |
>> +                          | (valid calibration data)  |
>> +                          | DDR driver configures DDR |
>> +                          | using valid calibration   |
>> +                          | data                      |
>> +                          |                           |
>> +                          |                           |
>> +                          |          HELLO            |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          | Boot/Load rest of the     |
>> +                          |    images....             |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          |(mode = IMAGE_TX_COMPLETE) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +
>> +The packet flow is as follows :
>> +
> s/as follows :/as follows:/
> in 2 places.
ACK. will correct in next version.
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
