Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586371;
	b=DzKC89pyRES/cG9mdROtOmFhdJDU2GvFL25tc3DOPyVMk5MkukviVV3lj0cf5WJIpX1c
	 V7RrmMaMXQUrRrB1o2tIh0V5EVjFzmP6r+oOjAhozRNXUfCrXQoz6qi96dWSeBEozYCAz
	 VgdhEDfBaWjLivkxk+wIUukeSL+4xYMrZs2kzIuiQrlL2PJDfdlFlsotEDE8qsc/QNvTw
	 b7oGTDiNRqP5SQ7fCCHIiwBC+P/ABv4cSrPUZ40xxSTwSXZzPfUdIP0MlByb4OFKkSpHS
	 pt0GbGFWkzEwsiHYzzf/AWOMBrF7rE6tO1X+jy9G8FjHWLI8fFxBQseagYG5Gcq6oDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=;
	b=HGq8W0xViZ1BsT1EuKsjKqh9DSUx8xuw2vZ+RqCZf/2uMyEiSPe6xXBSRYd62QHldy7F
	 2wnDLaU31j5gf381AfUsd52NVKJNeck9pqrxCd+nnOkNWImzRzHE/d1+4UnY1o7fq8lOC
	 JxgvpK51LVZcyNv8MaPWUXyTU4qYU0z1xivpPME11khuUJMSHMH3/U+9GXWg/hK6ZangX
	 JyPJWXIgQpMwEJqTJ7TZUbIt7mdS78oGyW4wEYQEljXq2sTmyrciWzRF2Lsyu0cqxHtI9
	 el4JmQ9voZ0SMeSrQ6WsopuM8pFP5fB/QpXoAXTWnsrSWwhA2Lnu8usnT5hYW5/rR0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1Efu17s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8rG+yzj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0059606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0059606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1Efu17s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8rG+yzj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LC3kiV1103677
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=; b=b1Efu17syShExMOi
	8TIFaFf7PdUS9CWgB4NLvXu3SpAI8f+dkSyIoMkwcoxpCggzp+LX+LETiO/pBhBQ
	rkI+iofpaWYAcb+lu4ZmGt7ZDqGNpB4nXBfSdPcz4xndXzHYnQTkEHutrbJ9k1Hm
	naABtbKCQoSetTz5a476Ua3fIAJHRL+0ssEkIDQpqacxyFDd+clXcd+ljUvCwGUb
	vpjWUUzJfJssVidql1s46tAqxY7po41T+VDvacx14jOwzOaUvZWrsRCXxciOpStD
	mSw4QO2lZSPu8Q9Wu5c3YPPidWlNjh+M0tjagFuWUlmd12rIQn+9nbLZP+6UHf5I
	F29M+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkvvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:39:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso6868785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586369; x=1793191169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=;
        b=B8rG+yzj7p0JulA4yTubKsU5nDTcZX8czgc6g2Y1jmAYxAle59S24WsBxNor5/GDik
         Ks3ZTQ6sU+r96jnV5rTh5qyAgxeZynIUWgsJeOdX0psUrmayOi2Dno79Urnjyv4xio+A
         Ru426AJiqi0emEC/4j/622rWZn5+FjDYmE0DJ4uMA4mAVmVP3GOuf16VZz4dza9vuCy8
         wa+9W2ZuWwnAkYkogg14AGOvJCi2RBNpesDj8cJwYmdeuEGVUOWySl7P2n2nPIcEzI1V
         neNcE3ltNaIdk5IfFPHvtHuYUUrgf7RV5W6OpSuwH/7fX/SYLPyJddUNbqbiq+ophkWu
         rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586369; x=1793191169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=;
        b=nB68Swy95bhiMWmIJwvG+DvCy5vTvLYd9qlwjzK+hKJHvzTr5qS+oNs/iC3BC8caic
         rP3TYHputnJFEkqxuvwzIlmgTgX+ZZ0lTb2TO4obzU3QtHgggx/8Di3/5+VebwVEN3EK
         EfBMk7ImanqA5PPXkEUpKAijNmT/spMimxO7R7wX16zUd/0uaYYLk+bPLtm1YOtlo158
         WSZDWXVZoGmSViiCCOn1xw5OrQMqNAsXZKurmmlG+h/m/Q7rK1E9aZRinsP9h4iBZv3W
         fgfVnurUrqxzaixZKjO9woAxxysHpUbHum44SBsgaJvKP3bRNIg3Q/QrOAXxQL96HD2a
         EvEA==
X-Forwarded-Encrypted: i=1; AKwUvBwEiVQo8mT9lnsUdJqQwtMZvulhF/6VJn6RB+90rVoVbo1AtCbveffYMOcthJzaPIzZlXi5H5XaAbmFn1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdBV/oVt+XgKHnva8Df2emZsxmdLfNVHFA0VshuF7TYfI7sIrH
	UQ74mSEhQGd2Zx9HPJBPKU5qPJZCZN0gc4D4BhdeJsyzytkKxR51zzi1hSJq40QWi9mlcQW8Fkt
	dLu0Sj7HkCDlUmmdLEzgGu82DAjSKb7pLW50OTZzjvLRUd6DEUrL5DIfckw7ssvQhp/E=
X-Gm-Gg: AYBFou0tNBSlhItoxOXqnbHfoQXeLV6wRVJUNQZ9zw6W8qmXnhgwO7Qcay7MqcquJTw
	KJqU8sgh7+d8xeoQNat2n4mRqTJwPjOiHl1ZjKZJglHTtdpyKSUzmlSjoTz/6ld42csHx+nSThU
	K7Q0S5Gns4B2+HpIpCp7K6BE/kaiNOIL9eXKHXVue1tQUkplIVltgYVdcAYGYZx3mE4+66pjEFw
	iKLpQr0sAHtXmOLgpUyKhjxgUma9oFUWCpzB8jIVuzGvqV58iXXkCK+DuGtafbStwsQw9zl4EY8
	7GyMFaAgHP71lPPLAU+Uc2gD3YmkFVGNC8yJ0IuV2dnkTulssw9h02XU/dud4h4izMtvJYQgMdX
	a8ydJPwkNM+PVE3uSI6PX1w==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr481807585a.1.1792586368788;
        Wed, 21 Oct 2026 05:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr481803785a.1.1792586368328;
        Wed, 21 Oct 2026 05:39:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm830949a12.13.2026.10.21.05.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:39:26 -0700 (PDT)
Message-ID: <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:39:24 +0200
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
Subject: Re: [PATCH v3 2/4] soc: qcom: smem: validate private entry list walks
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <quic_sarannya@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>,
        Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfXxajOAKXGpw5d
 n0FbEomSfLwns3KjSD3QJ4MiFUybm4OlkeR9zKluCBfOcEVEz6wBAxE14+iN9n+9+4HTBbUx2Mh
 06fyt77NGD4KCJ3+upS0iOBALk3UytVg2loxNVjLWgWXPmV402LtF/lDVPSPjJc/vv7IDx0uiZZ
 Ci6FpeaQcuH7YPgY/OkA/GdYQwP2bzu48L8o4QxV83qW1Jo/ng7lWmnqhlgA/3klHuCs8xswuqR
 PysM2xLUNUMZCZqDKrfutwtxtDaFONdKmfG812TNYWrrtkTsqMK9o50Aurn3t5GEkLLLwT3Av+M
 HFN8plLlmJq3ixG//MLrY0bTYNcd2k3VG3v+EjiyICXgoI8bGCM8iZnyxdvO6rR4cPM2/ZyPWB3
 uEqTZ3WOJ5eT9CFlIo3QoxSlY3WX3UxF5bGUwtKoaibPxbTq8n53dShsjYSDUstugoPb/NMzuUX
 UZlCxtk6DlVXmVzgcXQ==
X-Proofpoint-GUID: u2Alfid_czMqQ3-B2Pj0eyBd-_VqhDFJ
X-Proofpoint-ORIG-GUID: u2Alfid_czMqQ3-B2Pj0eyBd-_VqhDFJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX7Zxx8fBV/Q4G
 X8CnGHSndKt3aMfqznx1K1J0w60JaJf0E04xECqa7Qjmlx2v2uxOGCX4Yhkqvc8ujZHQmy6gxaG
 cryCSJNXs84Ri8WQZ3Jpl+PxdjJoR7Y=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8b281 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=MnczmIT-9I3NQN6y1tMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210050

On 9/24/26 3:10 PM, Albert Esteve wrote:
> From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> 
> When walking private entries, use the uncached/cached free offsets as
> the list bounds, require room for a header before dereferencing, and
> reject a next pointer that does not advance.
> 
> Skip the cached list when the cached free offset is at the partition
> end.
> 
> Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

[...]

> -	while (hdr < end) {
> +	while ((hdr + 1) < end) {

This will reject a header that's at the tail of the buffer, need
to make this <= instead

[...]

> -	while (e < end) {
> +	while ((e + 1) < uncached_end) {

Likewise

[...]

> -		e = cached_entry_next(e, part->cacheline);
> +		next_e = cached_entry_next(e, part->cacheline);
> +		if (WARN_ON(next_e >= e))
> +			return ERR_PTR(-EINVAL);
> +
> +		e = next_e;
>  	}
>  
>  	if (WARN_ON((void *)e < (void *)phdr))

And LLM thinks should compare against cached_end

Konrad
