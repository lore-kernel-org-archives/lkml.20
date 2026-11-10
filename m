Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284965;
	b=qux/AH0MITlKhtJ+s6ZzUvLudNK2SjEsYbMp81y+huOuQFGMM7LKhCE3yb6gw7VYtiIr
	 t/0d5XlmfcJ//Hoiynli1dFL6nkJ5y5wDYEvQ8sNMuSIKDmDJfLtAeyt2fs7FpipwUo1N
	 g1K77XKVUeTk0sfwTUxNQonM1OAC/P1kyEFS+fXkRBltmIn2YJPPe1zgp4DhqqKIQO5Sb
	 R3IqtYJaEoKn/93K1hckoqZhABqGNj4HKoJFgfaLkLC3clGvTr6y4GQp+mL/4LPrsZkcI
	 fcQVRY5J0Ohs5lBzTIe2O5l8dIdqHWcZtQmTlPNfxYJBuqHQ5v3baNTawoAOHefHQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
	b=pR8IsjGvcQdh5rdvVG0lJRMrSgaV9qpbXhls5hPCYWfSE5TW3BkM99eceMW16HqevX4y
	 LslwR/PTPE2h2n8H7M7voftXUOJLNDbyZZvLz+PbBs0b6ZKYDSGgrYqcu2NiHP4bApuf4
	 wTyFPrS+v29Haif64ljS+QojzHlJq+bFETqaLC1P6brNLuJkG0Q+DmWp9nf8fqagCcm0+
	 hFvExdBGC+X64jLMPI6VG7NPOqyQFxn+HpFeOSXtypwhikNHZdDeRk3iN7QdObQvZfDZ3
	 eVfoXrc3cD1FrutjHm1GJLn34DQASPH0QTmkaMhsQlJgPTlQgT83LfcKoBaLkBjxpNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BNSdpTLC;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89B6606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C89B6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BNSdpTLC
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3ada81853so1364961c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794284964; x=1794889764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
        b=BNSdpTLCxzeni26nLXimNwG3tsiucVXQvdSMs/iNf8HV6IN0yWNddKipGiTFS3jHU4
         TI4cBxxHxxGJYJrViUIZjBj+Pd5p3V7VFLTOzHO8sHOMeixUvTD2n2tWys5s4qLwYrX0
         I8IJ58etpTH3IkpJst1FRPg7vC2qJfxn3HOn4MUHhZLEvwWH29DPlteUISOoBqBfKNqv
         tkzWpD3UGhzOaf3vOF1AiqzoBqxUAZtIpbwvJO9qjMC7xbDGa/a+s2ZLNCUvcFDBl/yD
         esHGGgmJA5JEc+VYTPwliHIErINFxhsB0xh+yDpNkrLd04SWlybKODvFumGaeM7pnao+
         DvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284964; x=1794889764;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
        b=fKUD1y/3qFocHVpNWywlHy3n0iyrXComHOJfGzjYGh2u+Ob9Wf+WF/kc/NF0DDKhlC
         Anxb3XOv6c6Ew9pvuoYY2p9TiFLvRUGoLZAos/5tITkZh77/7ANOPUvPvWvPAJ/EC2Qm
         xKbzPTlYy94Zl4OYVmZW3ngB5XINqk5AO00B3he++DvRbMPGt1bCTqsxPdQEUd3R+ufA
         CogMKCIzQFz3CS1Rv6f+bElBlvEx0rrcsS8ajRFE8Cg9band89jla/zFWhh3oKeUiqwL
         UIUOmEDzTeOUqEF+deTJr+PMI/aXGRwRYQUywiGUECetlI5HhMsNVDyfXBucJPEaCcVD
         TaUQ==
X-Forwarded-Encrypted: i=1; AL+hErGxBgLYBZ1Ml1yvvryxf8/M3P9aEs+Un7XLJOi0JRpOqD3Ef+jo8tVvRUeJy0VuDfDNW6UUtB77Ep9DeKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dpzpvJa8JluADKgjR+eHH01gZeCCkmZ4F95nwVQow5Av+0Id7
	aM3rZeqST+mq+JqQcT1KqB4W/Tt8A5KrtNqT+El3BogyB1QTV1IcqvGqRUWE204OOMo=
X-Gm-Gg: AYBFou3gpONxJTByhJ5lW6zQfGh1kiCtYqV9lqxYZgM4fYu2Wz6Zm1JlZobbynOYBpX
	xt72eFpqyWeAJ2lDrduH6iuAxhTDDaSrQ5960Rt5dq/c2SwriA/PbwZkB0G+STwufO4Hm9wx2Q4
	qd1eMW1c1pTtXvN1im4cK2IsFMy1zJTkYbj25reihWYqrf0NI6WBtfalyv9s0fEKoPmsbkF3ByH
	8n1Bh7x4whlheX48zP8wWf6519VZWjVnc+SbkA2aTzjcxM+9X+115WJ4w1BlNaxzVdIsjo2tbIu
	RZr2x2KRduUchjwkmTKLgEo2Z/KrpRwQ2fnGLQBNsUJwWzmBohCSZXRFbmKwJVy/CUdzzz6S+NE
	hbnDEOBHFLuhn0TFB1Vc6uGdP5V+eAkWKFg8SemlU91gx5f6VihFmNBkMpEvg73GUSOmwMkIM23
	GRp08pBxvyKWxDKSji9vnet1vO/eX7p38RyMucsZLggW2OLIHf4ENzGN+SjaQJy2ijCtWHO6jAO
	f4MO2F5xmCtiAD5rYeVAPYouxUSB70taJQIqQQdr0aSFueJ9Y4s6XoXlkiF4KsuhPMowVN6tTQz
	36A1Rs/Z7Vg9gikSWamlJzUx8tDolZ0NJsxEzjQET3cDWcdgmWpfOWYwkCTaJTmybg==
X-Received: by 2002:a05:7022:4189:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b3b5fee29fmr2657556c88.21.1794284963812;
        Mon, 09 Nov 2026 20:29:23 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm3403963c88.12.2026.11.09.20.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:29:23 -0800 (PST)
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
	Anup Patel <anup.patel@oss.qualcomm.com>,
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
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Mon,  9 Nov 2026 20:29:19 -0800
Message-ID: <20261110042920.2108205-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
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
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp = node->comp;
> +		gtdrv = to_gtrace_driver(comp->dev.driver);
> +		if (!gtdrv || !gtdrv->copyto_auxbuf)
> +			continue;
> +
> +		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
> +		ret = 0;
> +		break;
> +	}

This calls copyto_auxbuf() of the first component in the path that
implements it, which assumes only sinks implement it. On Eswin/EIC7700
pre-ratified trace hardware the encoder and funnel each have an embedded
system memory sink. Whether a component is the sink depends on the
topology: an encoder connected to a funnel is not the sink, but an
encoder with no output connection is. In the first case the data would
be copied from the encoder rather than from the funnel, and under the
funnel's lock (the same lock mismatch sashiko pointed out).

Only the sink holds the path's trace data, so could this just call the
sink's callback?

	struct gtrace_component *comp = gtrace_path_sink(path);
	...
	gtdrv = to_gtrace_driver(comp->dev.driver);
	if (gtdrv && gtdrv->copyto_auxbuf) {
		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
		ret = 0;
	}

Thanks,
Leo
