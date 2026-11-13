Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604655;
	b=T1NfsMlhGG9RAAKokGAUfpWsb/Pe7BNpkhXaym0TX/3AFPyamHTF3ukIDNWRSj2jO7T1
	 nTrrkPnXhgWDmbTm2pLXngTKaaRvI5IssI+fuonmUinN3QGuDIMLGAnsht7w/9M8gsKgh
	 CUmOoNROWcRfuPGAVU71lYLeIc6tF9jc3nnP89sHojIQBS38TOREM6x5ndV3798myTlMc
	 UDKhd9H257kIMOQJtGn0FQPsAfjlp4WhT3zppIFTVp7VKFC6/wP20NwMrJ3n2PrKP+doQ
	 1CPYmZHzgZsGH/v3tGlMvtlfRVS0uE16KtBLn5Rw4NIP6Y6SKT5ebjOBwmytIdPmY8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
	b=pWqcX04nApPNL4yQyFxgt0mh3Hs6jYakgNz2WuRftOmStCLfYFF+FEuyPZBq9673e9X4
	 0ntCE+krkzrBdS7OcNNX0uUOb1bLGM+azSvD2lEbZ911giyu1olrfB/3SBtnN42SOCiVt
	 8eodJguneC85+GoFZEF7HdO/T+pEx0HvCAFjOrYHtBirYC68d0NN6WQHLRbGOyAFGuRzJ
	 498ruTRLjKVGkLQzHUi6j4rDWd9Ix7EGpFmxZAd0Bh+ErGQWkHee7cmOUt3WEtwet93VI
	 qRGeWqC3h3YH1MM6vN/RQnZK94K0o+E9uIjIZSA7fNwa7ZEyx5OM5PrTrPrq5L/ye0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2WBBlH+;
	arc=none smtp.remote-ip=74.125.225.133
Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF61606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF61606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O2WBBlH+
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so4819825e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794604653; x=1795209453; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
        b=O2WBBlH+sEuEaGq8nMhpEC31wLP5cHyACfvnWFyo+t8kE7jALCAQIcPTk/4iKYTfCi
         SfM6XAr5s6RuqMydSXxsKsgAPnzincklnEBKZZv0jfEbpykjUvXHA+yOhQv+lzPXtdUx
         oS0/tszRxuDMJDIFP3cw91zaMXEOlyOqFoXUTIN7DtElV5HM9S1+nDhwKTXSaU7QN+NV
         kXOBmQC9QvP7wXJh6f7jXHnDOHHzbL+0nWAreDq+qIZCy+eh1p2cK2rBX/bqo9KCJRCc
         +O/8Pq4LXYXiliUbyO8HyNs9N9bFKWwvgXjEjCqlSo6UBTxo6c+/+sUb72QA8+7gec9k
         a/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604653; x=1795209453;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6aPUW+7oKXPB34EDeB5hJ9aJz7OSIPu7ZV/Lj6Y/8o=;
        b=Lc/eRQaze/OXcu0+XXyBnEoJay9xzhmGKvuBXnfkkPp8kGvFUV+HgjtJyXyLdXO9xv
         CBSLlK6fTFo1Nekbf2s/I5b4xuGITYF2CMk4fAMpLFxmoni4FM5bE1ixTtDlNQUBAZKg
         bnZIRvYe42vFE/8l5JZHViesgFudzUqPMLo8MlZ8hZevcX7rHxxV0jnbBjlpEHXy2tuQ
         VF3aeNejfjP+RhmQ05uEm0SyhRwiOY39p3JAbGeMzpjqfHEFxcfxRkljt+0JltTnZhQ0
         wA8bJOZq3yMcmALEwiaZwUOsJYJDno6t1N6uVQxRQAxbeJt1VePTckHuX65fm7aD388b
         VZJw==
X-Forwarded-Encrypted: i=1; AL+hErGW8Ea7w/eSSeigwv7DlgAPgprC+nah5jmOazyJnGKbwGdpsZlRJztDcS+9JreiH5Df4xAcelqUXQhH8UA=@vger.kernel.org
X-Gm-Message-State: APuU4Z86vjL1jGzm/ivBsZogOsXfbVXY0lRctdo9Js3jAmFSskSmKvw8
	ZGAAs9UUPhaH05EQkSX/0+1EkCratw7T/BIxdaEZW1tiV3PThtLFMHK+
X-Gm-Gg: AYBFou2NK8h7Kg/sU7s2RZJ+2syd6K+0FxvvFliUJ0GdMmZ3Nvb051q4D9kV4GYkvHz
	rXp/h/PqrZJkEXdi+SgrK3ad84bnkdhgELQOPvy5ksNrIpNQXehg6QtRj8De4LSg+X7MiZCrJKR
	tqHQPnyq7dfAth4yp4Fu0R1bwUyi83OnSFu9AIJZmgyEtrmvr01+709ynJAg84QeNjgittwafw2
	Zxr+Wurn98YjfGr/970mjqvWaPzq4fZBMLpzOfBUGYKztvagamuF0OLIRSLAoQT7HETVpNC7obF
	3yzcJUlAf+XapIpKbmWWtWuMU95n2chkiYGFvJ9kKjKedSp7b+boE0y8PDYpgd71ctNfAGRBJiL
	/QE+J++6/ihoOVxqfq/IzhQC5qCfH7T48CIguHV5e3Oq5Nd/tRT4Lygz1/x/t/7o7/88wi6ciSJ
	2mUpTJGb5BSt+tQJDP8yNxd/IG8Nc629Wg970M79Lpo0FH/x5YywkaIvvxLShwWTFo2D1lOn6Dh
	YLv9TXiM0UIs6+LXGnbHUvvGkrBxE9pSuBeFPe9SCQUKi6KZahA
X-Received: by 2002:a05:600c:470a:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4bb55a01bf3mr80266735e9.2.1794604653483;
        Fri, 13 Nov 2026 13:17:33 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm30939805e9.2.2026.11.13.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:17:32 -0800 (PST)
Date: Fri, 13 Nov 2026 13:17:32 -0800 (PST)
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
To: broonie@kernel.org
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16
 X1607QA
In-Reply-To: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
References: <d7b0ac39-f204-46ec-9614-460611a7ae38@sirena.org.uk>
Message-ID: <cb70e9d4bc154a52ba5d9351baa57191@gmail.com>

SGkgTWFyaywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KClVuZGVyc3Rvb2Qgb24gdGhyZWFkaW5n
IC0gdGhpcyB3YXMgYSByZXBseSBpbiB0aGUgb2xkIHRocmVhZCByYXRoZXIKdGhhbiBhIGZyZXNo
IG9uZTsgdGhlIG5leHQgcmV2aXNpb24gd2lsbCBnbyBvdXQgYXMgYSBuZXcgdGhyZWFkLiBJJ2xs
CnNldCB1cCBiNCBiZWZvcmUgdGhlbi4KCk9uIHRoZSBjbG9jayByZXRyeSBpdHNlbGY6IGFncmVl
ZCB0aGF0IHRoZSByaWdodCBmaXggaXMgaW4gdGhlIGRyaXZlcgpjb3JlIC8gY2xvY2sgQVBJIHNv
IHRoYXQgZGVmZXJyZWQtcHJvYmUgcnVucyBhcmUgcmV0cmlnZ2VyZWQgd2hlbiBuZXcKcmVzb3Vy
Y2VzIGFwcGVhciwgcmF0aGVyIHRoYW4gb3Blbi1jb2RpbmcgYm91bmRlZCByZXRyaWVzIGluIGRy
aXZlcnMuClRoYXQgaXMgYSBtdWNoIGxhcmdlciBjaGFuZ2UgdGhhbiBJIGNhbiBtYWtlIGFsb25l
LCBzbyBteSBpbnRlbnRpb24Kd2l0aCB0aGlzIHNlcmllcyB3YXMgYSBzdG9wZ2FwIGZvciB0aGlz
IGxhcHRvcDogd2l0aG91dCB0aGUgcmV0cnkgdGhlCm1hY3JvIGFuZCBTb3VuZFdpcmUgZHJpdmVy
cyBzdGF5IGRlZmVycmVkIGZvcmV2ZXIgb24gWDFQNDIxMDAgYmVjYXVzZQp0aGVpciBjbG9jayBw
cm92aWRlcnMgcmVnaXN0ZXIgbGF0ZS4KCldvdWxkIHlvdSBwcmVmZXIgdGhhdCBwYXRjaCBiZSBk
cm9wcGVkIGZyb20gdGhpcyBzZXJpZXMgdW50aWwgdGhlIGNvcmUKc2lkZSBpcyBzb3J0ZWQsIG9y
IGlzIGEgYm91bmRlZCByZXRyeSBhY2NlcHRhYmxlIGluIHRoZSBpbnRlcmltPyBIYXBweQp0byBm
b2xsb3cgZWl0aGVyIGRpcmVjdGlvbiAtIHRoZSBkZXZpY2UgdHJlZSBwYXRjaGVzICgxLzQgYW5k
IDIvNCkgYXJlCmluZGVwZW5kZW50IG9mIGl0LgoKQmVzdCByZWdhcmRzLApEYW5pZWwgQ2FydGVy
Cg==
