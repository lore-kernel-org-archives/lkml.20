Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140734;
	b=4pjeiPJT+6CLvO4vl9n+7Gm1bF8gbG3tZ6YLC+ZPfI41+knGuMSULTWoDQr+QSCnV2YQ
	 pZ8bROqAgvHRS+lfxDpl8dIWX4GDwo2QFrCgIDEywKQR/gVxyRwW3I9n4plb3zVN4upOR
	 pJ00iLeOVjQwoH8qwomS0ueUvURdJlgt0VTrtWgrhqiqwVhldo9tAFZQoDRK907ZPo+OD
	 vxGugnaFZYxFT08z1CKw2sdt0SAD4flD0bLOZEAeNiHO5rOoByVvJhj2R2Alb6kGlRX/f
	 Z10d/osQWGBMiE6B77LgzQbpjADPC7IMmCdxPNJdZ7wRY4tfjQpaGz4Dv+xbRGXBNXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140734;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=09XIbxs7oi8ejcCsgnA94TvnX5gFD6uDZuV7wC8VdYc=;
	b=qf/oMG8MXBJ0hZ6b3bV+0aqrqD1NsOxrnqxFqvjNPzuYb/D4jqVIa5+wBXThwo9rBXUv
	 +GOOTE6CekBEPxzYGYuQZEFyc6OowChXdQyXCQ+EPK5pbEbUKGX5OqyGyU4Yyt8D20B5n
	 nfA2DpdUYSlId10bAD818CJXcCljhSzmtkX6ygFO30odQlrG9k838QDY0i1rUzMzVwPb6
	 H0Ykm/dx2Jed5sKZ7iRZKrjQBUDdbc6bjpF7R0/ETvpN3xhoOCTBTqBzMVxELkJuq11fe
	 FaHO72zeJiosrugAQY0JW3qiqQk251lAftDiV0NcZXxwrPRBpTivoCX9G1Py43Byn8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45046606A321;
	Sun,  8 Nov 2026 12:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45046606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXtLk4avBqxUabAA--.19761S2;
	Sun, 08 Nov 2026 20:25:28 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, oliver@neukum.org, vulab@iscas.ac.cn
Subject: Re: [PATCH] USB: sierra: Fix urb leak in sierra_submit_delayed_urbs()
In-Reply-To: <asjg2_2pB0dOflW_@hovoldconsulting.com>
References: <20260916165352.2085480-1-vulab@iscas.ac.cn>
 <aqusRqksylvOi1UK@hovoldconsulting.com>
 <asjg2_2pB0dOflW_@hovoldconsulting.com>
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
Date: Sun, 08 Nov 2026 12:25:38 +0000
Message-ID: <20261108122538.441092-2-vulab@iscas.ac.cn>
X-CM-TRANSID:zQCowAAXtLk4avBqxUabAA--.19761S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF15AF13JFWrAryrtr4xZwb_yoW8CFykpr
	Z3Kw1Ykr4Dt34Ikr92vw4xKa4Fvrs3JFW3uF95WryDX398Wa47Jr1Fgrn09Fy3Cw4fW342
	qF4qgas8ua1DAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQFA2rv4kjU7gAAsO

Hi Johan,

Sorry for the very late reply - a month since this one, and seven weeks since
your first mail - and for the mess I left behind. Thank you for the review
and for the corrections. You are right about all of it, including that I
had not replied to a single mail you ever sent me. Concluding from the
archives that I was behaving like a bot was a reasonable call, and it
should not have taken that to get an answer out of me.

On the patch: you are right that the reference returned by
usb_get_from_anchor() has to be dropped as a put, and that sierra_close()
already did it while the resume path did not. I see you fixed it yourself in
e7daa54802c5 ("USB: serial: sierra: fix urb leak on write completion"); it is
in mainline and has already been queued for stable. Thank you for that, and
for the Reported-by credit - I am sorry you had to spend your time writing a
fix that I should have sent correctly and then followed up on. I am not
resending anything for this thread, and patchwork 14822917 can be dropped.

On the Assisted-by tag: I have not been adding one. Instead I describe the
workflow in the changelog text, which is what
Documentation/process/generated-content.rst asks for. What I write there is
that the candidates come from static analysis tooling we run over the kernel,
and that DeepSeek and GPT-6.1 Sol were used to audit those candidates and to
help write the fixes. I review and build-test every patch before sending it,
and I am responsible for all of it. That description will be in the changelog
of anything I send from now on.

The real problem was not the patches themselves but the volume: I was posting
faster than I could read the replies, and then I stopped reading them at all.
I am going through the outstanding comments by hand now, one thread at a time,
and answering them before I write anything new. I will not send patches in
bulk again, on this list or any other.

Thanks,
Wentao

