Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641320;
	b=5AlRAFyAmD5R0PM59cnX1VdAWHbPD6fbG4t/WkaXuJBZK0H5DT+A4Kla5cVAXUVDAwl4
	 2+9GqSkp1q6iXK1YiLRPfcM1IMHeQ/NzfuGcPrFgTf4NTjQNLP3Ilc4k6LhJUbKwvCXUn
	 9acM8l7KthaX5plEqBf2Nq2oc/tF7SFBz9RNoIBPJ+a10PqSjPexsHW+DLsk1EgMrOk7K
	 uVZRNcL7g6GaoWf6i/8TvruB0wFoJfyoHf8lDPbpGJxrCb8yEN/jGg/HLpc6OE6ZaiIVP
	 YwwARcSRwaCbHs26DiErKfZ8rIFc3o3tiYR6YvIU4vztVCdPaQalwe120Lx4Nwb/9DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P7U+PpugZaoiRZ3RSWfO6SRjEMCP3t2/Q0growSjEko=;
	b=ny7QzA5Ij6bQ32payYGH+8c4JBWo9OmDzb1xdp571EbCOScX1xYA43oXuTyICpOUVHqV
	 0p4hxspOHVS8+qmcKTIZfB/ehZCW8yC8DBHGBGle82k1pT65pvN4w2TNbl7e2LVSaqA7y
	 WVfGoTEnBZWwHvqVnEkcGGZ4G4hSCrRTatDWSRpoJBu9AanKGZK/ko1vCkZSLH9OKNicC
	 ez+AuGLSny7qL8LdSqLMsTE9sToqdQH7vrbQaz+IDHbustBBpEBnBgQCQy6nEiJOyZ5u1
	 oLONAVKFOSxxR+GEk3BOxaVOKzsd5swKLJYO2lIHOFtjYhNA5rvSwSTeIf5MtqbZDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUohjNZo;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D33606CEC2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D33606CEC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUohjNZo
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2674653f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641319; x=1794246119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7U+PpugZaoiRZ3RSWfO6SRjEMCP3t2/Q0growSjEko=;
        b=gUohjNZoEFog5+xCBv3q8ptD9jvH7QkhKGOlPFKzFA8vBZfyzKz801dxmzOJqOZYhA
         W5iyJW/oRg6yJryHayX5kZAf0D7BpNGtzYzJRHcVn9c4E/YvaTCSW2AxklQaIB7CeLT0
         7O2RC6Y35QjCveEW1ouAMjLUSm5N1mZV28evOAHVCOcTRiJVBASe3N+ensrtF2Ygk4ac
         WBSBZKwCyJtXSns1w2xD/mihpyOGTwby4fGU5Kl0yT4gBEaNJ7Cy6rZTlyON8aD5S3/9
         J5zcjsoppeUh01mu27rt/Gh6tFrjIQtkeKeQ4YxfhdkLqz0NXHzwL4olWSMRo6Vrj1Nu
         V/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641319; x=1794246119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7U+PpugZaoiRZ3RSWfO6SRjEMCP3t2/Q0growSjEko=;
        b=2essse5GaBKMk8SC4dIKZ0M45L88DrH5JxCZMTbblEnOQGMlIi4SSmr2zqP5TsaMis
         1qbTD25USw/8OMniK7B8ZRbPTTOMdEAzakmBCpQMHrP7XfcEhzWTX1JHFQ5vR1ca4mcJ
         VjBmi8qxYlIUBas34FhgLowXrGpKWwIsc67RiS+PSRUQ4OVDM86DUSxhWNF32Xn0j81P
         9G5iSFNJwEzY9NX0pf5a1B0Yv8Dq3BE6KRLlX+GaxSFAfwJ1/pba0ZV4pRjdUGOFYCvG
         9a5UjSPcJR8g6KNjOeIymydFj3sYlEDDDq6GLv4lePW1zcxdJ356gLa332oVmDQu3zQB
         y1mg==
X-Forwarded-Encrypted: i=1; AKwUvBywIs4LSSefQGpWQU2Tk96Ekt1ciO7jt20HjEHgDKzGywTX/fsOAQpHgTEEYUQdl14g8qnV2JUsY4Sil0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z81y/OgD3tGRjDLrXpskFT7w3h+s4sjrIUrzEMNgzEpONb5G9KG
	spp94RwFsUXD9hhGW6odbUFIPCv+j7b/G/YweYuK+SYvRG4U0vJjDpwY
X-Gm-Gg: AYBFou2uYeP7OobiQUeXmouLzLqkgRp4Seogb7UdjOAaHavh0VgX4U1pxk7vt2a8YeL
	4tD3gclUuuPh8o0TaBCCCwKmkXErVqZHWTotwfnCwIkH7UG1UC9cufzv3bAcAGdbeevIV3LtPFH
	/+IlC3upLZBxtP4REONNwjUQkT8xsm0yxDmoCQH/T7lTyvtGN+PYaFkQ3pNIWpbsrw6IBsZkQGX
	XQotOvTA2DwCV0iRImq2Ikn5jf8HDGsBwYtAjOjaNewhh0P8+1pSgK3mA+uMf+hFoNR3gmaikAR
	pVGYcxN6/fXov8h4cgoDPi6UNHwxI0FOERiVef3mBeSMPARt2jU7yUUkQBqFqcGlN34QGxkkz9t
	h1CWwMQ7kfHQq49UEtxua1PPENdzPN+j8YHP1jb5TXCejRSUAiIP0zOx6zvcINmv/godPJP0oT/
	LAEa/Z3W7hVYuleQsDZTMflCJ7iSKnBC4qiJCXLCejvCs7QQyAmH8AQsLyb4ULogKklZB9Y6phj
	4Xo9BSRO9I+ew928om+RZkI9QGX5arw+bGOI+teWYruQL5cT+RT/TWSs538BhbCeGTUIpK3FkEv
	XuHUli6qMk2qbk8C6jXAgkg8xveiU3cDawN6LpWhOsEWsjC9Bdn2X3fwmaGgXadRvxZicOgWIEb
	l5OqXcjo30qUlvwxR8xd94Qt0rwF2zCZrWR/KJQMkHOwqA7/6nn9Oi0nXVRX45hZFTXEGWUoeET
	FDyVgrWC9Yd+AZ4Wd8SL2XBg8Lz9n+ZdxY
X-Received: by 2002:a5d:5e90:0:b0:48e:2bf4:e7f1 with SMTP id ffacd0b85a97d-48e6e518492mr24296986f8f.39.1793641318418;
        Mon, 02 Nov 2026 09:41:58 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23534081f8f.7.2026.11.02.09.41.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 09:41:57 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: allocate the AFC memory region requested by firmware
Date: Mon,  2 Nov 2026 18:41:36 +0100
Message-ID: <20261102174136.37406-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <98f13907-fe0a-4a8c-8ac9-3be40edcaff5@oss.qualcomm.com>
References: <20261030220824.915760-1-gsustek@gmail.com> <20261030220824.915760-2-gsustek@gmail.com> <98f13907-fe0a-4a8c-8ac9-3be40edcaff5@oss.qualcomm.com>
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

On 11/2/2026 4:06 PM, Rameshkumar Sundaram wrote:
> In that case, shouldn't chunk->size be cleared when no memory is
> allocated, or should the response only contain the chunks that were
> actually allocated and assigned by host ? (see
> ath12k_qmi_assign_target_mem_chunk() which updates ab->qmi.mem_seg_count)
>
> Allocating AFC_REGION_TYPE while AFC itself is not supported by the host
> looks wrong to me.

Agreed, thanks. The comment above the switch already says that the host
does not allocate memory for regions it does not support, and v1 went
against that.

v2 will not allocate the region. It names the type, answers it with
address 0 and size 0, so the firmware no longer holds an AFC region at
bus address 0, and logs this at debug level instead of warning.

I prefer clearing the size over leaving the segment out, for three
reasons:

- The firmware already treats a region with size 0 as not provided, so
  the answer has a defined meaning. A response with fewer segments than
  requested is not something I could verify for the PCI firmware.
- It stays a local change in the existing switch case.
- Compacting target_mem[] in the PCI path would shift the indices that
  ath12k_qmi_alloc_chunk() uses to reuse memory after firmware recovery
  (prev_type/prev_size), and the free path walks mem_seg_count. That
  needs extra care to avoid stale or doubly freed entries.

Tested with WLAN.WBE.1.6-01243 on two QCN9274 boards: the firmware sends
the memory ready indication right after the response, reaches firmware
ready, and both radios come up and serve clients, with no firmware
crash. The AHB path already drops unknown types instead, so if you want
both paths to behave the same way, I can follow that in the PCI path.

v2 changes only type 10. The default branch for other unsupported types
stays as it is, because this firmware requests no other one.

Goran
