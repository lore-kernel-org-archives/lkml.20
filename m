Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794535272;
	b=JkT1PA3dNO15c/2h3aP+CgE/2v3ERVYmsNTzns72kdoUQ4b1Orm5m9j2hUrfz+6MoefC
	 yDGGdJJSoHA5YYcOILJJXNLhQmlD18n3p9720zWiAmZf0dNn60SAIihrBTJ6tjdnbnx9O
	 hFSZ5ct/188enJOfmgzeKQVY4j6RrxV4WiB0gEUBLveeRPI18/ogzUclFGrGjiqNL7Qnd
	 sywYshvDiKvAYnEdLuEmE5q7P/vd04DPU/9N5osxF5PXiEhp9ZrOds5up5MuZhk3N6DeZ
	 5pfRIF5QjRuhkvw2Hx9HZ9Bb4+y6gSjFJKa0KClpqWQyHKcmjTJ3xmN+l4IU2N4hl1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+JYMMpCVPwHEySjKZ4MO385sOzZpk/O6E4s1/29JGB0=;
	b=vx6Rk40hiOfRTtq8DucRKaGXOZCci5V0WZmjB7ObE03rGccZnpHlnCoENTongcBuTcYL
	 rG6LZltdjWsu5ioZIeapKrZCQcZfkuDQvW8Zo3ysCwZTp25JAUyAPTbytYI9v8qxB81a2
	 6p/O0IEYdzH8nLoVs4NZqlWU1K2vRvSlShOxCso9stqjsC4gy87BbBAARk0ah+xMRm+gg
	 ikuVjdcUGdr8AE9PaTpHjp2CBS191b3XeMM3pwVovuz6zYIM1yZ9celWrVAmsNnZw0mbM
	 uWeIo8mMv77/xLglYepgm+FsBe2Xo+1N4Hw8GBRAAzYgyZzbZnKY6a62+NAPHA5y7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oTcgO0/C";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHrwBL0i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 730D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTcgO0/C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHrwBL0i
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACMt2K02642968
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+JYMMpCVPwHEySjKZ4MO385s
	OzZpk/O6E4s1/29JGB0=; b=oTcgO0/CxjO0e8z4oVQVprI6VdN15UA8lJQGJu1q
	tyBu/wAD8y1YGXonrQ0yztdHxEhCm3SwHIk1lMTpsGcUZDPuogrRC0K1FLmB2e2R
	py1qDcOWDo4FuUtr43UHcAagssgUhG8AuI2oT0NVCyrA6QVjVqjCLzIuZ8whj/O3
	+Np4j5FpijpQY8IqKUQd6+U9QSZUQpzZLbbFIpTOSMKI1CfTpRVW5Ow/faJ4rZ03
	DXyZ2oiGWQueegJxT2xdRXqWp4zKj/VbOJqSXVNQ1yW+s+YIyCy8fXOy9cCBNeLF
	ub3sa3SscZxq36yv4FsrOsB92oi6TfXJYFICDv01gL6JVA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ahp7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:01:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so549535eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794535269; x=1795140069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JYMMpCVPwHEySjKZ4MO385sOzZpk/O6E4s1/29JGB0=;
        b=hHrwBL0iiTFIws/G3GFyghNXvDmmENeZ1u+T1j/Iw3wpwnahHzVLs7zj/4H4rm3xtm
         CWsfbGavPmddrO5EiRu9oFLBF9zkVnQY9BYmgytliC3mqIj/XDSRMvjojRDAAaz5Pau7
         3eNYYYeVNkZHANRUMDy52Qwk6k0MMXPI0nFkgZzP7L7h9OxN3Bz87LTDWAUuqmAhe/0o
         JOkG3pJxK+yAfDOWcVaota6Ngi02Prr8Dc9W+P3BkiEL92xdXkpCvJ7XeD8O0I6jM808
         XF3Rkx5wO2yPnxLZ2NSc+QVH0M/bzJlsaf8gJB/CY3CDy0dJL/wjWsEDXvaaNncztZfP
         oufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535269; x=1795140069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JYMMpCVPwHEySjKZ4MO385sOzZpk/O6E4s1/29JGB0=;
        b=oZDxnENzZeEwaathe2m9LDSH+rEq/P87kVeFrwx70l6abZfvkQ2PS3A00M0fpIH+25
         VGsP5PhnD3UUGis3OcP0NLV0nPHTKZGZIozooYsWx/GwfwknZSGfyf9jayzenUxfO4UL
         KpHtq998rrGL03mig8S/HjfK0VLyj+wOx/rsq6+hQY5O+DPtKWDSBXT6Hwy17FJjekTt
         DAxb4biRj4bx/t1SQkEMn36AYfc0t9El7kQe0FkjCmLHTpMA4Yz5ePKgsYkAX2GX/n1X
         04LexyaHwn4bE4dCayCrfLD7yzcyA2YTFZ7/8giSIamWw7gI3pReK6B+qTSPSz9PAuSm
         swDA==
X-Forwarded-Encrypted: i=1; AL+hErEyRFX3ddCkhGdfHlkHa+V8JJXyFMJeeCCasliqq6W49g8MSz8x4au8ynbsicIX94oGmqaOdZl31WKTE3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3xHrpwMAmVcfCC2kgIk2iTEsTq8FAMhaqjjFaAN0u6QVNzRNv
	Y7X0kAJio04T8Ron5U0qQZWdpjlZhlb0Dtc0tgLBVaY3VOlx/aLgEf9eCQYQbRWjqF+TuWN5r96
	o8zrf1vMD899VqVmvs7aJMIGcoRPrDT70gAwZl8ybrTUSBD1GAtnWIn3r84y/GifSa3M=
X-Gm-Gg: AYBFou0ARQRvZ9AC0AHSoj9yiTIHU/jCdJMe0cetejKUTcLfXf/n1nalYX9ft/0yq2B
	0eNvKGJOOZYNvnSUq+cTiZ/0lUq3wEIdqiP0cd+WbV2S258AICGLPSghwX3oO8vDv3oB0KSJgnv
	+pUyknvUYOMwCAh2s2Ui0AgqC7aKNiqM+EUMwYHNWgelsj2XF7NW4wFWS5UWQIfOSTSLDwcYOad
	2vUYj+5sRKpzXob/VgNOtF3/I6vD+1twUVpH6YMXh+CjKhf9CZXkIjKCWINqXT0XljL48wrQJGR
	TYcgh9ffYso8Bq3NYYNYaKZr8jWlDw82BG67nVo/Y+NadZlOKVf4HPO3Y/HSyIeWfy1A4ermGsj
	srd0XtCKxLwRdyIfHb7H7psYQ7zpU1XLRM6omlztSzvO/DD7KR+1Xd1/ICw7a1Y8kRQHdEDsNY+
	7iL+HkZV39PlyBZBkhlwX+xg==
X-Received: by 2002:a05:7301:8617:b0:370:cc56:b61a with SMTP id 5a478bee46e88-37967dd6065mr854066eec.39.1794535269034;
        Thu, 12 Nov 2026 18:01:09 -0800 (PST)
X-Received: by 2002:a05:7301:8617:b0:370:cc56:b61a with SMTP id 5a478bee46e88-37967dd6065mr854021eec.39.1794535268371;
        Thu, 12 Nov 2026 18:01:08 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm2319806eec.17.2026.11.12.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:01:08 -0800 (PST)
Date: Thu, 12 Nov 2026 18:01:06 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel@collabora.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Message-ID: <avZvYlYyL3Doc8qt@hu-petche-lv.qualcomm.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAwNyBTYWx0ZWRfX2KbWCrD2XZY5
 R/AwQbqCQLpqUS0wSiVTVrIXclmiwnu3rFYuubb/Vdt/IdtHcwXO1GCkR1aGuxJSGZbYkivfE4C
 2iVa377aXNFFG23ALO7DatxKk68Sn/Q=
X-Proofpoint-GUID: nMr46w_0aiEmEalLACMfpKe3gxHA9c0c
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af66f66 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=QX4gbG5DAAAA:8 a=HK-piK3jiULfHIWbwDwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAwNyBTYWx0ZWRfXwmrTQCYXWE6Q
 YBvBOgu6SK5WFIb7yxeC8/Sf5RwpBRMiLU9JRTazU1G0YeWljkCGeEPlZ7P+0XdEiIGroGNqTdc
 S1eff0JOYy/q6ciYrQx0H67Ou5PFNSw0xhpgaVXZzX+Fu/kH9XF3Ee4ysBhXTYwES4x/4FH5Amq
 FU+oh433MLDndiQ6SNbS2XOM609xIE9hHAP/O02KkCBxEGcF2MXxLvlYRcDSXTR8YtPEavxzmbC
 Zk+wjcotTiKlKTiqWlung6N5HjSht9NEnHQYHtNHKT5qoY1DutpMqJUCJKNjFO1NFyk490RE7MG
 U9ljPHp4oWBUUe5xMbC9elrj9wSuWHfmvmAcFV6yThYytMJZJGgGM6ZkAWPuOBcz91vqvy4+KSl
 TAbOWPirkz7pMTrSFrgpmZQRE3tmbiPuaEwuvPgaIHjEr5ANeLDzJ9TpqjZ4zGkoplSgiNdQ4Z3
 VTwWdS8ws81JP1blAVg==
X-Proofpoint-ORIG-GUID: nMr46w_0aiEmEalLACMfpKe3gxHA9c0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130007

On 26-10-21 20:05:25, Sebastian Reichel wrote:
> - drop generic PHY reset notifier API; I discussed this series at Linux
>   Plumbers Conference with Vinod Koul and he prefers a local driver
>   hack/quirk instead

Hi Sebastian and Vinod,

Sorry to jump out late, do we really decide to use private callback between
USB controller and USB Combo PHY, and notify PHY's reset events for
controller? Many platforms which support USB/DP altmode feature need this
requirement, besides Rockchip, Qualcomm and the platforms use Cadence USB
controller and PHY also need this.

For this scenario, USB controller works at USB3 mode (also configures PHY for
USB3) first. Later, Type-C/DP event tells PHY that it needs to work for DP(4lane),
since this event doesn't go to controller now, sudden switch PHY from USB3
to DP (4lane) will turn off PIPE clock, and cause all controller's event which
needs PHY (PIPE) clock abnormal, that's the reason why controller needs
this PHY switch (reset) notification and let the controller know it needs
to work at USB2 mode from now on.

So, it is more like a general requirement, but not quirk for special platform.

Peter

> - rework USBDP and DWC3 rockchip glue for the local driver quirk
>   using direct function calls
> - Ensure that the reset handler in DWC3 is only called when the PHY is
>   initialized (and thus DWC3 is running)
> - Also set vbus in the last patch when dwc3 is configured to device only
>   mode (in contrast to dual-role mode being in device mode).
> 
> Changes in v16:
> - Link to v15 (sorry, I missed force setting the revision for this
>   part in the series split, so the series says v1 in the patch subject):
>   https://patch.msgid.link/20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com
> - Update first patch to also build the PM functions even when
>   PM is disabled
> - Add new patch for defining an empty usb_udc_vbus_handler stub
>   when USB_GADGET is disabled
> - Add dependency to Rockchip DWC3 glue, which disallows the
>   configuration with USB_DWC3_ROCKCHIP=y and USB_GADGET=m
> - Collect tags
> 
> Changes in v15:
>  - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
>  - Avoid #ifdef for CONFIG_PM in the new glue driver (Thinh Nguyen)
>  - Do not add #if IS_ENABLED around the DT compatible blacklist in the
>    generic driver, using the glue driver should be mandatory as the
>    generic driver results in arbitrary system hangs. Thinh Nguyen suggested
>    updating Kconfig for this, but did not clarify what that means.
>    Current Kconfig works the same way as the other mandatory glue
>    drivers.
>  - Split series to simplify review
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Sebastian Reichel (7):
>       phy: rockchip: usbdp: Track PHY power state
>       phy: rockchip: usbdp: Add reset hook support for dwc3
>       usb: dwc3: rockchip: introduce glue driver
>       usb: dwc3: core: add post PHY registration hook for platform glue
>       usb: dwc3: rockchip: add USBDP PHY reset quirk
>       usb: gadget: define stub for usb_udc_vbus_handler
>       usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
> 
>  drivers/phy/rockchip/phy-rockchip-usbdp.c |  82 ++++++++++-
>  drivers/usb/dwc3/Kconfig                  |  13 ++
>  drivers/usb/dwc3/Makefile                 |   1 +
>  drivers/usb/dwc3/core.c                   |  17 ++-
>  drivers/usb/dwc3/core.h                   |   9 ++
>  drivers/usb/dwc3/dwc3-rockchip.c          | 227 ++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/trace.c                  |   3 +
>  include/linux/phy/rockchip-usbdp.h        |  31 ++++
>  include/linux/usb/gadget.h                |   5 +
>  9 files changed, 383 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
> change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> 

-- 

Thanks,
Peter Chen
