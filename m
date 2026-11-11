Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432490;
	b=HUmyDbXiliVHPZK3PPLlu6wBSz3FDfWgWsqREigQEDHk+rqmhe0Y0sV/QFbBEFN7e1Yy
	 lQwewd63rxSTFvgoDuSXAUz+MvscnLeTcRNLXDuBXc706uUK3OTF2xur055+oZxdpg/IR
	 4fGUHepwdG+qujidH71P/ru16cYQqL5Gt0BVRUPHu9WFxe1hcsKH5qGOcMkb/BWSXr79s
	 Gf8eqBkKUw9bIDsuLdNjjfcbx/t1clNNpIWmRQWTlBj4uRlxPYZ4VM4P9aX8B0cnI6yF3
	 1O9s/RN39plF1pFSGoovcsaflHLp9b+g73ASp4JE0NiBYLUUnm2v11egzzClti80srg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZoJPYJRE+a3rUDuNJFthWOEClKW7JBQ6lGyHIzbta9E=;
	b=FA7G0UMcklFhDJiM6mXehHS/XGqvb9uKFs1U4lRHT1Sv1+UZ13DDWMJ7Ep2Q4UXmlyh2
	 EBFYGzTYSvIAsAM1QNx6r/b6kHNLOzsvv9l4A+OXmrXae6gXZ3ddgSvFLqzqvoyEheXjE
	 6H+pCUPSN5lGkVRSO5UjzjeWVExMeRO0TXdzY264Ass7AhItI27aEZir9Zq7QU1UEF91m
	 9WC5ODpCug2VyWsu9m9FGlX3wpDRZg0m2cjhmEzsMxUHLXE1uKL4OC3txkIVv0S1M4w0D
	 92gNbBYD+Cq2+jBU5QxhAVNqExM1UCtymrhYn30xA1bf4cE3NZ3AtdcNqLVAk3uZT8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Tk8TAP1j;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3804B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3804B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Tk8TAP1j
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso1147823e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794432489; x=1795037289; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZoJPYJRE+a3rUDuNJFthWOEClKW7JBQ6lGyHIzbta9E=;
        b=Tk8TAP1jVwEAKV0YftIECu0h9wXw8oQNByQV6HrCmEX99UaHLpy1lK+EzzIkRF/Iyx
         vV4g/dljsNCZadYNkTuyu4CDzgzpNJXfZVzPkUXrYDWtA98MxRaIw0xT+jHbL59SoKUI
         gTyg7m5NDyDikjnvE3RxUwzR4D1LsQarirVQSY3fdfz7V3JAX3TIiwI8hdBS9FP4nNuF
         QQAH1BDkrrsJa+CBdc9OcQx5A8WKHrvfRHADXtO443YyAA+sPJv/pessoyJpJwLWGJql
         C9FEbw2U9Bin7fnSIrzoV3H7Y5qk3b1MriEI0B5PXKbQBh2Da2vRyoet4Bum+S00QVAw
         bCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432489; x=1795037289;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoJPYJRE+a3rUDuNJFthWOEClKW7JBQ6lGyHIzbta9E=;
        b=l/i+hjNnV94PyRMy0vinI8ZvCzF8XRUWloAejnEUgRNPdmhzy0haEZdxdRi5sQeSAO
         4uC0jQn7EIu/Nose82UHoKDoyD1Q2Xaza5TEhFeuDBXUBJyYPEgjU2gVgybTb0cjJIz9
         fgdxcezFKN61yK2Zd813BFlatU75icR2BfgPRuf5tjSoRP/60KkoYSRCBPN3hk1tHLrp
         dRW59ip2APEnCGlPzTLNdbHh9IDPVj3w2vqeTw0fg9UeeCOu4dOCJF3cz3d60Pcjzdss
         Fhh9cu+T0ex3qedPd+DJfZzN6mN7VS1n80XTPjFnqxvUQGaOwckQDb1WbIXmP71Irs9P
         NbGg==
X-Forwarded-Encrypted: i=1; AL+hErFSrNc4ykTAureKR2YJEMc7buNIPoLsqU5JugWw/XMdt0uZMFRzGyCwOEANZbjamYDbbe5SFfohmLbIcRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+owtSiIXvGvx+PIpmkS9phf7RwkT68L17fOWrXKadfIX/S5e41
	INQRKheUbLuiHvSpKc+e3scCaLUbBXOJT0I4+MAgDVBK0ONjpLfJHjcbcAP++HqrwpY=
X-Gm-Gg: AYBFou1Nr/14Im6yJ/atHOzGtGCVMEDNSz+w2hxkGJLjvG6My34yWYIg69Ek5qlFTAk
	KXiOwaDRbIJE/mUhBGRf3hp6sR1EgxeYZCHA8d4TjN1ytlRono3gJhzTZ+naWgc72KVSYw3h6/O
	XoQBsnlShrIkmyIk8KKD6HIpaKON2nWfdfUNzwVxLkLdTTdEoNKWSC4GQYqMVR7VegJfy2jUREo
	/4WuIgtg8S1AHeoRxHUC4RQCn4aOuuLOzyjtYggR/LOvuyHzmUcMYGG1quT1MPjoFp9PL8ffb3D
	f0xofji34AKErLym/oU+RPQGngErJZGJujCYYylwKHfGGFSDtrknCBBPgBS+NThYPdHSTEB91/6
	GM7gxkN/OStCp9zwGe7LAki4ILrJlQdDItKUbBFhydvEsWoC7ZzVApXLmhuXBP6GzRJmiBv+ruv
	kk3pk6cEzxEUIg+w0jjYH+dm1M9Vo44iWIw6JvAuwPlQ2GQc/dUUOfKDvAw2CKhT3AdzqCVYHIL
	6i8V0IVlWbLCyxu8k6K+H1SILjOg6GF1fJi7HuzyK9vji5LgbRhaTq409Oe3PhyAiyJiwUOVfte
	igMhv5kienLLP020LMRVhjdN43CC5RX5oztR4r+66bnlWniApDGCJJ32iGynWbAI0J09q7MKK1t
	SIq9kO24xJw4zQ1qKZiupI3s9qcm75IFPRK9imJZNj0lQJmQ=
X-Received: by 2002:a05:6122:d29:b0:5ec:e7e:27d6 with SMTP id 71dfb90a1353d-5ee1c3f4dc3mr1648884e0c.4.1794432489164;
        Wed, 11 Nov 2026 13:28:09 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c45a110sm5203554e0c.2.2026.11.11.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:28:08 -0800 (PST)
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
Subject: Re: [PATCH] kho: Prevent reuse of preserved pages after a
 reservation failure
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chris Down <chris@chrisdown.name>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 graf@amazon.com, kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <avQUquBK6cO6tUUI@chrisdown.name>
References: <avQUquBK6cO6tUUI@chrisdown.name>
Date: Wed, 11 Nov 2026 16:28:03 -0500
Message-Id: <179443248353.2329176.13720873996862751451.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=543;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=elFU4wPAMaBwFrT4m33njt5Q2auHHtG7NC96QfM6Q7E=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq9N3nz3mQqqZrDWc72K1rOdBUMPnBo7ID+Ai0B
 BiIhG8vS0SJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavTd5wAKCRC7dyhM23N6
 3hSgEACblS54tgUdblcItbWjWQY1CPYiO7TGqqZhhdrLqVtXFac+KaDZHty5ilwOQXbXz3faZP6
 tSkSdpg4RSpnv9BxJ0pgW/oV/uWlh0ldV1rXZo55QTXgkfYapVrbiYNWmoiEkrvT3XUOwfUXjAk
 y4kMM3Lm+6imri2z2cC9ZwODXrzlCak5wtL6z9S/AwC/EfB2Qr5z0H8irPqr+ixQckAkOM6as62
 HHCCumwW77zcIs0HjI584FuSyvGGnYt1WQLtEMuIoco6wk5Th8XTnHNBWplpX8hk68PTQZ3uddJ
 OHUEnGOGB3+0cOjr/sF6hbtB94cP/StjzirPi6UHoOlkXaJce+SG5a3qmCA3VyVjEJgkcopWCL1
 /9QRwBV1NNdNxGUDdxv2WQK5jM9lsz5P7QaZN16XY5gveQW7rWNBF5MiDpLmZRxO4dsFjqb5T0k
 62ivZnDTjzdJHRWUNby3GJKXKz4u2CKBivaHxBzPS+bD8k3RV4s7fATfYOsXyCJdaLkiu7X/C9a
 a36oBuvgU1+tAdW6LkbWVkUVwDzRoevrZH16WKRBySusP2btDD/wwoCql/HTBtTB714M4SKqfuG
 SAm0mxL++DCkiyW05CAijA4BWVFgswkITvUwI8pbEhX09pN2OB2PdueWiuuK01EoDtKz5yQBNyI
 /5AJgaT3+KKUnjQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Tue, 10 Nov 2026 23:09:30 -0800, Chris Down <chris@chrisdown.name> wrote:
> kho_preserved_memory_reserve() reserves each range of preserved memory
> in memblock and marks it noinit, but ignores both return values. Either
> can fail when memblock has to grow its reserved array and can't find
> room, which at this point in boot it may only take from KHO bootmem.
> The boot then goes on as if the range were reserved, and two things
> can follow:
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

