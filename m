Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253019;
	b=OuywKzdpicYvJl5SlmniayaR8mxGDxMXr98bQzuyRDay89+e8fk9HOXi90aZHB9HeInm
	 K2rv1Fk9angsp9WSmloK1HKEe0CS7FWHx9mAPYPIwkjfbljslEAnMqnkDJgt/c+FpzYt/
	 w/JtP9SIgezUji2MOAP+2wpRYQmedhAGAeLA9WS4mMlItI2/LZiiKVUfK1lXgfqzi+Slb
	 5FVol+ZJCOsM6dvkxAKHT3f1jQxzH4JzLnm+dFMbw6e6dzwDLuicZhKnKikfOeKSI8+jQ
	 G/p1G0Z6q1UiXXCiGf64RbMpshXIxI98Zi5VDlJcfYG9Db3S80Bf9LuJqmYWT5dApig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iNu8wevlnlWuO7QPB5Pki9h/6ZFT28xcWP8fY0TirdY=;
	b=LG9dNn54T0BBKv4iwnc/OrwZY4BVVaypUQrpPkqWsfnQNedYf1rNdKvBwGg2MZ87fGgE
	 hc9Ei3IvF7Ybfyj2OZ4FER/q8stIrWYK0qZMXA9hWfwv5Ou9TAI5GUM/uJ9PoDpTrtwzp
	 ErIE+DiYaotvWk5KPLGe6aJH+cAabAz04gZrsP0xipCCV39uXga9t2SoCZivZs52PT2tP
	 M88f+yprlTD6bC/KzQHlK3nR9BOpKk95gBBl3w17h1jiLCIyWVN7gm6YcaGj/S/zecMCk
	 KTkcWGHQ1nl/k8en90GiPQzzmpwQMklhQxpwDuoyoU7OwdRYzjiVggFXs0PgmRdc20A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aaclJA4N;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D514606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D514606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aaclJA4N
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a19a2621dso1007282d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253018; x=1794857818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNu8wevlnlWuO7QPB5Pki9h/6ZFT28xcWP8fY0TirdY=;
        b=aaclJA4Nx2vTIJDAYHN1cDi8wh/aBgWbr8nYo7E8kRZZOkT83FXfxjyzXlDGP87PwV
         XaQGjxN2gY80EFUNLMVhI3SGKmctf5KpBm0ljb1rR8udXAkn/C1/7heHVCLSXv/do/iJ
         SSOorz8K31GbAdCqP47dzGLSPoz7bR3OGJyO6Yv0faGmPjHYoX4x9+Q+ryZwbFokM2GX
         Lpo36qzn/DY7iHFWi+RcpWVFvTbaqMAgot7wILU82DGp98vXUgEQN/lBbIpiQ7zNj2+u
         kZQkpfvqzpGNPo0j+dlbwz0P/ay7EPdqI1kAc6xaqJfBEVrnvSwzfiOQ0sfA8d2HyolE
         Dc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253018; x=1794857818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNu8wevlnlWuO7QPB5Pki9h/6ZFT28xcWP8fY0TirdY=;
        b=BOYpx+ZVvsPUU8o0NDtPXv1n/EKksP28sHOne3l51dj6xYf7xu094gGjIUaLLWZQrn
         TeHJRdXhEtcASBmv5zrJqiNUBJR+lFDP9uJk6C9j4dQHbmRtmY3eCd3t4Jw3vVK/H8Iy
         YcBdeRnmrjcv+oLPF6BmVn7VFfzbfyr8nVBkypauim1NqJ0L0MA+6bRpYKTBVIuHPHOu
         6gzz4uMSmYokWqprN2D0VpzyIJy1ItH3LHLlsVLfBTFmKMszLuUjd9TupG0xLrmjYt4s
         D7nr6OfeT8M2mJ+MnWH4oPEDGDOH5KtcfmdZ4KlGpAOD110d/HqtM5LsV35pcWEiuVye
         BsPg==
X-Forwarded-Encrypted: i=1; AL+hErEfAJCp3NyVkIWZ9/8H3Y1/YULRQ0wFC+o6R0hCkc6wStuxKGlm3KrmgxLAkw8Gk5j5AgqicgGu6MpGi7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rEEPaTmauEnt84sARtKV6zrxqIjXVN+WqmsbpGT9keEZGIIeq
	Rhlvz2dOBSzgBFZI49qBb/UDh9Ww2B/2KWUEA1REWc5/7JoKAqHwU1Yj
X-Gm-Gg: AYBFou3tDD9bc4h0HGXv2eiDYhHXRMf1PZYMW8O5uQiwL8hwV+DplroKAEMm9l394Vk
	h6fO1JR/tEg5NqeDflHwU/IQ6XRNz3uozLJfLI/Pf3F44qgdh42PFpGoHjqWme1hv5OgWnS4IQE
	rT34O7vN9BEpcfpRdBXlL8MNrGc8NfkMxwXIXGlNb84OflurQpApMC5o9KLv+LLOrhNfbUifBIJ
	B+dyFOUm51LooSsprQKIkbbQUvIqtXZt1w0+pXNnWXbUJ8fPeAZ/t/oPr0YxGSmeMamaU2A7XdE
	yIkMZk/oDQ/yGnZaysSyvmIw3z+CLT4MgpZ60XCVM1NiPBg5JkTGxv8jRS24a5Fl8PZ+uTkwqgl
	IJo2SjatBXsZPa/0TX0mmd+bmUJHmOjWSqjvEQq8DubZQ4Ys/J/zNmJX9IMTF0OTyANcHVSAsSS
	ApBgs9qJ96ihGlaCFvZkeba95VPW+BJqiM9s4VlOFjiyBdwmVweSCXLPA7TeCE8Tfnk9dbSd7tx
	PQg7zhEPQR/hwZCcwn0O+JJV4SQwhFzkY2yUwBtX8B1H0N1lvp5WBcNAN6Ui1k64Xz9O1Jv7ODc
	44XBmHiyf/xg3izJfsReFA3PO+VM4kiEYA==
X-Received: by 2002:a05:690e:4399:b0:67c:3165:bd2d with SMTP id 956f58d0204a3-67c568707e2mr287035d50.68.1794253018056;
        Mon, 09 Nov 2026 11:36:58 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c70a3sm62367d50.11.2026.11.09.11.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:36:57 -0800 (PST)
Message-ID: <8f89c7f8-8f27-477a-a98d-f08845667639@gmail.com>
Date: Mon, 9 Nov 2026 14:36:56 -0500
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
Subject: Re: [PATCH 2/2] nvme-tcp: consume TLS records without application
 data
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261109-nvme-tcp-live-ctrlrec-v1-0-47ba61670e65@gmail.com>
 <20261109-nvme-tcp-live-ctrlrec-v1-2-47ba61670e65@gmail.com>
 <sashiko-outbox-205483@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-205483@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 14:21, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can dropping the socket lock here let concurrent callers of
> nvme_tcp_try_recv() race on the same TLS control record?

The report is correct. On a poll queue, nvme_tcp_io_work() and
nvme_tcp_poll() both call nvme_tcp_try_recv(). This patch releases the
socket lock before recvmsg(), so both callers can see the same record.
The second caller then fails the queue, and the controller reconnects.

Without this patch, every such record leads to a reconnect. So the race
does not make the result worse than today, but it is a bug in this
patch.

v2 will add a queue flag. The caller that gets -EINVAL from read_sock()
sets it with test_and_set_bit() before it releases the socket lock, and
clears it after it takes the lock again. A caller that finds the flag
set returns 0 and leaves the record to the first one. The flag is set
and tested only under the socket lock, so its owner knows the record at
the head of the queue is the one read_sock() reported.

v2 will also include the cmsg buffer fix from the report on patch 1,
and a test with poll queues.

Martin
