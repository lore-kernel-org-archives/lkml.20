Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794628977;
	b=RMn74LNy2adhHQrnWonfwHlyvbnsUIV3uC18U+rO4o5O/SlfnoBJLfze1CILmwZfHqIW
	 can5jjoCHjh7o9gDYGsDqfwinxFx7n/h017J5Ft9UYMRx9cmWcM072d/0qE1eQHUzlBh7
	 ObNeLrFVC8JGgyVb5fKtYdCbHP/s5L+C6AVjy0YCZhtn7dHTP3gxu44yafxtaSLrVPV/o
	 r3pmDoTHmyvQqqy64SfdM3V8E3Hq+jesWtIW3gy2f8JmWSBE89MOdYVHDebjNQQlPVoWb
	 AUTibF2gSQIrs+v/32o1OKbil9et7HjdeO3FxbwSmnGPKO7Mw3qAq2/8TDHTg2CgQIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=W9WNFigqzkV9FnCsVdto3Z6IgdKxkYLfEPiIfIJ8sVA=;
	b=q6fGpuNyWwaZ8+aU7DhsKLLZMEirO7EFS3WZKn9J8EMfWa9YMeY+TdTdDgTyi11ACxas
	 HxexnD6Qlr4havZCOmxEHJbHwIll9cO8PGZT6mkTPoRKtpjzVGmqEYpnh+HBywJtPFJDK
	 5iXBLa4P0Bt5944s48htQ2gl58WfIkQw/fugKgo79K7QshDShBjSxtu8mPHln27UcOd5G
	 qWbilDw5vMnIfow4PK8xWyeyNiCGVpusaCtuBzkkw2MB/PE0O+R73+RzqQdlBbRDKPF/o
	 kixyJhy7jcnYmm7PJe6eRiov9tS1dDPHKfjsQjD6rSQcSnYYh0BcE1atzIi/VzPO6oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=fHsUeXZn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE1606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BE1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=fHsUeXZn
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b360828905so17430237b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794628976; cv=none;
        d=google.com; s=arc-20260327;
        b=EPbfdtfVZOv01MkBe+wTVd0vRuc034Vjd41QufE5wHn7jfyQ/KlfHPhDCaKa/fT1Lc
         FCT6E6ki6DBodijiCGKarVKpTMJU0FbKolhDs3g2zAMDssrn1N38GHu14DelNgaTmQfj
         iXFSDYvkTPjGnuoXdK/ssPI5eBCAV1IUQC8WMGc/+myxPy5yejxDReQwaNxGD3bj12Bl
         vFSmcixi0elfOWwsVifmkn7A89D6/UIQQpGcU0t+wD/K87o1H/HnPR3+B+ScBWEcOvJs
         xuehOA+TzSsd8iLavVe1Iml8MilHuZUXGfMEWgTdhTdfS2Rey5+GgkII6sPubJ4huXVu
         XP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W9WNFigqzkV9FnCsVdto3Z6IgdKxkYLfEPiIfIJ8sVA=;
        fh=ULPvU4CI7JqZFnCxsqBMh5yTt5Fc+2M9XjkK5xR+x6s=;
        b=BP1ET5EK7cG1bz5iWlbirtlSNLf/QqbtyC1B2bAhoALYo2e5U1q3aiuu30OZeWzN2q
         ZPY/GTjzcgG+iUAD431kZaXJNouGM10boYsqIED2BInc75BDQuM7IspXqSfNYiFcJDi4
         nS8kuEGfCrMv9xJi+Q8gBwKI5kMaiC6DPP0+LGW7FnutHewyx8+aZL0GyWHYC8hl1Z3O
         GfWbz49QM3SQoYT9rODjfYNAfzde6vqRgZoaevfIeTvCQ8aDeIbgPmzPz0veuYhB2xFr
         ZOSr6emShMw67RtmVP3bHbFSdFds2xCPGZyE+307oHOBXCqEdlg44aZZS2VcfDxvFNN/
         CCoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1794628976; x=1795233776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9WNFigqzkV9FnCsVdto3Z6IgdKxkYLfEPiIfIJ8sVA=;
        b=fHsUeXZnHPDRtRlVQYn/MFXVNU63/4kunf02166D2iVIyqiYz/jWQ0r7SzVbC8HoP2
         HxE0KuAhOyEoHqzPre+lGYN+q4j33de592Wnt84l4gEPSu6v0H5pvoeKKTwopQxz1OsO
         VZqHETHM8u9JZLw4cZBKGXyloZFsNG6M7xPOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628976; x=1795233776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W9WNFigqzkV9FnCsVdto3Z6IgdKxkYLfEPiIfIJ8sVA=;
        b=dP4fHHjY43rCuhbTwQGAZzqGnm8XBBzUc+3Td7mfZ1yDaVVMp2uimu31lZpTQpj7Vk
         Xq6bkGQ3mm0/8ORplT1vUYI8/TW/TPS0eoHEclJcrYhUz1ECxjbNJ1S6MQ/N0rOC7npg
         XDMPi8jDXHP7ev2I4NAkI1ZvxHCngQp7dqi8wXTjB0C4069be4cLidHayA+QFULbO4I/
         GapJq8ASbIraKZQtEZU8fcnQxssucKGRQgRg1l7kwFfhqTsAaoGQXaKGkTGFPR4819EB
         1Hl8053U1l7+kAkoI4iX2XNOOx27OKIf4LRNoD01Yg/oPt+GvRXKrsEqRxDRQR0DH9V5
         h2ow==
X-Forwarded-Encrypted: i=1; AL+hErFtLDnNiRH3GlICgYH6lxNkB/i8m88iOLky8unSMMTgRjEkN8yw/sRqVQxKJDVVQKfmaEUP2XUSBVLy9VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rz2YbKfOTVUHm36G3QT6aCzGA0G4rZBhidFBVso27evZHfqoe
	wByuz7dP6mIBUYB7dyu6DJs6IhKlnHPDb5hSuVi/uvAZSQH1zgySI9wlMm84b9zRpO1lCyvoK2c
	n4jfAzBqj5Ikjs7uXf271WOXGHxSUBi1CQMCir8v7zA==
X-Gm-Gg: AYBFou33FanXBE02+OxFSSWJf+H4IW4H3GjKr5766+NjOzTN4YKldCuZQvs8B02wKrT
	NAuhdQBgOW+wZDUVKL09hJUNNdH7//dZUkiU+khmL9XdnLaL1iyjxWddAmzRXN7005ZVWii603Y
	rFB0XJvdmQXZ3SFzAJF5nL97442QFP+4fa9uC8UmE5fi780g/zrjmtfIM8k05mcbtxtEG7P0tUF
	C4h6fp96mLHJWyRoF7SRNoxesIlYlSnjs6HqyXxjKIlnGxKKjS3iFJy6TNSwYhs+SQtavNOReRy
	A+5fEqu9aUfDR+gSABZ7fp4SrWEs/Z9wsao50zjl4QIDuQJEFRQ3RgRzkHywXGGsI5KGNdQE2MW
	UzhLgXq+UZG9lErysxDMIHnVFpC4xgg+0BTPjgh7sRN58/sct8GQFbURrGXSlZuPzzJjXNw==
X-Received: by 2002:a05:690c:a923:20b0:8ae:8021:568b with SMTP id
 00721157ae682-8b4aa2773aamr19777537b3.55.1794628975427; Fri, 13 Nov 2026
 20:02:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-perf-symbol-memory-send-v6-0-7e90415f0101@uber.com>
 <20261028-perf-symbol-memory-send-v6-3-7e90415f0101@uber.com> <CAP-5=fUejV8+M10Z-CtqnOS1qdkoemJ=3GWWQyfw0TAHQps7Og@mail.gmail.com>
In-Reply-To: <CAP-5=fUejV8+M10Z-CtqnOS1qdkoemJ=3GWWQyfw0TAHQps7Og@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 13 Nov 2026 20:02:39 -0800
X-Gm-Features: AclHuK90CRBSEEI5lhz82UiASPlj7VnM7e5-U9MNuN-a0OTVdZlfiBYCipVjUWo
Message-ID: <CA+w=M=Rru+ZPHAc7xGnj5kNM7M1A4sji6+TsL=S5kztjWtjdCg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] perf symbols: Point to the symbol name instead of
 embedding it
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2026 at 8:34 AM Ian Rogers <irogers@google.com> wrote:
>
> I think it is a little worse as we'll need 3 bytes of padding. You
> could reduce the padding by moving name to before namelen in the
> struct.

Sorry for the late reply, I held it until v7 was ready. Thanks for the
review. I checked the layout with offsetof() on x86_64.
Before this patch, sizeof(struct symbol) is 48 with name[] at offset
45, and the allocation is sizeof + namelen, so those 3 tail bytes were
already allocated and unused. With this patch, arch_sym is at 44, the
name pointer at 48 and sizeof is 56, and an eager name is stored right
after the struct. That is 8 bytes more per eager symbol, not 11.

Moving name before namelen keeps sizeof at 56, because the struct then
ends with namelen, flags and arch_sym at 48..52 and pads to 56. The 3
bytes would only help if the eager name were stored at
offsetof(arch_sym) + 1 and the allocation sized from that, with
symbol__delete() changed to match. Lazy symbols stay at sizeof either
way. I would rather keep this patch simple, so v7 leaves the order as
is.

> This change makes sense to me. I'm wondering if any other things
> should be cleaned up with this change? For example, namelen is only
> referenced in about 8 places and we may be able to replace it with
> `strlen(name)`.

Yes. namelen is set in symbol.c and read for column widths in hist.c,
in srcline.c and in data-convert-json.c. Dropping it saves 2 bytes, but
not sizeof on its own. I can send that as a follow-up after this series.

Thanks,
Alireza
