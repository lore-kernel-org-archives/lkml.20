Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576268;
	b=Y6bpIrEfkvOH7DOLw4SlL+aobaUKqwlX232TWDKXDYxNOBKf+p2Vfr97vR2Zf4/wNBIr
	 BseDrYzRWDr9dZ0gz0eHsGi5wPPBOtSumJi0qduaBnz760dTqNiENqvk2Uy6h6IWOgbtb
	 cG4c/Ebm8sbS1M6ibfxVYvPVsKA6x0fAMCuVon4LVjmUAE9FO885uZEVNvW7y+Qj/7sTd
	 hB+9uD+fJ7NJMDBMw6xFQhziplKYPlbaAYbV/7czjUmmxqTtDpOxgILYfnl2DC06emEaH
	 P486YnYLazerzKKkvGQY7IheRWCx85xRET4g23ghc0gIYzhumTbfmx0NJjpAIckJYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:Content-Disposition:To:
	 Cc;
	bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
	b=C3ad/aSIgvuFc4s/lY3LMAKnocnqHEpJyMA2EScgIYI+M2fpLlZA1jwzJYEr6vLYq/83
	 RWiSK+fD2ArEYFmdJ5ovW5FKcGx1lp+rRHRjfSrPYXy+LJhGM/Eobc88eYlL2fXBcYM7Y
	 lTJL5uKymQW9ONeEqOAV44hfRhvtrzTZBz9/dhstWDpXlgoJsAkM9XsxbGgYq1rYGCCIB
	 TL6tx3TQqtE1U3X9VXf6M+cB4XaGech0qP3GJ0HSFLqqOp1zPhCPHWJL63nuOV4AiH3d2
	 XpFp2e1sCPUqptKAcdS5Hn+IAZnf6gld65NkABnDr1/kloLSlMtEz9lxd4qNud8GXuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk;
	arc=none smtp.remote-ip=74.125.225.74
Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1B606ABB0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA1B606ABB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXsmNfMk
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48ded18b8d9so146050f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576265; x=1795181065; darn=vger.kernel.org;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=MXsmNfMkwmrtzH5QjA2Wxfle+/oOPLkWAIi6ePOk/jbUkUf8919leGBOnEaDEKyqUF
         63XyT4w2k54VUgxbkgF87CmSk4kBwa7mGWNgsu37iC7SdvqLPNVm148QmlA/lVLyZLBk
         5ecd6w/ciPaYgxpW3VU6mRTOSwEyripecZW++PkhfXPQouAY6vUlLpy3dZII/WgBSyzV
         MLuqoZNff+l8SDfNOvkSsOZrU49UGiTb3RhlWr2Sk/7LBh00bwFjWInjB3OjyetRvrY3
         u3yhSqV1yi/w+7jrqSo9Ia7xHTRR94OM3faplZg9BwBuaCaY8sbI3VFyaudztnDV1b/j
         EW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576265; x=1795181065;
        h=cc:to:content-disposition:content-type:mime-version:message-id:date
         :subject:from:content-transfer-encoding:mime-version:content-type
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4bnNobTZYbRq5oUNwxT7VLNd05i6sn/OWm1B32EXBKE=;
        b=M1+8fTp2PI4Ll2azwBHyL12weKG65Fg9M1JS3KJn3xESjhXr5D70gmsxsKSQtSIaVu
         W4UfiXqZR+ge8PH02Jmj2ruxtj9yXByMoVDwjyKzKftarHh/sJKzron6rYo7lsa8SmFU
         H73ZMzUvIhXr8/jvl1fnc+j+Lb9dFnpf7VE1pp9rUav0IrFHq6UY2NBOfeEMdGwPyKef
         HR1U06QivrcgQHc6uKy4gOANO9NMoUpclvgpa6tpiM7p6+VCTwQ9ordQeTjdoWO23anJ
         T30ILiU3il6toREcW8jc+nuohRi99z5VZ2KFFjARXZyqTIB+xGs9mEiFw9iS4gDAiUUD
         YExA==
X-Forwarded-Encrypted: i=1; AL+hErHHcEKjtKIvj3BqO4uhhv1RWp6L3CTEu4ACgACcjZ+f1XltcsIosDRwQuBbRgseIw8gsT24PZWPrEbR0Zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IgI7KO9fg/FMfao/zE0/FGxfbbRvtFEHQRSm4HwZ95wyKPDnt
	mFh7dX/le0WIQmy9LCgkP5VdI4SpqKr+3v+W+A7SXqsTF0Wn84B+XMDb
X-Gm-Gg: AYBFou2YPn3mozFJnJ0+VhEN3aYCjQ3W777+02KOJiI70lNGOqMZWtZNhmNMOCfxCf0
	vQZWtUjfwbpiTD8N/RqbmZzUXFQU2jMpp3xK1VLhfOkRYHJyIYURG9u8XfieHpAGMTxbgAkzb5O
	p20+kJNP54tQojwMeXkSLLuz/2+5JqRM0npIW2vmjR2+uIxraZy3zhv4wJ2qQsKm6SguzmXc/vF
	wgaABeOthvxyu1/3k3CiPqm2HYmTVPUyJFiuXIx0s2wY68dptM0+PAyMJY0JwFKlz/rCmLSg6jm
	kMwdZP4OmW3eNmGMGg0fUoxUfmwbJOyJd6CvekEC1aOXD4Qdn+gL+F16lJQUWEYl//1B0G4wtEx
	BB4MoBMPHDNJfa+OHOGnSsQTzUDMBsz/sC+HXNnoMqJOFBbBeHfZ/a0L7fjskBkARY3QCNhpETV
	EQG5dLM3I2prdvzVxAAm6sK4q/OB/BAv+bEdk+ZEN3NaDSRn8y7vhmjU9+SUPcXYAaIj8VhdMTI
	o46mBjJiwbuH2V2xaHdTeYWYBaXBZMgKu/J+fN6VxlaOAqjqj+4WOeLvk169g1uVIBohAnlypl9
	BSfIyN6u3FMm/nbGYxBXN/lZopKd1g==
X-Received: by 2002:a05:6000:161d:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-49c74d2daa2mr4041400f8f.55.1794576265256;
        Fri, 13 Nov 2026 05:24:25 -0800 (PST)
Received: from [127.0.1.1] ([196.237.238.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm5377498f8f.52.2026.11.13.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:24:24 -0800 (PST)
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
From: yass27106 <yass27106@gmail.com>
Subject: [PATCH 0/2] qcom: add Asus Vivobook 16 X1607QA DT + LPASS audio clock
 retry
Date: Fri, 13 Nov 2026 13:24:21 -0000
Message-ID: <01b2c920412848ab85493acc2d4f5fc1@gmail.com>
X-Mailer: git-send-email 2.45
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
To: andersson@kernel.org, broonie@kernel.org, srini@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com

SGksCgpUd28gcGF0Y2hlcyBhZ2FpbnN0IHY3LjQtcmMxIChhbHNvIHNlbnQgYXMgcHVsbCByZXF1
ZXN0IDE0MzkgdG8KcXVhbGNvbW0tbGludXgva2VybmVsLCBhbmQgdG8gdGhlIFVidW50dSBrZXJu
ZWwgdGVhbSk6CgpbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUg
Zm9yIEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQogIEluaXRpYWwgRFQgZm9yIHRoaXMgU25hcGRy
YWdvbiBYIFgxUC00Mi0xMDAgKHB1cndhKSBsYXB0b3AsIGluY2x1ZGluZwogIHNvdW5kIG5vZGVz
IChXU0E4ODQ1IHNwZWFrZXJzLCBXQ0Q5Mzh4IGNvZGVjIHZpYSBTb3VuZFdpcmUpLgoKW1BBVENI
IDIvMl0gQVNvQzogcWNvbTogbHBhc3MgbWFjcm8gLyBzb3VuZHdpcmU6IHJldHJ5IGRlZmVycmVk
IGNsb2NrIGFjcXVpc2l0aW9uCiAgVGhlIExQQVNTIFdTQS9SWC9UWC9WQSBtYWNybyBhbmQgUXVh
bGNvbW0gU291bmRXaXJlIGRyaXZlcnMgcmVxdWVzdAogIGNsb2NrcyB3aG9zZSBwcm92aWRlcnMg
KHZhLW1hY3JvIGZzZ2VuLCBxNnBybSBjbG9jayBjb250cm9sbGVyIHVuZGVyCiAgdGhlIEFEU1Ag
R1BSIHNlcnZpY2UpIGNhbiByZWdpc3RlciBhZnRlciB0aGUgY29uc3VtZXJzIHByb2JlLgogIENs
b2NrLXByb3ZpZGVyIHJlZ2lzdHJhdGlvbiBkb2VzIG5vdCB0cmlnZ2VyIGRlZmVycmVkLXByb2Jl
IHJldHJpZXMsCiAgc28gY29uc3VtZXJzIHN0YXkgZGVmZXJyZWQgaW5kZWZpbml0ZWx5LiBBZGRz
IGEgYm91bmRlZCByZXRyeQogICg2MCB4IDUwMCBtcykgYXJvdW5kIHRoZSBkZXZtX2Nsa19nZXQg
Y2FsbHMgaW4gdGhlc2UgZHJpdmVycy4KCkJvdGggcGFzcyBzY3JpcHRzL2NoZWNrcGF0Y2gucGwg
d2l0aCBubyBlcnJvcnM7IHRoZSBEVEIgYnVpbGRzIGNsZWFubHkuClRoZSBEVCBhZGRpdGlvbiBp
cyBmb3IgdGhlIHY3LjUgbWVyZ2Ugd2luZG93OyBwYXRjaCAyIGlzIGEgZml4IHRoYXQgY291bGQK
Z28gaW50byB2Ny40LXJjIGlmIHRoZSBtYWludGFpbmVycyBzZWUgZml0LgoKU2lnbmVkLW9mZi1i
eTogeWFzczI3MTA2LWh1ZSA8eWFzczI3MTA2QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4K
