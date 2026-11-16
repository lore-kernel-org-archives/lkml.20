Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862531;
	b=s2yIjJyi9XoyYy4f+PH8ko2AYTzZuIQPPqY/FNEebQ+ODrgWzsZXojCoFqoxEhiEUnRZ
	 +7YO0dFyBc+41JcG+t2BJsuuyxqK9GF+u2BAKVviLCGwVaq0Qsk/uqkXSGBqz9pey2lvH
	 +I+a495qyyBdOp6rvueaHjQjjhxziZErAYQ1ix2732zOG8lSoZ8MiZ04WEON+NP4HOmbq
	 CWGfgJVxmOqqbPq6+S4lIT467Q3FhlpSaHva0lLV5s0P4dICXNu1LdEZU4GXK4JvVJkEj
	 MeADZDMWWxaZLP08M17aiQRhT5rfLYNoUh5CGdoVzYunXOj3V9mOMH0f1vrY7jDWGGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
	b=ZkpKk1Zi4NcznhpFbf7hxnMoZY3TVf3oT4YVWwK8/3ZpU1+TF8O9Yg52fC5Wkp4Js5wT
	 TwIlU1+HayTB6jgtKwYJ927/lypTJYYsowSEv0REqoB0+6k1hcW3BfXeqy3cNPZJ9O47z
	 bGke1rY+DTA61l5LodSGCWZSz0Io4axIUbecYX1San50517T/hDawQWcW90mClbkNEqfp
	 Ah6IJwanSb/2x8W2TMC+59gkboYR2nkj9LFMvX5AnjA4mCnOZxMUSiYpkPJR/n58Qiu9e
	 1r1SyFmh8hRUjoOjNERa+47V0yZua0NouCev9WTzpVXvMA90i6H375/brue42tBLxFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AFE606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AFE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lyXw+tAu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso27486125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862530; x=1795467330; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=lyXw+tAuRY+vzAmb5MLt7oV6TqjlqADVYJGL7Dcck4tDxKf0rDDD0HWaQ5FO2qsHLU
         ruxqmh4TQqmB+ehVIyshPNidpYHwCmYvdsEdr3bs0UuAVpGX1PHqZUG18BR5bp475wIi
         sKYkHCDCRKb8gBPOGVPa6xFHB83xVOGf1dpupqGVdKsauTnBd6kMUhGOoZiXQHzf01RT
         Qc2+sXyf4eMTGjeDR9J7DjqAiTkUkvYYti0mQRl2av7RtIdgMhXBRgTxMhUGsRZuzlpB
         uaRRtiPONL0x36Rcy21ELLbqQ4CA2xHOI094hGRgEosaAWZChyZjYB65JtOafYWEDR33
         w8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862530; x=1795467330;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:content-transfer-encoding:mime-version:content-type:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gcktu13qCXk+R21AiHSgVbKgfQjzEjPlOwrVGFGC2sw=;
        b=Ai1Pl9K8A/oFgHNDvHqE1wGwt6unUeOGxYjtagSHuJITKTfsoiqAogrPSbp2yuB50T
         C5GrC/oZB6eOnIihUVggcgZjRUdSS4v34hx+RV/o5ot55+BB7CkGq0E1PLa4kOvJF/RM
         GkT5WgJlakRi3XsxlM7+vciW4cltch1z7uBDDoBwVmiU67T9j+iO/DOhjxxPAh6EyPgX
         jCe4BkbdBQwXOu9zpq5psHakhugCPGegu1bOBfSsFZXN8fqZpHkMxva8mQ+6XAXlBOIi
         KpbOuDCgiif39j5ox4vuIQqEjxtHn+g/nn3gsL/N259jPOypp629HzVYNDX/2mXDU1vN
         8j3A==
X-Forwarded-Encrypted: i=1; AL+hErHEP+46JCl1hBYe++vc7M4UvTwGFBvjt4y5l77Cpa6ATqtGIPf584hfBLhnWn/SOeij8OxLoOE8VNDiUHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uquh+j0vI5/0tm/fKlP3wLXLQs2PghAHVjkUi2/5HAcgXZN1n
	7yjUq/14sn69J3KB8de05gNEN0LPCvR+5Z/qJvlJHFk3+CFQTUWTYVea
X-Gm-Gg: AYBFou1v6U2WOhYA5Epw2k5NrX89Ql/EBEiBOd7KPoxq+KZdfGEjVEQ4agsPkcALMSO
	T8BKARwvKS+rRVMLatlt/yLw8D6B/sQTuBFZ+W6UQVrO6cG6wBwntoaziYb+q8TV/jtrMxXA0+9
	9qAvmXLWH6/VxEzOliG7C0pu1HiMkL048C/62WuxZTToQr8+4H+OWxHiUApQwL6JjDzvRAnmtsO
	g9VLQFMgUgPBIrJKa5scsxvGIizFP6XRZ7Q70jiiC3fStikGDOrdQDl2fRS0r4HLwOtcYrOTJ8T
	WH1MtHKGcE8fg+EPDRzPtAoH20XcZw+JP25Z/PUdt+7LkpWd1Wl6laT/YdFQZLEgfODE72cNbxq
	tKN+RjrXv8yWOCdcZbHvJyO7rPoAcqGDlUBZnHcRJmaG8zpduhFSfo4+XZRM3KTjkXbNec+o8fv
	vyo/Av4/ZjtH/14AqNj0TrLUG7OF8/UpwYcLCR3lKpJuosYAps5Df5DoK6mMDbqk2NXFnJbbD9Q
	r1x+1G79BoxZir3BcvydYTvAPHYY65MBkWN7rOk8Ont6Y0GS1cv13lM
X-Received: by 2002:a05:600c:483:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4bb55a4f4c7mr187492355e9.15.1794862529784;
        Mon, 16 Nov 2026 12:55:29 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:27 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:27 -0800 (PST)
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
Subject: [PATCH v5 0/3] arm64: dts: qcom: add device tree for Asus Vivobook 16
 X1607QA
Message-ID: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBTcmluaSwgaGkgYWxsLAoKdjUgb2YgdGhlIHNlcmllcywgY29sbGVj
dGluZyB0aGUgdGFncyByZWNlaXZlZCBvbiB2NCBhbmQgYWRkaW5nIHRoZQpDYzogc3RhYmxlIHRo
YXQgU3JpbmkgcmVxdWVzdGVkOgoKQ2hhbmdlcyBzaW5jZSB2NDoKCi0gZHQtYmluZGluZ3MgcGF0
Y2ggMS8zOiBjb2xsZWN0ZWQgS3J6eXN6dG9mJ3MgQWNrZWQtYnkuCi0gc291bmR3aXJlIHBhdGNo
IDMvMzogYWRkZWQgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgKGFzIHJlcXVlc3RlZAogIGZv
ciBzdGFibGUgYmFja3BvcnRpbmcgZ2l2ZW4gdGhlIEZpeGVzOiB0YWdzKSBhbmQgY29sbGVjdGVk
IFNyaW5pJ3MKICBSZXZpZXdlZC1ieS4gTm8gY29kZSBjaGFuZ2VzIGluIHRoaXMgcGF0Y2guCi0g
cGF0Y2ggMi8zIGlzIHVuY2hhbmdlZC4KLSBUaGUgc2VyaWVzIGlzIHJlYmFzZWQgb250byB2Ny40
LXJjMi4gUGF0Y2ggMy8zIGlzIGZ1bmN0aW9uYWxseQogIGlkZW50aWNhbCB0byB2NCAodmVyaWZp
ZWQgaHVuay1mb3ItaHVuayk7IG9ubHkgaXRzIGRpZmYgY29udGV4dAogIHNoaWZ0ZWQsIGZyb20g
dGhlIHRyZWV3aWRlIGRldm1fa21hbGxvY19vYmogY29udmVyc2lvbiB0aGF0IGxhbmRlZAogIGlu
IHY3LjQtcmMyIGZvciBkcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMuCgpTZXJpZXM6ClsxLzNdIGR0
LWJpbmRpbmdzOiBhcm06IHFjb206IGRvY3VtZW50IEFzdXMgVml2b2Jvb2sgMTYgWDE2MDdRQQpb
Mi8zXSBhcm02NDogZHRzOiBxY29tOiBhZGQgZGV2aWNlIHRyZWUgZm9yIEFzdXMgVml2b2Jvb2sg
MTYgWDE2MDdRQQpbMy8zXSBzb3VuZHdpcmU6IHFjb206IGNoZWNrIGNsa19wcmVwYXJlX2VuYWJs
ZSgpIHJldHVybiB2YWx1ZXMKCkJlc3QgcmVnYXJkcywKRGFuaWVsIENhcnRlcgo=
