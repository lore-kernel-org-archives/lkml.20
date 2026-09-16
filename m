Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B790358368
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549814; cv=none; b=m1lHQVKBI35RDSOnlSgyfUu/5sJZZE/MOfCK2zVwu6bRZpZnf/XyvtmVT1rok5bfZXsATST45Dk+tXiVOrgIexcW6W5CsZeas8MSydZy/AtJ0utLPAHAXXmMigsNjM5DKLVdz1jXuuPaxOnBnzMyUGQZZPjYOf4fim4hfsXUSgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549814; c=relaxed/simple;
	bh=X5pF3A7h9wkn5uahSdbhngWdpSiTYJvZ0s+iTq5H2Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3DBH60z7cfFL/+CtTDRuQJw6t5pyft8gN0BoD39cRTjBjEpB9ke1iLSQnEb0wYk/z+1TUznikdYzo3Xgin9H1IBVyH+Ti/UDfU5kW+RCjiq2NuTNk2zdA5b+OJIfDExbqH+qpYCYEPE0pWl7m2/xRPLMU4ogx7bAncTc82rfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f10QwLbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD0GW8xT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f10QwLbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD0GW8xT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gmm2348128
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NmUklAtL1cxikroewbZT51l
	w6No/wycIXEfydBGSgE=; b=f10QwLbF6UnpDxNXkivB2+dPWQB/yGSJ/BpBsQb2
	hXEbWSuCbmn6g5x++ILtUj60VR/hPD9AaCTCgEnbTFuvNcfikaFCtTrhTOoAzTs2
	FYoIyW/c8mb7l2P+PS8tJfu3vrHZcVe37p8m+6udDzPVpMcya8tnakA/i0msMUG+
	lvmr3RCoP6cbl7Fc0kecAfnr6g1VWcJKSRr++OUi6E8pW4m4vX8oMSzKudX3Wu2S
	f7R44FWlBGdlr//8kl7ZC3PbNjt42203ThqDvSFKXIBkO3qKxeZTMJYrOFVdM6Ci
	hXFfRZkFo5P7ME6uebfnNZ43uRL8QKnVkwMjsRPU+P/4wg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywaebd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:05 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9fc6dc091so5600700a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549804; x=1790154604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NmUklAtL1cxikroewbZT51lw6No/wycIXEfydBGSgE=;
        b=YD0GW8xTvoJM1JE1q9FdfCX6XYsIy9ViBikQiAIm5LUHzgE12gvyEVmQTaK9BV00rK
         wG0HZ+4dtqX7WRZnyL5xvf/kgEECQK3kEE7cKkCjCaNTX9rmIaHupYooQiIixOn3mW5N
         WHROn0lFzY/DJOPr+cR1EVxJ6uwmoG9FfZfCPAVmz9nI0MXBS6fEnXlt+YsiCvRcdk6X
         TYCikKPuopeaH4xoi3UwF6Tyv4MILRexXyupeM8lcoWvxUEzIOZ3Wqcb9+AfU6TUgTQH
         X0z5qUmvyf5G/3YAxbhygUrVaG8nnEFRn58f0RcXa/fJ0W1XQZBRQ3ioThwPydtKx17J
         U51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549804; x=1790154604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NmUklAtL1cxikroewbZT51lw6No/wycIXEfydBGSgE=;
        b=h/QtxsgEZQ3RhusYMfAKb3cy7URPkjMNMEyPNf/+x3STuCV8ZZqNktYSFq12t0N1rT
         aCDzdJjd+wDZ8CLkhMojLXLYdDwRo2JZklRjQqjauryyI5aFBdmeHKMv8m6CVcDas5Q9
         mz+FapTnSWEVwpTYWCNIgCqjC0qSRXyCbjDa8Tr87UnY67BsaGxgv/Y4o3Hn/L1mJ8j0
         vAA6beDq0F2MwjB5wiP03Hu3+3BZXJvZQO2rE5WiAyTgMGwyz7UpPh3ZMBjLGevtLxNR
         WYbWayRWQvJ7Pgux5ccc1Drlw35I2JOwJdgtrNIynee5d8sG2OgwAZMRTF01AD59dw0e
         QcVw==
X-Forwarded-Encrypted: i=1; AKwUvByraQGz+mDHQ6zwLYSXNOHMH1QxxZAnhuxu66WAcrk9Dnw4bq6yfFKuH/WTpg+ryYgrlvsfwvFlKUeywdY=@vger.kernel.org
X-Gm-Message-State: AFuF++m/hIiW5zGOZAYsq4OgFAOLR0DXABUtpj7/jUFm7bXRNP17YrjE
	l5INa2XL/BsyA8Nb/OeqD1XB2rBSFiRpE2EpEkSGqk2GUdySoKiz0XMwpqrjQMUgf80PiQ4bHG6
	VuP5Exo0JGloHS0ji+U2ScvxDh+mVTpSko6XEW+51cNsb8Z7hDxQGwhpNXzLElSrkI18=
X-Gm-Gg: AYBFou2dICUYcE/9LmEjTId0jNUlneGvEPeRW93JxYLQCXgraSwkE734oEl84AVVs/2
	dVacoZiyRpfMeEOZkHWvI7mmUDq/vj1aOLomVYOuLmLVfNNHj0gd8uDYD6+tAhOm5OlZCjcgdIw
	1Q2hBx+desznjjAq+MjAE//vk6iWykm4n3xq0BCj81qAwCrq9nHJ5MPNbqFxxW7TZwjQoKv4PY9
	ZfRCX834koycGhlvbE2DOAzdTvlkW+CR9AlzifuX6IpOwnp92s2osfvHFl4H5Bpqqb5MhUipAlD
	pdKwswf4EUn0oKhd9NA8bIw2OwsXHm5Tc2fphnBMmd4YnKnU2mL9Gf3dOS+j5UkhczBXDO2OT8k
	bM1KNeCRzEYNK7456apmQM93qAuz3HC0N7uIysFAOkvQ=
X-Received: by 2002:a05:6820:180c:b0:6bd:e592:2c74 with SMTP id 006d021491bc7-6c7d45ed069mr1787686eaf.55.1789549804409;
        Wed, 16 Sep 2026 02:10:04 -0700 (PDT)
X-Received: by 2002:a05:6820:180c:b0:6bd:e592:2c74 with SMTP id 006d021491bc7-6c7d45ed069mr1787671eaf.55.1789549803916;
        Wed, 16 Sep 2026 02:10:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad9ed5sm6791317eec.22.2026.09.16.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:10:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:09:57 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
Message-ID: <aqpc5XuF8U-m9zWm@QCOM-aGQu4IUr3Y>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
 <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
X-Proofpoint-GUID: 1MpkDyi6WN8bI0Av3X8LHN4mBC_Y9rJM
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa5ced cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K4Jvm2uu9IkAFHIyoRwA:9 a=CjuIK1q_8ugA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX/kcFR1xfaZLz
 FO7mecMQuwOJnlPyCKU/Wz5H/IEhl7eeDH440G7g6lHYGvdOs416ERHtaXfrUqstGgxNcTUZTPm
 hIt9HRnSBZLYVjhp+fZpcuKcZ4TiTt3MAaudlXxgBmN0SNIHZtY2kQzfwUevtuIWkA4JbilFlOf
 7eR+/92fCoKbtKqpOuNcTsyFR91roAM8WPLn4UZdWzR6KnakADmKNwi4mkMknQaxJkhg52OiBJR
 fDOBiQlDdvWWcZsjdnyPXZIY//JLFjjNisOdFv0QLvBKTVdfEQisAHqhysVKFYghG0qUevStmT/
 BVRf3JAc15G2vxDq/SRN9JM18im9pX3chuafsthZkPAjKnXSYoIR6B5xtxTUVmd4GIi70UFKZhX
 mF9BlsmX44HH51rpfzSvx2hsL19ItXBUKmrTGHYrnbYnmYFmWloetyOJI/1gaGrbZX83XF2xlR7
 7NAlySyaId4IyMMr+Gg==
X-Proofpoint-ORIG-GUID: 1MpkDyi6WN8bI0Av3X8LHN4mBC_Y9rJM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXxJNgJNlZvMsd
 MLmTy9NqyELjBKb6MX1Q8AmHeaqMcbJ88MNRYQFm0NinXnHL1BUzgNDIqSn56bYaA0Od2yb7iXA
 dcxu8gFnI3mdQFHdaXnfaQCk4wFbYSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160118

On Mon, Sep 14, 2026 at 11:01:36AM +0200, Konrad Dybcio wrote:
> On 9/14/26 4:40 AM, Shawn Guo wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Enable audio on the nord RRD board. Add a soundcard node using the
> > qcom,nord-ride-sndcard compatible with two DAI links:
> > 
> >   - PCM1681 playback over Tertiary MI2S RX
> >   - ADAU1979 capture over Tertiary MI2S TX
> > 
> > Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
> > pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
> > other nord board variants.
> > 
> > Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> > clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> > expander on the same bus, so add that too and hog its dac_enable and
> > click-pop-mute-n outputs, both of which have to be asserted before the
> > DAC produces sound.
> 
> Sounds like something a driver should ensure?

You are absolutely right! We will try to control them from pcm1681 and
simple-audio-amplifier driver.

Shawn
