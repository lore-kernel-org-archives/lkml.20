Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603755;
	b=bgeS7jPJzL57FVID9NH4ptxsfYbTlNsPq1ltTSh7DifccNT7yzpORQtcaNAM+ziyPf81
	 hQpEcbs90O3rTAR0SrA+Iv7Z4/4HRFR9QlzC/olw0yWldKOgT1ZzaEXF1BZfIeGnpvH0f
	 c1qlEegUKGYxDtpL/8hRly8cK8suSU9Z5+3hJOpHWviMUKxecU1M1w4d22U9NXTvkLE1a
	 OHCuKLTijfkgvrLySlOEHoUfLKsJoIbzfo7BJGWz5jnLOq/+SB14Aj5BkxDOPC0ZiXw3x
	 ogcRSWaHeSbuyGPER2uzIyrzRDH0VR+4SDaKk8n990Vw/4sSHlrc//DUt+GtShbUtqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
	b=bP4YaPd+kTHN21rQD6IQAwfwSkOEGx8BGkHMT5wo5gVMRb7FVug3VpNDJCgC0E7xwOGE
	 JgVAzEyENaiMvuNLWfULNTcx6SugZhT1s4cI7OvU8grdYpFloLtNoXcZDJM3Pk9BR6/a/
	 8kkvxz075SZWnJsZz2bDVvi3fHl3r0+pw7RVMcviAL1tH2wVv3E4i1byPw9SSR+eAIQKU
	 xbhjiJjFRNFwGc0N7pB7DClhc+DVDl06jUwQEGy4gR3I+HUkJYO64l+swOhym0FrqooQI
	 M1FuYOxmi3jN4olwn7ZdRSfJ3zDuYMBoamUxOApLcvMNwur2g8jeGy9RhkQxty3QeeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S20X9Bz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CFC606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CFC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S20X9Bz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso18658695e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603754; x=1795208554; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
        b=0S20X9Bzah2+Tfz2ZQZw1RqrYJZoCU9ymtgMPp6uzL8ErAT7IJhcPcjTW62UYeCDR2
         tKfBYXayDMZmeIzcu001CRANf/r0KwcFunyPz9WusvFx7EBIlRSQMGj6LM1BgqCUguO2
         SAVSd0/U8H4U0XTIVhOwG2aiq8jNrQ70Vj5HtxtBJ0YqXz7q9qGQN5oeqnAfnNAvZVhg
         TR0MsIdEueeVx97MS/+trojKIKAnvpsn6deSKdRtUqiR2TEPre+hN5cRvp4oFdGnTyZr
         e0028uedLhvG271P78vpW2+1KWYpsNLpWtKC67NWDeUSCewzmQsCnB5dx5rOzn5rQiBn
         hIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603754; x=1795208554;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
        b=nMyk2Fd1cZeRAfAy8NZq6o+rDlhf68PCWfCavboF8115069Q8+b9OG7DBs19WARmi5
         JauPUWqeh0uwP71r3Uccc3jKFk9WmBya4+xIAuRavicxzFkUTeM9z+G03vadniQTWrce
         gev/Px+T77MwjycLEtPLOLz0H97VdgKTQt1oYvEyxH8FkzJbzSbChdPOh92O8FrTJZD6
         eRGfSouXz0p9zCXqOO04p6dJDjQHVoFi63/zfSmXYH3oXAgE2ERVoUNNn0JUSQ+Ounzk
         vTd7ysm21LfHMT0ClLvcobM7ZdJAuVCBQPuT14yMUoIWz0hpPDv2A06nkIfY1clFSdNu
         0ISg==
X-Forwarded-Encrypted: i=1; AL+hErFNCqyuKg8h8j/cVCm/6x7xzO7b87zhDb689Nd12seeYq0dcKigVJ3t717x9SQ4k9mSO7p+AlsKNUS7m3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NK6gnwnEgAPHXefPHL63E6DlOe3YkMw2jckvZjQ0bZzyFzyLY
	GQlfcFimSH1CKlwSn7Anpfb1us9Z7G0TncPCSQTxnNpEKtGCrYfGXFW5
X-Gm-Gg: AYBFou3v9ruL+WEDKetwxH8DPPghFtnidpIXhfPdvdN86Ql5f9X44jrTOKZHJRtT6d3
	RgSkaW03tXwog9bcKN46jNUyYOZCed7yOzAmcqTupaYts7F2akopzGpB6wFJQzQDLSJhoRfzQtp
	lMyrTucuEMSbmH+N9ElHmkKMOaJzKcs+Cq7AqdTTaXrnvbH2Ul2w2CRlWLMxHLRBDmlndwvM727
	Uj578c+1WuhfX+PUM/b4rCL+l+YgOCAb8/HVRc+8j7pDhq6GEj4C6wiz32ZCVkn32wjPGDzoyES
	vC1c1JNrlFV2r0yTVAhy/1dYEbyg+DGnM+rOjrnONcCdEJOkzWQS2vQU6V59osScD8QHnP7y0Rs
	Hc059l7CG7hAxRnMEZ1HIbvL4cQz0UMExKsaJaWCk3cKcnviDgW9BfTORP6mPKFs3CjP8bwp5GP
	yDht9ZvDnNXRzzVtge/il6v4X/Wv0LmllL4JbmTU1fwM4ZDHngdNvpX6xl1tQyqZjuQmRUpjOxF
	0LeaWfrAkn7S+SC2eK90PbpbyWAosyW6uqO+pfg5Fs5qvpb+gZ+
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr53419345e9.34.1794603753909;
        Fri, 13 Nov 2026 13:02:33 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:32 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:32 -0800 (PST)
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
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA - v3 series
Message-ID: <0a29235e23b24698adc59fd117e0a222@gmail.com>
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2MyBvZiB0aGUgc2VyaWVzLCBhZGRyZXNzaW5nIHRoZSBT
YXNoaWtvIHJldmlldyBvZiB2MjoKCi0gYXJtNjQvZHRzOiBhZGQgL2RlbGV0ZS1ub2RlLyBmb3Ig
cG1jODM4MF82LCBwbWM4MzgwXzZfdGhlcm1hbCBhbmQKICBwbWM4MzgwXzZfZGllX3RlbXAsIHdo
aWNoIGFyZSB1bnBvcHVsYXRlZCBvbiB0aGUgWDFQLTQyLTEwMAogIChtYXRjaGluZyB0aGUgVml2
b2Jvb2sgUzE1IGRldmljZSB0cmVlKS4KLSBhcm02NC9kdHM6IGFkZCB0aGUgbWlzc2luZyBxY29t
LGRtaWMtc2FtcGxlLXJhdGUgYW5kCiAgdmRkLW1pY2Itc3VwcGx5IHByb3BlcnRpZXMgb24gbHBh
c3NfdmFtYWNyby4KLSBhcm02NC9kdHM6IGFkZCB0aGUgLWVsMiBjb21wb3NpdGUgZGV2aWNlIHRy
ZWUgYmxvYiB0YXJnZXQgYW5kIGZpeAogIHRoZSBNYWtlZmlsZSBhbHBoYWJldGljYWwgb3JkZXJp
bmcuCi0gYXJtNjQvZHRzOiBjb3NtZXRpYyBjbGVhbnVwcyAoc2luZ2xlIHJvb3Qgbm9kZSwgZ3B1
X3phcF9zaGFkZXIgdXNlZAogIGRpcmVjdGx5LCBzb3J0ZWQgbGFiZWwgb3ZlcnJpZGVzKS4KLSBB
U29DL3NvdW5kd2lyZTogbWFyayB0aGUgTFBBU1MgbWFjcm8gYW5kIFF1YWxjb21tIFNvdW5kV2ly
ZSBkcml2ZXJzCiAgUFJPQkVfUFJFRkVSX0FTWU5DSFJPTk9VUyBzbyB0aGUgYm91bmRlZCBjbG9j
ay1hY3F1aXNpdGlvbiByZXRyeQogIGRvZXMgbm90IGJsb2NrIHRoZSBwcm9iZSBvZiB0aGUgY2xv
Y2sgc3VwcGxpZXIgb24gdGhlIHNpbmdsZQogIHNlcXVlbnRpYWwgcHJvYmUgdGhyZWFkLCBhbmQg
c2hhcmUgdGhlIHJldHJ5IGhlbHBlcnMgdGhyb3VnaAogIGxwYXNzLW1hY3JvLWNvbW1vbi5oIGlu
c3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlbSBwZXIgZHJpdmVyLgotIHNvdW5kd2lyZTogY2hlY2sg
Y2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZhbHVlcyAoc2VwYXJhdGUKICBwYXRjaDsgcHJl
LWV4aXN0aW5nIGlzc3VlIGluIHRoZSBkcml2ZXIpLgoKU2VyaWVzOgpbMS80XSBkdC1iaW5kaW5n
czogcWNvbTogZG9jdW1lbnQgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsyLzRdIGFybTY0OiBk
dHM6IHFjb206IGFkZCBkZXZpY2UgdHJlZSBmb3IgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsz
LzRdIEFTb0M6IHFjb206IGxwYXNzIG1hY3JvIC8gc291bmR3aXJlOiBhc3luY2hyb25vdXMgcHJv
YmUgd2l0aCBjbG9jayByZXRyeQpbNC80XSBzb3VuZHdpcmU6IHFjb206IGNoZWNrIGNsa19wcmVw
YXJlX2VuYWJsZSgpIHJldHVybiB2YWx1ZXMKCkFsc28gb3BlbiBhcyBwdWxsIHJlcXVlc3QgMTQz
OSBhdCBnaXRodWIuY29tL3F1YWxjb21tLWxpbnV4L2tlcm5lbC4KCkJlc3QgcmVnYXJkcywKRGFu
aWVsIENhcnRlcgo=
