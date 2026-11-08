Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140734;
	b=bKOQ0mzl3M4Xy4I1nfxPGgJhe4zSJOdns4UXWaScPNEhXvaI2yKCdHxrvRSxSb6u1LUR
	 5DjoSqLj8oXFE94hGJ9Y0gQvXUzVCqMQaVtSLUeXTBUhaUV55v7G3n6AFg4k1Gy38sFjK
	 XsL/q8UHYOHXygeRjNAyzlS7Bk/5d5QjeyMJKT3aFrx3lYbDDttmAgkJTnx2WjYaJogsG
	 D1ZeALy+fUsj7m/SxEwjgjeYJUk4PSXpxR4tSLUl6jV3WadqoFipAeRuKFGAJwiWUHT53
	 RVG3k7kpiAScnVCcY3fZrV57idKpZUxMZRjQVViY2dg+HHjDbW2ye6OLlWh3Oo5AE/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140734;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=y0oGlqD3/bzJ7MpJXDPJBuuxfXMlrNf/SFsN41ueafk=;
	b=Rt6Bs3CzMBOmV5ZK4VEi6RFIYIu//trPvLiq8lFVhwutli3l1Z5UdKYgyMWAA8M0OOuy
	 Rn8/Oi2h70poSSMqvc/T4bNGzV71EhsRLhqoBl49TLtfhJfliB/T7SKDmEk0Ouz8I+bte
	 2WatDxit4ch6AeBTqv0MM2SqZDmfNNmSIx1p06nhEGIOycIIcapQgN0H5uG+Vc1PccCQU
	 4QvsVN3PhXvmJ1cPXKvyaGfk8qTTO3Akkw//IRhKmLYe2D4mwQcYq1fJ4A85lWdnwSnth
	 uMN6xS3QbS+FeDHML7dPxvsLRiexfBusJu9ySkZmSqf+5vBrUmV+Nc9b9w/jnyFYOBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45079606A322;
	Sun,  8 Nov 2026 12:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45079606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB31bo7avBq+UabAA--.20043S2;
	Sun, 08 Nov 2026 20:25:31 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, vulab@iscas.ac.cn
Subject: Re: [PATCH] USB: usb_wwan: Fix urb leak in usb_wwan_close()
In-Reply-To: <aqutE84DMjEPuDT-@hovoldconsulting.com>
References: <20260916165608.2085613-1-vulab@iscas.ac.cn>
 <aqutE84DMjEPuDT-@hovoldconsulting.com>
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
Date: Sun, 08 Nov 2026 12:25:41 +0000
Message-ID: <20261108122541.631725-3-vulab@iscas.ac.cn>
X-CM-TRANSID:zQCowAB31bo7avBq+UabAA--.20043S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF45Aw4rCFykGw43urWUtwb_yoWxAwb_G3
	s5Ja17Ka1UJrWDXr4SyFnY9Fs3K3yDX3srG3yrW3s8W34jyF4UXrW8G34Skw18GF4Fq3Zx
	Ar1F9a4Skw4kujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
	jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7VU1pnQUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgUFA2rv4zLT4AAAsi

Hi Johan,

Sorry for the very late reply. Thank you for the review.

You are right that the drain loop leaks the reference taken by
usb_get_from_anchor(), and the same leak is in usb_wwan_submit_delayed_urbs().
I see you fixed both in c78dd373b5c5 ("USB: serial: usb_wwan: fix urb leak on
disconnect"), which is in mainline and has already been queued for stable, so
I am not resending either patch and patchwork 14822918 and 14822924 can be
dropped.

How this was found and fixed is described in my reply to the sierra patch; I
have not repeated it here.

I am going through the remaining feedback by hand now and will not post
patches in bulk again.

Thanks,
Wentao

