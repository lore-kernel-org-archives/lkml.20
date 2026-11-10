Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284743;
	b=10A4A+rhL/WzLamJnJzBSOMAJPNmtL86XM9B+GNXiSxB2v5/ZylkOnxq8S3O5EhY1ccX
	 /S+CMNbUNcjFvg+KMgUgfmpA9hUhJSrCebemM3ADA/g5xhroxaRlU+HcsUzyfpo5sje6x
	 JWhqdyQBsFO4F5lIfEkJy1cqmVaJIK9UgQixt1J8zHpO9mtd2gQUGrHV2GwKR+oIuaUQo
	 tFChRJooGkecPFnWT6pgsb46iDhtnWBV7fwSa+uCMCQgGOnqMxaD43jZx3014uY6RJjOL
	 mb4pl5wB5eVqxbNOLH8T/MooobIcqROjmSUblrSihbrvbEXe4865PP3fx2oG2oEeQ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
	b=oAJg/1Fq4wVEhytf9FTTXeVTqIiljw1qkhhCItty+IzGm+qAM3ShcT7/KkoMrxJZJp/B
	 VKCmX88qCA4I6qPgdJZOIwZ2ZVan9iOWy9O8I3D0Z2THxoxgdwP/zgEfihvBT4cSHsn9u
	 BWtocMxAMtEQs1bpuqVF4qIvy4R1lfuVEirS20sY/GfYywAtqz9uN1HldI25BLiiNLBQK
	 6+6e84EGEMe8aZEttfR7by96lYpdFE9BfAmcduOCpOtFPeU408tk7/xS2jayUQblOd3fa
	 2P08AEJ0WgalgIgEyj/CAucUA0Eofib4e6Spb4A2NqcQoNKJvMsDWEBrYD88zTC9JaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Wseanp9e;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188D606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8188D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Wseanp9e
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1931ff67a29so397432c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794284743; x=1794889543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
        b=Wseanp9exIs8Ef4kDq7IH5kK+CnWM7ac8MXfzlrCAd/RVTIIAve+Evzw/vf/8Szlq/
         cBWNrDRLSEfKnJSDyD6mNAZsgR7AYC/25FQkAmzncE8UI7Enr6lULBk3F01C8C6o9+uF
         /Hj2aKCHrIuB24Mexx3+wrdWFshW44/eJVDUC0Yw53YRjUZ+4mZ3oZMu7BjaGldqYTxb
         rFreiiCA0M+WQv2ZfkN/lKrm2MDalQf8DKYLxoSzVovbIYuaAhwWqAn1oPbC7Y1JnDVn
         b2xNaUH88U8xvgx9RPXFaGqarVpFqkGMyagwsGQLMrJEB13GRmqkzaqOYvg+uK6tPmXT
         7PXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284743; x=1794889543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
        b=24LdOV5dIjGlt9iZm3jpSdNftNszXk1Pxkj3+pPWksyLQocR6vrOwBjkDWPWqtzqz5
         DoOedPXlI2j+8vLIFBbhoHEYIr1D+mILHSsY09PLgVJxEoMs7jg9fj/0QQ8JHfZaZThw
         gv2fkYwPOLqb7IU/1PR+UrHp9XJcdVLXrjIyYPRPl8jIvDNRWDa38iJ2zFNnfkbrhMOx
         R/JvhnYx2+J0wCjXQpZ42yItFVIRrwZu15muIhzGj/CNoTpTAmvvYTKhbmt85fuerHaV
         NXXgcwFdnknH08m0vRKVNI1oCEPkk1F+yRfJecMKxPytawvBY9Zf5O2azqTlBSi7Oea/
         8Kjw==
X-Forwarded-Encrypted: i=1; AL+hErH6M240qsV5sfsx1T1uh5fj0kM69YZgm9n328G7XCgQhi5v2Z83/sCvQaJlJF7GW0Zfv0P2sk+gAcOe3dk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p7D0JMe94AU7bcdH3WFnWp+QavllEteSWM73rO+Uaqa8BqlSq
	mShR8Qren8LBAx4Qjj3S/N90oxerT0aR9T0VIjnXmqUeVwrRHKZmS+iva9JwvJSBlj4=
X-Gm-Gg: AYBFou3kA3Pq9C0qPZQGC61HN9v26gshmL3+pKGwdEYas/sAg8YUdJt4dZljurVjhIS
	XnS1conVSAjRYG7zK16wcHf9h9C24hVZ2mqNcsYVYqSuBHVfzdsn2ui1fbMSS6dbPyfNmC5hfS9
	SNlrywh1dpLR7Ks/3Tsa8egyca6rx4i9kuhBni2kCYvE+2Q0h+CzWuf4Au7Wc5vTkGDt64Agnpy
	19ZJHg+RTv+q463hom+YQMWcQBH0NIftJl7z6Qxw8T3bB5SExwNX94YyD8O/RkkZQW2ZUvm/tjr
	n3dhrMlMGrfoUkDTBdxqpDPNZU0yemmouJB4eUmC5fbfMLyQn4NgErLHMW+c+lZu5elRPlL408F
	BkwgKVZebssFYb439qtCnWF9ie+wiHmsNLWG2z9Efn/l6ewovtkFNPwRsHVumKgyV44hHODgI6G
	4mHRe/HYvZMoia6o3JUBx6auTJI0K1OCWsnu8kdUe3a8blkcVYD8GHhJ5EUuX7WwndXZZjBiNK0
	PP6XjxGfbVZ8ZaIQdqwyl1H5UI0xO42UUtCWa7JThWacFo7OLo2M5ejpj5DCkO627sIw2JzDz7v
	6Z0K9JrtpxefJLu0aoXZG8whLapvBvyyLQHFWZq3IDDa
X-Received: by 2002:a05:7023:a4c:b0:190:f24b:9491 with SMTP id a92af1059eb24-1b3b6057539mr1957259c88.12.1794284742599;
        Mon, 09 Nov 2026 20:25:42 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm3968811c88.18.2026.11.09.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:25:41 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Mon,  9 Nov 2026 20:25:36 -0800
Message-ID: <20261110042537.2080084-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mayuresh,

On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +	if (!priv->srcbits) {
> +		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
> +			 pdata->bound_cpu);
> +		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
> +		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	}
> +	dev_set_drvdata(&comp->dev, priv);
> +	return 0;
> +}

On a system with many harts it is hard to tell which encoders probed
successfully. Today the only messages come from failures, and the
gtrace_component device names (encoder-N) do not show the CPU or the DT
node. How about a single dev_dbg() (or dev_info()) here giving the bound
CPU and the source ID width, e.g.:

	dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
		dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);

Thanks,
Leo
