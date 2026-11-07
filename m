Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035830;
	b=X0k3d2J1r09rSeRXq4+DjIgze40ETLY5xfKDycb8p8yeBOkasDt0xfSjKDlA6qw40CJQ
	 5i0zenD6uY4X4qLF4Gq+S8kfSgQkePinnzA4Ps4RjODG0FQcZs70Osw6pvbf2goJWt5v1
	 gpheHybg7yc/gqCWtMm1J9GVadrQxJ7pILxc1Io3svw2op4LsJiunlPLJ8GWvHKb12Qa8
	 y7rAysa4rmSDLkrbjOVE1wlqtcEgeHmoJpmKMRhqV44Vul+DSFHaYNUSxjqASQmC8bn2d
	 LG03MiO3J8CK57vGFKmD/FgHOpm92soB9JSDQtfrec3hD01FffmvJlSQAvATvy0J5zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=;
	b=t1EJiTrSlv7lCt29UnJUsUbaPw7SkfJrE0TPSKxT8FlJ/Gbr371gKVDxXx/3SNUm1uQH
	 vRms3m67LPSyPIL138T85CTa7cUOxkp1wmbKmvsP86EP7HlXXcuSvntzBRVqjUG0XoWkm
	 5PLfVwV2DbTOJ9JoT1xxOUN2kQurnqfSwWTVRSiEJqSa2UmvUt5l8mPKvRUMLGXYRjnvp
	 fY4EQ9pDT3BaMVVFnzUUqT+uLU17MT5rHnnm8XKMsq3Xya9dXn/BweomuHXUmvRZsKgWr
	 DQ1E+mHfKtoCSt0wj3fuK0BYHy75X0eAjSXOkYRZPAlPz51fJQdKMP8QSDWhzt2Vd6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KzLc+/lS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLux9zVO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78760606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78760606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KzLc+/lS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLux9zVO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A75e1YV862470
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 07:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=; b=KzLc+/lSWUml2+rq
	1WTkQVc68o845G87p69S4xaUjRpO+r5+o7abQJ3IfwsMjVW/6LVdPE/uuQ9kXOJu
	brCXuQSGQZla3DIBIFhTyhIQh/yjNGlNE0MWLxFYWvGWQgTRrqjbplineuKV8N4h
	PPSJv2r/iVs0gCB/B18vXxgAhamYJI4sq1zJkW7zpRT/JnitllGxSpvnLqYPxYcY
	YZC63inKp/dkWjsUUndk8S5MEl465qF9S2m2sTCKysK/uGRIU3pGCxy+RMtWaQLb
	gubgkPU2tuRrVFKjsR91iWkeQqH+9wKRyf5mKFSN/EEIICX6SE3orRL5oWvc/lwu
	ZioMzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6gbtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:17:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so284002a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794035827; x=1794640627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=;
        b=jLux9zVOryrvJOZl85pydAz6JQlnJ+7TlhoYL+7ples2OyQX5nCSqfTMfc8RLR6Ilt
         v3JDeVrSYqo9zASq92vV7iQpjucmBZ/1huqZm6Z5y0PZM4R6tTh6bLhPd1jWhkx3gyXe
         0UGxVJeS7FGPCFMXjKQFG7cDQUktM0HrOd+R3sjQjXCvQrj1wIktqC7acrH2KNp1LH7n
         fKqxdwOmEEeNQFJ9HasZoPHw7sj0HRaPVCdeNDKujicevkxRy5o9JjL+e38clx784Kja
         e24fHOCPstzvJmmR+JuxywuipAjscXMwM/iUUhCBoEYrp1d3eJgwSH0h/ftwEWJCHrpA
         QuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794035827; x=1794640627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9xsbynJQhEaJ/3HbmjiNS+dTo3w9nFytwU7E25SvA8=;
        b=AfCoQ5RJoCKe7dSVZiLtrYTdYewydOnN8NyIeWGCCeW1cnaAXEET7HqstV7iKbVkCO
         oKy4Q8KoXa3ikOhd9AdeAJj13/qa4ilIglfoqz7axGg1BbpvkwMXkgILVfLSzLfdi92c
         zp/VQUSRaLa4Iy/IOzucOZJNrf3EhoJb7J48fPRbtTd3/j/ncHWQiP4tTxStJSF+iTp4
         jbfiz1KrYLZGlKW1q8F0a6vz92WKVqKBYTSNLheW5u0vtqqYM/Z1jFDO4njEHNAj335P
         DermwgGIFStN+3c6GoI9+jobQZ5F8/5s/GVq80jxwQYw9KW0QrqS7kPhKMQ0ug5tKjNO
         3YLA==
X-Forwarded-Encrypted: i=1; AL+hErG4B6vKy02/9HH/m502Yd6jt/gLMgKvFKkzGevYXM98ylJz2NeMSpPFeth+x+pFbQSHKqFPZP2BXlQRIJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r6EkEH8ztY6BomSRdVKWtBQ0PJ0LF6ELiQCGMm8f1lGwKv2oM
	QyH/ooH/i4RKpxIoN/cbC2trNdC8z86NG1xU4TaGEI6CUD969XEbmESR5PIBxH4SmKx7aJ1T3Xa
	9XL+8qRYzTpj8glbHSqqZY6V0ehASmtn3/JC1FpfA5QyvZK/8thsxYwrwiSinpG9pjDA=
X-Gm-Gg: AYBFou05nW344vpL5jK6iL86mhQR3nVNA4rHG0/U0Yi+wmCkM5gPEv6TfNYQT9901F9
	/+waf5aGnrX5fvAKWWm4GIJXTZ4iGUuN0LtCslen1oJ/6YGXmahq7gaOcm8xfzFzgmASZx2mcfV
	WSheC/AdgkRQ3GHbkaPZeA6fvzrUWdU6fFy1BdCpv6nZDbZoubdTrxaWu0pOMJK6jstj5AozbDV
	D4zcOLYbZWlliUbFfxgV7SWWK0v1oUXh4JHS+Q30kod7bbEmpXZ3B4bZfj1WnpoM4/tn7KMVkJA
	5K3Sf2RzQw7Q69HLI306YqZZz3NkVRRqEzlAZyF+I5A2omr7HzPCMOJZMQ9x/H/x+/IN7+NI/bD
	Sc+Y9IiarORV2Z5TbbgISZ6R/4dFDkOOeyM7IicVW2uqFQlY9Z3NLzmmkN22WjW9k7djLpkVUqH
	Q=
X-Received: by 2002:a17:90b:4c07:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1068bc47cmr1044931a91.43.1794035827114;
        Fri, 06 Nov 2026 23:17:07 -0800 (PST)
X-Received: by 2002:a17:90b:4c07:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1068bc47cmr1044923a91.43.1794035826641;
        Fri, 06 Nov 2026 23:17:06 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10588225asm2187339a91.8.2026.11.06.23.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:17:06 -0800 (PST)
Message-ID: <5637c611-69d9-4d16-b4c4-06fb794aecef@oss.qualcomm.com>
Date: Sat, 7 Nov 2026 15:17:00 +0800
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
Subject: Re: [PATCH v3 0/2] Bluetooth: hci_qca: Reopen port after power on for
 QCA2066
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, chejiang@qti.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20261028111839.2148515-1-shuai.zhang@oss.qualcomm.com>
 <ygy2hd47c3tb4vr2joiiy4bbg7rd4pn66x3co7iifv65cvnrf7@g36i65agh6p3>
 <561c0f8c-3252-4802-9d2c-ca1f93c65247@oss.qualcomm.com>
 <62qrp73oyhaismnbnb7q57z2loovfpwsut4t4bwy6vda2vaewc@sbifauqgi4jx>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <62qrp73oyhaismnbnb7q57z2loovfpwsut4t4bwy6vda2vaewc@sbifauqgi4jx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAyOCBTYWx0ZWRfX4nmCta0QB520
 3eF9nJowXXQ+HPCLwlo0lCuezFa4Pl+8vVJTYkxbdRFUiuvTwrGiTqUmwdnDrpYHInmVeHLiyC0
 wrdiW2c4NGCNyWr7LXe7dE+17xzs7682+MILKPsIDnZ/WhfzIXAzEBVFVv3nMJhh8jCjMttHG8l
 e8nJ2YHhu5x1bfdo1zGfc0Qn2k4J4M44O+/cLQAPPJrIcc0zBXt1xJh0oqm6cdxozOBr0LZW8LN
 R8zV5CRbzKaJgDb7TSJKOxnqO2lqBtXw1PiwQPjlB5EJtG1VUzoOgdJBviADSwZ0q01o9b2HIRJ
 ci8MdD5ethU1GxlqYiu/Cq4/j7wlu4D+I4gg00v0Hm+FaxSePf9W5ypJ9mqUp8mSUCtrDVSeWC0
 cnOenP2WWZS2jmpoMPyqYH4zd0VQtXOCX2y7ppm4QdaW1nUxYrpHbncEZLOf9Hok9F2g9erY5a/
 KW0vCEXwmAYuAlWl4qg==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6aeed074 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9anGb3dB1dyhe_3J-4kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAyOCBTYWx0ZWRfX/ln+zD8RTQa0
 6dW7AE9D6JXfC90sJJvce9ZfuQGn76ktNa+jEIt15ixKnzGoGpLfvoSDF7rBnW9pjHRx64jdX2A
 BaPgYRerN7p5aJSfaiIhAqyItCjuWg8=
X-Proofpoint-ORIG-GUID: N0TjksCIX5yJtRLZXiCxhFfWS5iEC_RR
X-Proofpoint-GUID: N0TjksCIX5yJtRLZXiCxhFfWS5iEC_RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070028

Hi Bartosz

On 11/6/2026 5:17 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 06, 2026 at 02:35:25PM +0800, Shuai Zhang wrote:
>> Hi Bartosz
>>
>> On 10/30/2026 5:29 PM, Bartosz Golaszewski wrote:
>>> On Wed, Oct 28, 2026 at 07:18:37PM +0800, Shuai Zhang wrote:
>>>> QCA2066 needs the serial port reopened after the controller is powered
>>>> on, otherwise the host and the controller run into RTS/CTS
>>>> synchronization issues.
>>>>
>>>> Patch 1 reopens the port in qca_power_on() for QCA2066, as in v2.
>>>>
>>>> Patch 2 keeps HCI_UART_PROTO_READY in sync with the port state, so that a
>>>> port which failed to reopen is not closed or flushed again.
>>>>
>>>> Changes in v3:
>>>>    - Patch 1 is unchanged from v2.
>>>>    - Add patch 2. If serdev_device_open() fails during the reopen, the
>>>>      port stays closed but HCI_UART_PROTO_READY stays set, so the later
>>>>      serdev_device_close() and hci_uart_flush() use a closed port. Keep
>>>>      the flag in sync with the port state and skip the port flush when
>>>>      the port is not open.
>>>>    - Link to v2:
>>>>      https://lore.kernel.org/all/20261016022302.4003647-1-shuai.zhang@oss.qualcomm.com/
>>>>
>>>> Changes in v2:
>>>>    - Use a separate case for clearer logic.
>>>>    - Link to v1:
>>>>      https://lore.kernel.org/all/20261015092224.262158-1-shuai.zhang@oss.qualcomm.com/
>>>>
>>>> Shuai Zhang (2):
>>>>     Bluetooth: hci_qca: Reopen port after power on for QCA2066
>>>>     Bluetooth: hci_qca: Don't use the serdev port after a failed reopen
>>>>
>>>>    drivers/bluetooth/hci_qca.c    | 46 +++++++++++++++++++++++++++++-----
>>>>    drivers/bluetooth/hci_serdev.c |  6 +++--
>>>>    2 files changed, 44 insertions(+), 8 deletions(-)
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Just want to confirm if there's anything else I need to do before applying
>> it.
>>
> Luiz uses patchwork, I'm pretty sure the patch won't get lost.

Thanks for the clarification. We need to revise Patch 1 and will submit 
an updated version. Please hold off on merging it for now. Thanks!

> Bart


Shuai

