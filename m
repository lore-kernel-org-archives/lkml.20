Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603782;
	b=OGFxJb3O17pd/zOrvGX+ePJr2kUR+Ec4gIp76sGzYZjU+O2wH2y+MJMTqdZBe3x1hg3+
	 IaMjWkLImLSLNaBhlJhbZrLErwugq6+5OHXmvUqbeecrRTpYzt+EK40aP6OZmiaC9457Y
	 27jOja+YLYTaeL41GWv2cFXJd+193U7f1SeqxcTXUDW9BPkn3o+v0do6NHpNOuFg6tNsf
	 T45bDKt+vtFskY8ybbeSpJ4PgiG2aUJTZ/8JgsbxuA+61VO650yxSky74D+oKozNrkVdv
	 yPBwCHSY7IreVEjfhRK+l7NmK5dX4+NfH7xYoss62Lf5WEe83lvXknWZT6w/Hh4huwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
	b=JISAVVM1BYTzL9mmiUFUilI71WEWsOSEQJPoPqwVCcqA2LaMtsk8pLqU4CcItz6cGQVs
	 7xGdMtAo3NIPgUdBlTzFUxmHADoDceZnBRZXhyyWvLQ0YDxAMN+oipONrv9DPlJNc7BdO
	 ZnMxeqTBpQNuTGTvTEvZzBov+CUYce+qXpvknQbrVykbPauCWhqzhg2Dg8HwKc/LxQOwd
	 VzXF6hBEi03AaoWurY9HMI1pcraot3Lo+HQX4+jTDtsIdLyvtJfN/cpibB9KreU9Cb3sh
	 XpnkCPzNQt8G4JZx0aUHRKZVepvRbJ4IZgBy8VWqWzR6iMFp4mneekyv/TY7QWTWuGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15612606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15612606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8796155e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603780; x=1795208580; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=CHLACVWhovnsNiZdUJHI0G3UixV34Vj/LecHfz/DFEkccalsYUW3udTSzkysCOGL1b
         aDqILnh4yZF59Gy3/31VIkG/DkCRlPI6iuNa3m9Me9GUazkGC3JEKcBAsqH5XWnZt+QO
         oFn/p0TQpQxOcESlUjguSqrsQP99L0DpeWO2UgyV9wb3LuQF+UrrTIgYAoVwcHmdZMjW
         h2oOo1blRZdaUOf0Bf3p5EVNpebP3WSOOrD0jZCUQk5DCGsvzItGoOJS8k9yGgbyUAq3
         PIQX4Q/zT8wZtnkDKIaJvCRm0fifsBFShIovQqDY2okGec1NyQ5uZ1F+HMyORVto6fOE
         GzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603780; x=1795208580;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=zHwPBV5n55qJfF/pPYk9zlyT0jAmreyXckpwjqgTE2HlO9dUDpW9TtQx2DM17gtUtK
         M950cICVMcAqNW+UYrabM5qjf1rttX2rBhGhcIelvABF/fJfxXVq1CZ3HQw2EfIG1xEW
         jkuiIeI09vm49sCU56rJRAgYRlbXGM042/cd+YHwlh+KoNGWrcHSv2UBI01Wocth5PjN
         Ghq7vbAdLDtzZWNYYhaOL2BaGCF9mpcqU8lB+lOXedVA8Vlc9Ak3PQ9eS9EzUYGHj33f
         5f3AuwuUuLKMRQFS8XbeqocCjLwEJ/c+TOJDzJZO4hR7QEHf1NvTB6IB/+bDsuYxuRzl
         v5kA==
X-Forwarded-Encrypted: i=1; AL+hErEDjZKh32FGhExVMsTGRXxRnJ/+Qf1bl+QlhomjZMgvyxTAqphAlFKrsW7i3mPgWsENSe3MECXOLqy8C1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nutj3/amrQED0hSUbNMFhmTxfa9HGFqQKvsEC8bdYXt+DVXJJ
	0oNOb9F7nGhY8fonZs68npJ/pNFa3la/ExBICkTUl6da+6H1FpbZ24HQ
X-Gm-Gg: AYBFou23ZCUbYmPV6osQFyxWSuLnpGxAVL/Uib+scT/DR/kUYaC0kMZWS2aJz79Mslq
	p/0T96OEK1Q8Te2UcihijvSxIRsdTORopY4FhNnEcXwckWDfWr6r68rRI6FQCsJean7yowN8ZJn
	6LzrJ6Pw1VMWQC08reBqaFDqbt7uSDVrDu9w4fWI0wh6bxD1qDL2lJyvjvP+1HpFiOeRHo3Lq71
	XLYUNn22u+qvnYa4K5CI3cMe+lQrcZSZvapsnC8pXZKCxLLNM5WUHks97ymf74HSIqMNa/+bD2J
	p9nWebpDvjGENH/cAfv/I+2iPrjev1CG6ycJtEQATtYgz5wp8miqBRX8+gtdytKHKYtQ6BQJMoi
	VG3CfmONBtXoqaKKzSQKCWxkF6BU4d13/RBq0RBCktlQGDg5/k7I2nKe6mKwBDdqlmkqTiyBRmL
	tAZzgtS/6sgR+yJCrJSGtwDA6l01TcY+zqsj5jqsq03LenGL5+U/ujxMrZrDUWyDLRBC2qmPtyk
	F51BGmRcr8MZxzhhPcp0HXbMNJS13X1PkdEPvVGUz2IdHoCECn5
X-Received: by 2002:a05:600c:628c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb55a7f885mr75593975e9.31.1794603780470;
        Fri, 13 Nov 2026 13:03:00 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:58 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:58 -0800 (PST)
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
Subject: [PATCH v3 4/4] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <cc928d726ea34f5cb37fa140ca791e58@gmail.com>
In-Reply-To: <4aaa766cace2455ab6c75ab801df357f@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciwgaW4gcHJvYmUgYW5kIGluIHRoZQpydW50aW1lIHJlc3VtZSBwYXRoLCByZS1l
bmFibGluZyB0aGUgd2FrZSBJUlEgb24gdGhlIHJlc3VtZSBlcnJvcgpwYXRoLgoKU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIENhcnRlciA8eWFzczI3MTA2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggNDczNDQ5ZGJk
ZmEuLmM0NGJjZDBmMGNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysr
IGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03OTksNyArNzk5LDkgQEAgc3RhdGljIGly
cXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJ
dTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBh
cmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5o
Y2xrKSkKKwkJcmV0dXJuIElSUV9IQU5ETEVEOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3Ry
bC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRy
X3N0cyk7CkBAIC0xNjk2LDcgKzE2OTgsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQlj
bGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5h
YmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYg
PSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgyMSw3ICsx
ODI3LDE0IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3dybV9ydW50aW1lX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQlkaXNhYmxlX2lycV9ub3N5bmMoY3RybC0+d2FrZV9pcnEp
OwogCX0KIAotCWNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlyZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJaWYgKHJldCkgeworCQlpZiAoY3RybC0+d2FrZV9p
cnEgPiAwKSB7CisJCQlpZiAoaXJxZF9pcnFfZGlzYWJsZWQoaXJxX2dldF9pcnFfZGF0YShjdHJs
LT53YWtlX2lycSkpKQorCQkJCWVuYWJsZV9pcnEoY3RybC0+d2FrZV9pcnEpOworCQl9CisJCXJl
dHVybiByZXQ7CisJfQogCiAJaWYgKGN0cmwtPmNsb2NrX3N0b3Bfbm90X3N1cHBvcnRlZCkgewog
CQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVyYXRpb24pOwotLSAKMi41NS4wCg==
