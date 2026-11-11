Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404155;
	b=qv2D0UcqUJUkPSYls756oidMUmbVrPw2WR6DUtR4CKlngNo9YKBWEkFLjv02+KLC+1SM
	 qxZWrohes/0VJA2ziseYJYWzSCjLJl990+hJrGZED3iBtl7IjYmjoCjgcJ73Uedx4aZMe
	 AhguSmvRicIxTu0K+/h9T1CA0TL8kDfhoNTY7PoiU2npwy43jyuUqFEBH3Bg3NB0ut5rM
	 6eQzGDgLwDEE72fkge9CR2rJ6FZiO3a09kqQODg7gLTAD+LON0Lu7BWGvJ6iD49hXlSsi
	 HbwTUgnpIqIMuUbA6O7dxN1ASF9RiuWa9Uc7Mz0fpnveco6wn+N6T/0mEANTe/7Uyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=4wr+TVHDubo7QkZWmXYb7l0IP18SbqIz/pFvG9rCN0M=;
	b=ZcfBXGT6e6YMURC6fAXixbxDgneewmL5L+NiJwE8rPu2n6jotBT7vIdPLBbLdCwFSIcP
	 jJBuqo1UqI7hWMnKDuPp4S+gl+ScFrfOF5IShdlavLG4qs3i2sjqWojRV+7iPVKoW3vj2
	 W3BrgUKwZdwLcS8QYRLi6vI3Lk/eG8g1eHn6Sd22b0OgF+T1LSHWJatizXteCMO5uLVOl
	 wH0zoBuQXslGypwExq+1w69LvfuKG0hBkL9ObyYCegnTVyPZBbJzDJF1sL4ufh1Wzj21U
	 EbaEqzT+8eSUQne0lMlYXebaPTrAwtTVn5ND8KNxmKOf1HocXd6B8s+YQjdXgtE87cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moqFFupm;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95510606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95510606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moqFFupm
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso5335605c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404154; x=1795008954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wr+TVHDubo7QkZWmXYb7l0IP18SbqIz/pFvG9rCN0M=;
        b=moqFFupmYR9lYl6wdBWqUMvCSsmLgYHZTGD5nU1AGOYQVltDTdsWdzZNMX4LjKYrY/
         kZa7Dug1IltSBlnlINkTXgUnv3ct3iUnLY08ZMTisKGWv4ECauRCeQRPPfEmiXlbKhj6
         kTMIMxQ2ubKmksn5nGhHtXvuoaghsLWtK3E8FpcoKfcpQgj+mS3Dd4rphk8mdxAnRgTt
         8+Vm+X+ApdOn8W5n8HmhsKcgTlf6B0Eg4FkRjxOYsTRaoYFRQHfYg7WZSNs+SlvdPSe9
         RHF8QBrQplbtrevs2xFfPSTnh0/QtikXGWsq6sQ5rNy4nKGQxjONb+mqXnmBGzU26cs6
         avXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404154; x=1795008954;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wr+TVHDubo7QkZWmXYb7l0IP18SbqIz/pFvG9rCN0M=;
        b=v+ACFqs/XEcGkk4QyIZAzGYKAU2ahdeH9Jygx7Da1v5NI+3ebVaXeHyk/D0Ll55xHK
         R73HGgMAPMzWhtZfWzVegWakctE73X9BsczBR1Zq+c2I8LMiGZVt4okQ3gat7RG2lous
         O12Ixv5Ax9iIXEiNT8+VpijCXW6f0iXtDyJaH0lfAA9hjF2wYQZ7mDjHV+kFdOWp6y02
         92GqBz6qrYaBn2YewF4AqmfkKYkXWPW0KydZVXYykygtwQHSpQl63BmP0RE5pqLhhYy9
         S7JDTQijnNJM4q8haW6DQuy+bGd5D2kq0JEkuZXwRbDsWPoOCsOJbaHsAMbNdSj/WSCH
         VZVQ==
X-Forwarded-Encrypted: i=1; AL+hErGnv+brGo5QSVj0WBQ6nHlsPQQccwgW/7DYEsAhA1t5oraT7R7w1s+RSs0Y6SZm5kcshPY/BLBrTzHfzKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sdGX0wQl5mU1N2P1Ry50T+xNCgvTHslO7WD0opqyXP7R0AfbK
	iUxxXMWCy2ptQ78K/ZV6g/ZQEou+nLhaSCQby8SwReFh/MlVZYlgPgEMMVEnqfmg
X-Gm-Gg: AYBFou3A/8ItIHViqCpTn1A9bekJg1bbU0/6wNOoIZyYJt1b17PRBpCJ0gD+ITMB89B
	GOe5xfU4CWJMWaw1kBbiZj/yFN/uRj7TIDyORtVcGEm0Tge8gaxNOiNjPJ6g55DFWOXP2ufkBKs
	bA4bVcfQOzD8pS7Mu5Oy7ebijM8eGNGi2AYyCDElCrIzKqWW97zWCH3pizhe4d42eaKeZtiyFGe
	WhFrmiBHUIRWl+6WHKaKUIhpDEbVo1BAVyDybBwoXddDL8Ner2gP+juVylNz4WCeRUTkrauioSH
	WS4jxSnXQDtSiK5F9oIAZ1Fgc+pnsV81A5SkitmO18HMMBQDbhdWcZQdEPxQ/zpNV6WRn3LSJ3/
	Z4TiTmAhehexpFAeQ+VgILi7SCCN+/JSIHcCeG6qJU/zBAB9nRXYcUQ3C//sIg56znYa+7Mcm++
	mdSBABQcGrOy6MqvR6jLJAvqRUdoab70DcaXBV2uk5aoIZxiAWgapavU6zxSYMVCt87V0rCwnEj
	XN45pCu5IORUQZe5MQ9+6iUgCmlJVzI22fG0isjJxia0V7HoPm47kHpkJlRxDheB8ql75z9e4Yl
	soUJ94dEixBd9fU1fXv1zbSgHZU=
X-Received: by 2002:a05:7301:db15:b0:375:b560:a323 with SMTP id 5a478bee46e88-3768366a43cmr3063455eec.1.1794404153449;
        Wed, 11 Nov 2026 05:35:53 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm17768172eec.25.2026.11.11.05.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:35:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Wed, 11 Nov 2026 13:35:48 +0000
Message-ID: <179440414898.2353714.11591904089911934138@gmail.com>
In-Reply-To: <39ac224f-2903-496e-9a08-b4c5a33dc87f@linaro.org>
References: <20261108183846.3804875-1-takano32@gmail.com> <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org> <39ac224f-2903-496e-9a08-b4c5a33dc87f@linaro.org>
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
X-Mailer: kpatch-send.py

On 2026-11-11 10:16, James Clark wrote:

> IMO I would rather have something that's incredibly strict and simple,
> or nothing at all. Having to work around edge cases and report near
> misses doesn't sound great.

Agreed, and the near-miss report is gone.  The series is posted again:

https://lore.kernel.org/linux-perf-users/20261111132622.2349165-1-takano32@gmail.com/

The check is now a fixed list of the 51 keys a json object under arch/ may
carry: 47 of them jevents.py reads, one more metric.py reads, and three are
read by nothing although the tables hold them (Counter, CountersNumFixed,
CountersNumGeneric).  A key outside that list is reported with the object
that carries it.  There is no cut-off, no similarity and nothing that
depends on what a run of the generator happened to read, so there is no
edge case left to work around.

It still runs as "make check-jevents" and as a perf test rather than as part
of the build, and on the tree today it reports exactly the two misspellings
we have, the 16 in this file and 3 in the AMD tables, so it wants those
fixes in front of it or together with it.

The one thing I did not do is put the list in a json schema file, because
perf's build would then require jsonschema, which it does not use today and
which is not in every builder's python.  The list holds the same names that
a schema with "additionalProperties": false would say.  If you would rather
have the schema file and take the dependency, it is a small change from
here.

