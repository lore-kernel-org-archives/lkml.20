Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625342;
	b=goLHY55wOtwaU+YKG/97bBkOHZ+3O1C1C5drjdaBwyrkoRGvxl5JGkJ40nHhlXoEebcH
	 ylAQ+6EwFDyIasDUGNo5q2H3hxmy10puO34N3jQC5SdcZeQO01q5iAmVdH/q26qvP40Dz
	 Hg1mXM+TZzCXHlJXAX03RRPS2A6WrxMLi5/06MtjL4HvcZkp9lukWVcni70aU6TwCW3RP
	 mIkDfQdwQmc7bKwGW6sMtZ419OSO446rd8XAEwbDa5M5g8qxdbcuXbFQtm6hW2g4CAGCw
	 7VTHDV6szSArT5NEGrqQ57L8vltCnnuu/pd/BSBm6C4V5b1BLE3qnuaoTQ0TuoXqUsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1UeORzr0jILYUzBoQp5r7mHLl9wS32D/iF9U4cTOBto=;
	b=sYkzdkeu75lS3eziMmn5fswiIkEIo5msfGyiXW5HFBhliQb0eaWflE4P9pdzM9OvOvc7
	 vFxy6bS6H45NdjffM8POBJuo8Hc6pXnmv8hnkDnhiqLKNinzkczobqpoh+RREBoiAtsmE
	 kytkkYzM9u0VkUZcPaV0GE/rA0W9+cCW2+d840OF/mcoYBcplGTBUs93UWVOSH+54H3Et
	 9kCn9V9wTWRysGoY+8eZbgdNOVwjo2e0jO38k+2QlTiiCh8vYip5+gB7ldUW7oLhyi6Ou
	 H+4sstXJSOQaO12yQAKZgdLqGIiwH5+sgz/coA4NIDMlzRNthqoUiQB5KPCerXbHnXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BwsIz3YJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7D1606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC7D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BwsIz3YJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so17999025e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625340; x=1794230140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UeORzr0jILYUzBoQp5r7mHLl9wS32D/iF9U4cTOBto=;
        b=BwsIz3YJQEzEHaYK8rz/bk0ZFueVriUMvLPsNpD9r29fpr6io+6E8jgRFblCOnWXjQ
         xBZFJ9/rLpzmY2cWb3QEoFoEZ+4TS/RC78tIt0M15alYFmxt+8K+NIF21qwNNZ42Rj6O
         vFpw+2ZSgur6w7/GpqzppZJmyfKeJb5iU2Q7Nrx6dIehQVHBDLfXpaJaydM5YslbTHEq
         nNDohI8r4cCWOZkuVuMF8q0c3vo6JmA/AOv/KtPUpWylOcbKITEjw+2v3Fy6Fbcz7b2m
         AdIq8+3DEtXwCbzst/AEBX+PhTvzabOzUVpunuE4MqFdB/zJa4cCTqiIxsnvu0HwGg5m
         VqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625340; x=1794230140;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UeORzr0jILYUzBoQp5r7mHLl9wS32D/iF9U4cTOBto=;
        b=oYcMnchBVSovlmuk7jW7+O61d1EUPGO5gc+ZXptPL8eLoQrU9NFDwNGvC7KphRac0h
         tastp1P0qQE5gGyiREUE+iAy9ab0hCffVOJ1eurySm8wNUU6Fe9BaQJWjvUp66tRtK5k
         GHKpMzJ3k9BN7x28Z3a1VmIdfLSIEEhajFAFvXmASX0tVdFwRpqq5IPsmPonME10zMx1
         PIJVBMnblGkN3QL7T+UOY2gXlhzghNtY68ghy0PyTx2WhGaJtNXs5LFK2Q7Zbn8IWDfM
         txkOdfDQn3pJ09GS4rwUWWpgSUwCQoflzvl+TCpHxyxuWZBOV3cSBB6F6HGePaX11KLR
         oUyg==
X-Forwarded-Encrypted: i=1; AKwUvByTep69ptk2gm2B4twwyj3k3UkW0p/94QU0JVsBrQJ77/mb6Zj2SG5dEqd9awvBUO2VuHdD3tyQc2rNWgY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiwwtAaaf2N8WULI8DL/7eW//DHOXDgRdZsAMsGu9+rxdNyAdp
	Kr3uM18xcAHTJmJBvj4XPTG+dJrmIN6DSSYy9liVAKJra3NXl/CXTJi59sUr1xVV7nGeQdCL7jQ
	ztvR5
X-Gm-Gg: AYBFou3BPyx4ohPtj7rZq2MRiXCIs0SN27Or9BPNTM3dvZsWpwftlTTiTffEPydLbh+
	QLATF3Z5R+VQHy44JzgHtB+qM8+j7WcT2Cn06hVE3+tz3pHXVbZ6gnzhZ1J8DBRADBUgCWt0Jca
	ULkKbm88nfH/7Hpp2w9Zg0Nzup9Wxl5dnDADZZur7lGaPdKoBaYVS/UADwiUk8myqXLZ+97Tvn1
	gDp7/ZUKT6mjgSR7Wxgt7EcewDtPPAIatMcV7+nU9fqvWANtbFTxfnLqO65WjTOL6s5AbwMaJYa
	+VFV+kQ4XZklJXxhdgRk6VmesxhXmfPE6U4u0Zdo1L+zrrCmrPSxypQmQgLj0BmULxWEjaZo84m
	xgDZ/Fz820Jo6hc4QzL8dDiGOibwtp27rih5QY2zYoqVk6c8yf0Com2pzu0Dojl9iXf24vIM8wT
	QBN5pe05Xa8kQWhlgvvVAOu7MvHmEmj42iARlUpMZOT2LpsdsePlxhEH01/Pnjs2gc8rDo6qhho
	uWx2dI3lcn6XSbse46RTrhrkObHnzc85J36d/X7i+R8phQ0nLt41Fs1mej6frzqU2+DeXJn8wQC
	Kc8Eqb4+LRDRiXZp1ndJR50RSzMHlvaQVtapgVvhTLQMNipFGT9XAVHWSH9v9zhsSII5zKkxegN
	jOSmn
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr225943345e9.18.1793625340091;
        Mon, 02 Nov 2026 05:15:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm514761985e9.15.2026.11.02.05.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:15:39 -0800 (PST)
Message-ID: <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
Date: Mon, 2 Nov 2026 14:15:38 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel-edp: disable the backlight at probe
To: Doug Anderson <dianders@chromium.org>, jimmie.lin@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dale Whinham <daleyo@gmail.com>, linux-arm-msm@vger.kernel.org,
 aarch64-laptops@lists.linaro.org
References: <20261026-sp11-bl-upstream-1-v2-1-efc84396adf1@gmail.com>
 <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/26 02:40, Doug Anderson wrote:
> Hi,
> 
> On Mon, Oct 26, 2026 at 6:14 PM Haipeng Lin via B4 Relay
> <devnull+jimmie.lin.gmail.com@kernel.org> wrote:
>>
>> From: Haipeng Lin <jimmie.lin@gmail.com>
>>
>> pwm-backlight can preserve the enabled state left by firmware to
>> support a seamless display handoff. However, panel-edp does not support
>> such a handoff. When probing a generic eDP panel, it powers the panel
>> on to read its EDID. If display pipeline binding takes longer than the
>> runtime-PM autosuspend delay, the panel is then powered off while the
>> backlight remains enabled.

So we don't support handoff _now_ but we may certainly support it someday.

>>
>> On the Surface Pro 11 LCD (LGD0779), leaving BL_EN high across this
>> power cycle appears to leave the backlight controller in an incorrect
>> state: brightness is pinned near maximum with a greatly reduced
>> dimming range. Subsequent brightness changes update the PWM duty, but
>> do not restore it to normal. Cycling the backlight off and on at
>> unchanged brightness restores the full range.
>>
>> The first drm_panel_enable() does not recover from this because
>> pwm-backlight still considers itself enabled and leaves BL_EN high.
>>
>> Disable the backlight at probe, after acquiring it and before enabling
>> runtime PM. This clears the firmware's enabled state so the DRM panel
>> core turns the backlight on after panel power and video are ready at
>> the first modeset.
>>
>> This also turns off the firmware display at probe on systems where it
>> previously remained lit until the first modeset.
>>
>> Verified on the Surface Pro 11 LCD by delaying display pipeline bind
>> past the autosuspend timeout. BL_EN now drops at probe, before panel
>> runtime autosuspend, and brightness control works at the first modeset.
>>
>> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probed by EDID")
>> Link: https://github.com/dwhinham/archiso-aarch64-sp11/issues/41
>> Suggested-by: Douglas Anderson <dianders@chromium.org>
>> Assisted-by: LLM
>> Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
>> ---
>> Can reproduce on an installed system on Surface Pro 11 LCD (X1P-64-100,
>> LGD0779 LCD) by booting with modprobe.blacklist=phy_qcom_qmp_combo then
>> loading that module manually after ~20s. This delays DPU component bind
>> past the panel's runtime autosuspend timeout.
>>
>> A/B tested against the same v7.2 tree:
>>
>> - Unpatched: panel VDD off 3.5s..20.5s while BL_EN stays high.
>> After the first modeset brightness is pinned near max brightness with
>> a "collapsed" dimming range. sysfs brightness writes still reprogram
>> the PMIC LPG. One bl_power off/on cycle at unchanged brightness
>> restores the full range.
>>
>> - Patched v2: patch provides the same full brightness range on boot
>> (stalled or not) as the v1 patch. BL_EN drops at panel-edp probe,
>> ~1s before VDD cut, rises ~0.5s after panel power at the first modeset.
>>
>> Tracing and functional testing on the SP11 shows unchanged sequencing
>> for fast boots (without artificial delay), DPMS off/on, and system
>> suspend/resume.
>>
>> Panels with shared/always-on supplies and no panel enable GPIO
>> may continue displaying the firmware framebuffer during the
>> runtime suspend before first modeset. With this change panel-edp
>> disables the backlight obtained through the backlight phandle at probe.
>> The DRM panel core enables the backlight again at the first modeset.
>> I have not tested this configuration.
>>
>> Testing on other panel-edp systems particularly with pwm-backlight,
>> would be appreciated.
>> ---
>> Changes in v2:
>> - Disables the backlight once at probe instead of
>>    in panel_edp_suspend() following Doug Anderson's suggestion.
>> - Only disable the backlight obtained through the backlight phandle.
>>    The driver's AUX backlight setup is untouched.
>> - Link to v1: https://lore.kernel.org/r/20261024-sp11-bl-upstream-1-v1-1-d39bfaf9afbc@gmail.com
>> ---
>>   drivers/gpu/drm/panel/panel-edp.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>> index 94bc54c3833a..d019f4165674 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -21,6 +21,7 @@
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>>
>> +#include <linux/backlight.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/delay.h>
>>   #include <linux/gpio/consumer.h>
>> @@ -918,6 +919,16 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
>>          if (err)
>>                  return err;
>>
>> +       /*
>> +        * Backlight drivers may preserve the state left by firmware,
>> +        * but panel-edp does not support seamless handoff.
>> +        * Runtime PM may power off the panel before the first modeset,
>> +        * leaving the backlight on.
>> +        * Disable it here so the DRM panel core enables it in the correct
>> +        * order at the first modeset.
>> +        */
>> +       backlight_disable(panel->base.backlight);
> 
> While still feeling a little ugly, I can't think of anything better to
> do in this case. Thus I'd say:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> I'd prefer to get a second opinion from someone else in the DRM
> community to make sure I'm not missing something, though. Neil,
> Maxime, or Linus W maybe?

I lack some knowledge, but when the display pipeline is probed
who's in charge of disabling the backlight when suspending ?

Why don't we handle the backlight state in the PM ops ?

Neil
