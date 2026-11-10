Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275645;
	b=cidCh4sIt2YFYv0PtsBZ3DIfA8ammkMB8ifRdZYinQB9jTcU9fY+Xt7j69SGOiW3ZIP0
	 51IhAUtMa6NF5slcvCisy2qrKfoRf6JfsTXx1wY639wuUw9RpbIc8SzzqwDBvX7da16lD
	 2o4rF3daNniBXLEfikJXWtmB9bQ8Si+sfPZWcVfptXTSOj1GWz6dmYIg79+GpcLPpnCXq
	 HLts6O5tFJt1OvVcj5f7QGFYJUOuVizbv5N/mmcIBPrOrTHG6K4YeElwh87O7vG6jc5H2
	 JEPa4tWVUWSRc0IW3b2nijcokTKgQK213PBWJUOQ4Gp4XRdywxkkYiDhXTjOFTJen8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
	b=zYwUDQ3QMnv68gMICy1ZNFVLU3k++E0B9hP33Ude6nl3zcKPhJq9lk5sa7uAczmFyehe
	 x4V0OSAaJs4xThGFiu58iEYEOtJufJiankNm45xJYl/xrNoq/AC84EWtHbXHtJybY3ChW
	 W0hzPeuKe4iXVQJfyyEbcTdc6pAZmhxTtFz05vdozfm1wJz4pY+LsAL8/NstxJQZqw8jn
	 EQtKdwrlhEUz/SPMRMIp4yO7sOGKm7Zw3MsnoLkzd7GH/IQYZOS+vsXx++GkjZA9BDIqO
	 UTGIIJSCohfFASncPP+V7+rSdUzBgrSyMkQ5XM08rpAs5uO2uMpz8Dms/Ik8xdcVukA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbGuCeg+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2siSvUs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B25606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B25606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbGuCeg+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2siSvUs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j1V62481044
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=; b=YbGuCeg+OL8arg0D
	FQid+FuWjDgFl5JcYyY1kre2UEvasRPLKD22+ZYrNj51VN71fTosyJvCDHzRyPc3
	HD//TPeMyhbJmdlkcSMVsBMYECh7xaGi9cUBgs1sJHH6bx8IctqcQQ7KkfvC//2c
	KM2vUrPstmF97uhm8q1XP5zphDdR88bDTLjlDkzu/afuccdPWIe0YLyXAU/iT9xn
	gF12hCOt/h6KimzcP3mJonCKASNg0MS7Cfor5JWlap7AU1NF5eDbLE2/xOMt1Rht
	WxFxc2kS+6+RWiV7//ykBqhqoS6rMSzTEYkMxQAxTFRUMdkWSblhZ19brlHfUFqs
	w22a+w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82c1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:54:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so417344c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794275643; x=1794880443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=Z2siSvUsituLbs/AluxyD3nUh0bgD5uW//0VJ7s83+GBDcDvxvrkukW4YY+aqS+vw1
         sgSdHStTdkfdIrHSHdsVp3oEkNNbiohr6/+DlgmvVr3bq4bQDm97ncFWQ6hLLdmRgemZ
         Yoq0SJGH012wGU08QkZ2+gXeQvzqwpPzk4ZqcQvFfR4zv6gKhfE3oKiqAWqpd5nbDsFe
         5X7PcM+1d5C1NGdm18V9Xb6bZt65bN9s99ZHRgRdUBfaGsuZmfvU3ik0soGN96NoS1ZV
         As+7Pw4KzYz5LjLf9txjg4+R44yyjT7nuu6Xm9VH2hg4NeC/cVhVtfhQgKI7ZTGDVGLT
         udgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275643; x=1794880443;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=JHHyV9ff1ZRFy16cBQkmdkVZu7EdnM6gG75kYlgyE4314RqSx79l7rSC7tNK+p6Hnj
         RFmFlIu5n53TyAHtV1ld7TzU7w20VcD6JZ4zWkj2weMGMlHiupa5tVMfgKvMWc+OtCIl
         aRricfIakgGaezN2yYaaRS0J32eSNWP25u1XX9RK3oKgvwiLHXslm60cQdqDUO7DCffo
         j0wOv69mx+YgvP4jGgNBDWzJUBrKH9zNfP5qAl92cm470FQtXsrd2Z7BXxNI2zSg/JZH
         yNULQqf4CwZe+HxHops7jVW9npuJn764M51TKhrUufo4+GyFF2MoPF17eonXSRy4u4DT
         Ernw==
X-Gm-Message-State: APuU4Z8mJ7XksaE4QSn1I53hIWGfV2bPfXKrRYEmbDcYJqRQX5ALWYXd
	zNalKWmDTn8QMtjAeCF8OI67VKbovcQfo+4KvMgrUBmduMoHNFj+GTRxldCx3ULurI6I1NRqZYi
	N1HWzq14UMoVkJxBANkHqIl7NN0LjOBH0c9HB/IngAW4iGLTMwSIzXHqBv6dujpqcvUc=
X-Gm-Gg: AYBFou0MSqx6Ir2/yTLqD7AsP9lty8DHya+ZUNQ2Dt0JEOKyBtCeLpuL5lkxkvnJUw1
	f/FFjpKp8xrKC+WdFLDihPQTyMkwqgIwAoLrzp13La0hgRL5h/4CtEgXHDzlnDmPr+Y5DJtcf0C
	UKhnIItSP5B7CybOeyinafAIDUiIfXWFwduxKYyR6RPIgjbXBuuAdfYHQPg8ZNfTw5tCGJ/PsQT
	XyVsR9DDVPMcuB6VaH9x7CBVk9+2Uvw8yU+jdkSiJKXVHJ69STN6SYs4VXX0FaACTmxcsq/RdO8
	ga3FyHA4afWREL99azs38TC1Z50mwYhcJkYA2RxRgdaPdWXEjfo3OwNrq4h/OytxXvBryeN1GWG
	lp9f11mGks4t+hY3zmvzhTQpcxk8/bwtSNlB/6TO0/lbs7KoawjJJ6RdPRW7BHp1NsGCGhNLv5h
	QQPvtz0lTFYYaSga2cIHLegsZc7w==
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282476c88.12.1794275642861;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282413c88.12.1794275642187;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm3080274c88.4.2026.11.09.17.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:54:01 -0800 (PST)
Date: Mon, 9 Nov 2026 17:53:53 -0800
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
Subject: Re: [PATCH v15 11/35] firmware: arm_scmi: Add Telemetry groups
 initialization
Message-ID: <20261109175353.000008c0@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-12-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-12-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2793b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=0-nDijDy15vjLcikf0YA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: GYf8LxC7yVEChlEIJk7yiFk52XDS9O8n
X-Proofpoint-ORIG-GUID: GYf8LxC7yVEChlEIJk7yiFk52XDS9O8n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX5am1+U8ZilO8
 ORGBbR/0tE5chQ0F1Up/ZwTlYOBsForblhn+/C2nNIFadQ8mZjHi9YhaMU2EmiXKqWRa3TZdwgP
 JGVgJF6lFLcf40cdqjFjUNVXYRWBAFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX64EINrmHu6aS
 wT17NFyZ2wY5LlCvvYCtY4wR1QQDu61er8rui1SO+WlWGtU14bkK318gm9TY2VdbgbYc5Xm8VHS
 OA2wZPjXUyWP+PjNpgp7wzCTq5+IhBPuX/OecJIp83rEyjOIdQrqRt1XGy3J7NWwjKtn29ZUNy/
 j9+7A336Fv9UuUYhyH4COMWWUsXWIPXrSh7zHnIUEWamDiLEDJo2bx1Pjc60SdlLrNx4Ohz+4BC
 ikfheSq1j5KVxSNG+jSs/4NGMkAWfjBdD/ITjRMzUiP5ZzaI8RX9s0/c4paLC8HJjekMYj7OIYR
 ScEAC8g0ebHIkRQr/nr4gpH4ZeoQyZC2nOfNSylu3jjPjwlaQLUaTATpYic3E1PGKY+0cEp9jcg
 2y42Yoo2WJNIgoOS3wUWn5v72yam6M98R+u+2Dv4H6RP7E12huFRqLABk3jTFqqeCn33Gd/I85C
 oDRRJSoOS44beYV9DDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100007

On Mon,  9 Nov 2026 09:11:57 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allocate and initialize Telemetry Groups from base DataEvent data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> +static int
> +scmi_telemetry_de_groups_init(struct telemetry_info *ti)

one line maybe?  I guess follow local style.

> +{
> +	struct scmi_telemetry_res_info *rinfo;


> @@ -701,6 +833,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	kfree(rinfo->des);
>  	kfree(rinfo->dei_store);
>  
> +	kfree(rinfo->grps);
> +	kfree(rinfo->grps_store);

Same as earlier about reverse order being most consistent way to do
release of stuff.

> +
>  	kfree(rinfo);
>  
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
> @@ -722,10 +857,25 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
>  	xa_destroy(&ti->xa_des);
>  }

> +
>  static void scmi_telemetry_instance_cleanup(void *arg)
>  {
>  	struct telemetry_info *ti = arg;
>  
> +	scmi_telemetry_groups_free(ti->rinfo);
>  	scmi_telemetry_tdes_cleanup(ti);
>  	scmi_telemetry_resources_free(ti);
>  }


