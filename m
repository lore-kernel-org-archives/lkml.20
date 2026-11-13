Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602017;
	b=fRvzSA9RfoU/BZdlUIngh+MBhN4J0l/w71So2f2cCLXJOeh0z9oiYqbIL1DYszPZyPNC
	 YDRJVeor/EbEHIU7EltuS341509wXpctLlQSBFsrZuIig4R+akyvTqg+WfQuRPCtYkxq3
	 SCSb8Til9NdZ9Qt0GupsAbgNSPK4KjoWZcWH4posGTfEr0F3YPPZVy80JQ4cdIR19bXSb
	 ++M2bewv+tWsg3DApHIYL+9oOoNlpIbU+ZwXWd65jn10jziieWwudaQf7RbD5dLo/oC5w
	 h0X0/rtT6P/7yCgeXG7jFcW7t00qdFVqBP0MijpYMkX0BbuE2BotdX/2/chFfuLgkWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
	b=0xd0Uqv/1gY8RKrmKBBZ5VetDub90NC0gCNYZ1UdxmlMvzmBfdn84TG7Db/QxhXL113W
	 sj4kdLUo8+ZZ3QQyDlH7zMwy9KOiUb8Y1VbS3kBSYDXCrp4mS4RUyf018pL7j5cKOfQXR
	 teW/XfG7gYge4sHPoaOIQSKDJhFhBJ0BhawNRKANVqN8O16JMB8f1rpOGMfQEcEWkpcjG
	 ISd1nBC2OI5YbDXoDS55utdjcKhoXl6b+z3EafWuikiyVJeFPTshgZ3OCIcnlYHeoc5Bx
	 345t/sWll0J7W85HFfOrtlG3ixSUDKaXb6X8IXmxg0/EcfcfZnd7vKtM8To3yboeyNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A837606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A837606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSY5bQ6m
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so21224455e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602015; x=1795206815; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=wSY5bQ6mHQtE7OEqfQyqajUidx6WmK8z/6DgbSY4eXxeMaI2cn/UEYpePyM6Dka2jV
         6jGyEtVtq4E+truNrt7G16Tso1F+brW6nQ6kzxtDVypoYSx5Sq2l13+8p2v5xWBj6B77
         ux6letY3KZbzw0JyToVj6Jofc9E164wVGVQhHkwlbp7e2w9iqbhQGeWYIUonXe/PUq/y
         xz5Nv+4VJewgv8F0A+TgTEmH5jweg4iZyDhbagMHF1uL1W27oa+/eaqGxJuos3mjBo3c
         nxq/dXf75zueN++GoRfXIu43thk85yIou8Xtl/GzocW2Pu2WUNse720dwfcS6dJswdae
         CaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602015; x=1795206815;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gEGhQyig/fNEybsXDYKz1iMP7UMP4XGYfAVUX5I4Sh8=;
        b=2HCgZPsSmNejlbn/y2mnQD4IAQDGIsGmuukHUHjBjeoy3JsV1T+nj00UtnzqSIS5P8
         nL8a8fUqvGYqks2Fivbpx+MIz5vvSXxOrQ/x5U1YHP4NIR7RHxsuj7C4whwI77O6bKtQ
         ttto7MPWtP3ctpfj8BbrZWtcHv4UBpVJSX0hzRuAsKnBetzAcI2JeXrqrx84hQF42+0y
         zSr1vimx0erIFDPepH18WWfnwQZaARR02yEXzgBOFXCIySHvnK7whuDQ0Gb+W8JBojDk
         HtBDw/myhRUKxEfuKKqNND/RriIulpUa3y0YtZpO5fQGt7dGg8YF/5iwYGo4TWt4cUDX
         npFg==
X-Forwarded-Encrypted: i=1; AL+hErGs8oCt/QdbTeNBLEwCkQsietyPE9q3eUsjhg1YAroQpuq5uoZnCLJDVCF4P+FGOnZ97l4e8GKKeYlYXk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5tdnYRUQzoX3UrMXAZ+dGN4XjLlveTrbd21bZjQlQAbetJSxu
	PEy1GyTdOrUJBtdXfnDrUsZDnX06PPFEExbbr0GTqJl9DKmZkIweqJ79
X-Gm-Gg: AYBFou124bUwyHnttX+Tr6pW11OC+vUyuq45vvHTwQDFiG5yr2N9rFCu3t13mWo0uLO
	jsYKw1HWUfHYiLI7g/KOtg6A3XSvw4MUKptzB0a5qX+IpupmUZgR36yMAIB+VfWhYqNhgOwbYxh
	qrxmhcEjbL7aoY7ndg4G0b9pbuVnaLW3ksl+xgv2Mwh1lLFLaIvsWFHGQm32Jo9xlNFjQ4tigoK
	cEzjhpDJsLFQdJIATVdWzxHSNG9IkjAs2+lKcGEN119153XzdZzmO059TT0Wl22QShfcbsmUE+C
	s9qIhs0MCdV/mgftrGn3yb9SdlMFhPh4tvf1REKuBfvlN7bo3ojBwHZWcrNLq+pauJxwyann8nz
	bTI3WtZKeaUf2R8ziQp38EIrd8Jv3YCtlwEEkLzEtB0KclofjH+yn38hxBJmd26MyGa2EXC4cCK
	9XY66e7PbELUUv49NiHLrHbD6UghpaCWa7Dr55aliFC98ybLGA/zpncctUUS2X8AyPZ5DAvcVdt
	FeViU1bzCo2SAF9WYsiSbFX0cteQP4cHIWP0EQmv7b94nA9jBT8
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr55295145e9.23.1794602015435;
        Fri, 13 Nov 2026 12:33:35 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:34 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:34 -0800 (PST)
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
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: =?utf-8?q?Re=3A_=5BPATCH_1/2=5D_arm64=3A_dts=3A_qcom=3A_add_device_?=
 =?utf-8?q?tree_for_Asus_Vivobook_16_X1607QA_=E2=80=94_v2_series?=
Message-ID: <9032798812284dd2842cbf003c75cc0b@gmail.com>
In-Reply-To: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
References: <5a61c395-9eef-4c97-99a5-30f434ad2c7e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2MiBvZiB0aGUgc2VyaWVzLCBhZGRyZXNzaW5nIHlvdXIg
cmV2aWV3IG9mIHYxOgoKLSBUaGUgYmluZGluZyBkb2N1bWVudGF0aW9uIGlzIG5vdyBhIHNlcGFy
YXRlIHBhdGNoIChkdC1iaW5kaW5ncyBmaXJzdCksCiAgYXMgcmVxdWlyZWQgYnkgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QuCi0gVGhlIGJv
YXJkIGNvbXBhdGlibGUgJ2FzdXMsdml2b2Jvb2stMTYteDE2MDdxYScgaXMgZG9jdW1lbnRlZCBp
bgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sLgotIHNj
cmlwdHMvY2hlY2twYXRjaC5wbCBwYXNzZXMgd2l0aCBubyBlcnJvcnMgb24gYWxsIHBhdGNoZXM7
IC0tc3RyaWN0CiAgbGVhdmVzIG9ubHkgdGhlIE1BSU5UQUlORVJTIG5vdGUgb24gdGhlIG5ldy1m
aWxlIHBhdGNoLgotIFRoZSBEQ08gc2lnbi1vZmYgaXMgbm93IGEgcmVhbC1uYW1lIHNpZ24tb2Zm
OyBhcG9sb2dpZXMgZm9yIHRoZQogIHBzZXVkb255bW91cyB2MS4KClNlcmllczoKWzEvM10gZHQt
YmluZGluZ3M6IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpbMi8zXSBh
cm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2
MDdRQQpbMy8zXSBBU29DOiBxY29tOiBscGFzcyBtYWNybyAvIHNvdW5kd2lyZTogcmV0cnkgZGVm
ZXJyZWQgY2xvY2sgYWNxdWlzaXRpb24KCkFsc28gb3BlbiBhcyBwdWxsIHJlcXVlc3QgMTQzOSBh
dCBnaXRodWIuY29tL3F1YWxjb21tLWxpbnV4L2tlcm5lbC4KCkJlc3QgcmVnYXJkcywKRGFuaWVs
IENhcnRlcgo=
