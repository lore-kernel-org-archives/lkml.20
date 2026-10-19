Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BCF494839
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397441; cv=none; b=mFwfO61idGmF0FR801XrzgO9Bm0HX+Ys+E4Iv71n4mkudTyQeyfWmc6hMllUPqfHGESFjnKQcw4ofsFWnl2hbMbhgMWdfAjo4fy0MI+J3KBhwHtJVi1lykuoqvzNSiItAmt4dvWv46CNcFKGHaLEfB4WT+uv5KCJvcFaBjgD2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397441; c=relaxed/simple;
	bh=PXcKyMYS/hHOX3NpHkRuJUCALN8b1o+BCk5pkYZdySw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzGOeR0WKfOeNikP6GfY+YW6InI267e7MVuPmqxgzDhWG8hq4V364i8UWni9NB2i6AJDdcnR34+tgUMk4eiAxL5SYtnejvvRChAHivqp+YIESIIiOfnGEmrhpyqBXDUq24bbceb7XNlh4ax1r7BU6ErTqKtStF9vF2InqJRZsCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niKjqwWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JERt7PA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niKjqwWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JERt7PA2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7k3942150263
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=; b=niKjqwWuCwAXffN2
	7YbIdKbJbU1OS7827Pcs2ERD5CpnK3+fUj2AvBoG6oEa/ODyNd005e7rs8qnyZeD
	X8J73Pq1zOChfUXJgUP6/+UkLO7vo/BU93LYHqzDEMdAJafVaakfVUw9tFKHC8m6
	wlbZdVs/UCDe9QoBQnkcL4syPu6tlBQJWwlV47ObRynzyqZ29Oid/X09a/GBd7sL
	uBJ9/TXFn6eUgoYFjg94IH+FLqIeyuB+J6Khaaz5jlN4qZHkcM/OCwKSDqKm6RlV
	9HwUYNB7aLwjjbOolCs42OXmyc3KRFY25kfXXmGlJzD8oeJAq4PaTT3J7RESdIaZ
	8JPXjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x82tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:10:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso537191985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792397438; x=1793002238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=;
        b=JERt7PA2GX4rkZEoUrWEEOdCMtFjkwsh5Znt8lYTYaD+lHFZSVxuP5CfbWtrzyJ2Qr
         9X2C8sBRn2Chc3ABuV7XFuNWySTh7q/74NbamJplzKLjOMBVJ6sS1jNDeFwIwqtXnPDY
         /ogFGESD9G80wiMMAmBI4jccSBrGGxaFRveHgu59eQ3WX7M6A2g8l9xsvagbf29Gabm1
         +AwLYEjaq3arb8pmmdZQudQEhRDN6A+48d6yPqSFeD4solS+xFLPRGVu6gRwD1JL91LN
         ENNv9C/7bgz/gomFMh8AMZ1lAmgDppPFQYFAFGhrUEv/yJuUzjMrkSiqJD0iXaP8OkR1
         ceYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397438; x=1793002238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=;
        b=H/a+AB2DW9ypQ9qRo04oENzg3T+X00rZ7hAAbwifRbkM7RNdP5x3NBWV2oxg11UxaM
         Bjuzq3dObdhVYQrSMJAUtqnASXo9gL84+HCWiRIPX6sFTxPp+mjtF8SLiUOw/RpAqOYl
         gGj5QhreBzd9J6t6rd1cRGOWwF0xeasG4MT6ne6FP15wHCOxwhhmcIRVoYBPAP/d0dn7
         oqLhHiToRjHda4QG/on32DLlPSv0o7QyNk0jzB2I4SE5BELCZ+wQAXd+Y6NuqAqkXIw0
         3IO5uIGQ+o6kJPJttXiZZuGnXY/5l9DtZJwW5WV06n7xAIh0CqAB+DFC0gLC6m15p+Hi
         gSCQ==
X-Forwarded-Encrypted: i=1; AKwUvBybMLcrmluLVXnaIb0aj/fdxZmplTyjqRWERzEQGMgjPjHJ6T4Z6ZOG6OtoXkmq83wPCzEuvN9N09/U6mI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr3GVkq+55zu9xzsirN9LoGvIy3hGhi2F96FXtrliETCqUztgW
	WiIb9jIU3z5TtrJncgvQdZ5R04F1jZ7D+8hvhsHRT1BjyHodANHGlyKmhEmyUOb4+PHlf59xjPf
	o+Dr1+S1CPBO/f+0weqH+sAAHD+9nFhm3INJQ/9NtjpIZ2IRbIY4f/GZF/6ZJ2u1+XGY=
X-Gm-Gg: AYBFou37nMti26sbnkw1CLtt4D1IpYPem54jD8WxOBLWG3U1QUnp52nBEoB1e9Q2ROH
	JSIzVVqvG6OxOb+Doh7615fCN6F82cHbL2JrAdbHbKiBhvJbyWNJsP2L9yixEIuSApoDpveIJk7
	eWYarvwurO5AGHUKYvVUyFwgFh6+Hlnn2XOuGZtdoyHmNmAi9m8P2MvwUZ6SiKHiSU4vjpUmKru
	YRogN65Q+r4ZrFlQegL2DEbpYA7Qwxs+K7KchMr+h5Yaxs1mGfcxAeIVf5twL28L6YW7Clv1oiA
	dPaIFzhKC0ZQt5rprxYg/oh3Lo5t4OwGtUOKgnr4zLyzUvCYjlPdCY5nq73pScE5pP/mFz/COgS
	osu3pkXW4M4VUKr7YFJHev384Wg==
X-Received: by 2002:a05:620a:2a05:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f17f3e3bemr1677761285a.24.1792397437722;
        Mon, 19 Oct 2026 01:10:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f17f3e3bemr1677758885a.24.1792397437220;
        Mon, 19 Oct 2026 01:10:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm22045504f8f.48.2026.10.19.01.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:10:36 -0700 (PDT)
Message-ID: <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:10:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: Fix off-by-one error in port exhaustion
 check
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z96TuMngPxwWwdubX9TZuXB8auT1n2hY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXx5tyCUlq8X1d
 tK3AoBc1cUL8JUvriW3nKmTuKK7HszsQyfqOkGXL3+9oGv/OM48I28TdE+WuQF1oL17/6KGU5jU
 t8Q8gjfD5E1mhFnCQ7/j49qAsX2j3Xg=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad5d07e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=s6-JtZVsz5dYZhUdyjIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Z96TuMngPxwWwdubX9TZuXB8auT1n2hY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXyq41uKOhBtCI
 JVyu1ob0Gg9QMyP5Y8ytuBJlAtz3kt6mbCOgp+hgxDqhzOItAxIdH9fJKGtC90/tGdHhNg/GM1f
 eoVuQ9r5RJPQZvW3lXTRXjgvNvcfBOiR/7G8Jv4LtDi5I7+5eZBeUlNTcTBbCySQSN7IeQ1LcTt
 G4zWfFjYXxFxBRHq96sRK71YFx5x47YsfFYAknPMFf8rGLNHJxQOVE8P4HEHbEdOZng8sk6pOAk
 ebCyB3ekkEsv4BunoOF2i02kkt3wfSv7IU5PZ5rnuLE8mXBEi85JoREM9KWyWvZjErI06p+PAtz
 Tn8LuQALck4QFGeillJ6Tvq1nnGrV19nZAllDONG6Vz8SVJL5S50HrRncF/anOKMFIylP5iJFsZ
 8NvTWqNTA+DBg4+z3HAE6bcSRM8PthS6e9DRZT4UDleNlvAn0BVzzkuGYbj/iQEOruw/Bax9cMQ
 xjP79HMQ7PxP94xNE/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190032



On 10/12/26 11:17 AM, Christopher Obbard wrote:
> Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
> port_mask reserved. Valid port numbers therefore range from 1 to
> maxport.
> 
> Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
> stream_alloc_ports") changed the port exhaustion check from
> pn > maxport to pn >= maxport which rejects the last valid port.
> 
> On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
> to swr2, which has 8 ports. Each amplifier uses one port for playback
> and another for voltage and current sensing. The right amplifier's
> VISENSE port is mapped to master port 8, which is rejected by the new
> check.
> 
> Since all ports in a SoundWire stream are allocated together during
> hw_params, this causes the stream to fail with:
> 
>     qcom-soundwire 3250000.soundwire: All ports busy
> 
> The codec DMA backend then returns -EBUSY, preventing speaker playback.
> Disabling VISENSE works around the issue but also disables speaker
> protection.
This comment is incorrect, we do not have speaker protection enabled on
any of the devices.
> 
> The original fix addressed an exhaustion check that could never
> trigger because find_first_zero_bit() returns maxport when all
> searched bits are set. Include the reserved bit 0 in the search so
> exhaustion returns maxport + 1 and restore the pn > maxport check.
> 
> Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
Cc Stable and Reported-by missing

> Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10efad..b4ce96792fa94 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1348,9 +1348,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  				if (m_port)
>  					pn = m_port;
>  				else
> -					pn = find_first_zero_bit(port_mask, maxport);
> +					pn = find_first_zero_bit(port_mask, maxport + 1);
thanks for adding this case, rb3gen2 should not hit this anyway.
>  
> -				if (pn >= maxport) {
> +				if (pn > maxport) {
>  					dev_err(ctrl->dev, "All ports busy\n");
>  					return -EBUSY;
>  				}
> 

Once those are fixed,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> base-commit: 2e9eff8847a46530ab937696f340b9d5bea2e4ef
> change-id: 20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-47c0a8af1c5e
> 
> Best regards,
> --  
> Christopher Obbard
> 

