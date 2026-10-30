Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365327;
	b=UFA4kbpJry3O21sIaZ1vuwTSB2zLFYe5XihGqTYLw/k+zOJLQohnqqk1bGboEVVOupHn
	 7fVv6OqZFB6s0CdDxe1xPIIWMiS/SrBNngrYR2pM9JV/JMABAivuYtoe2Olx3eY0CxkrW
	 F2+oFRgdX7ZjywSCgmA3LSjGsYOQbaECj/0qIOX+RE9B4W7YYL+hylZqKIHO1ZzSbjsQs
	 PNSizckC9D0EZrtehzvv2BWdCXlWuJEXrC29oe4DwCSSB4+ect4ZwMwe3RC/jHATr2jRh
	 gTGCldcPiI9U0EA/mFk9sEuQhYeo8EvW3F5Oi8zl5I+BmDExhZh47N9k3vtqJG+Y7/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365327;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=zBzxtvq+ii8pXCj05b6gbTJ047E6+9DyHEtc7PeLBc0=;
	b=Ss7J1qxzZYSUFhFSpY0I4tlLFAI7WzO/YTJZWuNGHz7r4McUt6dXIiYJ8Q5ta3KCLsr7
	 W1GMPW5zd4E4eP69eez4YpYVz+OEkXbpmgD1p/iZWvFV6Gns9slchsrQUngQDfFaWh55R
	 mYCJi3QAjLtItJX17TmK4sjSxCq6wbbUORh9crUWwbFQW4971RYqvr4DcUlkw6YzlqHPT
	 o+8WI5ltCNDjaEW0N0feGSafxrVi3zj/5v28v4ypTykluflOeFjE3uPjHeAd7mJvEzui1
	 YmKZse0bfZeLvtSy0EqoDRKMGZfYeGC48oJcqt8Kjkh5s9WX8cQp1qUK4qcJW3f1lhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b="Iml/s6e0";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="gSXYK/om";
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9515606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9515606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=Iml/s6e0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gSXYK/om
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 0F7A6EC01D4
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:02:06 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 30 Oct 2026 09:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793365324;
	 x=1793451724; bh=zBzxtvq+ii8pXCj05b6gbTJ047E6+9DyHEtc7PeLBc0=; b=
	Iml/s6e0yM6qrdY+GlK1BRdRE/veRE9v/Trgl0yxR25Zn4vTcSI+Z6Z0v41yJwDn
	GKILw9Oa3zH9hHvyvNDr/gUfbm42XBVgS93bCxy9MMTuvda4xFqTuuGav9ivIS5i
	NRvwq4VAu9OkSKKfdetecs1lQ7aUPOFbetCMgVd6A9A03DLPrpYR7CIVE4sE+JkG
	fo7Z4meYVLB3SvN2zVc9gaiPjCv7UaRgWGrSs3CDrCwSOYUpARyYl5f8DD4w/ZNW
	V2SJ5AQeuQatQMIZ4GnpOwXZQvOcc/Aff8bJWQVii0gX97Ktx2F1k1Da8q4JJBEn
	76rZn1YCHjXbYXl51Fu5aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793365324; x=
	1793451724; bh=zBzxtvq+ii8pXCj05b6gbTJ047E6+9DyHEtc7PeLBc0=; b=g
	SXYK/om5Xx+XUWu76wwDY4+4NusNhwx0Uhu4H77j6nZNeMAjtqUTb6rgj05i4puk
	CFH+Dx7OalETL/eOtOa4/9Q7rSsUMtmEvTbMSWX6tK0tsN90B+stmBUPbK/mNeR3
	fIZm0eFIglISHJkS303cGfeXqbT+4QJml6cnMK1BsCUZZ9SDr8rZOwoE1ycT1cKQ
	aNH7RquKF+IsZXjxtemvdNU0hvgaM/QLbBMgRAdb6z+V+B0p9TuC8z+JmPRJ2KYL
	qPbPNa3ygFkgOhPRLDCwKdQiIwOPWHWJ5ExIK27Fq0SbtaOZK5ybAD8SLtoRG6ir
	qoFPVeFX4aRs6dxkCWVyg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793365324; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:jJzQPS2YsyHCk+pg6WG3nzPGUDLzDkdZkLeQcim358kMeaB
	mZ+81aJi7kaOFKWdNlVf0lpJ651aYk6JaNRMzKg4ZC00i4/2ihQPPgWb24ub4+bh
	pmy+K7ZwgN91gQS0kxwgyptaqJaQYbAfec4HishSZEiH3mDtLbvoNNrgUWruc3uH
	HRc25unm8Wz+I/ugC121fcQSEcoUkKFd1q0N6LYm6DN/5oLB7Ymvf0maeGSU8tWy
	mmEJIbwgHGqpLqQK9giNImbMUTxDHa4xNl/v4+UjKDBTGvLd/1eSVu9du7Qldc+l
	QeYZkIqXvbNWTnYOaT4sBtlqMhyLUP+EH3GITLQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2ZnlqryA6Wa/wrB/ZfOqS3Omnwn6h3UiWK0BGuTDXoA=:HnF+5e/kXhVZCDzjqfZabPcGoGxgxmWb7UlaiWPBfy0=;
X-ME-Sender: <xms:TJXkapqkL5zUSnFaiM6dymNr5gCrwS7kr6LSTgy-v3m-BXuD2XoBfg>
    <xme:TJXkamdFsnMqygSf1cEbqpt7R68pH95Jw3MfzjEJH6_TrJdxsEK61xGhLoJiA-brl
    p3ty5sQWKSCBX-4vldyLg3MRBCTctlxax3ER78OxEyHxfS4ry3A1Q>
X-ME-Proxy-Cause: dmFkZTFlHryysdre3Cry/acwfXpPS7/rGmuDvNf6Bfzx25LzmH9kMfZkHXOHYHp5eYw8mK
    6bvcuujThT42+FCPXAOXjQTgiQbe9Utwadp45ulK7Z9vgawzCV6HIVDPmBsUhER0CFMHKD
    MdNf/p4H1Jp8dBWzIiU0EMDafl17AD4hNqmSDTt5lgqoJU8yDFzPfuIz4/E/eil1LzLdz+
    Z8CBxIUlUdQYFNLgiT5Ei/llSVP0NIoweZVLeCVv2alYuOJxWRcbAU1jKtTkx3fE3o5CEc
    lX8JZIIxzWb7v2ZtMtA5BUiXGnhZZcfEyD4IDX3KB0MT+fDQb51u+J7RXkgyerF7h4EOOr
    BQtvXtphH/BLQIXjJQeAfEsq1Ei6+j2Jvvsmj6kUBIH9qeOaX7OoRYyqDjmB/j6jusOfgj
    nRTYfAi03/ewv+FxV2gkjzw3T0L4cQnhG+kREnbucfypbcHa/mL6I2uysULTcR7TulM3/5
    vNJw7pmXeJ2py19e3+8bPXFI4NWCzRcB/LMR2S7mD88oIGsqpccWmrHXc12cLJVa7DJBAb
    jMrJztH3L7moPuUcOD62parvrG99vgZrm3eJTvBGhlS343xBz9fqorWgQqJQoFp9IKK/Vi
    HIUaRdMyWoaY3Wd/W1dAGmOkqTFPZZUTE4sJ9oMy34CTaSP008ChDRyHbzXw
X-ME-Proxy: <xmx:TJXkanRWrZZvFiGq_65BG8STRoaGb5zBeKGoNyGfxz6K9P90WAguHw>
    <xmx:TJXkai1nt4BIjnmqFP_naju3OXtC4M-JYqC2AZLhM28VTzzmCj1ueQ>
    <xmx:TJXkasu3HyyR5ZT98XzEV-168EXBZHCJhO2s6y95Ser5-3GQrLBJFw>
    <xmx:TJXkaoieLlCOOV2L4Xeo2mdSGR4mgnLM0YAqf-fZHYYVL0_O10nBHQ>
    <xmx:TJXkajkz-xfAV7LLh6x0xCmD5iejhkt4B3vfZ34cQoi3ROjasMaZmlAH>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id A25542C00082; Fri, 30 Oct 2026 09:02:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AX8iY5gfVrnV
Date: Fri, 30 Oct 2026 09:01:44 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Vishnu Sankar" <vsankar@lenovo.com>
Message-Id: <6e562b92-afbe-4c01-a703-81d55f2fdc65@app.fastmail.com>
In-Reply-To: <20261021200841.75370-1-vishnuocv@gmail.com>
References: <20261021200841.75370-1-vishnuocv@gmail.com>
Subject: Re: [PATCH] HID: lenovo: Add keyboard backlight support for the X13 detachable
 folio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Vishnu,

On Wed, Oct 21, 2026, at 4:08 PM, Vishnu Sankar wrote:
> The keyboard backlight of the ThinkPad X13 detachable folio is reached
> over HID rather than through the EC, so thinkpad_acpi exposes nothing
> for it and userspace can neither read the level nor set it.
>
> The folio takes and reports the level over the same vendor reports this
> driver already uses for the Fn-lock, mute and mic-mute indicators, so
> register a kbd_backlight LED class device on top of them.
>
> The firmware cycles the level on Fn+Space by itself.  Report the
> resulting state to the LED class device instead of the keypress, which
> userspace would otherwise act on a second time.
>
> Tested on a ThinkPad X13 Detachable (17ef:62af), BIOS R3IET32WM.
>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
>  drivers/hid/hid-lenovo.c | 122 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> index 3976d7b53b14..956c26128f40 100644
> --- a/drivers/hid/hid-lenovo.c
> +++ b/drivers/hid/hid-lenovo.c
> @@ -24,6 +24,7 @@
>  /*
>   */
> 
> +#include <linux/cleanup.h>
>  #include <linux/module.h>
>  #include <linux/sysfs.h>
>  #include <linux/device.h>
> @@ -51,6 +52,8 @@ struct lenovo_drvdata {
>  	struct mutex led_report_mutex;
>  	struct led_classdev led_mute;
>  	struct led_classdev led_micmute;
> +	struct led_classdev led_kbd_bl;
> +	struct work_struct kbd_bl_sync_work;
>  	struct work_struct fn_lock_sync_work;
>  	struct hid_device *hdev;
>  	int press_to_select;
> @@ -75,10 +78,19 @@ struct lenovo_drvdata {
>  #define TP10UBKBD_FN_LOCK_LED		0x54
>  #define TP10UBKBD_MUTE_LED		0x64
>  #define TP10UBKBD_MICMUTE_LED		0x74
> +#define TP10UBKBD_KBD_BL_LED		0xc4
> 
>  #define TP10UBKBD_LED_OFF		1
>  #define TP10UBKBD_LED_ON		2
> 
> +/* Above the levels, 0x04 selects the firmware's own automatic mode. */
> +#define TP10UBKBD_KBD_BL_MAX		2
> +
> +static bool lenovo_has_kbd_backlight(struct hid_device *hdev)
> +{
> +	return hdev->product == USB_DEVICE_ID_LENOVO_X13_TAB;
> +}
> +
>  /* Function to report raw_events as key events*/
>  static inline void report_key_event(struct input_dev *input, int 
> keycode)
>  {
> @@ -87,8 +99,8 @@ static inline void report_key_event(struct input_dev 
> *input, int keycode)
>  	input_sync(input);
>  }
> 
> -static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 
> led_code,
> -				    enum led_brightness value)
> +static int lenovo_send_led_report_tp10ubkbd(struct hid_device *hdev, 
> u8 led_code,
> +					    u8 value)
>  {
>  	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
>  	int ret;
> @@ -97,7 +109,7 @@ static int lenovo_led_set_tp10ubkbd(struct 
> hid_device *hdev, u8 led_code,
> 
>  	data->led_report[0] = TP10UBKBD_LED_OUTPUT_REPORT;
>  	data->led_report[1] = led_code;
> -	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
> +	data->led_report[2] = value;
>  	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 
> 3,
>  				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
>  	if (ret != 3) {
> @@ -114,6 +126,33 @@ static int lenovo_led_set_tp10ubkbd(struct 
> hid_device *hdev, u8 led_code,
>  	return ret;
>  }
> 
> +static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 
> led_code,
> +				    enum led_brightness value)
> +{
> +	return lenovo_send_led_report_tp10ubkbd(hdev, led_code,
> +			value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF);
> +}
> +
> +static int lenovo_read_led_state_tp10ubkbd(struct hid_device *hdev, u8 
> led_code,
> +					   u8 *state)
> +{
> +	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
> +	int ret;
> +
> +	guard(mutex)(&data->led_report_mutex);
> +
> +	data->led_report[0] = led_code;
> +	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 
> 2,
> +				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
> +
> +	if (ret != 2)
> +		return ret < 0 ? ret : -EIO;
> +
> +	*state = data->led_report[1];
> +
> +	return 0;
> +}
> +
>  static void lenovo_tp10ubkbd_sync_fn_lock(struct work_struct *work)
>  {
>  	struct lenovo_drvdata *data =
> @@ -725,6 +764,7 @@ static const struct attribute_group 
> lenovo_attr_group_cptkbd = {
>  /* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn 
> keys*/
>  static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 
> raw_data)
>  {
> +	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
>  	struct hid_input *hidinput;
>  	struct input_dev *input = NULL;
> 
> @@ -764,6 +804,15 @@ static int lenovo_raw_event_TP_X12_tab(struct 
> hid_device *hdev, u32 raw_data)
>  			return 1;
>  		case TP_X12_RAW_HOTKEY_FN_SPACE:
>  			/* Keyboard LED backlight toggle*/
> +			if (data && lenovo_has_kbd_backlight(hdev)) {
> +				/*
> +				 * The firmware has already cycled the
> +				 * backlight; reporting the key as well would
> +				 * have userspace change the level again.
> +				 */
> +				schedule_work(&data->kbd_bl_sync_work);
> +				return 1;
> +			}
>  			report_key_event(input, KEY_KBDILLUMTOGGLE);
>  			return 1;
>  		default:
> @@ -1178,6 +1227,60 @@ static int lenovo_led_brightness_set(struct 
> led_classdev *led_cdev,
>  	return ret;
>  }
> 
> +static int lenovo_kbd_bl_brightness_set(struct led_classdev *led_cdev,
> +					enum led_brightness value)
> +{
> +	struct hid_device *hdev = to_hid_device(led_cdev->dev->parent);
> +
> +	return lenovo_send_led_report_tp10ubkbd(hdev, TP10UBKBD_KBD_BL_LED,
> +						value);
> +}
> +
> +static enum led_brightness
> +lenovo_kbd_bl_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct hid_device *hdev = to_hid_device(led_cdev->dev->parent);
> +	u8 state;
> +
> +	if (lenovo_read_led_state_tp10ubkbd(hdev, TP10UBKBD_KBD_BL_LED, &state))
> +		return led_cdev->brightness;
> +
> +	if (state > TP10UBKBD_KBD_BL_MAX)
> +		return led_cdev->brightness;
> +
> +	return state;
> +}
> +
> +/* Reading the state sleeps, so it cannot be done from the report handler. */
> +static void lenovo_kbd_bl_sync(struct work_struct *work)
> +{
> +	struct lenovo_drvdata *data =
> +		container_of(work, struct lenovo_drvdata, kbd_bl_sync_work);
> +	enum led_brightness value;
> +
> +	value = lenovo_kbd_bl_brightness_get(&data->led_kbd_bl);
> +	data->led_kbd_bl.brightness = value;
> +	led_classdev_notify_brightness_hw_changed(&data->led_kbd_bl, value);
> +}
> +
> +static int lenovo_register_kbd_backlight(struct hid_device *hdev)
> +{
> +	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
> +
> +	data->led_kbd_bl.name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s::%s",
> +					       dev_name(&hdev->dev),
> +					       LED_FUNCTION_KBD_BACKLIGHT);
> +	if (!data->led_kbd_bl.name)
> +		return -ENOMEM;
> +
> +	data->led_kbd_bl.max_brightness = TP10UBKBD_KBD_BL_MAX;
> +	data->led_kbd_bl.brightness_set_blocking = lenovo_kbd_bl_brightness_set;
> +	data->led_kbd_bl.brightness_get = lenovo_kbd_bl_brightness_get;
> +	data->led_kbd_bl.flags = LED_HW_PLUGGABLE | LED_BRIGHT_HW_CHANGED;
> +
> +	return led_classdev_register(&hdev->dev, &data->led_kbd_bl);
> +}
> +
>  static int lenovo_register_leds(struct hid_device *hdev)
>  {
>  	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
> @@ -1344,6 +1447,7 @@ static int lenovo_probe_tp10ubkbd(struct hid_device *hdev)
>  		return -ENOMEM;
> 
>  	mutex_init(&data->led_report_mutex);
> +	INIT_WORK(&data->kbd_bl_sync_work, lenovo_kbd_bl_sync);
>  	INIT_WORK(&data->fn_lock_sync_work, lenovo_tp10ubkbd_sync_fn_lock);
>  	data->hdev = hdev;
> 
> @@ -1374,7 +1478,16 @@ static int lenovo_probe_tp10ubkbd(struct 
> hid_device *hdev)
>  	if (ret)
>  		goto err;
> 
> +	if (lenovo_has_kbd_backlight(hdev)) {
> +		ret = lenovo_register_kbd_backlight(hdev);
> +		if (ret)
> +			goto err_leds;
> +	}
> +
>  	return 0;
> +err_leds:
> +	led_classdev_unregister(&data->led_micmute);
> +	led_classdev_unregister(&data->led_mute);
>  err:
>  	sysfs_remove_group(&hdev->dev.kobj, &lenovo_attr_group_tp10ubkbd);
>  	return ret;
> @@ -1477,6 +1590,9 @@ static void lenovo_remove_tp10ubkbd(struct 
> hid_device *hdev)
>  	if (data == NULL)
>  		return;
> 
> +	cancel_work_sync(&data->kbd_bl_sync_work);
> +
> +	led_classdev_unregister(&data->led_kbd_bl);
>  	led_classdev_unregister(&data->led_micmute);
>  	led_classdev_unregister(&data->led_mute);
> 
>
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> -- 
> 2.56.0

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
