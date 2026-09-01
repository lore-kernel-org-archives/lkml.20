Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C73F2F616B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244985; cv=none; b=Jn4SoAHyz8ygLJdTC8S3TKMw1g1hJIDP17XlpOCeQI5fzEhuzzj4Xwe0QmcT48gWD5Ij2wLPq2JaYFuiKoRrNbUwbs+byZXThakAlQxCjaCHZcrCcGc5cYXiTL+3pCiTov6VvffLLBwRwScexR7SJsbfdE+GHQPx90Gc/xrxjIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244985; c=relaxed/simple;
	bh=+0mkAKxF+MYjQouhURxCh1vledmCnXNSmvpvHTqzwp4=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=Zj+eHE3yl+00WstltfYRg1VdBMXg4RDw+eZs0ZnK1UL0ZbOmMtRQ2DdoKPIUrQ7uxbcX2EItn9gW7c70n+rkzAWBNN0h8pQ9qeZaLwnD4uKe9+f2mAJn95kRRWze9foYoXyc0IDVgvBGWNbl6wIwTILDDgRhHPFoi8+YXKA7hLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qc1eQn4R; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qc1eQn4R"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e61a34e5so152856f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244982; x=1788849782; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0mkAKxF+MYjQouhURxCh1vledmCnXNSmvpvHTqzwp4=;
        b=qc1eQn4RdynbW8HbkWJJlTTXMKSxciUTizyihpEQi9ny5aj628/c12o/PdjRgMlseg
         GME8/zom3UHhBYdWjzWPEknACpbl1MAneRo+xVbUahjq22Knemt4eIrbP5gOunMsTDuk
         7qingt2fybRZIfBX9kImb3g0GMJmSpoAVWWx7mui+U8p3juV5txPi0RzYbxgu1x5mpO7
         hfH358rD9xfvrWZjGr9m3tKxQRxvb4yHQx/FMzSdEIorUoD3C35vhRwfqafZ+nVfErmk
         kuLqFBkIH29ZNIVYRpzf0NbJ8Jv0DEVLlrs5x0f/RyH2BWbtxHjsOYAz6z/eA2a7ox6P
         W4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244982; x=1788849782;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0mkAKxF+MYjQouhURxCh1vledmCnXNSmvpvHTqzwp4=;
        b=MDrugFronPgjGW28yRIh3QUsMkAQb8T8JvsQPPEEsbURREybq11EHwJCTDOCUTnalM
         jS8c90LRcpcz4GtTBZKI2wHfUAeyecienW8ce+QirHugYRgG6DysqumfVHtrvNWQxadP
         ppmmjsa0c3RYlMHrjJxBCUXQPrZaROTSLinZEa52R5Lj3yK9t0VQv1CXSl95JZqaijJU
         UTc3v1ug52KG/IE79iNl1k1GY8hKmuBq9TQOSSftT3SwRCiAZ5cAlLXotW/ZQyF1klYY
         05T4n5mPXmhxpN88oHDZiVTweQVPt2+PC6O8ewqrX2qp3K9ySsQWRX1A/9BndYikKbEX
         iBnw==
X-Forwarded-Encrypted: i=1; AKwUvBy1cGOpcUFHPHz/MKHznSy6F4HZmZJNe1zIfBdET9dgnxwi6rp10MUYIaZqQwNPCQmjGAvNWLcMxoERI0k=@vger.kernel.org
X-Gm-Message-State: AFuF++nzO0TiVmS0e78O5hzw5vSsV/oHpA676/ZBsiu6iHlMI+K64A8O
	MhaXfT65EetYdi0jM1VRzJa4APkk4bsKFoTF7BX8ZTCQmtp5Lcjc6vvHo/eOeXpc
X-Gm-Gg: AYBFou1QxzoPaeHg1TrRMiyg8mTyG3wuFM+GUPqwVhtOm/7SchekK3LtLiPhdlI41Cj
	J0NScRLT5cAJTGT0Gttk0FbqPGKB2QvbMecCXadpYeyYm/AETW32EvqcFymJ+iaJge48ciHDxkh
	1ZmZGgNUXK0i70ChN+laccgL3Ghi22YIBVXWryIjAek0nFf/sqpaorJ5weZa3TJeXNwoey1/Ve7
	EiBZNcfO/9/hOWL6W0n/SiLqyHlSL6yhbJUYvuXIasZDQO2ppP5YTOgcbwjdS+yyVo+mD77n6R9
	SGXUGzX/Ollk2lIqRG3SmUNOKAA0ThN6JPOnjIa2gg3TSfjXDItjz+n9TYipsmOkBBEYxkdPgbI
	MLLuoAPu4EGMjSMT818Tva+2FmmlltiHg9Jj253DKnHoVMXGu86jljNqNbvNyUOsIkXpvmPhqwr
	o80xXzmK7xa0498tNdL0pGbVtx2w+SfPbyl+Z/Lw2MZ9gFQTDdsDHakJv3AzlIQzVNspwzLgSwZ
	30T15Sh3xhyvEA4GGywet/L99/TDYVH
X-Received: by 2002:a5d:6dd2:0:b0:484:416b:7590 with SMTP id ffacd0b85a97d-484416b764emr6601921f8f.10.1788244981559;
        Mon, 31 Aug 2026 23:43:01 -0700 (PDT)
Received: from Minno.localdomain ([193.192.121.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm2724832f8f.13.2026.08.31.23.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:43:00 -0700 (PDT)
Message-ID: <6a9673f4.cbade83c.66f7c.3d66@mx.google.com>
Date: Mon, 31 Aug 2026 23:43:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Taha Sezer <tahasezer.is@gmail.com>
To: ljs@kernel.org, akpm@linux-foundation.org
Cc: david@kernel.org, vbabka@kernel.org, mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: vmpressure: scale window size based on machine memory
In-Reply-To: <20260831130316.448-1-tahasezer.is@gmail.com>
References: <20260831130316.448-1-tahasezer.is@gmail.com>

SGkgTG9yZW56bywgQW5kcmV3LAoKVGhhbmtzIGZvciB0aGUgaG9uZXN0IGFuZCB0aG9yb3VnaCBy
ZXZpZXcuCgpMb3JlbnpvIC0tIHllcywgSSBkaWQgdXNlIGFuIEFJIGNvZGluZyBhc3Npc3RhbnQg
KENsYXVkZSkgdG8gaGVscAp3cml0ZSB0aGlzIHBhdGNoLiBJIHNob3VsZCBoYXZlIGluY2x1ZGVk
IGFuIEFzc2lzdGVkLWJ5OiB0YWcgZnJvbQp0aGUgc3RhcnQgYW5kIEkgYXBvbG9naXNlIGZvciB0
aGUgb21pc3Npb24uIFRoYXQgd2FzIGEgbWlzdGFrZSBvbgpteSBwYXJ0LCBub3QgYW4gYXR0ZW1w
dCB0byBoaWRlIGFueXRoaW5nIC0tIEkgc2ltcGx5IHdhcyBub3QgYXdhcmUgb2YKdGhlIGRpc2Ns
b3N1cmUgcHJvY2VzcyBmb3IgbXkgZmlyc3Qgc3VibWlzc2lvbi4KCkFuZHJldyAtLSB5b3UgYXJl
IGFic29sdXRlbHkgcmlnaHQgYWJvdXQgdGhlIG1hdGguIFRoZSBvcmlnaW5hbCB3aW5kb3cKaXMg
U1dBUF9DTFVTVEVSX01BWCAqIDE2ID0gNTEyIHBhZ2VzLCBhbmQgbXkgZm9ybXVsYSBjbGFtcChm
bHMobWVtKSwKNCwgNjQpIHByb2R1Y2VzIHZhbHVlcyB3ZWxsIGJlbG93IDE2IGZvciBldmVyeSBt
YWNoaW5lIHVuZGVyIH44IFRCLgpUaGUgcGF0Y2ggc2hyaW5rcyB0aGUgd2luZG93IG9uIHZpcnR1
YWxseSBhbGwgcmVhbCBoYXJkd2FyZSwgd2hpY2ggaXMKdGhlIGV4YWN0IG9wcG9zaXRlIG9mIHdo
YXQgdGhlIGNvbW1pdCBtZXNzYWdlIHByb21pc2VzLiBFbWJhcnJhc3NpbmcsCmFuZCBJIHNob3Vs
ZCBoYXZlIGNhdWdodCB0aGlzIGJlZm9yZSBzZW5kaW5nLgoKRm9yIGEgYml0IG9mIGNvbnRleHQg
b24gd2h5IEkgY2hvc2UgbW0vOiBJIGhhdmUgYmVlbiB3cml0aW5nIGEgaG9iYnkKa2VybmVsIGZy
b20gc2NyYXRjaCAoQ2FlbHVtKSB0aGF0IGluY2x1ZGVzIGEgVk1NIHdpdGggQ09XIGFuZCBkZW1h
bmQKcGFnaW5nLCBhIHNsYWIgYWxsb2NhdG9yIHdpdGggTlVNQS1hd2FyZSBhbGxvY2F0aW9uLCBU
TEIgc2hvb3Rkb3duCnZpYSBJUEksIGFuZCBTTVAgYm9vdCAtLSBzbyBtZW1vcnkgbWFuYWdlbWVu
dCBpcyB0aGUgYXJlYSBJIGFtIG1vc3QKY29tZm9ydGFibGUgd2l0aC4gVGhhdCBzYWlkLCBjb21m
b3J0YWJsZSB3aXRoIHRoZSBjb25jZXB0cyBjbGVhcmx5CmRpZCBub3Qgc2F2ZSBtZSBmcm9tIGEg
YmFzaWMgYXJpdGhtZXRpYyBtaXN0YWtlIGhlcmUsIGFuZCBJIHRha2UgZnVsbApyZXNwb25zaWJp
bGl0eSBmb3Igbm90IHZlcmlmeWluZyB0aGUgb3V0cHV0IGNhcmVmdWxseSBlbm91Z2guCgpCZWZv
cmUgSSBzZW5kIGEgdjIsIEkgd291bGQgYXBwcmVjaWF0ZSBhbnkgZ3VpZGFuY2U6CgogIDEuIElz
IHRoZSBnZW5lcmFsIGlkZWEgc3RpbGwgd29ydGggcHVyc3VpbmcgLS0gc2NhbGluZyB0aGUgd2lu
ZG93CiAgICAgbG9nYXJpdGhtaWNhbGx5IHdpdGggdG90YWwgUkFNIHVzaW5nIGZscygpLCBvciBk
byB5b3UgdGhpbmsKICAgICB0aGUgZml4ZWQgNTEyLXBhZ2Ugd2luZG93IGlzIGZpbmUgYXMtaXMg
YW5kIHRoaXMgVE9ETyBpcwogICAgIGJldHRlciBsZWZ0IGFsb25lPwoKICAyLiBJZiB0aGUgYXBw
cm9hY2ggaXMgd29ydGggZml4aW5nOiB3b3VsZCBrZWVwaW5nIHRoZSBvcmlnaW5hbAogICAgIG11
bHRpcGxpZXIgb2YgMTYgYXMgdGhlIGZsb29yIChzbyB0aGUgd2luZG93IG9ubHkgZXZlciBncm93
cwogICAgIGJleW9uZCA1MTIgcGFnZXMpIGJlIHRoZSByaWdodCBkaXJlY3Rpb24sIG9yIHdvdWxk
IHlvdSBwcmVmZXIKICAgICBhIGRpZmZlcmVudCBzY2FsaW5nIHN0cmF0ZWd5IGVudGlyZWx5PwoK
ICAzLiBBbnkgb3RoZXIgYWR2aWNlIGZvciBhIGZpcnN0LXRpbWUgY29udHJpYnV0b3Igb24gaG93
IHRvCiAgICAgYXBwcm9hY2ggbW0vIHBhdGNoZXMgbW9yZSBjYXJlZnVsbHk/CgpJIHdpbGwgaG9s
ZCBvZmYgb24gdjIgdW50aWwgSSBoZWFyIGJhY2ssIHNvIEkgZG8gbm90IHdhc3RlIGFueW9uZSdz
CnRpbWUgd2l0aCBhbm90aGVyIGhhbGYtYmFrZWQgYXR0ZW1wdC4gVGhlIG5leHQgdmVyc2lvbiB3
aWxsIGluY2x1ZGUKYSBwcm9wZXIgQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00IHRh
Zy4KClRoYW5rcyBhZ2FpbiBmb3IgdGhlIHBhdGllbmNlLgoKQmVzdCByZWdhcmRzLApUYWhhIFNl
emVyCg==
