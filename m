Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864314;
	b=R06Gfe4kXi69VrpdZyGUt1Ug3lGCg62HOH1a/9ofDqyFV5oFbJRX68VsLsC8oFpGrhZ0
	 2QZvzK6LodnLyUIQbfNKRn2qeeGuyLQLqGxNK2oun1aonuXtlqDAMZeqnKwGnwo12YxPB
	 hImYVJR4RplKbZ0XhrFYJvyUfG6bHt8TTehfvKXsTKZOCJAzxR/XYbCYB7lC932sMJZfd
	 rOH2ySHZzaZiKzbmCeB0oggP0/a8WBORr1QUvQqIQVLO4fFEjmIiD5MQEru1r9HVIJ5Ga
	 Ip2ZG2m2CZ40iy7z5vfz2+5/KvTwzlAPD+GLWGIWeDDTWfNyZr2WhOPta+U8GeHPzbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
	b=QfVrDqcEdtekcqXRSqpkUhAClCxqBsSGzNTx525T3b0ykWdALnqs8Wq7KPJOfiymyroK
	 GdyJ7iGrqvGM4ccnqNyRJU38HSrHPxqy7kUR/qqghieN1iVgmYALJ3x24xPGZgvy88bXC
	 renck3eSR5TI9flRBn1/0txF7z8E1vyOTmnw1G322yu1lwvDWWGNEgUJ3VkWFfRxGOhUo
	 AWk3rbvu+kUI0FlaI8JypD1Rn4nYCea0eRLEw+gcZTLIEm2iR8M0wyI9BBiW+3JFIU8XK
	 HZhIeL33p/rNBvC5ndXsaw0GZKfwVuW9Jxqm1hOjX4N4yBmT5ELA8Qxgede4SfKMO1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crKqWpBy;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFE606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crKqWpBy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso16113025e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864312; x=1795469112; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
        b=crKqWpBy9v9PmTiWD5cN4fT6cTPSUgRhGGLMmQFSUba8ExVSKF2vjESeXDDhOae5pA
         rka/KPNPbUmqrz86doZE658P+yDvCys0FbcqJ018GzsU7GCACJ4O06ZWwGgHaPMxA2OD
         ytTESXi9Hcn4bA8D1y02uinkXD4u+sRReZTUIqiKVJGQdu4hQRfNtfPYK2mQsCxvXiti
         PEIdXijhuXSwohct+dh7Qh3Rfoh2sRFjHXqa5TT5MyEMDzSO26jZYkC8X8a1GDfbt1Ij
         8szutdp+XbCjFldFdxWhT/sxaFGGpgMMmbg89VoZusnty0wapoSXJc9jEKLdSZekifB5
         4ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864312; x=1795469112;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
        b=jHj9yp7ETzVdFpUUzDJFdsTNhvO4p3rGDpYsZJExI9CEN7JmKZ4aCXTgK50mw/lhXd
         IvoeGJTLTQVNsaaxusF6GYKP8PEAhIAgwvk60TTIDfn1bcqsPCayMgWdRoKqBTHWkoZc
         zG34HmB3sunv/DlmtFzWG/pk0dpBDKs0hVFXyOhrLjKcoH27f8/Ay7VGqDMJTTevFllK
         9DYQ7hdGX8yO++0/L5PCmnHX4R2QhcJ5SAeFNlC8oD/akumgM3TakAAjLsO4OEU0M2IE
         fqDfwmv2KTc6iVkbIVU4WhZRTjvlSR3egT+QxJTr77weStT2qIXyYcXBOW77Y+ZP5hNC
         T6RQ==
X-Forwarded-Encrypted: i=1; AL+hErFxr+kwdNHS+lnV8tWzgHLFZy/u7QKguaVMSEKAup1nPqeGzO3YLbVGu7ZLTUoiWNisalYblZ9wfI8ENew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v/0uduhdcNTV/enBLJJo+Vzrnef9fkRsVNb6vKKmrO6SEbs1J
	GbiZqFRCEnF7LIOcPko89nU5N5sO4VgtveiPfxKkHZ8NvZFVt0pVU5Pa
X-Gm-Gg: AYBFou2D09jaHgh0bO3ftRG6miza+DHsP3ae1MKe1oAd9FIhNO/ZUMhW4kWKzfONhOH
	2K+bhqhTicFGXsXOppFF3VpON7Eb0quNwnGzlNYaE2u0TuapaHTpSBWmPyHvH85VVyPLssQkfc3
	3FP7waRnwpbmNP2MamkTh2pGvli7U+j9xrtw74r7y4+gRuvyC1zBCPesbkp05pih+pW832orBNF
	kgeE1KRJNqoqn20L85TUrbdqhRHwLbRe8fWadOmR7y6NEUdPUQLjIUnvy46L2rEDcGYrXiwp55o
	12IR0jGBR+yKjP8NGCAIq4YhWJVUDXGqneYv+3a9CHWIF/v91/LDZIF6VTaPcLaylJzanDEmB7Y
	z277zsyUkD77yQqjEbu8b1AprOAleiK1kcAR2CyYOwjJWZ1o9KFK2fwjwEiYvNee82xK9lL45eg
	JfGrUvq0UOjAlp/EWM/MT9VpFRuMkfr9iSvO27iBXOpmLS3nvEtu/Sq8ULR/Gu6NMBGsrH4seFx
	D6fZMLWOJPDej7tUEcjF9NO/lHxbkh/6LyNq8vY+KWWh4ICnmAcNBLjZG0kJG2W0XfJCtwaxhc+
	0NjLNDkJnHDPbTVev7f5NBhqEvjhs1NJbigTLBjFJCPHeU3ZjFRjZkk6hBbopw==
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr183128505e9.27.1794864312370;
        Mon, 16 Nov 2026 13:25:12 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:11 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/2] Add cpufreq support for Qualcomm Halliday
 (SXR2250P)
Date: Mon, 16 Nov 2026 21:25:05 +0000
Message-Id: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALF0+2oC/2WNyw6CMBBFf4XM2hqmKFBX/odhUdoBxvCyBSIh/
 LuAceXyJOeeu4Anx+ThFizgaGLPXbuBPAVgKt2WJNhuDDKUMWKYikrXNVs9C9OPhaOXQFImuqZ
 IMr/ANusdFfw+ko/sy37Mn2SGvbMbFfuhc/PxOeHu/fLqPz+hQGHTREcqiVRc2HvZaK7PpmsgW
 9f1A8w7k3LCAAAA
X-Change-ID: 20261108-halliday-cpufreq-1e9c3581e2b4
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=1354;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Vl3mWqPNXbM7HXPxqhlw3hT3lk2vRli8dmhGXwQ8GHA=;
 b=mUNNSB18W8LJ/FF5bhpDD3vmw81siwfrYgshJoZ1CBZT9EROHlU2rHOC6cPim2pc7eyXwRq4A
 GwdTh0lHIa0CJwIHlBExQXh3MMeIBeUNkfF9eAeGGTMsHnlz/DDr5mZ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) of the Qualcomm Halliday SoC and
keep cpufreq-dt from probing on it.

This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
in the Samsung Galaxy XR. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR, where cpufreq runs through
qcom-cpufreq-hw.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- Add the qcom-hw binding from the DT series (12/17 there), so that
  the cpufreq patches are in one series:
  https://patch.msgid.link/20261109-halliday-dts-v1-12-289114ab8197@gmail.com
- Use the "cpufreq: dt-platdev:" subject prefix (Zhongqiu)
- Link to v1: https://patch.msgid.link/20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ hardware
      cpufreq: dt-platdev: Add Halliday to blocklist

 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 drivers/cpufreq/cpufreq-dt-platdev.c                           | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-cpufreq-1e9c3581e2b4

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

