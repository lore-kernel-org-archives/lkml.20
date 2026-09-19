Received: from sonic303-20.consmr.mail.ne1.yahoo.com (sonic303-20.consmr.mail.ne1.yahoo.com [66.163.188.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F51925BC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797158; cv=none; b=XXxEJaBKbgpajInrrZW5ikdw6h+tGi8WqHd50F9xvGWK3LbshsqHqDhROTaJTffSJ8aiPSDRyLlijsmJz818ENayqmvudO5WX9LdDEo6SsziyY9e7XXwdgGWy1lyx9Uj1Vbcae2VSzFa+lBTWxNMnDUv35us74p0HJILtJNuF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797158; c=relaxed/simple;
	bh=MMjUtHCs4/yDpCGHhPdiiHBAMqlZNMH0PrNv5RE8WeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyJXqLxrxJZ7tvqW1P9tUkoKS8D18hozmDm0a2U7/0difS7NpbdpwdlTG19QtOr/vSeOz1HwM5FQk6pZjFJ+NXcRwMll3dRB+uxCgPky/BHl/FE8jG0DQzpEU8T/SeJq+N4vY+JBzKCx6rBgZDS9FsTX+8wd1Uld/ojaURopSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=fp/BVIS5; arc=none smtp.client-ip=66.163.188.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="fp/BVIS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789797156; bh=MMjUtHCs4/yDpCGHhPdiiHBAMqlZNMH0PrNv5RE8WeM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=fp/BVIS5ocjB7HQmvwI9+qv0+WdPUY4uPEEB3nxcU8xiWNUsmf+l7E6347GKCmfGhm6LqEq45TZBHr5WoYXIaO/xHDBDJFj83LlCAtZDHro7u9AFMDSWnIN2KG9xVWq77SHg/w0GZqCIkv7f2HkVwJVFN70or6F1gQeZi1oxbsEfvRlyQFQbvcMh36EgY8vhzwHrj0TYUO5WxFJTC571HizOIXMezXt61qxYEWBdQysJUNTz/Y97DRPoCSjq1w4uHm/2HkBmSbn5reKseSUJzc3Enn2yPP67EqYLXZPgnNCoPbMGe8L4KpF7kD3WwHDIPdMo/Q99MPtdMgfu1zuCxA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789797156; bh=Sd5fmppLouL9/5JSuVQEX/HxByw+tfkTVHrOMykzLf5=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=bE0roAiXMd/ni1ltaZZCSOFFLnCKalnQ2lhluCbWcmLa9Po1m6deOtmV3jUoET7x+zjNn7e+57YJQWy3mY9OG3Xcu1JQJBLzVqwiKHN+v8EUaw5AW0hib4vxjbOzHNuNzls5MMlWBCbUdaA5C1PaFUmZnD0nrlQfUqnb7uMTpTL2dmzFjabCXBT/cA46B5YjHCj8A74012chS2JPdD+JyKnD50ZngqrpWjB/vD0yr4pTedXmtjBPmW3/aqNaf3s8SKdd25TGgURIoLJxnWGyX2eUm0ax+tHXxmEf5RcIXezCIPS3sKE6UKpMslaCuhND5Q/BQo4iODT+312Ke9ZbQQ==
X-YMail-OSG: _OWMhakVM1mD4R8z4djYc7GWo3kFWQarpT_qVqscZRjEAFpyVp.frhqu5z9EfxQ
 GxZfdCHsBkhr_0Fpmn5RCXq696_ZGvhOhskItxR9Jl0ejtHsqbCRZLHNnnJcUF9qLsZPA32PzDeD
 J1Y2MerrEY30XyNLgCdoaUfCqRzKX0sZ.jQXligC4eXmn8WsiRIHT43TD9WzCqd4eKZKa9UzvKPn
 NkHzUU3DyBvRHj_AqLruCerxLKvPzbyB5PHh84w8InlHsKcPCLO_eHeGwmEby_uwAB60pA65TrnN
 peFP7B0iLDgCpkl0x2GB4cG8q_wrCsaH9mGxPj2bvoChkSsPH2DQ5j1IgzCNyToJZjp12jvUk3mE
 UTkh0y3e8ldvaOSY3yWrzjxamI_SgLhVN5hav1iQXK6CQ_1YYtmwvsRVKkGbDKGlIKXT.u7a1Arh
 oKO8jw16p0LfYqXei_jzH_9h4AkjNF_JzUDfiYc5aMxjaHeVty73nb.o.9oEsL9jAIqxI8HlA3A2
 uEAHH0mIcni4SZ.vzg48vB2szMbeIkMYS3oMY6guCkTOysGHMeyxSp1RDEfCSpMz7ZBpwMQgN83D
 r9u0GMxOShO0tVynLxMMG_shUHM.jGzTdrPpXAIiJ8_jRs2sfkNP0F5Cps.Mdk8JI2vstN9NQ8Yi
 uQW9wbObprNJVEQUQHF8QdFARm8tnuO.M2GcdIO3pHEf_YApm3cd.IvKY2fa3zZZKvE00UKA45Aa
 0rAG2V0kPgC7w4dT5GxgwngpGtNfhfebVg_lKeQA.UAeIfPJO.oEwFvnYlr34T71ECEHwjJ4a532
 uZf_LNHfSBjJiuYLki3UCAiBg18kmNWwaLCw.5IqlsyZUnb7selAdoTajKg1lo.jh1akGyjFPuqg
 tq0wmdoX.5dTHyW9PZ0MgHNC1fT_liz0JYU6IahKZ8rbOLytXrF7XMJCZoc4Y0gLu4rcw9LiRVQY
 jilRyacMlQdu_WOppMDVpWGptY2ID001k6vO6.JRmUBKB_MkvxOBsOXTPlbGD_8OwG_YmiOvaNyv
 tS4Jw6Jni7479XE5vMlcPMEJj0Dst_klslI93OYzerlUnkMiixy06FmNXLv1MDJns7w7ba_v9pwj
 876vUT5S26HGTbeuXTqTALVXh42nPHwcTe_ZKPwKwn3v8IkzaiFRdEbZgNTHl047gouBlPyZ9hLX
 2qpmdbFyvrWEW3J1nFccqa6245Cq88N7TW8LyfFeTnm4EFLbqDZA41EpgoOpY2o4XFhFFRZ19dUx
 bwi770GrjROL5.Wi8Ul8P6ZhXcvl1sOHA_dfucsnW6BFBfR5ohVtLg2_qN5ZpnMHEDxsjsux8svc
 vS3z4NOnLvVXdnD4XcCINUOqxSyGephfXM1c55RxdlbF62sJ6rfI4BMCW9KB9IX0k0YC8nN0fels
 9zq_P3sIeSrIvZifVs4U8RNvV0mDmIxgaTuGzjXAc4ky2ezQnG6J3GI8m6NJQY5wLKkn2FkEYBt_
 iB9cJtMoby.yTQASm2Yqp98QqM.7aZiMXwnUL7BZ622X7iIBwEVWoEYDYfxyZXCcBg5Kp2n2G05W
 wKDYmYbELZmssC68vVmqEf2uWtvgJxhLDP2RRsotq9XHfKsnbz1AmBGXaXKF05isK4xJMVFlVRcz
 etus.3l0jXwkmeC_EXY1zqbYbT1YkPXQjg8lNP90wYo8m40GRIY7xXsREwrWiZ9.3.yHzEFhPs4M
 67HxvYIU4HdQppwfX.OjXkZ4NbbMPwLQWY0ubKIt5hHghtVB7C3.85YDk3RtPemG_vOE7X_iavqk
 tzYRGPEKR4EJvnhYL4yzzNEQo5R23W2nqGgroC5a1JVxSLkJFlX8pwU3zt.1UpeU_hBd6maedRmA
 KStkvNmiLA3yVyjrynT58phi7qDcCF6DEnuv3z27l0JZqtv1DcVQYaHvsVkpEvhHGYb7QiYkyufr
 96_BNxL.RlQ3hnBYYk.VwQYEX5g4VoYtJOWyUkngFtSDER5v3XV.zAVx0n.WWC53_g_Eqfu_Rr7L
 nNHSHu2G03pzmivXTXsltbov3t6XUR3mwb9JWEALKg9.ivCbZw4y1MuJvOLrUqKvcxY1TJkCf.KU
 mB.Uy314B5Yzz9MFv3evYcZLUYT.fZV3c20u6TnbKslsaLfuhYPKStGYT5I0sXc5j8_D9jGyjgPt
 sgAgtWXUM.FUBsv.G7HrUHqJJQRlYSFDfkGaQnkSQu9V.6NfYwUbBgv0Cx9UDNMJHL1CimvO12rj
 YE5jXwZygeyjcpozHf6gCWVn6eIRwySmEiO8UzcZJZtqdVyLf2lA7UqMsruB0FIIQB.nAHMMmUlW
 MYuh6ckuOqcnMVZpiLv7H__akYWjGIz2YruOC
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: fce36edf-97d5-4a87-9139-ccd619c6cdab
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Sat, 19 Sep 2026 05:52:36 +0000
Received: by hermes--production-ir2-cddf86dcf-fr2gr (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e73ad44338b916ed2b4d933f7288d92d;
          Sat, 19 Sep 2026 05:21:18 +0000 (UTC)
Message-ID: <a1c85a02-dd0b-4528-b31e-ccbebd7b84ce@yahoo.com>
Date: Sat, 19 Sep 2026 07:21:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, Jie Luo <jie.luo@oss.qualcomm.com>,
 Georg Seema <georgseema@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26541 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 9/18/2026 11:27 AM, Gabor Juhos wrote:
> On IPQ5018, the APCS core clock feeds the CPUs. It can use
> different clocks as its parent, but during system boot it
> utilizes GPLL0.
>
> Under some cicumstances, the 'gpll0_main' clock is getting
> disabled during kernel start which results in a system hang
> then the hardware watchdog restarts the board after a while.
[...]
> Mark the clock as critical in order to avoid such hangs.
>
> Cc: stable@vger.kernel.org
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
