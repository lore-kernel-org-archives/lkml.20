Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4493EEAD8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288488; cv=none; b=rPnct0xoyNPUarpqyLfmV1Qa2IoAVgf7ArqCousuDMnjMG6Ts6fqT6+tDuEMMdwFYY8DmKQiMNBh4zchZb+bTBW47ANvMUQiPB2LpSPP6Zed+mXJkw8a4gA9LiJhPkr3pXP+FTvdisx8GpuD6Hp37YaViJeqa84zRYzFZZ4Bz6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288488; c=relaxed/simple;
	bh=KkLrqkkOMipykS26NhHzTN5Hr3AUSyE2UoPnk7qmFu4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILy5RE+tN+l99mfO+7nIwY6STZVVN0xUmmAPvrpyVxHomvFKyPayWeUlGH1JC2CIINXVMbPkGBYQBQhGRa6n5jRBATsdWsMEWnZLVpH+noW1IrpiQN1z6tEnvMndJA+bv4d3UNAX0aaTzCkqiDMEamvFMTP3nFg4tYmX7lkf7Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD1QmSIs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guSMjZVC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD1QmSIs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guSMjZVC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdkGM2866547
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7lhxw+XM+Z45cW0aWkRW+XyOgTDsLCB5jNlQmxpIZg=; b=TD1QmSIsY7flrZU+
	7SOZfi9DGtLHZLT1J/4vljwLS3y4Vc5MqJt9Bolvn2w9gHE1e0TpyIF8VlEsUSe/
	yRhU2I0n6IbDCnS7WGGtVIgtPF1oYXyoZ1IGFUTBw1kooNgCiEYQeGPDMMN/fRlK
	aOXmWUQTkg1D0hwp+mbcHi11Sw9mIDXJxuTFFjXWANqW3udlW0BoaIe0tKO6f68t
	IweHYAkTZKoNHSI/iz6P1aEZqsYa6483W3jks7U89wmAgYCg2ngqAnJcpf4bMCjd
	TsvRrWKvXvHUWoa5/nCYjkFZQX+tAZUQdIXRj0DQTZJTJBL3LkirzsPWxjfA9LJN
	H3G9VA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8svh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:21:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438fef603cso1063219c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790288484; x=1790893284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B7lhxw+XM+Z45cW0aWkRW+XyOgTDsLCB5jNlQmxpIZg=;
        b=guSMjZVC11ZVCHV/+ypPIkeKWrejq4G3BtKcdWXF2SDqTMixMQjbY+rXIqOWogMyuw
         J8i/buqv8b81l4rt/gmoLuAPsWvJCb3P7+W9UzUCMRztYDxQaoTECnH2dKFMDhrPA8N2
         Tkuk8G6cr7AMQ69qxXfP+/BofgFf9HuMdPdbJp1UKZS2S24hNWQUOvOi8hrbQTmnYddc
         4bDWlvztGPmCVeg/3/Kui9B1trMSorowha2rvlCzupB550sr63QpNX69QfjVJpzNXyir
         +8eMDmv9yDHksw8q07mbxJBDX8PEAV6fW0QNyIgXHqqThIebTVuyWNGQ4pFcfhEjonFr
         YC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288484; x=1790893284;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7lhxw+XM+Z45cW0aWkRW+XyOgTDsLCB5jNlQmxpIZg=;
        b=S+cR+kCuCHqchRshv6MFriuxWxcakR2oolQ6qiDEc48DF1c/HT4fRsMeBYKT+2PC5P
         FoeiQsxcDSiSQkhffLMUhY2b9BH6sO6QUzRpBm2JxWuBJx1EiMFrwmE4uUoC52l8n7jg
         /SMruygVFpVc0w4YSi5ByaA3tPtEyQPxIl3x3ZRo5zceulRgze48SMN8716rY878S8hK
         I6bX7m+Qz82kZOVys+PhfdGWKmuzFghts9fr7K9U2Ngk2uMJfcgeatLCKfEXRp2/2CvK
         B9neJVKy65nxa8wnA1gQIkL8AgaSukikIX3LeC2AWoPmTZRMN1YWamJC2wB6wDogvVd6
         6LFw==
X-Forwarded-Encrypted: i=1; AKwUvBx1qS2gzwMOky2odNqO3BOfBrma0EQSqKeQ1Gaj2W1h10FHUcXJqRxIbrcIHH2E+Rz6a3wk5FxxcWPiZlI=@vger.kernel.org
X-Gm-Message-State: AFuF++layXsHeUaDw9tpETKcpaH+c9SmYkcY4O9WHxS2bwRAz7GMSpm0
	tYMzxYPyW6hpy/TCvXxPXpTU2RuOXpzB3T0JbyGJIU9dhZXT4hz6IhFHAtW6MlqnB6V7uqULzCU
	agMOoZ5ikmsQ3vEy3IMZVCFh0f7mH2rxzaue8xrVyPXvrz9OYJG/LsHk8E6cMUO6rMKA=
X-Gm-Gg: AYBFou0YUa8RjchaW6qGuk/QDEN8iqBopCAfIZOUIKVja6JenRNABNelhVppaljQWGd
	vPJbTv0UxGNfQFcpfprzEyZjz6t1246MpyGdydRbsPpVLywvFb/MOQGOrB+B2r/a2bpJHOuwDm8
	//P/mp4SML5PJVUFSDLrkDOD+Y1iymYhbRLeyVdgTICTeFEylh9PDAOctGe2KpC0LsIyCK+ruBn
	Sn7RS99Z97KcEXwyCu8ItamlthucptkELSPTpd3WkpcwMy2EjxX5CqVsgkmky6IN4+YS+ze1chg
	BQ9yeoVz45TqKdco1w8BgnYz/4YwNPvS01u6IrEIc8r2vyNPlzJUIeHoYjZe3c4OlGwu2VZ/GJv
	pxJDpW8y3pbohW0KQNN4Nw+5Bw52LTuLX+pCv8JDdjcLR84CvXRgIgA==
X-Received: by 2002:a05:701b:4214:10b0:144:eb46:c40 with SMTP id a92af1059eb24-14503fa7654mr3140935c88.9.1790288483834;
        Thu, 24 Sep 2026 15:21:23 -0700 (PDT)
X-Received: by 2002:a05:701b:4214:10b0:144:eb46:c40 with SMTP id a92af1059eb24-14503fa7654mr3140902c88.9.1790288482396;
        Thu, 24 Sep 2026 15:21:22 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm1402048c88.12.2026.09.24.15.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:21:22 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:18 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>,
        Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 09/13] arm_mpam: propagate MSC access errors in
 mpam_reset_class_locked()
Message-ID: <20260924152118.00001671@oss.qualcomm.com>
In-Reply-To: <20260924152739.2865510-10-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
	<20260924152739.2865510-10-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfXwhyTwxkcYfwc
 aLeaYA0+Jl2Sod7qgG7v+ty7fFIriDFPiFqlg52BPQlUCdlrgZzcq7oBWc7fXAJork2PspvI2CB
 yc5UcdIEnJMtF+Ne9k1oJzwgAubkZ7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5MSBTYWx0ZWRfX5ISBH6TwwxSu
 NBatQhktmOUk9kzqRln2NMLF8ExwsXJlwkXmyXqnSMCYU4+Bnx5jjBDvRWRtISW/AJKgLFHaNqU
 PdsKKwilMdmRSsjHcvpUzF9tfSA5ECoIGWXfuojqPWS5lDtaw/Wog7QUPq5gVCQFByHuNZ4KykW
 npQfaIdFsZ/U1fpaWZDTP2guhinG87h306FAghrkmOD0ieaCO8eFibkryZWbKCHTG2gvw4twu8j
 J0bFsqO4WmRVGSrW/hg7qA+FmfSd1vLUWUOjvTZK6WPZuT+z1UTN7fkIwe1FBGgpvpD59ZjTAZe
 4IUn0O5iS6EzAr+Wqndzinj7wlhXvsdRLvRlAJoNASLrgWEKlPMjeoddq8tk17kXeqRUvUNldAE
 h4vL4ihS60OasY0orOU9oiSztEx04Xcew+T18g07EJtG4Fb3Z9WU8du7rguAmZMa9IFz2zHWDKC
 4H8uJdiNvNRvvCfCauw==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab5a265 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ESexO8LFGIdw5cpBbeIA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: TVNOAD7DBptxUKs0XcnORSS-smj3Z4_U
X-Proofpoint-ORIG-GUID: TVNOAD7DBptxUKs0XcnORSS-smj3Z4_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240091

On Thu, 24 Sep 2026 17:27:35 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The mpam_reset_ris() function can return an error, propagate this up
> through mpam_reset_component_locked() to mpam_reset_class_locked(),
> which is exported. The external caller is a void function, so cannot
> really handle the error at the moment, but at least we report everything
> on the MPAM interface side.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

