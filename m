Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862540;
	b=CvxR97oxUc+Mhslqo0cvNYum3MhAyP4JaCEXBdXKdKlhEWoUSNkEemXX57ZnQeKCAFeq
	 Z+vJ0bZOgTlXkuO1NgDaeQ8UVmrGepNlDVxQv/GVUteG/Sj54Qef9lqLMqtwwqbsNFHJX
	 sl1yjfMaC7tmFBioEiAFrLFvWNq49krESH3BCKvE/oZFAX9bT0gwVoZWxIxVe2Z61KmNE
	 wtAC6L11UHsYff2o56bh6SSRvtgafZn5hn+Aok8K4VeJ6kZUyZB+BdCikIGrg4UAolN9j
	 LncbOZcc5FuxBY3B86uHfXNTiOZPbfJGu2AzZFcFaCL6b4HWmiCX23z4SFY0yeu7nSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
	b=U0jiZLMlrbtMJCtFXuU1KsBKyE+aWy8PRd8TkSXWD248I0TlO4mmX6n+HVMiw+w6fO3M
	 XBPo+EvIRlyEzEYj952ls1j4K84dKpb7rIU2uFQp/GpgLBrN2UAwFQhIBZ2f/7Rnh7pR7
	 WTv8XKCqcvTecdDv6eU8Vw/xXskcDncLv9HahrgAgL0sXfc4mvZPO4i/pLlf3t024p44i
	 kD7YRf5J55FQfAK7tH1ZTAuTYm+PtIQB87iWIaHbMdALmsKpBzMh05N8VrlvsRhwlZjGN
	 vEaYXYFrjXYeZEKTlyuqu0bE4ujXbuKZRC1bZCpi3mj9A/D9eirUrgcU4yKJbeP1Kjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12701606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12701606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2QgY5C3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1986857f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862538; x=1795467338; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=u2QgY5C3if5uWiUzZPM8txeCtbFhDBPrzEMoHeTc5cOUW1a6m+yJEOsHyjTGKYv5Br
         2hSq/IcbD6pZi+sd73S4n67ieExHp6zRxGM9IjP+O44xbz09zLMWbowhMeyyRAWGbIuK
         Q7Y8RY0lJKTIww8tbVcR0rzr+fKDLuN29Fk5SxwLtIviFdn7AyBhOC4fGiNLluF5QZ0m
         G9wxEbaF3SDTPQzdEUBgPeNz+y+ca2sV/soJ0BzaWB6rstoI+PF8XC135FGOfQ3f4Ijc
         J90MHeSJ3ULZMvmhEqS7GuyQzjZtkGPyRlPdp6pUkM98FxRrWTlOGvcW6eoD3yUkCBkS
         hv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862538; x=1795467338;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K1X6aptp9cb54EH6/S3+8Xic6Zq/P6tKc736rXZO270=;
        b=WeIovQGLFcWLrWlTieB3ecBHvjRtnfzKpLTIzSJTepCO1V+bktkVtWoOBpgfN1t3Kd
         yR2K4YlfRODBZKGvZnS6ow6FIQmBEeF+nSILWkbHhH+BmXPDH7yxEsUqJx1+xwo+3V2r
         /Jno1a7oyVkJX9S0Q/6jJ/6DsQ17dTs0Mo8c024lwCNeUO8+AzpaxnJ9EaJI1CkaiJSB
         P6DBPUBwpNIqV+3LxMBehUS5U/89R/aRb8tR7Ghodk/HnS+9WkI6XiJEVlkmF7y7jf1o
         1M6vSzZcLc59NyYDMthyLdPbnA2RpVxGR4URuWJ6oo8z7mT5q1Iqg+hUJhY0afQBNalK
         4HNA==
X-Forwarded-Encrypted: i=1; AL+hErHuM/O8rSvlS4lPxOQMn9AlvZgn0iGXUaK+TsUJNYJOyItTeuuTNb37BnutnT6cPQsa4A99c9N9C1pItsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/80IW1sJSdpjQmK8yqGGRh6SWNJlvYQvbNlYfBow1r1NPtJwgb
	U8olZvWFpSaqtPD+pyM9VwWhxPSI12svKosdOS0PNNh1tfoaP2MCalbV
X-Gm-Gg: AZFdTZcnRmMnYwxpUOCWm/fXfUdBp5Dkqk4YojRAgZ8oIBZuUbRBIk0+UcO4I89GyED
	qKgF5dhs9LaPo0MFWXYM0kPULd6cbK1ZqtSQEOhoZP97qwxn5kUm0XrHefcMpZMxvxwtJZSrRu4
	VHPnhAjIC2HBhBWMHQ7GDrFwO4Yx2bYhHW/C69T0Wx2TKlW9Iy0aur6AxE7Mlagx6P9nTapcTaj
	mYYberYdo+6JdArnCXsbhAoGHttARtQX3gJ3CjbhapMowF54Jq9VRVOHi56mE6K02f8wKhqhvZ0
	kDp9E3fsMjSGpT5SOp3K50R7OkVqWjdNHibsgWtMK4SikZgQm5KjijhIGJJHX0qF6M8dvpVrZDZ
	q8r3uIjM2Ld69vMgVKCqRMyN7UYeXEYBl9HUni2L+Vb3IYMVXJXc0giO1AcOyfCTbHo/Amcj78D
	zwmUsEGVHlb5q1gOt2m37ea3J2Uxf+BZisteCqzfL5AOlDANPC/KMV+wOGquGpDuZ+8sd7Z7acH
	44N/oNiUYSidFPWqE223GSoezCeMZKzUcJIDCZ1CKz8ZkLPeAjX2BzQ
X-Received: by 2002:a05:6000:26c8:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49c73631471mr27391944f8f.23.1794862538469;
        Mon, 16 Nov 2026 12:55:38 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:36 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:36 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <954a5e65e7424694ba29836fba08c802@gmail.com>
In-Reply-To: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgpBY2tlZC1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29t
PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJm
MWIwYjRlZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9xY29tLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9x
Y29tLnlhbWwKQEAgLTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRl
bXM6CiAgICAgICAgICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYt
eDE2MDdxYQogICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAg
ICAgICAgLSBocCxvbW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5r
Ym9vay0xNgotLSAKMi41NS4wCg==
