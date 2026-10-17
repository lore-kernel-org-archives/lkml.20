Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA73AEF36
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255931; cv=none; b=FJCfAjpZdNc2uV8G56Ah9r4jwnTnWNG4XEd/+nfj7mCLcextWoyXtFHVEp7f6v3k7nu16nbVwDgPF8zzpQYbuhyhwpPlgFcH6f3qOEUgE4ZOPpbLkLexcu/37CV0tHKj+phAreAJ/I39wxAfgkA47jmy4too4XVmV/3u++R7ke4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255931; c=relaxed/simple;
	bh=hsHiEZ0MfrTq0vKlHAdbOE/dq47CUmz0Fx7H3gCkV18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyCUbIGt+8wJGdoBKvUaDQDjobc1u3fBtUehdE/4gXX8q/R40HN2DRf3aEBV13y3FrjwEVCJ/bHhUzJ3zWS19TL7QlJ2ENhv2oQIgtJ6i0zEJhSzeY26sTUDnuXEFqfq476gtjHT+avCoyB7pkwitf9W9R6Bae2+MdfblSvyw9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddkdEhfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSmj++9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddkdEhfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSmj++9k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9nLt634837
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwGr/VFcVBThPZuxD7wslr2Y
	PtoE5+81Oolo9GzuWu8=; b=ddkdEhfxlYdg0WsHZwg9YM05OnoCCx+IZFh7CpvA
	fZM4QzivJbpNpTR3Qtvrat7NqSk6ZsAwVBAwG3CoBTtAjfQGMNpWcuQ268iZAdGt
	b60a9SGpXkDLJ6ph+xnqDDr9mh0at3I1KPAALHtr+svlkjG7/Nu0r9dSvr1TPFdT
	ASyOqglJ2l2IcfKTLLF/bBQqY7QXhXz2vgiuIIoH98GsX7hItE+yHIikqJ9+b0XE
	900wrUHa54nqfofviVcxz0LDmr5v/J2R/i8OjdfSzkD3oOKAXZspDdj/WuXU8KkI
	nVOP8wkXAUnOP9wrXm5HU6qi64684cL5vBonmhbOSiPozg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9h77t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:52:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so1364012eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255928; x=1792860728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=HSmj++9kXkHfIv5KOKaASIUquAtpvgidhhPr9DTjQcvCTzXJpbNbavssPqf2Pq8414
         XXArKgOfzeecCuetCPBXWwAh3aSF9GACoTi+ybmNnYDDla2PIn18iOE5YcAnVa+Ecqri
         6nLVGxhzRM1WSsVUJMhpSiO9OVBglia7hk2SqNEPfanJ60x8tiZ1IqiXPKoLeFkPMIFh
         gNi2RJUA+8/AwYRDuOgdbJW5KsteqCyIzmB2qI3VeF5jp2i73Q/bsOCT9aOifh5UYpTd
         v4uyXCLt8Vg43tHMsTuKvbAlHBc4jbv2ryxSibZKHtFSAXNvx0EtbhMut+qvIj1a2U2r
         omRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255928; x=1792860728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=QiTi1sq2C9qf5sTUrEJPimnhpAVEyzLgp5inTewLPyj9n/p9vuetdIB2AoIWIAQjav
         O4z0l5j6Fx26sOXm/nBEF3n6RuO8q9A8fUv7TFk/9bykN6QN5Y9nkSfCaFmlftvQsI8I
         /MmJ1iSgL6WKGYgEeP+EI48MC66JdbrN3h6BLzJOFlq/NWDzFPuv6vJ9phWPgqgNWEXX
         vbFfzVc5IPEGEOjSgxYrNf3JeF8pt9Dt3HkgmH9/vPTYSm1Jnzx20rJdCWA6w6oJtEon
         nW2RSytx+RSkbb/r3M3p05ySElLNqYmqxLwDTvvL6Un0PrnEXvMKYy0OUMTz5xVDlYES
         f6cA==
X-Forwarded-Encrypted: i=1; AKwUvByQKk4p1qJfKAE4v/1+iSLMwgUzCL208Q89inv5gHDbV8jwkMIxlQe0i4IcqRU8ifN8woh3KivXjcgA+MU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8GeuIZ/FwT99kq5lrJ1L+LrGhljwOlA77vBsY0iKJNjYz35IW
	WEW8X9GpPpo6AwpxZrvFkvcR3IY9w45k5EYXOnJE3AiQ1fOXUYRbiErY71oDUMA55OmMaMulF+h
	3417539lwoA1OmZbpU7AuWX2YaJAZTQcFsHkOrLoDvMh4vipXNkPiQV5TRM2xP38kEMg=
X-Gm-Gg: AYBFou2CVg95nobyklkYxP68xW+PonyOCNfgaNNjhT7odA48ubrVY+5k+1R93p76Qqs
	OtL4OUjv2ls9PCct5BMbLX5vRfarT1PHCvBWy8SA5OYmqIG7+LJx4B5LX2BIpbQ0RO53kW6gsMv
	RtmAprUhAFw7/ayt3RAWXYtHaQOeBJebQWrwK7xcLOTLEO9/FMXlw/xxzclLaWTtfMohZd8Yxtl
	iLUw92Z4FmbBLRE2gbb+DeMLxO4fomf/37scvUlikc6Ny9E1FRfCxdWUfbcAtbL23UgnEYMYZly
	4RICTyhtPXg7Ja1m+pnUcj8w7tPUJBxehjN3Bbz+FHf14MotZNFSAHTISadkGkrFtNixUppGXWO
	5eKbUkT6qLFjC
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246738eec.33.1792255927858;
        Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246646eec.33.1792255926579;
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm16487376eec.9.2026.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:21:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Message-ID: <atOnpkct5QYK9VW1@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX08VOaNDAB7ZA
 VA3dgmreW1L+UfOBkCh/UFJ8bmMPU39J8d/SqfRZU9OC9VvL+SVej2DgDMsOsRiKmjB78eTYQVU
 Fw5x8TiQr9UzaMLh9q+AYMqUuvW07l0=
X-Proofpoint-GUID: clS81BibJKoTIztRjd-pkYJd-HJDK-yR
X-Proofpoint-ORIG-GUID: clS81BibJKoTIztRjd-pkYJd-HJDK-yR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX9giKlnGpG6KH
 eBxS/Jm1cZAwS41C0/KVnnRoTfKHmAN3NVBDk7plsLFVciZFK39NKzi5lRzeG8iRu/jMqrijNzs
 sjlchvcc0ooAnHSDTW6M3Dc/GqL0Hj4NNv3970k6g1QybotFQEyHDk85TeLTaSqVpxa0Fs/xaQi
 4dhkOEfaUpuVm/WSuPXaPEYtaMCXAK+Maqh+GFHp0+ZWqDaECbke2kEha2kzuc1atFE0dEcESdi
 cXuObaH8WfK4dP6SfpvIV7Tn2Q+IVS6fo+473f621i53zZr5+1IdEoels1pWxAjBzyCsjCQEEGl
 F04f6Vq2C6J3YG78sKAHqrBkQLByOLC95Ss+uzYKr8Z3Ax7UOHqocgS3BAeNZGeFf5IhwYD0iCa
 5NBKcQfys7a7yhXAI9+qvAhFuRqEU2lBdxPXPrWgrq+i8J7roXQrGs/l0uGGufLnDYOeeLgxB36
 jXTaPIx01sf+VGYWn/A==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad3a7b8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rqvSfYwyKISaz1XZPbMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170067

On Wed, Oct 14, 2026 at 02:36:45PM +0200, Bartosz Golaszewski wrote:
> Ahead of adding support for firmware-controlled EMAC variants, extend
> the ethqos_emac_driver_data structure with a setup() callback, implement
> it for the existing models and move all operations not required in SCMI
> mode into it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

