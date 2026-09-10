Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DF23A75B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028099; cv=none; b=odgdz3wldJLmrt33jF4hL8vVAg8eMbFoyqAA30aEFK+jV3IO2K3taQJLJGOS2dfo281wUa+pK8Sp8/lfXHGlnv80MQt2tqdOe74Q3O2EsZ9g7D+RmqsyxCQg5fhIkFiyBnFFdZI8HeH54nIDvdQr9BbHmGwgzOXuu8C1chz4acI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028099; c=relaxed/simple;
	bh=MAqZVDySrpzD39XKM9VrZDnkAfmt2r6/DThXu65Jioo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCrP1Ahd/bWRXCGWX7Lp0rLFb405fAfmY9XWeyLYO2TFsZVOczOFDLboXneEn/mtsGmB9cOK3HIeIqK1ZEbZ892ePHy0OeY+3i9rErTWlKGi4llEPVnYhTP4av3EpX4omUaD3h5ZmAF7w/6dTAiUVsmSiF47bF85Df4ikEevtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caBZC6Pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vqvxlf8V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caBZC6Pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vqvxlf8V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gwmn4142685
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1k93948K/bcZcMGohGxg15n9seATxvQN55Auj43kMXo=; b=caBZC6Pcu078o/v5
	KBwDmG4vXEhQNilb/07ZNfPNHIUCc/fsGHlCkqs9bQX9i20o7LG7/ymHoTmlkZ0+
	S4wPYXDeqODOhVmVu5xhv+Dla4j0omfGOBVcyqpLY/aPXSqTadefSWirssYYj4u/
	1gn4vulvCIcJYFVsALYpzjrngkaFb3bhQiVmCrHFLwHYKFvEJFvlaU4+PXVOIpFY
	Bfumg/6WGWW07FwwkKaumGVLVyYSkYyXDBL1Xclov+tRMjBHIq5tWCgKY6cJyybN
	UIR1N0RnoGNlWW7dM7vh1SlouRGt7Gbl+SmUyfJ16y10wnI8c01csZWPNjjHU0Jn
	Q75j+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2s6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:14:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53018848232so75738551cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028096; x=1789632896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1k93948K/bcZcMGohGxg15n9seATxvQN55Auj43kMXo=;
        b=Vqvxlf8VLKXFCYHvdVtKqGWbeBvA3Ic6k2MZ8B9jDp8Q40n+w1JC1/IyJYIOulE46I
         BXZ2n934eSvW4FuqHimzolpllc6gDilr4torccyZKxs956+N3/AK5y15d+gOvSz/M8Ee
         ejrHaCBfKtinzii5nnsgscoQnJbgt1X8mP9GeJN8lCeqS5kKY1Dshvi6Qgc/ACrG7yUU
         agX5SNfoEze+A/6EtCgrovJ0vXJt6ZJ/AR35VZTM18bykL3FUgHB4RnZ8lX2Z4izpizx
         FPU5Lj4sdLiOGaNPaoL5+7MC+AeY7ngTOyczzHmLcVWkrxMq5FBxEaHO8ALCL8nttWCV
         6t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028096; x=1789632896;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k93948K/bcZcMGohGxg15n9seATxvQN55Auj43kMXo=;
        b=TsIloIwurXpcZ88ViehXz++Yiai/bRR0oCTRdstPxVbaOmcQQ2DsEkTIsGoo5V8Cce
         Tyw8jTHfxfa/i702nAxP1iE1IitCk1hNGK5vvO/P1qsuOgz5FhQZJn5WYBuIxA8TczKF
         2CW0ehizMvwt2bpdQIiQEo7oUbbgdDxykq9iT3KwkdqlRRIQa07kjzGyB8DTg/6Qbl1J
         ZNP1NFd9m40qf4QcTO2fQo2IgJghD0UGwFqcuRuT7ZJDWmy0OtXrNYl+5ZT8Kko479kl
         0BJAX7eDQFFIYX/7wfQe3GIcWD7wr5cfdm/+nvIdFZLa5Gf9TEjlpjfjK0SVS5SzI0qL
         XRpQ==
X-Forwarded-Encrypted: i=1; AKwUvByTKLN5oBPBiFy7MGA9h+vn58AtrJds90shxTzoBcL8D682D/E6fpJK/8WoNHhv/eK3uryQI2gbzBwXXq8=@vger.kernel.org
X-Gm-Message-State: AFuF++l4wCXphBT/mqmk0k9lp/Git6FxlmHO919hYN0ieRLzWET+hnDD
	HfDjK/tL0VJUK/77ddDCwoRlVQrUXOfnQVheRXrtcQLLL9ApWgRbSZ9lO0/SQQJP7b6+FoOrx5v
	huWOPZ4NZwVE7e/VQRxnVB3tnR4TsrLQ4vQY2HB8pbbkC/Nu+golmUbBD+4ANYwGJIcQ=
X-Gm-Gg: AYBFou3vM9N4/Ja8+ZbTS0XCoSOU/in5JEdxLQva0V4ZT0rHukV72wuNtMp01sHDbGY
	0vDpsbLsoYC4U9ZFKpmfdU7b4HymvtES2Trc5Ii321z7wlOqq/7P0YVnTWHFFvRq1qvTwtrK/Ci
	01LOiHEyhwkwzo6GchdTZ35H/ciPYrZDpCThf2Tm3beT47P18PJN3+x7qUcfVNO68O/EFEApg7w
	uRsW11A2j5ULX1no1PS04oH/WY45cg6HaNVRLzFRoG7eLpAuQhnEVfwsqL+AblQfvlogeXGgZUg
	Te1iYv3+BeUQKBeXUDFQf9GJZd2ic5wKZGHGFJW+YDLTzyp4GHIyO/c5J++0Y5ws9h/8CH38S+P
	owFUY8WLNRsgq2tLAuGQTz6MVvnZ/XFit5EuLrTlNILYYOroh8Q==
X-Received: by 2002:ac8:7f83:0:b0:530:b2e1:8e40 with SMTP id d75a77b69052e-530b2e19bb5mr53940571cf.59.1789028095176;
        Thu, 10 Sep 2026 01:14:55 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:530:b2e1:8e40 with SMTP id d75a77b69052e-530b2e19bb5mr53940161cf.59.1789028094694;
        Thu, 10 Sep 2026 01:14:54 -0700 (PDT)
Received: from [10.38.244.96] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530a2fdcf8esm48687351cf.8.2026.09.10.01.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:14:54 -0700 (PDT)
Message-ID: <20853e7e-0884-49ae-a6ce-48c0c826ea27@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 16:14:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-3-a05b2d04c892@oss.qualcomm.com>
 <ap_v94pUrTo1C1Go@kekkonen.localdomain>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <ap_v94pUrTo1C1Go@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mRZ_aR8dYKX6HVoyjmfFZaatuV1gHbaU
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa26700 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Y_5Bptm9H6nTokT5DUMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mRZ_aR8dYKX6HVoyjmfFZaatuV1gHbaU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4OSBTYWx0ZWRfX0uLKs5iua8AC
 g3oJVktQM2X5PS41CJ6aj36HG7ZKtBtUB0dWy3Xmn/jBjAXPftuZ66+HYuNsVhWhl9NHf93Otl9
 B/YM3on9hiAtImof3ysLF5y28k7ZDYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4OSBTYWx0ZWRfX3AmZMTmW0RAL
 ZsUDJ7Sa4eW3A0F48cXMpsfF1mu4F87dHvAphdJ1cmIlJ7bkXObmDqeXJNiuSYdtOJtH5cmsBWg
 n3xjxgGp+da2AqabXL+BRcQfFfiFWqKuzXR1GE7EaEBAubihFcKmYn6CTHULPl8QJG/elWaW6YR
 fboTNzK47Vy34MAEeFVpHx2k2okt6iqUGsuFY5R0K50b1kTaUpGVJ/yZtG1CXvUeCCkMeXnF/Oo
 Rv0cwBRhupsUlE7Ft2c0MPgB2QtygKZshCm6uBRMnIENyGQIZUzqamapjUBkYDoMyBLY+6KFet6
 jY4h+LQ7XsBOT1O/xM+UGXoFvfZ9riuBKU0mkZBkgTftFS7pQgGROiEqJ/PkCzm9yVP/6lC4ECQ
 tzBmE/uQCgz4345ZiZZ11aeFV3R1H8NDmrPKpW/+9v1paBjqM457Y0RxSRPz5FcmrFMJdFN26ha
 VWQDBnqT/NJfDtTvG5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100089

Hi Sakari,

On 9/8/2026 7:22 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Tue, Sep 01, 2026 at 03:40:06PM +0800, Wenmeng Liu wrote:
>> Refactor the driver to separate sensor-specific data from the common
>> driver code. Introduce a sensor_data structure, populated through
>> i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
>> frequencies and supported modes.
>>
>> Test pattern programming is described by a per-sensor callback, and each
>> mode stores its media bus format code (rather than a bits-per-pixel
>> value) so that sensors with a different output format can be supported.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 100 +++++++++++++++++++++++++++++++-------------
>>   1 file changed, 72 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index da5c8e49d4a811f55736bd89c6922856f2e7391c..f560d5d90fda94abf4bc622c5e4f861b078b811f 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -5,6 +5,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/i2c.h>
>> +#include <linux/math64.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regulator/consumer.h>
>> @@ -65,11 +66,23 @@ struct og0ve1b_mode {
>>   	u32 height;	/* Frame height in pixels */
>>   	u32 hts;	/* Horizontal timing size */
>>   	u32 vts;	/* Default vertical timing size */
>> -	u32 bpp;	/* Bits per pixel */
>> +	u32 code;	/* MEDIA_BUS_FMT code */
>>   
>>   	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
>>   };
>>   
>> +struct og0ve1b;
>> +
>> +struct og0ve1b_sensor_data {
>> +	u64 chip_id;
> 
> This one seems to be unused.
> 

It is currently used by og0ve1b_identify_sensor().

The intention of moving chip_id into the sensor_data structure is to
prepare for support of additional sensors sharing the common driver
code. The next patch in the series adds OG0VA1B support, which uses a
different chip ID. Keeping chip_id in the per-sensor data allows the
common identification code to be reused unchanged.

Thanks,
Wenmeng

>> +	unsigned long mclk_freq;
>> +	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
>> +	const s64 *link_freq_menu;
>> +	int num_link_freqs;
>> +	const struct og0ve1b_mode *modes;
>> +	int num_modes;
>> +};
>> +
>>   static const char * const og0ve1b_test_pattern_menu[] = {
>>   	"Disabled",
>>   	"Standard Test Bar",
>> @@ -99,6 +112,8 @@ struct og0ve1b {
>>   
>>   	/* Saved register value */
>>   	u64 pre_isp;
>> +
>> +	const struct og0ve1b_sensor_data *data;
>>   };
>>   
>>   static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
>> @@ -247,13 +262,13 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
>>   	{ CCI_REG8(0x3f47), 0x35 },
>>   };
>>   
>> -static const struct og0ve1b_mode supported_modes[] = {
>> +static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
>>   	{
>>   		.width = 640,
>>   		.height = 480,
>>   		.hts = 792,
>>   		.vts = 568,
>> -		.bpp = 8,
>> +		.code = MEDIA_BUS_FMT_Y8_1X8,
>>   		.reg_list = {
>>   			.regs = og0ve1b_640x480_120fps_mode,
>>   			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
>> @@ -273,11 +288,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>>   	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
>>   }
>>   
>> +static const struct og0ve1b_sensor_data og0ve1b_data = {
>> +	.chip_id = OG0VE1B_CHIP_ID,
>> +	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
>> +	.enable_test_pattern = og0ve1b_enable_test_pattern,
>> +	.link_freq_menu = og0ve1b_link_freq_menu,
>> +	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
>> +	.modes = og0ve1b_supported_modes,
>> +	.num_modes = ARRAY_SIZE(og0ve1b_supported_modes),
>> +};
>> +
>>   static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>>   {
>>   	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
>>   					       ctrl_handler);
>> -	const struct og0ve1b_mode *mode = &supported_modes[0];
>> +	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
>>   	s64 exposure_max;
>>   	int ret;
>>   
>> @@ -314,7 +339,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>>   				ctrl->val + mode->height, NULL);
>>   		break;
>>   	case V4L2_CID_TEST_PATTERN:
>> -		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
>> +		ret = og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
>>   		break;
>>   	default:
>>   		ret = -EINVAL;
>> @@ -330,10 +355,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
>>   	.s_ctrl = og0ve1b_set_ctrl,
>>   };
>>   
>> +static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
>> +{
>> +	const struct og0ve1b_mode *mode = &data->modes[0];
>> +	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
>> +
>> +	return div_u64(data->link_freq_menu[0], bpp);
>> +}
>> +
>>   static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>>   {
>>   	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
>> -	const struct og0ve1b_mode *mode = &supported_modes[0];
>> +	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
>> +	const struct og0ve1b_sensor_data *data = og0ve1b->data;
>>   	s64 exposure_max, pixel_rate, h_blank, v_blank;
>>   	struct v4l2_fwnode_device_properties props;
>>   	struct v4l2_ctrl *ctrl;
>> @@ -343,12 +377,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>>   
>>   	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
>>   				      V4L2_CID_LINK_FREQ,
>> -				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
>> -				      0, og0ve1b_link_freq_menu);
>> +				      data->num_link_freqs - 1,
>> +				      0, data->link_freq_menu);
>>   	if (ctrl)
>>   		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>   
>> -	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
>> +	pixel_rate = og0ve1b_pixel_rate(data);
>>   	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
>>   			  0, pixel_rate, 1, pixel_rate);
>>   
>> @@ -407,7 +441,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>>   static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
>>   				      struct v4l2_mbus_framefmt *fmt)
>>   {
>> -	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
>> +	fmt->code = mode->code;
>>   	fmt->width = mode->width;
>>   	fmt->height = mode->height;
>>   	fmt->field = V4L2_FIELD_NONE;
>> @@ -421,8 +455,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
>>   				  struct v4l2_subdev_state *state, u32 pad,
>>   				  u64 streams_mask)
>>   {
>> -	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
>>   	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +	const struct og0ve1b_reg_list *reg_list = &og0ve1b->data->modes[0].reg_list;
>>   	int ret;
>>   
>>   	ret = pm_runtime_resume_and_get(og0ve1b->dev);
>> @@ -484,13 +518,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
>>   				  struct v4l2_subdev_state *state,
>>   				  struct v4l2_subdev_format *fmt)
>>   {
>> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>>   	struct v4l2_mbus_framefmt *format;
>>   	const struct og0ve1b_mode *mode;
>>   
>>   	format = v4l2_subdev_state_get_format(state, 0);
>>   
>> -	mode = v4l2_find_nearest_size(supported_modes,
>> -				      ARRAY_SIZE(supported_modes),
>> +	mode = v4l2_find_nearest_size(og0ve1b->data->modes,
>> +				      og0ve1b->data->num_modes,
>>   				      width, height,
>>   				      fmt->format.width,
>>   				      fmt->format.height);
>> @@ -505,10 +540,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
>>   				  struct v4l2_subdev_state *sd_state,
>>   				  struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +
>>   	if (code->index > 0)
>>   		return -EINVAL;
>>   
>> -	code->code = MEDIA_BUS_FMT_Y8_1X8;
>> +	code->code = og0ve1b->data->modes[0].code;
>>   
>>   	return 0;
>>   }
>> @@ -517,15 +554,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>>   				   struct v4l2_subdev_state *sd_state,
>>   				   struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -	if (fse->index >= ARRAY_SIZE(supported_modes))
>> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +	const struct og0ve1b_sensor_data *data = og0ve1b->data;
>> +
>> +	if (fse->index >= data->num_modes)
>>   		return -EINVAL;
>>   
>> -	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
>> +	if (fse->code != data->modes[fse->index].code)
>>   		return -EINVAL;
>>   
>> -	fse->min_width = supported_modes[fse->index].width;
>> +	fse->min_width = data->modes[fse->index].width;
>>   	fse->max_width = fse->min_width;
>> -	fse->min_height = supported_modes[fse->index].height;
>> +	fse->min_height = data->modes[fse->index].height;
>>   	fse->max_height = fse->min_height;
>>   
>>   	return 0;
>> @@ -534,13 +574,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>>   static int og0ve1b_init_state(struct v4l2_subdev *sd,
>>   			      struct v4l2_subdev_state *state)
>>   {
>> +	const struct og0ve1b_mode *mode = &to_og0ve1b(sd)->data->modes[0];
>>   	struct v4l2_subdev_format fmt = {
>>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>>   		.pad = 0,
>>   		.format = {
>> -			.code = MEDIA_BUS_FMT_Y8_1X8,
>> -			.width = supported_modes[0].width,
>> -			.height = supported_modes[0].height,
>> +			.code = mode->code,
>> +			.width = mode->width,
>> +			.height = mode->height,
>>   		},
>>   	};
>>   
>> @@ -586,9 +627,9 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
>>   		return ret;
>>   	}
>>   
>> -	if (val != OG0VE1B_CHIP_ID) {
>> -		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
>> -			OG0VE1B_CHIP_ID, val);
>> +	if (val != og0ve1b->data->chip_id) {
>> +		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
>> +			og0ve1b->data->chip_id, val);
>>   		return -ENODEV;
>>   	}
>>   
>> @@ -624,8 +665,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
>>   	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
>>   				       bus_cfg.link_frequencies,
>>   				       bus_cfg.nr_of_link_frequencies,
>> -				       og0ve1b_link_freq_menu,
>> -				       ARRAY_SIZE(og0ve1b_link_freq_menu),
>> +				       og0ve1b->data->link_freq_menu,
>> +				       og0ve1b->data->num_link_freqs,
>>   				       &freq_bitmap);
>>   
>>   	v4l2_fwnode_endpoint_free(&bus_cfg);
>> @@ -686,6 +727,9 @@ static int og0ve1b_probe(struct i2c_client *client)
>>   		return -ENOMEM;
>>   
>>   	og0ve1b->dev = &client->dev;
>> +	og0ve1b->data = i2c_get_match_data(client);
>> +	if (!og0ve1b->data)
>> +		return -ENODEV;
>>   
>>   	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
>>   
>> @@ -700,7 +744,7 @@ static int og0ve1b_probe(struct i2c_client *client)
>>   				     "failed to get XVCLK clock\n");
>>   
>>   	freq = clk_get_rate(og0ve1b->xvclk);
>> -	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
>> +	if (freq && freq != og0ve1b->data->mclk_freq)
>>   		return dev_err_probe(og0ve1b->dev, -EINVAL,
>>   				     "XVCLK clock frequency %lu is not supported\n",
>>   				     freq);
>> @@ -819,7 +863,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>>   };
>>   
>>   static const struct of_device_id og0ve1b_of_match[] = {
>> -	{ .compatible = "ovti,og0ve1b" },
>> +	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
>>
> 

