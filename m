Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862553;
	b=Szp4KzJ7Drw0OfhIKTGAnq3c2N6BF6oHXm0NTJBS9pCe25OQnYXcrAmoEAERgmlSwqhp
	 oFMHIyGTu7ZQzTVr9+nkhcIriljp2BXlGU0hyfoXT2z1j50ahRnvx+toAK2CLVc9RuCU4
	 kbU6PSauQlSWsul3wkN9b9zmAXId1f0rJuEKAjClJ0cuU2fKP14wg3AKMwIrPRvA/OMrF
	 JpxkpCmfwhmEvJYYZcVtG0VT3TMxAcO9oif7D9jSgVHCXI0BP6bCTviLGg3oesgbfNWHi
	 RBfEC4cc6iKEhYNhumTgR/ACQ1GrEcqpRUREEk4VSZ9Q9CEPgGYpFb68WzgEEcS5uyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
	b=a29Tiu5NCx9LsZhFi53Vas6uFoOTneu1AYd3fxGCLh34pH46HRUdf4Eu6SLPPxDPus1v
	 cZy8Nt2b54p5oO2C4cyxwnPXRk7Ug0i1YXXNZIbToyGLQG85hve5W0QApSHZwbbqoyIzT
	 mLN93S2VuSDn7V1K6kkBA+luqj87LFXY9+A7fUFrQF/R5pYV8iejj7fcm++xn9CU3ERyA
	 nYVr01Pk011nATamJUQZslewRcjpbdUmtrRi+5NaOnKwR+Md18vRo/0R8XiEvlzCcI39X
	 6TjDSwonSKHixfDGJ1+zxrSeEKHD4DvZAvtkGhJEPUJCFiBETQxlpShv1nXYT8YePRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B05606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B05606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso27488055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862551; x=1795467351; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=VhXSKqN2KUJdD6k1M2C4NY2RWNQXwLUMa7za0KGRNTAszgCYrmzIrdkvn3YP2iZASp
         Okn2ZahhPIfImI6ASXd9oczijF5PYBuze1NR3SYEI/SPa8igSIUyONqgJjxRqh0fggnD
         OAGgxT6vOcKq4YkYpXZwpRxKF8KioS+AU93pG5/WJab+tK+M7cUEZgQkfGjDBvJjpbMF
         OmGYDullBl6FYriNxEKpo6GxS/Stf/V4L0w1v2A75LXSX9u4WLPkm6a4Bw/IlxWZT1a8
         HseiGkliKx4G1IRTjhBU0w+LnGW8MvAjCoxKhsfkfCtu3fNSWNq8USbBr/UfPKMVXuuQ
         A7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862551; x=1795467351;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=G+oCTd+XfIN/FMyFZOl0gc5qz4asRwGwpwpMqXmBS3TB7vqmcA+hHnJPWxDKVaBUym
         Avp0wSPGGfAmP1jaPlcpQ3Xw00prgMdXsmlKC4RATw084s/+nRyF8kMrhIZOeGXIOsYG
         V6Fvl5UN8dfOLE+h+WHjowMUTzVfYlSA3h8kjSorIF97th/ZO9qqM53couWLv/KAbr5T
         7EgS3/H0rIpdAAxcjjNsXOS/p8f+mOGsn5h0m9z+3mdf3RzertCaT4eluHsgaSSU1YDr
         b2KCrbueJoYK0vgfbwQKC8dpBrf6YwxibyAXAKpOwUh319e4T61MgkrVQSbEQYIxDGBo
         o1dQ==
X-Forwarded-Encrypted: i=1; AL+hErHfhayfRbukg6UHjl9Lubjwq9GxT3suzCTufIQ6fGQ3hA4fznkGQIfjZeAHycfOKAuszcDiQTvjLkcJEz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wIbyWxwyj6E+H0oX8TNlVKBo6Re/jSdM/4qx7Z7AyclMeKm8u
	YQLwnACC2Icw+I50IkeGODGimoQcr+r8V4gdqgmy3k5rU3ON3ltkE/z+
X-Gm-Gg: AYBFou0I8ZaEhVLUDOhZz9UueXmWdYz3RL8w52fNHmvRj9sJuehLoG9mWDUJPHGa+7S
	/0+u6UGbAUwpzdxh0IFIye3puhU9xfLXK3E5pLGA5NN+hlrOS+cj9htgnKTbHhzpR6fVBLr4fmP
	cCJrSKgOdtdnbnS7Y8xO2kotDCm0IrEvx9oeatN1gylZA5UYDqQzjH7EFVtDpG4+5GOC5keklS7
	Pq/mCeLaKs1X6rS0ZIVB5ReoLHWjiBTzY0+fGWcp7HM1faWQFD/8ZWmVMIRBAR5K/KyyvBh4LWk
	0cFJNCV9m1XuBUjlkHGptgf+Wv1D5kgAaFS5xPy4WhOuGNDhCq6CtNBwU8KUuulUs0UALiStowA
	7TvV9JP1VtkGwo61XsmPmO9y05yvS0m3UsXNTcaJ6eoUaEllRpW4ln41yPWC6dMiEQFNBw/ReBR
	H525FJY1xvWtoN6pqGgC6PxSeefM9c55K7vyK34KydXK7pMBQa8XyFaBcwz3vSMIW0H6RIcS3+Z
	YmWIq5zJRK8CqUVdnwVK6dtrWWtFe2sKCx5N3nhJKGiyUmrq3qJn2OV
X-Received: by 2002:a05:600c:1d0e:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb55aa28e9mr258682125e9.32.1794862551105;
        Mon, 16 Nov 2026 12:55:51 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:50 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <c15d3417cda640aebc7bebff76b0448e@gmail.com>
In-Reply-To: <6fc5be59b56e42728e33595d5415441f@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciAocmV0dXJuaW5nIElSUV9OT05FLAphcyB0aGUgaW50ZXJydXB0IHN0YXR1cyBp
cyBub3QgcmVhZCBvciBjbGVhcmVkIG9uIHRoYXQgcGF0aCksIGluCnByb2JlLCBhbmQgaW4gdGhl
IHJ1bnRpbWUgcmVzdW1lIHBhdGggKHJldHVybmluZyB0aGUgZXJyb3Igd2l0aG91dAp1bm1hc2tp
bmcgdGhlIGxldmVsLWhpZ2ggd2FrZSBJUlEsIHdoaWNoIHdvdWxkIHN0b3JtIHdoaWxlIHRoZSBz
bGF2ZQprZWVwcyBkcml2aW5nIHRoZSBsaW5lKS4KCkZpeGVzOiAwMmVmYjQ5YWE4MDUgKCJzb3Vu
ZHdpcmU6IHFjb206IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgY29udHJvbGxlciIpCkZpeGVz
OiA3NGU3OWRhOWZkNDYgKCJzb3VuZHdpcmU6IHFjb206IGFkZCBydW50aW1lIHBtIHN1cHBvcnQi
KQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVy
IDx5YXNzMjcxMDZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3Jpbml2YXMua2FuZGFnYXRsYUBvc3MucXVhbGNvbW0uY29tPgotLS0KIGRyaXZlcnMvc291bmR3
aXJlL3Fjb20uYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9x
Y29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggYzMxZDkyMWY2NzkuLjJjZjJh
OGEyYmM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysrIGIvZHJpdmVy
cy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3RhdGljIGlycXJldHVybl90
IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJdTMyIGk7CiAJ
aW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKSkKKwkJ
cmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3RybC0+cmVnX2xheW91
dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRyX3N0cyk7CkBAIC0x
Njc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQljbGtfcHJlcGFyZV9l
bmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGsp
OworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5hYmxlIGlmYWNlIGNs
b2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYgPSBkZXY7CiAJZGV2
X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3ICsxODA2LDkgQEAgc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBzd3JtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAkJCWRpc2FibGVfaXJxX25vc3luYyhjdHJsLT53YWtlX2lycSk7CiAJfQogCi0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJaWYgKGN0cmwtPmNsb2Nr
X3N0b3Bfbm90X3N1cHBvcnRlZCkgewogCQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVy
YXRpb24pOwotLSAKMi41NS4wCg==
