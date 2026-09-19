Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF331E838
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793814; cv=none; b=aa5yXywIP58Wnpvfi3wRJlXo/ZRnYs2bYdLDlhKRFv3WCObJhKlRIdXqqCdQQNfneCptWxNOea4GPOdXxc54TOfOBx4VyQN+jhAZURIuhhaU9jGoHte96gd7Pbt9RsY/uUVGR7N9Fz9mheK7mPV3Vg5MrF0FMr6cQtTDmvBapCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793814; c=relaxed/simple;
	bh=IptSlcgDNMgPX65l8P/ng9Wz/P1dZIyMV6wSxZ6f5JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTp4vjZ+TMY/GjVBQGvqdzLdRt6gngXknXx2+GILuJULkyAeniV0DeJYiOzRg23alpLBwjDicn8HVNjFx45K7i0FgmhmXBHzQWrnD8G1pj+Y9ZesdGx8jp647IQsQKUGdZEnwey967hiksbMxyNJwbgEIiThcZoFDOW5IqrMbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3ADj2un; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3ADj2un"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b1a806664so234974a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789793811; x=1790398611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FaYMWoLtfMpPGm9qJCsSSHWDytmWP7yJQl5baQhbXs=;
        b=I3ADj2unORZbLGtqeHzRc8fACUbxg9y3V1ae81qf24w7Z9NaGUMXgeooropJuNsrcj
         L71x/+JZ3jydzSmkaHDGc5hOt7GgiFYeSoHoZxfJEojK009cQM748Zgs2CX7WHb740u2
         J7lbhC05aZlw5takiHTJ+kI2LrLLe0FfqYN9okD35vXJnDO60ILyixOTNdm1q5wa6X2V
         kuYGIHd2lEbZhA5SpfuUWMAtYd/8ePSfQcvqbDEdaritc1+WwclUzNLlZUrc3QTk8nAc
         pOBHMzZscK8sNjsdLYPeBhE2UqVMCRX8GmtmishR6xH+FmfDBybJRb9YysVj73pWHq1A
         A2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793811; x=1790398611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FaYMWoLtfMpPGm9qJCsSSHWDytmWP7yJQl5baQhbXs=;
        b=UX7oag7zAjDFAkBQQ0nWvIBXc3wbdbyvFpLNZeIJKqZdIdsQB41Ekks29lq/wpptfE
         nTKByaXURsWFFuABiFs6M7A3nzulDu0eHd76o2oCox7Ee0Cnsf82oxuL7lqsVm6TFrPx
         rPpAMtWtDayY10bRC45zlKQHMSoCseWGObYADaQ4+4R8lockPwOgsI/w8Bro1Ol6w/GP
         vqP4sGBk01qccD+PWpdmHkD54BFrILkd9IEo5asb6+xcES5mnk6nIJ5K8V723aKJEwW+
         nYWJee7JpMDOVTkETL1Q0WhXBE3dgiQU8Mer1XpQdAxNlUh7LU1LHmJ/e5cOuZsi6mQx
         56+g==
X-Forwarded-Encrypted: i=1; AKwUvByz7M6uEEKtNl/9kEIM+d07PKTT1Nb7joQjKDr+t7Ul6zk8sLfIOLLpqMgpFKbgOwp0GgNaEhcSOqpc5Oc=@vger.kernel.org
X-Gm-Message-State: AFuF++klofido4Snc9izjJKD3gcAU12gXPvaHcNBvvXi8rk12LCx/cQg
	Qvh1nWQ4ib0O84Ll8JBYIlZrZa9i5DEiKrMTGqaqMGb+aiZ4ZkDzHLOl
X-Gm-Gg: AYBFou0a9Ie3dtg9c3yZHfHrF0wqSzdZsh+UhKLXYKKWBmx/kXGt35oIvRia10K4/S8
	+lNdALJSwI+VcB4NxBu7wBRaqfsCw1+fIfytIydHf7s5j0EPB+K+vUCTV3Ze4eZnrAdKAvAVnX3
	LB8ZU/LD9pESKKRsQKrKoQhpK37wJBmOPqxuTi+cPYwwcO9V2rozxPVC4nJISru72KBs2FRdQry
	xAcbh3k8+02CZHmyWfvq0KOvcXR90Y1aBPUjYe540lyJvEDG3SAiXlVJsWQIfSAc6B27mamYUpp
	b/TfS6fVcgebE9dGPiXkXQSvCdVMTcx+RyFyc3yUYpQzLcPxG8M/hB0H779o+NxA8lZnnhWgC0x
	b24atpmPklrf9sm19Yu3OmJxKZLt7Pu/mSbONQdV7cnWjv0DtdVEhZ/B+hLg+GQY4Z/9KcVlmwR
	XIgZ1lWngHAvXLvm12e4FvcNE5joajpZk28r1U9oixSmgsT02PIAC2yxeeEJQSLzY1K01M7L26h
	FF8ovBmo5OK1lPfWzig
X-Received: by 2002:a17:90b:2ccb:b0:39e:2f57:67c8 with SMTP id 98e67ed59e1d1-39e599d6c1dmr8601655a91.4.1789793811182;
        Fri, 18 Sep 2026 21:56:51 -0700 (PDT)
Received: from [192.168.1.7] ([134.236.76.17])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-39e6ca871edsm2481133a91.5.2026.09.18.21.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 21:56:50 -0700 (PDT)
Message-ID: <aef1ba1a-aa9b-4ba8-9456-6a99d350dde2@gmail.com>
Date: Sat, 19 Sep 2026 11:56:44 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: qmi_wwan: add common Huawei modem IDs
To: jackyphuti <jackympoka22@gmail.com>, bjorn@mork.no,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Copilot <223556219+Copilot@users.noreply.github.com>
References: <20260918193645.59374-1-jackympoka22@gmail.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260918193645.59374-1-jackympoka22@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-19 02:36, jackyphuti wrote:
> Add common Huawei product IDs to qmi_wwan fixed-interface mappings
> for broader generic Huawei modem coverage.
> 
> Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> Signed-off-by: jackyphuti <jackympoka22@gmail.com>
> ---
>   drivers/net/usb/qmi_wwan.c | 38 +++++++++++++++++++++++++-------------
>   1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> index fdfdcf24ddcf..2809b6985f7a 100644
> --- a/drivers/net/usb/qmi_wwan.c
> +++ b/drivers/net/usb/qmi_wwan.c
> @@ -216,10 +216,10 @@ static int qmimux_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>   		if (netif_rx(skbn) != NET_RX_SUCCESS) {
>   			net->stats.rx_errors++;
>   			return 0;
> -		} else {
> -			dev_sw_netstats_rx_add(net, pkt_len);
>   		}
>   
> +		dev_sw_netstats_rx_add(net, pkt_len);
> +
>   skip:
>   		offset += len + qmimux_hdr_sz;
>   	}
> @@ -946,6 +946,13 @@ static const struct driver_info	qmi_wwan_info_quirk_dtr = {
>   };
>   
>   #define HUAWEI_VENDOR_ID	0x12D1
> +#define HUAWEI_PRODUCT_E1750	0x1406
> +#define HUAWEI_PRODUCT_E173	0x140c
> +#define HUAWEI_PRODUCT_K4505	0x1464
> +#define HUAWEI_PRODUCT_K3765	0x1465
> +#define HUAWEI_PRODUCT_K4605	0x14c6
> +#define HUAWEI_PRODUCT_E1820	0x14ac
> +#define HUAWEI_PRODUCT_E173S6	0x1c07
>   
>   /* map QMI/wwan function by a fixed interface number */
>   #define QMI_FIXED_INTF(vend, prod, num) \
> @@ -1024,23 +1031,23 @@ static const struct usb_device_id products[] = {
>   	},
>   	{	/* Novatel USB551L and MC551 */
>   		USB_DEVICE_AND_INTERFACE_INFO(0x1410, 0xb001,
> -		                              USB_CLASS_COMM,
> -		                              USB_CDC_SUBCLASS_ETHERNET,
> -		                              USB_CDC_PROTO_NONE),
> +					      USB_CLASS_COMM,
> +					      USB_CDC_SUBCLASS_ETHERNET,
> +					      USB_CDC_PROTO_NONE),
>   		.driver_info        = (unsigned long)&qmi_wwan_info,
>   	},
>   	{	/* Novatel E362 */
>   		USB_DEVICE_AND_INTERFACE_INFO(0x1410, 0x9010,
> -		                              USB_CLASS_COMM,
> -		                              USB_CDC_SUBCLASS_ETHERNET,
> -		                              USB_CDC_PROTO_NONE),
> +					      USB_CLASS_COMM,
> +					      USB_CDC_SUBCLASS_ETHERNET,
> +					      USB_CDC_PROTO_NONE),
>   		.driver_info        = (unsigned long)&qmi_wwan_info,
>   	},
>   	{	/* Novatel Expedite E371 */
>   		USB_DEVICE_AND_INTERFACE_INFO(0x1410, 0x9011,
> -		                              USB_CLASS_COMM,
> -		                              USB_CDC_SUBCLASS_ETHERNET,
> -		                              USB_CDC_PROTO_NONE),
> +					      USB_CLASS_COMM,
> +					      USB_CDC_SUBCLASS_ETHERNET,
> +					      USB_CDC_PROTO_NONE),
>   		.driver_info        = (unsigned long)&qmi_wwan_info,
>   	},
>   	{	/* Dell Wireless 5800 (Novatel E362) */
> @@ -1228,8 +1235,13 @@ static const struct usb_device_id products[] = {
>   	{QMI_QUIRK_SET_DTR(0x05c6, 0x9625, 4)},	/* YUGA CLM920-NC5 */
>   	{QMI_FIXED_INTF(0x0846, 0x68a2, 8)},
>   	{QMI_FIXED_INTF(0x0846, 0x68d3, 8)},	/* Netgear Aircard 779S */
> -	{QMI_FIXED_INTF(0x12d1, 0x140c, 1)},	/* Huawei E173 */
> -	{QMI_FIXED_INTF(0x12d1, 0x14ac, 1)},	/* Huawei E1820 */
> +	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E1750, 1)},	/* Huawei E1750 */
> +	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E173, 1)},	/* Huawei E173 */
> +	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K4505, 1)},	/* Huawei K4505 */
> +	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K3765, 1)},	/* Huawei K3765 */
> +	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K4605, 1)},	/* Huawei K4605 */
> +	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E1820, 1)},	/* Huawei E1820 */
> +	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E173S6, 1)},	/* Huawei E173s-6 */
>   	{QMI_FIXED_INTF(0x1435, 0x0918, 3)},	/* Wistron NeWeb D16Q1 */
>   	{QMI_FIXED_INTF(0x1435, 0x0918, 4)},	/* Wistron NeWeb D16Q1 */
>   	{QMI_FIXED_INTF(0x1435, 0x0918, 5)},	/* Wistron NeWeb D16Q1 */


Hi,

The whitelist in qmi_wwan is based on numerical vid and pid,
redefining them with vendor name and product strings fills
no function. The driver is not a cross reference list for
numerical to name lookup.

Which of the products you are adding support for have you
tested and confirmed working under the qmi_wwan driver?

For which of the products do you have a verbose lsusb listing
so that you can confirm interface attributes before adding
them to qmi_wwan?
Please include these lsusb listings in the patch!

Here are my comments by product:

12d1:1406,1 only 2 endpoints, not qmi.
It is a serial AT cmd port according to the Huawei Windows driver.

12d1:140c,1 already supported, no need to redefine

12d1:1464,1 is qmi, interface already blacklisted in the option driver 
so can be added to qmi_wwan

12d1:1465,1 interface has ecm attributes, is probably qmi but this must
be confirmed and the interface must be blacklisted in the cdc_ether 
driver BEFORE being added to qmi_wwan!

12d1:14ac,1 already supported, no need to redefine

12d1:14c6,1 already supported in qmi_wwan by its interface attributes

12d1:1c07,1 jungo_ecm according to Huawei proprietary driver, may
well be qmi but that has to be tested on a physical device.


thanks
Lars
