Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368446;
	b=U8uCOELRLfa/e0cZXEpbqQK0WPL6EZ31GGxD2SW210v7MOduQl4bVDtmnffZKsiacuL8
	 Sv7jEBdissSzqJC5ZXbe397J+a+t+Dh64XdS2A5aDXtmZXgz15HPpHRKzhkgT4OkyClJC
	 Fo3MBc2YCHDUwEh9tZVXZVQJC+W9BaLL32nI1KEHmTjvSstZM2qN3NX5lirWNPlheqP4r
	 gVlg9CJo3I/2FjQIEUE7+q7VjBLh87WjnMBDHZQQ3VETsRNUnO34BLVWeNPKt3uZUjMK6
	 BGBGOIUJLr+OpVvjp3vRU8lKvphz9PRElHmVu5X1Oxrmw0lERktc8gSdpydbKGLTHNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BAuLNHPNJqqoWJmSv1jiLnRdkmUVQGOL2ovNhcmC/YY=;
	b=gQecaJD7HlQlj8+/kBcvlncFmvBkUYs5iaEk6xWljN1Fl126S+fr+2wlBe2fawMDbZQ5
	 /5pML9ji3KpaDmPpajV2IdtqbqwtyNeCWTZLUMp+7uQeUQQ9+Y9OjkVPXScDnODaMniEP
	 HD5MsUrgHBgH511bqKQXz9brmtjsGvcsOq8ZibqymgjUmFnbfjDraCzcozokVCT09n0QZ
	 DFu46iQO5IyYhOZ6e5LpNhJY4XuPYBxqDyHtlrvaqMhi5QNHTUfUmzhfLTXnzphd6q+cP
	 MurvUyV4NKa3qyxQZniqVMNp2UIq1ahWaUGGS9s9HegCRW7DOn/Vw6KbJj7S2IgSzww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b="oo/gDQ1H";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203E4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 203E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=oo/gDQ1H
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679334baa1fso742827d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368445; cv=none;
        d=google.com; s=arc-20260327;
        b=QMdw5n8A4WPd7MdgYgUcW8qP1Q8rIsAfevlYvvlRmBSTXByFza4oBCDKwZDR3CksfK
         JjskjOmt+G46WAJrXBNSqp4Vn7u7kX+30iti1MrASgbPT7lTbbWWqJA1Jc1ZRB9BB1U6
         EoBojk2/Zp9Snoz3BMcjnKzjsOGCKMKvjjWbP87hkwEN6ooD/JVJ21BEtAt4x0wEqQFM
         JVw3myGzu3O/+gUjkXhFOqjvG3hphLSvAdiqReax7Y2qZK2U1trgjEs/ZKFmNJNKiaMP
         dG8wbgBkGc8J4ZBEo4l8pbu/EJXZ65mFnwV2JRX0wJwfw88Z86AVkgInTjXI3BdQY9gT
         d2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BAuLNHPNJqqoWJmSv1jiLnRdkmUVQGOL2ovNhcmC/YY=;
        fh=yY3ZpxoGBuGHF/FZq19Zu5OllsCpdm8/rQXPbUS7BWY=;
        b=NUEh5PM77IB71X9X8y9DB7TganKVA9J13ud2Nd8WR5gJmZAUPpq1lhAyTTbJrogdcr
         hlP/bZFIER9tiksyg1AOBa/O1Fic98zZVFjjS/hrAJQcJngeu2eMs5tK57NdBGniGsE5
         TwugfLi+UQH9LSUHURhCh3l6ICacLGuGpF6XJ3Qq4hGLrq/AqIMIZjAjwuZfihDWXwlw
         mQYGHODswESWcx5A4as4kvRfuAuMxcDHa/2wLnEvCi1LkptIxBcRTcesDKTRqrrdMPAx
         wDa5Ng4JmkSb7oCOaHnoNyxU+GW+yknGdvSHQ9De2Qe8l/7Gi2aTXWDrqLvDsYwjLjCw
         osIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793368445; x=1793973245; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAuLNHPNJqqoWJmSv1jiLnRdkmUVQGOL2ovNhcmC/YY=;
        b=oo/gDQ1HmcwaZyjfpA2G9VFwx996PJQ2JK8EgT+15BB9Yu1b3YwRk98RYORY3hrVq2
         7tTk7woQsPGj3s3kHexvcBU5TjbBuB+Ut6T9Q/8eU4l+rGY6B0Qy1lOnkr8s4dsu2b/A
         aHkWmBZFNMqUm2kmaLZiIM7uS9A4o/zRNzfz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368445; x=1793973245;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BAuLNHPNJqqoWJmSv1jiLnRdkmUVQGOL2ovNhcmC/YY=;
        b=Yh5ecxi/u7/fNw2W62EYu2xTasAXDDCqO3MHHkdgt2OflV0jVwmM9kObkesOwAQHHW
         pc7hpL7opAZtHHRpl/II8cUlqGDnpsOOWQklOEuktWMdIMNORuNhKlQFBmbMVj2cbNEv
         oEV31j+KQCDU7kwu1BSaIPfy7fkQLNC+ydpyRn7eZpSJzK8ZpBmTSWJ9mCYO1t26U+TE
         b9DEsQcJgaMEdm99FHZZTibL+oIu3TV5ERyRCNx66QpIuIcrVD6jZpGjcnXIzAdLSznX
         5SApphLX6PaHEH5r6UyrayeK9Cy1J72mz17Qc6yRAk7YGBevx+QWdaUBWjwqRcOtBAM3
         NP5w==
X-Forwarded-Encrypted: i=1; AKwUvByKcdNeETE3klA6GFg684b7aveRfxpbymRcAkivipBh55dmRQloA60uzSPqjOilsSnNi+rK1t+5x3Rt/ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDqPAYZ2U2Tp2t/GmzinTYRIMSIChq0xcHU5PJu+7nMLLbLx9B
	xqC539sOnYZr6SSWOUX96RKVbOED/k1aidfkdjLqBWyPgJDgVe3tZMz+QiyRjtXZrG8qvM9hgTb
	ey0DoL028LyX81e21ofTMcP0XPBArhmb6oK0taL9Vmw==
X-Gm-Gg: AYBFou2OOogtfKKLFOiTd5m5HHwLxewk9XSXF3GA0KMH1FLbWwz+hp73bLdup/WVRI6
	zYMMcEs1ulnycpzgIrGBpOGDTU2bVtKooUvJpSLqQrAm5S4INLDhsCN0gIecWzC1Rl8alGHvhej
	C1TvlthJiBi8DGbWdkZzz+BX9M40eUXn80UY13URdwSXNv31awmfR09WC+DCyeM0R151qFwmYmm
	EFnkb+TSfm0bWLUl1IlfrEAnCSaN8WYoSHFoHHqQVtnNZQwEVaSvPfhvhbwJ+9VHn7FbYnbziD5
	qA+TK05GTa7J3CphNN2DADhCIwnKXndOpvN7H1c5mJu6wDkHxsU3od8n/z3B+JfZsk0JfBgJayh
	D6rCg/8OIHhl6K5qJusK60D/4OBEZpAHOFOcmDyRQlJmvNZHYyzbY0dC/QqdDfUdmDV5u5A==
X-Received: by 2002:a05:690e:803:10b0:679:94b3:a257 with SMTP id
 956f58d0204a3-67ba5072b56mr832427d50.115.1793368444841; Fri, 30 Oct 2026
 06:54:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <20261027231513.816148-16-irogers@google.com>
In-Reply-To: <20261027231513.816148-16-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 06:53:49 -0700
X-Gm-Features: AclHuK9qEUQ8arGpnCaqKbufakBcpdC2RW03pQw1oOPGVk-0ZrZp_NmRX624f18
Message-ID: <CA+w=M=TDksQKaU4R+og8eTS=17NWSsACaoBnpv3rM6tWiZ37Fg@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] perf symbol: Add memory shrinking for symbols,
 DSOs, and machines
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> + if (was_shrunk) {
> + if (ret > 0) {
> + symbols__merge_retained(dso__symbols(dso), retained, retained_cnt);
> + } else {
> + dso__set_adjust_symbols(dso, saved_adjust_symbols);
> + symbols__restore_retained(dso__symbols(dso), retained,
> + retained_cnt, retained_allocated);
> + if (retained_cnt > 0)
> + ret = retained_cnt;
> + }
> + dso__set_symbols_shrunk(dso, false);
> + dso__set_loaded(dso);

Could the failed-reload path leave the DSO in a state where a later
lookup can retry, rather than clearing symbols_shrunk and marking it
loaded?

If the file is gone or no longer matches when the reload runs, this
restores only the retained symbols and still marks the DSO loaded and
not shrunk. The evicted symbols never come back and nothing retries.
For a DSO without a build-id whose file was replaced, the reload would
also merge the new file's symbols with the old retained ones.

Could the reload also build a local struct symbols and swap it in
under the write lock, instead of exposing the table while it is being
rebuilt?

dso__load() currently detaches the retained symbols for the whole
reload and merges them back at the end. map__find_symbol() waits for
the dso lock, but a direct dso__find_symbol() from another thread can
miss the retained symbols or get the fresh copy meanwhile. In a test
with one lookup thread and one shrink plus map__load() thread, 115,691
lookups missed a retained symbol, and most of the 13.2M lookups
returned the fresh copy instead of the retained object. That breaks
the pointer identity annotations rely on. Swapping a completed table
under the write lock would close that window.

Smaller things:

- symbols__merge_retained() is O(R^2) in retained symbols because of
the already_retained scan. Both arrays are sorted, so a linear merge
works.

- symbols__fixup_duplicate() no longer returns early for
allow_aliases, and dso__load() now runs a second dedupe after PLT
synthesis on every load, not only after a shrink.

- choose_best_symbol() now prefers refcount > 1, so which alias wins
depends on references other threads hold at that moment.

- If shrink removes a newly populated cache entry, dso_cache_io()
returns -EAGAIN. cached_io() does not retry, so this transient race
becomes a hard DSO read failure.

Thanks,
Alireza
