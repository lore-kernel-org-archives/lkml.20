Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217179;
	b=lol0E+1vHPGjV8Dk7kGOpqIm68j6D1pkFHElsc0Cvh13LNt9xBTICQWfHZD8B+LEtgFX
	 u5RPFLjw+oQMxfQzD3vVY5mow4drBx/TsORu6fN9AvV4hk+jOQHEuv/s609wFYp4duqjV
	 k0UGmg9jnrsrbb8gMYohXVcs9pKurKpHFRFH1zxE/3i/vnge+c7l/6RRS0USf2wO76h+j
	 kS7xtZsS0sHNHQJ5ngRkKIY0JNuJRgA+TTf0d5+2QCTl/woVMUk7zn7GAMLRLLNaFdQmk
	 OXsU1+dsUFnfdyISj8RHY3nWIDgVt1dbrIt1T1gFVaQY6vy1/aH9h1RfkYVL27yhLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
	b=tkW1WE/aObEqubGJ6Zu5uLrG8cpaM/3f0j9LHKTHTys6WHe0ch/1kWGRvHOErRqFbLHq
	 jLTn19T3Om5bIpRUniK4MEpN97ScbJThzsmvLTMji9BGupD2RZRfjt2sjfwIdWp1xnc9l
	 Tex5K6AU61J6qCT8l+f7WqSGqPXojpPKSFb3ZrOntgZ993JA++ocohfacddVM1Jt/UBdd
	 DSPnAp51kjm2TyFWW4wfQ2TW0XVpYRHWJoZ6vnhg2ohmlvNgwFtOe3gGu8Ow3Ft9JGClK
	 JF4AJJ4TagNLclPTVyJg7OrjNZVpv8HEXscmI5wBsCdzO1DHlcgPuLhLDmD7NY7VrSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=acN6b9m9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbUGFBXn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA92C606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA92C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=acN6b9m9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbUGFBXn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wgu3611034
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=; b=acN6b9m9Ya7+MPom
	5ezGwy6+9ze2aJrO5B8mZ1gvoToC6REdvTsXHNQXQxsCQAaZVQyd6YRQy16NkrE0
	mjRx4KysVzyNtt4BanXHR8lhg6fTzUGFkxfJtDnWmcYTjoMKCihjKA88sQjy942z
	ZA2onwyIym/K8pWDPT26nd2hFgdVgsBm3n1oTRuyo69zpdwPriyt5v5U9B2NG6qz
	ZzKafRFG1gBC9AgSmZABpR9WZ9sIeqJbNLi2M9ydJk4E2EEfmIT1/mxLy7CXS6EG
	61fm838ukAIgtDHePiWh8aWKjibPzat5upPx6VnRnFCEFjHVkaYeE2VzvHNxsTSA
	eVQqQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx4am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:39:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea9e91221so12909546d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217177; x=1794821977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
        b=SbUGFBXnYu4eL2rXFkAUf6rM0Ta8YMP5cAsdQAK/TxTlOsWWNlxGIPQzHGwrynr35G
         y6J+ly1neMyJXY7sH7fNztAHJyf4chJzf2avsnXO70B2lcJS7vh0rFjWAI9cw34WeGxg
         6PNkt5r4WTQ552qdHs+wIrv3IOmeMJVXgQcaU8PwFJ114vQ/3SOcPHoTanUW3PIkBUrm
         g2wAUcl4QtYD2R0AboE2V2lDIJtvo3X3za9BSvjgthmUEIqIemKrSqPviSxDDpt1CPOr
         AjuBUsUJaIoN6ZcI1cj1sFGDYOwz/A99QaTKIbrtqYI1qE1QHzIPff4xuIlH2EcARw8/
         kMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217177; x=1794821977;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
        b=OzjR0XmB9UkUmUdN1OHCSyx68wshEIcMZHXrwx9SawsYBkgu0coR9/8jh8WyRqJdJN
         5xtPBwjRsBNntt6ae3ACGRXAVmVbA4shjD5HuwMFgl5gM6Vg6e5h/4EhW1SOisxCHdPf
         XeDwYRI6XMugO/W6N/0e9QyOR3aLe5IpZKmOm1kulp3XGQr+TKo9QX77SGp1o80Z93qx
         6NsbWNS1DtE3Zq8g0N+j0cxeE9jIv4qbISpQrxu7XKwkry2C1fmYTYkFSK/jRTL8VtXA
         m6nNmeD+gHLcI9PRjslpyjDfdap3wMHezXeZV65po0FUrJ7PIKxo42TGYb9bseoOer1z
         SevQ==
X-Forwarded-Encrypted: i=1; AL+hErGcUPog8F0OvjzSyc9WnWaWOi5bv4I25sH5GR3iP1bdHHDYSSxe3xGBluq+GM6vwRwkFfCvJoPuGP2k5Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PEIstIH/IttFpKLySLHwZhEchHU0Z6p4OdvSlkWMvNWITMwf/
	VeDeKMZPDRVE+BZRit7u4UdywE8iNCkUo1iCsDzN/gapyoCnqCyivpgJFzuFZOj+aESgHPaRBjr
	2JCEc9sSd2GowhGgvckiVSy0iFfdGCRbiDUuE4HdAU9oCDg7UOcAQMwbLJ8ZDUn2wbjJGJS5+BO
	s=
X-Gm-Gg: AYBFou0I1Q88NaPA87Md5woyiSH467jgNLUgzpnfnJUjjRlYItYwm8sDUJ+zA+o4doj
	Uh3jACXFdPbedUvFsC6CxhxV7EF5YjpvS+yWdT6Pgk/dU3jlxVCM9yiXjCtGASHyipuqiaETple
	QV2BPHZ+wcE1Vx9ibQDCJFNsiWdLltJHT47TTLMLyxIUHqpeIh67WYY7NvQM3wcTmBReJQTpidr
	3TCotjkGouV3t/2u9nGjaGx+FAORm4fEbDqzJNE6FpfA9vbeyPVjTN+xIuozy0I4gc69OKrwfVV
	4yVOrLLZ6V8sHMQkGB3E90wuZt/X6soh3xTqHYeXiBmn0Li1PweVzb/NAQOXxwl2X9plq32/fk1
	IUdWi3dyONwN7Is2ynA3Bsxc1KrNTaQyHNkytcOwXj5P/17Z1fiu//z2nzK5Uu2M5Gm+jqamPJs
	ZtHCoNxL32UKb52S9Dn/janoKMUFu4MJTcnewrAAxKm87vARY4Nlq+tpaAD+JOig==
X-Received: by 2002:a05:620a:711a:b0:93e:623d:99ec with SMTP id af79cd13be357-947841e3a3bmr551109385a.13.1794217176951;
        Mon, 09 Nov 2026 01:39:36 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:93e:623d:99ec with SMTP id af79cd13be357-947841e3a3bmr551106785a.13.1794217176494;
        Mon, 09 Nov 2026 01:39:36 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb75913sm164965255e9.0.2026.11.09.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:39:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: fix a use-after-free bug in system shutdown path
Date: Mon,  9 Nov 2026 10:39:33 +0100
Message-ID: <179421717024.24538.4724609411487120777.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
References: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sX0Za1N_gO4Zo7YopD-eFyzDKrOnowVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfXwKXo1Ot+Wo8/
 7EhOWeEUU7NzegS1A37Xg09ytMbIl5T0PTzYdaq5sPpjFvEv7rcI6Tn7HmK9azoKbaWGOvrvduW
 RTcbwMvBQuefpyWpe8VO2OmTVvmgdBZRUX54hQPQPVvBqtrqM7zpW/12954NTfR4cnaNj5Jj+qy
 aVz9KdL97HTqW64dQNkZJNedgtI7zZI+D6dD8LLSYORHX2wva84y16LtPzAmwgOVFpPb7IXKAxW
 LChYKVFfrsVgEI3PeuAVSAQp4iHdWRorWVr03Iwl4abgWZGnYV8P1bLQ6ZyDCk4M9H5XfMG8E7k
 c4Ci0mrTPkOucaOOvKdnpPJatbcxquVGscZ4mwodA9UPvrBmejStbxgqqf0VvvmZyH/NS3dW/nx
 JHyhgi03/u4rC9rABi6ByYBjIqgIE8iUgAIkNak3VPJKhKm9B28m1SDPIiYNDCbi+MLGkHRimTW
 1A8MlGPTBfD9Vq4ROGw==
X-Proofpoint-ORIG-GUID: sX0Za1N_gO4Zo7YopD-eFyzDKrOnowVU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX+zFIKw/0IsFk
 lakrRuvO/IUFRNsVWmsN27z/+vn7PbqdhaGFObAbC+EytqcMg7gn90Ld14VrNVbH6vYmcNJ2E/0
 U2cQ6u9RPYnetnaHzvya6oMdXr8D7nU=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af194d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L5XZeMja_UA31ktuEWAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038


On Thu, 05 Nov 2026 17:09:40 +0100, Bartosz Golaszewski wrote:
> msm_pinctrl_probe() allocates the pctrl structure via devm_kzalloc() and
> unconditionally populates the global variables poweroff_pctrl and
> pm_power_off.
> 
> If msm_pinctrl_probe() subsequently fails, devres resources - including
> the memory allocated for pctrl - are automatically freed. However, the
> global pointers are never cleared, resulting in a use-after-free during
> kernel_power_off().
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: fix a use-after-free bug in system shutdown path
      https://git.kernel.org/brgl/c/6c940958950e5df52831fb8c78a045d426b09f1b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
