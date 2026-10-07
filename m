Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5053C48551F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367442; cv=none; b=EkWlYTDKnvtbc/no8ZofWXgPI95VySiEn4TH8Q66Q4MfJ1zxEPGAEm2p6jf0+g7DiAzBpmVlmwFEDKlS2ap/M+v1E27RAZPWMx+YN5JqgfOmpDQ3M/RJtXTxmjMHYzijl0Wx4+qRUYm05lPn2v1LZjyeQfWv0fksY7uFP0nn67U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367442; c=relaxed/simple;
	bh=4yM7CVQmNDTPX/vEciJLhHIVlge+DSOESvRSzxjhG1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqia1RJ9RUMTCPh6gbBdyDdg36VO5m4k/INmmasayeq+KJw2l3OkKayG4dYp3pkiVKZaHsZETdlBk+Wicpsgn/JDwY3JYnoWBO4fiFeH9vbC8RZLS6lv9v/E46uxNCrn+qwxBkYP60Ep7eJPXM1PQi8uQhX9snx5u69MtCkgI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpbru3pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNX/0C3B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpbru3pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNX/0C3B"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jqTF3812183
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 10:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=; b=lpbru3pe/3TX0S5f
	Vz4mlcuk2Jr7OEtMleywJD+8IT07fFgr5LQ7hD0dtRonIwvvYtlRBxCN0dZBlfOY
	BrnChFo2mJzeEIA0ikFtcEpykGw/t4pDoQ1GeGA0LZMksYbmwFARVSVb1sz0jMAW
	Cbl/EfxQnj6UCXvaky7dGJiyGkZOyByVkm6wwrLhQGhiiEWKDo28DcjifZLudpQ6
	5rqx6sk3EY13b/EegfDYhUVPKllTBZUWiL3GZSf5zfzyOX+OEltjQmrbwnYSakEj
	jVAF+gwqV0OrFWPdBOiomVY6S0BPzI/qe62PAlYFFRdm0uJkM/53rFiGa28c9oD3
	VOL9bA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrq38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:03:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso544451785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367426; x=1791972226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=;
        b=BNX/0C3BrVXJe2b/PW7Mj5357M8toh8OufEY0u2oOO63JXS6F4z6+4bLiGAgJN2pZ0
         w638Gqh1kVxcHrnB0VXi8yox6ExD10LbxVqcXQOBbMJiypByWnfTeEMuB4OW0EAsridw
         YmUfAVrg2UU8xK3d8b0SDlEZO/RAB5MHmHTLfUlewXNyRQXDlEp/yQn3ssJobeba2VfC
         S3rKlGWQBR/5tybY3ehkBPEoUmI+3UNfC04F+so51GmDV/sf7HFl8tBYSm+VZYFoBmL6
         L9mNRHOAXJkRWuPQWWh+dPQ7bqyeWac7yhzL/2/ZO6AUXQLkcEpF1CnOpqNOdnKj/op/
         1jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367426; x=1791972226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M03AwNxsc2r/rMzULNXg8D4H62RlVRMbC2QVmKzSq6E=;
        b=JDFftkcu/8mqRwX5Gn8+niZ3FVrLreZ5EpGtN8mEyfI1aY3enpp0PM1+T6CRJohz+s
         vS4YQMVafQFt/zq8qsH9d1r3c3cPIEplu/tpWVHYrnWZQLUgFWNuXeCBQVMtPpnnA7Gh
         OXASAiCndhcKHIQLU08zPy3JX08Ab4SKOwVvhe/QXdKi/Dnk2aq5lIz4zIJ+YB9y3Q4N
         x46ljnyYlGnUW3wU3dM0m6E7Gcat8aTISbpIvpY4dCu9p+4ZMuXEm/eHyPYi2Pwsvx18
         iN5h3L4BZKwy5AZ/20hhXbyCVgRdl58yDrzB4nHsipwVYDQU0qN4qJMsWoI+G+HzoAaE
         Dz3g==
X-Forwarded-Encrypted: i=1; AKwUvByZPvtf/RUdxuKqKywN4w0KUE+eRhm8CFWzMkrLmsI7mPOirSeSqMoU3bsNoSWV2uwWACHn+YoulO/YfKw=@vger.kernel.org
X-Gm-Message-State: AFuF++mWaKI6UAygpJCTSuQ4hB0jeB8f3PMiQNRTeLaDyOBqEE7s13lz
	KWO03p4oAbvGhaSCXosgo6zcPCZaw+ejhdbogjCO2WAHF0OlKh3FXoH/5X9kIVvD0F9Paarm+cM
	e/xFmNV9fQaM9zwNqZam0gEju9liZqQZJVVmX1ikIc5yE7o3Ysz+dBtg9eHEyAMhKICI=
X-Gm-Gg: AYBFou2J8bIoYDChbJKpEhqaQM9u0BuP68pf1bExdh3jr7xFVBotkQIyKC55GNMFYgW
	nS30jIH+BbrQfIDp8IKpFW925/bJAVHmVGEH8Lch6alxJ1qhsx2Q0s4jDIOZCPF89YfSBydoRZE
	AwoO4VzbFIa70bzvRiwnjgWY35YsBdYd8apb/hWrYeKXypRSRhqZoNC/HQgAJFl2qNrFBBZbCYV
	WBRYIpmQUNE8txZOOhABhZz5rlHq3UaYSgLzSOfSQV+Y8SmdR+9/XRhpDBN0QsCc6J8mhc4Si7f
	O+wLnWaaw2w9FpjD8VMuyzWfI+2hn47Lqt6kMzZz5wmIq67fAMdCma4Hxu/gqYuDn9S6aIZ/J5U
	6yLaIb4a244WzEjgqiaaS/Xtjz6mDLby/9QIHMPFt
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr339530185a.8.1791367426193;
        Wed, 07 Oct 2026 03:03:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2912:b0:936:e938:b07a with SMTP id af79cd13be357-93e9b345658mr339524585a.8.1791367425692;
        Wed, 07 Oct 2026 03:03:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1144csm4297318f8f.23.2026.10.07.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:03:44 -0700 (PDT)
Message-ID: <e352d91a-32fb-413b-85be-a2d30083eaea@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:03:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] media: qcom: camss: add IFE pixel path support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac61903 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uTK4J-ebKsyKmJgbFeIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gHPBBjM-dJ-SFPIFR6PumQB4bPqTrFj0
X-Proofpoint-GUID: gHPBBjM-dJ-SFPIFR6PumQB4bPqTrFj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX1IPUzKsDQdrK
 ZO6MQ/BGwc5d/jSg83TOWH3298WExp0ef+sh8pJhjGoM4EL19iHqQFbTXa3zu0QXVv0H1NrP9nK
 8xEgDhMMuy6QjwdFKhM+i9sKnRIFPmC3hW4JBLBmmZswp1I+uR2M3kePF4CghG3sIM3UWUQhf2s
 kYwg9KRHgN6hsLOVf1N0CaiB7c1DKVD+rDnf4QC1GLnvhbLQ0KDWLakdKJ0Af90b0Rh4XhA3F2e
 P06yWJR6uDJrpdkH6JjLGU01eViIgZKmzSdaR2qVatnhpNHWTp/XcVMfnkbyPIeRECp4LLwLYAA
 zxDSvO8/VjIWLNp5BdL81xHg8Jlg3/uMN6sSp56DMXTokx4PMT9Ac764t0n/8kBuegPaeO0fgLN
 o/GA7E7IRHgA3Kffpve3ML0u+q9TJXAzOtDEvvNtU6ip4qcsDt5dHM9DR6bPU/2uZU/i6/eHiQN
 uWPMeC5Flxv4s8/O2fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX67h/nwW2qKzY
 4qIJ77+FKp68/Xwg+/OUOwCIfs0vtIzlBTVsI96xFMFviVg9duIctm5vRXuv1K34UTnEy7SAPWO
 Ce7GmX6eAY7JT6KWHXpYlMu3OXsFFf0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039



On 10/7/2026 12:59 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> NOTE: Bryan has posted RFC changes for pixel path params and
>> statistics. This series was ready to be posted at that time, so it is
>> not rebased on top of Bryan's implementation. Both implementations
>> share common parts, but take a different direction towards enabling
>> the pixel path: Bryan's series extends camss-vfe, while this series
>> introduces the new camss-ife sub-device described above.
> 
> Indeed.
> 
> I have posted an evolutionary approach - shifting from and fixing the 
> original sin of mixing write-master and rdi indexing - as a first up fix 
> to the driver, and then placing new features on top.
> 
> What I don't support here - is a parallel in-driver new driver that 
> leaves legacy stuff as-is and just shoots off and does something easier 
> in its own isolated place.
> 
> Great to see the willingness of qcom to follow up on my lead, lets work 
> together to integrate your stuff on top.

I agree, lets work together to move forward on this topic.

~Gjorgji
