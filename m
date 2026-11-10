Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354905;
	b=MCYGlJMk6uBn6oa0hYrJ+aLQ97W3ShXPD88SO5I84kZW1FUgyPPO+Ia9E+tlqo1Fk+zE
	 esDyvKQGIhLevLWFIz97FW2LEzS+064vsnFlaQEqwcJcCuzWxbZSXEH71cd4+EI+eru4x
	 osZ5ysq3BrEEiW7l5E5zZKlbcrlU+zihFvkBPBLcQ5Ze57+H3Acv+/xNheUlH0A/y+RjQ
	 0Y9kaQhs5oGNfq0N0XaoSX72VDEIaVjPiok10TABR/TR93O6vlR3Yniz8Xai9Q0wcWAoG
	 E3RhpOXbqiwOCzipXXwcDdjg1G3JEH2PDff3OqzA6PEP8eaxqf2q63GnKZsKpjzAyGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
	b=RrP0dzYuEfgmQA4fuBUTEYLeQYddOmM3BWo5T6iXD5z5p8OHplsipTHdZqfdjaJDcvww
	 9GEEOeD4BJDvMFikXzWR4czxjUWjbyoKz7D8KGK0tF9+mOFNyKp+lGqTe0aA1hQywh/Hw
	 sLMAz4yL9G2vRHs+gXW69RdK1KS76++YsPcfYVctkHeXzUxHmdvvXaY8+LaMybzalIC13
	 6mIxRBoawGJBLGySkm9C2YFrjYxcZAC5PsRQswHQyyGRX71hkZdGBmemU7/goxsAAtf6s
	 OayP9Xu7VFoVVlfWW4N5t9SY3a6Dp3JHFSLlmBXbf6FUpqZx12IV455sLVAm/bW1Ryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvSrJur+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=imj1+QS4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAAB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFAAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvSrJur+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=imj1+QS4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKKX03714340
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=; b=RvSrJur+C7Q3n8AL
	zjxGsdpF4JAjs2TkgsUSFax51novUV/gWuNOBY9bR2hYMr+5g3dKI7L8MAw1RUgS
	ahREeWE3wwDuKFS3NpCGsORX1hfGhN37Wi46BALSWNXfwY3pb6zvewTAzs3mHu4b
	cXdtGcVFq/SOcUn3ajhzCa7CBIIU8A+xsvr5A/b1GqJ38eRS1zGk4/INMgZQsg90
	kkfsru0YWfqf9UR7l31J8wQsz8NaIDl9+WyeV8G7B7cf6AeH/fj8yvqkp+BEOlZx
	OIjlBKKPxjGZ/6mLx4/UXS346IOByZRCJe5uZWfXPyqmUQMpN4QvEgMC+iA5GMv9
	aWtYPQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4be9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:55:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so19395c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794354903; x=1794959703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
        b=imj1+QS40auHKD6GPA//+z7x9mXp91dU9o25h+zG/akBZpge6GeYPo+aqWAtZi2yyf
         OxFYGgda/CExZvsvFuRyeYyxdrC1CJLpvmwY2jAFObBUWf2goMhki3Z6WwGscMwV6eIj
         SDDmt8lpWTVP0HlgVsgnV6iDtEdBy/UrQXoH63P0eDHQoZBWTLLkxLvQ/i7LZhClgoer
         orCtCDLdNh49uuU8oS5CeRthhLQadRmC7zkYs9j+qtUE2GdBB5W+5cNpwMDnYcUB8vDT
         TQdK5Em48dC2gj4cB+7wJIWIfUylK69WiVHkuaAEEllRmY/9nVAsecLbZNmNWc7xSpnc
         qQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354903; x=1794959703;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
        b=MsiIhPV1l9QqY2P/0D6B0js/ggD8s+6chipCGQghe8K6xViL6nRAJZf7yUXwXerVJV
         Kuk0niotz4YvFO6sbka/xkXQFVctBlolEe5EGCuI/D/gAo3MMvkgROYTR6aMwoIFKRCR
         nw4SJMaUwTJlGRYy1Kyl9MVJuK3c/ZIFGRKNwHeUuXW40ho/wFaZn9CNsrzlEaol54T/
         QFjpUSTNasJZikxLtraoyq30DNCsGhtJvJ1ECreKpD811sLaw7acmoeZLBwe9zkjJem4
         Bgx7mBnVX6ELIiK7Xvze2jwmKh1PAMArVTAyoGnpVzELwjHV5wPRCuQ+xqOb1DLYIyuc
         ET0Q==
X-Gm-Message-State: APuU4Z+pLFRKjbfCmrtxe7wvKxn0evcINJqRrCkZztiFssym+8ygCOdO
	8PMPH0bOEwlMn/dPdX8bUNzgnu8g5S66/lktdwXCuNuDhjO/jws3rT7y65rih2D4CycFbIzJF1A
	cPYqn+IlHpCb2IlPu+U4v37ktVtbonN378W5FfLiWCInweQY2l9d/Kkav8fkSUB+stO0=
X-Gm-Gg: AYBFou2RQCvbkiXuhkuQaEaa/ApDTxe1UF0zXwJKf3suBut5tfnhfVDk7Jr0Y2qmRYB
	sXMvdYbfR190q8T6T4L9tKvH1BU3v8Wcl2nog3r3g5Vb30apj1xXV0eHodxSdzpi44tAlIDBPYZ
	7JY+yBy6cI1sgEThLbOcPkEM5tBaltLKp6kV0p2RxzclzpSrTMeUrpHiCLTllUDbJ8k29TBAO7N
	wQRWwpVdTDBmBMux5Fms+0bZJEy0GpTpQm8eyYLuP0vzG84puOdSaS1myrYo9TGNfjxtpY3GoXy
	ryH4ugEF7pZKyE7hdIklCy76E6+fs1NUGOpfIlBO6svVy0EnPemSDCiVPa1u95yEYK244EZ/2NM
	IVgbi4/8hE79sOCktweqoUtAVzHb0/60I+9axwQ1XKSXxW9NtSdvbKyRm7CNdURB8KID/bp6oRq
	pKetOBTA9dX5hrCfeJ2Q31pbGwP18j
X-Received: by 2002:a05:7022:b0c4:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3c023cd8bmr667205c88.3.1794354903263;
        Tue, 10 Nov 2026 15:55:03 -0800 (PST)
X-Received: by 2002:a05:7022:b0c4:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3c023cd8bmr667173c88.3.1794354902630;
        Tue, 10 Nov 2026 15:55:02 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm21003960c88.10.2026.11.10.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:55:02 -0800 (PST)
Date: Tue, 10 Nov 2026 15:54:43 -0800
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
Subject: Re: [PATCH v15 33/35] Documentation: Add SCMI System Telemetry
 documentation
Message-ID: <20261110155443.00002e33@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-34-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-34-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfX/xTRvVdhQrCn
 s2sk4NxE7tkdupFwJOvea6N+zXze6g2wG+6qga9yw2OPJBANkKXZosw2Mdzvg6Q51vp7gXIxggp
 +j5nPFRb4o5ZX6DVmT8yP3ulsPDLA5BfMEyWy/oHXSgbKU/YD4x+S9SR8bkTrQMBLPOUPM4j4Q+
 LvVfOTYgxRSaLXsIrOyMcwjHM8aunNv+WAuRwVbvK1IdfC+UxzG9uQ2hf66i/020u9KCf2Klgx0
 9+hKfqIzXSVqhMHfhm/uUVTYdHAEfsV82CRszznzT2GMuuqgVDRbU/kYJeY+PehGV4ObJbq/eWJ
 hAi3wA5TpVFB8OJFoEdmTwjwcnJsQ1WXoG3u+3DUV4iSToFv+I5q9jYR3gFMR8hwP+g2ViSrebH
 5I97ZBxXKVm/bAEwmw9vd9OLIXT4gs/pACxJ0SXKGZdpC1H5yidNA/UusBbUhd+rWpJGv5GZdnW
 A7aPF3WJ++mNyM8eatQ==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3aed8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=UJirIprmqi7MR36yQRAA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfXzKc2dQsOz1yr
 t/RKcqOyHjBm1E2f1Dw77XYwRTDNPcOEoWHRJ+4HhUdqa1WAniRt2A+5JrAvEmeDdDkHQgb7EoR
 acJaudh2f9Xs9TOvJG7bo+sqiOGmIbY=
X-Proofpoint-GUID: Pk9QTovRnzvSQ2h4ToC2Fe0XQS5RHxw2
X-Proofpoint-ORIG-GUID: Pk9QTovRnzvSQ2h4ToC2Fe0XQS5RHxw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100095

On Mon,  9 Nov 2026 09:12:19 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Document ARM SCMI Telemetry IOCTLs interface.
> 
> Co-developed-by: Philip Radford <philip.radford@arm.com>
> Signed-off-by: Philip Radford <philip.radford@arm.com>
Various trivial things inline. For example code it is always
a balance between writing production quality stuff that
has lots of info that doesn't matter for docs, and over simplifying
to the point of ending with random broken code.

Here there is enough error handling to expect it to work but
there are cases where it doesn't. So tidy those up for consistency.

Jonathan


> ---
>  Documentation/userspace-api/index.rst |   1 +
>  Documentation/userspace-api/stlm.rst  | 590 ++++++++++++++++++++++++++
>  2 files changed, 591 insertions(+)
>  create mode 100644 Documentation/userspace-api/stlm.rst
> 
> diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
> index a68b1bea57a8..22daa7ebf78e 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -54,6 +54,7 @@ Devices and I/O
>     dcdbas
>     vduse
>     isapnp
> +   stlm
>  
>  Everything else
>  ===============
> diff --git a/Documentation/userspace-api/stlm.rst b/Documentation/userspace-api/stlm.rst
> new file mode 100644
> index 000000000000..ea05a10d314f
> --- /dev/null
> +++ b/Documentation/userspace-api/stlm.rst
> @@ -0,0 +1,590 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=======================================
> +STLM - ARM SCMI Telemetry Userspace API
> +=======================================
> +
> +.. contents::
> +
> +Overview
> +========
> +
> +ARM SCMI is a System and Configuration Management protocol, based on a

Wrap docs to 80 chars.

> +client-server model, that defines a number of messages that allows a
> +client/agent like Linux to discover, configure and make use of services
> +provided by the server/platform firmware.

> +
> +Enumerating DataEvents
> +======================
> +
> +SCMI_TLM_GET_DE_LIST returns the DataEvent descriptors exposed by the
> +Telemetery instance. Users can size the request from
> +SCMI_TLM_GET_ABI_INFO.num_des or by issuing a zero-sized batch query.
> +
> +Example
> +-------
> +
> +.. code-block:: c
> +
> +	int main(int argc, char **argv)
> +	{
> +		struct scmi_tlm_abi_info abi = {};
> +		struct scmi_tlm_batch batch = {};
> +		struct scmi_tlm_de_info *des;
> +		int fd, ret, i;
> +
> +		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
> +		if (fd < 0)
> +			return fd;
> +
> +		abi.size = sizeof(abi);
> +		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
> +		if (ret) {
> +			close(fd);
> +			return ret;
> +		}
> +
> +		if (!abi.num_des) {
> +			close(fd);
> +			return ret;

returns success. Make that explicit with return 0;

> +		}
> +
> +		des = calloc(abi.num_des, sizeof(*des));
> +		if (!des) {
> +			close(fd);
> +			return -ENOMEM;
> +		}
> +
> +		batch.num_items = abi.num_des;
> +		batch.item_sz = sizeof(*des);
> +		batch.items = (unsigned long)des;
> +
> +		ret = ioctl(fd, SCMI_TLM_GET_DE_LIST, &batch);
> +		if (ret) {
> +			free(des);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		for (i = 0; i < batch.num_items; i++) {
> +			printf("0x%08x: %.*s size:%u type:%u unit:%u", des[i].id, 16,
> +				des[i].name, des[i].data_sz, des[i].type, des[i].unit);
> +
> +			if (des[i].flags & SCMI_TLM_DEINFO_GROUP)
> +				printf("group:%u", des[i].grp_id);
> +
> +			printf("\n");
> +		}
> +
> +		return 0;
> +	}
> +
> +Enumerating Groups
> +==================
> +
> +SCMI_TLM_GET_GRP_LIST returns the groups exposed by the Telemetry Instance.
> +Group descriptors report; the group ID, the number of DEs in the group, and
> +the number of update intervals supported by the group.
> +
> +SCMI_TLM_GET_GRP_DESC can then be used to retrieve the DE IDs of a specific
> +group.
> +
> +Example
> +-------
> +
> +.. code-block:: c
> +
> +	int main(int argc, char **argv)
> +	{
> +		struct scmi_tlm_abi_info abi = {};
> +		struct scmi_tlm_batch batch = {};
> +		struct scmi_tlm_grp_info *groups;
> +		int fd, ret, i;
> +
> +		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
> +		if (fd < 0)
> +			return fd;
> +
> +		abi.size = sizeof(abi);
> +		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
> +
> +		if (ret){
> +			free(groups);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		if (!abi.num_groups) {
> +			ret = 0;
> +			free(groups);
> +			close(fd);
> +			return ret;

			return 0;
rather than setting ret.


> +		}
> +
> +		groups = calloc(abi.num_groups, sizeof(*groups));
> +		if (!groups) {
> +			ret = -ENOMEM;
> +			free(groups);
> +			close(fd);

return an error rather than carrying on.

> +		}
> +
> +		batch.num_items = abi.num_groups;
> +		batch.item_sz = sizeof(*groups);
> +		batch.items = (unsigned long)groups;
> +
> +		ret = ioctl(fd, SCMI_TLM_GET_GRP_LIST, &batch);
> +		if (ret) {
> +			free(groups);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		for (i = 0; i < batch.num_items; i++) {
> +			struct scmi_tlm_grp_desc desc = {};
> +			__u32 *de_ids;
> +			int j;
> +
> +			printf("group:%u des:%u intervals:%u\n", groups[i].grp_id,
> +				groups[i].num_des, groups[i].num_intervals);
> +
> +			if (!groups[i].num_des)
> +				continue;
> +
> +			de_ids = calloc(groups[i].num_des, sizeof(*de_ids));
> +			if (!de_ids) {
> +				ret = -ENOMEM;
> +				free(groups);
> +				close(fd);
> +				return de_ids;
				return -ENOMEM;
I'm curious if sashiko noticed your docs and spotted this stuff?
I guess it might be conservative as often such examples in docs
skip error handling.

> +			}
> +
> +			desc.grp_id = groups[i].grp_id;
> +			desc.num_des = groups[i].num_des;
> +			desc.composing_des = (unsigned long)de_ids;
> +
> +			ret = ioctl(fd, SCMI_TLM_GET_GRP_DESC, &desc);
> +			if (ret) {
> +				free(de_ids);
> +				free(groups);
> +				close(fd);
> +				return ret;
> +			}
> +
> +			printf("DataEvents:");
> +			for (j = 0; j < desc.num_des; j++)
> +				printf(" 0x%08x", de_ids[j]);
> +			printf("\n");
> +
> +			free(de_ids);
> +		}
> +
> +		free(groups);
> +		close(fd);
> +		return 0;
> +	}

...

