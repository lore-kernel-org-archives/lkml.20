Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6227353A6B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071357; cv=none; b=n9a6MWV7bvkqrWKfR6KOC5a/ar9nnYUiwooVSh2bM/a3mftR+2oCeSRNSNnhyJ0Vf6uvOt0TN65WAqOeEqG0FuBYQct7R8p1CJK3OROf9IoW0zoyDLs19il7m9WKoYVVjWZAdUXGhxn3ecebTuwZzzpS8YmU5BDhdLmIj7NimKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071357; c=relaxed/simple;
	bh=HZ8RLlvE16esbZArRU0UgIz27V8m3XMmxDiL4XTK5/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nuldNnu9qVj6NYmg45/oSBfLjsgBf871lzNYtJTiIrkv6vZ/XWgZhZ4IR2Qt21QsUnt6TeakJfv4z/E/HoGFb1WDkZnEiHdAVOkJApCCsynDIrwbArwgD2owO/c+hWIBZhRCUXNMJ92eweWmR0K2PXzoO95/VieqNj0m9FDCJ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5ZEl8gN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5ZEl8gN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8f265cbe6so1232585ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071354; x=1789676154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ad9ucu8mJSfCArd2idSv/B+uwu8hLIT9+OOunE3S7Qs=;
        b=g5ZEl8gNlNRwfYi62EYrPK3pI5TNVo0Sx0RuNcHq7esow7RjNBCJMGdImIDj/Rp5m2
         QR3t8EP/aHQpK8DLt7sq1zCPKYUnKy708ec2mds3AssAdvBDH4sEP+Rd+12KKipl2qDA
         r1ccMMSm0H5hQe5+nEkB1IIhqaASb8WciZ8/z4mlp3M0h/v3LEHcxi498SWQAk/rtvMy
         hdiODmYuGWqTSDo3kc4/Os0CokxqkS0juI8I2XY2t4OiSpH5lgJxKyKqhh2LiQuTwoPC
         FTybmKWYREZxN6WdozBgj1UZlYCSik64UO4h4GnDeDrLL8hqakEV7qGMhQOEyDFgQ1w+
         lq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071354; x=1789676154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad9ucu8mJSfCArd2idSv/B+uwu8hLIT9+OOunE3S7Qs=;
        b=hHmWNf96Bo2fjGmlZiVxGDfZhJe8CWAvVqp2SW05GTDDFPm9dPQ5nkxEXjP+9T4pIk
         Xd8tdpuyzMrMpc7dR6PW0z3c0f0bxS7c24qqTAkcpRgZFvUw2Xkis3MSNk+0dYTWeCPX
         HmhUCbhEExBiNp1k2IXHNw9UkkDTx7/U3RMTCrT1gqH+sWOmn247wLufOhzGkyR1Rwm6
         JT09uXRke9TYRlOzAks1ZY6mKCuimTw82YK2a6ouwJfGsEwB/f+GR3ftli0JCueZu7UD
         4MFi0gWdzK9+3xm5tRr+MQCAv6dDT6yEcJoPsxaHWo2T9mUAfBo8cEA+/yNftl/4+Prk
         8a6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzceprm4jsvLKGkVFfvVOI1Nwgci5ZyMyZ4J2n14M7S1USpiNAC/NObdWkQ/J+l329D7464x7WBxE3RpJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mzQTANNtsbw5ulaZxVkB17fFdQebUE03rB2ao7JTgAGYRlF2ev
	cSiSaLdP3dwmU1+0aUO7IcNu5NFeXLjzaZrL5NmZumfQMTrf/vuUtiGA
X-Gm-Gg: AYBFou1m1upJCEL4asaVLuLZG81qFHwFN2LYzR4CmXjNyk2h1oq5e274MrH0qLTQDsq
	CWIn08ettT7vrz5BaJAh0tyWxCmruWX5pMK76cjAvWs48/0d68fT96746r3vd2Ij21qkbciabWF
	Z55381rc/xvS3NiHhqvfT1vZg9NfPEs3hFxbG0knxvvJOcSAMeB4peifKDcPzBHf+lgTQnFehPQ
	e/c6IduJI2Z3FKHkyGAlkeLVPaNJ8Us2f3JNEbbZrzxGAMP6p9GRdTFQYIwAPYopHCqo+QnBbml
	IXkPHwg7OCwbd3bO6h/vjpw49Wew4p26fBT8/0NSwbDQluduNkn39CODgsd4D8yFGP0DgNDOReH
	cT+gbToy8ZQ3oLO+WzUq9FnYzVl/cdBtdO38YxTPX2iMooCMes8Ai7wVe53xJsTkbPhd3O9/w6+
	55lh8izIVQSwJb5+gRcAaIatbk2XftORb978kZ9vT3rvfjCyW2Sqtzta+OdOBOriWv1FfvCW1mA
	ziSchiTbCIWJAhucUw1+Gf5+k6HWMGv3oOar5ffTRsCsPh9RyySLEph+2WS3ytXhA==
X-Received: by 2002:a17:90b:2689:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39d9c21a63bmr611501a91.17.1789071353702;
        Thu, 10 Sep 2026 13:15:53 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm483933eec.7.2026.09.10.13.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:15:53 -0700 (PDT)
Message-ID: <20ee1683-892f-4dcb-b887-4709ec976743@gmail.com>
Date: Thu, 10 Sep 2026 13:15:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] HID: hid-oxp: group declarations and protocol
 definitions
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-12-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-12-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Collect protocol definitions and helper macros at the top of the file,
> place the quirk structure with the other type declarations, and tidy
> configuration field ordering and callback declaration formatting.
>
> Keep this cleanup separate from the preceding behavioral fixes and the
> new-controller feature patches.
>
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 116 ++++++++++++++++++++++--------------------
>   1 file changed, 60 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index e26e6a9..8c44f57 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -33,6 +33,30 @@
>   #define GEN1_USAGE_PAGE	0xff01
>   #define GEN2_USAGE_PAGE	0xff00
>   
> +#define OXP_MAPPING_GAMEPAD	0x01
> +#define OXP_MAPPING_KEYBOARD	0x02
> +#define OXP_FILL_PAGE_SLOT(page, btn)            \
> +	{ .button_idx = (page)->btn.button_idx,  \
> +	  .mapping_idx = (page)->btn.mapping_idx }
> +
> +#define OXP_GET_PROPERTY 0xfc
> +#define OXP_SET_PROPERTY 0xfd
> +#define OXP_EFFECT_MONO_TRUE 0xfe /* actual index for monocolor */
> +
> +#define OXP_DEVICE_ATTR_RW(_name, _group)                                     \
> +	static ssize_t _name##_store(struct device *dev,                      \
> +				     struct device_attribute *attr,           \
> +				     const char *buf, size_t count)           \
> +	{                                                                     \
> +		return _group##_store(dev, attr, buf, count, _name.index);    \
> +	}                                                                     \
> +	static ssize_t _name##_show(struct device *dev,                       \
> +				    struct device_attribute *attr, char *buf) \
> +	{                                                                     \
> +		return _group##_show(dev, attr, buf, _name.index);            \
> +	}                                                                     \
> +	static DEVICE_ATTR_RW(_name)
> +
>   enum oxp_function_index {
>   	OXP_FID_GEN1_RGB_SET =		0x07,
>   	OXP_FID_GEN1_RGB_REPLY =	0x0f,
> @@ -42,9 +66,6 @@ enum oxp_function_index {
>   	OXP_FID_GEN2_STATUS_EVENT =	0xb8,
>   };
>   
> -#define OXP_MAPPING_GAMEPAD	0x01
> -#define OXP_MAPPING_KEYBOARD	0x02
> -
>   struct oxp_button_data {
>   	u8 mode;
>   	u8 index;
> @@ -176,37 +197,38 @@ struct oxp_bmap_page_2 {
>   
>   /* Hybrid devices expose RGB and controller configuration on separate HIDs. */
>   struct oxp_hid_cfg {
> -	struct led_classdev_mc cdev;
> -	struct mc_subled subled_info[3];
> -	struct delayed_work oxp_rgb_queue;
> +	/* General HID state */
> +	struct hid_device *hdev;
> +	struct mutex cfg_mutex; /*ensure single synchronous output report*/
> +	bool suspended;
> +	bool removing;
> +
> +	/* Gamepad state */
>   	struct delayed_work oxp_btn_queue;
> +	struct delayed_work oxp_mcu_init;
>   	struct oxp_bmap_page_1 *bmap_1;
>   	struct oxp_bmap_page_2 *bmap_2;
> -	struct delayed_work oxp_mcu_init;
> +	bool gen2_work_initialized;
> +	u8 rumble_intensity;
> +	u8 gamepad_mode;
> +
> +	/* RGB state */
> +	struct delayed_work oxp_rgb_queue;
> +	struct mc_subled subled_info[3];
>   	struct led_classdev_mc *led_mc;
> -	struct hid_device *hdev;
> -	struct mutex cfg_mutex; /*ensure single synchronous output report*/
> -	struct mutex rgb_mutex; /*serialize complete RGB transactions*/
> +	struct led_classdev_mc cdev;
>   	spinlock_t rgb_reply_lock;
> +	struct mutex rgb_mutex; /*serialize complete RGB transactions*/
> +	bool rgb_work_initialized;
> +	bool rgb_reply_pending;
>   	u8 rgb_reply_command;
>   	u8 rgb_reply_zone;
> -	bool rgb_reply_pending;
>   	u8 rgb_brightness;
> -	u8 gamepad_mode;
> -	u8 rumble_intensity;
>   	u8 rgb_effect;
>   	u8 rgb_speed;
>   	u8 rgb_en;
> -	bool rgb_work_initialized;
> -	bool gen2_work_initialized;
> -	bool suspended;
> -	bool removing;
>   };
>   
> -#define OXP_FILL_PAGE_SLOT(page, btn)            \
> -	{ .button_idx = (page)->btn.button_idx,  \
> -	  .mapping_idx = (page)->btn.mapping_idx }
> -
>   enum oxp_gamepad_mode_index {
>   	OXP_GP_MODE_XINPUT = 0x00,
>   	OXP_GP_MODE_DEBUG = 0x03,
> @@ -251,14 +273,6 @@ enum oxp_rgb_effect_index {
>   	OXP_EFFECT_MONO_LIST, /* placeholder for effect_index_show */
>   };
>   
> -/* These belong to rgb_effect_index, but we want to hide them from
> - * rgb_effect_text
> - */
> -
> -#define OXP_GET_PROPERTY 0xfc
> -#define OXP_SET_PROPERTY 0xfd
> -#define OXP_EFFECT_MONO_TRUE 0xfe /* actual index for monocolor */
> -
>   static const char *const oxp_rgb_effect_text[] = {
>   	[OXP_UNKNOWN] = "unknown",
>   	[OXP_EFFECT_AURORA] = "aurora",
> @@ -321,6 +335,10 @@ struct oxp_attr {
>   	u8 index;
>   };
>   
> +struct quirk_entry {
> +	bool hybrid_mcu;
> +};
> +
>   static u16 get_usage_page(struct hid_device *hdev)
>   {
>   	return hdev->collection[0].usage >> 16;
> @@ -508,8 +526,9 @@ static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
>   	return 0;
>   }
>   
> -static int mcu_property_out(struct oxp_hid_cfg *cfg, u8 *header, size_t header_size, u8 *data,
> -			    size_t data_size, u8 *footer, size_t footer_size)
> +static int mcu_property_out(struct oxp_hid_cfg *cfg, u8 *header,
> +			    size_t header_size, u8 *data, size_t data_size,
> +			    u8 *footer, size_t footer_size)
>   {
>   	unsigned char *dmabuf __free(kfree) = kzalloc(OXP_PACKET_SIZE, GFP_KERNEL);
>   	bool rgb_write;
> @@ -560,7 +579,8 @@ static int mcu_property_out(struct oxp_hid_cfg *cfg, u8 *header, size_t header_s
>   	return ret;
>   }
>   
> -static int oxp_gen_1_property_out(struct oxp_hid_cfg *cfg, enum oxp_function_index fid, u8 *data,
> +static int oxp_gen_1_property_out(struct oxp_hid_cfg *cfg,
> +				  enum oxp_function_index fid, u8 *data,
>   				  u8 data_size)
>   {
>   	u8 header[] = { fid, GEN1_MESSAGE_ID };
> @@ -569,7 +589,8 @@ static int oxp_gen_1_property_out(struct oxp_hid_cfg *cfg, enum oxp_function_ind
>   	return mcu_property_out(cfg, header, header_size, data, data_size, NULL, 0);
>   }
>   
> -static int oxp_gen_2_property_out(struct oxp_hid_cfg *cfg, enum oxp_function_index fid, u8 *data,
> +static int oxp_gen_2_property_out(struct oxp_hid_cfg *cfg,
> +				  enum oxp_function_index fid, u8 *data,
>   				  u8 data_size)
>   {
>   	u8 header[] = { fid, GEN2_MESSAGE_ID, 0x01 };
> @@ -1030,20 +1051,6 @@ static ssize_t rumble_intensity_range_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(rumble_intensity_range);
>   
> -#define OXP_DEVICE_ATTR_RW(_name, _group)                                     \
> -	static ssize_t _name##_store(struct device *dev,                      \
> -				     struct device_attribute *attr,           \
> -				     const char *buf, size_t count)           \
> -	{                                                                     \
> -		return _group##_store(dev, attr, buf, count, _name.index);    \
> -	}                                                                     \
> -	static ssize_t _name##_show(struct device *dev,                       \
> -				    struct device_attribute *attr, char *buf) \
> -	{                                                                     \
> -		return _group##_show(dev, attr, buf, _name.index);            \
> -	}                                                                     \
> -	static DEVICE_ATTR_RW(_name)
> -
>   static struct oxp_attr button_a = { BUTTON_A };
>   OXP_DEVICE_ATTR_RW(button_a, map_button);
>   
> @@ -1130,7 +1137,8 @@ static const struct attribute_group oxp_cfg_attrs_group = {
>   	.attrs = oxp_cfg_attrs,
>   };
>   
> -static int oxp_rgb_status_store(struct oxp_hid_cfg *cfg, u8 enabled, u8 speed, u8 brightness)
> +static int oxp_rgb_status_store(struct oxp_hid_cfg *cfg, u8 enabled,
> +				u8 speed, u8 brightness)
>   {
>   	u16 up = get_usage_page(cfg->hdev);
>   	u8 *data;
> @@ -1538,10 +1546,6 @@ static const struct led_classdev_mc oxp_cdev_rgb = {
>   	.num_colors = ARRAY_SIZE(oxp_rgb_subled_info),
>   };
>   
> -struct quirk_entry {
> -	bool hybrid_mcu;
> -};
> -
>   static struct quirk_entry quirk_hybrid_mcu = {
>   	.hybrid_mcu = true,
>   };
> @@ -1651,7 +1655,7 @@ static int oxp_cfg_probe(struct hid_device *hdev, u16 up)
>   	ret = devm_led_classdev_multicolor_register(&hdev->dev, cfg->led_mc);
>   	if (ret) {
>   		dev_err_probe(&hdev->dev, ret,
> -				     "Failed to create RGB device\n");
> +			      "Failed to create RGB device\n");
>   		goto err_quiesce;
>   	}
>   
> @@ -1676,14 +1680,14 @@ skip_rgb:
>   	bmap_1 = devm_kzalloc(&hdev->dev, sizeof(struct oxp_bmap_page_1), GFP_KERNEL);
>   	if (!bmap_1) {
>   		ret = dev_err_probe(&hdev->dev, -ENOMEM,
> -				     "Unable to allocate button map page 1\n");
> +				    "Unable to allocate button map page 1\n");
>   		goto err_quiesce;
>   	}
>   
>   	bmap_2 = devm_kzalloc(&hdev->dev, sizeof(struct oxp_bmap_page_2), GFP_KERNEL);
>   	if (!bmap_2) {
>   		ret = dev_err_probe(&hdev->dev, -ENOMEM,
> -				     "Unable to allocate button map page 2\n");
> +				    "Unable to allocate button map page 2\n");
>   		goto err_quiesce;
>   	}
>   
> @@ -1702,7 +1706,7 @@ skip_rgb:
>   	ret = devm_device_add_group(&hdev->dev, &oxp_cfg_attrs_group);
>   	if (ret) {
>   		dev_err_probe(&hdev->dev, ret,
> -				     "Failed to attach configuration attributes\n");
> +			      "Failed to attach configuration attributes\n");
>   		goto err_quiesce;
>   	}
>   

Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
