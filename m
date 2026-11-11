Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356243;
	b=uGZMzBua1jMN2JqfeV/dUqr3yVkpXx6V78Jjcg+eJ8KK/HjdIdHN9xsxAqtIAIFFgX8p
	 C9k+citBfLXcldj9KTboPwO/lyL0FPr0RrJWEjynb9T3gB/3jEy44d2+iKqkimVU1/0iY
	 XebyMyfgmWNe4DB51OEfv8s4pLoUJuNelYHoyao/azN6tAi9/rTpivhomS4yppo75ww5z
	 C6Rfiug2BG0WyYdlovo/Dyr6Zf3+QAL6BQy+DdWv4VkR4MeQyP1p3h37YPpQ/mCHT8jn7
	 zEEMrOkNaGX6WPa+PXqWNH3LP7JN0F5wcq4J+CMSJP4zw0Muh+PWOEx6i1f1Bhwq1ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
	b=GWX/ynrxeycBxs6YoSeVtDllgVCeKqEnMTgFuubi6gpBPBVzqjy4p9psfFDImDcyTdKO
	 p/7s2qkBvokmjN2qGEmJb1W1Rqaa3xRentY4SKmBlTceRaet/Xfini6izGmvcyXZ9RLs3
	 zScNiFUGYX1NaJuryVlIAoguu2yxUA7fKAau7TGaVKZ4Gbi2x+FZl/9Eh4Wr4VcghKrL5
	 0+kWdbaRUtX6JUBKQ4DcxF8MT2qq6QH8mTP1lDNO9TUseaEpi3ju0M8KrAvRB2bZSCDRl
	 2KGZIGManmkjTOc0rHQSBbapClAQfxFcVd5aPdFmY1SMdGYBxRFUYg7Rfz+wKt9nocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1jWdHr6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IfKcJwZ2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0914C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0914C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1jWdHr6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IfKcJwZ2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMLR8i153907
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=; b=P1jWdHr6o70PdxdE
	ca3zbWHpNS/Q01CDJVg19jkHrl++unZ1XbyzY7IsBwRaRE98NN5l57+rfglCjeUs
	EUzFmvU2dHipnb51F/07MnWsrAT3JLLqaS70e8R8bqSzycczc6dy6CqnrEuVAqKu
	nq1TCW6iE1eq39FbMLvDxji8cx0sV2H9n5TQFTz3+z3CtTKIidu2Xia/1LsqCJM7
	bugsPotgrISQsh1mLnoqZhzMQfmCRbwrprnHgHYj1gFH5lV4pvfT9BHZ1yvwCE4a
	r2Ya+sB5losn1NopcXYulLCciEAn065bS/RRGx7WTUiJF4I/T8Cz69InGfJ4ZM+8
	6daWUw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84bxhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:17:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so3743131eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794356240; x=1794961040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=IfKcJwZ23KCmVgfWqjInA/YlX9jyme5yUyzl51RliJC9RALv2izz6/I8YPlGOrDSdN
         CYSG8BKDuaX/HCLYwyLioiAroFk37HD9sGPYtU3gVaZVMhAX0kGxQeDfVraS/lHpR66c
         qGpbh2UDA9eOJies0Uvn8oDHhWTNpq0cRo7sDWqPcvA32wFtY+KVVMQG2+ZALdR+OBDx
         CQB1QDfkBUklbYXddFVeNrC4OECHgb1ln9cfNGug9KmIo+r82bip7arXeT5ASi1J4I6N
         6zyPTstWdvw5/mMJnastI1bPcgSbbT6+vzH3zzB6qlggHwg+ho5NkcSUZhn3Wl85xxFP
         yIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356240; x=1794961040;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=tR5sjg/dvbtmRDC1DnbTdk51YNfyLZrJiU9IxG6+kpsmS2SOlxImhqGkzwQJG3sRJM
         r1zTYR8uwVue4icf6LjKIHsjTT1y+k5YpHKHKCNa23yKYC0icAV2/ufKBbWtgJENOu3M
         m6OmNF+z/oRZ+0fcw50S/GHjL17L6Yl4uxc8zcxV4zLCJ/BZOvVmA4rI0sT2whxWxZF/
         E+vIZhgKAaxtFHLKx/oWp6Yu+vOTwyOtirnuBBA9+PZgrZTTG5dTxwJgA8C6u5MIp9JT
         Ym6lCX9ChciYnf6dPQ2MVcIHAuRkkr/e8BP2yuT34METdrrFSBgUKlmMDKsnEfMDcxw8
         OZfw==
X-Gm-Message-State: APuU4Z8dxDagrrDjTaEW0435cVQKQuMr9sAi6rVBLYhfgopXlRLClaft
	KHf61gZz3OoZQsSxUbEUtD4TuMa0NB98FlYaPdBwVFn7+l73saUJyPoPofA6t1PMEzvrOT8enjJ
	fOGEsOUP19GQTm9bVZygYr7xzjCOanrmMM4L848Y5N5RX2O9xZQjJtSEREPlFMhHmWWY=
X-Gm-Gg: AYBFou1Zj6ahyfzAbBTQM7lBFBtyvWaYaz2JQHnAkEIqTy3X7oUxMyNAEQzQQi0PsdY
	KSiDf+Byum4mZjPpAz1+m92NSIaiWMFgLBoBDfTjrnd1RFl+ooptGypIx7OK9xwg2l1sp7ewfsg
	JF/xk7jQufOHBR0JwjNPyaIQEmaUFUxJUTVeR46Vp6cMhUaqn5Mg502lg3EKIUTp/LMwwbdV4dH
	AZhNszUaV/F+ngypElhcV5YY24AbC0+U2drda1jsS+1RyllvA5Pfg+rEkA2qi9FwaWJDfSgal1X
	8kgKweBYF1DpbS2wGhX50rJp0+LMJKhdtH/3Whwlhx6phimhTSDMi1QYjy3hTibBIHCRP9VlrT8
	bzWesPm0jvgJGxoxoSUm3C7Klx9QuBxNRJK3G1ucGHVFmZj5SnF4JX4QXreEyL7Q0wUqmILJs48
	qOJ1KKFSI7H2Qo6O+/+eK9UD7VZxvE
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339971eec.20.1794356240135;
        Tue, 10 Nov 2026 16:17:20 -0800 (PST)
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339925eec.20.1794356239547;
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm19260603eec.29.2026.11.10.16.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Date: Tue, 10 Nov 2026 16:16:56 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 35/35] [RFC] tools/testing/scmi: Add SCMI Telemetry
 testing tool
Message-ID: <20261110161656.00002a1c@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-36-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-36-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX4wr+CiwHMLL8
 sEuDJTo6vPdxvjXA817TeY0ej2QshwZhRVZ+RCmlVOiioj9I7l0bBT9OwoJBWZPVH87y5HoBkyJ
 nJEthmQOlEcq2uDfBLGlvq/B/2sNn7ikf+zvmSFhInRQbhIpc028AmYWot2mVzYuVgXSm68r01R
 QLYNtDQG80Dza24bEbVT9SkIQAgHMRgrdh37rP+HXJVoaa48DvjkY9qejgXXw/SvSkMwqlpeZ4W
 z/e4Zd2FYc2adhqJGCtVS6kr5KVJ+CKNhLTNxPRYjwnvYjcBkizvDXEaiyjLHuxqovtC6+UBBhu
 F0acOYOuMEcAmkO4nYAVjtwAfos0VVHMnWlueJvb4gO7CRt7p9tUqG+TGyeeauek2ReRmjTveTY
 Qdk/FF0FwS8cEhwzsLfxlASUdUY/ThbMMPtuItxjI39JlBbiv0xvmnPcElB242qNYTMuILJYb5j
 KUSpTlT6lHsIH50OoCw==
X-Proofpoint-GUID: y8qCurHJT8OL-LNtrYbHIjdpogknkr_C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX5WkQNI4fUOeL
 4noy3M1FWVZ2KXtJXTYxDe2/ScldZ+R5pmjYzt81C8KMvQZwCYnkEMsOebn2jzkGXLdonh2JRF2
 2SF4IXrqY+orYuBCAWnAYnyR7IS8r6c=
X-Proofpoint-ORIG-GUID: y8qCurHJT8OL-LNtrYbHIjdpogknkr_C
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af3b411 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=Rq-k35hIRNRoFwHvQQQA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000

On Mon,  9 Nov 2026 09:12:21 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a testing tool that exercises the SCMI ioctls UAPI interface: as of
> now the tool simply queries the initial state of the SCMI Telemetry
> subsystem, tries to enable all the existent Data Events and dumps all
> the Telemetry data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Test tools need breaking up into bite sized patches too!
Perhaps a little easier to read than kernel code, but you aren't
generally going to get great review on a 2000 line ish single
patch.  I'd be tempted to do this a bit like we do PMUs vs perf.
Separate series, often posted before the driver merges but not
really considered for merge until afterwards.

Anyhow, enough telemetry for me for now so not going to review
this yet.

Jonathan


