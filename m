Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74F38E8B9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744581; cv=none; b=pEMzakeWZuFACtYgAgEh3Xd/U4ta66ewO0w3czDPtPiwKfbH21q/4XcEx+PbTsasMw0JG9CiDHtvlkGZ9u9bMcYjSm/hWjedsi97PIlSwjtoTZm3Xn945fCENRc9WkdP4LN3n0BWfkzkhyRZPfpFiJaEifkTu59oXxxRm1aBFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744581; c=relaxed/simple;
	bh=aa5m/7BK7/DbTvlCizArErjlcAXnc5ec7jWXk2pJ/iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBd0lXIL9fbTiKHtvBN8CZQPfl8lcHEEW0+SVTMDkNp5GDRBeouyHruYabUcVNoHkm58S1mIjVXj6wVP0Ywsq+OZwuhYPaUIhxfsqajYZ994Y8tQOxmSpvMaDlQOfiNK16kUSFO28jUkZmwVTWL9F1rBz8/fvRQCl+FRTn2K47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXHPYJ6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IC7Vb9Ky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXHPYJ6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IC7Vb9Ky"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPwfc2250338
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=; b=XXHPYJ6FeDHCsKs/
	gTUZP0A8B7VEKvxP3/ZQGrMcRXiqJma6U6+0a/4UEXZA0tZePMhR+iRHKNDFiyVg
	n6qigTH4VHX6L7APsHkzod0dTpR3Yu0H+of2UFG2Djj0yoazkdJY8U4deJT8Q4hP
	LIvrlHDOwI/8brieRCU0HU01XTWNdak+F11htJRuWD9wzXbkvKTZDzEKTLPMv1jh
	lP8KCFVTsOcy90kUEEbEwhNFRXwUqB6UyTLj6x7DZuzn6aBxoisjefLP5ej15iiK
	8bXA/T6czpOtTnNCeNO8VoVmCkSzHlgFLnK0xPiR0vLX3Q2p75L2vlUK1iZmqyz+
	OA5Hmg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3hg78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:02:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db87f759c5so49590755ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790744578; x=1791349378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=;
        b=IC7Vb9Ky6TNK2w8N9tYQn3JJddTw7HGOV3wheXo241yBrBQPLi4Vz/mtlrlEbPgHwM
         vQ8EWHGH6I1pBruQReZ9jAuu6tYgEDAeGdEp+Cfl/X2F2W5QDvFO3jEh9Tk5ZKEL9L3+
         2pMstpiF3b5liWx/+QumDTIRc3QCboGc8sU+6+QxEiaFgBJSePwf4/yQQxa2AUtDk+OL
         uU5cbGoxUegPayeiruoRwMhq0M7GfiCj81XA/6ck42v1xPQTtB6p/bg083SJmnGIfTrX
         NGZHpQnzY9uXphY0jXd8dgKPR/oxLu0SvXUe5x0tswpc7TUTZi37ROn0cfuO6mXou7J5
         N53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744578; x=1791349378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=;
        b=V98SrIBAdHcVTvkYbHF0pLmVIcJEaWLsUfQ2tLqFlyYeVPZmU7+oYjssLNTo7zpEvt
         PGR9s471Y+u9s2DkrXIvflxbJh73DdXSN/y+vtBnF1I5VIbmzg9IUWrWh2owIuu22vOw
         S/TSr1J0wOW7Rg6qmHBZhaKb8yp5Ems9Pnw2TMIb0Uwv7UQLduRdoJCZq0ADCEXZNVmj
         KpfQm5dJhNxQwpmMJjUBGFq1Q7L1sezqBNibKMsjfitRKDjbt/z/LVUFVRydpySS08CU
         J14UbYLxmZTHwFpM4GgfKPiDsz0xRIbFQRxK5d8NrE69EEes4KliCfhvskMsevm+rwFB
         TvWA==
X-Forwarded-Encrypted: i=1; AKwUvBxBNPreQPg+T+OMqizF0K58d2oOQs1obkPSGuR38eoUhb5oTPuGZTx5ii2AEnxOEGa1csNfzh9279Uug08=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrxhAAPpq1vgqHVRGt3qhhx0YwrzVMpW+3Y652ZjunwM+M1/+N
	Gq3EB09o3MHLRIkor+M6Sm0DRVUyo0OVZL9RwT9S4EKPCB9dzHuQU7b8xPHEZGqxBzmvnR3mtOZ
	fTDuUV0DbHISoDfpGErhLxU52kKA6YSnoRhNjBq+MFe3hC+KAuP1LhQbnjR43dEcc97c=
X-Gm-Gg: AYBFou08exi1QZ08QR19UhD7HhLtlC3KJ2MoAVUkhfXT8pVYxrTUlEkgTddTFScyc1F
	6Qh8uNwBhgrO5b6iYO5e5BLNnPbYePFTqrr0UTL4/ewiTrBHZRdwJ1sNgcGsGmjtIaCZyS+0Zw2
	86v7UMFfgnKpqAU8OoCVH5thgHLe2V8XfbtriqXUFBcEy6oky+jpJGz5JhXcfedaqjzVmpmq2on
	dCC+ZepJw8+lRYjkZWhNoi8IGoaSfF+x3uh51JCUtmiyX77lw+wLGbKQfSnHFVdVNeY3ZmKv7Cn
	MJggTdpwujCVFqltxzsht7NY6f+FZ9S5wvy85f8x95BDz7wX5UMJMi1XhBs91ko7Gi3ax61RmHS
	+IfqLL7UrBqck7hDMqKjr5g7pNbUT
X-Received: by 2002:a17:903:22c5:b0:2e2:bf06:25f3 with SMTP id d9443c01a7336-2e2e4b4b833mr2228435ad.38.1790744576666;
        Tue, 29 Sep 2026 22:02:56 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2e2:bf06:25f3 with SMTP id d9443c01a7336-2e2e4b4b833mr2228205ad.38.1790744576104;
        Tue, 29 Sep 2026 22:02:56 -0700 (PDT)
Received: from [192.168.31.121] ([152.57.6.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5bd5c67sm758105ad.48.2026.09.29.22.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 22:02:54 -0700 (PDT)
Message-ID: <362c6465-66ac-4ed7-9e7e-f75f31b32dd8@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:32:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: qcom-hamoa-ec: Add thermistor
 sensors
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-2-d9c1bae4cd0d@oss.qualcomm.com>
 <c15405f3-db75-410d-045b-996db4f83110@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <c15405f3-db75-410d-045b-996db4f83110@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0Lkb3XG_1rqLFZX9LZt_wR5oB7_A70ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAxOSBTYWx0ZWRfX/NKH0SmrwYcj
 Kj7tT8/9KZA86jSVxjXBukEe+XV078Se87hej1CrePuWbT5u6Or5A0s7GRvgHjg3f5FObzjn7Ha
 9yA1+rYKsYTWYoQLEV2DCPG+FBu5aQMFk003niFuisqNSJ9FLEuc0nxzP/2bIMa7yss1ZFE9IwK
 qNR+QtcWyxsVJAY2JRMre7vPMvNgXvdptJnnubBR9Fm/Byg8Xep515LLsQ/Aq8e9sw96nhrUI/5
 qjo1T3uWS3f9Ey4uXG7z4/SlIw35XLrQjOn1OXbhoeHHBjZc5RnkfVsj9a8nW66IXX67BradgwS
 79cnY2S7prqnn/ys2mms1f3ycojHak1MGYlSPLjtCNf9vWJwaySE0Fc1O3k2YXhSpBZTlQP6KTi
 cea+2z9nlVtou4LZ2YyOC5Mvqh2qtdiAPrgsygHUF+3KtHv+/MRgTiJh/RncHVXbpNPxGxVyX7L
 m033smpaW8RdNOOqytw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAxOSBTYWx0ZWRfX41hYlX629DMG
 RsyfpYzUa4ic9JZxYKHpwpwmPMlI0q5oqu6yt3nKWi7ttHVY1W6hI9xlRseKlFUyqbJNKhVVm9p
 RHPDECBc1ow4jLh4/7kcdeRvRFrS6cs=
X-Proofpoint-GUID: 0Lkb3XG_1rqLFZX9LZt_wR5oB7_A70ht
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abc9803 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZE6J5AxZF9eTCMsEPEnAuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qvRe1xnp1C8EnQCzoIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300019



On 9/29/2026 1:05 PM, Ilpo Järvinen wrote:
> On Mon, 28 Sep 2026, Anvesh Jain P wrote:
> 
>> The Qualcomm embedded controller has exclusive access to multiple onboard
>> thermistors programmatically discoverable through the
>> EC_THERMAL_CAPABILITIES command. The temperature values are reported in
>> degree Celsius through the EC_THERMISTOR_TEMP_CMD.
>>
>> Register these thermistors with the thermal framework by adding support to
>> the EC_THERMISTOR_TEMP_CMD and convert it to millidegree units as required
>> by the thermal framework.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 74 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 4d2ad042a7f8..acf3d7f53026 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -16,16 +16,19 @@
>>  #include <linux/pm.h>
>>  #include <linux/slab.h>
>>  #include <linux/thermal.h>
>> +#include <linux/unaligned.h>
>>  
>>  #define EC_SCI_EVT_READ_CMD	0x05
>>  #define EC_FW_VERSION_CMD	0x0e
>>  #define EC_MODERN_STANDBY_CMD	0x23
>> +#define EC_THERMISTOR_TEMP_CMD	0x29	/* + thermistor_id (0-6) selects thermistor 1-7 */
>>  #define EC_FAN_DBG_CONTROL_CMD	0x30
>>  #define EC_SCI_EVT_CONTROL_CMD	0x35
>>  #define EC_THERMAL_CAP_CMD	0x42
>>  
>>  #define EC_FW_VERSION_RESP_LEN	4
>>  #define EC_THERMAL_CAP_RESP_LEN	3
>> +#define EC_THERMISTOR_TEMP_RESP_LEN	3
>>  #define EC_FAN_DEBUG_CMD_LEN	6
>>  #define EC_FAN_SPEED_DATA_SIZE	4
>>  
>> @@ -39,6 +42,7 @@
>>  #define EC_MAX_FAN_CNT		2
>>  #define EC_FAN_NAME_SIZE	20
>>  #define EC_FAN_MAX_PWM		255
>> +#define EC_MAX_THERMISTOR_CNT	7
>>  
>>  enum qcom_ec_sci_events {
>>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>> @@ -64,6 +68,7 @@ struct qcom_ec_thermal_cap {
>>  #define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>>  #define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>>  #define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>> +#define EC_THERMISTOR_PRESENT(mask, id)	((mask) & BIT(id))
>>  	u8 fan_cnt;
>>  	u8 fan_type;
>>  	u8 thermistor_mask;
>> @@ -81,6 +86,12 @@ struct qcom_ec {
>>  	struct qcom_ec_thermal_cap thermal_cap;
>>  	struct qcom_ec_version version;
>>  	struct i2c_client *client;
>> +	struct qcom_ec_thermal_zone *ec_tz;
>> +};
>> +
>> +struct qcom_ec_thermal_zone {
>> +	struct qcom_ec *ec;
>> +	u8 thermistor_id;
>>  };
>>  
>>  static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> @@ -183,6 +194,43 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * EC Thermistor Temperature (cmd 0x29 + thermistor_id, id 0-6 selects
>> + * thermistor 1-7):
>> + *
>> + * Read Response:
>> + * ----------------------------------------------------------------------
>> + * | Offset	| Name		| Description				|
>> + * ----------------------------------------------------------------------
>> + * | 0x00	| Byte count	| Number of bytes in response (=2)	|
>> + * ----------------------------------------------------------------------
>> + * | 0x01 (LSB)| Temperature	| Signed 16-bit, unit of 0.1 degC,	|
>> + * | 0x02 (MSB)|		| range -40..+125 degC			|
>> + * ----------------------------------------------------------------------
>> + */
>> +static int qcom_ec_thermistor_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +	struct qcom_ec_thermal_zone *ec_tz = thermal_zone_device_priv(tz);
>> +	struct qcom_ec *ec = ec_tz->ec;
>> +	u8 resp[EC_THERMISTOR_TEMP_RESP_LEN];
>> +	s16 raw;
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_THERMISTOR_TEMP_CMD + ec_tz->thermistor_id,
>> +			   EC_THERMISTOR_TEMP_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	raw = (s16)get_unaligned_le16(&resp[1]);
>> +	*temp = raw * 100;
> 
> MILLIDEGREE_PER_DECIDEGREE?
> 
> Make sure you have the include for it if changing to it.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_zone_device_ops qcom_ec_thermistor_ops = {
>> +	.get_temp = qcom_ec_thermistor_get_temp,
>> +};
>> +
>>  static irqreturn_t qcom_ec_irq(int irq, void *data)
>>  {
>>  	struct qcom_ec *ec = data;
>> @@ -376,6 +424,32 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  	if (ret < 0)
>>  		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>>  
>> +	if (ec->thermal_cap.thermistor_mask) {
>> +		ec->ec_tz = devm_kcalloc(dev, EC_MAX_THERMISTOR_CNT, sizeof(*ec->ec_tz),
>> +					 GFP_KERNEL);
>> +		if (!ec->ec_tz)
>> +			return -ENOMEM;
>> +
>> +		for (i = 0; i < EC_MAX_THERMISTOR_CNT; i++) {
>> +			struct qcom_ec_thermal_zone *ec_tz = &ec->ec_tz[i];
>> +			struct thermal_zone_device *tzd;
>> +
>> +			if (!EC_THERMISTOR_PRESENT(ec->thermal_cap.thermistor_mask, i))
>> +				continue;
>> +
>> +			ec_tz->ec = ec;
>> +			ec_tz->thermistor_id = i;
>> +
>> +			tzd = devm_thermal_of_zone_register(dev, i, ec_tz, &qcom_ec_thermistor_ops);
>> +			if (IS_ERR(tzd)) {
>> +				ret = PTR_ERR(tzd);
>> +				if (ret != -ENODEV)
> 
> I'd prefer ret == -ENODEV check + continue.
> 
>> +					dev_warn(dev, "Failed to register thermistor%u zone: %d\n",
>> +						 i, ret);
>> +			}
>> +		}
>> +	}
>> +
>>  	if (ec->thermal_cap.fan_cnt == 0) {
>>  		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>>  		return 0;
>>
>>
>

Thanks for the review. I will use MILLIDEGREE_PER_DECIDEGREE from
<linux/units.h> for the temperature conversion. I will also change the
thermal-zone registration handling to continue explicitly on -ENODEV and
warn about other errors.

-- 
Best Regards,
Anvesh

