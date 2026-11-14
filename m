Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645036;
	b=KaEqer8xnRRy0hDoOsRqx74dDu2bwnhqOp2rqddjU+M9pZ0JnirDsw0nP9HSyhGxYApg
	 qOJ0sNFrnNxBbQX9D7y8x4intJpLMvAkUNnr/y2Yec3wQCK9/eulHE+TTjd85c5/oPK58
	 sxMSMQBPyj8JorIOhCB8XElvOWjMB07PxXiJtuQwSP3OReozo+5r07/xb07NzSJ9r+sdV
	 vgrQXGwIjhL7ARNLdqrDzB16/WsQAzEzEFU1t1rL7532gaCqb2xM2PibLmqQTgQr55qpR
	 qib1jBf22RoW2eY0wDxpq+KYTjjtV1UyKEiBNPh9QOiDHFy4BF0Zd45YvS07V7YGB8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
	b=jDgXRe1TCmVsvhxh2Coabi7Fo7sQWieE0XdQwUztfRKovJSCGDQItaGrf84mMocQoCEy
	 MrRxvBMiPhwZsZbAnM5YDfiTyt9+uAKrO+3ZbNGMEiWNHB1lF9VkuYUgd5A2Lm9qaafRy
	 VXNk6YO8EKDV6YOfTZ5ZsZYHjuE103lhbsMOCpX3NygoBGpZKyITm1Qh877F6/MHngJRY
	 RzuHB9pMrpCoozqIIXlFKLfjU1YzTUfqptN/IGvBVW4FVKjJ80oj3UGEq42Yyu4Zs6VI/
	 6Aagn2KJKT1YtlAEVMbXTAs1a49V4cIWTeTi1OaGq3o7TXVlywyjAhCWuzc07pl5eLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tocbLiPW;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17307606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17307606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tocbLiPW
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so13851575e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645034; x=1795249834; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
        b=tocbLiPWz7ToPwlLUt4j3nC0wlhd5a0f/WMe6qNDoYiksejbN6KiVYB3r/nQ3y7vRi
         +P/YyAfi5aEPGSnuaul5LfAtsvSrVNtkSdCVZC7247HwGw/8FusEKtY9sHJGft/jHWL/
         b9PiN/M+pAFCnPtT8zrCdBW8W787JTVvC9gkCM/CnjqLqvJ8KG9Mrazz8GzD/qsm/3Et
         0tLVHQQR+oFgnxqcXFlr36bIRjK5kxhY8CaOsrygmT20GncZPAUocwSKnrMNHo1+EKOA
         xzHtSwaF9zeWsBktj0/bsdKGln21AzboydY0vo85JG5akHgme7Tffts74cHnbwtBEys0
         Qv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645034; x=1795249834;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
        b=fNEDYM90qd+78lrj/fNRoFW+k75auQ8cGoXeoZ9GKCl67Suvdvr6TArcMpBXqZKbjH
         0vI2qJjQwq+BSRDOuQOB9a0VHvj6/N1IhMntgxzOFMjh22kdqNiqORCSEPR/yxgyf0Nw
         AAfQmmKyjDt+02RlH0TW0x0Z2xp4z4+dOMoPFogtW1wulYtqbjq0LfBXxYxYT1q6fXdH
         owhfpRtKKsQiNVECU+TFEWtNckwp7bXxiuze4evRVdi3+oCxkFy76tk6JPHN86LdHVwA
         m/B1BPwNxqAnTdXWf+L70Cy3hRM9nzIlv/eeAsekQneSVPaAto6Ak5eq+9U3L01ozmX+
         AApA==
X-Forwarded-Encrypted: i=1; AL+hErEXcDLS/fhriVoMqo+9cP+bY+04tQSeMvgEbnbtR1TW02d+PU3NGrqs+++ZhqbMesfElgVpAdBklpyGFUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N3bwXTWliCpoIN4VRq2ar0g8mQ/eQmenLaxbkC6cn+iCyT26m
	rZufBy9ZCBj9RzeeBfGUagXCvmA14CZeJhCKdyE5ni2msMbl3WpzGCT6
X-Gm-Gg: AYBFou0D9YOGqK8ruDjKCzJWs57v08jTCjauoHjXoRoaWQpqKbI+SoBc3EbDlhrdtuF
	hoIJJo7Bpkz1r5ddlKrJyMNyB4k2+jkMdxrDa1oWx91SwiPxd0jZjF8GaqbXwnqmGfyEuX2niJy
	a04YLINURCYpP0PWooLDZEELe24q9aZbH/LKst9xBwuq+PKgCZ7ziJpDsM+Teju8S/X2mP5sYOV
	8lEbuhQkSj3OxUWFyrNIn7wDtMNLvYS4laqUiePMw9x7sS3yqX3T/BMqzqtcLkapE9DN79uiirQ
	Afq6Twj9tdUk9s6KfqWmlQirXHu+kJ0E2IsEXoPYmfhs4lmS4NxFozBUFEDYlbTgTO7Xt9dVEX+
	plqh0mnS4JZLbOfGEAlh6nGU0EmrcVG+YVXANGg7oktZfl8t4lxLahniYC2ih6Vqe1xJxl3IsHV
	bz/OmkL8pbaAJsVMaJ1y6SUjDgvYPU98LrI5SF8fbRCYSKtX1UN8e48z4+0lxHy96Dn1+iV+RxM
	1MmHhy36nHf/71A9FLL54GAwzSknDnYLQeNktIseJjOSfZs8rFL
X-Received: by 2002:a05:6000:25f1:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-49c7381a73amr9429791f8f.55.1794645034503;
        Sat, 14 Nov 2026 00:30:34 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:33 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:33 -0800 (PST)
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
Subject: [PATCH v4 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
In-Reply-To: <6ffb6f7ab9794a49a50771d23b3a1e1f@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
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
KQpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvc291bmR3aXJlL3Fjb20uYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvdW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggNmUw
YzVmYjEwZWYuLjYyYTQ0ZjY0ZGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29t
LmMKKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3Rh
dGljIGlycXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZf
aWQpCiAJdTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKSkKKwkJcmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwg
Y3RybC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZp
bnRyX3N0cyk7CkBAIC0xNjc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAK
LQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5h
YmxlKGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8g
ZW5hYmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5k
ZXYgPSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3
ICsxODA2LDkgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzd3JtX3J1bnRpbWVfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCWRpc2FibGVfaXJxX25vc3luYyhjdHJsLT53YWtlX2ly
cSk7CiAJfQogCi0JY2xrX3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCXJldCA9IGNsa19w
cmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJ
aWYgKGN0cmwtPmNsb2NrX3N0b3Bfbm90X3N1cHBvcnRlZCkgewogCQlyZWluaXRfY29tcGxldGlv
bigmY3RybC0+ZW51bWVyYXRpb24pOwotLSAKMi41NS4wCg==
