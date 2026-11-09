Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216125;
	b=d8aCudH/tEi0aGUinm699a0wobLzJ1Qjfrz4RMD2k7KZSdCbNza/CeAUO09VgL6d/we+
	 yjYOzgTyyxdvWU+b+sS1em0k7HpG7SWusoql19Cytt6lBK8ju4noHkhJb9tY32oqk4w9N
	 kdDLhJlsIf9odmVyu6Gx7d2npbdhBYphxLJ9Z98Yy19qXCac3HlHvpaa3WtmTximQHLNB
	 +ueadE04tJTzfMCB8nVhPsTB1R6dX37BvclDbFaTZIGwQSSbCGawN45Xcvmn6yzqs1a1g
	 sxOIT6IzG/Xs/TaPmIvAJuCvzFvF+b+G3GYzrGAYt3s+Ucvba9WQzZh7MYicFINLzRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
	b=GWrsoLgUVNktxehInlaQlQfpPaGb+VefaItpn4KCTFKj7zhdmfdmSdig8ry5LtFJo0Dc
	 UkHVX9sbU/6W3WUCADGZicoz2yq/t1++4AaKDdyHk2yJh8ALHvgWmdGMdDEZQN/sN0Ktv
	 SS/sqWcuF0PyCCfARp8chsO17HrDUOLwCCo5ez6OTrAgGdAWXnbtb7DjJMvYK1ZWYUc2h
	 5PayVM3iuA8vWwm4KZtLDV2m45IvsxU9A5GgOzX09k4UQVX3yvKsp7TBqGOYcGavzgZMC
	 ovWZRz+6DZqmnl/VQc7+LU8lkUwxIAZrNhMGhgBtJilUr7Xb6HacSk+RQko0xDQ7Pww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyaJwg5o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/7FYHjD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F025606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F025606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyaJwg5o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/7FYHjD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969uH6480849
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=; b=OyaJwg5o1UPg/G3/
	3tkg6J6KlESn9QfzWD/jMmwRJFxa24MSYhsK70Kj5Fmej71cp4O8lulJkw0gJqRq
	42m+dR85V2cv1JT5Dz4xESwFw04lE5ibI4eVZn8YY5FrpQjPRoW30tj4EbzSb2gN
	IaRUleqi0C80g5xjEXQyxuk0pbsvjT6oOSEHBMXpjiXaaHy2Fh90PY9Ds2k5WNQR
	yrM2HzEBsepiTCMYFefGT5c+9sJNGtjXUfHMpjjHsRfveXvaN+zpGp63ckOUlZzR
	eftriyugGnn3rEdTNr8nt+SJ0k2A0oY5SFRtzLWVgGIPJFDMe+xiRXQ2cNaaoFd/
	F41rxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsdrhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:22:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9460411fce4so11082585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216124; x=1794820924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
        b=Z/7FYHjDnUdXbv5V4BY3NSr73Uz3hdjIuhfVMqZyrSUQUJ1yx6fu3GKtgAPXDJdTi/
         mgSzn2LIgydf+/2+zHaWQFsFC8P1ReUz+8OS7u1/8+C5T+/oPfGXWyAtTjbZpfVLxXkb
         aPNe5SzP8y0aosy7AHBD0enSS5Lmy8pBpA1PlmRTyeCn0v8McL+B8nNhGzTU0LHSdLbT
         fVq79M8FBE++rn98yGz/yJfSAUE6fpVNFKHyu6aSE3p4G9xA4uHArRC4mzo2roF3VyIk
         0KclmdSoQeinmovJWJNC5KZjp4L0sPitXujRxdN+S+C/20MNSy0kOL8jhuUSemMBvOe2
         WD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216124; x=1794820924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
        b=DTliFvaRGiGljAEt7p3hseP7b8w71MHU9hVIi8xX3T7yhbAVzp2K4qyrILfbX/iibQ
         U1NB7OJ0HULewasn39iNTCOuRylHrRhGENOu8f1SZUXjryBkSfu0SGC4ZBF24hCfXq9v
         G03SliUtsheo+/Hwe4NMXCpXSU8byIkGl4B3kbSUoJd3fUzXGILnqO0pisq9GgP8gHda
         v2sxL2wrFgbprC1omjUpXo2TeWu3aVeh6/Mca/wpNMDjNdDNy+jQ+NRetIr6fkH3eyrq
         woENNpmIByFNtpuLo7o09pK1jk6ZvORQEwXgiCmW7GgQCdWbmsl36HuT1ThQdsD+pxTw
         htjw==
X-Forwarded-Encrypted: i=1; AL+hErGG9uvTud/rqHqLYF//yymzhRYrOrwW6yolEG0qknuOzaNjYv5UJSEjOogqq2heqb0l+EaCdf/aj3N+gRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JXJgXztqKqHbiskvW1rlMDMDbNhkhJ9kLpTwcLy/xI55vk1Tn
	YMrx2zbT3BUCEV8wArzmWmHxQUc/GFkFFoRg8EYp++YKMBOPFA5Wji999cvPRoK9tw3hWLH94Ur
	gpzd75iBOO+lM7p7TQNov9LF+BDlrfDgsaq6sI525A7nxSWMqg0nif6TszeNIKvmfIXM=
X-Gm-Gg: AYBFou0Vl9JZINJ3c5kRpNiLkg64jqsAY9AjBL8J0pp9H59JMwvAUJPRYWoTKwiR50D
	P9RG4DmDLNfEhSCuyKTYagzI94ueD0MqQuz+qFF9cTk6q0pJ7T20O+PKG0ByFSN8KN445cI5DbS
	fP/cCbIofjyyiw7g9bY2uR13DcgF3eRwTa59m34Vf4giBuyL9b/1wjLDZjMqjNNlOKbE9nXnq3H
	UTTg80SFV2K+fcmWU5hGUIAySyT54YzevcChtm++uTMB6C2v8B98iLC02e+QvAoBsNCX9pNWaI2
	6hMR+uSyhdqohzndnRzm/R/ImmK+dSGOb6yRhGbf6rTGAnYWuFUJ9mIeVggV1XstBeRAo3C0jP6
	VP3m0lqdXjQZ07Lu9vOkcRtONqcP8U1gdteGORLNxb/X36DlmAdA+0vrdkPwd6uFhyFjY1A==
X-Received: by 2002:a05:620a:2253:20b0:93e:571e:94f0 with SMTP id af79cd13be357-9478421a383mr520622685a.3.1794216123870;
        Mon, 09 Nov 2026 01:22:03 -0800 (PST)
X-Received: by 2002:a05:620a:2253:20b0:93e:571e:94f0 with SMTP id af79cd13be357-9478421a383mr520620885a.3.1794216123390;
        Mon, 09 Nov 2026 01:22:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ef33f1sm1191344a12.35.2026.11.09.01.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:22:02 -0800 (PST)
Message-ID: <3d4e74ca-5dcb-4370-a7e1-f4c1e2b3f9c8@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:22:01 +0100
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
Subject: Re: [PATCH] rpmsg: qcom_glink_rpm: convert to
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OVGWIr94uXsVQvQWJ3ShhIB39Y6isBl6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX9P2G02S+qb66
 8vOG3ZJoKMldudmr7Z149EUKYPvoCgysWBw95/K39X5fud0HSgPmKuvVAbtVHTCjGfhSnd9SyIm
 gBlj5xcd4ufppf4aX+v9aWh+9xkC6q4=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af190bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=2mfksfQnj69i5T-jYpIA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX1woVsvxlm5Vd
 pEMRstPDjCM5/ZDPBklA8hjUhytaUE7RomaYQJQILRrwv49wYUnMJgLAzdME1BWRiLmyGDXxa/S
 3nyWBGiOJ9Zp2nP/zsM/OPxuqrBTcnWQDCLSDkO8YiFdSO7lc9jvE198MpAdpsrbCYQFMdM1QYG
 r+HyxvoucblZ0428X53qYtfl1xcfhgsarHP/tJxBg5ANyVAxLl3KIEUM6yw+t7ZzK60+I6wuapd
 iHy4apn+ObqTNk444KeYeDzFMILZ3lrJXTUK/Y2H+JJoSHlBMdV/adRL83LdQuWuPm6+TjYrSNd
 o7MP1VxQuy4rUeFr64vpWcRMNWtV64mJMWRuAsAv+VfSzDnL5zpXDDl75633gOJ9xkyBnlSDYG1
 Rl+qlnSsjKrXxodLyEjsHzK/FWFdSOFZ6CFqT6gjLmkJj2/hk5qtb8UgLgFKifM4Ii+4+1ETtDq
 PLlu8sZ4CrYAtHQGiTg==
X-Proofpoint-GUID: OVGWIr94uXsVQvQWJ3ShhIB39Y6isBl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 1:31 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
