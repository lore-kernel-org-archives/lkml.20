Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140731;
	b=1PCjCr7KLUbQbkeYGyS9e2bb+ybGjr1B+13OKG+YMJ68rQgT5ozS3iI5VFEE7SmSlVRa
	 xAnFJq+AnZcBW5L4aQu/l+ijOFeooTYSaIND8uG4s+u8U8YUobLw9l8jhqII91f9qQTsO
	 iPUhRZx6hhLy9NZnnQHTkfrRxf0yntD7mOFfhlNEJGzFau0aBpVXUSOj+k6/Px48Iucb3
	 yKJtswbv2/h+mCMoD+U2BpfwjYOIjeWVqs6mMueHOp9JZaUAFC0E3mgkdY7/si93Eaem4
	 oA/S+Qs3x5plu9oI4wF6ghsPFe8UrKH9d6BD0XsXMjCSexImgPOrI+izsaDhi2i2N6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140731;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=yx8ncRKYNGa+7YMS3xP0ZSRzr5YwBBV35qzim36e95o=;
	b=1YGMSybuHm7YJMwzdsUrWAmLbsH0UQSpRSrNITcUG4A0dZVI+h9Bfpqiz+PJeV4IcqNZ
	 pamequriQ+jiXYYxTyPLDLj6jnBaWDuXh+Kq/ZkYtfo8JhlzNolryFP+6ZBgb4aS7UIFr
	 WdkmVbOJLoJNCQ2Wbu3tzcr9yeNE4wYSC1yNqtyBwC4aaNITCzTLHbLjzo2Vd6/sHo2UW
	 bQkxgf9wz5APIkscfxkgX1iL7N2RuAabgjJASTBtmFGbBLHwH556xkguJnhLo+av26yde
	 Kmlzak1yWA0ANoTVfPQAnpYQTfD1U4Jk4oIg35rjHEbd2oRaZ4AQz6cfMwj5Ctd4oFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28931606A31C;
	Sun,  8 Nov 2026 12:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28931606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnfbM0avBqlkabAA--.19995S2;
	Sun, 08 Nov 2026 20:25:25 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, oneukum@suse.com, vulab@iscas.ac.cn
Subject: Re: [PATCH] usb: cdc-acm: Fix urb reference leak in acm_resume()
In-Reply-To: <aqze0EBONnOb2gNF@hovoldconsulting.com>
References: <20260917161217.2161883-1-vulab@iscas.ac.cn>
 <aqze0EBONnOb2gNF@hovoldconsulting.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Sun, 08 Nov 2026 12:25:35 +0000
Message-ID: <20261108122535.261628-1-vulab@iscas.ac.cn>
X-CM-TRANSID:zQCowADnfbM0avBqlkabAA--.19995S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1fKw47urWxWFWrKFy7trb_yoWxtFXEka
	yjya17K3yUG3yxZF4jyF1a9rs5KwsxurnxG34rWw1Y934UZF1UXFW5K3s2k3WxAaykt3Z8
	Arn5t34Skw1j9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
	aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	ACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
	uYvjfUw_-PUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEFA2rv4qjUeAAAso

Hi Johan,

Sorry for the very late reply, and for the extra work. Thank you for the
review. Both points are right: the reference from usb_get_from_anchor()
should be dropped as a put, and acm_port_shutdown() needed the same fix. I
see you took care of both in 648b08aa37c1 ("USB: cdc-acm: fix urb leak on
disconnect"); it is in mainline and has already been queued for stable, so I
am not resending anything and patchwork 14825884 can be dropped.

On how this was found and fixed: I have described it once, in my reply to the
sierra patch, rather than repeating the same explanation in every thread.

I am working through the outstanding feedback by hand now and will not send
patches in bulk again.

Thanks,
Wentao

