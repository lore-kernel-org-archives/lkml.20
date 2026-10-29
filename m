Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283217;
	b=ODBwyl96tVaArXAmLrxFD0Aw3APa3Mtb5YsloYoPm6cjtwVT6WBT5IsuwAGqtg0jELMs
	 MhWltcv/giROJAT7bW5vxctiBwNhhF4GSnOvgjq3+X1zC4qzeTAymM8UxHQGqZvtPb/zM
	 6ZZvC2kYOhGGur97x50p1SaYSmtCNsmGDYRWcmlljj0gSMDIuP1iufZJou74flbT1/cf2
	 FeNP+v/CDQJjsQcOSuV+mOCEe7Hb0ZTtJJNUo/eoI5f0w1zaO5Dvi9P/pLJn5wt7yDc9V
	 Qk58ZsPN8MnXlypIiHiwueNzkH0IfVJb5/RjJLtBQZD9JaANsJm8TJVTsrslxfXvCHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=s1W0bgqQx0WQwVtzmLATVwimU38bihjww459vZ9xeOE=;
	b=aHwiv5HUYDUpbrR/BBHdSDy+N6wwBcG/eXHP8zaTL+QotrSDFgNz+EVapQkOwDJEKmnU
	 tkzInUIxeyZ9NJKgZ447KZiVeTV9jpXuTdf3PAFDKRHJa0RCMqLDcMeksM2HTt9Ez4QEL
	 sc2xhpUkwjPDgRw56Jz3lvQGNCPPl4MCMvykkam1ypu8tByg3uWbEfgSt++/h2axJsS5g
	 CXAYxAgQZsVEe7HTNsEfdfe198cEyOqDHOis4H5PIZbhOJoY/Q8NJ0rieYAbuLwsT70qe
	 KvU6S3b7+8CxCM4HhftLR5QlAF5R6+PFRep4e307Za6+jTCwVPVhxh3A0wqw5jb8mFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJy4hGDu;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17179606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17179606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJy4hGDu
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so2904574c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283216; x=1793888016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1W0bgqQx0WQwVtzmLATVwimU38bihjww459vZ9xeOE=;
        b=QJy4hGDuXO2PawLQQXFFmJ93aYZkWvYOQ8fcPwvENINg6flF6a+GBzGLrf5GyjVGSN
         QmMdeD4B6xnw7nOcTkhukMfNFmx0FCCZylaXoDqGJ2jI+75tLbje9wTN8yym+qelQhNi
         XMiM+N5DVSH+ow9SBFOEDprXxDGxWr0quDHjCqVYfWDZM9amqNd2ygxcayuqls0cn404
         6iZW/OxVYwF0yUDItaxTXz1Ztpg5xWQ2QbvDqxb9Ivw5jE38mDTi7maJzWbRdXrWL895
         Lh1p0kMaDVWLj7al+DhppkZHmK0ztjqYpqpN0gbz3FIDlc/m81m2l+23DkKhQkemokqg
         W9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283216; x=1793888016;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s1W0bgqQx0WQwVtzmLATVwimU38bihjww459vZ9xeOE=;
        b=ysivnWrdqf3jVmkoFdR3brVvUaoTt+mRNK8TsGL4V2ftdh2jtI4k07ZqxfxJffKSsJ
         lYk8oQNPwPO5QnZoPsXiUdxPN2dE/kZTs0m//yev/ZekMyzsEc29W1cFPM2vLLcAHaN0
         gi/e523oM+cPztnFV3h9RtRkqbwENNHD9lq3EUWMVPKxOZ8DkieQJhFw3Dbce0bXZGZS
         LyYN1iAOPobPZopf4Kvj7Bi1IEbAF40AwOrVhwUYrshPU+T00NHS7tKolLAIZO5pFDuW
         jgVvIBorjIp6k8Yc79Cj09COdiykExMQobe7l36/dQHrwWM+7IN+iDgCqc9OcQ5dufjf
         YRrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpwRv6uUFVJoq5tmb5MPfNJm/7GPO5c2oz2fOlwcfJOqLrez/s8Gw10SLIVzCIRPnraUBKGNbeIRFCW2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa0AZaLicXx5NnDc4SpyqJRcQMw1kWYKskWMkuxnqtzD9IaB3F
	hT2L88MK+uWukwXV54EQlkd7yNM0p5QgBRi/ueNnbembhNvS5T+sez6i
X-Gm-Gg: AYBFou33yF/g2vBy1570Wi0QocGttSCPB9wGFlBGOQUyvqbPAou77/k1+fbrvPv+f+1
	KGiea8L6/gu5BvN48OkCM630Caj7o1D1O83lHhQ04yVnoqz1a1n1ahcnW3BkKANi0DlyUYd5Ocy
	TwTZlENaSUORxAvfsm3CS93phIFakn4p6tg50j/V8TM+ZMW2Bc8KvgmP5///l2F58mF8R5Qsy/k
	QZ3WIrn4qrEFJCinVkAIds0fPDB7/Bl8pzQ1tARlz7TEzrvnhsLAm5PL0sf8btCRqeOHssyicjN
	rzC3vnN2ENUx0dthBcURJRAh+V0zZY5s/dQ6sYcTr2xzCu+aIf4lDASKfDN+RvmshUAvZFlEZ1I
	QBQYLEWzaPr3cPPT1VQKz7eNkgCdq2/rZnHq1OGVKl+TU/SQ8E2o9Kj7hERLoiOmsW4KbqecxSB
	TaK9Aj1LzKrqKuSJEOJ0lis+Jir1qMLJh6l6njg69a7c+LO9YrGkZlgiihNOS3qMH/7rIR4852R
	1tNt+q20U55aNzntBD/J8I3je3yQ1wRkPPMcMvHL+LSQ2ARiLBx4xEYDGSjt41W+brj7jKelQX5
	ag1U0OphJ7AwggmE0ML/Vu76se0EQeOeE35AJFpVwzkyb7RHqGguLtxiZyp4rdxnE4eKDyHgJxQ
	=
X-Received: by 2002:a05:701b:455b:10b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1a6cd77efe7mr6916673c88.16.1793283168700;
        Thu, 29 Oct 2026 07:12:48 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:12:47 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] usb: fix over-reported actual_length in usbip/usbfs
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314073.648427.8311262845412746237@gmail.com>
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
Content-Transfer-Encoding: 8bit

The usbip vhci receive error path gives a failed URB back with the
peer-supplied actual_length, and usbfs copy_urb_data_to_user() trusts
that length for non-isochronous URBs.  A malicious usbip peer can make
usbfs read past the transfer buffer.

Patch 1 clears actual_length on the vhci receive failure path.  Patch 2
clamps the copied length to transfer_buffer_length in usbfs as a
defense-in-depth measure for any HCD that violates the actual_length
contract.

Cheng Yongkang (2):
  usbip: clear actual_length after a failed receive
  usb: usbfs: clamp the copied length to transfer_buffer_length

 drivers/usb/core/devio.c    | 7 +++++--
 drivers/usb/usbip/vhci_rx.c | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1

