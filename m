Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056375;
	b=kkV4mHPdFNG84WPAfooc2ngW3kMgEzQHRkHNWI0f4KKvVScZBKQSfJFci8Z2hshzau+4
	 sFXU7GFnC40xN1vC5obNvy7/ZkEbc5g0urunyH1l5H3Afo3tUO4tGPRhtikEzaOVfBuhM
	 r4E4QcHQXcSAvJ3cvmbkH0Azy8DReHZeaT14Fy+yjCqaeykknFUCp9DLgm60hqM1/iKe3
	 SCnirFqYPsaBmxWu4Qrppl5tGTmFj77tesNMm2SsevIFBZZmqg9pcTaPSkfNKCFPWZYq6
	 Kco2SE/tEWWAVNq+Ai+PWe7HrFwn9m5D37zI7YhgBubCk5FoxL7uWt6WqT7ob9YhNvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
	b=fFYGwBD/YUvK5+NcGvGaIfXO/i1bmiO9t3Hx99rV/GU06bAKPuTMQ3SJDDbo3xUOvn3E
	 Juj25AEpwCceDRP02C3/Yy5ArqJCKqt0KgUw/t1a7IteBm23fGEpY4zLNwBhMgAt54Q1b
	 k4ZxkC8qmsDXuEQY+VnwD0LY6CIbIVxap0FC9PA193DG8oq6g8eC+1IpdFDbGGPAjczEn
	 8rOT3GzYEtUzCBFqnMrhgv7CcxKEzh/r5LE0n4YdRbvIhXYJHMHRpxicTAkuIF8i1+gSa
	 5nLFRNDTQjDjjUO0WtyMrpD25PtX/qGH+TJida8HNu9qjPpWzeggQGAYT8z1QZHj38Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aRilCere;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6308606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6308606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aRilCere
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso35998265e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793056373; x=1793661173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
        b=aRilCerebHy+kF6vnnvW0jj/Q9uLDDrTywoyUyeMhiipONTZd2IUQluvjI0jnnKGNP
         5nppDehQuYJicLjntoH9W0d1gEvh5uvm+Y++H7Z/gm1g5FHCsSMqG6mFrDIOgDePHd38
         PqsapbD53k7pazaNKpc+I6MVV5O9Oj0+G3G21QQwXCkcFYjC1xE7ZAyOBZYcOGAa3MpX
         MMMkrR1ojHvLZD0LPu5JK6UmNI79ge7OFq8S2VE2LwsH/NQB8NHBRtG5hy6YpbY5aX4E
         k6JkCxilvej2FO2/anbmOpgOVrJx3N7Z0JiRMhgzbJq1cwNYOhT57VqQhUZ7vBjFgkvM
         E1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793056373; x=1793661173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLn7TVaVukXMVmZsUzU1TI29I6h9VPQT25Hl23f6vc8=;
        b=sBDH+DD/13VFvQ2pHFoXOt4htpINE47E+uNGXP6t7kvMvgwZYGGTCQhE68LJPro0OH
         wkDAXz9vvt6pfmlxr5NLs7HKhCe7ZdGcbfKgpHvRi+AOs8HDEW5i75b3mSm1Z5e3KefT
         Llu1zBERby2BtBFmESHNjyiBa3DMqYIgEvg3Z1egPq086ZdFz/mvCtMBYfTGZZ5V74JG
         6xGvQ3jF0rszT4prflC2EUF4ZTa9MI5R4dBGpPHkjVeKjl8mjlVeYQK5O49my5EDLZ+s
         KBkjQ6Cf3Rq2FZ+4tjgsEgaE/tte09umM5qQSEFtGAaQnmnEV7h5s1kvGokW3ScQkB6z
         36Ew==
X-Forwarded-Encrypted: i=1; AKwUvByOK+ozuqYpzesHMs19T1k75+M7ikrvNjqak3614U/pkYuLgQLJPMGZNFfEA8HWAs1yudmGuZj8nk38pGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3wdwAXITKhhxPK+TEaRgq+8+pv1kbsKliWdL9poLdq2I/1X1/
	w40eDWIz+FcdIiugng1WitcOZ8JC7lKbN6mcEb2GruCpwF59/Rgl8qrn
X-Gm-Gg: AYBFou0IYB83ryWrIVMYQJgKIiYj6Zflg6+J6vlNHZV40BMDsL4Clt4Gleiu/MZkUtA
	o4M6zAzu/tHun5HoFMLBNalwhSSLmp2lX3CAKKEM523inyfMa3LKvjTuED6UvaouljD1R6YuWIy
	5cx9oZhMt+5Yc6kTwyuiB+414L2nALpmzkkehRgjTGAxB1g6sZdBuNCmFBiEE1mVsLAWjTNRMXy
	0mb+05piXv7PFvAPF+WlyTi0f1pnccPAvKn7M2oQYA+BgNBOcsbWWF0GEsurOJJwtvzl2m5BJ5t
	axzmbM2gmzZdwFQdpv3gVdhht4QshyJFVCG/FLY69nGKWv9cv1lnlY+eqkX4DqwoF+sFPco2NZH
	d3RJB9pZR0r2ZVF09pneIhHGKAZy0ZaZLZnNOFEsPlyaJBLll+M6oBF16cWrY+GTXbDijpYUZ8J
	HbjD9ZXAo/CFjnnz7L6CcoH/SE1Q9v3IEuhpsjOomJJrNeENQBwGcwi158yugJVHL4BSmuvyHjW
	JgWbXAjomC6K7ukz8HfX0iAhHnYqXcLe/2vxr3a8r8Ftoe/Ow5VU12zxTMI+Malps88ywXGlXMQ
	viV9UEgtuCvja2fpSHz5AF5g7RfgafkozI6AkElJ6aK3TCu1U2VdMvb0svN8DQ==
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr143906785e9.10.1793056373131;
        Mon, 26 Oct 2026 16:12:53 -0700 (PDT)
Received: from iamyoubutArch.adf.bham.ac.uk (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm212047515e9.9.2026.10.26.16.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:12:52 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>,
	mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Mon, 26 Oct 2026 23:12:36 +0000
Message-ID: <20261026231243.68801-1-effeffe99@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022163116.1042-1-26rote@gmail.com>
References: <20261022163116.1042-1-26rote@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Joonhoe,

I ran into the same problem on a Motorola Moto G 5G Plus (SM7250),
which I'm bringing up on linux-next (next-20261021). Since the HELLO
gate went in, the name service's first announcement to the modem fails
with -EAGAIN on every boot, and so far I had been carrying a local
retry loop in ns.c to get rmtfs announced to it.

I dropped that loop, applied your v2 instead, and booted the phone
seven times in a row. The modem came up and registered on the network
on every boot, with rmtfs serving it, and the phone never reset.
"failed to announce new service" still shows up once for a remote
whose HELLO arrives before ours (one boot logged it for both the ADSP
and the modem, others once or not at all), and the modem carries on
normally afterwards, which matches the replay doing its job.

One thing I couldn't cover is a modem restart: on this phone it
resets the whole SoC with or without your patch, so that's a separate
problem here and says nothing about the patch.

I did the testing with the help of an AI coding assistant (Claude Code);
the results above are from the phone.

Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus nairo (SM7250)

Thanks,
Filippo
