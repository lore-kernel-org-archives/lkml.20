Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356032;
	b=J7XjETPY30GjTmEMD7bAZA6VCtfE0i1y0QfkCjPkmQsKPffp/SBls3SnO9mq+Zuyz1Fw
	 X3wW6bDpDJAFYuYhR6ZS0Xkk7AAopRQlUppJlhVPlkIeWApd8/FyHoGNfr22TWj8pBG12
	 ji9CgqmdKGH3FcPFS5/Z8Fr8BiwRMGI+83jNHEPealzHYxWFgWaAqowKnkxcjkNBY8RqL
	 OyL3opH9tLoTNduDQuBlr7ihQGUmNKOGkFQJGbB1laz+I9CRbvgO8PcMxpimPv+f+I4m4
	 YECzXuPc+JEoWh7UuBD75Oh+ip3XJAz9NfeIkAaKHd4MaDGMN4RRTTyw4sJybD5dQzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=;
	b=J+Uc4ZQUOKI0+3aCl7JcELuv1vKECZdxVu/rWlsONLnhBq3rHcY4mygiMV+9/dtIgCBe
	 rkf/i0tUqGUyxrnjgM5I6Rk+6CDmyTWaETJipHTu/F8kn5lcLwuy8eC8iX1jSbc1eKExI
	 PIZFJDSC3zw9NjoSOsLr5uzblOU6RpItr9r0xG9MSyVKFuWHD/aVJUYukJumr7/MrhpMu
	 bGbjb4s21JHOEZ633fQPC506tXR81/pW12SR9Qb6ee2zgxZAYnfdD2ILULGbkhFAnVzRJ
	 h5vQr7Phm74ysreXfdrHBYjRqx6QiXO0nMsbtvw3q/S1Ia65t1kybL+mdf4cgAV9Qrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L02Iwgpf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0Ra251N;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CE606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04CE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L02Iwgpf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0Ra251N
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKijQ486507
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=; b=L02IwgpfCH28nKkn
	o7ML802NZ4WPIOUk9eTpvWQDs4il2ijVFnlIjmWXrM8zyU3dBCvZQnp6ZMlshWOz
	22QzWOWkFRGjO5lKAsWWMOdbdojxI72/Dx2PiOnqH1hkgzKgy76+FblhDvegbmln
	/UNDbp3cWq5p5c54XKGJQPASzGup4pY/+dr8BFJgXO1woYafueq1GX8yxHsBnhPc
	yC4j8JroS4irTrt4L364ManYcJ3uKBmp/cYHPswqEUeqXVNlq5ujV/waTqUPT7HB
	buqAn+fVcdbRamqRtQV16Dtjq2qJOu0JBX7AeShl440SPO0l/NcmoTPjAJsUzTeu
	CGSrDg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdcd7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so4621139eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794356027; x=1794960827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=;
        b=D0Ra251N14gZPAUAEzUvzoSovhZobUn8LoRvVC9v1f8Lj5nwuSzVARMao/8dkF6DGs
         be05JK9qiPE7OQp5MKTtMSOedRJhkypX8d/i7NbOsbHgycuqxrYoNzR5gswSFxa5Vw5c
         ID9/RwziePSLUx/E2TUXb/N3cOHPA6acoBeAWNIfrccyU4rUTwlAuO+phyvM0yKRhKeA
         miXE+g7hWwNJWw1Ox3ZhEP8astFJZrwSftFTJqWEGULKgPRBrpqRFimP41p5NeKcJg7p
         ElSLMnv/P1lIhUaLWFxK2HenhjM3/44tF0yXR+1MPw+utrggbVai6RE09J61mSl6XWxL
         OPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356027; x=1794960827;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=;
        b=LEUkR1qwgZZXzvfzTJkI2k21DvqvXlV4y5B227pP/ViIZLdzGyBUE7Bc1UJ37kjMN3
         rPnH3bFW0tt4mFM1mnOODYdZCo6fdlS6zmC1MccZMDlv0pSzwa1KY96oDAHzHE0p3i1/
         o4r4LohM0pY7Kpw2TdALV5z7YkYO1qASHtM6Xu81aIdpIdG88cZG0g67YyUcP4ZmiX7v
         M0oLhUWhLFtmGfYjoVwqKEbWx9FP+CeQqx2oNICAFdbIpoS+IopnQ6oJs+YMaM8XTmRk
         d18Q4O9BL3IlxXdphg7gUJuOz5lMrHMS+puJVlECkccdWdmpkf8/vQH70Gn818v1bgH6
         rhmw==
X-Gm-Message-State: APuU4Z8Z9hCO6lhTcf7szvFmX0xWTqqMS4tMSyGYEpq91I8wdaiPw9Ms
	K9WQeo3mV2FwnaieqXTtQBUudjY9h8EdjuWxjwfKnnmAhaAkOQfcv2y1g6qznpU37N3nEI1UroT
	9KZ6XZu8FSaEmN0BkUBi7LZ9PsevxzGdbFrln/BbOC6h/nHVVErelVRLADhf3qGE5W4Q=
X-Gm-Gg: AYBFou10uWZ8LE9pQeYUOwQg3elCSI9S0AUUGtI11utJqMZjMiJy0OmYeb7VmlPuqE5
	klR/PI7szT2cpMm1JaE2l+gJCOlm+hBcFQpAKy2HgMEHG/n9PbXFvzhjj1H8GcgA0uCpmurK3Xz
	qUWR83JsHBHtVJUpHLXPiz84PTSr2y4+5M1bE/mEXaevUp/oQ1UleQBrBkc2z0538VoorvNfwxp
	uS25hzJmQ3Q8OBKs1oHjVqt7X7QxZfIuWrv4YJppb7Sw4KwcJPTWEFkLrF/7QfkrRvv8TQUOrBV
	9YvOsTtenXhRpin/oGxmaL0aaF+OUTFrU3VxeztKN03Uip3QHrGDDrhJQe30bk/4ZykWjA1sTa/
	ugrCknzqapi5Di8SNHQA9lFDvguauAvcFPWZC0R0AHtSHY8D9GtxOrGiA7bxzktPiLuCBCI+ER6
	CP1cc8JNpU6cqqn/gR6aA0u0JlS8o=
X-Received: by 2002:a05:701b:2710:b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b3c02fb105mr705229c88.15.1794356027129;
        Tue, 10 Nov 2026 16:13:47 -0800 (PST)
X-Received: by 2002:a05:701b:2710:b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b3c02fb105mr705197c88.15.1794356026555;
        Tue, 10 Nov 2026 16:13:46 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm10948342c88.4.2026.11.10.16.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:13:46 -0800 (PST)
Date: Tue, 10 Nov 2026 16:13:28 -0800
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
Subject: Re: [PATCH v15 34/35] [RFC] kselftest/arm64: Add SCMI Telemetry
 UAPI compliance testcases
Message-ID: <20261110161328.000056c4@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-35-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-35-cristian.marussi@arm.com>
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
X-Proofpoint-GUID: fFd1PKjNGu1lQy9pNwGc5fi3L-CqyieY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX8YYNhXyVVvgR
 +rFbrQoid9aKiLvMtRLeIB5Ky1XpQlOJnx7uoRbg1KpVOIM59IiKCET/zqoBuse5O305K5UxiXP
 r2rFvA94GYzHePga+XgnO/KotBL3u2k=
X-Proofpoint-ORIG-GUID: fFd1PKjNGu1lQy9pNwGc5fi3L-CqyieY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX243M3D+nU/ks
 q22WpTtE8vDJef+lT8DLXxxi4nI4CfKDEOrk/alLvk8hVMcBIxszMinFu97eJqy+BlT9qdlAW3x
 FQsBz+cEqEiwFSivng2qAJrpmm2R4gvuzPLY7l3hcWyotxo8/1lhwU1vftT0jytuxPVzJWzDh4c
 F13l3Dzywtsm6Jg30XvBKX8tJDfXo/x5DIZw/kRkZkUOCSlhf823soU5et65Kb0RP8mVL5LKBeB
 4yOxohXMYYYoCsiMY0vLmmY10G//XPqiWF31BjOh3P+yYnDPX7ZXDKOd3xRhTfWwCkM7vwXDB4t
 +plZd/j23TARAhK95Q7fB3+7xQ2PSW5e0reBxcM2hTUUVauugkn56DZ51qaBwUxogPAPqceylHQ
 jlzjql+DK2LwDmeg3KMNSpZ8ByLt01C3hUHZ+oUrN6udNOwmLelZKCuuzhlJTuRzjpUpPqFBjS+
 2aVqsZrRDzIKI4NIYcw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3b33c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=Knn1SA45J_WYkMnPUZgA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000

On Mon,  9 Nov 2026 09:12:20 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> From: Philip Radford <philip.radford@arm.com>
> 
> Add support to test SCMI Telemetry UAPI compliance testcases.

I'm thoroughly in favor of self tests, but rather less 1825 line patches!
I'd figure out an initial subset to propose of a few 100 lines then
build the rest up. Possibly just have a minimal set as part of first
series. 

I took a look at the code style for a few as not going to dig into whether
they are all functionally correct.
Given I'm assuming this LLM output, and those are pretty good at this
sort of test authoring I'm assuming they are probably ok.

Jonathan


> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> Co-developed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> diff --git a/tools/testing/selftests/arm64/scmi/config b/tools/testing/selftests/arm64/scmi/config
> new file mode 100644
> index 000000000000..63cd7e67ab55
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/scmi/config
> @@ -0,0 +1,2 @@
> +CONFIG_ARM_SCMI_SYSTEM_TELEMETRY=y
> +
> diff --git a/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c b/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c
> new file mode 100644
> index 000000000000..24a8170a4380
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c
...
I commented on style for a few near the end.
> +
> +TEST_F(stlm, tlm_get_uuid_list)
> +{
> +	struct scmi_tlm_batch batch = {};
> +	struct scmi_tlm_uuid *uuids;
> +	int i, j;
> +	bool nonzero;

No other reason for order? Go with reverse xmas tree.

> +
> +	if ((ksft_session.info.abi_features & SCMI_TLM_ABI_FEAT_UUID_LIST) == 0)
> +		SKIP(return, "UUID list not supported");
> +
> +	batch.num_items = 0;
> +	batch.item_sz = sizeof(*uuids);
> +
> +	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_GET_UUID_LIST, &batch));
> +
> +	if (!batch.num_items)
> +		SKIP(return, "no UUIDs available");
> +
> +	uuids = malloc(sizeof(*uuids) * batch.num_items);
> +	ASSERT_NE(NULL, uuids);
> +	bzero(uuids, sizeof(*uuids) * batch.num_items);
> +
> +	batch.items = (__u64)uuids;
> +
> +	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_GET_UUID_LIST, &batch));
> +	ASSERT_GT(batch.num_items, 0);
> +	ASSERT_EQ(sizeof(*uuids), batch.item_sz);
> +	ASSERT_EQ(0, batch.reserved);
> +
> +	for (i = 0; i < batch.num_items; i++) {
	for (int i = 0; ... 
> +		nonzero = false;
> +
> +		for (j = 0; j < SCMI_TLM_DE_IMPL_UUID_SZ; j++) {
		for (int j = 0; j < ...

> +			if (uuids[i].bytes[j]) {
> +				nonzero = true;
> +				break;
> +			}
> +		}
> +
> +		EXPECT_TRUE(nonzero);
> +
> +		TH_LOG("SCMI_TLM_GET_UUID_LIST - [%d] %02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
> +		       i, uuids[i].bytes[0], uuids[i].bytes[1],
> +		       uuids[i].bytes[2], uuids[i].bytes[3],
> +		       uuids[i].bytes[4], uuids[i].bytes[5],
> +		       uuids[i].bytes[6], uuids[i].bytes[7],
> +		       uuids[i].bytes[8], uuids[i].bytes[9],
> +		       uuids[i].bytes[10], uuids[i].bytes[11],
> +		       uuids[i].bytes[12], uuids[i].bytes[13],
> +		       uuids[i].bytes[14], uuids[i].bytes[15]);
> +	}
> +
> +	free(uuids);
> +}

> +TEST_F(stlm, tlm_get_uuid_list_bad_items_ptr)
> +{
> +	struct scmi_tlm_batch batch = {};
> +
> +	if ((ksft_session.info.abi_features & SCMI_TLM_ABI_FEAT_UUID_LIST) == 0)
> +		SKIP(return, "UUID list not supported");
> +
Where possible I'd assign structures with
	batch = (struct scmi_tlm_batch) {
		.num_items = 1,
		.items_sz = sizeof(struct scmi_tlm_uid),
		.items = 0, //Invalid pointer
	};
as that avoids having to zero explicitly and tends to end up more readable
than a wall of separate values being set in the same structure.
> +	batch.num_items = 1;
> +	batch.item_sz = sizeof(struct scmi_tlm_uuid);
> +	batch.items = 0;
> +
> +	ASSERT_EQ(-1, ioctl(self->fd, SCMI_TLM_GET_UUID_LIST, &batch));
> +	EXPECT_EQ(EFAULT, errno);
> +}


