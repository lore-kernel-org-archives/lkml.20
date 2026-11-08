Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140740;
	b=vD50YMJkqttZ0SIKVA9XS6Jh8uc3UYZkh74EjHfcM9AWUWersrhp0hPRVL7D/hUFr8+f
	 XaJvXrrLjlwtXGSSlXXeghDnsaa6gTGYcXvKg4zf4WDVTOTCBKKEmtgNWhtVoYFndIY9I
	 v0DS3e4jwciVkIkU6X6211MG/73oKGV2n4rxpstwyvZAvcS95im+jG9deQBn1jpDHyd7P
	 i1hfLKSoIvtlKWvg9cn5XRS1eRrOgHZ8ua7qWeFKEdvok/FZRzZ77xWBIQY6FIH40jeCx
	 YWGTQVKmH1Pd80E5t4p7E3QoNJ0d9zoC1UqspJvr1+kEszb2gdt9+g8VmngeckbX/lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140740;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=D0KRJi6+RGgHS5LIz0H5XgoE5Vf/bXd7FpJsJD9MDXY=;
	b=matqHz6LeU5gqIJZH6lBLM+vE3LeMpbau0TFDwTk9G5k+dpuCo+JX5OMYlWGUuSjvgPG
	 yuuRTqe/XiNxQrnIeJcrzZ5V35z4+EAqy/DpEkebhamj/hLCGn6gNqq8li0Lv4IyKWNhx
	 0woaD0H6i2vzWK4WmiViGYCHE3hQyfPWTJdCTekrbBxTg2ZBfHT/cW5HyTrpoQh7WYjj9
	 XBaCilpqYDi8ybYv4T9R3vJ10a48RgQjYRhWWw50L/Kx5UrwO2RJKjo/Pmo11OMuvkQF1
	 m8TJezWOvGQWbjvsUG97dVJNOjfVTvVNCTBHs14bF4/gyzhJq6y4/fZQY2q9Mtc/GAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849EE606A31C;
	Sun,  8 Nov 2026 12:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3E7k+avBqJUebAA--.22599S2;
	Sun, 08 Nov 2026 20:25:34 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mjg@redhat.com, vulab@iscas.ac.cn
Subject:
 Re: [PATCH] USB: usb_wwan: Fix urb leak in usb_wwan_submit_delayed_urbs()
In-Reply-To: <aquthjH6E8DQCzg1@hovoldconsulting.com>
References: <20260916165846.2085791-1-vulab@iscas.ac.cn>
 <aquthjH6E8DQCzg1@hovoldconsulting.com>
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
Date: Sun, 08 Nov 2026 12:25:44 +0000
Message-ID: <20261108122544.800013-4-vulab@iscas.ac.cn>
X-CM-TRANSID:zQCowAB3E7k+avBqJUebAA--.22599S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
	42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r
	4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VU8bo7tUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMFA2rv4kjU9gAAsR

Hi Johan,

Sorry for the very late reply. Thank you for the review.

You are right that both paths leak the reference taken by
usb_get_from_anchor(). That is the same code you fixed in c78dd373b5c5
("USB: serial: usb_wwan: fix urb leak on disconnect"), together with
usb_wwan_close(), so I am not resending this patch and patchwork 14822924 can
be dropped.

How this was found and fixed is described in my reply to the sierra patch; I
have not repeated it here.

I am going through the remaining feedback by hand now and will not post
patches in bulk again.

Thanks,
Wentao

