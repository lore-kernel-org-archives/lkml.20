Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151460;
	b=ibaK0CdXeCA1jvrplN1m4aSlkyk21SVWRIgz9lenVSX7PKCZob0aEjt+8iB95z10ajI1
	 rPGYUvjTAIRypK5ntHDz50yZ/FBHy+loOrPzFrhNmy+ECpIApLd9DAR6emJOh42frS/xp
	 9W7IL/VRwsv3gJt8hmG9nwXI0Mhx6zMYFT5sLQlr7DQEq+DN8qsueiVrvGUzcwWArpXQ6
	 gAyjV1R24bIkjnN5jZLOmo0Y6uqajYM/c89DAUUuxkWm4mapdfqCwQmQUJ5qEXVJZPAG0
	 5casQiek3eOQ0ajatjb43+FEqlgpG0cTPH2vYDAVl2cz2GaYnwZMaSwGEzxmCOp3p4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5H2H8MP8L+/rXp31cDc9VnUcbqmvBKhHx7W0RFsHYLE=;
	b=sNBJcfhByBSvy5/s0QNfiTyVk+EAv2tPbQbHIj38akFhYuKHdbfvOzVPw/UoLTm39EXw
	 rKS/TYWOSKlqpZqmNPJmvludVK0sxG4GYheRPgMU7Gq7J9N3uHKZKcJnN0XIbuSKJWUAv
	 sNAVQzLkRaEUeEv2e6Ymt3xN1hYgsmQv4dctkRKTDfHfuPLFbsMhdTZPXV65/Qsgur1FC
	 tUd2/jNxdgMG/umuQpnmixng1uxJHPWWKdthP2tdyX2C9AzW8dthWemFCUpcMr216Ae7A
	 i2dDh9ydJ9DWFUHT3iYU0PjdhB4tvrBaId5oKPPEcoltatElFos6Npnv2eIiF9yPW1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VzLHlha2;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42065606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42065606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VzLHlha2
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ece3ab2e91so38676e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151459; x=1794756259; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5H2H8MP8L+/rXp31cDc9VnUcbqmvBKhHx7W0RFsHYLE=;
        b=VzLHlha2mdx1LQqvx5whvbUtOCVSCiG6OmtDhaZuB/r471T/9qSBWxLL9WSFW0Olf7
         G77d3EHfKK451U778tccdeTga1CwXe6IPTQr7/uw2pBEyA1+TFuCWItAMnzg6Zr2GH5+
         6VJhOUH5o78i6E+cxe/s4LLwiIjPVwvSXImgqsUijxEVLzO5jzj+UyG/6g8znGG+D/xs
         L89xi2e6Si8NozKOQKJbp6aIL+RZ/xE/P98R9rq6WDrpiA6pIXUF17XpIv3GqPNXWsvv
         NJkUkFs4sa7uzz/cy1hzwwi4u8U/lpHhMtRq9hR0nIwSAcgMzUeq/grYXRR6AeffUIf5
         v9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151459; x=1794756259;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5H2H8MP8L+/rXp31cDc9VnUcbqmvBKhHx7W0RFsHYLE=;
        b=GM/YjI59obQJRfQbpyI3r77YfqiSoy8SOhMtUO0wzBIz5DwT+36pERQq2osYYpnjCm
         qgNTnOl10noqDglNthUJmDekXKZtt2Zw6Kdj7EEnSmlAh/x/kZUHzH0KQMTA1XU68+9I
         RcpKCBU37gK3Ihi9zSxB+wcBQRdX+pOdOPRAupSDpH0PqiUnAYdWYMS0z2XSEs8IwUtJ
         i0RXHEop50pGQ0kHJsJEQpyUJUoYYKq6lzTjXxJsGqsavIEWTMY2mZR3fVHkXg3Ngfpe
         I7+eOb0pfIm59NIkp/2c9VdiqQCCmBJdTJdFgRT73IJUZIpdf4wuvFeJW7oPMAKmigoZ
         cbpA==
X-Forwarded-Encrypted: i=1; AL+hErFtgHU5z4FZSI6gq5iUa/bh7V/Tl++M78Ap0XFVF3Mgz6VXdaNnA4+IF7uZj2hgBLcuxCxIIRx4K78QQSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z99rIFy91x7DO0UxxtyxK5k3+RNv4UDMFJg0DGFAyv+85BqgtDH
	ilDS0ngp4VlHAqdhGo+yN+TZ1V5KamBm2He99FxGqqs/XCkOkZddzoLDnSevy9rw/bo=
X-Gm-Gg: AYBFou0hJ29jbFhlCQSgVijA9GLFsk0E46TbaJgF/4IgDQL1N40PIoHtLwXQ1r7ZiHj
	y0AIPomTTsU9nuC03L63dA4BQoMJjNA2Qbf4mz8/8Td5X8EDLRuHmuMr7rwXKr6CtlYlIAvZCO1
	MwieFKiSTCtuMSFaANZYFBZMXGan/LRna9IGm8w8nTX2vM2HqtO1Rrh+AuPV05jZQwoNhPmCv8l
	fpJbyBwa3BCaIr1KSGImmTdxUQOjNvg+kcSVnUOQQfZ61rwXV8qsgRALWWzhDtuDRwNlhZWToxC
	ZAkmrtv8sKgt8soCoq4hiVOrEMoQ74H3xJjS4wuhe7QM49EYAwerIJ3Te6nbfJIHzU+6ZIWnHYZ
	vqf/XUPWWBZ3hXUelTc8cA3AYzM5RqB1FujXlQtiq+7AazElE0Oeq49lgt8K3u7Yjv9PTeyxVSt
	n/BZO0MFPHyMKkEitVzV2sWWrW3RiKsrkB1GiRrMrpryuEOTzRXO2uZri3O3G46zU2UvsjPwk0Y
	qRbyv4cMuwq4ZDhBKMj5WBwTEJheuJ/Lx526Xhuc/EsgyU2EVnYMUY1OkLxd3OdgrMDXB2D93wb
	Uxm3kdC9gyZOERdviG/6Gb68e8RwXrCN4l/keHX2bPHGZZmtYaiPr7nXpdEvvIQikQ89djvG6Gs
	GWK/EEpKmiUWYLi8gP3fzJHPm6rinJQPMCqUMYMnOOq4Z7jz7
X-Received: by 2002:a05:6123:4a:b0:5ec:c162:d58c with SMTP id 71dfb90a1353d-5ece7232e04mr468275e0c.9.1794151459109;
        Sun, 08 Nov 2026 07:24:19 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:18 -0800 (PST)
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
Subject: Re: [PATCH v3 1/4] riscv: Call early_ioremap_setup() before
 parsing the DTB
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-2-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-2-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145357.358073.15510298244264317494.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=612;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=3Y64H37LmlHFT1VEQVtmy1MOdzH3F3b2j267UF4uRWE=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQgz9JeNn8fjKYo6x7VzlFWQWT/Lp3pbpLNs
 SP93uPVKjCJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIAAKCRC7dyhM23N6
 3uGHD/9Puz8wWfsenmFRRLxdqDDp4alEi2QGtibd3g1gVeZ7Erpg749NWd29hLL+Nps+tMLws+e
 ee5EPvfyBmjdqv2aB9jwLRhFRBVCu+uecsYEpi5pIvZnhLUYS7pLfzWQESHepH0t1Uo1zbs2ThQ
 w2QeZ6ys+x3aRZh5P4T57xtD9ZKTMO/lx5nL0zQ7y10Lc59MkvZiuIpgegVGt+afWmMp51e1LMU
 zZTNA54QUipvJplO8tdXHzC2R9tnDyCkspRxxi+iIQ52w3TaF2LY0HGMYNKjv/GWdQGcaMoORg9
 HPw3OPmHgI8x2rX0qbSZR6VLp8KqKd8jnlSzWcI1w2NMxzwF5tswwwvmxHxRXWBigTxL/ZI91qg
 FBK/MLdWhxbZ2ikerG6+mpnyJh8ifXFLI2QXmbVvjiKZTghn9/oq313tuHBfPlBxHLT07rp1gwh
 EYQ/h5X/PzAQOWJTT7h6f6LvoJANqrnrTIh/YVT3FGSGfOs82HjJtsmvkPAbaY6bCM1fgcy5Iu6
 o0CHn9bw6TOupWQqjrVgowolhg9vSeQNBv0rpoRTA/lmGKBzSTNtRYZeZfeQCViJ9VL0X/OlK9C
 l+fImT0gCxVTujJCKLC3TbO2Nb9dqnsI0iSqK/Ftgm/7Pt3MXpy48agJgU4famUxHxEvG0dTa/r
 P3vcc/gP4HWC/tg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 06 Nov 2026 15:14:56 +0800, Chen Pei <cp0613@linux.alibaba.com> wrote:
> parse_dtb() can reach early_memremap(), whose return value is composed
> from the slot table that early_ioremap_setup() fills in - and on RISC-V
> that setup ran after the scan, so the mapping came back NULL. The DT
> based kexec handover parsing is the first caller to hit this:
> kho_populate() cannot map the handover FDT and the handover is dropped.
> 
> Run early_ioremap_setup() before parse_dtb(), as arm64 and x86 already
> do.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

