Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA992AD37
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788698021; cv=none; b=ZjMmWVZYo1Z2QNOqbCnCI+HjrysjRmmKGLqxYUyp2Q16hMjevZMH21S/dD0qUK465p6nyxpxnssBIylwEtxavVmORuDYEMUhmv925WO9z71HfM5Itq2iA0It4/aa+uy0joatMPdZVhtDv4N+y+OrYUfWw+ZLXhQkD7qsK69INjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788698021; c=relaxed/simple;
	bh=IqLXJi+NouW5dF1e5LZNdeeBHALJvUmJ/AlEHGBaBHs=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=putVQQ5V+cbfpwflT6HVuxQ86ZqSY6Pc92viqfVe8aZZ0e723mrTVJbJKCPSh1gV0hM2uQ01Rzy27B54DPfUqL4NUc3SJ+8Bs2YzssBuzNUi1he1EqSwBL4QeCWESeKjnMTtT2n3S4V3s5AwWhPEVuXi+3Kp0qvNjJaToSpe5F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQCszuy7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQCszuy7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e067e908so2164862f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788698019; x=1789302819; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqLXJi+NouW5dF1e5LZNdeeBHALJvUmJ/AlEHGBaBHs=;
        b=nQCszuy7gdB+7ax1YnyJkP9LW4zY2VxFKxLgHIbdQPBi71jW0AICIkjQeNz9iEE5FP
         Kv+ovhiZ+d/64lJQKxfxg9ev0a8L6L7VLAwCXGcOl+TtUjRwjAdr6F72J0Y5HAmmUTVD
         iaswc/aUY5VU0JtQa1tTvT5Oiv6FSXEkzsvinaAIIrUltJOo4Cc7Q7CX0Dmr+oxlKa2p
         y+dWq43QkNS4C+HqB+O+MCxit/Mi+d/0QU76D7h1R544I3tkCvxHw5CcRf4e1JfjqkRA
         +ekLOVoXeLJIiW0i/C5Xls0y41cJWNCkXkqi6I04O+GA5He3fUU6Rur9APBbfC4kQQW/
         3UmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788698019; x=1789302819;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqLXJi+NouW5dF1e5LZNdeeBHALJvUmJ/AlEHGBaBHs=;
        b=LBwk26Sc7cZk8EG5KyBLCGVVlPjPNUICihFcR4c23I+Lsa2EzSlgorMM/dSePGM4y8
         fVIFcRFuV4CzkzrhpxVL6B7z5Naq23nnCUkdLUpB6EcmeCLjHH2v74ZoQZpjbRkhLYVy
         8+q5zS2s74Ye8RIsaoWyBP+br5puIrXswrARqh2TkOdazq4ASn4BsK+oQx4aCE7uAnkg
         BVfkobS3H6lIkzDpZiOoU2PcMYBM9yZBbyz4jT7YyBCk68yKq8RdD9ySJYuf463jp5hD
         i3t8Cq3oaQs5JxISUC4Zg1gfI0T3Br063u8/pngGE4F60IKGeNhXl1P/WtDVUp/0V9aX
         5MwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKGv4JNCKMfHKFznZGlct1LHrJnciZMas4HhmyssG0I3tYsm+yOjDui63zA8b54CfBxw9ri4GHVHDIwkg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuINehlcsExmrJgeoALGFNxqfKW0xoa68GzAzvpxF4DD85qLgI
	h0CmGV5u0xMBHTBKGAH4qI/cPpRau8OV3zyBwj3tFBeWYbrRKaDrK4MQ
X-Gm-Gg: AYBFou1tjrI+ixALHm8BWuhnNMmbFJZeQykAr/ew3la7QCxDYiQxGVmpb1nARLyC1br
	cK7sDQPuTovyS4oTqp5d7Db5x35iCx1Vp3frJTVzkZteGfp8cqdyYkFODeWRw0pYoJLGjz2yCZ+
	zfrgx6GZyg6K1nrxf4MJDzjijsJpT4NOPhe0Gw6j2X0HhYI4BXzCliEbB/lhJa5EcV+5iVTLTEq
	/N804Se9yqVH+XvXMcv49vgUxQeZwR5ilTx3Z/ZnkFYSm0fKcZK85aNy1nTgMXGUsMKEiAMAwCg
	vPzGpYwNyrutCz89r7nKgJaAn5IvIf53+FWYlm9roPsK6p1bKWQlvahRvuQ65irwcWnTE2rUSsU
	jKQxAMR+6iIwX5I5nXE8T5xgD/uKxJ6K73IgmACS0Ezjjyag1kBpzJo3K8IEVL7T3WTg/7gth/e
	SnOwR9jkLVhaTGnFO7Mq5TEj6oUkPPqpX7q+qbdsme5aNcgrsfaZ++D9gUpx9Y/JAI8oPejHq8k
	/uiRHk=
X-Received: by 2002:a05:6000:29d3:b0:485:8edf:8353 with SMTP id ffacd0b85a97d-4858edf8434mr8101132f8f.43.1788698018575;
        Sun, 06 Sep 2026 05:33:38 -0700 (PDT)
Received: from SurHub.localdomain ([102.213.69.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm18016884f8f.17.2026.09.06.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 05:33:38 -0700 (PDT)
Message-ID: <6a9d5da2.c9eda3e9.76660.4544@mx.google.com>
Date: Sun, 06 Sep 2026 05:33:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Abdifatah Suruur <suruurism@gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/platform: keep logical vm_pgoff in MMIO region mmap
In-Reply-To: <882503c8-6993-452a-98e5-2eb72faff58b@redhat.com>
References: <20260903092927.502-1-suruurism@gmail.com> <882503c8-6993-452a-98e5-2eb72faff58b@redhat.com>

T24gOS80LzI2IDE2OjUyLCBFcmljIEF1Z2VyIHdyb3RlOgo+IFdoaWxlIGF0IGl0LCBkb24ndCB5
b3Ugd2FudCB0byBmaXggdGhlIHNhbWUgcGF0dGVybiBpbiBjZHgvbWFpbi5jLAo+IGZzbC1tYy92
ZmlvX2ZzbF9tYy5jPwoKWWVzIC0gc2VudCBhcyBzZXBhcmF0ZSBwYXRjaGVzIGZvciBib3RoIGRy
aXZlcnM6CgotIFtQQVRDSF0gdmZpby9mc2wtbWM6IGtlZXAgbG9naWNhbCB2bV9wZ29mZiBpbiBN
TUlPIHJlZ2lvbiBtbWFwCiAgPDIwMjYwOTAzMDkyOTIyLjQ3MC0xLXN1cnV1cmlzbUBnbWFpbC5j
b20+Ci0gW1BBVENIXSB2ZmlvL2NkeDoga2VlcCBsb2dpY2FsIHZtX3Bnb2ZmIGluIE1NSU8gcmVn
aW9uIG1tYXAKICA8MjAyNjA5MDMwOTI5MzIuNTI2LTEtc3VydXVyaXNtQGdtYWlsLmNvbT4KCkFu
ZCBhIGZvbGxvdy11cCBmb3IgdGhlIGNkeCBtbWFwIHBhdGg6IE1BUF9QUklWQVRFIG1hcHBpbmdz
IGdvIHRocm91Z2gKdGhlIENPVyBzcGVjaWFsIGNhc2UgaW4gZ2V0X3JlbWFwX3Bnb2ZmKCksIHdo
aWNoIG92ZXJ3cml0ZXMgdm1fcGdvZmYKd2l0aCB0aGUgcmF3IFBGTiByZWdhcmRsZXNzIG9mIHRo
ZSBtbWFwX21taW8gY2hhbmdlLCBzbyB2ZmlvX2NkeF9tbWFwKCkKbmVlZHMgdGhlIFZNX1NIQVJF
RCBndWFyZCB0aGUgb3RoZXIgZHJpdmVycyBhbHJlYWR5IGhhdmU6CgotIFtQQVRDSF0gdmZpby9j
ZHg6IHJlamVjdCBub24tc2hhcmVkIE1NSU8gbW1hcHMKICA8MjAyNjA5MDYxMjMyNDUuMTA4ODQt
MS1zdXJ1dXJpc21AZ21haWwuY29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3cy4KCkFiZGlmYXRh
aAo=
